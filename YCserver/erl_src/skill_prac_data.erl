-file("src/data/skill_prac_data.erl", 1).

-module(skill_prac_data).

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

-file("src/data/skill_prac_data.erl", 14).

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

-file("src/data/skill_prac_data.erl", 15).

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

-file("src/data/skill_prac_data.erl", 16).

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

-file("src/data/skill_prac_data.erl", 17).

-export([get/1,
         get_all_skls_prac/0,
         get_min_skl_id/0,
         get_skl_prac/1,
         box_list/0,
         box_exp/0,
         get_max_lev/1,
         get_max_times/1]).

get(62000) ->
    #skl_prac_meta_data{id = 62000, name = lang:get("攻法修炼"),
                        obj = 1, day_max_times = 500};
get(62100) ->
    #skl_prac_meta_data{id = 62100, name = lang:get("防御修炼"),
                        obj = 1, day_max_times = 500};
get(62200) ->
    #skl_prac_meta_data{id = 62200, name = lang:get("魔抗修炼"),
                        obj = 1, day_max_times = 500};
get(62300) ->
    #skl_prac_meta_data{id = 62300, name = lang:get("攻法指挥"),
                        obj = 4, day_max_times = 500};
get(62400) ->
    #skl_prac_meta_data{id = 62400, name = lang:get("防御指挥"),
                        obj = 4, day_max_times = 500};
get(62500) ->
    #skl_prac_meta_data{id = 62500, name = lang:get("魔抗指挥"),
                        obj = 4, day_max_times = 500};
get(_) -> none.

get_all_skls_prac() ->
    [#skl_prac_meta_data{id = 62000, obj = 1},
     #skl_prac_meta_data{id = 62100, obj = 1},
     #skl_prac_meta_data{id = 62200, obj = 1},
     #skl_prac_meta_data{id = 62300, obj = 4},
     #skl_prac_meta_data{id = 62400, obj = 4},
     #skl_prac_meta_data{id = 62500, obj = 4}].

get_min_skl_id() -> 62000.

get_skl_prac({62000, 0}) ->
    #skill_prac_data{id = 62000, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 588,
                     lev_break_times = 0};
get_skl_prac({62000, 1}) ->
    #skill_prac_data{id = 62000, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 838,
                     attrs = [{23, 30}, {25, 30}, {4, 15}, {5, 15}],
                     lev_break_times = 0};
get_skl_prac({62000, 2}) ->
    #skill_prac_data{id = 62000, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 1210,
                     attrs = [{23, 60}, {25, 60}, {4, 30}, {5, 30}],
                     lev_break_times = 0};
get_skl_prac({62000, 3}) ->
    #skill_prac_data{id = 62000, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 1739,
                     attrs = [{23, 90}, {25, 90}, {4, 45}, {5, 45}],
                     lev_break_times = 0};
get_skl_prac({62000, 4}) ->
    #skill_prac_data{id = 62000, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 2614,
                     attrs = [{23, 120}, {25, 120}, {4, 60}, {5, 60}],
                     lev_break_times = 0};
get_skl_prac({62000, 5}) ->
    #skill_prac_data{id = 62000, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 3511,
                     attrs = [{23, 150}, {25, 150}, {4, 75}, {5, 75}],
                     lev_break_times = 0};
get_skl_prac({62000, 6}) ->
    #skill_prac_data{id = 62000, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 4996,
                     attrs = [{23, 180}, {25, 180}, {4, 90}, {5, 90}],
                     lev_break_times = 0};
get_skl_prac({62000, 7}) ->
    #skill_prac_data{id = 62000, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 6276,
                     attrs = [{23, 210}, {25, 210}, {4, 105}, {5, 105}],
                     lev_break_times = 0};
get_skl_prac({62000, 8}) ->
    #skill_prac_data{id = 62000, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 8484,
                     attrs = [{23, 240}, {25, 240}, {4, 120}, {5, 120}],
                     lev_break_times = 0};
get_skl_prac({62000, 9}) ->
    #skill_prac_data{id = 62000, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 11377,
                     attrs = [{23, 270}, {25, 270}, {4, 135}, {5, 135}],
                     lev_break_times = 0};
get_skl_prac({62000, 10}) ->
    #skill_prac_data{id = 62000, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 14928,
                     attrs = [{23, 300}, {25, 300}, {4, 150}, {5, 150}],
                     lev_break_times = 0};
get_skl_prac({62000, 11}) ->
    #skill_prac_data{id = 62000, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 18600,
                     attrs = [{23, 330}, {25, 330}, {4, 165}, {5, 165}],
                     lev_break_times = 0};
get_skl_prac({62000, 12}) ->
    #skill_prac_data{id = 62000, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 23532,
                     attrs = [{23, 360}, {25, 360}, {4, 180}, {5, 180}],
                     lev_break_times = 0};
get_skl_prac({62000, 13}) ->
    #skill_prac_data{id = 62000, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 28854,
                     attrs = [{23, 390}, {25, 390}, {4, 195}, {5, 195}],
                     lev_break_times = 0};
get_skl_prac({62000, 14}) ->
    #skill_prac_data{id = 62000, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 34812,
                     attrs = [{23, 420}, {25, 420}, {4, 210}, {5, 210}],
                     lev_break_times = 0};
get_skl_prac({62000, 15}) ->
    #skill_prac_data{id = 62000, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 41917,
                     attrs = [{23, 450}, {25, 450}, {4, 225}, {5, 225}],
                     lev_break_times = 0};
get_skl_prac({62000, 16}) ->
    #skill_prac_data{id = 62000, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 49772,
                     attrs = [{23, 480}, {25, 480}, {4, 240}, {5, 240}],
                     lev_break_times = 0};
get_skl_prac({62000, 17}) ->
    #skill_prac_data{id = 62000, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 57196,
                     attrs = [{23, 510}, {25, 510}, {4, 255}, {5, 255}],
                     lev_break_times = 0};
get_skl_prac({62000, 18}) ->
    #skill_prac_data{id = 62000, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 66244,
                     attrs = [{23, 540}, {25, 540}, {4, 270}, {5, 270}],
                     lev_break_times = 0};
get_skl_prac({62000, 19}) ->
    #skill_prac_data{id = 62000, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 75288,
                     attrs = [{23, 570}, {25, 570}, {4, 285}, {5, 285}],
                     lev_break_times = 0};
get_skl_prac({62000, 20}) ->
    #skill_prac_data{id = 62000, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 85438,
                     attrs = [{23, 600}, {25, 600}, {4, 300}, {5, 300}],
                     lev_break_times = 0};
get_skl_prac({62000, 21}) ->
    #skill_prac_data{id = 62000, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 96558,
                     attrs = [{23, 630}, {25, 630}, {4, 315}, {5, 315}],
                     lev_break_times = 1};
get_skl_prac({62000, 22}) ->
    #skill_prac_data{id = 62000, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 116002,
                     attrs = [{23, 660}, {25, 660}, {4, 330}, {5, 330}],
                     lev_break_times = 1};
get_skl_prac({62000, 23}) ->
    #skill_prac_data{id = 62000, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 141000,
                     attrs = [{23, 690}, {25, 690}, {4, 345}, {5, 345}],
                     lev_break_times = 1};
get_skl_prac({62000, 24}) ->
    #skill_prac_data{id = 62000, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 188000,
                     attrs = [{23, 720}, {25, 720}, {4, 360}, {5, 360}],
                     lev_break_times = 1};
get_skl_prac({62000, 25}) ->
    #skill_prac_data{id = 62000, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 248000,
                     attrs = [{23, 750}, {25, 750}, {4, 375}, {5, 375}],
                     lev_break_times = 1};
get_skl_prac({62000, 26}) ->
    #skill_prac_data{id = 62000, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 320000,
                     attrs = [{23, 780}, {25, 780}, {4, 390}, {5, 390}],
                     lev_break_times = 1};
get_skl_prac({62000, 27}) ->
    #skill_prac_data{id = 62000, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs = [{23, 810}, {25, 810}, {4, 405}, {5, 405}],
                     lev_break_times = 1};
get_skl_prac({62000, 28}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs = [{23, 840}, {25, 840}, {4, 420}, {5, 420}],
                     lev_break_times = 1};
get_skl_prac({62000, 29}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs = [{23, 870}, {25, 870}, {4, 435}, {5, 435}],
                     lev_break_times = 1};
get_skl_prac({62000, 30}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs = [{23, 900}, {25, 900}, {4, 450}, {5, 450}],
                     lev_break_times = 1};
get_skl_prac({62000, 31}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs = [{23, 930}, {25, 930}, {4, 465}, {5, 465}],
                     lev_break_times = 1};
get_skl_prac({62000, 32}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs = [{23, 960}, {25, 960}, {4, 480}, {5, 480}],
                     lev_break_times = 1};
get_skl_prac({62000, 33}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs = [{23, 990}, {25, 990}, {4, 495}, {5, 495}],
                     lev_break_times = 1};
get_skl_prac({62000, 34}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 34, exp = 0,
                     attrs = [{23, 1020}, {25, 1020}, {4, 510}, {5, 510}],
                     lev_break_times = 1};
get_skl_prac({62000, 35}) ->
    #skill_prac_data{id = 62000, role_lev = 999,
                     top_lev = 27, skill_lev = 35, exp = 0,
                     attrs = [{23, 1050}, {25, 1050}, {4, 525}, {5, 525}],
                     lev_break_times = 1};
get_skl_prac({62100, 0}) ->
    #skill_prac_data{id = 62100, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 293,
                     lev_break_times = 0};
get_skl_prac({62100, 1}) ->
    #skill_prac_data{id = 62100, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 419,
                     attrs = [{30, 30}, {6, 15}], lev_break_times = 0};
get_skl_prac({62100, 2}) ->
    #skill_prac_data{id = 62100, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 604,
                     attrs = [{30, 60}, {6, 30}], lev_break_times = 0};
get_skl_prac({62100, 3}) ->
    #skill_prac_data{id = 62100, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 869,
                     attrs = [{30, 90}, {6, 45}], lev_break_times = 0};
get_skl_prac({62100, 4}) ->
    #skill_prac_data{id = 62100, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 1306,
                     attrs = [{30, 120}, {6, 60}], lev_break_times = 0};
get_skl_prac({62100, 5}) ->
    #skill_prac_data{id = 62100, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 1755,
                     attrs = [{30, 150}, {6, 75}], lev_break_times = 0};
get_skl_prac({62100, 6}) ->
    #skill_prac_data{id = 62100, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 2497,
                     attrs = [{30, 180}, {6, 90}], lev_break_times = 0};
get_skl_prac({62100, 7}) ->
    #skill_prac_data{id = 62100, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 3138,
                     attrs = [{30, 210}, {6, 105}], lev_break_times = 0};
get_skl_prac({62100, 8}) ->
    #skill_prac_data{id = 62100, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 4241,
                     attrs = [{30, 240}, {6, 120}], lev_break_times = 0};
get_skl_prac({62100, 9}) ->
    #skill_prac_data{id = 62100, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 5688,
                     attrs = [{30, 270}, {6, 135}], lev_break_times = 0};
get_skl_prac({62100, 10}) ->
    #skill_prac_data{id = 62100, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 7463,
                     attrs = [{30, 300}, {6, 150}], lev_break_times = 0};
get_skl_prac({62100, 11}) ->
    #skill_prac_data{id = 62100, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 9300,
                     attrs = [{30, 330}, {6, 165}], lev_break_times = 0};
get_skl_prac({62100, 12}) ->
    #skill_prac_data{id = 62100, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 11765,
                     attrs = [{30, 360}, {6, 180}], lev_break_times = 0};
get_skl_prac({62100, 13}) ->
    #skill_prac_data{id = 62100, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 14426,
                     attrs = [{30, 390}, {6, 195}], lev_break_times = 0};
get_skl_prac({62100, 14}) ->
    #skill_prac_data{id = 62100, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 17404,
                     attrs = [{30, 420}, {6, 210}], lev_break_times = 0};
get_skl_prac({62100, 15}) ->
    #skill_prac_data{id = 62100, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 20958,
                     attrs = [{30, 450}, {6, 225}], lev_break_times = 0};
get_skl_prac({62100, 16}) ->
    #skill_prac_data{id = 62100, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 24886,
                     attrs = [{30, 480}, {6, 240}], lev_break_times = 0};
get_skl_prac({62100, 17}) ->
    #skill_prac_data{id = 62100, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 28597,
                     attrs = [{30, 510}, {6, 255}], lev_break_times = 0};
get_skl_prac({62100, 18}) ->
    #skill_prac_data{id = 62100, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 33122,
                     attrs = [{30, 540}, {6, 270}], lev_break_times = 0};
get_skl_prac({62100, 19}) ->
    #skill_prac_data{id = 62100, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 37644,
                     attrs = [{30, 570}, {6, 285}], lev_break_times = 0};
get_skl_prac({62100, 20}) ->
    #skill_prac_data{id = 62100, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 42719,
                     attrs = [{30, 600}, {6, 300}], lev_break_times = 0};
get_skl_prac({62100, 21}) ->
    #skill_prac_data{id = 62100, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 48279,
                     attrs = [{30, 630}, {6, 315}], lev_break_times = 1};
get_skl_prac({62100, 22}) ->
    #skill_prac_data{id = 62100, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 58001,
                     attrs = [{30, 660}, {6, 330}], lev_break_times = 1};
get_skl_prac({62100, 23}) ->
    #skill_prac_data{id = 62100, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 70500,
                     attrs = [{30, 690}, {6, 345}], lev_break_times = 1};
get_skl_prac({62100, 24}) ->
    #skill_prac_data{id = 62100, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 94000,
                     attrs = [{30, 720}, {6, 360}], lev_break_times = 1};
get_skl_prac({62100, 25}) ->
    #skill_prac_data{id = 62100, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 124000,
                     attrs = [{30, 750}, {6, 375}], lev_break_times = 1};
get_skl_prac({62100, 26}) ->
    #skill_prac_data{id = 62100, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 160000,
                     attrs = [{30, 780}, {6, 390}], lev_break_times = 1};
get_skl_prac({62100, 27}) ->
    #skill_prac_data{id = 62100, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs = [{30, 810}, {6, 405}], lev_break_times = 1};
get_skl_prac({62100, 28}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs = [{30, 840}, {6, 420}], lev_break_times = 1};
get_skl_prac({62100, 29}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs = [{30, 870}, {6, 435}], lev_break_times = 1};
get_skl_prac({62100, 30}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs = [{30, 900}, {6, 450}], lev_break_times = 1};
get_skl_prac({62100, 31}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs = [{30, 930}, {6, 465}], lev_break_times = 1};
get_skl_prac({62100, 32}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs = [{30, 960}, {6, 480}], lev_break_times = 1};
get_skl_prac({62100, 33}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs = [{30, 990}, {6, 495}], lev_break_times = 1};
get_skl_prac({62100, 34}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 34, exp = 0,
                     attrs = [{30, 1020}, {6, 510}], lev_break_times = 1};
get_skl_prac({62100, 35}) ->
    #skill_prac_data{id = 62100, role_lev = 999,
                     top_lev = 27, skill_lev = 35, exp = 0,
                     attrs = [{30, 1050}, {6, 525}], lev_break_times = 1};
get_skl_prac({62200, 0}) ->
    #skill_prac_data{id = 62200, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 293,
                     lev_break_times = 0};
get_skl_prac({62200, 1}) ->
    #skill_prac_data{id = 62200, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 419,
                     attrs = [{31, 30}, {7, 15}, {26, 30}],
                     lev_break_times = 0};
get_skl_prac({62200, 2}) ->
    #skill_prac_data{id = 62200, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 604,
                     attrs = [{31, 60}, {7, 30}, {26, 60}],
                     lev_break_times = 0};
get_skl_prac({62200, 3}) ->
    #skill_prac_data{id = 62200, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 869,
                     attrs = [{31, 90}, {7, 45}, {26, 90}],
                     lev_break_times = 0};
get_skl_prac({62200, 4}) ->
    #skill_prac_data{id = 62200, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 1306,
                     attrs = [{31, 120}, {7, 60}, {26, 120}],
                     lev_break_times = 0};
get_skl_prac({62200, 5}) ->
    #skill_prac_data{id = 62200, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 1755,
                     attrs = [{31, 150}, {7, 75}, {26, 150}],
                     lev_break_times = 0};
get_skl_prac({62200, 6}) ->
    #skill_prac_data{id = 62200, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 2497,
                     attrs = [{31, 180}, {7, 90}, {26, 180}],
                     lev_break_times = 0};
get_skl_prac({62200, 7}) ->
    #skill_prac_data{id = 62200, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 3138,
                     attrs = [{31, 210}, {7, 105}, {26, 210}],
                     lev_break_times = 0};
get_skl_prac({62200, 8}) ->
    #skill_prac_data{id = 62200, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 4241,
                     attrs = [{31, 240}, {7, 120}, {26, 240}],
                     lev_break_times = 0};
get_skl_prac({62200, 9}) ->
    #skill_prac_data{id = 62200, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 5688,
                     attrs = [{31, 270}, {7, 135}, {26, 270}],
                     lev_break_times = 0};
get_skl_prac({62200, 10}) ->
    #skill_prac_data{id = 62200, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 7463,
                     attrs = [{31, 300}, {7, 150}, {26, 300}],
                     lev_break_times = 0};
get_skl_prac({62200, 11}) ->
    #skill_prac_data{id = 62200, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 9300,
                     attrs = [{31, 330}, {7, 165}, {26, 330}],
                     lev_break_times = 0};
get_skl_prac({62200, 12}) ->
    #skill_prac_data{id = 62200, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 11765,
                     attrs = [{31, 360}, {7, 180}, {26, 360}],
                     lev_break_times = 0};
get_skl_prac({62200, 13}) ->
    #skill_prac_data{id = 62200, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 14426,
                     attrs = [{31, 390}, {7, 195}, {26, 390}],
                     lev_break_times = 0};
get_skl_prac({62200, 14}) ->
    #skill_prac_data{id = 62200, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 17404,
                     attrs = [{31, 420}, {7, 210}, {26, 420}],
                     lev_break_times = 0};
get_skl_prac({62200, 15}) ->
    #skill_prac_data{id = 62200, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 20958,
                     attrs = [{31, 450}, {7, 225}, {26, 450}],
                     lev_break_times = 0};
get_skl_prac({62200, 16}) ->
    #skill_prac_data{id = 62200, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 24886,
                     attrs = [{31, 480}, {7, 240}, {26, 480}],
                     lev_break_times = 0};
get_skl_prac({62200, 17}) ->
    #skill_prac_data{id = 62200, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 28597,
                     attrs = [{31, 510}, {7, 255}, {26, 510}],
                     lev_break_times = 0};
get_skl_prac({62200, 18}) ->
    #skill_prac_data{id = 62200, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 33122,
                     attrs = [{31, 540}, {7, 270}, {26, 540}],
                     lev_break_times = 0};
get_skl_prac({62200, 19}) ->
    #skill_prac_data{id = 62200, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 37644,
                     attrs = [{31, 570}, {7, 285}, {26, 570}],
                     lev_break_times = 0};
get_skl_prac({62200, 20}) ->
    #skill_prac_data{id = 62200, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 42719,
                     attrs = [{31, 600}, {7, 300}, {26, 600}],
                     lev_break_times = 0};
get_skl_prac({62200, 21}) ->
    #skill_prac_data{id = 62200, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 48279,
                     attrs = [{31, 630}, {7, 315}, {26, 630}],
                     lev_break_times = 1};
get_skl_prac({62200, 22}) ->
    #skill_prac_data{id = 62200, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 58001,
                     attrs = [{31, 660}, {7, 330}, {26, 660}],
                     lev_break_times = 1};
get_skl_prac({62200, 23}) ->
    #skill_prac_data{id = 62200, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 70500,
                     attrs = [{31, 690}, {7, 345}, {26, 690}],
                     lev_break_times = 1};
get_skl_prac({62200, 24}) ->
    #skill_prac_data{id = 62200, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 94000,
                     attrs = [{31, 720}, {7, 360}, {26, 720}],
                     lev_break_times = 1};
get_skl_prac({62200, 25}) ->
    #skill_prac_data{id = 62200, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 124000,
                     attrs = [{31, 750}, {7, 375}, {26, 750}],
                     lev_break_times = 1};
get_skl_prac({62200, 26}) ->
    #skill_prac_data{id = 62200, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 160000,
                     attrs = [{31, 780}, {7, 390}, {26, 780}],
                     lev_break_times = 1};
get_skl_prac({62200, 27}) ->
    #skill_prac_data{id = 62200, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs = [{31, 810}, {7, 405}, {26, 810}],
                     lev_break_times = 1};
get_skl_prac({62200, 28}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs = [{31, 840}, {7, 420}, {26, 840}],
                     lev_break_times = 1};
get_skl_prac({62200, 29}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs = [{31, 870}, {7, 435}, {26, 870}],
                     lev_break_times = 1};
get_skl_prac({62200, 30}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs = [{31, 900}, {7, 450}, {26, 900}],
                     lev_break_times = 1};
get_skl_prac({62200, 31}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs = [{31, 930}, {7, 465}, {26, 930}],
                     lev_break_times = 1};
get_skl_prac({62200, 32}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs = [{31, 960}, {7, 480}, {26, 960}],
                     lev_break_times = 1};
get_skl_prac({62200, 33}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs = [{31, 990}, {7, 495}, {26, 990}],
                     lev_break_times = 1};
get_skl_prac({62200, 34}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 34, exp = 0,
                     attrs = [{31, 1020}, {7, 510}, {26, 1020}],
                     lev_break_times = 1};
get_skl_prac({62200, 35}) ->
    #skill_prac_data{id = 62200, role_lev = 999,
                     top_lev = 27, skill_lev = 35, exp = 0,
                     attrs = [{31, 1050}, {7, 525}, {26, 1050}],
                     lev_break_times = 1};
get_skl_prac({62300, 0}) ->
    #skill_prac_data{id = 62300, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 588,
                     lev_break_times = 0};
get_skl_prac({62300, 1}) ->
    #skill_prac_data{id = 62300, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 838,
                     attrs =
                         [{45, 25}, {46, 25}, {25, 30}, {4, 15}, {5, 15}],
                     lev_break_times = 0};
get_skl_prac({62300, 2}) ->
    #skill_prac_data{id = 62300, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 1210,
                     attrs =
                         [{45, 50}, {46, 50}, {25, 60}, {4, 30}, {5, 30}],
                     lev_break_times = 0};
get_skl_prac({62300, 3}) ->
    #skill_prac_data{id = 62300, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 1739,
                     attrs =
                         [{45, 75}, {46, 75}, {25, 90}, {4, 45}, {5, 45}],
                     lev_break_times = 0};
get_skl_prac({62300, 4}) ->
    #skill_prac_data{id = 62300, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 2614,
                     attrs =
                         [{45, 100}, {46, 100}, {25, 120}, {4, 60}, {5, 60}],
                     lev_break_times = 0};
get_skl_prac({62300, 5}) ->
    #skill_prac_data{id = 62300, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 3511,
                     attrs =
                         [{45, 125}, {46, 125}, {25, 150}, {4, 75}, {5, 75}],
                     lev_break_times = 0};
get_skl_prac({62300, 6}) ->
    #skill_prac_data{id = 62300, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 4996,
                     attrs =
                         [{45, 150}, {46, 150}, {25, 180}, {4, 90}, {5, 90}],
                     lev_break_times = 0};
get_skl_prac({62300, 7}) ->
    #skill_prac_data{id = 62300, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 6276,
                     attrs =
                         [{45, 175}, {46, 175}, {25, 210}, {4, 105}, {5, 105}],
                     lev_break_times = 0};
get_skl_prac({62300, 8}) ->
    #skill_prac_data{id = 62300, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 8484,
                     attrs =
                         [{45, 200}, {46, 200}, {25, 240}, {4, 120}, {5, 120}],
                     lev_break_times = 0};
get_skl_prac({62300, 9}) ->
    #skill_prac_data{id = 62300, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 11377,
                     attrs =
                         [{45, 225}, {46, 225}, {25, 270}, {4, 135}, {5, 135}],
                     lev_break_times = 0};
get_skl_prac({62300, 10}) ->
    #skill_prac_data{id = 62300, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 14928,
                     attrs =
                         [{45, 250}, {46, 250}, {25, 300}, {4, 150}, {5, 150}],
                     lev_break_times = 0};
get_skl_prac({62300, 11}) ->
    #skill_prac_data{id = 62300, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 18600,
                     attrs =
                         [{45, 275}, {46, 275}, {25, 330}, {4, 165}, {5, 165}],
                     lev_break_times = 0};
get_skl_prac({62300, 12}) ->
    #skill_prac_data{id = 62300, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 23532,
                     attrs =
                         [{45, 300}, {46, 300}, {25, 360}, {4, 180}, {5, 180}],
                     lev_break_times = 0};
get_skl_prac({62300, 13}) ->
    #skill_prac_data{id = 62300, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 28854,
                     attrs =
                         [{45, 325}, {46, 325}, {25, 390}, {4, 195}, {5, 195}],
                     lev_break_times = 0};
get_skl_prac({62300, 14}) ->
    #skill_prac_data{id = 62300, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 34812,
                     attrs =
                         [{45, 350}, {46, 350}, {25, 420}, {4, 210}, {5, 210}],
                     lev_break_times = 0};
get_skl_prac({62300, 15}) ->
    #skill_prac_data{id = 62300, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 41917,
                     attrs =
                         [{45, 375}, {46, 375}, {25, 450}, {4, 225}, {5, 225}],
                     lev_break_times = 0};
get_skl_prac({62300, 16}) ->
    #skill_prac_data{id = 62300, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 49772,
                     attrs =
                         [{45, 400}, {46, 400}, {25, 480}, {4, 240}, {5, 240}],
                     lev_break_times = 0};
get_skl_prac({62300, 17}) ->
    #skill_prac_data{id = 62300, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 57196,
                     attrs =
                         [{45, 425}, {46, 425}, {25, 510}, {4, 255}, {5, 255}],
                     lev_break_times = 0};
get_skl_prac({62300, 18}) ->
    #skill_prac_data{id = 62300, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 66244,
                     attrs =
                         [{45, 450}, {46, 450}, {25, 540}, {4, 270}, {5, 270}],
                     lev_break_times = 0};
get_skl_prac({62300, 19}) ->
    #skill_prac_data{id = 62300, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 75288,
                     attrs =
                         [{45, 475}, {46, 475}, {25, 570}, {4, 285}, {5, 285}],
                     lev_break_times = 0};
get_skl_prac({62300, 20}) ->
    #skill_prac_data{id = 62300, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 85438,
                     attrs =
                         [{45, 500}, {46, 500}, {25, 600}, {4, 300}, {5, 300}],
                     lev_break_times = 0};
get_skl_prac({62300, 21}) ->
    #skill_prac_data{id = 62300, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 96558,
                     attrs =
                         [{45, 525}, {46, 525}, {25, 630}, {4, 315}, {5, 315}],
                     lev_break_times = 1};
get_skl_prac({62300, 22}) ->
    #skill_prac_data{id = 62300, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 116002,
                     attrs =
                         [{45, 550}, {46, 550}, {25, 660}, {4, 330}, {5, 330}],
                     lev_break_times = 1};
get_skl_prac({62300, 23}) ->
    #skill_prac_data{id = 62300, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 141000,
                     attrs =
                         [{45, 575}, {46, 575}, {25, 690}, {4, 345}, {5, 345}],
                     lev_break_times = 1};
get_skl_prac({62300, 24}) ->
    #skill_prac_data{id = 62300, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 188000,
                     attrs =
                         [{45, 600}, {46, 600}, {25, 720}, {4, 360}, {5, 360}],
                     lev_break_times = 1};
get_skl_prac({62300, 25}) ->
    #skill_prac_data{id = 62300, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 248000,
                     attrs =
                         [{45, 625}, {46, 625}, {25, 750}, {4, 375}, {5, 375}],
                     lev_break_times = 1};
get_skl_prac({62300, 26}) ->
    #skill_prac_data{id = 62300, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 320000,
                     attrs =
                         [{45, 650}, {46, 650}, {25, 780}, {4, 390}, {5, 390}],
                     lev_break_times = 1};
get_skl_prac({62300, 27}) ->
    #skill_prac_data{id = 62300, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs =
                         [{45, 675}, {46, 675}, {25, 810}, {4, 405}, {5, 405}],
                     lev_break_times = 1};
get_skl_prac({62300, 28}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs =
                         [{45, 700}, {46, 700}, {25, 840}, {4, 420}, {5, 420}],
                     lev_break_times = 1};
get_skl_prac({62300, 29}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs =
                         [{45, 725}, {46, 725}, {25, 870}, {4, 435}, {5, 435}],
                     lev_break_times = 1};
get_skl_prac({62300, 30}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs =
                         [{45, 750}, {46, 750}, {25, 900}, {4, 450}, {5, 450}],
                     lev_break_times = 1};
get_skl_prac({62300, 31}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs =
                         [{45, 775}, {46, 775}, {25, 930}, {4, 465}, {5, 465}],
                     lev_break_times = 1};
get_skl_prac({62300, 32}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs =
                         [{45, 800}, {46, 800}, {25, 960}, {4, 480}, {5, 480}],
                     lev_break_times = 1};
get_skl_prac({62300, 33}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs =
                         [{45, 825}, {46, 825}, {25, 990}, {4, 495}, {5, 495}],
                     lev_break_times = 1};
get_skl_prac({62300, 34}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 34, exp = 0,
                     attrs =
                         [{45, 850}, {46, 850}, {25, 1020}, {4, 510}, {5, 510}],
                     lev_break_times = 1};
get_skl_prac({62300, 35}) ->
    #skill_prac_data{id = 62300, role_lev = 999,
                     top_lev = 27, skill_lev = 35, exp = 0,
                     attrs =
                         [{45, 875}, {46, 875}, {25, 1050}, {4, 525}, {5, 525}],
                     lev_break_times = 1};
get_skl_prac({62400, 0}) ->
    #skill_prac_data{id = 62400, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 293,
                     lev_break_times = 0};
get_skl_prac({62400, 1}) ->
    #skill_prac_data{id = 62400, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 419,
                     attrs = [{30, 30}, {6, 15}], lev_break_times = 0};
get_skl_prac({62400, 2}) ->
    #skill_prac_data{id = 62400, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 604,
                     attrs = [{30, 60}, {6, 30}], lev_break_times = 0};
get_skl_prac({62400, 3}) ->
    #skill_prac_data{id = 62400, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 869,
                     attrs = [{30, 90}, {6, 45}], lev_break_times = 0};
get_skl_prac({62400, 4}) ->
    #skill_prac_data{id = 62400, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 1306,
                     attrs = [{30, 120}, {6, 60}], lev_break_times = 0};
get_skl_prac({62400, 5}) ->
    #skill_prac_data{id = 62400, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 1755,
                     attrs = [{30, 150}, {6, 75}], lev_break_times = 0};
get_skl_prac({62400, 6}) ->
    #skill_prac_data{id = 62400, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 2497,
                     attrs = [{30, 180}, {6, 90}], lev_break_times = 0};
get_skl_prac({62400, 7}) ->
    #skill_prac_data{id = 62400, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 3138,
                     attrs = [{30, 210}, {6, 105}], lev_break_times = 0};
get_skl_prac({62400, 8}) ->
    #skill_prac_data{id = 62400, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 4241,
                     attrs = [{30, 240}, {6, 120}], lev_break_times = 0};
get_skl_prac({62400, 9}) ->
    #skill_prac_data{id = 62400, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 5688,
                     attrs = [{30, 270}, {6, 135}], lev_break_times = 0};
get_skl_prac({62400, 10}) ->
    #skill_prac_data{id = 62400, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 7463,
                     attrs = [{30, 300}, {6, 150}], lev_break_times = 0};
get_skl_prac({62400, 11}) ->
    #skill_prac_data{id = 62400, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 9300,
                     attrs = [{30, 330}, {6, 165}], lev_break_times = 0};
get_skl_prac({62400, 12}) ->
    #skill_prac_data{id = 62400, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 11765,
                     attrs = [{30, 360}, {6, 180}], lev_break_times = 0};
get_skl_prac({62400, 13}) ->
    #skill_prac_data{id = 62400, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 14426,
                     attrs = [{30, 390}, {6, 195}], lev_break_times = 0};
get_skl_prac({62400, 14}) ->
    #skill_prac_data{id = 62400, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 17404,
                     attrs = [{30, 420}, {6, 210}], lev_break_times = 0};
get_skl_prac({62400, 15}) ->
    #skill_prac_data{id = 62400, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 20958,
                     attrs = [{30, 450}, {6, 225}], lev_break_times = 0};
get_skl_prac({62400, 16}) ->
    #skill_prac_data{id = 62400, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 24886,
                     attrs = [{30, 480}, {6, 240}], lev_break_times = 0};
get_skl_prac({62400, 17}) ->
    #skill_prac_data{id = 62400, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 28597,
                     attrs = [{30, 510}, {6, 255}], lev_break_times = 0};
get_skl_prac({62400, 18}) ->
    #skill_prac_data{id = 62400, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 33122,
                     attrs = [{30, 540}, {6, 270}], lev_break_times = 0};
get_skl_prac({62400, 19}) ->
    #skill_prac_data{id = 62400, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 37644,
                     attrs = [{30, 570}, {6, 285}], lev_break_times = 0};
get_skl_prac({62400, 20}) ->
    #skill_prac_data{id = 62400, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 42719,
                     attrs = [{30, 600}, {6, 300}], lev_break_times = 0};
get_skl_prac({62400, 21}) ->
    #skill_prac_data{id = 62400, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 48279,
                     attrs = [{30, 630}, {6, 315}], lev_break_times = 1};
get_skl_prac({62400, 22}) ->
    #skill_prac_data{id = 62400, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 58001,
                     attrs = [{30, 660}, {6, 330}], lev_break_times = 1};
get_skl_prac({62400, 23}) ->
    #skill_prac_data{id = 62400, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 70500,
                     attrs = [{30, 690}, {6, 345}], lev_break_times = 1};
get_skl_prac({62400, 24}) ->
    #skill_prac_data{id = 62400, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 94000,
                     attrs = [{30, 720}, {6, 360}], lev_break_times = 1};
get_skl_prac({62400, 25}) ->
    #skill_prac_data{id = 62400, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 124000,
                     attrs = [{30, 750}, {6, 375}], lev_break_times = 1};
get_skl_prac({62400, 26}) ->
    #skill_prac_data{id = 62400, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 160000,
                     attrs = [{30, 780}, {6, 390}], lev_break_times = 1};
get_skl_prac({62400, 27}) ->
    #skill_prac_data{id = 62400, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs = [{30, 810}, {6, 405}], lev_break_times = 1};
get_skl_prac({62400, 28}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs = [{30, 840}, {6, 420}], lev_break_times = 1};
get_skl_prac({62400, 29}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs = [{30, 870}, {6, 435}], lev_break_times = 1};
get_skl_prac({62400, 30}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs = [{30, 900}, {6, 450}], lev_break_times = 1};
get_skl_prac({62400, 31}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs = [{30, 930}, {6, 465}], lev_break_times = 1};
get_skl_prac({62400, 32}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs = [{30, 960}, {6, 480}], lev_break_times = 1};
get_skl_prac({62400, 33}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs = [{30, 990}, {6, 495}], lev_break_times = 1};
get_skl_prac({62400, 34}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 25, skill_lev = 34, exp = 0,
                     attrs = [{30, 1020}, {6, 510}], lev_break_times = 1};
get_skl_prac({62400, 35}) ->
    #skill_prac_data{id = 62400, role_lev = 999,
                     top_lev = 25, skill_lev = 35, exp = 0,
                     attrs = [{30, 1050}, {6, 525}], lev_break_times = 1};
get_skl_prac({62500, 0}) ->
    #skill_prac_data{id = 62500, role_lev = 25,
                     top_lev = 27, skill_lev = 0, exp = 293,
                     lev_break_times = 0};
get_skl_prac({62500, 1}) ->
    #skill_prac_data{id = 62500, role_lev = 25,
                     top_lev = 27, skill_lev = 1, exp = 419,
                     attrs = [{31, 30}, {7, 15}, {26, 20}],
                     lev_break_times = 0};
get_skl_prac({62500, 2}) ->
    #skill_prac_data{id = 62500, role_lev = 30,
                     top_lev = 27, skill_lev = 2, exp = 604,
                     attrs = [{31, 60}, {7, 30}, {26, 40}],
                     lev_break_times = 0};
get_skl_prac({62500, 3}) ->
    #skill_prac_data{id = 62500, role_lev = 35,
                     top_lev = 27, skill_lev = 3, exp = 869,
                     attrs = [{31, 90}, {7, 45}, {26, 60}],
                     lev_break_times = 0};
get_skl_prac({62500, 4}) ->
    #skill_prac_data{id = 62500, role_lev = 40,
                     top_lev = 27, skill_lev = 4, exp = 1306,
                     attrs = [{31, 120}, {7, 60}, {26, 80}],
                     lev_break_times = 0};
get_skl_prac({62500, 5}) ->
    #skill_prac_data{id = 62500, role_lev = 45,
                     top_lev = 27, skill_lev = 5, exp = 1755,
                     attrs = [{31, 150}, {7, 75}, {26, 100}],
                     lev_break_times = 0};
get_skl_prac({62500, 6}) ->
    #skill_prac_data{id = 62500, role_lev = 50,
                     top_lev = 27, skill_lev = 6, exp = 2497,
                     attrs = [{31, 180}, {7, 90}, {26, 120}],
                     lev_break_times = 0};
get_skl_prac({62500, 7}) ->
    #skill_prac_data{id = 62500, role_lev = 50,
                     top_lev = 27, skill_lev = 7, exp = 3138,
                     attrs = [{31, 210}, {7, 105}, {26, 140}],
                     lev_break_times = 0};
get_skl_prac({62500, 8}) ->
    #skill_prac_data{id = 62500, role_lev = 55,
                     top_lev = 27, skill_lev = 8, exp = 4241,
                     attrs = [{31, 240}, {7, 120}, {26, 160}],
                     lev_break_times = 0};
get_skl_prac({62500, 9}) ->
    #skill_prac_data{id = 62500, role_lev = 60,
                     top_lev = 27, skill_lev = 9, exp = 5688,
                     attrs = [{31, 270}, {7, 135}, {26, 180}],
                     lev_break_times = 0};
get_skl_prac({62500, 10}) ->
    #skill_prac_data{id = 62500, role_lev = 65,
                     top_lev = 27, skill_lev = 10, exp = 7463,
                     attrs = [{31, 300}, {7, 150}, {26, 200}],
                     lev_break_times = 0};
get_skl_prac({62500, 11}) ->
    #skill_prac_data{id = 62500, role_lev = 65,
                     top_lev = 27, skill_lev = 11, exp = 9300,
                     attrs = [{31, 330}, {7, 165}, {26, 220}],
                     lev_break_times = 0};
get_skl_prac({62500, 12}) ->
    #skill_prac_data{id = 62500, role_lev = 70,
                     top_lev = 27, skill_lev = 12, exp = 11765,
                     attrs = [{31, 360}, {7, 180}, {26, 240}],
                     lev_break_times = 0};
get_skl_prac({62500, 13}) ->
    #skill_prac_data{id = 62500, role_lev = 75,
                     top_lev = 27, skill_lev = 13, exp = 14426,
                     attrs = [{31, 390}, {7, 195}, {26, 260}],
                     lev_break_times = 0};
get_skl_prac({62500, 14}) ->
    #skill_prac_data{id = 62500, role_lev = 75,
                     top_lev = 27, skill_lev = 14, exp = 17404,
                     attrs = [{31, 420}, {7, 210}, {26, 280}],
                     lev_break_times = 0};
get_skl_prac({62500, 15}) ->
    #skill_prac_data{id = 62500, role_lev = 80,
                     top_lev = 27, skill_lev = 15, exp = 20958,
                     attrs = [{31, 450}, {7, 225}, {26, 300}],
                     lev_break_times = 0};
get_skl_prac({62500, 16}) ->
    #skill_prac_data{id = 62500, role_lev = 85,
                     top_lev = 27, skill_lev = 16, exp = 24886,
                     attrs = [{31, 480}, {7, 240}, {26, 320}],
                     lev_break_times = 0};
get_skl_prac({62500, 17}) ->
    #skill_prac_data{id = 62500, role_lev = 85,
                     top_lev = 27, skill_lev = 17, exp = 28597,
                     attrs = [{31, 510}, {7, 255}, {26, 340}],
                     lev_break_times = 0};
get_skl_prac({62500, 18}) ->
    #skill_prac_data{id = 62500, role_lev = 90,
                     top_lev = 27, skill_lev = 18, exp = 33122,
                     attrs = [{31, 540}, {7, 270}, {26, 360}],
                     lev_break_times = 0};
get_skl_prac({62500, 19}) ->
    #skill_prac_data{id = 62500, role_lev = 90,
                     top_lev = 27, skill_lev = 19, exp = 37644,
                     attrs = [{31, 570}, {7, 285}, {26, 380}],
                     lev_break_times = 0};
get_skl_prac({62500, 20}) ->
    #skill_prac_data{id = 62500, role_lev = 95,
                     top_lev = 27, skill_lev = 20, exp = 42719,
                     attrs = [{31, 600}, {7, 300}, {26, 400}],
                     lev_break_times = 0};
get_skl_prac({62500, 21}) ->
    #skill_prac_data{id = 62500, role_lev = 95,
                     top_lev = 27, skill_lev = 21, exp = 48279,
                     attrs = [{31, 630}, {7, 315}, {26, 420}],
                     lev_break_times = 1};
get_skl_prac({62500, 22}) ->
    #skill_prac_data{id = 62500, role_lev = 95,
                     top_lev = 27, skill_lev = 22, exp = 58001,
                     attrs = [{31, 660}, {7, 330}, {26, 440}],
                     lev_break_times = 1};
get_skl_prac({62500, 23}) ->
    #skill_prac_data{id = 62500, role_lev = 100,
                     top_lev = 27, skill_lev = 23, exp = 70500,
                     attrs = [{31, 690}, {7, 345}, {26, 460}],
                     lev_break_times = 1};
get_skl_prac({62500, 24}) ->
    #skill_prac_data{id = 62500, role_lev = 105,
                     top_lev = 27, skill_lev = 24, exp = 94000,
                     attrs = [{31, 720}, {7, 360}, {26, 480}],
                     lev_break_times = 1};
get_skl_prac({62500, 25}) ->
    #skill_prac_data{id = 62500, role_lev = 110,
                     top_lev = 27, skill_lev = 25, exp = 124000,
                     attrs = [{31, 750}, {7, 375}, {26, 500}],
                     lev_break_times = 1};
get_skl_prac({62500, 26}) ->
    #skill_prac_data{id = 62500, role_lev = 115,
                     top_lev = 27, skill_lev = 26, exp = 160000,
                     attrs = [{31, 780}, {7, 390}, {26, 520}],
                     lev_break_times = 1};
get_skl_prac({62500, 27}) ->
    #skill_prac_data{id = 62500, role_lev = 120,
                     top_lev = 27, skill_lev = 27, exp = 0,
                     attrs = [{31, 810}, {7, 405}, {26, 540}],
                     lev_break_times = 1};
get_skl_prac({62500, 28}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 28, exp = 0,
                     attrs = [{31, 840}, {7, 420}, {26, 560}],
                     lev_break_times = 1};
get_skl_prac({62500, 29}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 29, exp = 0,
                     attrs = [{31, 870}, {7, 435}, {26, 580}],
                     lev_break_times = 1};
get_skl_prac({62500, 30}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 30, exp = 0,
                     attrs = [{31, 900}, {7, 450}, {26, 600}],
                     lev_break_times = 1};
get_skl_prac({62500, 31}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 31, exp = 0,
                     attrs = [{31, 930}, {7, 465}, {26, 620}],
                     lev_break_times = 1};
get_skl_prac({62500, 32}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 32, exp = 0,
                     attrs = [{31, 960}, {7, 480}, {26, 640}],
                     lev_break_times = 1};
get_skl_prac({62500, 33}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 33, exp = 0,
                     attrs = [{31, 990}, {7, 495}, {26, 660}],
                     lev_break_times = 1};
get_skl_prac({62500, 34}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 34, exp = 0,
                     attrs = [{31, 1020}, {7, 510}, {26, 680}],
                     lev_break_times = 1};
get_skl_prac({62500, 35}) ->
    #skill_prac_data{id = 62500, role_lev = 999,
                     top_lev = 27, skill_lev = 35, exp = 0,
                     attrs = [{31, 1050}, {7, 525}, {26, 700}],
                     lev_break_times = 1};
get_skl_prac(_) -> false.

box_list() ->
    [{10001, 35, 5},
     {10002, 35, 5},
     {50001, 35, 5},
     {50002, 35, 5},
     {50003, 35, 5},
     {10004, 35, 5},
     {50011, 35, 5},
     {50012, 35, 5},
     {50013, 35, 5},
     {10003, 35, 5},
     {10007, 45, 5},
     {50021, 55, 5},
     {50022, 65, 5},
     {50023, 70, 5},
     {50031, 75, 5},
     {50032, 80, 5},
     {50033, 85, 5}].

box_exp() ->
    [{20, 80},
     {30, 130},
     {40, 180},
     {50, 160},
     {60, 160},
     {70, 110},
     {80, 80},
     {120, 35},
     {150, 25},
     {180, 20},
     {300, 20}].

get_max_lev(35) -> 4;
get_max_lev(40) -> 5;
get_max_lev(45) -> 7;
get_max_lev(50) -> 8;
get_max_lev(55) -> 9;
get_max_lev(60) -> 11;
get_max_lev(65) -> 12;
get_max_lev(70) -> 14;
get_max_lev(75) -> 15;
get_max_lev(80) -> 17;
get_max_lev(85) -> 19;
get_max_lev(90) -> 20;
get_max_lev(95) -> 20;
get_max_lev(100) -> 22;
get_max_lev(105) -> 22;
get_max_lev(110) -> 23;
get_max_lev(115) -> 23;
get_max_lev(120) -> 24;
get_max_lev(125) -> 24;
get_max_lev(130) -> 24;
get_max_lev(_) -> false.

get_max_times({62000, 0}) -> 0;
get_max_times({62000, 1}) -> 0;
get_max_times({62000, 2}) -> 0;
get_max_times({62000, 3}) -> 0;
get_max_times({62000, 4}) -> 0;
get_max_times({62000, 5}) -> 0;
get_max_times({62000, 6}) -> 0;
get_max_times({62000, 7}) -> 0;
get_max_times({62000, 8}) -> 0;
get_max_times({62000, 9}) -> 0;
get_max_times({62000, 10}) -> 0;
get_max_times({62000, 11}) -> 0;
get_max_times({62000, 12}) -> 0;
get_max_times({62000, 13}) -> 0;
get_max_times({62000, 14}) -> 0;
get_max_times({62000, 15}) -> 0;
get_max_times({62000, 16}) -> 0;
get_max_times({62000, 17}) -> 0;
get_max_times({62000, 18}) -> 0;
get_max_times({62000, 19}) -> 0;
get_max_times({62000, 20}) -> 0;
get_max_times({62000, 21}) -> 0;
get_max_times({62000, 22}) -> 0;
get_max_times({62000, 23}) -> 0;
get_max_times({62000, 24}) -> 0;
get_max_times({62000, 25}) -> 20;
get_max_times({62000, 26}) -> 20;
get_max_times({62000, 27}) -> 20;
get_max_times({62000, 28}) -> 20;
get_max_times({62000, 29}) -> 20;
get_max_times({62000, 30}) -> 20;
get_max_times({62000, 31}) -> 20;
get_max_times({62000, 32}) -> 20;
get_max_times({62000, 33}) -> 20;
get_max_times({62000, 34}) -> 20;
get_max_times({62000, 35}) -> 20;
get_max_times({62100, 0}) -> 0;
get_max_times({62100, 1}) -> 0;
get_max_times({62100, 2}) -> 0;
get_max_times({62100, 3}) -> 0;
get_max_times({62100, 4}) -> 0;
get_max_times({62100, 5}) -> 0;
get_max_times({62100, 6}) -> 0;
get_max_times({62100, 7}) -> 0;
get_max_times({62100, 8}) -> 0;
get_max_times({62100, 9}) -> 0;
get_max_times({62100, 10}) -> 0;
get_max_times({62100, 11}) -> 0;
get_max_times({62100, 12}) -> 0;
get_max_times({62100, 13}) -> 0;
get_max_times({62100, 14}) -> 0;
get_max_times({62100, 15}) -> 0;
get_max_times({62100, 16}) -> 0;
get_max_times({62100, 17}) -> 0;
get_max_times({62100, 18}) -> 0;
get_max_times({62100, 19}) -> 0;
get_max_times({62100, 20}) -> 0;
get_max_times({62100, 21}) -> 0;
get_max_times({62100, 22}) -> 0;
get_max_times({62100, 23}) -> 0;
get_max_times({62100, 24}) -> 0;
get_max_times({62100, 25}) -> 20;
get_max_times({62100, 26}) -> 20;
get_max_times({62100, 27}) -> 20;
get_max_times({62100, 28}) -> 20;
get_max_times({62100, 29}) -> 20;
get_max_times({62100, 30}) -> 20;
get_max_times({62100, 31}) -> 20;
get_max_times({62100, 32}) -> 20;
get_max_times({62100, 33}) -> 20;
get_max_times({62100, 34}) -> 20;
get_max_times({62100, 35}) -> 20;
get_max_times({62200, 0}) -> 0;
get_max_times({62200, 1}) -> 0;
get_max_times({62200, 2}) -> 0;
get_max_times({62200, 3}) -> 0;
get_max_times({62200, 4}) -> 0;
get_max_times({62200, 5}) -> 0;
get_max_times({62200, 6}) -> 0;
get_max_times({62200, 7}) -> 0;
get_max_times({62200, 8}) -> 0;
get_max_times({62200, 9}) -> 0;
get_max_times({62200, 10}) -> 0;
get_max_times({62200, 11}) -> 0;
get_max_times({62200, 12}) -> 0;
get_max_times({62200, 13}) -> 0;
get_max_times({62200, 14}) -> 0;
get_max_times({62200, 15}) -> 0;
get_max_times({62200, 16}) -> 0;
get_max_times({62200, 17}) -> 0;
get_max_times({62200, 18}) -> 0;
get_max_times({62200, 19}) -> 0;
get_max_times({62200, 20}) -> 0;
get_max_times({62200, 21}) -> 0;
get_max_times({62200, 22}) -> 0;
get_max_times({62200, 23}) -> 0;
get_max_times({62200, 24}) -> 0;
get_max_times({62200, 25}) -> 20;
get_max_times({62200, 26}) -> 20;
get_max_times({62200, 27}) -> 20;
get_max_times({62200, 28}) -> 20;
get_max_times({62200, 29}) -> 20;
get_max_times({62200, 30}) -> 20;
get_max_times({62200, 31}) -> 20;
get_max_times({62200, 32}) -> 20;
get_max_times({62200, 33}) -> 20;
get_max_times({62200, 34}) -> 20;
get_max_times({62200, 35}) -> 20;
get_max_times({62300, 0}) -> 0;
get_max_times({62300, 1}) -> 0;
get_max_times({62300, 2}) -> 0;
get_max_times({62300, 3}) -> 0;
get_max_times({62300, 4}) -> 0;
get_max_times({62300, 5}) -> 0;
get_max_times({62300, 6}) -> 0;
get_max_times({62300, 7}) -> 0;
get_max_times({62300, 8}) -> 0;
get_max_times({62300, 9}) -> 0;
get_max_times({62300, 10}) -> 0;
get_max_times({62300, 11}) -> 0;
get_max_times({62300, 12}) -> 0;
get_max_times({62300, 13}) -> 0;
get_max_times({62300, 14}) -> 0;
get_max_times({62300, 15}) -> 0;
get_max_times({62300, 16}) -> 0;
get_max_times({62300, 17}) -> 0;
get_max_times({62300, 18}) -> 0;
get_max_times({62300, 19}) -> 0;
get_max_times({62300, 20}) -> 0;
get_max_times({62300, 21}) -> 0;
get_max_times({62300, 22}) -> 0;
get_max_times({62300, 23}) -> 0;
get_max_times({62300, 24}) -> 0;
get_max_times({62300, 25}) -> 20;
get_max_times({62300, 26}) -> 20;
get_max_times({62300, 27}) -> 20;
get_max_times({62300, 28}) -> 20;
get_max_times({62300, 29}) -> 20;
get_max_times({62300, 30}) -> 20;
get_max_times({62300, 31}) -> 20;
get_max_times({62300, 32}) -> 20;
get_max_times({62300, 33}) -> 20;
get_max_times({62300, 34}) -> 20;
get_max_times({62300, 35}) -> 20;
get_max_times({62400, 0}) -> 0;
get_max_times({62400, 1}) -> 0;
get_max_times({62400, 2}) -> 0;
get_max_times({62400, 3}) -> 0;
get_max_times({62400, 4}) -> 0;
get_max_times({62400, 5}) -> 0;
get_max_times({62400, 6}) -> 0;
get_max_times({62400, 7}) -> 0;
get_max_times({62400, 8}) -> 0;
get_max_times({62400, 9}) -> 0;
get_max_times({62400, 10}) -> 0;
get_max_times({62400, 11}) -> 0;
get_max_times({62400, 12}) -> 0;
get_max_times({62400, 13}) -> 0;
get_max_times({62400, 14}) -> 0;
get_max_times({62400, 15}) -> 0;
get_max_times({62400, 16}) -> 0;
get_max_times({62400, 17}) -> 0;
get_max_times({62400, 18}) -> 0;
get_max_times({62400, 19}) -> 0;
get_max_times({62400, 20}) -> 0;
get_max_times({62400, 21}) -> 0;
get_max_times({62400, 22}) -> 0;
get_max_times({62400, 23}) -> 0;
get_max_times({62400, 24}) -> 0;
get_max_times({62400, 25}) -> 20;
get_max_times({62400, 26}) -> 20;
get_max_times({62400, 27}) -> 20;
get_max_times({62400, 28}) -> 20;
get_max_times({62400, 29}) -> 20;
get_max_times({62400, 30}) -> 20;
get_max_times({62400, 31}) -> 20;
get_max_times({62400, 32}) -> 20;
get_max_times({62400, 33}) -> 20;
get_max_times({62400, 34}) -> 20;
get_max_times({62400, 35}) -> 20;
get_max_times({62500, 0}) -> 0;
get_max_times({62500, 1}) -> 0;
get_max_times({62500, 2}) -> 0;
get_max_times({62500, 3}) -> 0;
get_max_times({62500, 4}) -> 0;
get_max_times({62500, 5}) -> 0;
get_max_times({62500, 6}) -> 0;
get_max_times({62500, 7}) -> 0;
get_max_times({62500, 8}) -> 0;
get_max_times({62500, 9}) -> 0;
get_max_times({62500, 10}) -> 0;
get_max_times({62500, 11}) -> 0;
get_max_times({62500, 12}) -> 0;
get_max_times({62500, 13}) -> 0;
get_max_times({62500, 14}) -> 0;
get_max_times({62500, 15}) -> 0;
get_max_times({62500, 16}) -> 0;
get_max_times({62500, 17}) -> 0;
get_max_times({62500, 18}) -> 0;
get_max_times({62500, 19}) -> 0;
get_max_times({62500, 20}) -> 0;
get_max_times({62500, 21}) -> 0;
get_max_times({62500, 22}) -> 0;
get_max_times({62500, 23}) -> 0;
get_max_times({62500, 24}) -> 0;
get_max_times({62500, 25}) -> 20;
get_max_times({62500, 26}) -> 20;
get_max_times({62500, 27}) -> 20;
get_max_times({62500, 28}) -> 20;
get_max_times({62500, 29}) -> 20;
get_max_times({62500, 30}) -> 20;
get_max_times({62500, 31}) -> 20;
get_max_times({62500, 32}) -> 20;
get_max_times({62500, 33}) -> 20;
get_max_times({62500, 34}) -> 20;
get_max_times({62500, 35}) -> 20;
get_max_times(_) -> false.

