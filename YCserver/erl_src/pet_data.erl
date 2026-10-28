-file("src/data/pet_data.erl", 1).

-module(pet_data).

-export([get_base/1,
         get_base_attr/1,
         get_base_ratio/1,
         get_apti_ratio/1,
         get_point_attr/1,
         get_exp/1,
         get_stone/1,
         get_grade/1,
         get_stone_skill/1,
         allow_stone/1,
         get_rand_apt/1,
         set_point/1,
         get_catch/1,
         add_pet_nums/1,
         add_pet_store_nums/1,
         get_grade_loss/1,
         get_exchange/1,
         get_all_exchange/1,
         get_add_apt/1,
         get_add_max_apt/1,
         get_egg/1,
         get_reset/1,
         get_fresh/1,
         model/1,
         pet_talk/1,
         get_comprehend_skill/1,
         get_pet_special_skill/1,
         get_pet_low_special_skill/1,
         get_polish/1,
         get_stone_attr/1,
         get_aptitude_reimburse/1,
         get_exchange_spec/1,
         get_refining_exp/1,
         get_refining_exp_sub/1,
         get_refining_lev/1,
         get_refining_apt/1,
         get_skin/1,
         get_lev_break_exchange/1,
         get_attach_attr/1,
         get_attach_child_attr/1,
         get_attach_ratio/2,
         get_attach_child_ratio/2,
         get_special_skills/1,
         get_high_stone/1,
         get_unreal/1,
         get_unreal_black/0,
         get_exchange_skill_info/1]).

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

-file("src/data/pet_data.erl", 60).

-file("inc/pet.hrl", 1).

-record(pet_attr,
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
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
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
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/data/pet_data.erl", 61).

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

-file("src/data/pet_data.erl", 62).

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

-file("src/data/pet_data.erl", 63).

get_base(10000) ->
    #pet_base{id = 10000, name = lang:get("龙猫君"), type = 2,
              genre = 5, phy_aptitude = 1125, pdef_aptitude = 1180,
              hp_aptitude = 1350, magic_aptitude = 1400,
              aspd_aptitude = 1250, base_happy = 8500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60092, 1000},
                   {60041, 700},
                   {60161, 700},
                   {60060, 700}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 4}], max_wash_time = 10,
              growth_blue = 750, growth_purple = 800,
              growth_orange = 820, growth_red = 840, model_id = 30000,
              model_id1 = 30100, model_id2 = 30200, model_id3 = 30200,
              skin_id_0 = 30000, skin_id_1 = 30100, skin_id_2 = 30100,
              skin_id_3 = 30100, skin_id_s0 = 30200,
              skin_id_s1 = 30300, skin_id_s2 = 30300,
              skin_id_s3 = 30300, manual_level = 1};
get_base(10001) ->
    #pet_base{id = 10001, name = lang:get("波波"), type = 1,
              genre = 0, phy_aptitude = 1375, pdef_aptitude = 1062,
              hp_aptitude = 1250, magic_aptitude = 875,
              aspd_aptitude = 1312, base_happy = 8500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60039, 1000}, {60037, 700}, {60033, 700}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60040,
                   60041,
                   60042,
                   60043,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 1}], max_wash_time = 10,
              growth_blue = 640, growth_purple = 660,
              growth_orange = 679, growth_red = 699, model_id = 30001,
              model_id1 = 30101, model_id2 = 30201, model_id3 = 30201,
              skin_id_0 = 30001, skin_id_1 = 30101, skin_id_2 = 30101,
              skin_id_3 = 30101, skin_id_s0 = 30201,
              skin_id_s1 = 30301, skin_id_s2 = 30301,
              skin_id_s3 = 30301, manual_level = 1};
get_base(10002) ->
    #pet_base{id = 10002, name = lang:get("小浣熊"), type = 1,
              genre = 0, phy_aptitude = 1312, pdef_aptitude = 1062,
              hp_aptitude = 1312, magic_aptitude = 875,
              aspd_aptitude = 1250, base_happy = 8500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60038, 900}, {60001, 900}, {60033, 900}],
              vari_skills =
                  [60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 1}], max_wash_time = 10,
              growth_blue = 640, growth_purple = 660,
              growth_orange = 679, growth_red = 699, model_id = 30002,
              model_id1 = 30102, model_id2 = 30202, model_id3 = 30202,
              skin_id_0 = 30002, skin_id_1 = 30102, skin_id_2 = 30102,
              skin_id_3 = 30102, skin_id_s0 = 30202,
              skin_id_s1 = 30302, skin_id_s2 = 30302,
              skin_id_s3 = 30302, manual_level = 1};
get_base(10003) ->
    #pet_base{id = 10003, name = lang:get("花莹"), type = 1,
              genre = 0, phy_aptitude = 1437, pdef_aptitude = 1150,
              hp_aptitude = 1250, magic_aptitude = 937,
              aspd_aptitude = 1250, base_happy = 8500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60137, 900}, {60038, 900}, {60081, 900}],
              vari_skills =
                  [60001,
                   60002,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 2}], max_wash_time = 10,
              growth_blue = 679, growth_purple = 700,
              growth_orange = 721, growth_red = 742, model_id = 30003,
              model_id1 = 30103, model_id2 = 30203, model_id3 = 30203,
              skin_id_0 = 30003, skin_id_1 = 30103, skin_id_2 = 30103,
              skin_id_3 = 30103, skin_id_s0 = 30203,
              skin_id_s1 = 30303, skin_id_s2 = 30303,
              skin_id_s3 = 30303, manual_level = 15};
get_base(10004) ->
    #pet_base{id = 10004, name = lang:get("螳螂忍者"), type = 1,
              genre = 0, phy_aptitude = 1312, pdef_aptitude = 1187,
              hp_aptitude = 1250, magic_aptitude = 1062,
              aspd_aptitude = 1287, base_happy = 8500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60040, 900}, {60005, 900}, {60031, 900}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 2}], max_wash_time = 10,
              growth_blue = 679, growth_purple = 700,
              growth_orange = 721, growth_red = 742, model_id = 30006,
              model_id1 = 30106, model_id2 = 30206, model_id3 = 30206,
              skin_id_0 = 30006, skin_id_1 = 30106, skin_id_2 = 30106,
              skin_id_3 = 30106, skin_id_s0 = 30206,
              skin_id_s1 = 30306, skin_id_s2 = 30306,
              skin_id_s3 = 30306, manual_level = 15};
get_base(10005) ->
    #pet_base{id = 10005, name = lang:get("龙龟"), type = 3,
              genre = 0, phy_aptitude = 1062, pdef_aptitude = 1375,
              hp_aptitude = 1375, magic_aptitude = 1187,
              aspd_aptitude = 1125, base_happy = 11000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60026, 900}, {60052, 900}, {60032, 900}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60053,
                   60054,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 2}], max_wash_time = 10,
              growth_blue = 679, growth_purple = 700,
              growth_orange = 721, growth_red = 742, model_id = 30005,
              model_id1 = 30105, model_id2 = 30205, model_id3 = 30205,
              skin_id_0 = 30005, skin_id_1 = 30105, skin_id_2 = 30105,
              skin_id_3 = 30105, skin_id_s0 = 30205,
              skin_id_s1 = 30305, skin_id_s2 = 30305,
              skin_id_s3 = 30305, manual_level = 15};
get_base(10006) ->
    #pet_base{id = 10006, name = lang:get("小虎船长"), type = 1,
              genre = 0, phy_aptitude = 1475, pdef_aptitude = 1150,
              hp_aptitude = 1312, magic_aptitude = 1125,
              aspd_aptitude = 1287, base_happy = 8200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60137, 900},
                   {60139, 900},
                   {60040, 900},
                   {60047, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60040,
                   60041,
                   60042,
                   60043,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 4}], max_wash_time = 10,
              growth_blue = 717, growth_purple = 740,
              growth_orange = 762, growth_red = 784, model_id = 30004,
              model_id1 = 30104, model_id2 = 30204, model_id3 = 30204,
              skin_id_0 = 30004, skin_id_1 = 30104, skin_id_2 = 30104,
              skin_id_3 = 30104, skin_id_s0 = 30204,
              skin_id_s1 = 30304, skin_id_s2 = 30304,
              skin_id_s3 = 30304, manual_level = 35};
get_base(10007) ->
    #pet_base{id = 10007, name = lang:get("树人"), type = 3,
              genre = 0, phy_aptitude = 1125, pdef_aptitude = 1375,
              hp_aptitude = 1475, magic_aptitude = 1312,
              aspd_aptitude = 1187, base_happy = 8200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60027, 900},
                   {60050, 900},
                   {60032, 900},
                   {60147, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60048,
                   60049,
                   60050,
                   60051,
                   60052,
                   60054,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 4}], max_wash_time = 10,
              growth_blue = 717, growth_purple = 740,
              growth_orange = 762, growth_red = 784, model_id = 30007,
              model_id1 = 30107, model_id2 = 30207, model_id3 = 30207,
              skin_id_0 = 30007, skin_id_1 = 30107, skin_id_2 = 30107,
              skin_id_3 = 30107, skin_id_s0 = 30207,
              skin_id_s1 = 30307, skin_id_s2 = 30307,
              skin_id_s3 = 30307, manual_level = 35};
get_base(10008) ->
    #pet_base{id = 10008, name = lang:get("森林精灵"), type = 2,
              genre = 0, phy_aptitude = 1125, pdef_aptitude = 1225,
              hp_aptitude = 1375, magic_aptitude = 1437,
              aspd_aptitude = 1375, base_happy = 8200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60013, 900},
                   {60034, 900},
                   {60043, 900},
                   {60147, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 4}], max_wash_time = 10,
              growth_blue = 717, growth_purple = 740,
              growth_orange = 762, growth_red = 784, model_id = 30008,
              model_id1 = 30108, model_id2 = 30208, model_id3 = 30208,
              skin_id_0 = 30008, skin_id_1 = 30108, skin_id_2 = 30108,
              skin_id_3 = 30108, skin_id_s0 = 30208,
              skin_id_s1 = 30308, skin_id_s2 = 30308,
              skin_id_s3 = 30308, manual_level = 35};
get_base(10009) ->
    #pet_base{id = 10009, name = lang:get("飞刃忍者"), type = 1,
              genre = 0, phy_aptitude = 1500, pdef_aptitude = 1312,
              hp_aptitude = 1287, magic_aptitude = 1125,
              aspd_aptitude = 1437, base_happy = 8000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60019, 850},
                   {60152, 800},
                   {60046, 800},
                   {60057, 800}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60145,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60155],
              cost = [{20006, 6}], max_wash_time = 10,
              growth_blue = 795, growth_purple = 820,
              growth_orange = 844, growth_red = 869, model_id = 30009,
              model_id1 = 30109, model_id2 = 30209, model_id3 = 30209,
              skin_id_0 = 30009, skin_id_1 = 30109, skin_id_2 = 30109,
              skin_id_3 = 30109, skin_id_s0 = 30209,
              skin_id_s1 = 30309, skin_id_s2 = 30309,
              skin_id_s3 = 30309, manual_level = 45};
get_base(10010) ->
    #pet_base{id = 10010, name = lang:get("雪狐"), type = 2,
              genre = 0, phy_aptitude = 1375, pdef_aptitude = 1250,
              hp_aptitude = 1312, magic_aptitude = 1475,
              aspd_aptitude = 1312, base_happy = 8000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60015, 850},
                   {60146, 800},
                   {60028, 800},
                   {60005, 800}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60145,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 6}], max_wash_time = 10,
              growth_blue = 795, growth_purple = 820,
              growth_orange = 844, growth_red = 869, model_id = 30010,
              model_id1 = 30110, model_id2 = 30210, model_id3 = 30210,
              skin_id_0 = 30010, skin_id_1 = 30110, skin_id_2 = 30110,
              skin_id_3 = 30110, skin_id_s0 = 30210,
              skin_id_s1 = 30310, skin_id_s2 = 30310,
              skin_id_s3 = 30310, manual_level = 45};
get_base(10011) ->
    #pet_base{id = 10011, name = lang:get("犀牛战士"), type = 2,
              genre = 0, phy_aptitude = 1375, pdef_aptitude = 1250,
              hp_aptitude = 1500, magic_aptitude = 1276,
              aspd_aptitude = 1350, base_happy = 8000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60127, 850},
                   {60072, 800},
                   {60049, 800},
                   {60031, 800}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60145,
                   60146,
                   60147,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 6}], max_wash_time = 10,
              growth_blue = 795, growth_purple = 820,
              growth_orange = 844, growth_red = 869, model_id = 30011,
              model_id1 = 30111, model_id2 = 30211, model_id3 = 30211,
              skin_id_0 = 30011, skin_id_1 = 30111, skin_id_2 = 30111,
              skin_id_3 = 30111, skin_id_s0 = 30211,
              skin_id_s1 = 30311, skin_id_s2 = 30311,
              skin_id_s3 = 30311, manual_level = 45};
get_base(10012) ->
    #pet_base{id = 10012, name = lang:get("森林巨人"), type = 3,
              genre = 0, phy_aptitude = 1450, pdef_aptitude = 1500,
              hp_aptitude = 1500, magic_aptitude = 1312,
              aspd_aptitude = 1250, base_happy = 7800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60026, 800},
                   {60140, 800},
                   {60157, 750},
                   {60052, 750}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60051,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 8}], max_wash_time = 16,
              growth_blue = 853, growth_purple = 880,
              growth_orange = 906, growth_red = 932, model_id = 30012,
              model_id1 = 30112, model_id2 = 30212, model_id3 = 30212,
              skin_id_0 = 30012, skin_id_1 = 30112, skin_id_2 = 30112,
              skin_id_3 = 30112, skin_id_s0 = 30212,
              skin_id_s1 = 30312, skin_id_s2 = 30312,
              skin_id_s3 = 30312, manual_level = 55};
get_base(10013) ->
    #pet_base{id = 10013, name = lang:get("人鱼精灵"), type = 2,
              genre = 0, phy_aptitude = 1225, pdef_aptitude = 1300,
              hp_aptitude = 1375, magic_aptitude = 1500,
              aspd_aptitude = 1450, base_happy = 7800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60065, 800},
                   {60059, 800},
                   {60060, 750},
                   {60161, 750}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60154],
              cost = [{20006, 8}], max_wash_time = 16,
              growth_blue = 853, growth_purple = 880,
              growth_orange = 906, growth_red = 932, model_id = 30013,
              model_id1 = 30113, model_id2 = 30213, model_id3 = 30213,
              skin_id_0 = 30013, skin_id_1 = 30113, skin_id_2 = 30113,
              skin_id_3 = 30113, skin_id_s0 = 30213,
              skin_id_s1 = 30313, skin_id_s2 = 30313,
              skin_id_s3 = 30313, manual_level = 55};
get_base(10014) ->
    #pet_base{id = 10014, name = lang:get("霜狼"), type = 1,
              genre = 0, phy_aptitude = 1510, pdef_aptitude = 1320,
              hp_aptitude = 1375, magic_aptitude = 1287,
              aspd_aptitude = 1420, base_happy = 7800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60137, 800},
                   {60136, 800},
                   {60003, 750},
                   {60030, 750}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60047,
                   60048,
                   60049,
                   60050,
                   60051,
                   60053,
                   60054,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 8}], max_wash_time = 16,
              growth_blue = 853, growth_purple = 880,
              growth_orange = 906, growth_red = 932, model_id = 30014,
              model_id1 = 30114, model_id2 = 30214, model_id3 = 30214,
              skin_id_0 = 30014, skin_id_1 = 30114, skin_id_2 = 30114,
              skin_id_3 = 30114, skin_id_s0 = 30214,
              skin_id_s1 = 30314, skin_id_s2 = 30314,
              skin_id_s3 = 30314, manual_level = 55};
get_base(10015) ->
    #pet_base{id = 10015, name = lang:get("炎魔"), type = 2,
              genre = 0, phy_aptitude = 1437, pdef_aptitude = 1300,
              hp_aptitude = 1380, magic_aptitude = 1520,
              aspd_aptitude = 1350, base_happy = 7500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60066, 700},
                   {60014, 700},
                   {60053, 600},
                   {60147, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60054,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60145,
                   60146,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 12}], max_wash_time = 32,
              growth_blue = 911, growth_purple = 940,
              growth_orange = 968, growth_red = 996, model_id = 30015,
              model_id1 = 30115, model_id2 = 30215, model_id3 = 30215,
              skin_id_0 = 30015, skin_id_1 = 30115, skin_id_2 = 30215,
              skin_id_3 = 30215, skin_id_s0 = 30315,
              skin_id_s1 = 30415, skin_id_s2 = 30515,
              skin_id_s3 = 30515, manual_level = 65};
get_base(10016) ->
    #pet_base{id = 10016, name = lang:get("功夫熊"), type = 1,
              genre = 0, phy_aptitude = 1515, pdef_aptitude = 1400,
              hp_aptitude = 1450, magic_aptitude = 1290,
              aspd_aptitude = 1400, base_happy = 7500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60093, 700},
                   {60051, 700},
                   {60155, 700},
                   {60038, 700}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60049,
                   60052,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60154],
              cost = [{20006, 12}], max_wash_time = 32,
              growth_blue = 911, growth_purple = 940,
              growth_orange = 968, growth_red = 996, model_id = 30016,
              model_id1 = 30116, model_id2 = 30216, model_id3 = 30216,
              skin_id_0 = 30016, skin_id_1 = 30116, skin_id_2 = 30216,
              skin_id_3 = 30216, skin_id_s0 = 30316,
              skin_id_s1 = 30416, skin_id_s2 = 30516,
              skin_id_s3 = 30516, manual_level = 65};
get_base(10017) ->
    #pet_base{id = 10017, name = lang:get("剑齿虎"), type = 1,
              genre = 0, phy_aptitude = 1530, pdef_aptitude = 1345,
              hp_aptitude = 1400, magic_aptitude = 1312,
              aspd_aptitude = 1450, base_happy = 7500,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60018, 700},
                   {60156, 700},
                   {60060, 700},
                   {60051, 700}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60129,
                   60130,
                   60131,
                   60132,
                   60133,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60145,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 12}], max_wash_time = 32,
              growth_blue = 911, growth_purple = 940,
              growth_orange = 968, growth_red = 996, model_id = 30017,
              model_id1 = 30117, model_id2 = 30217, model_id3 = 30217,
              skin_id_0 = 30017, skin_id_1 = 30117, skin_id_2 = 30217,
              skin_id_3 = 30217, skin_id_s0 = 30317,
              skin_id_s1 = 30417, skin_id_s2 = 30517,
              skin_id_s3 = 30517, manual_level = 65};
get_base(10019) ->
    #pet_base{id = 10019, name = lang:get("石头人"), type = 3,
              genre = 0, phy_aptitude = 1500, pdef_aptitude = 1375,
              hp_aptitude = 1500, magic_aptitude = 1520,
              aspd_aptitude = 1320, base_happy = 7200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60067, 700},
                   {60127, 700},
                   {60069, 700},
                   {60060, 650}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60128,
                   60129,
                   60130,
                   60131,
                   60133,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 18}], max_wash_time = 36,
              growth_blue = 970, growth_purple = 1000,
              growth_orange = 1030, growth_red = 1060,
              model_id = 30019, model_id1 = 30119, model_id2 = 30219,
              model_id3 = 30219, skin_id_0 = 30019, skin_id_1 = 30119,
              skin_id_2 = 30219, skin_id_3 = 30219,
              skin_id_s0 = 30319, skin_id_s1 = 30419,
              skin_id_s2 = 30519, skin_id_s3 = 30519,
              manual_level = 75};
get_base(10021) ->
    #pet_base{id = 10021, name = lang:get("雷暴"), type = 1,
              genre = 0, phy_aptitude = 1350, pdef_aptitude = 1300,
              hp_aptitude = 1400, magic_aptitude = 1550,
              aspd_aptitude = 1450, base_happy = 7200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60068, 700},
                   {60159, 700},
                   {60028, 700},
                   {60049, 700},
                   {60055, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60052,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 18}], max_wash_time = 36,
              growth_blue = 970, growth_purple = 1000,
              growth_orange = 1030, growth_red = 1060,
              model_id = 30021, model_id1 = 30121, model_id2 = 30221,
              model_id3 = 30221, skin_id_0 = 30021, skin_id_1 = 30121,
              skin_id_2 = 30221, skin_id_3 = 30221,
              skin_id_s0 = 30321, skin_id_s1 = 30421,
              skin_id_s2 = 30521, skin_id_s3 = 30521,
              manual_level = 75};
get_base(10022) ->
    #pet_base{id = 10022, name = lang:get("剑灵"), type = 1,
              genre = 0, phy_aptitude = 1550, pdef_aptitude = 1360,
              hp_aptitude = 1410, magic_aptitude = 1280,
              aspd_aptitude = 1450, base_happy = 7200,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60020, 700},
                   {60051, 700},
                   {60045, 700},
                   {60133, 650}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60054,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 18}], max_wash_time = 36,
              growth_blue = 970, growth_purple = 1000,
              growth_orange = 1030, growth_red = 1060,
              model_id = 30022, model_id1 = 30122, model_id2 = 30222,
              model_id3 = 30222, skin_id_0 = 30022, skin_id_1 = 30122,
              skin_id_2 = 30222, skin_id_3 = 30222,
              skin_id_s0 = 30322, skin_id_s1 = 30422,
              skin_id_s2 = 30522, skin_id_s3 = 30522,
              manual_level = 75};
get_base(10023) ->
    #pet_base{id = 10023, name = lang:get("血伯爵"), type = 2,
              genre = 0, phy_aptitude = 1450, pdef_aptitude = 1400,
              hp_aptitude = 1350, magic_aptitude = 1580,
              aspd_aptitude = 1500, base_happy = 7000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60074, 660},
                   {60144, 660},
                   {60056, 660},
                   {60064, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60128,
                   60129,
                   60130,
                   60131,
                   60133,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 22}], max_wash_time = 40,
              growth_blue = 1000, growth_purple = 1030,
              growth_orange = 1060, growth_red = 1090,
              model_id = 30036, model_id1 = 30136, model_id2 = 30236,
              model_id3 = 30236, skin_id_0 = 30036, skin_id_1 = 30136,
              skin_id_2 = 30236, skin_id_3 = 30236,
              skin_id_s0 = 30336, skin_id_s1 = 30436,
              skin_id_s2 = 30536, skin_id_s3 = 30536,
              manual_level = 85};
get_base(10024) ->
    #pet_base{id = 10024, name = lang:get("雷霆战神"), type = 1,
              genre = 0, phy_aptitude = 1580, pdef_aptitude = 1400,
              hp_aptitude = 1400, magic_aptitude = 1300,
              aspd_aptitude = 1430, base_happy = 7000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60075, 660},
                   {60161, 660},
                   {60038, 660},
                   {60030, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60052,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 22}], max_wash_time = 40,
              growth_blue = 1000, growth_purple = 1030,
              growth_orange = 1060, growth_red = 1090,
              model_id = 30038, model_id1 = 30138, model_id2 = 30238,
              model_id3 = 30238, skin_id_0 = 30038, skin_id_1 = 30138,
              skin_id_2 = 30238, skin_id_3 = 30238,
              skin_id_s0 = 30338, skin_id_s1 = 30438,
              skin_id_s2 = 30538, skin_id_s3 = 30538,
              manual_level = 85};
get_base(10025) ->
    #pet_base{id = 10025, name = lang:get("月光女神"), type = 1,
              genre = 0, phy_aptitude = 1510, pdef_aptitude = 1480,
              hp_aptitude = 1520, magic_aptitude = 1360,
              aspd_aptitude = 1480, base_happy = 7000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60019, 660},
                   {60127, 660},
                   {60126, 660},
                   {60029, 600},
                   {60054, 580}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 22}], max_wash_time = 40,
              growth_blue = 1000, growth_purple = 1030,
              growth_orange = 1060, growth_red = 1090,
              model_id = 30039, model_id1 = 30139, model_id2 = 30239,
              model_id3 = 30239, skin_id_0 = 30039, skin_id_1 = 30139,
              skin_id_2 = 30239, skin_id_3 = 30239,
              skin_id_s0 = 30339, skin_id_s1 = 30439,
              skin_id_s2 = 30539, skin_id_s3 = 30539,
              manual_level = 85};
get_base(10026) ->
    #pet_base{id = 10026, name = lang:get("蝴蝶花姬"), type = 2,
              genre = 0, phy_aptitude = 1300, pdef_aptitude = 1500,
              hp_aptitude = 1450, magic_aptitude = 1600,
              aspd_aptitude = 1450, base_happy = 6700,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60084, 600},
                   {60512, 560},
                   {60172, 600},
                   {60043, 600},
                   {60160, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60128,
                   60129,
                   60130,
                   60131,
                   60133,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 26}], max_wash_time = 45,
              growth_blue = 1030, growth_purple = 1060,
              growth_orange = 1090, growth_red = 1120,
              model_id = 30043, model_id1 = 30143, model_id2 = 30243,
              model_id3 = 30243, skin_id_0 = 30043, skin_id_1 = 30143,
              skin_id_2 = 30243, skin_id_3 = 30243,
              skin_id_s0 = 30343, skin_id_s1 = 30443,
              skin_id_s2 = 30543, skin_id_s3 = 30543,
              manual_level = 95};
get_base(10027) ->
    #pet_base{id = 10027, name = lang:get("死亡骑士"), type = 3,
              genre = 0, phy_aptitude = 1530, pdef_aptitude = 1520,
              hp_aptitude = 1480, magic_aptitude = 1380,
              aspd_aptitude = 1550, base_happy = 6700,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60085, 600},
                   {60104, 600},
                   {60040, 600},
                   {60052, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              cost = [{20006, 26}], max_wash_time = 45,
              growth_blue = 1030, growth_purple = 1060,
              growth_orange = 1090, growth_red = 1120,
              model_id = 30042, model_id1 = 30142, model_id2 = 30242,
              model_id3 = 30242, skin_id_0 = 30042, skin_id_1 = 30142,
              skin_id_2 = 30242, skin_id_3 = 30242,
              skin_id_s0 = 30342, skin_id_s1 = 30442,
              skin_id_s2 = 30542, skin_id_s3 = 30542,
              manual_level = 95};
get_base(10028) ->
    #pet_base{id = 10028, name = lang:get("幻影剑客"), type = 1,
              genre = 0, phy_aptitude = 1600, pdef_aptitude = 1450,
              hp_aptitude = 1500, magic_aptitude = 1300,
              aspd_aptitude = 1460, base_happy = 6700,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60019, 600},
                   {60086, 600},
                   {60145, 600},
                   {60064, 600},
                   {60054, 560}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 26}], max_wash_time = 45,
              growth_blue = 1030, growth_purple = 1060,
              growth_orange = 1090, growth_red = 1120,
              model_id = 30044, model_id1 = 30144, model_id2 = 30244,
              model_id3 = 30244, skin_id_0 = 30044, skin_id_1 = 30144,
              skin_id_2 = 30244, skin_id_3 = 30244,
              skin_id_s0 = 30344, skin_id_s1 = 30444,
              skin_id_s2 = 30544, skin_id_s3 = 30544,
              manual_level = 95};
get_base(10029) ->
    #pet_base{id = 10029, name = lang:get("龙魂猎人"), type = 1,
              genre = 0, phy_aptitude = 1620, pdef_aptitude = 1450,
              hp_aptitude = 1420, magic_aptitude = 1400,
              aspd_aptitude = 1440, base_happy = 6400,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60088, 540},
                   {60136, 540},
                   {60138, 540},
                   {60004, 540},
                   {60003, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60089], cost = [{20006, 32}],
              lev_break_cost = [{20036, 10}], max_wash_time = 50,
              growth_blue = 1060, growth_purple = 1090,
              growth_orange = 1120, growth_red = 1150,
              model_id = 30047, model_id1 = 30147, model_id2 = 30247,
              model_id3 = 30247, skin_id_0 = 30047, skin_id_1 = 30147,
              skin_id_2 = 30247, skin_id_3 = 30247,
              skin_id_s0 = 30347, skin_id_s1 = 30447,
              skin_id_s2 = 30547, skin_id_s3 = 30547,
              manual_level = 95};
get_base(10030) ->
    #pet_base{id = 10030, name = lang:get("石灵儿"), type = 2,
              genre = 0, phy_aptitude = 1400, pdef_aptitude = 1450,
              hp_aptitude = 1420, magic_aptitude = 1620,
              aspd_aptitude = 1520, base_happy = 6400,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60090, 540},
                   {60159, 540},
                   {60155, 540},
                   {60056, 540},
                   {60030, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60091], cost = [{20006, 32}],
              lev_break_cost = [{20036, 10}], max_wash_time = 50,
              growth_blue = 1060, growth_purple = 1090,
              growth_orange = 1120, growth_red = 1150,
              model_id = 30048, model_id1 = 30148, model_id2 = 30248,
              model_id3 = 30248, skin_id_0 = 30048, skin_id_1 = 30148,
              skin_id_2 = 30248, skin_id_3 = 30248,
              skin_id_s0 = 30348, skin_id_s1 = 30448,
              skin_id_s2 = 30548, skin_id_s3 = 30548,
              manual_level = 95};
get_base(10031) ->
    #pet_base{id = 10031, name = lang:get("绯月剑心"), type = 1,
              genre = 0, phy_aptitude = 1650, pdef_aptitude = 1450,
              hp_aptitude = 1460, magic_aptitude = 1420,
              aspd_aptitude = 1450, base_happy = 6100,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60098, 540},
                   {60137, 540},
                   {60133, 540},
                   {60038, 540},
                   {60021, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60500], cost = [{20006, 38}],
              lev_break_cost = [{21230, 10}], max_wash_time = 55,
              growth_blue = 1090, growth_purple = 1120,
              growth_orange = 1150, growth_red = 1180,
              model_id = 30051, model_id1 = 30151, model_id2 = 30251,
              model_id3 = 30251, skin_id_0 = 30051, skin_id_1 = 30151,
              skin_id_2 = 30251, skin_id_3 = 30251,
              skin_id_s0 = 30351, skin_id_s1 = 30451,
              skin_id_s2 = 30551, skin_id_s3 = 30551,
              manual_level = 105};
get_base(10032) ->
    #pet_base{id = 10032, name = lang:get("灯魂公主"), type = 2,
              genre = 0, phy_aptitude = 1450, pdef_aptitude = 1500,
              hp_aptitude = 1500, magic_aptitude = 1640,
              aspd_aptitude = 1330, base_happy = 6100,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60099, 540},
                   {60143, 540},
                   {60130, 540},
                   {60059, 540},
                   {60045, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60501], cost = [{20006, 38}],
              lev_break_cost = [{21231, 10}], max_wash_time = 55,
              growth_blue = 1090, growth_purple = 1120,
              growth_orange = 1150, growth_red = 1180,
              model_id = 30052, model_id1 = 30152, model_id2 = 30252,
              model_id3 = 30252, skin_id_0 = 30052, skin_id_1 = 30152,
              skin_id_2 = 30252, skin_id_3 = 30252,
              skin_id_s0 = 30352, skin_id_s1 = 30452,
              skin_id_s2 = 30552, skin_id_s3 = 30552,
              manual_level = 105};
get_base(10033) ->
    #pet_base{id = 10033, name = lang:get("绝地武士"), type = 1,
              genre = 0, phy_aptitude = 1660, pdef_aptitude = 1460,
              hp_aptitude = 1480, magic_aptitude = 1500,
              aspd_aptitude = 1460, base_happy = 5800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60507, 540},
                   {60019, 540},
                   {60151, 540},
                   {60036, 540},
                   {60052, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60509], cost = [{20006, 40}],
              lev_break_cost = [{20036, 15}], max_wash_time = 60,
              growth_blue = 1120, growth_purple = 1150,
              growth_orange = 1180, growth_red = 1210,
              model_id = 30054, model_id1 = 30154, model_id2 = 30254,
              model_id3 = 30254, skin_id_0 = 30054, skin_id_1 = 30154,
              skin_id_2 = 30254, skin_id_3 = 30254,
              skin_id_s0 = 30354, skin_id_s1 = 30454,
              skin_id_s2 = 30554, skin_id_s3 = 30554,
              manual_level = 110};
get_base(10034) ->
    #pet_base{id = 10034, name = lang:get("奇幻精灵"), type = 2,
              genre = 0, phy_aptitude = 1450, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1660,
              aspd_aptitude = 1450, base_happy = 5800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60508, 540},
                   {60142, 540},
                   {60157, 540},
                   {60055, 540},
                   {60030, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60510], cost = [{20006, 40}],
              lev_break_cost = [{20036, 15}], max_wash_time = 60,
              growth_blue = 1120, growth_purple = 1150,
              growth_orange = 1180, growth_red = 1210,
              model_id = 30055, model_id1 = 30155, model_id2 = 30255,
              model_id3 = 30255, skin_id_0 = 30055, skin_id_1 = 30155,
              skin_id_2 = 30255, skin_id_3 = 30255,
              skin_id_s0 = 30355, skin_id_s1 = 30455,
              skin_id_s2 = 30555, skin_id_s3 = 30555,
              manual_level = 110};
get_base(10035) ->
    #pet_base{id = 10035, name = lang:get("幽冥行者"), type = 1,
              genre = 0, phy_aptitude = 1670, pdef_aptitude = 1500,
              hp_aptitude = 1460, magic_aptitude = 1400,
              aspd_aptitude = 1620, base_happy = 5800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60521, 540},
                   {60131, 540},
                   {60137, 540},
                   {60040, 540},
                   {60030, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60029,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60039,
                   60041,
                   60042,
                   60043,
                   60044,
                   60045,
                   60046,
                   60047,
                   60048,
                   60050,
                   60051,
                   60053,
                   60054,
                   60101,
                   60102,
                   60103,
                   60105,
                   60106,
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
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
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
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60522], cost = [{20006, 42}],
              lev_break_cost = [{21234, 10}], max_wash_time = 65,
              growth_blue = 1150, growth_purple = 1180,
              growth_orange = 1210, growth_red = 1240,
              model_id = 30059, model_id1 = 30159, model_id2 = 30259,
              model_id3 = 30259, skin_id_0 = 30059, skin_id_1 = 30159,
              skin_id_2 = 30259, skin_id_3 = 30259,
              skin_id_s0 = 30359, skin_id_s1 = 30459,
              skin_id_s2 = 30559, skin_id_s3 = 30559,
              manual_level = 120};
get_base(10036) ->
    #pet_base{id = 10036, name = lang:get("冰晶女王"), type = 2,
              genre = 0, phy_aptitude = 1400, pdef_aptitude = 1620,
              hp_aptitude = 1450, magic_aptitude = 1670,
              aspd_aptitude = 1400, base_happy = 5800,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60523, 540},
                   {60524, 540},
                   {60143, 540},
                   {60055, 540},
                   {60029, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60525], cost = [{20006, 42}],
              lev_break_cost = [{21235, 10}], max_wash_time = 65,
              growth_blue = 1150, growth_purple = 1180,
              growth_orange = 1210, growth_red = 1240,
              model_id = 30060, model_id1 = 30160, model_id2 = 30260,
              model_id3 = 30260, skin_id_0 = 30060, skin_id_1 = 30160,
              skin_id_2 = 30260, skin_id_3 = 30260,
              skin_id_s0 = 30360, skin_id_s1 = 30460,
              skin_id_s2 = 30560, skin_id_s3 = 30560,
              manual_level = 120};
get_base(10037) ->
    #pet_base{id = 10037, name = lang:get("镜仙"), type = 1,
              genre = 5, phy_aptitude = 1500, pdef_aptitude = 1450,
              hp_aptitude = 1480, magic_aptitude = 1500,
              aspd_aptitude = 1480, base_happy = 10000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60533, 600},
                   {60130, 600},
                   {60157, 600},
                   {60061, 600}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 24}], max_wash_time = 45,
              growth_blue = 1100, growth_purple = 1100,
              growth_orange = 1100, growth_red = 1100,
              model_id = 30061, model_id1 = 30161, model_id2 = 30161,
              model_id3 = 30161, skin_id_0 = 30061, skin_id_1 = 30161,
              skin_id_2 = 30161, skin_id_3 = 30161,
              skin_id_s0 = 30261, skin_id_s1 = 30361,
              skin_id_s2 = 30361, skin_id_s3 = 30361,
              manual_level = 90};
get_base(10038) ->
    #pet_base{id = 10038, name = lang:get("莉莉安"), type = 1,
              genre = 5, phy_aptitude = 1300, pdef_aptitude = 1450,
              hp_aptitude = 1550, magic_aptitude = 1450,
              aspd_aptitude = 1600, base_happy = 10000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60557, 660},
                   {60016, 660},
                   {60558, 660},
                   {60041, 600},
                   {60056, 580}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              cost = [{20006, 22}], max_wash_time = 40,
              growth_blue = 1000, growth_purple = 1030,
              growth_orange = 1060, growth_red = 1090,
              model_id = 30066, model_id1 = 30166, model_id2 = 30166,
              model_id3 = 30166, skin_id_0 = 30066, skin_id_1 = 30166,
              skin_id_2 = 30166, skin_id_3 = 30166,
              skin_id_s0 = 30266, skin_id_s1 = 30366,
              skin_id_s2 = 30366, skin_id_s3 = 30366,
              manual_level = 85};
get_base(10039) ->
    #pet_base{id = 10039, name = lang:get("雪岭之王"), type = 2,
              genre = 0, phy_aptitude = 1550, pdef_aptitude = 1650,
              hp_aptitude = 1650, magic_aptitude = 1350,
              aspd_aptitude = 1350, base_happy = 10000,
              min_happy_ratio = 850, max_happy_ratio = 1000,
              min_happy_genre_ratio = 900,
              max_happy_genre_ratio = 1100,
              base_skills =
                  [{60067, 540},
                   {60019, 540},
                   {60129, 540},
                   {60559, 540},
                   {60057, 540}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
                   60042,
                   60043,
                   60044,
                   60046,
                   60047,
                   60048,
                   60049,
                   60050,
                   60052,
                   60053,
                   60055,
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60128,
                   60129,
                   60130,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60137,
                   60138,
                   60139,
                   60140,
                   60141,
                   60142,
                   60143,
                   60144,
                   60146,
                   60147,
                   60148,
                   60149,
                   60150,
                   60151,
                   60152,
                   60153,
                   60154,
                   60155],
              need_lev_break = 1, has_break_skill = 1,
              lev_break_skills = [60560], cost = [{20006, 40}],
              lev_break_cost = [{20036, 15}], max_wash_time = 60,
              growth_blue = 1140, growth_purple = 1170,
              growth_orange = 1200, growth_red = 1230,
              model_id = 30065, model_id1 = 30165, model_id2 = 30165,
              model_id3 = 30165, skin_id_0 = 30065, skin_id_1 = 30165,
              skin_id_2 = 30165, skin_id_3 = 30165,
              skin_id_s0 = 30265, skin_id_s1 = 30365,
              skin_id_s2 = 30365, skin_id_s3 = 30365,
              manual_level = 115};
get_base(20000) ->
    #pet_base{id = 20000, name = lang:get("天使飞猪"), type = 1,
              genre = 2, phy_aptitude = 1565, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1450,
              aspd_aptitude = 1500, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60137, 1000},
                   {60139, 1000},
                   {60030, 1000},
                   {60133, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 10}], max_wash_time = 0,
              growth_blue = 1060, growth_purple = 1060,
              growth_orange = 1060, growth_red = 1060,
              model_id = 30027, model_id1 = 30127, model_id2 = 30227,
              model_id3 = 30227, skin_id_0 = 30027, skin_id_1 = 30127,
              skin_id_2 = 30227, skin_id_3 = 30227,
              skin_id_s0 = 30027, skin_id_s1 = 30127,
              skin_id_s2 = 30227, skin_id_s3 = 30227,
              manual_level = 1};
get_base(20001) ->
    #pet_base{id = 20001, name = lang:get("南瓜君"), type = 1,
              genre = 2, phy_aptitude = 1555, pdef_aptitude = 1460,
              hp_aptitude = 1480, magic_aptitude = 1450,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60018, 1000},
                   {60136, 1000},
                   {60129, 1000},
                   {60056, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 10}], max_wash_time = 0,
              growth_blue = 1060, growth_purple = 1060,
              growth_orange = 1060, growth_red = 1060,
              model_id = 30029, model_id1 = 30129, model_id2 = 30229,
              model_id3 = 30229, skin_id_0 = 30029, skin_id_1 = 30129,
              skin_id_2 = 30229, skin_id_3 = 30229,
              skin_id_s0 = 30029, skin_id_s1 = 30129,
              skin_id_s2 = 30229, skin_id_s3 = 30229,
              manual_level = 1};
get_base(20004) ->
    #pet_base{id = 20004, name = lang:get("美猴王"), type = 1,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1500,
              hp_aptitude = 1500, magic_aptitude = 1500,
              aspd_aptitude = 1500, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60073, 1000},
                   {60151, 1000},
                   {60154, 1000},
                   {60044, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 10}], max_wash_time = 0,
              growth_blue = 1060, growth_purple = 1060,
              growth_orange = 1060, growth_red = 1060,
              model_id = 30037, model_id1 = 30137, model_id2 = 30237,
              model_id3 = 30237, skin_id_0 = 30037, skin_id_1 = 30137,
              skin_id_2 = 30237, skin_id_3 = 30237,
              skin_id_s0 = 30037, skin_id_s1 = 30137,
              skin_id_s2 = 30237, skin_id_s3 = 30237,
              manual_level = 1};
get_base(20002) ->
    #pet_base{id = 20002, name = lang:get("皎月兔"), type = 1,
              genre = 4, phy_aptitude = 1520, pdef_aptitude = 1400,
              hp_aptitude = 1420, magic_aptitude = 1420,
              aspd_aptitude = 1430, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60019, 1000},
                   {60151, 1000},
                   {60040, 1000},
                   {60044, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 10}], max_wash_time = 0,
              growth_blue = 1000, growth_purple = 1000,
              growth_orange = 1000, growth_red = 1000,
              model_id = 30028, model_id1 = 30128, model_id2 = 30228,
              model_id3 = 30228, skin_id_0 = 30028, skin_id_1 = 30128,
              skin_id_2 = 30228, skin_id_3 = 30228,
              skin_id_s0 = 30028, skin_id_s1 = 30128,
              skin_id_s2 = 30228, skin_id_s3 = 30228,
              manual_level = 1};
get_base(20003) ->
    #pet_base{id = 20003, name = lang:get("糖糖"), type = 2,
              genre = 4, phy_aptitude = 1400, pdef_aptitude = 1400,
              hp_aptitude = 1420, magic_aptitude = 1520,
              aspd_aptitude = 1420, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60015, 1000},
                   {60159, 1000},
                   {60161, 1000},
                   {60052, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
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
                   60155],
              cost = [{20006, 10}], max_wash_time = 0,
              growth_blue = 1000, growth_purple = 1000,
              growth_orange = 1000, growth_red = 1000,
              model_id = 30032, model_id1 = 30132, model_id2 = 30232,
              model_id3 = 30232, skin_id_0 = 30032, skin_id_1 = 30132,
              skin_id_2 = 30232, skin_id_3 = 30232,
              skin_id_s0 = 30032, skin_id_s1 = 30132,
              skin_id_s2 = 30232, skin_id_s3 = 30232,
              manual_level = 1};
get_base(20005) ->
    #pet_base{id = 20005, name = lang:get("精灵龙"), type = 2,
              genre = 2, phy_aptitude = 1480, pdef_aptitude = 1520,
              hp_aptitude = 1480, magic_aptitude = 1570,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60087, 1000},
                   {60143, 1000},
                   {60130, 1000},
                   {60041, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60094],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30046, model_id1 = 30146,
              model_id2 = 30246, model_id3 = 30246, skin_id_0 = 30046,
              skin_id_1 = 30146, skin_id_2 = 30246, skin_id_3 = 30246,
              skin_id_s0 = 30046, skin_id_s1 = 30146,
              skin_id_s2 = 30246, skin_id_s3 = 30246,
              manual_level = 1};
get_base(20006) ->
    #pet_base{id = 20006, name = lang:get("天凤凰"), type = 1,
              genre = 2, phy_aptitude = 1570, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1480,
              aspd_aptitude = 1520, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60096, 1000},
                   {60139, 1000},
                   {60101, 1000},
                   {60054, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60095],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30050, model_id1 = 30150,
              model_id2 = 30250, model_id3 = 30250, skin_id_0 = 30050,
              skin_id_1 = 30150, skin_id_2 = 30250, skin_id_3 = 30250,
              skin_id_s0 = 30050, skin_id_s1 = 30150,
              skin_id_s2 = 30250, skin_id_s3 = 30250,
              manual_level = 1};
get_base(20007) ->
    #pet_base{id = 20007, name = lang:get("神马浮云"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1590,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60505, 1000},
                   {60141, 1000},
                   {60129, 1000},
                   {60045, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60504],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30053, model_id1 = 30153,
              model_id2 = 30253, model_id3 = 30253, skin_id_0 = 30053,
              skin_id_1 = 30153, skin_id_2 = 30253, skin_id_3 = 30253,
              skin_id_s0 = 30053, skin_id_s1 = 30153,
              skin_id_s2 = 30253, skin_id_s3 = 30253,
              manual_level = 1};
get_base(20008) ->
    #pet_base{id = 20008, name = lang:get("自然之灵"), type = 1,
              genre = 6, phy_aptitude = 888, pdef_aptitude = 888,
              hp_aptitude = 888, magic_aptitude = 888,
              aspd_aptitude = 888, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000, cost = [{20006, 1}],
              max_wash_time = 10, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 40071, model_id1 = 40071,
              model_id2 = 40071, model_id3 = 40071, skin_id_0 = 40071,
              skin_id_1 = 40071, skin_id_2 = 40071, skin_id_3 = 40071,
              skin_id_s0 = 40071, skin_id_s1 = 40071,
              skin_id_s2 = 40071, skin_id_s3 = 40071,
              manual_level = 1};
get_base(20009) ->
    #pet_base{id = 20009, name = lang:get("自然神孕"), type = 1,
              genre = 6, phy_aptitude = 888, pdef_aptitude = 888,
              hp_aptitude = 888, magic_aptitude = 888,
              aspd_aptitude = 888, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000, cost = [{20006, 1}],
              max_wash_time = 10, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 40171, model_id1 = 40171,
              model_id2 = 40171, model_id3 = 40171, skin_id_0 = 40171,
              skin_id_1 = 40171, skin_id_2 = 40171, skin_id_3 = 40171,
              skin_id_s0 = 40171, skin_id_s1 = 40171,
              skin_id_s2 = 40171, skin_id_s3 = 40171,
              manual_level = 1};
get_base(20010) ->
    #pet_base{id = 20010, name = lang:get("熊猫大侠"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1500,
              hp_aptitude = 1500, magic_aptitude = 1450,
              aspd_aptitude = 1500, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60514, 1000},
                   {60137, 1000},
                   {60140, 1000},
                   {60022, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60517],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30057, model_id1 = 30157,
              model_id2 = 30257, model_id3 = 30257, skin_id_0 = 30057,
              skin_id_1 = 30157, skin_id_2 = 30257, skin_id_3 = 30257,
              skin_id_s0 = 30057, skin_id_s1 = 30157,
              skin_id_s2 = 30257, skin_id_s3 = 30257,
              manual_level = 1};
get_base(20011) ->
    #pet_base{id = 20011, name = lang:get("熊猫大侠"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1500,
              hp_aptitude = 1500, magic_aptitude = 1450,
              aspd_aptitude = 1500, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60999, 1000},
                   {60137, 1000},
                   {60140, 1000},
                   {60022, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60998],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30057, model_id1 = 30157,
              model_id2 = 30257, model_id3 = 30257, skin_id_0 = 30057,
              skin_id_1 = 30157, skin_id_2 = 30257, skin_id_3 = 30257,
              skin_id_s0 = 30057, skin_id_s1 = 30157,
              skin_id_s2 = 30257, skin_id_s3 = 30257,
              manual_level = 1};
get_base(20012) ->
    #pet_base{id = 20012, name = lang:get("鲸鱼公主"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1500,
              hp_aptitude = 1470, magic_aptitude = 1600,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60518, 1000},
                   {60142, 1000},
                   {60163, 1000},
                   {60043, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60520],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30058, model_id1 = 30158,
              model_id2 = 30258, model_id3 = 30258, skin_id_0 = 30058,
              skin_id_1 = 30158, skin_id_2 = 30258, skin_id_3 = 30258,
              skin_id_s0 = 30058, skin_id_s1 = 30158,
              skin_id_s2 = 30258, skin_id_s3 = 30258,
              manual_level = 1};
get_base(20013) ->
    #pet_base{id = 20013, name = lang:get("鸿福兔纸"), type = 1,
              genre = 6, phy_aptitude = 888, pdef_aptitude = 888,
              hp_aptitude = 888, magic_aptitude = 888,
              aspd_aptitude = 888, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000, cost = [{20006, 1}],
              max_wash_time = 10, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 40071, model_id1 = 40171,
              model_id2 = 40171, model_id3 = 40171, skin_id_0 = 40071,
              skin_id_1 = 40171, skin_id_2 = 40171, skin_id_3 = 40171,
              skin_id_s0 = 40071, skin_id_s1 = 40171,
              skin_id_s2 = 40171, skin_id_s3 = 40171,
              manual_level = 1};
get_base(20014) ->
    #pet_base{id = 20014, name = lang:get("瑞兔送福"), type = 1,
              genre = 6, phy_aptitude = 888, pdef_aptitude = 888,
              hp_aptitude = 888, magic_aptitude = 888,
              aspd_aptitude = 888, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000, cost = [{20006, 1}],
              max_wash_time = 10, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 40171, model_id1 = 40171,
              model_id2 = 40171, model_id3 = 40171, skin_id_0 = 40171,
              skin_id_1 = 40171, skin_id_2 = 40171, skin_id_3 = 40171,
              skin_id_s0 = 40171, skin_id_s1 = 40171,
              skin_id_s2 = 40171, skin_id_s3 = 40171,
              manual_level = 1};
get_base(20015) ->
    #pet_base{id = 20015, name = lang:get("鲸鱼公主"), type = 1,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1500,
              hp_aptitude = 1470, magic_aptitude = 1600,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60999, 1000},
                   {60142, 1000},
                   {60163, 1000},
                   {60043, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60998],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30058, model_id1 = 30158,
              model_id2 = 30258, model_id3 = 30258, skin_id_0 = 30058,
              skin_id_1 = 30158, skin_id_2 = 30258, skin_id_3 = 30258,
              skin_id_s0 = 30058, skin_id_s1 = 30158,
              skin_id_s2 = 30258, skin_id_s3 = 30258,
              manual_level = 1};
get_base(20016) ->
    #pet_base{id = 20016, name = lang:get("惩戒狮皇"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1500,
              hp_aptitude = 1480, magic_aptitude = 1450,
              aspd_aptitude = 1520, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60534, 1000},
                   {60137, 1000},
                   {60145, 1000},
                   {60051, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60535],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30062, model_id1 = 30162,
              model_id2 = 30262, model_id3 = 30262, skin_id_0 = 30062,
              skin_id_1 = 30162, skin_id_2 = 30262, skin_id_3 = 30262,
              skin_id_s0 = 30062, skin_id_s1 = 30162,
              skin_id_s2 = 30262, skin_id_s3 = 30262,
              manual_level = 1};
get_base(20017) ->
    #pet_base{id = 20017, name = lang:get("惩戒狮皇"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1500,
              hp_aptitude = 1480, magic_aptitude = 1450,
              aspd_aptitude = 1520, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60999, 1000},
                   {60137, 1000},
                   {60145, 1000},
                   {60051, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60998],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30062, model_id1 = 30162,
              model_id2 = 30262, model_id3 = 30262, skin_id_0 = 30062,
              skin_id_1 = 30162, skin_id_2 = 30262, skin_id_3 = 30262,
              skin_id_s0 = 30062, skin_id_s1 = 30162,
              skin_id_s2 = 30262, skin_id_s3 = 30262,
              manual_level = 1};
get_base(20018) ->
    #pet_base{id = 20018, name = lang:get("爱丽丝"), type = 2,
              genre = 2, phy_aptitude = 1470, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1600,
              aspd_aptitude = 1500, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60549, 1000},
                   {60143, 1000},
                   {60155, 1000},
                   {60030, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60554],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30063, model_id1 = 30163,
              model_id2 = 30263, model_id3 = 30263, skin_id_0 = 30063,
              skin_id_1 = 30163, skin_id_2 = 30263, skin_id_3 = 30263,
              skin_id_s0 = 30063, skin_id_s1 = 30163,
              skin_id_s2 = 30263, skin_id_s3 = 30263,
              manual_level = 1};
get_base(20019) ->
    #pet_base{id = 20019, name = lang:get("爱丽丝"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1500,
              hp_aptitude = 1470, magic_aptitude = 1600,
              aspd_aptitude = 1480, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60999, 1000},
                   {60143, 1000},
                   {60155, 1000},
                   {60030, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60998],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30063, model_id1 = 30163,
              model_id2 = 30263, model_id3 = 30263, skin_id_0 = 30063,
              skin_id_1 = 30163, skin_id_2 = 30263, skin_id_3 = 30263,
              skin_id_s0 = 30063, skin_id_s1 = 30163,
              skin_id_s2 = 30263, skin_id_s3 = 30263,
              manual_level = 1};
get_base(20020) ->
    #pet_base{id = 20020, name = lang:get("爆烈少女"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1400,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60555, 1000},
                   {60138, 1000},
                   {60136, 1000},
                   {60001, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60556],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30064, model_id1 = 30164,
              model_id2 = 30264, model_id3 = 30264, skin_id_0 = 30064,
              skin_id_1 = 30164, skin_id_2 = 30264, skin_id_3 = 30264,
              skin_id_s0 = 30064, skin_id_s1 = 30164,
              skin_id_s2 = 30264, skin_id_s3 = 30264,
              manual_level = 1};
get_base(20021) ->
    #pet_base{id = 20021, name = lang:get("爆烈少女"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1480,
              hp_aptitude = 1500, magic_aptitude = 1400,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills =
                  [{60999, 1000},
                   {60138, 1000},
                   {60136, 1000},
                   {60001, 1000}],
              vari_skills =
                  [60001,
                   60002,
                   60003,
                   60004,
                   60005,
                   60006,
                   60011,
                   60012,
                   60013,
                   60026,
                   60027,
                   60028,
                   60029,
                   60030,
                   60031,
                   60033,
                   60034,
                   60035,
                   60036,
                   60037,
                   60038,
                   60039,
                   60040,
                   60041,
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
                   60101,
                   60102,
                   60103,
                   60104,
                   60105,
                   60106,
                   60126,
                   60127,
                   60128,
                   60129,
                   60131,
                   60132,
                   60134,
                   60135,
                   60136,
                   60138,
                   60140,
                   60141,
                   60142,
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
                   60155],
              has_break_skill = 1, lev_break_skills = [60998],
              cost = [{20006, 10}], lev_break_cost = [{22205, 3}],
              max_wash_time = 0, growth_blue = 1100,
              growth_purple = 1100, growth_orange = 1100,
              growth_red = 1100, model_id = 30064, model_id1 = 30164,
              model_id2 = 30264, model_id3 = 30264, skin_id_0 = 30064,
              skin_id_1 = 30164, skin_id_2 = 30264, skin_id_3 = 30264,
              skin_id_s0 = 30064, skin_id_s1 = 30164,
              skin_id_s2 = 30264, skin_id_s3 = 30264,
              manual_level = 1};
get_base(20022) ->
    #pet_base{id = 20022, name = lang:get("天启霸主"), type = 1,
              genre = 2, phy_aptitude = 1650, pdef_aptitude = 1650,
              hp_aptitude = 1650, magic_aptitude = 1650,
              aspd_aptitude = 1650, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60088, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60089],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 3}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 41034, model_id1 = 41034,
              model_id2 = 41034, model_id3 = 41034, skin_id_0 = 41034,
              skin_id_1 = 41034, skin_id_2 = 41034, skin_id_3 = 41034,
              skin_id_s0 = 41034, skin_id_s1 = 41034,
              skin_id_s2 = 41034, skin_id_s3 = 41034,
              need_lev_break = 0, manual_level = 1};
get_base(20023) ->
    #pet_base{id = 20023, name = lang:get("天启霸主"), type = 1,
              genre = 2, phy_aptitude = 1650, pdef_aptitude = 1650,
              hp_aptitude = 1650, magic_aptitude = 1650,
              aspd_aptitude = 1650, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60088, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60998],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 3}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 41034, model_id1 = 41034,
              model_id2 = 41034, model_id3 = 41034, skin_id_0 = 41034,
              skin_id_1 = 41034, skin_id_2 = 41034, skin_id_3 = 41034,
              skin_id_s0 = 41034, skin_id_s1 = 41034,
              skin_id_s2 = 41034, skin_id_s3 = 41034,
              need_lev_break = 0, manual_level = 1};
get_base(20024) ->
    #pet_base{id = 20024, name = lang:get("星辰龙王"), type = 2,
              genre = 2, phy_aptitude = 1550, pdef_aptitude = 1500,
              hp_aptitude = 1520, magic_aptitude = 1620,
              aspd_aptitude = 1520, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60090, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60143, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60091],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 3}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 30746, model_id1 = 30746,
              model_id2 = 30746, model_id3 = 30746, skin_id_0 = 30746,
              skin_id_1 = 30746, skin_id_2 = 30746, skin_id_3 = 30746,
              skin_id_s0 = 30746, skin_id_s1 = 30746,
              skin_id_s2 = 30746, skin_id_s3 = 30746,
              need_lev_break = 0, manual_level = 1};
get_base(20025) ->
    #pet_base{id = 20025, name = lang:get("星辰龙王"), type = 2,
              genre = 2, phy_aptitude = 1570, pdef_aptitude = 1580,
              hp_aptitude = 1600, magic_aptitude = 1700,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60090, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60143, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60998],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 3}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 30746, model_id1 = 30746,
              model_id2 = 30746, model_id3 = 30746, skin_id_0 = 30746,
              skin_id_1 = 30746, skin_id_2 = 30746, skin_id_3 = 30746,
              skin_id_s0 = 30746, skin_id_s1 = 30746,
              skin_id_s2 = 30746, skin_id_s3 = 30746,
              need_lev_break = 0, manual_level = 1};
get_base(20026) ->
    #pet_base{id = 20026, name = lang:get("绝地武士"), type = 1,
              genre = 2, phy_aptitude = 1620, pdef_aptitude = 1500,
              hp_aptitude = 1520, magic_aptitude = 1400,
              aspd_aptitude = 1570, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60565, 1000},
                  {60566, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60522],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 30054, model_id1 = 30154,
              model_id2 = 30254, model_id3 = 30254, skin_id_0 = 30054,
              skin_id_1 = 30154, skin_id_2 = 30254, skin_id_3 = 30254,
              skin_id_s0 = 30354, skin_id_s1 = 30454,
              skin_id_s2 = 30554, skin_id_s3 = 30554,
              need_lev_break = 0, manual_level = 1};
get_base(20027) ->
    #pet_base{id = 20027, name = lang:get("毁灭巨龙·法功"), type = 2,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1750,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60561, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60143, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60562],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1160,
              growth_purple = 1160, growth_orange = 1160,
              growth_red = 1160, model_id = 71114, model_id1 = 71114,
              model_id2 = 71114, model_id3 = 71114, skin_id_0 = 71114,
              skin_id_1 = 71114, skin_id_2 = 71114, skin_id_3 = 71114,
              skin_id_s0 = 71114, skin_id_s1 = 71114,
              skin_id_s2 = 71114, skin_id_s3 = 71114,
              need_lev_break = 0, manual_level = 1};
get_base(20028) ->
    #pet_base{id = 20028, name = lang:get("噬魂灵姬"), type = 2,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
              hp_aptitude = 1600, magic_aptitude = 1600,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60662, 1000},
                  {60533, 1000},
                  {60141, 1000},
                  {60156, 1000},
                  {60106, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60663],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 30067, model_id1 = 30167,
              model_id2 = 30267, model_id3 = 30267, skin_id_0 = 30067,
              skin_id_1 = 30167, skin_id_2 = 30267, skin_id_3 = 30267,
              skin_id_s0 = 30067, skin_id_s1 = 30167,
              skin_id_s2 = 30267, skin_id_s3 = 30267,
              need_lev_break = 0, manual_level = 1};
get_base(20029) ->
    #pet_base{id = 20029, name = lang:get("噬魂灵姬"), type = 2,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
              hp_aptitude = 1600, magic_aptitude = 1600,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60662, 1000},
                  {60533, 1000},
                  {60141, 1000},
                  {60156, 1000},
                  {60106, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60663],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1115,
              growth_purple = 1115, growth_orange = 1115,
              growth_red = 1115, model_id = 30067, model_id1 = 30167,
              model_id2 = 30267, model_id3 = 30267, skin_id_0 = 30067,
              skin_id_1 = 30167, skin_id_2 = 30267, skin_id_3 = 30267,
              skin_id_s0 = 30067, skin_id_s1 = 30167,
              skin_id_s2 = 30267, skin_id_s3 = 30267,
              need_lev_break = 0, manual_level = 1};
get_base(20030) ->
    #pet_base{id = 20030, name = lang:get("毁灭巨龙·物攻"), type = 1,
              genre = 2, phy_aptitude = 1800, pdef_aptitude = 1800,
              hp_aptitude = 1800, magic_aptitude = 1800,
              aspd_aptitude = 1800, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60563, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60564],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1190,
              growth_purple = 1190, growth_orange = 1190,
              growth_red = 1190, model_id = 71114, model_id1 = 71114,
              model_id2 = 71114, model_id3 = 71114, skin_id_0 = 71114,
              skin_id_1 = 71114, skin_id_2 = 71114, skin_id_3 = 71114,
              skin_id_s0 = 71114, skin_id_s1 = 71114,
              skin_id_s2 = 71114, skin_id_s3 = 71114,
              need_lev_break = 0, manual_level = 1};
get_base(20031) ->
    #pet_base{id = 20031, name = lang:get("敖丙"), type = 2,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1750,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60568, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60154, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60569],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1190,
              growth_purple = 1190, growth_orange = 1190,
              growth_red = 1190, model_id = 10030, model_id1 = 10030,
              model_id2 = 10030, model_id3 = 11030, skin_id_0 = 1003000,
              skin_id_1 = 1003000, skin_id_2 = 1003000, skin_id_3 = 1103000,
              skin_id_s0 = 1003000, skin_id_s1 = 1003000,
              skin_id_s2 = 1003000, skin_id_s3 = 1103000,
              need_lev_break = 0, manual_level = 1};
get_base(20032) ->
    #pet_base{id = 20032, name = lang:get("阿拉蕾"), type = 2,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
              hp_aptitude = 1600, magic_aptitude = 1600,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60549, 1000},
                  {60512, 1000},
                  {60130, 1000},
                  {60159, 1000},
                  {60141, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60554],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1145,
              growth_purple = 1145, growth_orange = 1145,
              growth_red = 1145, model_id = 30652, model_id1 = 30652,
              model_id2 = 30652, model_id3 = 30652, skin_id_0 = 30652,
              skin_id_1 = 30652, skin_id_2 = 30652, skin_id_3 = 30652,
              skin_id_s0 = 30652, skin_id_s1 = 30652,
              skin_id_s2 = 30652, skin_id_s3 = 30652,
              need_lev_break = 0, manual_level = 1};
get_base(20033) ->
    #pet_base{id = 20033, name = lang:get("涂山狐仙"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
              hp_aptitude = 1600, magic_aptitude = 1600,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60098, 1000},
                  {60137, 1000},
                  {60136, 1000},
                  {60138, 1000},
                  {60101, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60500],
              cost = [
                  {20006, 10}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1175,
              growth_purple = 1175, growth_orange = 1175,
              growth_red = 1175, model_id = 30651, model_id1 = 30651,
              model_id2 = 30651, model_id3 = 30651, skin_id_0 = 30651,
              skin_id_1 = 30651, skin_id_2 = 30651, skin_id_3 = 30651,
              skin_id_s0 = 30651, skin_id_s1 = 30651,
              skin_id_s2 = 30651, skin_id_s3 = 30651,
              need_lev_break = 0, manual_level = 1};
get_base(20034) ->
    #pet_base{id = 20034, name = lang:get("死亡骑士"), type = 2,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1600,
              hp_aptitude = 1620, magic_aptitude = 1700,
              aspd_aptitude = 1670, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60567, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60143, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60510],
              cost = [
                  {20006, 26}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1130,
              growth_purple = 1130, growth_orange = 1130,
              growth_red = 1130, model_id = 30042, model_id1 = 30142,
              model_id2 = 30242, model_id3 = 30242, skin_id_0 = 30042,
              skin_id_1 = 30142, skin_id_2 = 30242, skin_id_3 = 30242,
              skin_id_s0 = 30342, skin_id_s1 = 30442,
              skin_id_s2 = 30542, skin_id_s3 = 30542,
              need_lev_break = 0, manual_level = 1};
get_base(20035) ->
    #pet_base{id = 20035, name = lang:get("雪岭之王"), type = 1,
              genre = 2, phy_aptitude = 1800, pdef_aptitude = 1800,
              hp_aptitude = 1800, magic_aptitude = 1800,
              aspd_aptitude = 1800, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60575, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60574],
              cost = [
                  {20006, 26}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1175,
              growth_purple = 1175, growth_orange = 1175,
              growth_red = 1175, model_id = 30065, model_id1 = 30165,
              model_id2 = 30165, model_id3 = 30165, skin_id_0 = 30065,
              skin_id_1 = 30165, skin_id_2 = 30165, skin_id_3 = 30165,
              skin_id_s0 = 30265, skin_id_s1 = 30365,
              skin_id_s2 = 30365, skin_id_s3 = 30365,
              need_lev_break = 0, manual_level = 1};
get_base(20036) ->
    #pet_base{id = 20036, name = lang:get("熔魔之主"), type = 1,
              genre = 2, phy_aptitude = 1800, pdef_aptitude = 1800,
              hp_aptitude = 1800, magic_aptitude = 1800,
              aspd_aptitude = 1800, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60572, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60573],
              cost = [
                  {20006, 26}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1145,
              growth_purple = 1145, growth_orange = 1145,
              growth_red = 1145, model_id = 71006, model_id1 = 71006,
              model_id2 = 71006, model_id3 = 71006, skin_id_0 = 71006,
              skin_id_1 = 71006, skin_id_2 = 71006, skin_id_3 = 71006,
              skin_id_s0 = 71006, skin_id_s1 = 71006,
              skin_id_s2 = 71006, skin_id_s3 = 71006,
              need_lev_break = 0, manual_level = 1};
get_base(20037) ->
    #pet_base{id = 20037, name = lang:get("冰雪皇后"), type = 2,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1600,
              hp_aptitude = 1600, magic_aptitude = 1600,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60570, 1000},
                  {60142, 1000},
                  {60141, 1000},
                  {60129, 1000},
                  {60143, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60571],
              cost = [
                  {20006, 42}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1160,
              growth_purple = 1160, growth_orange = 1160,
              growth_red = 1160, model_id = 30060, model_id1 = 30160,
              model_id2 = 30260, model_id3 = 30260, skin_id_0 = 30060,
              skin_id_1 = 30160, skin_id_2 = 30260, skin_id_3 = 30260,
              skin_id_s0 = 30360, skin_id_s1 = 30460,
              skin_id_s2 = 30560, skin_id_s3 = 30560,
              need_lev_break = 0, manual_level = 1};
get_base(20038) ->
    #pet_base{id = 20038, name = lang:get("丘比特"), type = 1,
              genre = 2, phy_aptitude = 1850, pdef_aptitude = 1750,
              hp_aptitude = 1770, magic_aptitude = 1750,
              aspd_aptitude = 1820, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60586, 1000},
                  {60151, 1000},
                  {60101, 1000},
                  {60136, 1000},
                  {60129, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60587],
              cost = [
                  {20006, 42}], lev_break_cost = [
                  {22205, 30}],
              max_wash_time = 0, growth_blue = 1160,
              growth_purple = 1160, growth_orange = 1160,
              growth_red = 1160, model_id = 41002, model_id1 = 41002,
              model_id2 = 41002, model_id3 = 41002, skin_id_0 = 41002,
              skin_id_1 = 41002, skin_id_2 = 41002, skin_id_3 = 41002,
              skin_id_s0 = 41002, skin_id_s1 = 41002,
              skin_id_s2 = 41002, skin_id_s3 = 41002,
              need_lev_break = 0, manual_level = 1};
get_base(20039) ->
    #pet_base{id = 20039, name = lang:get("鹿灵"), type = 2,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1750,
              hp_aptitude = 1770, magic_aptitude = 1850,
              aspd_aptitude = 1820, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60999, 1000},
                  {60242, 1000},
                  {60241, 1000},
                  {60229, 1000},
                  {60243, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  60998],
              cost = [
                  {20006, 26}], lev_break_cost = [
                  {22205, 100}],
              max_wash_time = 0, growth_blue = 1150,
              growth_purple = 1150, growth_orange = 1150,
              growth_red = 1150, model_id = 32024, model_id1 = 32024,
              model_id2 = 32024, model_id3 = 32024, skin_id_0 = 32024,
              skin_id_1 = 32024, skin_id_2 = 32024, skin_id_3 = 32024,
              skin_id_s0 = 32024, skin_id_s1 = 32024,
              skin_id_s2 = 32024, skin_id_s3 = 32024,
              need_lev_break = 0, manual_level = 1};
get_base(20041) ->
    #pet_base{id = 20041, name = lang:get("天门战神"), type = 2,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1650,
              hp_aptitude = 1800, magic_aptitude = 1550,
              aspd_aptitude = 1620, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67075, 1000},
                  {67080, 1000},
                  {60152, 1000},
                  {60054, 1000},
                  {60046, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67077],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {71609, 60}],
              max_wash_time = 0, growth_blue = 1240,
              growth_purple = 1240, growth_orange = 1240,
              growth_red = 1240, model_id = 12058, model_id1 = 12058,
              model_id2 = 12058, model_id3 = 12058, skin_id_0 = 12058,
              skin_id_1 = 12058, skin_id_2 = 12058, skin_id_3 = 12058,
              skin_id_s0 = 12058, skin_id_s1 = 12058,
              skin_id_s2 = 12058, skin_id_s3 = 12058,
              need_lev_break = 0, manual_level = 1};
get_base(20042) ->
    #pet_base{id = 20042, name = lang:get("碧海神猿"), type = 3,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1670,
              hp_aptitude = 2000, magic_aptitude = 1580,
              aspd_aptitude = 1650, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67074, 1000},
                  {67093, 1000},
                  {60156, 1000},
                  {60067, 1000},
                  {60063, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67076],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {71610, 60}],
              max_wash_time = 0, growth_blue = 1240,
              growth_purple = 1240, growth_orange = 1240,
              growth_red = 1240, model_id = 30077, model_id1 = 30077,
              model_id2 = 30077, model_id3 = 30077, skin_id_0 = 30077,
              skin_id_1 = 30077, skin_id_2 = 30077, skin_id_3 = 30077,
              skin_id_s0 = 30077, skin_id_s1 = 30077,
              skin_id_s2 = 30077, skin_id_s3 = 30077,
              need_lev_break = 0, manual_level = 1};
get_base(20043) ->
    #pet_base{id = 20043, name = lang:get("剑圣"), type = 1,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1750,
              hp_aptitude = 2600, magic_aptitude = 1600,
              aspd_aptitude = 2200, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67117, 1000},
                  {67118, 1000},
                  {67119, 1000},
                  {60281, 1000},
                  {60282, 1000},
                  {60313, 1000},
                  {60286, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67127],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {71611, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 12066, model_id1 = 12066,
              model_id2 = 12066, model_id3 = 12066, skin_id_0 = 12066,
              skin_id_1 = 12066, skin_id_2 = 12066, skin_id_3 = 12066,
              skin_id_s0 = 12066, skin_id_s1 = 12066,
              skin_id_s2 = 12066, skin_id_s3 = 12066,
              need_lev_break = 0, manual_level = 1};
get_base(20044) ->
    #pet_base{id = 20044, name = lang:get("暗夜君王"), type = 1,
              genre = 2, phy_aptitude = 1650, pdef_aptitude = 1630,
              hp_aptitude = 1650, magic_aptitude = 1500,
              aspd_aptitude = 1520, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67110, 1000},
                  {67111, 1000},
                  {60130, 1000},
                  {60056, 1000},
                  {60045, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67112],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {71613, 60}],
              max_wash_time = 0, growth_blue = 1240,
              growth_purple = 1240, growth_orange = 1240,
              growth_red = 1240, model_id = 14031, model_id1 = 14031,
              model_id2 = 14231, model_id3 = 14331, skin_id_0 = 140310,
              skin_id_1 = 140310, skin_id_2 = 142310, skin_id_3 = 143310,
              skin_id_s0 = 140310, skin_id_s1 = 140310,
              skin_id_s2 = 142310, skin_id_s3 = 143310,
              need_lev_break = 0, manual_level = 1};
get_base(20045) ->
    #pet_base{id = 20045, name = lang:get("枭"), type = 1,
              genre = 2, phy_aptitude = 1700, pdef_aptitude = 1650,
              hp_aptitude = 1700, magic_aptitude = 1550,
              aspd_aptitude = 1530, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60603, 1000},
                  {60450, 1000},
                  {67314, 1000},
                  {60239, 1000},
                  {67503, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67097],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76220, 60}],
              max_wash_time = 0, growth_blue = 1150,
              growth_purple = 1150, growth_orange = 1150,
              growth_red = 1150, model_id = 30087, model_id1 = 30187,
              model_id2 = 30187, model_id3 = 30187, skin_id_0 = 30087,
              skin_id_1 = 30187, skin_id_2 = 30187, skin_id_3 = 30187,
              skin_id_s0 = 30087, skin_id_s1 = 30187,
              skin_id_s2 = 30187, skin_id_s3 = 30187,
              need_lev_break = 0, manual_level = 1};
get_base(20046) ->
    #pet_base{id = 20046, name = lang:get("神将"), type = 1,
              genre = 2, phy_aptitude = 1600, pdef_aptitude = 1650,
              hp_aptitude = 1800, magic_aptitude = 1550,
              aspd_aptitude = 1570, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67085, 1000},
                  {67087, 1000},
                  {60444, 1000},
                  {60038, 1000},
                  {60051, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67086],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76221, 60}],
              max_wash_time = 0, growth_blue = 1150,
              growth_purple = 1150, growth_orange = 1150,
              growth_red = 1150, model_id = 30086, model_id1 = 30086,
              model_id2 = 30086, model_id3 = 30086, skin_id_0 = 30086,
              skin_id_1 = 30086, skin_id_2 = 30086, skin_id_3 = 30086,
              skin_id_s0 = 30086, skin_id_s1 = 30086,
              skin_id_s2 = 30086, skin_id_s3 = 30086,
              need_lev_break = 0, manual_level = 1};
get_base(20047) ->
    #pet_base{id = 20047, name = lang:get("赤焰白灵"), type = 1,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1680,
              hp_aptitude = 2300, magic_aptitude = 1550,
              aspd_aptitude = 2000, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60590, 1000},
                  {60448, 1000},
                  {60447, 1000},
                  {60449, 1000},
                  {60094, 1000},
                  {61064, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67091],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76222, 60}],
              max_wash_time = 0, growth_blue = 1200,
              growth_purple = 1200, growth_orange = 1200,
              growth_red = 1200, model_id = 30069, model_id1 = 30169,
              model_id2 = 30169, model_id3 = 30169, skin_id_0 = 30069,
              skin_id_1 = 30169, skin_id_2 = 30169, skin_id_3 = 30169,
              skin_id_s0 = 30069, skin_id_s1 = 30169,
              skin_id_s2 = 30169, skin_id_s3 = 30169,
              need_lev_break = 0, manual_level = 1};
get_base(20048) ->
    #pet_base{id = 20048, name = lang:get("擎天神牛"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1670,
              hp_aptitude = 1680, magic_aptitude = 1700,
              aspd_aptitude = 1700, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60568, 1000},
                  {67081, 1000},
                  {67082, 1000},
                  {60290, 1000},
                  {60283, 1000},
                  {60284, 1000},
                  {60286, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67083],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76225, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 33001, model_id1 = 33101,
              model_id2 = 33201, model_id3 = 33201, skin_id_0 = 33001,
              skin_id_1 = 33101, skin_id_2 = 33201, skin_id_3 = 33201,
              skin_id_s0 = 33001, skin_id_s1 = 33101,
              skin_id_s2 = 33201, skin_id_s3 = 33201,
              need_lev_break = 0, manual_level = 1};
get_base(20049) ->
    #pet_base{id = 20049, name = lang:get("修罗王"), type = 1,
              genre = 2, phy_aptitude = 1700, pdef_aptitude = 1650,
              hp_aptitude = 1680, magic_aptitude = 1550,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {60575, 1000},
                  {67038, 1000},
                  {67067, 1000},
                  {60291, 1000},
                  {60302, 1000},
                  {60313, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67068],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76226, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 80002, model_id1 = 80002,
              model_id2 = 80002, model_id3 = 80002, skin_id_0 = 80002,
              skin_id_1 = 80002, skin_id_2 = 80002, skin_id_3 = 80002,
              skin_id_s0 = 80002, skin_id_s1 = 80002,
              skin_id_s2 = 80002, skin_id_s3 = 80002,
              need_lev_break = 0, manual_level = 1};
get_base(20050) ->
    #pet_base{id = 20050, name = lang:get("孔雀冥王"), type = 3,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1680,
              hp_aptitude = 2300, magic_aptitude = 1500,
              aspd_aptitude = 2200, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67113, 1000},
                  {67114, 1000},
                  {67115, 1000},
                  {60280, 1000},
                  {60279, 1000},
                  {60286, 1000},
                  {60308, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67116],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76230, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30068, model_id1 = 30068,
              model_id2 = 30068, model_id3 = 30068, skin_id_0 = 30068,
              skin_id_1 = 30068, skin_id_2 = 30068, skin_id_3 = 30068,
              skin_id_s0 = 30068, skin_id_s1 = 30068,
              skin_id_s2 = 30068, skin_id_s3 = 30068,
              need_lev_break = 0, manual_level = 1};
get_base(20051) ->
    #pet_base{id = 20051, name = lang:get("玉兔"), type = 1,
              genre = 2, phy_aptitude = 1700, pdef_aptitude = 1650,
              hp_aptitude = 1680, magic_aptitude = 1550,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67130, 1000},
                  {67131, 1000},
                  {67132, 1000},
                  {60283, 1000},
                  {60311, 1000},
                  {60312, 1000},
                  {60313, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67133],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76231, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 80003, model_id1 = 80003,
              model_id2 = 80003, model_id3 = 80003, skin_id_0 = 80003,
              skin_id_1 = 80003, skin_id_2 = 80003, skin_id_3 = 80003,
              skin_id_s0 = 80003, skin_id_s1 = 80003,
              skin_id_s2 = 80003, skin_id_s3 = 80003,
              need_lev_break = 0, manual_level = 1};
get_base(20052) ->
    #pet_base{id = 20052, name = lang:get("火麒麟"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1670,
              hp_aptitude = 1700, magic_aptitude = 1700,
              aspd_aptitude = 1700, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67200, 1000},
                  {67300, 1000},
                  {67302, 1000},
                  {60281, 1000},
                  {60288, 1000},
                  {60286, 1000},
                  {60308, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67207],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {76232, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 80004, model_id1 = 80004,
              model_id2 = 80004, model_id3 = 80004, skin_id_0 = 80004,
              skin_id_1 = 80004, skin_id_2 = 80004, skin_id_3 = 80004,
              skin_id_s0 = 80004, skin_id_s1 = 80004,
              skin_id_s2 = 80004, skin_id_s3 = 80004,
              need_lev_break = 0, manual_level = 1};
get_base(20053) ->
    #pet_base{id = 20053, name = lang:get("孙悟空"), type = 1,
              genre = 2, phy_aptitude = 1700, pdef_aptitude = 1650,
              hp_aptitude = 1680, magic_aptitude = 1550,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67309, 1000},
                  {67308, 1000},
                  {67310, 1000},
                  {60291, 1000},
                  {60314, 1000},
                  {60326, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67311],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78401, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 80110, model_id1 = 80110,
              model_id2 = 80110, model_id3 = 80110, skin_id_0 = 80110,
              skin_id_1 = 80110, skin_id_2 = 80110, skin_id_3 = 80110,
              skin_id_s0 = 80110, skin_id_s1 = 80110,
              skin_id_s2 = 80110, skin_id_s3 = 80110,
              need_lev_break = 0, manual_level = 1};
get_base(20055) ->
    #pet_base{id = 20055, name = lang:get("百花仙子"), type = 3,
              genre = 2, phy_aptitude = 1400, pdef_aptitude = 1750,
              hp_aptitude = 2600, magic_aptitude = 1600,
              aspd_aptitude = 1000, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67304, 1000},
                  {67305, 1000},
                  {67306, 1000},
                  {60288, 1000},
                  {60304, 1000},
                  {60313, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67307],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78407, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30080, model_id1 = 30080,
              model_id2 = 30080, model_id3 = 30080, skin_id_0 = 30080,
              skin_id_1 = 30080, skin_id_2 = 30080, skin_id_3 = 30080,
              skin_id_s0 = 30080, skin_id_s1 = 30080,
              skin_id_s2 = 30080, skin_id_s3 = 30080,
              need_lev_break = 0, manual_level = 1};
get_base(20057) ->
    #pet_base{id = 20057, name = lang:get("六耳猕猴"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1670,
              hp_aptitude = 1700, magic_aptitude = 1700,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67316, 1000},
                  {67314, 1000},
                  {67308, 1000},
                  {60284, 1000},
                  {60282, 1000},
                  {60308, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67315],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78403, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 80710, model_id1 = 80710,
              model_id2 = 80710, model_id3 = 80710, skin_id_0 = 80710,
              skin_id_1 = 80710, skin_id_2 = 80710, skin_id_3 = 80710,
              skin_id_s0 = 80710, skin_id_s1 = 80710,
              skin_id_s2 = 80710, skin_id_s3 = 80710,
              need_lev_break = 0, manual_level = 1};
get_base(20058) ->
    #pet_base{id = 20058, name = lang:get("刑天战神"), type = 1,
              genre = 2, phy_aptitude = 1700, pdef_aptitude = 1650,
              hp_aptitude = 1680, magic_aptitude = 1550,
              aspd_aptitude = 1550, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67330, 1000},
                  {67331, 1000},
                  {67332, 1000},
                  {60291, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67333],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78928, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30078, model_id1 = 30078,
              model_id2 = 30078, model_id3 = 30078, skin_id_0 = 30078,
              skin_id_1 = 30078, skin_id_2 = 30078, skin_id_3 = 30078,
              skin_id_s0 = 30078, skin_id_s1 = 30078,
              skin_id_s2 = 30078, skin_id_s3 = 30078,
              need_lev_break = 0, manual_level = 1};
get_base(20060) ->
    #pet_base{id = 20060, name = lang:get("楚霸王"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1670,
              hp_aptitude = 1700, magic_aptitude = 1700,
              aspd_aptitude = 1700, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67334, 1000},
                  {67335, 1000},
                  {67336, 1000},
                  {60284, 1000},
                  {60282, 1000},
                  {60308, 1000},
                  {60285, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67337],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78932, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 31192, model_id1 = 31192,
              model_id2 = 31192, model_id3 = 31192, skin_id_0 = 31092,
              skin_id_1 = 31092, skin_id_2 = 31092, skin_id_3 = 31092,
              skin_id_s0 = 31092, skin_id_s1 = 31092,
              skin_id_s2 = 31092, skin_id_s3 = 31092,
              need_lev_break = 0, manual_level = 1};
get_base(20061) ->
    #pet_base{id = 20061, name = lang:get("九天玄女"), type = 1,
              genre = 2, phy_aptitude = 1730, pdef_aptitude = 1650,
              hp_aptitude = 1680, magic_aptitude = 1550,
              aspd_aptitude = 1600, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67338, 1000},
                  {67339, 1000},
                  {67340, 1000},
                  {67341, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67342],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78934, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30096, model_id1 = 30096,
              model_id2 = 30096, model_id3 = 30096, skin_id_0 = 30096,
              skin_id_1 = 30096, skin_id_2 = 30096, skin_id_3 = 30096,
              skin_id_s0 = 30096, skin_id_s1 = 30096,
              skin_id_s2 = 30096, skin_id_s3 = 30096,
              need_lev_break = 0, manual_level = 1};
get_base(20062) ->
    #pet_base{id = 20062, name = lang:get("梦蝶仙"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67338, 1000},
                  {67339, 1000},
                  {67340, 1000},
                  {67341, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67342],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79215, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30094, model_id1 = 30094,
              model_id2 = 30094, model_id3 = 30094, skin_id_0 = 30094,
              skin_id_1 = 30094, skin_id_2 = 30094, skin_id_3 = 30094,
              skin_id_s0 = 30094, skin_id_s1 = 30094,
              skin_id_s2 = 30094, skin_id_s3 = 30094,
              need_lev_break = 0, manual_level = 1};
get_base(20063) ->
    #pet_base{id = 20063, name = lang:get("言初音"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67343, 1000},
                  {67344, 1000},
                  {67345, 1000},
                  {67346, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67347],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79217, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 81111, model_id1 = 81111,
              model_id2 = 81111, model_id3 = 81111, skin_id_0 = 81111,
              skin_id_1 = 81111, skin_id_2 = 81111, skin_id_3 = 81111,
              skin_id_s0 = 81111, skin_id_s1 = 81111,
              skin_id_s2 = 81111, skin_id_s3 = 81111,
              need_lev_break = 0, manual_level = 1};
get_base(20064) ->
    #pet_base{id = 20064, name = lang:get("烈火穷奇"), type = 1,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1600,
              aspd_aptitude = 1620, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67348, 1000},
                  {67349, 1000},
                  {60133, 1000},
                  {60155, 1000},
                  {60138, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67352],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79219, 60}],
              max_wash_time = 0, growth_blue = 1200,
              growth_purple = 1200, growth_orange = 1200,
              growth_red = 1200, model_id = 30092, model_id1 = 30092,
              model_id2 = 30092, model_id3 = 30092, skin_id_0 = 30092,
              skin_id_1 = 30092, skin_id_2 = 30092, skin_id_3 = 30092,
              skin_id_s0 = 30092, skin_id_s1 = 30092,
              skin_id_s2 = 30092, skin_id_s3 = 30092,
              need_lev_break = 0, manual_level = 1};
get_base(20065) ->
    #pet_base{id = 20065, name = lang:get("封阳"), type = 1,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1600,
              aspd_aptitude = 1660, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67353, 1000},
                  {67354, 1000},
                  {67355, 1000},
                  {67356, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67357],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79221, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 15001, model_id1 = 15001,
              model_id2 = 15001, model_id3 = 15001, skin_id_0 = 15001,
              skin_id_1 = 15001, skin_id_2 = 15001, skin_id_3 = 15001,
              skin_id_s0 = 15001, skin_id_s1 = 15001,
              skin_id_s2 = 15001, skin_id_s3 = 15001,
              need_lev_break = 0, manual_level = 1};
get_base(20066) ->
    #pet_base{id = 20066, name = lang:get("太初"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1750, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67358, 1000},
                  {67359, 1000},
                  {67360, 1000},
                  {67361, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67362],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79223, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 40079, model_id1 = 40079,
              model_id2 = 40079, model_id3 = 40079, skin_id_0 = 40079,
              skin_id_1 = 40079, skin_id_2 = 40079, skin_id_3 = 40079,
              skin_id_s0 = 40079, skin_id_s1 = 40079,
              skin_id_s2 = 40079, skin_id_s3 = 40079,
              need_lev_break = 0, manual_level = 1};
get_base(20067) ->
    #pet_base{id = 20067, name = lang:get("死神"), type = 2,
              genre = 2, phy_aptitude = 1500, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1750,
              aspd_aptitude = 1730, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67363, 1000},
                  {67364, 1000},
                  {67365, 1000},
                  {67366, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67367],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79225, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 60001, model_id1 = 60001,
              model_id2 = 60001, model_id3 = 60001, skin_id_0 = 60001,
              skin_id_1 = 60001, skin_id_2 = 60001, skin_id_3 = 60001,
              skin_id_s0 = 60001, skin_id_s1 = 60001,
              skin_id_s2 = 60001, skin_id_s3 = 60001,
              need_lev_break = 0, manual_level = 1};
get_base(20068) ->
    #pet_base{id = 20068, name = lang:get("亡川"), type = 1,
              genre = 2, phy_aptitude = 1750, pdef_aptitude = 1700,
              hp_aptitude = 1750, magic_aptitude = 1600,
              aspd_aptitude = 1650, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67368, 1000},
                  {67369, 1000},
                  {67370, 1000},
                  {67371, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67372],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {79227, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 40076, model_id1 = 40076,
              model_id2 = 40076, model_id3 = 40076, skin_id_0 = 40076,
              skin_id_1 = 40076, skin_id_2 = 40076, skin_id_3 = 40076,
              skin_id_s0 = 40076, skin_id_s1 = 40076,
              skin_id_s2 = 40076, skin_id_s3 = 40076,
              need_lev_break = 0, manual_level = 1};
get_base(20069) ->
    #pet_base{id = 20069, name = lang:get("三太子"), type = 1,
              genre = 2, phy_aptitude = 1800, pdef_aptitude = 1755,
              hp_aptitude = 1800, magic_aptitude = 1650,
              aspd_aptitude = 1700, base_happy = 99999,
              min_happy_ratio = 1000, max_happy_ratio = 1000,
              min_happy_genre_ratio = 1000,
              max_happy_genre_ratio = 1000,
              base_skills = [
                  {67378, 1000},
                  {60171, 1000},
                  {60169, 1000},
                  {60158, 1000},
                  {60301, 1000},
                  {60311, 1000},
                  {60285, 1000},
                  {60302, 1000}],
              vari_skills = [
                  60001,
                  60002,
                  60003,
                  60004,
                  60005,
                  60006,
                  60011,
                  60012,
                  60013,
                  60026,
                  60027,
                  60028,
                  60029,
                  60030,
                  60031,
                  60033,
                  60034,
                  60035,
                  60036,
                  60037,
                  60038,
                  60039,
                  60040,
                  60041,
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
                  60101,
                  60102,
                  60103,
                  60104,
                  60105,
                  60106,
                  60126,
                  60127,
                  60128,
                  60129,
                  60131,
                  60132,
                  60134,
                  60135,
                  60136,
                  60138,
                  60140,
                  60141,
                  60142,
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
                  60155],
              has_break_skill = 1, lev_break_skills = [
                  67379],
              cost = [
                  {79206, 1}], lev_break_cost = [
                  {78936, 60}],
              max_wash_time = 0, growth_blue = 1300,
              growth_purple = 1300, growth_orange = 1300,
              growth_red = 1300, model_id = 30240, model_id1 = 30240,
              model_id2 = 30240, model_id3 = 30240, skin_id_0 = 30240,
              skin_id_1 = 30240, skin_id_2 = 30240, skin_id_3 = 30240,
              skin_id_s0 = 30240, skin_id_s1 = 30240,
              skin_id_s2 = 30240, skin_id_s3 = 30240,
              need_lev_break = 0, manual_level = 1};
get_base(_) -> false.

get_base_attr(1) ->
    #attr{hp_max = 161, mp_max = 1500, phy_dmg = 73,
          magic_dmg = 51, phy_def = 39, magic_def = 27,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(2) ->
    #attr{hp_max = 163, mp_max = 1500, phy_dmg = 75,
          magic_dmg = 53, phy_def = 41, magic_def = 29,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(3) ->
    #attr{hp_max = 165, mp_max = 1500, phy_dmg = 77,
          magic_dmg = 55, phy_def = 43, magic_def = 31,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(4) ->
    #attr{hp_max = 167, mp_max = 1500, phy_dmg = 79,
          magic_dmg = 57, phy_def = 45, magic_def = 33,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(5) ->
    #attr{hp_max = 169, mp_max = 1500, phy_dmg = 81,
          magic_dmg = 59, phy_def = 47, magic_def = 35,
          atk_speed = 1, enhance_control = 0, anti_control = 0};
get_base_attr(6) ->
    #attr{hp_max = 171, mp_max = 1500, phy_dmg = 83,
          magic_dmg = 61, phy_def = 49, magic_def = 37,
          atk_speed = 5, enhance_control = 0, anti_control = 0};
get_base_attr(7) ->
    #attr{hp_max = 205, mp_max = 1500, phy_dmg = 100,
          magic_dmg = 74, phy_def = 59, magic_def = 45,
          atk_speed = 7, enhance_control = 0, anti_control = 0};
get_base_attr(8) ->
    #attr{hp_max = 240, mp_max = 1500, phy_dmg = 117,
          magic_dmg = 86, phy_def = 69, magic_def = 52,
          atk_speed = 9, enhance_control = 0, anti_control = 0};
get_base_attr(9) ->
    #attr{hp_max = 274, mp_max = 1500, phy_dmg = 133,
          magic_dmg = 99, phy_def = 79, magic_def = 60,
          atk_speed = 10, enhance_control = 0, anti_control = 0};
get_base_attr(10) ->
    #attr{hp_max = 308, mp_max = 1500, phy_dmg = 150,
          magic_dmg = 111, phy_def = 89, magic_def = 67,
          atk_speed = 12, enhance_control = 0, anti_control = 0};
get_base_attr(11) ->
    #attr{hp_max = 343, mp_max = 1500, phy_dmg = 167,
          magic_dmg = 123, phy_def = 99, magic_def = 75,
          atk_speed = 14, enhance_control = 0, anti_control = 0};
get_base_attr(12) ->
    #attr{hp_max = 377, mp_max = 1500, phy_dmg = 183,
          magic_dmg = 136, phy_def = 109, magic_def = 82,
          atk_speed = 16, enhance_control = 0, anti_control = 0};
get_base_attr(13) ->
    #attr{hp_max = 411, mp_max = 1500, phy_dmg = 200,
          magic_dmg = 148, phy_def = 119, magic_def = 90,
          atk_speed = 18, enhance_control = 0, anti_control = 0};
get_base_attr(14) ->
    #attr{hp_max = 445, mp_max = 1500, phy_dmg = 217,
          magic_dmg = 161, phy_def = 129, magic_def = 97,
          atk_speed = 19, enhance_control = 0, anti_control = 0};
get_base_attr(15) ->
    #attr{hp_max = 514, mp_max = 1500, phy_dmg = 250,
          magic_dmg = 185, phy_def = 149, magic_def = 112,
          atk_speed = 21, enhance_control = 0, anti_control = 0};
get_base_attr(16) ->
    #attr{hp_max = 583, mp_max = 1500, phy_dmg = 284,
          magic_dmg = 210, phy_def = 169, magic_def = 127,
          atk_speed = 23, enhance_control = 0, anti_control = 0};
get_base_attr(17) ->
    #attr{hp_max = 651, mp_max = 1500, phy_dmg = 317,
          magic_dmg = 235, phy_def = 189, magic_def = 142,
          atk_speed = 25, enhance_control = 0, anti_control = 0};
get_base_attr(18) ->
    #attr{hp_max = 720, mp_max = 1500, phy_dmg = 351,
          magic_dmg = 260, phy_def = 209, magic_def = 157,
          atk_speed = 27, enhance_control = 0, anti_control = 0};
get_base_attr(19) ->
    #attr{hp_max = 788, mp_max = 1500, phy_dmg = 384,
          magic_dmg = 284, phy_def = 229, magic_def = 172,
          atk_speed = 28, enhance_control = 0, anti_control = 0};
get_base_attr(20) ->
    #attr{hp_max = 857, mp_max = 1500, phy_dmg = 418,
          magic_dmg = 309, phy_def = 249, magic_def = 187,
          atk_speed = 30, enhance_control = 0, anti_control = 0};
get_base_attr(21) ->
    #attr{hp_max = 926, mp_max = 1500, phy_dmg = 451,
          magic_dmg = 334, phy_def = 269, magic_def = 202,
          atk_speed = 32, enhance_control = 4, anti_control = 2};
get_base_attr(22) ->
    #attr{hp_max = 994, mp_max = 1500, phy_dmg = 485,
          magic_dmg = 359, phy_def = 289, magic_def = 217,
          atk_speed = 34, enhance_control = 6, anti_control = 3};
get_base_attr(23) ->
    #attr{hp_max = 1063, mp_max = 1500, phy_dmg = 518,
          magic_dmg = 383, phy_def = 309, magic_def = 232,
          atk_speed = 36, enhance_control = 9, anti_control = 5};
get_base_attr(24) ->
    #attr{hp_max = 1132, mp_max = 1500, phy_dmg = 551,
          magic_dmg = 408, phy_def = 329, magic_def = 247,
          atk_speed = 37, enhance_control = 11, anti_control = 6};
get_base_attr(25) ->
    #attr{hp_max = 1200, mp_max = 1500, phy_dmg = 585,
          magic_dmg = 433, phy_def = 349, magic_def = 262,
          atk_speed = 39, enhance_control = 14, anti_control = 8};
get_base_attr(26) ->
    #attr{hp_max = 1269, mp_max = 1500, phy_dmg = 618,
          magic_dmg = 458, phy_def = 369, magic_def = 277,
          atk_speed = 41, enhance_control = 16, anti_control = 9};
get_base_attr(27) ->
    #attr{hp_max = 1337, mp_max = 1500, phy_dmg = 652,
          magic_dmg = 483, phy_def = 389, magic_def = 292,
          atk_speed = 43, enhance_control = 18,
          anti_control = 10};
get_base_attr(28) ->
    #attr{hp_max = 1406, mp_max = 1500, phy_dmg = 685,
          magic_dmg = 507, phy_def = 409, magic_def = 307,
          atk_speed = 45, enhance_control = 21,
          anti_control = 12};
get_base_attr(29) ->
    #attr{hp_max = 1475, mp_max = 1500, phy_dmg = 719,
          magic_dmg = 532, phy_def = 429, magic_def = 322,
          atk_speed = 46, enhance_control = 23,
          anti_control = 13};
get_base_attr(30) ->
    #attr{hp_max = 1543, mp_max = 1500, phy_dmg = 752,
          magic_dmg = 557, phy_def = 449, magic_def = 337,
          atk_speed = 48, enhance_control = 26,
          anti_control = 15};
get_base_attr(31) ->
    #attr{hp_max = 1612, mp_max = 1500, phy_dmg = 786,
          magic_dmg = 582, phy_def = 469, magic_def = 352,
          atk_speed = 50, enhance_control = 28,
          anti_control = 16};
get_base_attr(32) ->
    #attr{hp_max = 1680, mp_max = 1500, phy_dmg = 819,
          magic_dmg = 606, phy_def = 489, magic_def = 367,
          atk_speed = 52, enhance_control = 30,
          anti_control = 18};
get_base_attr(33) ->
    #attr{hp_max = 1749, mp_max = 1500, phy_dmg = 853,
          magic_dmg = 631, phy_def = 509, magic_def = 382,
          atk_speed = 54, enhance_control = 33,
          anti_control = 19};
get_base_attr(34) ->
    #attr{hp_max = 1818, mp_max = 1500, phy_dmg = 886,
          magic_dmg = 656, phy_def = 529, magic_def = 397,
          atk_speed = 55, enhance_control = 35,
          anti_control = 21};
get_base_attr(35) ->
    #attr{hp_max = 1886, mp_max = 1500, phy_dmg = 919,
          magic_dmg = 681, phy_def = 549, magic_def = 412,
          atk_speed = 57, enhance_control = 38,
          anti_control = 22};
get_base_attr(36) ->
    #attr{hp_max = 1955, mp_max = 1500, phy_dmg = 953,
          magic_dmg = 705, phy_def = 569, magic_def = 427,
          atk_speed = 59, enhance_control = 40,
          anti_control = 24};
get_base_attr(37) ->
    #attr{hp_max = 2023, mp_max = 1500, phy_dmg = 986,
          magic_dmg = 730, phy_def = 589, magic_def = 442,
          atk_speed = 61, enhance_control = 42,
          anti_control = 25};
get_base_attr(38) ->
    #attr{hp_max = 2092, mp_max = 1500, phy_dmg = 1020,
          magic_dmg = 755, phy_def = 609, magic_def = 457,
          atk_speed = 63, enhance_control = 45,
          anti_control = 27};
get_base_attr(39) ->
    #attr{hp_max = 2161, mp_max = 1500, phy_dmg = 1053,
          magic_dmg = 780, phy_def = 629, magic_def = 472,
          atk_speed = 64, enhance_control = 47,
          anti_control = 28};
get_base_attr(40) ->
    #attr{hp_max = 2229, mp_max = 1500, phy_dmg = 1087,
          magic_dmg = 805, phy_def = 649, magic_def = 487,
          atk_speed = 66, enhance_control = 50,
          anti_control = 30};
get_base_attr(41) ->
    #attr{hp_max = 2298, mp_max = 1500, phy_dmg = 1120,
          magic_dmg = 829, phy_def = 669, magic_def = 502,
          atk_speed = 68, enhance_control = 52,
          anti_control = 31};
get_base_attr(42) ->
    #attr{hp_max = 2366, mp_max = 1500, phy_dmg = 1154,
          magic_dmg = 854, phy_def = 688, magic_def = 517,
          atk_speed = 70, enhance_control = 54,
          anti_control = 32};
get_base_attr(43) ->
    #attr{hp_max = 2435, mp_max = 1500, phy_dmg = 1187,
          magic_dmg = 879, phy_def = 708, magic_def = 532,
          atk_speed = 72, enhance_control = 57,
          anti_control = 34};
get_base_attr(44) ->
    #attr{hp_max = 2504, mp_max = 1500, phy_dmg = 1220,
          magic_dmg = 904, phy_def = 728, magic_def = 547,
          atk_speed = 73, enhance_control = 59,
          anti_control = 35};
get_base_attr(45) ->
    #attr{hp_max = 2572, mp_max = 1500, phy_dmg = 1254,
          magic_dmg = 928, phy_def = 748, magic_def = 562,
          atk_speed = 75, enhance_control = 62,
          anti_control = 37};
get_base_attr(46) ->
    #attr{hp_max = 2641, mp_max = 1500, phy_dmg = 1287,
          magic_dmg = 953, phy_def = 768, magic_def = 577,
          atk_speed = 77, enhance_control = 64,
          anti_control = 38};
get_base_attr(47) ->
    #attr{hp_max = 2709, mp_max = 1500, phy_dmg = 1321,
          magic_dmg = 978, phy_def = 788, magic_def = 592,
          atk_speed = 79, enhance_control = 66,
          anti_control = 39};
get_base_attr(48) ->
    #attr{hp_max = 2778, mp_max = 1500, phy_dmg = 1354,
          magic_dmg = 1003, phy_def = 808, magic_def = 607,
          atk_speed = 81, enhance_control = 69,
          anti_control = 41};
get_base_attr(49) ->
    #attr{hp_max = 2847, mp_max = 1500, phy_dmg = 1388,
          magic_dmg = 1027, phy_def = 828, magic_def = 622,
          atk_speed = 82, enhance_control = 71,
          anti_control = 42};
get_base_attr(50) ->
    #attr{hp_max = 2915, mp_max = 1500, phy_dmg = 1421,
          magic_dmg = 1052, phy_def = 848, magic_def = 637,
          atk_speed = 84, enhance_control = 74,
          anti_control = 44};
get_base_attr(51) ->
    #attr{hp_max = 2984, mp_max = 1500, phy_dmg = 1455,
          magic_dmg = 1077, phy_def = 868, magic_def = 652,
          atk_speed = 86, enhance_control = 76,
          anti_control = 45};
get_base_attr(52) ->
    #attr{hp_max = 3053, mp_max = 1500, phy_dmg = 1488,
          magic_dmg = 1102, phy_def = 888, magic_def = 667,
          atk_speed = 88, enhance_control = 78,
          anti_control = 46};
get_base_attr(53) ->
    #attr{hp_max = 3121, mp_max = 1500, phy_dmg = 1522,
          magic_dmg = 1127, phy_def = 908, magic_def = 682,
          atk_speed = 90, enhance_control = 81,
          anti_control = 48};
get_base_attr(54) ->
    #attr{hp_max = 3190, mp_max = 1500, phy_dmg = 1555,
          magic_dmg = 1151, phy_def = 928, magic_def = 697,
          atk_speed = 91, enhance_control = 83,
          anti_control = 49};
get_base_attr(55) ->
    #attr{hp_max = 3258, mp_max = 1500, phy_dmg = 1588,
          magic_dmg = 1176, phy_def = 948, magic_def = 712,
          atk_speed = 93, enhance_control = 86,
          anti_control = 51};
get_base_attr(56) ->
    #attr{hp_max = 3327, mp_max = 1500, phy_dmg = 1622,
          magic_dmg = 1201, phy_def = 968, magic_def = 727,
          atk_speed = 95, enhance_control = 88,
          anti_control = 52};
get_base_attr(57) ->
    #attr{hp_max = 3396, mp_max = 1500, phy_dmg = 1655,
          magic_dmg = 1226, phy_def = 988, magic_def = 742,
          atk_speed = 97, enhance_control = 90,
          anti_control = 54};
get_base_attr(58) ->
    #attr{hp_max = 3464, mp_max = 1500, phy_dmg = 1689,
          magic_dmg = 1250, phy_def = 1008, magic_def = 757,
          atk_speed = 99, enhance_control = 93,
          anti_control = 55};
get_base_attr(59) ->
    #attr{hp_max = 3533, mp_max = 1500, phy_dmg = 1722,
          magic_dmg = 1275, phy_def = 1028, magic_def = 772,
          atk_speed = 100, enhance_control = 95,
          anti_control = 57};
get_base_attr(60) ->
    #attr{hp_max = 3601, mp_max = 1500, phy_dmg = 1756,
          magic_dmg = 1300, phy_def = 1048, magic_def = 787,
          atk_speed = 102, enhance_control = 98,
          anti_control = 58};
get_base_attr(61) ->
    #attr{hp_max = 3670, mp_max = 1500, phy_dmg = 1789,
          magic_dmg = 1325, phy_def = 1068, magic_def = 802,
          atk_speed = 104, enhance_control = 100,
          anti_control = 60};
get_base_attr(62) ->
    #attr{hp_max = 3739, mp_max = 1500, phy_dmg = 1823,
          magic_dmg = 1349, phy_def = 1088, magic_def = 817,
          atk_speed = 106, enhance_control = 102,
          anti_control = 61};
get_base_attr(63) ->
    #attr{hp_max = 3807, mp_max = 1500, phy_dmg = 1856,
          magic_dmg = 1374, phy_def = 1108, magic_def = 832,
          atk_speed = 108, enhance_control = 105,
          anti_control = 63};
get_base_attr(64) ->
    #attr{hp_max = 3876, mp_max = 1500, phy_dmg = 1890,
          magic_dmg = 1399, phy_def = 1128, magic_def = 847,
          atk_speed = 109, enhance_control = 107,
          anti_control = 64};
get_base_attr(65) ->
    #attr{hp_max = 3944, mp_max = 1500, phy_dmg = 1923,
          magic_dmg = 1424, phy_def = 1148, magic_def = 862,
          atk_speed = 111, enhance_control = 110,
          anti_control = 66};
get_base_attr(66) ->
    #attr{hp_max = 4013, mp_max = 1500, phy_dmg = 1956,
          magic_dmg = 1449, phy_def = 1168, magic_def = 877,
          atk_speed = 113, enhance_control = 112,
          anti_control = 67};
get_base_attr(67) ->
    #attr{hp_max = 4082, mp_max = 1500, phy_dmg = 1990,
          magic_dmg = 1473, phy_def = 1188, magic_def = 892,
          atk_speed = 115, enhance_control = 114,
          anti_control = 68};
get_base_attr(68) ->
    #attr{hp_max = 4150, mp_max = 1500, phy_dmg = 2023,
          magic_dmg = 1498, phy_def = 1208, magic_def = 907,
          atk_speed = 117, enhance_control = 117,
          anti_control = 70};
get_base_attr(69) ->
    #attr{hp_max = 4219, mp_max = 1500, phy_dmg = 2057,
          magic_dmg = 1523, phy_def = 1228, magic_def = 922,
          atk_speed = 118, enhance_control = 119,
          anti_control = 71};
get_base_attr(70) ->
    #attr{hp_max = 4287, mp_max = 1500, phy_dmg = 2090,
          magic_dmg = 1548, phy_def = 1248, magic_def = 937,
          atk_speed = 120, enhance_control = 122,
          anti_control = 73};
get_base_attr(71) ->
    #attr{hp_max = 4356, mp_max = 1500, phy_dmg = 2124,
          magic_dmg = 1572, phy_def = 1268, magic_def = 952,
          atk_speed = 122, enhance_control = 124,
          anti_control = 74};
get_base_attr(72) ->
    #attr{hp_max = 4425, mp_max = 1500, phy_dmg = 2157,
          magic_dmg = 1597, phy_def = 1288, magic_def = 967,
          atk_speed = 124, enhance_control = 126,
          anti_control = 75};
get_base_attr(73) ->
    #attr{hp_max = 4493, mp_max = 1500, phy_dmg = 2191,
          magic_dmg = 1622, phy_def = 1308, magic_def = 982,
          atk_speed = 126, enhance_control = 129,
          anti_control = 77};
get_base_attr(74) ->
    #attr{hp_max = 4562, mp_max = 1500, phy_dmg = 2224,
          magic_dmg = 1647, phy_def = 1328, magic_def = 997,
          atk_speed = 127, enhance_control = 131,
          anti_control = 78};
get_base_attr(75) ->
    #attr{hp_max = 4631, mp_max = 1500, phy_dmg = 2258,
          magic_dmg = 1672, phy_def = 1348, magic_def = 1013,
          atk_speed = 129, enhance_control = 134,
          anti_control = 80};
get_base_attr(76) ->
    #attr{hp_max = 4699, mp_max = 1500, phy_dmg = 2291,
          magic_dmg = 1696, phy_def = 1367, magic_def = 1028,
          atk_speed = 130, enhance_control = 136,
          anti_control = 81};
get_base_attr(77) ->
    #attr{hp_max = 4768, mp_max = 1500, phy_dmg = 2324,
          magic_dmg = 1721, phy_def = 1387, magic_def = 1043,
          atk_speed = 132, enhance_control = 138,
          anti_control = 82};
get_base_attr(78) ->
    #attr{hp_max = 4836, mp_max = 1500, phy_dmg = 2358,
          magic_dmg = 1746, phy_def = 1407, magic_def = 1058,
          atk_speed = 134, enhance_control = 141,
          anti_control = 84};
get_base_attr(79) ->
    #attr{hp_max = 4905, mp_max = 1500, phy_dmg = 2391,
          magic_dmg = 1771, phy_def = 1427, magic_def = 1073,
          atk_speed = 136, enhance_control = 143,
          anti_control = 85};
get_base_attr(80) ->
    #attr{hp_max = 4974, mp_max = 1500, phy_dmg = 2425,
          magic_dmg = 1795, phy_def = 1447, magic_def = 1088,
          atk_speed = 138, enhance_control = 146,
          anti_control = 87};
get_base_attr(81) ->
    #attr{hp_max = 5042, mp_max = 1500, phy_dmg = 2458,
          magic_dmg = 1820, phy_def = 1467, magic_def = 1103,
          atk_speed = 140, enhance_control = 148,
          anti_control = 88};
get_base_attr(82) ->
    #attr{hp_max = 5111, mp_max = 1500, phy_dmg = 2492,
          magic_dmg = 1845, phy_def = 1487, magic_def = 1118,
          atk_speed = 142, enhance_control = 150,
          anti_control = 90};
get_base_attr(83) ->
    #attr{hp_max = 5179, mp_max = 1500, phy_dmg = 2525,
          magic_dmg = 1870, phy_def = 1507, magic_def = 1133,
          atk_speed = 144, enhance_control = 153,
          anti_control = 91};
get_base_attr(84) ->
    #attr{hp_max = 5248, mp_max = 1500, phy_dmg = 2559,
          magic_dmg = 1894, phy_def = 1527, magic_def = 1148,
          atk_speed = 146, enhance_control = 155,
          anti_control = 93};
get_base_attr(85) ->
    #attr{hp_max = 5317, mp_max = 1500, phy_dmg = 2592,
          magic_dmg = 1919, phy_def = 1547, magic_def = 1163,
          atk_speed = 148, enhance_control = 158,
          anti_control = 94};
get_base_attr(86) ->
    #attr{hp_max = 5385, mp_max = 1500, phy_dmg = 2625,
          magic_dmg = 1944, phy_def = 1567, magic_def = 1178,
          atk_speed = 150, enhance_control = 160,
          anti_control = 96};
get_base_attr(87) ->
    #attr{hp_max = 5454, mp_max = 1500, phy_dmg = 2659,
          magic_dmg = 1969, phy_def = 1587, magic_def = 1193,
          atk_speed = 151, enhance_control = 162,
          anti_control = 97};
get_base_attr(88) ->
    #attr{hp_max = 5522, mp_max = 1500, phy_dmg = 2692,
          magic_dmg = 1994, phy_def = 1607, magic_def = 1208,
          atk_speed = 153, enhance_control = 165,
          anti_control = 99};
get_base_attr(89) ->
    #attr{hp_max = 5591, mp_max = 1500, phy_dmg = 2726,
          magic_dmg = 2018, phy_def = 1627, magic_def = 1223,
          atk_speed = 155, enhance_control = 167,
          anti_control = 100};
get_base_attr(90) ->
    #attr{hp_max = 5660, mp_max = 1500, phy_dmg = 2759,
          magic_dmg = 2043, phy_def = 1647, magic_def = 1238,
          atk_speed = 157, enhance_control = 170,
          anti_control = 102};
get_base_attr(91) ->
    #attr{hp_max = 5728, mp_max = 1500, phy_dmg = 2793,
          magic_dmg = 2068, phy_def = 1667, magic_def = 1253,
          atk_speed = 159, enhance_control = 172,
          anti_control = 103};
get_base_attr(92) ->
    #attr{hp_max = 5797, mp_max = 1500, phy_dmg = 2826,
          magic_dmg = 2093, phy_def = 1687, magic_def = 1268,
          atk_speed = 161, enhance_control = 174,
          anti_control = 104};
get_base_attr(93) ->
    #attr{hp_max = 5865, mp_max = 1500, phy_dmg = 2860,
          magic_dmg = 2117, phy_def = 1707, magic_def = 1283,
          atk_speed = 163, enhance_control = 177,
          anti_control = 106};
get_base_attr(94) ->
    #attr{hp_max = 5934, mp_max = 1500, phy_dmg = 2893,
          magic_dmg = 2142, phy_def = 1727, magic_def = 1298,
          atk_speed = 165, enhance_control = 179,
          anti_control = 107};
get_base_attr(95) ->
    #attr{hp_max = 6003, mp_max = 1500, phy_dmg = 2927,
          magic_dmg = 2167, phy_def = 1747, magic_def = 1313,
          atk_speed = 167, enhance_control = 182,
          anti_control = 109};
get_base_attr(96) ->
    #attr{hp_max = 6054, mp_max = 1500, phy_dmg = 2952,
          magic_dmg = 2185, phy_def = 1762, magic_def = 1324,
          atk_speed = 168, enhance_control = 184,
          anti_control = 110};
get_base_attr(97) ->
    #attr{hp_max = 6106, mp_max = 1500, phy_dmg = 2977,
          magic_dmg = 2204, phy_def = 1777, magic_def = 1335,
          atk_speed = 170, enhance_control = 186,
          anti_control = 111};
get_base_attr(98) ->
    #attr{hp_max = 6157, mp_max = 1500, phy_dmg = 3002,
          magic_dmg = 2223, phy_def = 1792, magic_def = 1346,
          atk_speed = 171, enhance_control = 189,
          anti_control = 113};
get_base_attr(99) ->
    #attr{hp_max = 6208, mp_max = 1500, phy_dmg = 3027,
          magic_dmg = 2241, phy_def = 1807, magic_def = 1358,
          atk_speed = 172, enhance_control = 191,
          anti_control = 114};
get_base_attr(100) ->
    #attr{hp_max = 6260, mp_max = 1500, phy_dmg = 3052,
          magic_dmg = 2260, phy_def = 1822, magic_def = 1369,
          atk_speed = 174, enhance_control = 194,
          anti_control = 116};
get_base_attr(101) ->
    #attr{hp_max = 6311, mp_max = 1500, phy_dmg = 3077,
          magic_dmg = 2278, phy_def = 1837, magic_def = 1380,
          atk_speed = 175, enhance_control = 196,
          anti_control = 117};
get_base_attr(102) ->
    #attr{hp_max = 6363, mp_max = 1500, phy_dmg = 3102,
          magic_dmg = 2297, phy_def = 1852, magic_def = 1391,
          atk_speed = 177, enhance_control = 198,
          anti_control = 118};
get_base_attr(103) ->
    #attr{hp_max = 6414, mp_max = 1500, phy_dmg = 3127,
          magic_dmg = 2316, phy_def = 1867, magic_def = 1403,
          atk_speed = 178, enhance_control = 201,
          anti_control = 120};
get_base_attr(104) ->
    #attr{hp_max = 6466, mp_max = 1500, phy_dmg = 3152,
          magic_dmg = 2334, phy_def = 1882, magic_def = 1414,
          atk_speed = 180, enhance_control = 203,
          anti_control = 121};
get_base_attr(105) ->
    #attr{hp_max = 6517, mp_max = 1500, phy_dmg = 3177,
          magic_dmg = 2353, phy_def = 1897, magic_def = 1425,
          atk_speed = 181, enhance_control = 206,
          anti_control = 123};
get_base_attr(106) ->
    #attr{hp_max = 6569, mp_max = 1500, phy_dmg = 3203,
          magic_dmg = 2371, phy_def = 1912, magic_def = 1436,
          atk_speed = 182, enhance_control = 208,
          anti_control = 126};
get_base_attr(107) ->
    #attr{hp_max = 6620, mp_max = 1500, phy_dmg = 3228,
          magic_dmg = 2390, phy_def = 1927, magic_def = 1448,
          atk_speed = 184, enhance_control = 211,
          anti_control = 125};
get_base_attr(108) ->
    #attr{hp_max = 6672, mp_max = 1500, phy_dmg = 3253,
          magic_dmg = 2408, phy_def = 1942, magic_def = 1459,
          atk_speed = 185, enhance_control = 213,
          anti_control = 127};
get_base_attr(109) ->
    #attr{hp_max = 6723, mp_max = 1500, phy_dmg = 3278,
          magic_dmg = 2427, phy_def = 1957, magic_def = 1470,
          atk_speed = 187, enhance_control = 216,
          anti_control = 130};
get_base_attr(110) ->
    #attr{hp_max = 6774, mp_max = 1500, phy_dmg = 3303,
          magic_dmg = 2446, phy_def = 1972, magic_def = 1481,
          atk_speed = 188, enhance_control = 218,
          anti_control = 129};
get_base_attr(111) ->
    #attr{hp_max = 6826, mp_max = 1500, phy_dmg = 3328,
          magic_dmg = 2464, phy_def = 1987, magic_def = 1493,
          atk_speed = 190, enhance_control = 221,
          anti_control = 131};
get_base_attr(112) ->
    #attr{hp_max = 6877, mp_max = 1500, phy_dmg = 3353,
          magic_dmg = 2483, phy_def = 2002, magic_def = 1504,
          atk_speed = 191, enhance_control = 223,
          anti_control = 134};
get_base_attr(113) ->
    #attr{hp_max = 6929, mp_max = 1500, phy_dmg = 3378,
          magic_dmg = 2501, phy_def = 2017, magic_def = 1515,
          atk_speed = 193, enhance_control = 226,
          anti_control = 133};
get_base_attr(114) ->
    #attr{hp_max = 6980, mp_max = 1500, phy_dmg = 3403,
          magic_dmg = 2520, phy_def = 2031, magic_def = 1527,
          atk_speed = 194, enhance_control = 228,
          anti_control = 135};
get_base_attr(115) ->
    #attr{hp_max = 7032, mp_max = 1500, phy_dmg = 3428,
          magic_dmg = 2538, phy_def = 2046, magic_def = 1538,
          atk_speed = 195, enhance_control = 231,
          anti_control = 138};
get_base_attr(116) ->
    #attr{hp_max = 7083, mp_max = 1500, phy_dmg = 3453,
          magic_dmg = 2557, phy_def = 2061, magic_def = 1549,
          atk_speed = 197, enhance_control = 233,
          anti_control = 137};
get_base_attr(117) ->
    #attr{hp_max = 7135, mp_max = 1500, phy_dmg = 3478,
          magic_dmg = 2576, phy_def = 2076, magic_def = 1560,
          atk_speed = 198, enhance_control = 236,
          anti_control = 139};
get_base_attr(118) ->
    #attr{hp_max = 7186, mp_max = 1500, phy_dmg = 3504,
          magic_dmg = 2594, phy_def = 2091, magic_def = 1572,
          atk_speed = 200, enhance_control = 238,
          anti_control = 142};
get_base_attr(119) ->
    #attr{hp_max = 7238, mp_max = 1500, phy_dmg = 3529,
          magic_dmg = 2613, phy_def = 2106, magic_def = 1583,
          atk_speed = 201, enhance_control = 241,
          anti_control = 141};
get_base_attr(120) ->
    #attr{hp_max = 7289, mp_max = 1500, phy_dmg = 3554,
          magic_dmg = 2631, phy_def = 2121, magic_def = 1594,
          atk_speed = 203, enhance_control = 243,
          anti_control = 143};
get_base_attr(121) ->
    #attr{hp_max = 7340, mp_max = 1500, phy_dmg = 3579,
          magic_dmg = 2650, phy_def = 2136, magic_def = 1605,
          atk_speed = 204, enhance_control = 246,
          anti_control = 146};
get_base_attr(122) ->
    #attr{hp_max = 7392, mp_max = 1500, phy_dmg = 3604,
          magic_dmg = 2669, phy_def = 2151, magic_def = 1617,
          atk_speed = 205, enhance_control = 248,
          anti_control = 145};
get_base_attr(123) ->
    #attr{hp_max = 7443, mp_max = 1500, phy_dmg = 3629,
          magic_dmg = 2687, phy_def = 2166, magic_def = 1628,
          atk_speed = 207, enhance_control = 251,
          anti_control = 147};
get_base_attr(124) ->
    #attr{hp_max = 7495, mp_max = 1500, phy_dmg = 3654,
          magic_dmg = 2706, phy_def = 2181, magic_def = 1639,
          atk_speed = 208, enhance_control = 253,
          anti_control = 150};
get_base_attr(125) ->
    #attr{hp_max = 7546, mp_max = 1500, phy_dmg = 3679,
          magic_dmg = 2724, phy_def = 2196, magic_def = 1650,
          atk_speed = 210, enhance_control = 256,
          anti_control = 153};
get_base_attr(126) ->
    #attr{hp_max = 7598, mp_max = 1500, phy_dmg = 3704,
          magic_dmg = 2743, phy_def = 2211, magic_def = 1662,
          atk_speed = 211, enhance_control = 258,
          anti_control = 154};
get_base_attr(127) ->
    #attr{hp_max = 7649, mp_max = 1500, phy_dmg = 3729,
          magic_dmg = 2761, phy_def = 2226, magic_def = 1673,
          atk_speed = 213, enhance_control = 261,
          anti_control = 156};
get_base_attr(128) ->
    #attr{hp_max = 7701, mp_max = 1500, phy_dmg = 3754,
          magic_dmg = 2780, phy_def = 2241, magic_def = 1684,
          atk_speed = 214, enhance_control = 263,
          anti_control = 157};
get_base_attr(129) ->
    #attr{hp_max = 7752, mp_max = 1500, phy_dmg = 3780,
          magic_dmg = 2799, phy_def = 2256, magic_def = 1695,
          atk_speed = 215, enhance_control = 266,
          anti_control = 159};
get_base_attr(130) ->
    #attr{hp_max = 7804, mp_max = 1500, phy_dmg = 3805,
          magic_dmg = 2817, phy_def = 2271, magic_def = 1707,
          atk_speed = 217, enhance_control = 268,
          anti_control = 160};
get_base_attr(131) ->
    #attr{hp_max = 7855, mp_max = 1500, phy_dmg = 3830,
          magic_dmg = 2836, phy_def = 2286, magic_def = 1718,
          atk_speed = 218, enhance_control = 271,
          anti_control = 162};
get_base_attr(132) ->
    #attr{hp_max = 7907, mp_max = 1500, phy_dmg = 3855,
          magic_dmg = 2854, phy_def = 2301, magic_def = 1729,
          atk_speed = 220, enhance_control = 273,
          anti_control = 163};
get_base_attr(133) ->
    #attr{hp_max = 7958, mp_max = 1500, phy_dmg = 3880,
          magic_dmg = 2873, phy_def = 2316, magic_def = 1740,
          atk_speed = 221, enhance_control = 276,
          anti_control = 165};
get_base_attr(134) ->
    #attr{hp_max = 8009, mp_max = 1500, phy_dmg = 3905,
          magic_dmg = 2891, phy_def = 2331, magic_def = 1752,
          atk_speed = 223, enhance_control = 278,
          anti_control = 166};
get_base_attr(135) ->
    #attr{hp_max = 8061, mp_max = 1500, phy_dmg = 3930,
          magic_dmg = 2910, phy_def = 2346, magic_def = 1763,
          atk_speed = 224, enhance_control = 281,
          anti_control = 168};
get_base_attr(136) ->
    #attr{hp_max = 8112, mp_max = 1500, phy_dmg = 3955,
          magic_dmg = 2929, phy_def = 2361, magic_def = 1774,
          atk_speed = 225, enhance_control = 283,
          anti_control = 169};
get_base_attr(137) ->
    #attr{hp_max = 8164, mp_max = 1500, phy_dmg = 3980,
          magic_dmg = 2947, phy_def = 2376, magic_def = 1785,
          atk_speed = 227, enhance_control = 286,
          anti_control = 171};
get_base_attr(138) ->
    #attr{hp_max = 8215, mp_max = 1500, phy_dmg = 4005,
          magic_dmg = 2966, phy_def = 2391, magic_def = 1797,
          atk_speed = 228, enhance_control = 288,
          anti_control = 172};
get_base_attr(139) ->
    #attr{hp_max = 8267, mp_max = 1500, phy_dmg = 4030,
          magic_dmg = 2984, phy_def = 2406, magic_def = 1808,
          atk_speed = 230, enhance_control = 291,
          anti_control = 174};
get_base_attr(140) ->
    #attr{hp_max = 8318, mp_max = 1500, phy_dmg = 4056,
          magic_dmg = 3003, phy_def = 2421, magic_def = 1819,
          atk_speed = 231, enhance_control = 293,
          anti_control = 175};
get_base_attr(141) ->
    #attr{hp_max = 8370, mp_max = 1500, phy_dmg = 4081,
          magic_dmg = 3021, phy_def = 2436, magic_def = 1830,
          atk_speed = 233, enhance_control = 296,
          anti_control = 177};
get_base_attr(142) ->
    #attr{hp_max = 8421, mp_max = 1500, phy_dmg = 4106,
          magic_dmg = 3040, phy_def = 2451, magic_def = 1842,
          atk_speed = 234, enhance_control = 298,
          anti_control = 178};
get_base_attr(143) ->
    #attr{hp_max = 8473, mp_max = 1500, phy_dmg = 4131,
          magic_dmg = 3059, phy_def = 2466, magic_def = 1853,
          atk_speed = 236, enhance_control = 301,
          anti_control = 180};
get_base_attr(144) ->
    #attr{hp_max = 8524, mp_max = 1500, phy_dmg = 4156,
          magic_dmg = 3077, phy_def = 2481, magic_def = 1864,
          atk_speed = 237, enhance_control = 303,
          anti_control = 181};
get_base_attr(145) ->
    #attr{hp_max = 8575, mp_max = 1500, phy_dmg = 4181,
          magic_dmg = 3096, phy_def = 2496, magic_def = 1875,
          atk_speed = 238, enhance_control = 306,
          anti_control = 183};
get_base_attr(146) ->
    #attr{hp_max = 8627, mp_max = 1500, phy_dmg = 4206,
          magic_dmg = 3114, phy_def = 2511, magic_def = 1887,
          atk_speed = 240, enhance_control = 308,
          anti_control = 184};
get_base_attr(147) ->
    #attr{hp_max = 8678, mp_max = 1500, phy_dmg = 4231,
          magic_dmg = 3133, phy_def = 2526, magic_def = 1898,
          atk_speed = 241, enhance_control = 311,
          anti_control = 186};
get_base_attr(148) ->
    #attr{hp_max = 8730, mp_max = 1500, phy_dmg = 4256,
          magic_dmg = 3152, phy_def = 2541, magic_def = 1909,
          atk_speed = 243, enhance_control = 313,
          anti_control = 187};
get_base_attr(149) ->
    #attr{hp_max = 8781, mp_max = 1500, phy_dmg = 4281,
          magic_dmg = 3170, phy_def = 2556, magic_def = 1920,
          atk_speed = 244, enhance_control = 316,
          anti_control = 189};
get_base_attr(150) ->
    #attr{hp_max = 8833, mp_max = 1500, phy_dmg = 4306,
          magic_dmg = 3189, phy_def = 2571, magic_def = 1932,
          atk_speed = 246, enhance_control = 318,
          anti_control = 190};
get_base_attr(_) -> #attr{}.

get_base_ratio(10000) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10001) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10002) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10003) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10004) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10005) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10006) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10007) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10008) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10009) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10010) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10011) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10012) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10013) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10014) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10015) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10016) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10017) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10018) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10019) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10020) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10021) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10022) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10023) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10024) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10025) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10026) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10027) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10028) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10029) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10030) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10031) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10032) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10033) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10034) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10035) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10036) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10037) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10038) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(10039) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20000) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20001) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20002) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20003) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20004) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20005) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20006) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20007) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20008) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20009) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20010) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20012) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20013) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20014) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20015) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20016) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20017) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20018) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20019) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20020) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20021) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20022) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20023) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20024) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20025) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20026) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20027) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20028) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20029) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20030) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20031) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20032) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20033) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20034) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20035) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20036) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20037) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20038) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20039) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20041) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20042) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20043) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20044) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20045) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20046) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20047) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20048) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20049) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20050) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20051) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20052) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20053) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20055) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20057) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20058) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20060) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20061) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20062) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20063) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20064) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20065) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20066) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20067) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20068) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(20069) -> {0, 0, 0, 0, 0, 0, 0};
get_base_ratio(_) -> false.

get_apti_ratio(1) -> {126, 1000, 50, 28, 36, 20, 1};
get_apti_ratio(2) -> {127, 1000, 51, 29, 37, 21, 1};
get_apti_ratio(3) -> {128, 1000, 52, 30, 38, 22, 1};
get_apti_ratio(4) -> {129, 1000, 53, 31, 39, 23, 1};
get_apti_ratio(5) -> {130, 1000, 54, 32, 40, 24, 1};
get_apti_ratio(6) -> {131, 1000, 55, 33, 41, 25, 5};
get_apti_ratio(7) -> {158, 1000, 66, 39, 49, 30, 7};
get_apti_ratio(8) -> {184, 1000, 78, 46, 57, 35, 8};
get_apti_ratio(9) -> {211, 1000, 89, 53, 66, 40, 9};
get_apti_ratio(10) -> {237, 1000, 100, 59, 74, 45, 10};
get_apti_ratio(11) -> {263, 1000, 111, 66, 82, 50, 11};
get_apti_ratio(12) -> {290, 1000, 122, 73, 90, 55, 13};
get_apti_ratio(13) -> {316, 1000, 133, 79, 99, 60, 14};
get_apti_ratio(14) -> {343, 1000, 144, 86, 107, 65, 15};
get_apti_ratio(15) -> {395, 1000, 167, 99, 123, 75, 17};
get_apti_ratio(16) ->
    {448, 1000, 189, 113, 140, 85, 20};
get_apti_ratio(17) ->
    {501, 1000, 211, 126, 156, 95, 22};
get_apti_ratio(18) ->
    {554, 1000, 234, 139, 173, 105, 24};
get_apti_ratio(19) ->
    {606, 1000, 256, 152, 189, 115, 27};
get_apti_ratio(20) ->
    {659, 1000, 278, 166, 206, 125, 29};
get_apti_ratio(21) ->
    {712, 1000, 301, 179, 223, 135, 32};
get_apti_ratio(22) ->
    {765, 1000, 323, 192, 239, 145, 34};
get_apti_ratio(23) ->
    {817, 1000, 345, 206, 256, 155, 36};
get_apti_ratio(24) ->
    {870, 1000, 367, 219, 272, 165, 39};
get_apti_ratio(25) ->
    {923, 1000, 390, 232, 289, 175, 41};
get_apti_ratio(26) ->
    {976, 1000, 412, 246, 305, 185, 43};
get_apti_ratio(27) ->
    {1029, 1000, 434, 259, 322, 195, 46};
get_apti_ratio(28) ->
    {1081, 1000, 457, 272, 338, 205, 48};
get_apti_ratio(29) ->
    {1134, 1000, 479, 286, 355, 215, 50};
get_apti_ratio(30) ->
    {1187, 1000, 501, 299, 371, 225, 53};
get_apti_ratio(31) ->
    {1240, 1000, 523, 312, 388, 235, 55};
get_apti_ratio(32) ->
    {1292, 1000, 546, 325, 404, 245, 58};
get_apti_ratio(33) ->
    {1345, 1000, 568, 339, 421, 255, 60};
get_apti_ratio(34) ->
    {1398, 1000, 590, 352, 437, 265, 62};
get_apti_ratio(35) ->
    {1451, 1000, 613, 365, 454, 275, 65};
get_apti_ratio(36) ->
    {1503, 1000, 635, 379, 470, 285, 67};
get_apti_ratio(37) ->
    {1556, 1000, 657, 392, 487, 295, 69};
get_apti_ratio(38) ->
    {1609, 1000, 680, 405, 503, 305, 72};
get_apti_ratio(39) ->
    {1662, 1000, 702, 419, 520, 315, 74};
get_apti_ratio(40) ->
    {1715, 1000, 724, 432, 536, 325, 77};
get_apti_ratio(41) ->
    {1767, 1000, 746, 445, 553, 335, 79};
get_apti_ratio(42) ->
    {1820, 1000, 769, 458, 569, 345, 81};
get_apti_ratio(43) ->
    {1873, 1000, 791, 472, 586, 355, 84};
get_apti_ratio(44) ->
    {1926, 1000, 813, 485, 602, 365, 86};
get_apti_ratio(45) ->
    {1978, 1000, 836, 498, 619, 375, 88};
get_apti_ratio(46) ->
    {2031, 1000, 858, 512, 635, 385, 91};
get_apti_ratio(47) ->
    {2084, 1000, 880, 525, 652, 395, 93};
get_apti_ratio(48) ->
    {2137, 1000, 903, 538, 669, 405, 96};
get_apti_ratio(49) ->
    {2189, 1000, 925, 552, 685, 415, 98};
get_apti_ratio(50) ->
    {2242, 1000, 947, 565, 702, 425, 100};
get_apti_ratio(51) ->
    {2295, 1000, 969, 578, 718, 435, 103};
get_apti_ratio(52) ->
    {2348, 1000, 992, 592, 735, 445, 105};
get_apti_ratio(53) ->
    {2401, 1000, 1014, 605, 751, 455, 107};
get_apti_ratio(54) ->
    {2453, 1000, 1036, 618, 768, 465, 110};
get_apti_ratio(55) ->
    {2506, 1000, 1059, 631, 784, 475, 112};
get_apti_ratio(56) ->
    {2559, 1000, 1081, 645, 801, 485, 114};
get_apti_ratio(57) ->
    {2612, 1000, 1103, 658, 817, 495, 117};
get_apti_ratio(58) ->
    {2664, 1000, 1125, 671, 834, 505, 119};
get_apti_ratio(59) ->
    {2717, 1000, 1148, 685, 850, 515, 122};
get_apti_ratio(60) ->
    {2770, 1000, 1170, 698, 867, 525, 124};
get_apti_ratio(61) ->
    {2823, 1000, 1192, 711, 883, 535, 126};
get_apti_ratio(62) ->
    {2875, 1000, 1215, 725, 900, 545, 129};
get_apti_ratio(63) ->
    {2928, 1000, 1237, 738, 916, 555, 131};
get_apti_ratio(64) ->
    {2981, 1000, 1259, 751, 933, 565, 133};
get_apti_ratio(65) ->
    {3034, 1000, 1282, 764, 949, 575, 136};
get_apti_ratio(66) ->
    {3087, 1000, 1304, 778, 966, 585, 138};
get_apti_ratio(67) ->
    {3139, 1000, 1326, 791, 982, 595, 141};
get_apti_ratio(68) ->
    {3192, 1000, 1348, 804, 999, 605, 143};
get_apti_ratio(69) ->
    {3245, 1000, 1371, 818, 1015, 615, 145};
get_apti_ratio(70) ->
    {3298, 1000, 1393, 831, 1032, 625, 148};
get_apti_ratio(71) ->
    {3350, 1000, 1415, 844, 1048, 635, 150};
get_apti_ratio(72) ->
    {3403, 1000, 1438, 858, 1065, 645, 152};
get_apti_ratio(73) ->
    {3456, 1000, 1460, 871, 1081, 655, 155};
get_apti_ratio(74) ->
    {3509, 1000, 1482, 884, 1098, 665, 157};
get_apti_ratio(75) ->
    {3562, 1000, 1505, 898, 1115, 675, 160};
get_apti_ratio(76) ->
    {3614, 1000, 1527, 911, 1131, 685, 162};
get_apti_ratio(77) ->
    {3667, 1000, 1549, 924, 1148, 695, 164};
get_apti_ratio(78) ->
    {3720, 1000, 1571, 937, 1164, 705, 167};
get_apti_ratio(79) ->
    {3773, 1000, 1594, 951, 1181, 715, 169};
get_apti_ratio(80) ->
    {3825, 1000, 1616, 964, 1197, 725, 171};
get_apti_ratio(81) ->
    {3878, 1000, 1638, 977, 1214, 735, 174};
get_apti_ratio(82) ->
    {3931, 1000, 1661, 991, 1230, 745, 176};
get_apti_ratio(83) ->
    {3984, 1000, 1683, 1004, 1247, 755, 178};
get_apti_ratio(84) ->
    {4036, 1000, 1705, 1017, 1263, 765, 181};
get_apti_ratio(85) ->
    {4089, 1000, 1727, 1031, 1280, 775, 183};
get_apti_ratio(86) ->
    {4142, 1000, 1750, 1044, 1296, 785, 186};
get_apti_ratio(87) ->
    {4195, 1000, 1772, 1057, 1313, 795, 188};
get_apti_ratio(88) ->
    {4248, 1000, 1794, 1070, 1329, 805, 190};
get_apti_ratio(89) ->
    {4300, 1000, 1817, 1084, 1346, 815, 193};
get_apti_ratio(90) ->
    {4353, 1000, 1839, 1097, 1362, 825, 195};
get_apti_ratio(91) ->
    {4406, 1000, 1861, 1110, 1379, 835, 197};
get_apti_ratio(92) ->
    {4459, 1000, 1884, 1124, 1395, 845, 200};
get_apti_ratio(93) ->
    {4511, 1000, 1906, 1137, 1412, 855, 202};
get_apti_ratio(94) ->
    {4564, 1000, 1928, 1150, 1428, 865, 205};
get_apti_ratio(95) ->
    {4617, 1000, 1950, 1164, 1445, 875, 207};
get_apti_ratio(96) ->
    {4656, 1000, 1967, 1174, 1457, 882, 209};
get_apti_ratio(97) ->
    {4696, 1000, 1984, 1184, 1470, 890, 210};
get_apti_ratio(98) ->
    {4736, 1000, 2001, 1194, 1482, 897, 212};
get_apti_ratio(99) ->
    {4775, 1000, 2017, 1203, 1494, 905, 214};
get_apti_ratio(100) ->
    {4815, 1000, 2034, 1213, 1507, 912, 216};
get_apti_ratio(101) ->
    {4854, 1000, 2051, 1223, 1519, 920, 218};
get_apti_ratio(102) ->
    {4894, 1000, 2067, 1233, 1532, 927, 219};
get_apti_ratio(103) ->
    {4934, 1000, 2084, 1243, 1544, 935, 221};
get_apti_ratio(104) ->
    {4973, 1000, 2101, 1253, 1556, 942, 223};
get_apti_ratio(105) ->
    {5013, 1000, 2118, 1263, 1569, 950, 225};
get_apti_ratio(106) ->
    {5052, 1000, 2134, 1273, 1581, 957, 226};
get_apti_ratio(107) ->
    {5092, 1000, 2151, 1283, 1594, 965, 228};
get_apti_ratio(108) ->
    {5131, 1000, 2168, 1293, 1606, 972, 230};
get_apti_ratio(109) ->
    {5171, 1000, 2185, 1303, 1618, 980, 232};
get_apti_ratio(110) ->
    {5211, 1000, 2201, 1313, 1631, 987, 234};
get_apti_ratio(111) ->
    {5250, 1000, 2218, 1323, 1643, 995, 235};
get_apti_ratio(112) ->
    {5290, 1000, 2235, 1333, 1655, 1002, 237};
get_apti_ratio(113) ->
    {5329, 1000, 2251, 1343, 1668, 1010, 239};
get_apti_ratio(114) ->
    {5369, 1000, 2268, 1353, 1680, 1017, 241};
get_apti_ratio(115) ->
    {5408, 1000, 2285, 1363, 1693, 1025, 242};
get_apti_ratio(116) ->
    {5448, 1000, 2302, 1373, 1705, 1032, 244};
get_apti_ratio(117) ->
    {5488, 1000, 2318, 1383, 1717, 1040, 246};
get_apti_ratio(118) ->
    {5527, 1000, 2335, 1393, 1730, 1047, 248};
get_apti_ratio(119) ->
    {5567, 1000, 2352, 1403, 1742, 1055, 250};
get_apti_ratio(120) ->
    {5606, 1000, 2368, 1413, 1755, 1062, 251};
get_apti_ratio(121) ->
    {5646, 1000, 2385, 1423, 1767, 1070, 253};
get_apti_ratio(122) ->
    {5686, 1000, 2402, 1433, 1779, 1077, 255};
get_apti_ratio(123) ->
    {5725, 1000, 2419, 1443, 1792, 1085, 257};
get_apti_ratio(124) ->
    {5765, 1000, 2435, 1453, 1804, 1092, 258};
get_apti_ratio(125) ->
    {5804, 1000, 2452, 1463, 1817, 1100, 260};
get_apti_ratio(126) ->
    {5844, 1000, 2469, 1473, 1829, 1107, 262};
get_apti_ratio(127) ->
    {5883, 1000, 2486, 1483, 1841, 1115, 264};
get_apti_ratio(128) ->
    {5923, 1000, 2502, 1493, 1854, 1122, 266};
get_apti_ratio(129) ->
    {5963, 1000, 2519, 1503, 1866, 1130, 267};
get_apti_ratio(130) ->
    {6002, 1000, 2536, 1513, 1878, 1137, 269};
get_apti_ratio(131) ->
    {6042, 1000, 2552, 1523, 1891, 1145, 271};
get_apti_ratio(132) ->
    {6081, 1000, 2569, 1533, 1903, 1152, 273};
get_apti_ratio(133) ->
    {6121, 1000, 2586, 1543, 1916, 1160, 274};
get_apti_ratio(134) ->
    {6160, 1000, 2603, 1553, 1928, 1167, 276};
get_apti_ratio(135) ->
    {6200, 1000, 2619, 1563, 1940, 1175, 278};
get_apti_ratio(136) ->
    {6240, 1000, 2636, 1573, 1953, 1182, 280};
get_apti_ratio(137) ->
    {6279, 1000, 2653, 1583, 1965, 1190, 282};
get_apti_ratio(138) ->
    {6319, 1000, 2669, 1593, 1978, 1197, 283};
get_apti_ratio(139) ->
    {6358, 1000, 2686, 1603, 1990, 1205, 285};
get_apti_ratio(140) ->
    {6398, 1000, 2703, 1613, 2002, 1212, 287};
get_apti_ratio(141) ->
    {6437, 1000, 2720, 1623, 2015, 1220, 289};
get_apti_ratio(142) ->
    {6477, 1000, 2736, 1633, 2027, 1227, 290};
get_apti_ratio(143) ->
    {6517, 1000, 2753, 1643, 2040, 1235, 292};
get_apti_ratio(144) ->
    {6556, 1000, 2770, 1652, 2052, 1242, 294};
get_apti_ratio(145) ->
    {6596, 1000, 2787, 1662, 2064, 1250, 296};
get_apti_ratio(146) ->
    {6635, 1000, 2803, 1672, 2077, 1257, 298};
get_apti_ratio(147) ->
    {6675, 1000, 2820, 1682, 2089, 1265, 299};
get_apti_ratio(148) ->
    {6715, 1000, 2837, 1692, 2101, 1272, 301};
get_apti_ratio(149) ->
    {6754, 1000, 2853, 1702, 2114, 1280, 303};
get_apti_ratio(150) ->
    {6794, 1000, 2870, 1712, 2126, 1287, 305};
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
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 36}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 37}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 38}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 39}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 40}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 41}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 42}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 43}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 44}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 45}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 46}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 47}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 48}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 49}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 50}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 51}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 52}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 53}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 54}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 55}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 56}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 57}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 58}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 59}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 60}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 61}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 62}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 63}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 64}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 65}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 66}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 67}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 68}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 69}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 70}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 71}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 72}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 73}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 74}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 75}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 76}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 77}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 78}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 79}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 80}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 81}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 82}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 83}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 84}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 85}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 86}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 87}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 88}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 89}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 90}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 91}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 92}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 93}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 94}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 95}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 96}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 97}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 98}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 99}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 100}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 101}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 102}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 103}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 104}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 105}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 106}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 107}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 108}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 109}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 110}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 111}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 112}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 113}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 114}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 115}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 116}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 117}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 118}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 119}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 120}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 121}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 122}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 123}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 124}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 125}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 126}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 127}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 128}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 129}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 130}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 131}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 132}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 133}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 134}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 135}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 136}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 137}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 138}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 139}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 140}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 141}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 142}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 143}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 144}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 145}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 146}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 147}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 148}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 149}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
get_point_attr({102, 150}) ->
    [{1, 5000}, {7, 20}, {3, 13}];
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
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 36}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 37}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 38}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 39}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 40}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 41}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 42}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 43}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 44}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 45}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 46}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 47}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 48}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 49}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 50}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 51}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 52}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 53}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 54}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 55}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 56}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 57}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 58}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 59}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 60}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 61}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 62}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 63}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 64}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 65}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 66}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 67}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 68}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 69}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 70}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 71}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 72}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 73}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 74}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 75}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 76}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 77}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 78}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 79}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 80}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 81}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 82}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 83}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 84}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 85}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 86}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 87}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 88}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 89}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 90}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 91}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 92}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 93}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 94}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 95}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 96}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 97}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 98}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 99}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 100}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 101}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 102}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 103}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 104}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 105}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 106}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 107}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 108}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 109}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 110}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 111}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 112}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 113}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 114}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 115}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 116}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 117}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 118}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 119}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 120}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 121}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 122}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 123}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 124}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 125}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 126}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 127}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 128}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 129}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 130}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 131}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 132}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 133}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 134}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 135}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 136}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 137}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 138}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 139}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 140}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 141}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 142}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 143}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 144}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 145}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 146}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 147}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 148}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 149}) ->
    [{4, 500}, {7, 140}, {3, 13}];
get_point_attr({101, 150}) ->
    [{4, 500}, {7, 140}, {3, 13}];
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
get_point_attr({104, 35}) -> [{3, 130}];
get_point_attr({104, 36}) -> [{3, 130}];
get_point_attr({104, 37}) -> [{3, 130}];
get_point_attr({104, 38}) -> [{3, 130}];
get_point_attr({104, 39}) -> [{3, 130}];
get_point_attr({104, 40}) -> [{3, 130}];
get_point_attr({104, 41}) -> [{3, 130}];
get_point_attr({104, 42}) -> [{3, 130}];
get_point_attr({104, 43}) -> [{3, 130}];
get_point_attr({104, 44}) -> [{3, 130}];
get_point_attr({104, 45}) -> [{3, 130}];
get_point_attr({104, 46}) -> [{3, 130}];
get_point_attr({104, 47}) -> [{3, 130}];
get_point_attr({104, 48}) -> [{3, 130}];
get_point_attr({104, 49}) -> [{3, 130}];
get_point_attr({104, 50}) -> [{3, 130}];
get_point_attr({104, 51}) -> [{3, 130}];
get_point_attr({104, 52}) -> [{3, 130}];
get_point_attr({104, 53}) -> [{3, 130}];
get_point_attr({104, 54}) -> [{3, 130}];
get_point_attr({104, 55}) -> [{3, 130}];
get_point_attr({104, 56}) -> [{3, 130}];
get_point_attr({104, 57}) -> [{3, 130}];
get_point_attr({104, 58}) -> [{3, 130}];
get_point_attr({104, 59}) -> [{3, 130}];
get_point_attr({104, 60}) -> [{3, 130}];
get_point_attr({104, 61}) -> [{3, 130}];
get_point_attr({104, 62}) -> [{3, 130}];
get_point_attr({104, 63}) -> [{3, 130}];
get_point_attr({104, 64}) -> [{3, 130}];
get_point_attr({104, 65}) -> [{3, 130}];
get_point_attr({104, 66}) -> [{3, 130}];
get_point_attr({104, 67}) -> [{3, 130}];
get_point_attr({104, 68}) -> [{3, 130}];
get_point_attr({104, 69}) -> [{3, 130}];
get_point_attr({104, 70}) -> [{3, 130}];
get_point_attr({104, 71}) -> [{3, 130}];
get_point_attr({104, 72}) -> [{3, 130}];
get_point_attr({104, 73}) -> [{3, 130}];
get_point_attr({104, 74}) -> [{3, 130}];
get_point_attr({104, 75}) -> [{3, 130}];
get_point_attr({104, 76}) -> [{3, 130}];
get_point_attr({104, 77}) -> [{3, 130}];
get_point_attr({104, 78}) -> [{3, 130}];
get_point_attr({104, 79}) -> [{3, 130}];
get_point_attr({104, 80}) -> [{3, 130}];
get_point_attr({104, 81}) -> [{3, 130}];
get_point_attr({104, 82}) -> [{3, 130}];
get_point_attr({104, 83}) -> [{3, 130}];
get_point_attr({104, 84}) -> [{3, 130}];
get_point_attr({104, 85}) -> [{3, 130}];
get_point_attr({104, 86}) -> [{3, 130}];
get_point_attr({104, 87}) -> [{3, 130}];
get_point_attr({104, 88}) -> [{3, 130}];
get_point_attr({104, 89}) -> [{3, 130}];
get_point_attr({104, 90}) -> [{3, 130}];
get_point_attr({104, 91}) -> [{3, 130}];
get_point_attr({104, 92}) -> [{3, 130}];
get_point_attr({104, 93}) -> [{3, 130}];
get_point_attr({104, 94}) -> [{3, 130}];
get_point_attr({104, 95}) -> [{3, 130}];
get_point_attr({104, 96}) -> [{3, 130}];
get_point_attr({104, 97}) -> [{3, 130}];
get_point_attr({104, 98}) -> [{3, 130}];
get_point_attr({104, 99}) -> [{3, 130}];
get_point_attr({104, 100}) -> [{3, 130}];
get_point_attr({104, 101}) -> [{3, 130}];
get_point_attr({104, 102}) -> [{3, 130}];
get_point_attr({104, 103}) -> [{3, 130}];
get_point_attr({104, 104}) -> [{3, 130}];
get_point_attr({104, 105}) -> [{3, 130}];
get_point_attr({104, 106}) -> [{3, 130}];
get_point_attr({104, 107}) -> [{3, 130}];
get_point_attr({104, 108}) -> [{3, 130}];
get_point_attr({104, 109}) -> [{3, 130}];
get_point_attr({104, 110}) -> [{3, 130}];
get_point_attr({104, 111}) -> [{3, 130}];
get_point_attr({104, 112}) -> [{3, 130}];
get_point_attr({104, 113}) -> [{3, 130}];
get_point_attr({104, 114}) -> [{3, 130}];
get_point_attr({104, 115}) -> [{3, 130}];
get_point_attr({104, 116}) -> [{3, 130}];
get_point_attr({104, 117}) -> [{3, 130}];
get_point_attr({104, 118}) -> [{3, 130}];
get_point_attr({104, 119}) -> [{3, 130}];
get_point_attr({104, 120}) -> [{3, 130}];
get_point_attr({104, 121}) -> [{3, 130}];
get_point_attr({104, 122}) -> [{3, 130}];
get_point_attr({104, 123}) -> [{3, 130}];
get_point_attr({104, 124}) -> [{3, 130}];
get_point_attr({104, 125}) -> [{3, 130}];
get_point_attr({104, 126}) -> [{3, 130}];
get_point_attr({104, 127}) -> [{3, 130}];
get_point_attr({104, 128}) -> [{3, 130}];
get_point_attr({104, 129}) -> [{3, 130}];
get_point_attr({104, 130}) -> [{3, 130}];
get_point_attr({104, 131}) -> [{3, 130}];
get_point_attr({104, 132}) -> [{3, 130}];
get_point_attr({104, 133}) -> [{3, 130}];
get_point_attr({104, 134}) -> [{3, 130}];
get_point_attr({104, 135}) -> [{3, 130}];
get_point_attr({104, 136}) -> [{3, 130}];
get_point_attr({104, 137}) -> [{3, 130}];
get_point_attr({104, 138}) -> [{3, 130}];
get_point_attr({104, 139}) -> [{3, 130}];
get_point_attr({104, 140}) -> [{3, 130}];
get_point_attr({104, 141}) -> [{3, 130}];
get_point_attr({104, 142}) -> [{3, 130}];
get_point_attr({104, 143}) -> [{3, 130}];
get_point_attr({104, 144}) -> [{3, 130}];
get_point_attr({104, 145}) -> [{3, 130}];
get_point_attr({104, 146}) -> [{3, 130}];
get_point_attr({104, 147}) -> [{3, 130}];
get_point_attr({104, 148}) -> [{3, 130}];
get_point_attr({104, 149}) -> [{3, 130}];
get_point_attr({104, 150}) -> [{3, 130}];
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

add_pet_nums(5) -> [{90000, 500000}];
add_pet_nums(6) -> [{90000, 800000}];
add_pet_nums(7) -> [{90000, 1000000}];
add_pet_nums(8) -> [{90000, 1000000}];
add_pet_nums(9) -> [{90000, 1000000}];
add_pet_nums(10) -> [{90000, 1500000}];
add_pet_nums(11) -> [{90000, 1500000}];
add_pet_nums(12) -> [{90000, 1500000}];
add_pet_nums(_) -> false.

add_pet_store_nums(4) -> [{90000, 500000}];
add_pet_store_nums(5) -> [{90000, 800000}];
add_pet_store_nums(6) -> [{90000, 1000000}];
add_pet_store_nums(7) -> [{90000, 1500000}];
add_pet_store_nums(8) -> [{90002, 300}];
add_pet_store_nums(9) -> [{90002, 300}];
add_pet_store_nums(10) -> [{90002, 300}];
add_pet_store_nums(11) -> [{90002, 300}];
add_pet_store_nums(12) -> [{90002, 300}];
add_pet_store_nums(13) -> [{90002, 300}];
add_pet_store_nums(14) -> [{90002, 300}];
add_pet_store_nums(15) -> [{90002, 300}];
add_pet_store_nums(16) -> [{90002, 500}];
add_pet_store_nums(17) -> [{90002, 500}];
add_pet_store_nums(18) -> [{90002, 500}];
add_pet_store_nums(19) -> [{90002, 500}];
add_pet_store_nums(20) -> [{90002, 800}];
add_pet_store_nums(21) -> [{90002, 800}];
add_pet_store_nums(22) -> [{90002, 800}];
add_pet_store_nums(23) -> [{90002, 800}];
add_pet_store_nums(24) -> [{90002, 800}];
add_pet_store_nums(25) -> [{90002, 800}];
add_pet_store_nums(26) -> [{90002, 800}];
add_pet_store_nums(27) -> [{90002, 800}];
add_pet_store_nums(28) -> [{90002, 800}];
add_pet_store_nums(29) -> [{90002, 800}];
add_pet_store_nums(_) -> false.

get_stone(20600) ->
    #pet_stone_polish_data{stone_id = 20600,
                           attr = [{101, 6}]};
get_stone(20601) ->
    #pet_stone_polish_data{stone_id = 20601,
                           attr = [{101, 9}], attr_name = 101,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 26634},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20602) ->
    #pet_stone_polish_data{stone_id = 20602,
                           attr = [{101, 12}], attr_name = 101,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 21563},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20603) ->
    #pet_stone_polish_data{stone_id = 20603,
                           attr = [{103, 6}]};
get_stone(20604) ->
    #pet_stone_polish_data{stone_id = 20604,
                           attr = [{103, 9}], attr_name = 103,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 26634},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20605) ->
    #pet_stone_polish_data{stone_id = 20605,
                           attr = [{103, 12}], attr_name = 103,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 21563},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20606) ->
    #pet_stone_polish_data{stone_id = 20606,
                           attr = [{102, 6}]};
get_stone(20607) ->
    #pet_stone_polish_data{stone_id = 20607,
                           attr = [{102, 9}], attr_name = 102,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 26634},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20608) ->
    #pet_stone_polish_data{stone_id = 20608,
                           attr = [{102, 12}], attr_name = 102,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 21563},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20612) ->
    #pet_stone_polish_data{stone_id = 20612,
                           attr = [{104, 6}]};
get_stone(20613) ->
    #pet_stone_polish_data{stone_id = 20613,
                           attr = [{104, 9}], attr_name = 104,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 26634},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(20614) ->
    #pet_stone_polish_data{stone_id = 20614,
                           attr = [{104, 12}], attr_name = 104,
                           val_list =
                               [{1, 60},
                                {2, 80},
                                {3, 100},
                                {4, 120},
                                {5, 100},
                                {6, 50},
                                {7, 20},
                                {8, 10}],
                           skill_list =
                               [{0, 21563},
                                {84000, 15},
                                {84002, 30},
                                {84003, 30},
                                {84004, 50},
                                {84005, 100},
                                {84006, 100},
                                {84007, 40},
                                {84008, 100},
                                {84009, 60},
                                {84010, 30},
                                {84011, 100},
                                {84012, 100},
                                {84013, 100},
                                {84014, 100},
                                {84015, 100},
                                {84016, 100},
                                {84017, 100},
                                {84018, 100}]};
get_stone(_) -> false.

get_polish(10000) -> [{20006, 5}, {20618, 1}];
get_polish(10001) -> [{20006, 5}, {20618, 1}];
get_polish(10002) -> [{20006, 5}, {20618, 1}];
get_polish(10003) -> [{20006, 5}, {20618, 1}];
get_polish(10004) -> [{20006, 5}, {20618, 1}];
get_polish(10005) -> [{20006, 5}, {20618, 1}];
get_polish(10006) -> [{20006, 5}, {20618, 1}];
get_polish(10007) -> [{20006, 5}, {20618, 1}];
get_polish(10008) -> [{20006, 5}, {20618, 1}];
get_polish(10009) -> [{20006, 5}, {20618, 1}];
get_polish(10010) -> [{20006, 5}, {20618, 1}];
get_polish(10011) -> [{20006, 5}, {20618, 1}];
get_polish(10012) -> [{20006, 5}, {20618, 1}];
get_polish(10013) -> [{20006, 5}, {20618, 1}];
get_polish(10014) -> [{20006, 5}, {20618, 1}];
get_polish(10015) -> [{20006, 5}, {20618, 1}];
get_polish(10016) -> [{20006, 5}, {20618, 2}];
get_polish(10017) -> [{20006, 5}, {20618, 2}];
get_polish(10019) -> [{20006, 5}, {20618, 2}];
get_polish(10021) -> [{20006, 5}, {20618, 2}];
get_polish(10022) -> [{20006, 5}, {20618, 2}];
get_polish(10023) -> [{20006, 5}, {20618, 2}];
get_polish(10024) -> [{20006, 5}, {20618, 2}];
get_polish(10025) -> [{20006, 5}, {20618, 2}];
get_polish(10026) -> [{20006, 5}, {20618, 2}];
get_polish(10027) -> [{20006, 5}, {20618, 2}];
get_polish(10028) -> [{20006, 5}, {20618, 2}];
get_polish(10029) -> [{20006, 5}, {20618, 2}];
get_polish(10030) -> [{20006, 5}, {20618, 2}];
get_polish(10031) -> [{20006, 5}, {20618, 2}];
get_polish(10032) -> [{20006, 5}, {20618, 2}];
get_polish(10033) -> [{20006, 5}, {20618, 2}];
get_polish(10034) -> [{20006, 5}, {20618, 2}];
get_polish(10035) -> [{20006, 5}, {20618, 2}];
get_polish(10036) -> [{20006, 5}, {20618, 2}];
get_polish(10037) -> [{20006, 5}, {20618, 2}];
get_polish(10038) -> [{20006, 5}, {20618, 2}];
get_polish(10039) -> [{20006, 5}, {20618, 2}];
get_polish(20000) -> [{20006, 5}, {20618, 2}];
get_polish(20001) -> [{20006, 5}, {20618, 2}];
get_polish(20004) -> [{20006, 5}, {20618, 2}];
get_polish(20002) -> [{20006, 5}, {20618, 2}];
get_polish(20003) -> [{20006, 5}, {20618, 2}];
get_polish(20005) -> [{20006, 5}, {20618, 2}];
get_polish(20006) -> [{20006, 5}, {20618, 2}];
get_polish(20007) -> [{20006, 5}, {20618, 2}];
get_polish(20008) -> [{20006, 5}, {20618, 2}];
get_polish(20009) -> [{20006, 5}, {20618, 2}];
get_polish(20010) -> [{20006, 5}, {20618, 2}];
get_polish(20012) -> [{20006, 5}, {20618, 2}];
get_polish(20013) -> [{20006, 5}, {20618, 2}];
get_polish(20014) -> [{20006, 5}, {20618, 2}];
get_polish(20015) -> [{20006, 5}, {20618, 2}];
get_polish(20016) -> [{20006, 5}, {20618, 2}];
get_polish(20017) -> [{20006, 5}, {20618, 2}];
get_polish(20018) -> [{20006, 5}, {20618, 2}];
get_polish(20019) -> [{20006, 5}, {20618, 2}];
get_polish(20020) -> [{20006, 5}, {20618, 2}];
get_polish(20021) -> [{20006, 5}, {20618, 2}];
get_polish(20022) -> [{20006, 5}, {20618, 2}];
get_polish(20023) -> [{20006, 5}, {20618, 2}];
get_polish(20024) -> [{20006, 5}, {20618, 2}];
get_polish(20025) -> [{20006, 5}, {20618, 2}];
get_polish(20026) -> [{20006, 5}, {20618, 2}];
get_polish(20027) -> [{20006, 5}, {20618, 2}];
get_polish(20028) -> [{20006, 5}, {20618, 2}];
get_polish(20029) -> [{20006, 5}, {20618, 2}];
get_polish(20030) -> [{20006, 5}, {20618, 2}];
get_polish(20031) -> [{20006, 5}, {20618, 2}];
get_polish(20032) -> [{20006, 5}, {20618, 2}];
get_polish(20033) -> [{20006, 5}, {20618, 2}];
get_polish(20034) -> [{20006, 5}, {20618, 2}];
get_polish(20035) -> [{20006, 5}, {20618, 2}];
get_polish(20036) -> [{20006, 5}, {20618, 2}];
get_polish(20037) -> [{20006, 5}, {20618, 2}];
get_polish(20038) -> [{20006, 5}, {20618, 2}];
get_polish(20039) -> [{20006, 5}, {20618, 2}];
get_polish(20041) -> [{20006, 5}, {20618, 2}];
get_polish(20042) -> [{20006, 5}, {20618, 2}];
get_polish(20043) -> [{20006, 5}, {20618, 2}];
get_polish(20044) -> [{20006, 5}, {20618, 2}];
get_polish(20045) -> [{20006, 5}, {20618, 2}];
get_polish(20046) -> [{20006, 5}, {20618, 2}];
get_polish(20047) -> [{20006, 5}, {20618, 2}];
get_polish(20048) -> [{20006, 5}, {20618, 2}];
get_polish(20049) -> [{20006, 5}, {20618, 2}];
get_polish(20050) -> [{20006, 5}, {20618, 2}];
get_polish(20051) -> [{20006, 5}, {20618, 2}];
get_polish(20052) -> [{20006, 5}, {20618, 2}];
get_polish(20053) -> [{20006, 5}, {20618, 2}];
get_polish(20055) -> [{20006, 5}, {20618, 2}];
get_polish(20057) -> [{20006, 5}, {20618, 2}];
get_polish(20058) -> [{20006, 5}, {20618, 2}];
get_polish(20060) -> [{20006, 5}, {20618, 2}];
get_polish(20061) -> [{20006, 5}, {20618, 2}];
get_polish(20062) -> [{20006, 5}, {20618, 2}];
get_polish(20063) -> [{20006, 5}, {20618, 2}];
get_polish(20064) -> [{20006, 5}, {20618, 2}];
get_polish(20065) -> [{20006, 5}, {20618, 2}];
get_polish(20066) -> [{20006, 5}, {20618, 2}];
get_polish(20067) -> [{20006, 5}, {20618, 2}];
get_polish(20068) -> [{20006, 5}, {20618, 2}];
get_polish(20069) -> [{20006, 5}, {20618, 2}];
get_polish(_) -> false.

get_stone_attr({20601, 101, 1}) -> 8;
get_stone_attr({20601, 101, 2}) -> 9;
get_stone_attr({20601, 101, 3}) -> 10;
get_stone_attr({20601, 101, 4}) -> 11;
get_stone_attr({20601, 101, 5}) -> 12;
get_stone_attr({20601, 101, 6}) -> 13;
get_stone_attr({20601, 101, 7}) -> 14;
get_stone_attr({20601, 101, 8}) -> 15;
get_stone_attr({20602, 101, 1}) -> 11;
get_stone_attr({20602, 101, 2}) -> 12;
get_stone_attr({20602, 101, 3}) -> 13;
get_stone_attr({20602, 101, 4}) -> 14;
get_stone_attr({20602, 101, 5}) -> 15;
get_stone_attr({20602, 101, 6}) -> 16;
get_stone_attr({20602, 101, 7}) -> 17;
get_stone_attr({20602, 101, 8}) -> 18;
get_stone_attr({20604, 103, 1}) -> 8;
get_stone_attr({20604, 103, 2}) -> 9;
get_stone_attr({20604, 103, 3}) -> 10;
get_stone_attr({20604, 103, 4}) -> 11;
get_stone_attr({20604, 103, 5}) -> 12;
get_stone_attr({20604, 103, 6}) -> 13;
get_stone_attr({20604, 103, 7}) -> 14;
get_stone_attr({20604, 103, 8}) -> 15;
get_stone_attr({20605, 103, 1}) -> 11;
get_stone_attr({20605, 103, 2}) -> 12;
get_stone_attr({20605, 103, 3}) -> 13;
get_stone_attr({20605, 103, 4}) -> 14;
get_stone_attr({20605, 103, 5}) -> 15;
get_stone_attr({20605, 103, 6}) -> 16;
get_stone_attr({20605, 103, 7}) -> 17;
get_stone_attr({20605, 103, 8}) -> 18;
get_stone_attr({20607, 102, 1}) -> 8;
get_stone_attr({20607, 102, 2}) -> 9;
get_stone_attr({20607, 102, 3}) -> 10;
get_stone_attr({20607, 102, 4}) -> 11;
get_stone_attr({20607, 102, 5}) -> 12;
get_stone_attr({20607, 102, 6}) -> 13;
get_stone_attr({20607, 102, 7}) -> 14;
get_stone_attr({20607, 102, 8}) -> 15;
get_stone_attr({20608, 102, 1}) -> 11;
get_stone_attr({20608, 102, 2}) -> 12;
get_stone_attr({20608, 102, 3}) -> 13;
get_stone_attr({20608, 102, 4}) -> 14;
get_stone_attr({20608, 102, 5}) -> 15;
get_stone_attr({20608, 102, 6}) -> 16;
get_stone_attr({20608, 102, 7}) -> 17;
get_stone_attr({20608, 102, 8}) -> 18;
get_stone_attr({20613, 104, 1}) -> 8;
get_stone_attr({20613, 104, 2}) -> 9;
get_stone_attr({20613, 104, 3}) -> 10;
get_stone_attr({20613, 104, 4}) -> 11;
get_stone_attr({20613, 104, 5}) -> 12;
get_stone_attr({20613, 104, 6}) -> 13;
get_stone_attr({20613, 104, 7}) -> 14;
get_stone_attr({20613, 104, 8}) -> 15;
get_stone_attr({20614, 104, 1}) -> 11;
get_stone_attr({20614, 104, 2}) -> 12;
get_stone_attr({20614, 104, 3}) -> 13;
get_stone_attr({20614, 104, 4}) -> 14;
get_stone_attr({20614, 104, 5}) -> 15;
get_stone_attr({20614, 104, 6}) -> 16;
get_stone_attr({20614, 104, 7}) -> 17;
get_stone_attr({20614, 104, 8}) -> 18;
get_stone_attr(_) -> 0.

get_high_stone(20615) -> {0, 0, 0};
get_high_stone(20616) -> {0, 0, 0};
get_high_stone(20617) -> {250, 20638, 20640};
get_high_stone(20638) -> {0, 0, 0};
get_high_stone(23856) -> {0, 0, 0};
get_high_stone(23857) -> {0, 0, 0};
get_high_stone(23858) -> {0, 0, 0};
get_high_stone(_) -> false.

get_grade({10000, 1}) -> {20, 2};
get_grade({10001, 1}) -> {20, 2};
get_grade({10002, 1}) -> {20, 2};
get_grade({10003, 1}) -> {20, 2};
get_grade({10004, 1}) -> {20, 2};
get_grade({10005, 1}) -> {20, 2};
get_grade({10006, 1}) -> {20, 2};
get_grade({10007, 1}) -> {20, 2};
get_grade({10008, 1}) -> {20, 2};
get_grade({10009, 1}) -> {20, 2};
get_grade({10010, 1}) -> {20, 2};
get_grade({10011, 1}) -> {20, 2};
get_grade({10012, 1}) -> {20, 2};
get_grade({10013, 1}) -> {20, 2};
get_grade({10014, 1}) -> {20, 2};
get_grade({10015, 1}) -> {20, 2};
get_grade({10015, 2}) -> {20, 3};
get_grade({10016, 1}) -> {20, 2};
get_grade({10016, 2}) -> {20, 3};
get_grade({10017, 1}) -> {20, 2};
get_grade({10017, 2}) -> {20, 3};
get_grade({10019, 1}) -> {20, 2};
get_grade({10019, 2}) -> {20, 3};
get_grade({10021, 1}) -> {20, 2};
get_grade({10021, 2}) -> {20, 3};
get_grade({10022, 1}) -> {20, 2};
get_grade({10022, 2}) -> {20, 3};
get_grade({10023, 1}) -> {20, 2};
get_grade({10023, 2}) -> {20, 3};
get_grade({10024, 1}) -> {20, 2};
get_grade({10024, 2}) -> {20, 3};
get_grade({10025, 1}) -> {20, 2};
get_grade({10025, 2}) -> {20, 3};
get_grade({10026, 1}) -> {20, 2};
get_grade({10026, 2}) -> {20, 3};
get_grade({10027, 1}) -> {20, 2};
get_grade({10027, 2}) -> {20, 3};
get_grade({10028, 1}) -> {20, 2};
get_grade({10028, 2}) -> {20, 3};
get_grade({10029, 1}) -> {20, 2};
get_grade({10029, 2}) -> {20, 3};
get_grade({10030, 1}) -> {20, 2};
get_grade({10030, 2}) -> {20, 3};
get_grade({10031, 1}) -> {20, 2};
get_grade({10031, 2}) -> {20, 3};
get_grade({10032, 1}) -> {20, 2};
get_grade({10032, 2}) -> {20, 3};
get_grade({10033, 1}) -> {20, 2};
get_grade({10033, 2}) -> {20, 3};
get_grade({10034, 1}) -> {20, 2};
get_grade({10034, 2}) -> {20, 3};
get_grade({10035, 1}) -> {20, 2};
get_grade({10035, 2}) -> {20, 3};
get_grade({10036, 1}) -> {20, 2};
get_grade({10036, 2}) -> {20, 3};
get_grade({10037, 1}) -> {20, 2};
get_grade({10037, 2}) -> {20, 3};
get_grade({10038, 1}) -> {20, 2};
get_grade({10038, 2}) -> {20, 3};
get_grade({10039, 1}) -> {20, 2};
get_grade({10039, 2}) -> {20, 3};
get_grade({20000, 1}) -> {30, 2};
get_grade({20000, 2}) -> {30, 3};
get_grade({20000, 3}) -> {30, 4};
get_grade({20001, 1}) -> {30, 2};
get_grade({20001, 2}) -> {30, 3};
get_grade({20001, 3}) -> {30, 4};
get_grade({20002, 1}) -> {30, 2};
get_grade({20002, 2}) -> {30, 3};
get_grade({20002, 3}) -> {30, 4};
get_grade({20003, 1}) -> {30, 2};
get_grade({20003, 2}) -> {30, 3};
get_grade({20003, 3}) -> {30, 4};
get_grade({20004, 1}) -> {30, 2};
get_grade({20004, 2}) -> {30, 3};
get_grade({20004, 3}) -> {30, 4};
get_grade({20005, 1}) -> {30, 2};
get_grade({20005, 2}) -> {30, 3};
get_grade({20005, 3}) -> {30, 4};
get_grade({20006, 1}) -> {30, 2};
get_grade({20006, 2}) -> {30, 3};
get_grade({20006, 3}) -> {30, 4};
get_grade({20007, 1}) -> {30, 2};
get_grade({20007, 2}) -> {30, 3};
get_grade({20007, 3}) -> {30, 4};
get_grade({20008, 1}) -> {30, 2};
get_grade({20009, 1}) -> {30, 2};
get_grade({20010, 1}) -> {30, 2};
get_grade({20010, 2}) -> {30, 3};
get_grade({20010, 3}) -> {30, 4};
get_grade({20012, 1}) -> {30, 2};
get_grade({20012, 2}) -> {30, 3};
get_grade({20012, 3}) -> {30, 4};
get_grade({20016, 1}) -> {30, 2};
get_grade({20016, 2}) -> {30, 3};
get_grade({20016, 3}) -> {30, 4};
get_grade({20018, 1}) -> {30, 2};
get_grade({20018, 2}) -> {30, 3};
get_grade({20018, 3}) -> {30, 4};
get_grade({20020, 1}) -> {30, 2};
get_grade({20020, 2}) -> {30, 3};
get_grade({20020, 3}) -> {30, 4};
get_grade(_) -> false.

get_stone_skill(20615) ->
    {1,
     [{60001, 100},
      {60002, 100},
      {60003, 100},
      {60004, 100},
      {60005, 100},
      {60006, 100},
      {60007, 100},
      {60008, 100},
      {60009, 100},
      {60011, 100},
      {60012, 100},
      {60013, 100},
      {60021, 100},
      {60022, 100},
      {60026, 100},
      {60027, 100},
      {60028, 100},
      {60029, 100},
      {60030, 100},
      {60031, 100},
      {60032, 100},
      {60033, 100},
      {60034, 100},
      {60035, 100},
      {60036, 100},
      {60037, 100},
      {60038, 100},
      {60039, 100},
      {60040, 100},
      {60041, 100},
      {60042, 100},
      {60043, 100},
      {60044, 100},
      {60045, 100},
      {60046, 100},
      {60047, 100},
      {60048, 100},
      {60049, 100},
      {60050, 100},
      {60051, 100},
      {60052, 100},
      {60053, 100},
      {60055, 100},
      {60054, 100},
      {60056, 100},
      {60057, 100},
      {60058, 100},
      {60059, 100},
      {60060, 100},
      {60061, 100},
      {60062, 100},
      {60063, 100},
      {60064, 100},
      {60072, 100},
      {60076, 100},
      {60078, 100},
      {60079, 100},
      {60080, 100},
      {60081, 100},
      {60083, 100}],
     [{60001, 100},
      {60002, 100},
      {60003, 100},
      {60004, 100},
      {60005, 100},
      {60006, 100},
      {60007, 100},
      {60008, 100},
      {60009, 100},
      {60011, 100},
      {60012, 100},
      {60013, 100},
      {60021, 100},
      {60022, 100},
      {60026, 100},
      {60027, 100},
      {60028, 100},
      {60029, 100},
      {60030, 100},
      {60031, 100},
      {60032, 100},
      {60033, 100},
      {60034, 100},
      {60035, 100},
      {60036, 100},
      {60037, 100},
      {60038, 100},
      {60039, 100},
      {60040, 100},
      {60041, 100},
      {60042, 100},
      {60043, 100},
      {60044, 100},
      {60045, 100},
      {60046, 100},
      {60047, 100},
      {60048, 100},
      {60049, 100},
      {60050, 100},
      {60051, 100},
      {60052, 100},
      {60053, 100},
      {60055, 100},
      {60054, 100},
      {60056, 100},
      {60057, 100},
      {60058, 100},
      {60059, 100},
      {60060, 100},
      {60061, 100},
      {60062, 100},
      {60063, 100},
      {60064, 100},
      {60072, 100},
      {60076, 100},
      {60078, 100},
      {60079, 100},
      {60080, 100},
      {60081, 100},
      {60083, 100}]};
get_stone_skill(20616) ->
    {2,
     [{60001, 100},
      {60002, 100},
      {60003, 100},
      {60004, 100},
      {60005, 100},
      {60006, 100},
      {60007, 100},
      {60008, 100},
      {60009, 100},
      {60011, 100},
      {60012, 100},
      {60013, 100},
      {60021, 100},
      {60022, 100},
      {60026, 100},
      {60027, 100},
      {60028, 100},
      {60029, 100},
      {60030, 100},
      {60031, 100},
      {60032, 100},
      {60033, 100},
      {60034, 100},
      {60035, 100},
      {60036, 100},
      {60037, 100},
      {60038, 100},
      {60039, 100},
      {60040, 100},
      {60041, 100},
      {60042, 100},
      {60043, 100},
      {60044, 100},
      {60045, 100},
      {60046, 100},
      {60047, 100},
      {60048, 100},
      {60049, 100},
      {60050, 100},
      {60051, 100},
      {60052, 100},
      {60053, 100},
      {60055, 100},
      {60054, 100},
      {60056, 100},
      {60057, 100},
      {60058, 100},
      {60059, 100},
      {60060, 100},
      {60061, 100},
      {60062, 100},
      {60063, 100},
      {60064, 100},
      {60072, 100},
      {60076, 100},
      {60078, 100},
      {60079, 100},
      {60080, 100},
      {60081, 100},
      {60083, 100}],
     [{60001, 100},
      {60002, 100},
      {60003, 100},
      {60004, 100},
      {60005, 100},
      {60006, 100},
      {60007, 100},
      {60008, 100},
      {60009, 100},
      {60011, 100},
      {60012, 100},
      {60013, 100},
      {60014, 100},
      {60015, 100},
      {60016, 100},
      {60021, 100},
      {60022, 100},
      {60026, 100},
      {60027, 100},
      {60028, 100},
      {60029, 100},
      {60030, 100},
      {60031, 100},
      {60032, 100},
      {60033, 100},
      {60034, 100},
      {60035, 100},
      {60036, 100},
      {60037, 100},
      {60038, 100},
      {60039, 100},
      {60040, 100},
      {60041, 100},
      {60042, 100},
      {60043, 100},
      {60044, 100},
      {60045, 100},
      {60046, 100},
      {60047, 100},
      {60048, 100},
      {60049, 100},
      {60050, 100},
      {60051, 100},
      {60052, 100},
      {60053, 100},
      {60055, 100},
      {60054, 100},
      {60076, 100},
      {60078, 100},
      {60079, 100},
      {60080, 100},
      {60081, 100},
      {60083, 100},
      {60019, 100},
      {60101, 100},
      {60102, 100},
      {60103, 100},
      {60104, 100},
      {60105, 100},
      {60106, 100},
      {60121, 100},
      {60122, 100},
      {60126, 100},
      {60127, 100},
      {60128, 100},
      {60129, 100},
      {60130, 100},
      {60131, 100},
      {60132, 100},
      {60133, 100},
      {60134, 100},
      {60135, 100},
      {60136, 100},
      {60137, 100},
      {60138, 100},
      {60139, 100},
      {60140, 100},
      {60141, 100},
      {60142, 100},
      {60143, 100},
      {60144, 100},
      {60145, 100},
      {60146, 100},
      {60147, 100},
      {60148, 100},
      {60149, 100},
      {60150, 100},
      {60151, 100},
      {60152, 100},
      {60153, 100},
      {60154, 100},
      {60155, 100},
      {60156, 100},
      {60157, 100},
      {60158, 100},
      {60159, 100},
      {60160, 100},
      {60161, 100},
      {60162, 100},
      {60163, 100},
      {60164, 100},
      {60165, 100},
      {60166, 100},
      {60168, 100},
      {60169, 100},
      {60170, 100},
      {60171, 100},
      {60172, 100}]};
get_stone_skill(20617) ->
    {2,
     [{60001, 100},
      {60002, 100},
      {60003, 100},
      {60004, 100},
      {60005, 100},
      {60006, 100},
      {60007, 100},
      {60008, 100},
      {60009, 100},
      {60011, 100},
      {60012, 100},
      {60013, 100},
      {60014, 100},
      {60015, 100},
      {60016, 100},
      {60021, 100},
      {60022, 100},
      {60026, 100},
      {60027, 100},
      {60028, 100},
      {60029, 100},
      {60030, 100},
      {60031, 100},
      {60032, 100},
      {60033, 100},
      {60034, 100},
      {60035, 100},
      {60036, 100},
      {60037, 100},
      {60038, 100},
      {60039, 100},
      {60040, 100},
      {60041, 100},
      {60042, 100},
      {60043, 100},
      {60044, 100},
      {60045, 100},
      {60046, 100},
      {60047, 100},
      {60048, 100},
      {60049, 100},
      {60050, 100},
      {60051, 100},
      {60052, 100},
      {60053, 100},
      {60055, 100},
      {60054, 100},
      {60076, 100},
      {60078, 100},
      {60079, 100},
      {60080, 100},
      {60081, 100},
      {60083, 100},
      {60019, 100},
      {60101, 100},
      {60102, 100},
      {60103, 100},
      {60104, 100},
      {60105, 100},
      {60106, 100},
      {60121, 100},
      {60122, 100},
      {60126, 100},
      {60127, 100},
      {60128, 100},
      {60129, 100},
      {60130, 100},
      {60131, 100},
      {60132, 100},
      {60133, 100},
      {60134, 100},
      {60135, 100},
      {60136, 100},
      {60137, 100},
      {60138, 100},
      {60139, 100},
      {60140, 100},
      {60141, 100},
      {60142, 100},
      {60143, 100},
      {60144, 100},
      {60145, 100},
      {60146, 100},
      {60147, 100},
      {60148, 100},
      {60149, 100},
      {60150, 100},
      {60151, 100},
      {60152, 100},
      {60153, 100},
      {60154, 100},
      {60155, 100},
      {60156, 100},
      {60157, 100},
      {60158, 100},
      {60159, 100},
      {60160, 100},
      {60161, 100},
      {60162, 100},
      {60163, 100},
      {60164, 100},
      {60165, 100},
      {60166, 100},
      {60168, 100},
      {60169, 100},
      {60170, 100},
      {60171, 100},
      {60172, 100}],
     [{60014, 100},
      {60015, 100},
      {60016, 100},
      {60019, 100},
      {60101, 100},
      {60102, 100},
      {60103, 100},
      {60104, 100},
      {60105, 100},
      {60106, 100},
      {60121, 100},
      {60122, 100},
      {60126, 100},
      {60127, 100},
      {60128, 100},
      {60129, 100},
      {60130, 100},
      {60131, 100},
      {60132, 100},
      {60133, 100},
      {60134, 100},
      {60135, 100},
      {60136, 100},
      {60137, 100},
      {60138, 100},
      {60139, 100},
      {60140, 100},
      {60141, 100},
      {60142, 100},
      {60143, 100},
      {60144, 100},
      {60145, 100},
      {60146, 100},
      {60147, 100},
      {60148, 100},
      {60149, 100},
      {60150, 100},
      {60151, 100},
      {60152, 100},
      {60153, 100},
      {60154, 100},
      {60155, 100},
      {60156, 100},
      {60157, 100},
      {60158, 100},
      {60159, 100},
      {60160, 100},
      {60161, 100},
      {60162, 100},
      {60163, 100},
      {60164, 100},
      {60165, 100},
      {60166, 100},
      {60168, 100},
      {60169, 100},
      {60170, 100},
      {60171, 100},
      {60172, 100}]};
get_stone_skill(20638) ->
    {2,
     [{60014, 100},
      {60015, 100},
      {60016, 100},
      {60019, 100},
      {60101, 100},
      {60102, 100},
      {60103, 100},
      {60104, 100},
      {60105, 100},
      {60106, 100},
      {60121, 100},
      {60122, 100},
      {60126, 100},
      {60127, 100},
      {60128, 100},
      {60129, 100},
      {60130, 100},
      {60131, 100},
      {60132, 100},
      {60133, 100},
      {60134, 100},
      {60135, 100},
      {60136, 100},
      {60137, 100},
      {60138, 100},
      {60139, 100},
      {60140, 100},
      {60141, 100},
      {60142, 100},
      {60143, 100},
      {60144, 100},
      {60145, 100},
      {60146, 100},
      {60147, 100},
      {60148, 100},
      {60149, 100},
      {60150, 100},
      {60151, 100},
      {60152, 100},
      {60153, 100},
      {60154, 100},
      {60155, 100},
      {60156, 100},
      {60157, 100},
      {60158, 100},
      {60159, 100},
      {60160, 100},
      {60161, 100},
      {60162, 100},
      {60163, 100},
      {60164, 100},
      {60165, 100},
      {60166, 100},
      {60168, 100},
      {60169, 100},
      {60170, 100},
      {60171, 100},
      {60172, 100},
      {60201, 60},
      {60202, 60},
      {60203, 60},
      {60204, 60},
      {60205, 60},
      {60206, 60},
      {60207, 60},
      {60221, 60},
      {60226, 60},
      {60227, 60},
      {60228, 60},
      {60229, 60},
      {60230, 60},
      {60231, 60},
      {60232, 60},
      {60233, 60},
      {60234, 60},
      {60235, 60},
      {60236, 60},
      {60237, 60},
      {60238, 60},
      {60239, 60},
      {60240, 60},
      {60241, 60},
      {60242, 60},
      {60243, 60},
      {60244, 60},
      {60245, 60},
      {60247, 60},
      {60248, 60},
      {60249, 60},
      {60250, 60},
      {60251, 60},
      {60252, 60},
      {60253, 60},
      {60254, 60},
      {60255, 60},
      {60256, 60},
      {60257, 60},
      {60258, 60},
      {60259, 60},
      {60260, 60},
      {60261, 60},
      {60262, 60},
      {60263, 60},
      {60264, 60},
      {60265, 60},
      {60266, 60},
      {60268, 60},
      {60269, 60},
      {60270, 60},
      {60271, 60},
      {60272, 60}],
     [{60014, 100},
      {60015, 100},
      {60016, 100},
      {60019, 100},
      {60101, 100},
      {60102, 100},
      {60103, 100},
      {60104, 100},
      {60105, 100},
      {60106, 100},
      {60121, 100},
      {60122, 100},
      {60126, 100},
      {60127, 100},
      {60128, 100},
      {60129, 100},
      {60130, 100},
      {60131, 100},
      {60132, 100},
      {60133, 100},
      {60134, 100},
      {60135, 100},
      {60136, 100},
      {60137, 100},
      {60138, 100},
      {60139, 100},
      {60140, 100},
      {60141, 100},
      {60142, 100},
      {60143, 100},
      {60144, 100},
      {60145, 100},
      {60146, 100},
      {60147, 100},
      {60148, 100},
      {60149, 100},
      {60150, 100},
      {60151, 100},
      {60152, 100},
      {60153, 100},
      {60154, 100},
      {60155, 100},
      {60156, 100},
      {60157, 100},
      {60158, 100},
      {60159, 100},
      {60160, 100},
      {60161, 100},
      {60162, 100},
      {60163, 100},
      {60164, 100},
      {60165, 100},
      {60166, 100},
      {60168, 100},
      {60169, 100},
      {60170, 100},
      {60171, 100},
      {60172, 100}]};
get_stone_skill(23856) ->
    {1,
     [{60001, 700},
      {60002, 700},
      {60003, 700},
      {60005, 700},
      {60021, 100},
      {60022, 100},
      {60026, 700},
      {60027, 700},
      {60028, 700},
      {60029, 700},
      {60030, 700},
      {60031, 700},
      {60032, 700},
      {60033, 700},
      {60034, 700},
      {60035, 700},
      {60036, 700},
      {60038, 700},
      {60040, 700},
      {60042, 700},
      {60043, 700},
      {60044, 700},
      {60045, 700},
      {60046, 700},
      {60047, 700},
      {60048, 700},
      {60049, 700},
      {60050, 700},
      {60051, 700},
      {60052, 700},
      {60053, 700},
      {60054, 700},
      {60055, 700},
      {60056, 700},
      {60057, 700},
      {60058, 700},
      {60059, 700},
      {60060, 700},
      {60061, 700},
      {60062, 700},
      {60064, 700},
      {60076, 700},
      {60078, 700},
      {60079, 700},
      {60080, 700},
      {60081, 700},
      {60082, 700},
      {60083, 700},
      {60101, 300},
      {60102, 300},
      {60103, 300},
      {60105, 300},
      {60126, 300},
      {60127, 300},
      {60128, 300},
      {60129, 300},
      {60130, 300},
      {60131, 300},
      {60132, 300},
      {60133, 300},
      {60134, 300},
      {60135, 300},
      {60136, 300},
      {60138, 300},
      {60140, 300},
      {60142, 300},
      {60143, 300},
      {60144, 300},
      {60145, 300},
      {60146, 300},
      {60147, 300},
      {60148, 300},
      {60149, 300},
      {60150, 300},
      {60151, 300},
      {60152, 300},
      {60153, 300},
      {60154, 300},
      {60155, 300},
      {60156, 300},
      {60157, 300},
      {60158, 300},
      {60159, 300},
      {60160, 300},
      {60161, 300},
      {60162, 300},
      {60164, 300},
      {60166, 300},
      {60168, 300},
      {60169, 300},
      {60170, 300},
      {60171, 300},
      {60172, 300}],
     [{60001, 700},
      {60002, 700},
      {60003, 700},
      {60005, 700},
      {60021, 100},
      {60022, 100},
      {60026, 700},
      {60027, 700},
      {60028, 700},
      {60029, 700},
      {60030, 700},
      {60031, 700},
      {60032, 700},
      {60033, 700},
      {60034, 700},
      {60035, 700},
      {60036, 700},
      {60038, 700},
      {60040, 700},
      {60042, 700},
      {60043, 700},
      {60044, 700},
      {60045, 700},
      {60046, 700},
      {60047, 700},
      {60048, 700},
      {60049, 700},
      {60050, 700},
      {60051, 700},
      {60052, 700},
      {60053, 700},
      {60054, 700},
      {60055, 700},
      {60056, 700},
      {60057, 700},
      {60058, 700},
      {60059, 700},
      {60060, 700},
      {60061, 700},
      {60062, 700},
      {60064, 700},
      {60076, 700},
      {60078, 700},
      {60079, 700},
      {60080, 700},
      {60081, 700},
      {60082, 700},
      {60083, 700},
      {60101, 300},
      {60102, 300},
      {60103, 300},
      {60105, 300},
      {60126, 300},
      {60127, 300},
      {60128, 300},
      {60129, 300},
      {60130, 300},
      {60131, 300},
      {60132, 300},
      {60133, 300},
      {60134, 300},
      {60135, 300},
      {60136, 300},
      {60138, 300},
      {60140, 300},
      {60142, 300},
      {60143, 300},
      {60144, 300},
      {60145, 300},
      {60146, 300},
      {60147, 300},
      {60148, 300},
      {60149, 300},
      {60150, 300},
      {60151, 300},
      {60152, 300},
      {60153, 300},
      {60154, 300},
      {60155, 300},
      {60156, 300},
      {60157, 300},
      {60158, 300},
      {60159, 300},
      {60160, 300},
      {60161, 300},
      {60162, 300},
      {60164, 300},
      {60166, 300},
      {60168, 300},
      {60169, 300},
      {60170, 300},
      {60171, 300},
      {60172, 300}]};
get_stone_skill(23857) ->
    {3,
     [{60101, 700},
      {60102, 700},
      {60103, 700},
      {60105, 700},
      {60121, 100},
      {60122, 100},
      {60126, 700},
      {60127, 700},
      {60128, 700},
      {60129, 700},
      {60130, 700},
      {60131, 700},
      {60132, 700},
      {60133, 700},
      {60134, 700},
      {60135, 700},
      {60136, 700},
      {60138, 700},
      {60140, 700},
      {60142, 700},
      {60143, 700},
      {60144, 700},
      {60145, 700},
      {60146, 700},
      {60147, 700},
      {60148, 700},
      {60149, 700},
      {60150, 700},
      {60151, 700},
      {60152, 700},
      {60153, 700},
      {60154, 700},
      {60155, 700},
      {60156, 700},
      {60157, 700},
      {60158, 700},
      {60159, 700},
      {60160, 700},
      {60161, 700},
      {60162, 700},
      {60164, 700},
      {60166, 700},
      {60168, 700},
      {60169, 700},
      {60170, 700},
      {60171, 700},
      {60172, 700}],
     [{60001, 700},
      {60002, 700},
      {60003, 700},
      {60005, 700},
      {60121, 100},
      {60122, 100},
      {60026, 700},
      {60027, 700},
      {60028, 700},
      {60029, 700},
      {60030, 700},
      {60031, 700},
      {60032, 700},
      {60033, 700},
      {60034, 700},
      {60035, 700},
      {60036, 700},
      {60038, 700},
      {60040, 700},
      {60042, 700},
      {60043, 700},
      {60044, 700},
      {60045, 700},
      {60046, 700},
      {60047, 700},
      {60048, 700},
      {60049, 700},
      {60050, 700},
      {60051, 700},
      {60052, 700},
      {60053, 700},
      {60054, 700},
      {60055, 700},
      {60056, 700},
      {60057, 700},
      {60058, 700},
      {60059, 700},
      {60060, 700},
      {60061, 700},
      {60062, 700},
      {60064, 700},
      {60076, 700},
      {60078, 700},
      {60079, 700},
      {60080, 700},
      {60081, 700},
      {60082, 700},
      {60083, 700}]};
get_stone_skill(23858) ->
    {2,
     [{60101, 700},
      {60102, 700},
      {60103, 700},
      {60105, 700},
      {60121, 100},
      {60122, 100},
      {60126, 700},
      {60127, 700},
      {60128, 700},
      {60129, 700},
      {60130, 700},
      {60131, 700},
      {60132, 700},
      {60133, 700},
      {60134, 700},
      {60135, 700},
      {60136, 700},
      {60138, 700},
      {60140, 700},
      {60142, 700},
      {60143, 700},
      {60144, 700},
      {60145, 700},
      {60146, 700},
      {60147, 700},
      {60148, 700},
      {60149, 700},
      {60150, 700},
      {60151, 700},
      {60152, 700},
      {60153, 700},
      {60154, 700},
      {60155, 700},
      {60156, 700},
      {60157, 700},
      {60158, 700},
      {60159, 700},
      {60160, 700},
      {60161, 700},
      {60162, 700},
      {60164, 700},
      {60166, 700},
      {60168, 700},
      {60169, 700},
      {60170, 700},
      {60171, 700},
      {60172, 700}],
     [{60001, 300},
      {60002, 300},
      {60003, 300},
      {60005, 300},
      {60021, 100},
      {60022, 100},
      {60026, 300},
      {60027, 300},
      {60028, 300},
      {60029, 300},
      {60030, 300},
      {60031, 300},
      {60032, 300},
      {60033, 300},
      {60034, 300},
      {60035, 300},
      {60036, 300},
      {60038, 300},
      {60040, 300},
      {60042, 300},
      {60043, 300},
      {60044, 300},
      {60045, 300},
      {60046, 300},
      {60047, 300},
      {60048, 300},
      {60049, 300},
      {60050, 300},
      {60051, 300},
      {60052, 300},
      {60053, 300},
      {60054, 300},
      {60055, 300},
      {60056, 300},
      {60057, 300},
      {60058, 300},
      {60059, 300},
      {60060, 300},
      {60061, 300},
      {60062, 300},
      {60064, 300},
      {60076, 300},
      {60078, 300},
      {60079, 300},
      {60080, 300},
      {60081, 300},
      {60082, 300},
      {60083, 300},
      {60101, 700},
      {60102, 700},
      {60103, 700},
      {60105, 700},
      {60121, 100},
      {60122, 100},
      {60126, 700},
      {60127, 700},
      {60128, 700},
      {60129, 700},
      {60130, 700},
      {60131, 700},
      {60132, 700},
      {60133, 700},
      {60134, 700},
      {60135, 700},
      {60136, 700},
      {60138, 700},
      {60140, 700},
      {60142, 700},
      {60143, 700},
      {60144, 700},
      {60145, 700},
      {60146, 700},
      {60147, 700},
      {60148, 700},
      {60149, 700},
      {60150, 700},
      {60151, 700},
      {60152, 700},
      {60153, 700},
      {60154, 700},
      {60155, 700},
      {60156, 700},
      {60157, 700},
      {60158, 700},
      {60159, 700},
      {60160, 700},
      {60161, 700},
      {60162, 700},
      {60164, 700},
      {60166, 700},
      {60168, 700},
      {60169, 700},
      {60170, 700},
      {60171, 700},
      {60172, 700}]};
get_stone_skill(_) -> false.

allow_stone({10000, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10000, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10000, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10000, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10000, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10001, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10001, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10001, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10001, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10001, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10002, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10002, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10002, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10002, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10002, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10003, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10003, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10003, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10003, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10003, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10004, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10004, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10004, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10004, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10004, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10005, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10005, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10005, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10005, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10005, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10006, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10006, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10006, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10006, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10006, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10007, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10007, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10007, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10007, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10007, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10008, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10008, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10008, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10008, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10008, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10009, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10009, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10009, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10009, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10009, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10010, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10010, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10010, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10010, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10010, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10011, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10011, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10011, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10011, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10011, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10012, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10012, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10012, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10012, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10012, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10013, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10013, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10013, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10013, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10013, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10014, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10014, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10014, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10014, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10014, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10015, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10015, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10015, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10015, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10015, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10015, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10015, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10015, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10015, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10016, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10016, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10016, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10016, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10016, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10016, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10016, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10016, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10016, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10017, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10017, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10017, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10017, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10017, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10017, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10017, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10017, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10017, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10018, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10018, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10018, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10018, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10018, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10018, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10018, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10018, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10018, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10019, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10019, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10019, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10019, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10019, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10019, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10019, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10019, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10019, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10020, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10020, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10020, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10020, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10020, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10020, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10020, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10020, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10020, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10021, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10021, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10021, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10021, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10021, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10021, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10021, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10021, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10021, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10022, 0, 1}) -> [20615, 20616, 20617];
allow_stone({10022, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10022, 1, 1}) -> [20615, 20616, 20617];
allow_stone({10022, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10022, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10022, 2, 1}) -> [20615, 20616, 20617];
allow_stone({10022, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10022, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10022, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10023, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10023, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10023, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10023, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10023, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10023, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10023, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10023, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10023, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10024, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10024, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10024, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10024, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10024, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10024, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10024, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10024, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10024, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10025, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10025, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10025, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10025, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10025, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10025, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10025, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10025, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10025, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10026, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10026, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10026, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10026, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10026, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10026, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10026, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10026, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10026, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10027, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10027, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10027, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10027, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10027, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10027, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10027, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10027, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10027, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10028, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10028, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10028, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10028, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10028, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10028, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10028, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10028, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10028, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10029, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10029, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10029, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10029, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10029, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10029, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10029, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10029, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10029, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10030, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10030, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10030, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10030, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10030, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10030, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10030, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10030, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10030, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10031, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10031, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10031, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10031, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10031, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10031, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10031, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10031, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10031, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10032, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10032, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10032, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10032, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10032, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10032, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10032, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10032, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10032, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10033, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10033, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10033, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10033, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10033, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10033, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10033, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10033, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10033, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10034, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10034, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10034, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10034, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10034, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10034, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10034, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10034, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10034, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10035, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10035, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10035, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10035, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10035, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10035, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10035, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10035, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10035, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10036, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10036, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10036, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10036, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10036, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10036, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10036, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10036, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10036, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10037, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10037, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10037, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10037, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10037, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10037, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10037, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10037, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10037, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10038, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10038, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10038, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10038, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10038, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10038, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10038, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10038, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10038, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10039, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10039, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({10039, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10039, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10039, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({10039, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({10039, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10039, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({10039, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20000, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20000, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20000, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20000, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20000, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20000, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20000, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20000, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20001, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20001, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20001, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20001, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20001, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20001, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20001, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20001, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20002, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20002, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20002, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20002, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20002, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20002, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20002, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20002, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20003, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20003, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20003, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20003, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20003, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20003, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20003, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20003, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20004, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20004, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20004, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20004, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20004, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20004, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20004, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20004, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20005, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20005, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20005, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20005, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20005, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20005, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20005, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20005, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20006, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20006, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20006, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20006, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20006, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20006, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20006, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20006, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20007, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20007, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20007, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20007, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20007, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20007, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20007, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20007, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20008, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20008, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20008, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20008, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20008, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20008, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20008, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20008, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20009, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20009, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20009, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20009, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20009, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20009, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20009, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20009, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20010, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20010, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20010, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20010, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20010, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20010, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20010, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20010, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20012, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20012, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20012, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20012, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20012, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20012, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20012, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20012, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20013, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20013, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20013, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20013, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20013, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20013, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20013, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20013, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20014, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20014, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20014, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20014, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20014, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20014, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20014, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20014, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20015, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20015, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20015, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20015, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20015, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20015, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20015, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20015, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20016, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20016, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20016, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20016, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20016, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20016, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20016, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20016, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20017, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20017, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20017, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20017, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20017, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20017, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20017, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20017, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20018, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20018, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20018, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20018, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20018, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20018, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20018, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20018, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20019, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20019, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20019, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20019, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20019, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20019, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20019, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20019, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20020, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20020, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20020, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20020, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20020, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20020, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20020, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20020, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20021, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20021, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20021, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20021, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20021, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20021, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20021, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20021, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20022, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20022, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20022, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20022, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20022, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20022, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20022, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20022, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20023, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20023, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20023, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20023, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20023, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20023, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20023, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20023, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20024, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20024, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20024, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20024, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20024, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20024, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20024, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20024, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20025, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20025, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20025, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20025, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20025, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20025, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20025, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20025, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20026, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20026, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20026, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20026, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20026, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20026, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20026, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20026, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20027, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20027, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20027, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20027, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20027, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20027, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20027, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20027, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20028, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20028, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20028, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20028, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20028, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20028, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20028, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20028, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20029, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20029, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20029, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20029, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20029, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20029, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20029, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20029, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20030, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20030, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20030, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20030, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20030, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20030, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20030, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20030, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20031, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20031, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20031, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20031, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20031, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20031, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20031, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20031, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20032, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20032, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20032, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20032, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20032, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20032, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20032, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20032, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20033, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20033, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20033, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20033, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20033, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20033, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20033, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20033, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20034, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20034, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20034, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20034, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20034, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20034, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20034, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20034, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20035, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20035, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20035, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20035, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20035, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20035, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20035, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20035, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20036, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20036, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20036, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20036, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20036, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20036, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20036, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20036, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20037, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20037, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20037, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20037, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20037, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20037, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20037, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20037, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20038, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20038, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20038, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20038, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20038, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20038, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20038, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20038, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20039, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20039, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20039, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20039, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20039, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20039, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20039, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20039, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20041, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20041, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20041, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20041, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20041, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20041, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20041, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20041, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20042, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20042, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20042, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20042, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20042, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20042, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20042, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20042, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20043, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20043, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20043, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20043, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20043, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20043, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20043, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20043, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20044, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20044, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20044, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20044, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20044, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20044, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20044, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20044, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20045, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20045, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20045, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20045, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20045, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20045, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20045, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20045, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20046, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20046, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20046, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20046, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20046, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20046, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20046, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20046, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20047, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20047, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20047, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20047, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20047, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20047, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20047, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20047, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20048, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20048, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20048, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20048, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20048, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20048, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20048, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20048, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20049, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20049, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20049, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20049, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20049, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20049, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20049, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20049, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20050, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20050, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20050, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20050, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20050, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20050, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20050, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20050, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20051, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20051, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20051, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20051, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20051, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20051, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20051, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20051, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20052, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20052, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20052, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20052, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20052, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20052, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20052, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20052, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20053, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20053, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20053, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20053, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20053, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20053, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20053, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20053, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20055, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20055, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20055, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20055, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20055, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20055, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20055, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20055, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20057, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20057, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20057, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20057, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20057, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20057, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20057, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20057, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20058, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20058, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20058, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20058, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20058, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20058, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20058, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20058, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20060, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20060, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20060, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20060, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20060, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20060, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20060, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20060, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20061, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20061, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20061, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20061, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20061, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20061, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20061, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20061, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20062, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20062, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20062, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20062, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20062, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20062, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20062, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20062, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20063, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20063, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20063, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20063, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20063, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20063, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20063, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20063, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20064, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20064, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20064, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20064, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20064, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20064, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20064, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20064, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20065, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20065, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20065, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20065, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20065, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20065, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20065, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20065, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20066, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20066, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20066, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20066, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20066, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20066, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20066, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20066, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20067, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20067, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20067, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20067, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20067, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20067, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20067, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20067, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20068, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20068, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20068, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20068, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20068, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20068, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20068, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20068, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 0, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20069, 0, 2}) ->
    [20600, 20603, 20606, 20612];
allow_stone({20069, 1, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20069, 1, 2}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20069, 1, 3}) ->
    [20601, 20604, 20607, 20613];
allow_stone({20069, 2, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20069, 2, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 2, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 2, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 3, 1}) ->
    [20615, 20616, 20617, 20638];
allow_stone({20069, 3, 2}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 3, 3}) ->
    [20602, 20605, 20608, 20614];
allow_stone({20069, 3, 4}) ->
    [20602, 20605, 20608, 20614];
allow_stone(_) -> [].

get_rand_apt(10000) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10001) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10002) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10003) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10004) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10005) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45],
     [3, 4, 15, 30, 48, 60, 60, 55, 51, 48, 46, 45]};
get_rand_apt(10006) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10007) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10008) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10009) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10010) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10011) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10012) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10013) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10014) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10015) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10016) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10017) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10019) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10021) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10022) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10023) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10024) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10025) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10026) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10027) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10028) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10029) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10030) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10031) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10032) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10033) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10034) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10035) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10036) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10037) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10038) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(10039) ->
    {[4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [4, 10, 20, 35, 52, 55, 60, 56, 52, 48, 45, 38],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20000) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20001) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20002) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20003) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20004) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20005) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20006) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20007) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20008) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20009) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20010) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20012) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20016) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20018) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(20020) ->
    {[4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [4, 10, 23, 38, 54, 60, 60, 55, 46, 38, 30, 23],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0],
     [9, 15, 32, 66, 112, 126, 126, 125, 104, 86, 0, 0]};
get_rand_apt(_) -> false.

set_point(10000) -> {0, 0, 4, 0, 1};
set_point(10001) -> {4, 1, 0, 0, 0};
set_point(10002) -> {4, 1, 0, 0, 0};
set_point(10003) -> {4, 1, 0, 0, 0};
set_point(10004) -> {5, 0, 0, 0, 0};
set_point(10005) -> {0, 3, 0, 0, 2};
set_point(_) -> {1, 2, 1, 1}.

get_catch(30000) ->
    #{lev => 1, pet_id => 10001, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30001) ->
    #{lev => 1, pet_id => 10001, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30002) ->
    #{lev => 1, pet_id => 10002, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30003) ->
    #{lev => 15, pet_id => 10003, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30004) ->
    #{lev => 15, pet_id => 10004, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30005) ->
    #{lev => 15, pet_id => 10005, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30006) ->
    #{lev => 35, pet_id => 10006, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30007) ->
    #{lev => 35, pet_id => 10007, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30008) ->
    #{lev => 35, pet_id => 10008, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30009) ->
    #{lev => 45, pet_id => 10009, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30010) ->
    #{lev => 45, pet_id => 10010, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30011) ->
    #{lev => 45, pet_id => 10011, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30012) ->
    #{lev => 55, pet_id => 10012, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30013) ->
    #{lev => 55, pet_id => 10013, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30014) ->
    #{lev => 55, pet_id => 10014, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30015) ->
    #{lev => 65, pet_id => 10015, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30016) ->
    #{lev => 65, pet_id => 10016, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30017) ->
    #{lev => 65, pet_id => 10017, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30019) ->
    #{lev => 75, pet_id => 10019, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30021) ->
    #{lev => 75, pet_id => 10021, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30022) ->
    #{lev => 75, pet_id => 10022, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30023) ->
    #{lev => 85, pet_id => 10023, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30024) ->
    #{lev => 85, pet_id => 10024, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30025) ->
    #{lev => 85, pet_id => 10025, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30026) ->
    #{lev => 95, pet_id => 10026, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30027) ->
    #{lev => 95, pet_id => 10027, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30028) ->
    #{lev => 95, pet_id => 10028, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(30029) ->
    #{lev => 95, pet_id => 10029, genre => 0, ratio => 260,
      need_lev_break => 1};
get_catch(30030) ->
    #{lev => 95, pet_id => 10030, genre => 0, ratio => 260,
      need_lev_break => 1};
get_catch(91100) ->
    #{lev => 1, pet_id => 10001, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91101) ->
    #{lev => 1, pet_id => 10001, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91102) ->
    #{lev => 1, pet_id => 10002, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91103) ->
    #{lev => 1, pet_id => 10002, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91104) ->
    #{lev => 15, pet_id => 10003, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91105) ->
    #{lev => 15, pet_id => 10004, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91106) ->
    #{lev => 15, pet_id => 10003, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91107) ->
    #{lev => 15, pet_id => 10004, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91108) ->
    #{lev => 15, pet_id => 10005, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91109) ->
    #{lev => 35, pet_id => 10006, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91110) ->
    #{lev => 35, pet_id => 10007, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91111) ->
    #{lev => 35, pet_id => 10008, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91112) ->
    #{lev => 35, pet_id => 10008, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91113) ->
    #{lev => 45, pet_id => 10009, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91114) ->
    #{lev => 45, pet_id => 10010, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91115) ->
    #{lev => 45, pet_id => 10009, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91116) ->
    #{lev => 45, pet_id => 10010, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91117) ->
    #{lev => 45, pet_id => 10011, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91118) ->
    #{lev => 55, pet_id => 10012, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91119) ->
    #{lev => 55, pet_id => 10013, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91120) ->
    #{lev => 55, pet_id => 10014, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91121) ->
    #{lev => 65, pet_id => 10015, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91122) ->
    #{lev => 65, pet_id => 10016, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91123) ->
    #{lev => 65, pet_id => 10017, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91124) ->
    #{lev => 75, pet_id => 10019, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91125) ->
    #{lev => 75, pet_id => 10021, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91126) ->
    #{lev => 75, pet_id => 10022, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91127) ->
    #{lev => 85, pet_id => 10023, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91128) ->
    #{lev => 85, pet_id => 10024, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91129) ->
    #{lev => 85, pet_id => 10025, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91130) ->
    #{lev => 95, pet_id => 10026, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91131) ->
    #{lev => 95, pet_id => 10027, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91132) ->
    #{lev => 95, pet_id => 10028, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91133) ->
    #{lev => 95, pet_id => 10026, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91134) ->
    #{lev => 95, pet_id => 10027, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91135) ->
    #{lev => 95, pet_id => 10028, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91136) ->
    #{lev => 95, pet_id => 10029, genre => 3, ratio => 260,
      need_lev_break => 1};
get_catch(91137) ->
    #{lev => 95, pet_id => 10030, genre => 3, ratio => 260,
      need_lev_break => 1};
get_catch(91200) ->
    #{lev => 1, pet_id => 10001, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91201) ->
    #{lev => 1, pet_id => 10001, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91202) ->
    #{lev => 1, pet_id => 10002, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91203) ->
    #{lev => 1, pet_id => 10002, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91204) ->
    #{lev => 15, pet_id => 10003, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91205) ->
    #{lev => 15, pet_id => 10004, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91206) ->
    #{lev => 15, pet_id => 10003, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91207) ->
    #{lev => 15, pet_id => 10004, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91208) ->
    #{lev => 15, pet_id => 10005, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91209) ->
    #{lev => 35, pet_id => 10006, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91210) ->
    #{lev => 35, pet_id => 10007, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91211) ->
    #{lev => 35, pet_id => 10008, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91212) ->
    #{lev => 35, pet_id => 10008, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91213) ->
    #{lev => 45, pet_id => 10009, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91214) ->
    #{lev => 45, pet_id => 10010, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91215) ->
    #{lev => 45, pet_id => 10009, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91216) ->
    #{lev => 45, pet_id => 10010, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91217) ->
    #{lev => 45, pet_id => 10011, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91218) ->
    #{lev => 55, pet_id => 10012, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91219) ->
    #{lev => 55, pet_id => 10013, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91220) ->
    #{lev => 55, pet_id => 10014, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91221) ->
    #{lev => 65, pet_id => 10015, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91222) ->
    #{lev => 65, pet_id => 10016, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91223) ->
    #{lev => 65, pet_id => 10017, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91224) ->
    #{lev => 75, pet_id => 10019, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91225) ->
    #{lev => 75, pet_id => 10021, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91226) ->
    #{lev => 75, pet_id => 10022, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91227) ->
    #{lev => 85, pet_id => 10023, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91228) ->
    #{lev => 85, pet_id => 10024, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91229) ->
    #{lev => 85, pet_id => 10025, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91230) ->
    #{lev => 95, pet_id => 10026, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91231) ->
    #{lev => 95, pet_id => 10027, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91232) ->
    #{lev => 95, pet_id => 10028, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91233) ->
    #{lev => 95, pet_id => 10026, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91234) ->
    #{lev => 95, pet_id => 10027, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91235) ->
    #{lev => 95, pet_id => 10028, genre => 3, ratio => 700,
      need_lev_break => 0};
get_catch(91236) ->
    #{lev => 95, pet_id => 10029, genre => 3, ratio => 260,
      need_lev_break => 1};
get_catch(91237) ->
    #{lev => 95, pet_id => 10030, genre => 3, ratio => 260,
      need_lev_break => 1};
get_catch(74103) ->
    #{lev => 1, pet_id => 10001, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74104) ->
    #{lev => 1, pet_id => 10002, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74105) ->
    #{lev => 15, pet_id => 10003, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74106) ->
    #{lev => 15, pet_id => 10004, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74107) ->
    #{lev => 15, pet_id => 10005, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74108) ->
    #{lev => 35, pet_id => 10006, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74109) ->
    #{lev => 35, pet_id => 10007, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74110) ->
    #{lev => 35, pet_id => 10008, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74111) ->
    #{lev => 45, pet_id => 10009, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74112) ->
    #{lev => 45, pet_id => 10010, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74113) ->
    #{lev => 45, pet_id => 10011, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74114) ->
    #{lev => 55, pet_id => 10012, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74115) ->
    #{lev => 55, pet_id => 10013, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74116) ->
    #{lev => 55, pet_id => 10014, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74117) ->
    #{lev => 65, pet_id => 10015, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74118) ->
    #{lev => 65, pet_id => 10016, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74119) ->
    #{lev => 65, pet_id => 10017, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74120) ->
    #{lev => 75, pet_id => 10019, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74121) ->
    #{lev => 75, pet_id => 10021, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74122) ->
    #{lev => 75, pet_id => 10022, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74123) ->
    #{lev => 85, pet_id => 10023, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74124) ->
    #{lev => 85, pet_id => 10024, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74125) ->
    #{lev => 85, pet_id => 10025, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74126) ->
    #{lev => 95, pet_id => 10026, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74127) ->
    #{lev => 95, pet_id => 10027, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74128) ->
    #{lev => 95, pet_id => 10028, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(74148) ->
    #{lev => 95, pet_id => 10029, genre => 1, ratio => 700,
      need_lev_break => 1};
get_catch(74149) ->
    #{lev => 95, pet_id => 10030, genre => 1, ratio => 700,
      need_lev_break => 1};
get_catch(31800) ->
    #{lev => 55, pet_id => 10012, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31801) ->
    #{lev => 55, pet_id => 10013, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31802) ->
    #{lev => 55, pet_id => 10014, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31803) ->
    #{lev => 65, pet_id => 10015, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31804) ->
    #{lev => 65, pet_id => 10016, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31805) ->
    #{lev => 65, pet_id => 10017, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31806) ->
    #{lev => 75, pet_id => 10019, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31807) ->
    #{lev => 75, pet_id => 10021, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31808) ->
    #{lev => 75, pet_id => 10022, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31809) ->
    #{lev => 85, pet_id => 10023, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31810) ->
    #{lev => 85, pet_id => 10024, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31811) ->
    #{lev => 85, pet_id => 10025, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31812) ->
    #{lev => 95, pet_id => 10026, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31813) ->
    #{lev => 95, pet_id => 10027, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31814) ->
    #{lev => 95, pet_id => 10028, genre => 1, ratio => 700,
      need_lev_break => 0};
get_catch(31815) ->
    #{lev => 95, pet_id => 10029, genre => 1, ratio => 700,
      need_lev_break => 1};
get_catch(31816) ->
    #{lev => 95, pet_id => 10030, genre => 1, ratio => 700,
      need_lev_break => 1};
get_catch(31830) ->
    #{lev => 55, pet_id => 10012, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31831) ->
    #{lev => 55, pet_id => 10013, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31832) ->
    #{lev => 55, pet_id => 10014, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31833) ->
    #{lev => 65, pet_id => 10015, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31834) ->
    #{lev => 65, pet_id => 10016, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31835) ->
    #{lev => 65, pet_id => 10017, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31836) ->
    #{lev => 75, pet_id => 10019, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31837) ->
    #{lev => 75, pet_id => 10021, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31838) ->
    #{lev => 75, pet_id => 10022, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31839) ->
    #{lev => 85, pet_id => 10023, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31840) ->
    #{lev => 85, pet_id => 10024, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31841) ->
    #{lev => 85, pet_id => 10025, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31842) ->
    #{lev => 95, pet_id => 10026, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31843) ->
    #{lev => 95, pet_id => 10027, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31844) ->
    #{lev => 95, pet_id => 10028, genre => 0, ratio => 700,
      need_lev_break => 0};
get_catch(31845) ->
    #{lev => 95, pet_id => 10029, genre => 0, ratio => 700,
      need_lev_break => 1};
get_catch(31846) ->
    #{lev => 95, pet_id => 10030, genre => 0, ratio => 700,
      need_lev_break => 1};
get_catch(40018) ->
    #{lev => 1, pet_id => 0, genre => 0, ratio => 1000,
      need_lev_break => 0};
get_catch(_) -> false.

get_grade_loss({10000, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10001, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10002, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10003, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10004, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10005, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 1}]}];
get_grade_loss({10006, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 2}]}];
get_grade_loss({10007, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 2}]}];
get_grade_loss({10008, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 2}]}];
get_grade_loss({10009, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 3}]}];
get_grade_loss({10010, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 3}]}];
get_grade_loss({10011, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 3}]}];
get_grade_loss({10012, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 4}]}];
get_grade_loss({10013, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 4}]}];
get_grade_loss({10014, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 4}]}];
get_grade_loss({10015, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 5}]}];
get_grade_loss({10015, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 3}]}];
get_grade_loss({10016, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 5}]}];
get_grade_loss({10016, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 3}]}];
get_grade_loss({10017, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20039, 5}]}];
get_grade_loss({10017, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 3}]}];
get_grade_loss({10019, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 2}]}];
get_grade_loss({10019, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 5}]}];
get_grade_loss({10021, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 2}]}];
get_grade_loss({10021, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 5}]}];
get_grade_loss({10022, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 2}]}];
get_grade_loss({10022, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20040, 5}]}];
get_grade_loss({10023, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 4}]}];
get_grade_loss({10023, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10024, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 4}]}];
get_grade_loss({10024, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10025, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 4}]}];
get_grade_loss({10025, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10026, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10026, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 10}]}];
get_grade_loss({10027, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10027, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 10}]}];
get_grade_loss({10028, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10028, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 10}]}];
get_grade_loss({10029, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 8}]}];
get_grade_loss({10029, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 12}]}];
get_grade_loss({10030, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 8}]}];
get_grade_loss({10030, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 12}]}];
get_grade_loss({10031, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 10}]}];
get_grade_loss({10031, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 15}]}];
get_grade_loss({10032, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 10}]}];
get_grade_loss({10032, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 15}]}];
get_grade_loss({10033, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 12}]}];
get_grade_loss({10033, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 18}]}];
get_grade_loss({10034, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 12}]}];
get_grade_loss({10034, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 18}]}];
get_grade_loss({10035, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 15}]}];
get_grade_loss({10035, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 20}]}];
get_grade_loss({10036, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 15}]}];
get_grade_loss({10036, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 20}]}];
get_grade_loss({10037, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 5}]}];
get_grade_loss({10037, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 8}]}];
get_grade_loss({10038, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 4}]}];
get_grade_loss({10038, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 6}]}];
get_grade_loss({10039, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 12}]}];
get_grade_loss({10039, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20036, 18}]}];
get_grade_loss({20000, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20000, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20000, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20001, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20001, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20001, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20002, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 10}]}];
get_grade_loss({20002, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 20}]}];
get_grade_loss({20002, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 20}]}];
get_grade_loss({20003, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 10}]}];
get_grade_loss({20003, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 20}]}];
get_grade_loss({20003, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20095, 20}]}];
get_grade_loss({20004, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20004, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20004, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20005, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20005, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20005, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20006, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20006, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20006, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20007, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20007, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20007, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20010, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20010, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20010, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20012, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20012, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20012, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20016, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20016, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20016, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20018, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20018, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20018, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20020, 1}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 10}]}];
get_grade_loss({20020, 2}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss({20020, 3}) ->
    [#loss{label = item_base_id_auto_buy,
           val = [{20038, 20}]}];
get_grade_loss(_Key) -> [].

get_exchange(20000) ->
    #{base_id => 20000, cost => [{20038, 80}],
      change_cost => [{20038, 20}], genre => 2,
      talent => 3198};
get_exchange(20001) ->
    #{base_id => 20001, cost => [{20038, 80}],
      change_cost => [{20038, 20}], genre => 2,
      talent => 3175};
get_exchange(20004) ->
    #{base_id => 20004, cost => [{20038, 80}],
      change_cost => [{20038, 20}], genre => 2,
      talent => 3200};
get_exchange(20002) ->
    #{base_id => 20002, cost => [{20095, 80}],
      change_cost => [{20095, 20}], genre => 4,
      talent => 2997};
get_exchange(20003) ->
    #{base_id => 20003, cost => [{20095, 80}],
      change_cost => [{20095, 20}], genre => 4,
      talent => 3087};
get_exchange(_Id) -> false.

get_all_exchange(2) -> [20000, 20001, 20004];
get_all_exchange(4) -> [20002, 20003];
get_all_exchange(_) -> [].

get_add_apt({10000, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10000, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10000, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10000, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10000, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10000, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10001, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10001, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10001, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10001, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10001, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10001, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10002, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10002, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10002, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10002, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10002, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10002, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10003, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10003, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10003, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10003, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10003, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10003, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10004, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10004, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10004, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10004, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10004, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10004, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10005, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10005, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10005, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10005, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10005, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10005, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10006, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10006, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10006, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10006, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10006, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10006, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10007, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10007, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10007, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10007, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10007, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10007, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10008, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10008, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10008, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10008, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10008, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10008, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10009, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10009, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10009, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10009, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10009, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10009, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10010, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10010, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10010, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10010, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10010, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10010, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10011, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10011, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10011, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10011, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10011, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10011, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10012, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10012, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10012, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10012, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10012, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10012, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10013, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10013, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10013, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10013, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10013, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10013, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10014, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10014, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10014, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10014, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10014, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10014, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10015, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10015, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10015, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10015, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10015, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10015, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10016, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10016, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10016, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10016, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10016, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10016, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10017, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10017, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10017, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10017, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10017, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10017, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10019, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10019, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10019, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10019, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10019, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10019, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10021, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10021, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10021, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10021, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10021, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10021, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10022, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10022, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10022, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10022, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10022, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10022, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10023, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10023, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10023, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10023, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10023, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10023, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10024, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10024, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10024, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10024, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10024, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10024, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10025, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10025, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10025, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10025, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10025, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10025, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10026, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10026, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10026, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10026, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10026, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10026, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10027, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10027, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10027, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10027, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10027, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10027, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10028, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10028, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10028, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10028, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10028, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10028, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10029, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10029, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10029, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10029, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10029, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10029, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10030, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10030, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10030, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10030, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10030, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10030, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10031, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10031, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10031, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10031, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10031, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10031, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10032, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10032, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10032, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10032, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10032, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10032, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10033, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10033, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10033, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10033, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10033, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10033, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10034, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10034, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10034, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10034, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10034, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10034, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10035, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10035, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10035, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10035, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10035, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10035, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10036, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10036, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10036, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10036, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10036, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10036, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10037, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10037, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10037, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10037, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10037, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10037, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10038, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10038, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10038, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10038, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10038, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10038, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({10039, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({10039, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({10039, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({10039, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({10039, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({10039, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20000, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20000, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20000, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20000, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20000, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20000, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20001, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20001, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20001, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20001, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20001, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20001, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20002, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20002, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20002, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20002, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20002, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20002, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20003, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20003, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20003, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20003, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20003, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20003, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20004, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20004, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20004, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20004, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20004, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20004, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20005, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20005, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20005, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20005, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20005, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20005, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20006, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20006, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20006, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20006, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20006, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20006, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20007, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20007, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20007, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20007, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20007, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20007, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20008, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20008, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20008, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20008, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20008, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20008, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20009, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20009, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20009, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20009, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20009, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20009, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20010, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20010, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20010, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20010, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20010, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20010, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20012, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20012, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20012, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20012, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20012, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20012, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20013, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20013, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20013, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20013, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20013, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20013, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20014, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20014, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20014, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20014, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20014, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20014, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20016, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20016, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20016, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20016, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20016, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20016, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20018, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20018, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20018, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20018, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20018, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20018, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt({20020, Ratio})
    when Ratio >= 0 andalso Ratio =< 40 ->
    {12, 0};
get_add_apt({20020, Ratio})
    when Ratio >= 40 andalso Ratio =< 60 ->
    {9, 0};
get_add_apt({20020, Ratio})
    when Ratio >= 60 andalso Ratio =< 70 ->
    {6, 0};
get_add_apt({20020, Ratio})
    when Ratio >= 70 andalso Ratio =< 80 ->
    {5, 0};
get_add_apt({20020, Ratio})
    when Ratio >= 80 andalso Ratio =< 90 ->
    {3, 1};
get_add_apt({20020, Ratio})
    when Ratio >= 90 andalso Ratio =< 100 ->
    {0, 5};
get_add_apt(_) -> false.

get_add_max_apt({10000, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10000, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10000, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10000, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10000, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10001, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10001, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10001, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10001, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10001, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10002, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10002, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10002, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10002, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10002, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10003, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10003, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10003, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10003, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10003, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10004, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10004, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10004, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10004, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10004, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10005, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10005, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10005, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10005, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10005, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10006, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10006, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10006, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10006, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10006, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10007, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10007, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10007, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10007, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10007, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10008, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10008, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10008, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10008, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10008, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10009, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10009, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10009, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10009, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10009, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10010, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10010, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10010, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10010, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10010, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10011, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10011, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10011, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10011, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10011, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10012, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10012, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10012, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10012, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10012, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10013, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10013, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10013, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10013, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10013, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10014, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10014, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10014, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10014, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10014, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10015, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10015, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10015, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10015, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10015, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10016, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10016, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10016, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10016, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10016, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10017, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10017, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10017, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10017, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10017, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10019, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10019, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10019, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10019, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10019, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10021, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10021, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10021, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10021, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10021, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10022, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10022, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10022, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10022, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10022, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10023, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10023, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10023, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10023, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10023, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10024, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10024, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10024, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10024, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10024, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10025, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10025, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10025, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10025, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10025, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10026, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10026, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10026, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10026, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10026, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10027, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10027, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10027, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10027, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10027, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10028, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10028, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10028, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10028, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10028, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10029, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10029, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10029, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10029, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10029, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10030, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10030, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10030, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10030, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10030, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10031, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10031, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10031, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10031, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10031, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10032, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10032, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10032, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10032, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10032, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10033, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10033, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10033, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10033, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10033, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10034, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10034, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10034, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10034, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10034, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10035, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10035, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10035, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10035, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10035, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10036, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10036, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10036, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10036, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10036, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10037, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10037, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10037, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10037, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10037, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10038, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10038, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10038, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10038, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10038, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({10039, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({10039, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({10039, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({10039, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({10039, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20000, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20000, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20000, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20000, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20000, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20001, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20001, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20001, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20001, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20001, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20002, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20002, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20002, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20002, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20002, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20003, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20003, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20003, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20003, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20003, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20004, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20004, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20004, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20004, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20004, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20005, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20005, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20005, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20005, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20005, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20006, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20006, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20006, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20006, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20006, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20007, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20007, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20007, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20007, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20007, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20008, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20008, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20008, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20008, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20008, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20009, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20009, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20009, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20009, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20009, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20010, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20010, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20010, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20010, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20010, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20012, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20012, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20012, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20012, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20012, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20013, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20013, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20013, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20013, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20013, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20014, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20014, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20014, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20014, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20014, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20016, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20016, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20016, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20016, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20016, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20018, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20018, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20018, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20018, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20018, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt({20020, Ratio})
    when Ratio >= 0 andalso Ratio =< 85 ->
    12;
get_add_max_apt({20020, Ratio})
    when Ratio >= 86 andalso Ratio =< 90 ->
    10;
get_add_max_apt({20020, Ratio})
    when Ratio >= 91 andalso Ratio =< 93 ->
    8;
get_add_max_apt({20020, Ratio})
    when Ratio >= 94 andalso Ratio =< 97 ->
    6;
get_add_max_apt({20020, Ratio})
    when Ratio >= 98 andalso Ratio =< 100 ->
    5;
get_add_max_apt(_) -> false.

get_egg(0) ->
    #{base_id => 10021, lev => 1, genre => 1,
      aptitude => {950, 900, 1000, 969, 880},
      skills => [60068, 60159, 60028, 60049, 60055, 60080],
      growth_type => 3};
get_egg(1) ->
    #{base_id => 20000, lev => 1, genre => 2,
      skills => [60133, 60130, 60139, 60137],
      growth_type => 5};
get_egg(2) ->
    #{base_id => 10003, lev => 15, genre => 0,
      aptitude => {950, 950, 950, 950, 950},
      skills => [60037, 60003, 60055]};
get_egg(3) ->
    #{base_id => 10010, lev => 40, genre => 0,
      aptitude => {950, 950, 950, 950, 950},
      skills => [60015, 60146, 60028, 60005],
      growth_type => 5};
get_egg(4) ->
    #{base_id => 10006, lev => 30, genre => 0};
get_egg(5) ->
    #{base_id => 10012, lev => 30, genre => 1};
get_egg(6) ->
    #{base_id => 10000, lev => 20, genre => 5,
      aptitude => {960, 960, 960, 960, 960},
      skills => [60092, 60041, 60161, 60060],
      growth_type => 5};
get_egg(7) ->
    #{base_id => 20001, lev => 1, genre => 2,
      skills => [60018, 60136, 60129, 60056],
      growth_type => 5};
get_egg(8) ->
    #{base_id => 20002, lev => 1, genre => 4,
      skills => [60019, 60151, 60040, 60044],
      growth_type => 5};
get_egg(9) ->
    #{base_id => 20003, lev => 1, genre => 4,
      skills => [60015, 60159, 60161, 60052],
      growth_type => 5};
get_egg(10) ->
    #{base_id => 20004, lev => 1, genre => 2,
      growth_type => 5};
get_egg(11) ->
    #{base_id => 10009, lev => 35, genre => 0,
      aptitude => {1000, 970, 950, 950, 950},
      skills => [60019, 60152, 60046, 60057],
      growth_type => 5};
get_egg(12) ->
    #{base_id => 10014, lev => 45, genre => 1,
      aptitude => {950, 950, 950, 950, 950},
      skills => [60137, 60003, 60030], growth_type => 3};
get_egg(13) ->
    #{base_id => 10003, lev => 15, genre => 0,
      aptitude => {970, 970, 950, 950, 950},
      skills => [60137, 60081, 60038], growth_type => 3};
get_egg(14) ->
    #{base_id => 20005, lev => 1, genre => 2,
      growth_type => 5};
get_egg(15) ->
    #{base_id => 20006, lev => 1, genre => 2,
      growth_type => 5};
get_egg(16) ->
    #{base_id => 20007, lev => 1, genre => 2,
      growth_type => 5};
get_egg(17) ->
    #{base_id => 20010, lev => 1, genre => 2,
      growth_type => 5};
get_egg(18) ->
    #{base_id => 10019, lev => 75, genre => 1};
get_egg(19) ->
    #{base_id => 10021, lev => 75, genre => 1};
get_egg(20) ->
    #{base_id => 10022, lev => 75, genre => 1};
get_egg(21) ->
    #{base_id => 10023, lev => 75, genre => 1};
get_egg(22) ->
    #{base_id => 10024, lev => 75, genre => 1};
get_egg(23) ->
    #{base_id => 10025, lev => 75, genre => 1};
get_egg(24) ->
    #{base_id => 10026, lev => 75, genre => 1};
get_egg(25) ->
    #{base_id => 10027, lev => 75, genre => 1};
get_egg(26) ->
    #{base_id => 10028, lev => 75, genre => 1};
get_egg(27) ->
    #{base_id => 10029, lev => 75, genre => 1};
get_egg(28) ->
    #{base_id => 10030, lev => 75, genre => 1};
get_egg(29) ->
    #{base_id => 10031, lev => 75, genre => 1};
get_egg(30) ->
    #{base_id => 10032, lev => 75, genre => 1};
get_egg(31) ->
    #{base_id => 10033, lev => 75, genre => 1};
get_egg(32) ->
    #{base_id => 10034, lev => 75, genre => 1};
get_egg(33) ->
    #{base_id => 10035, lev => 75, genre => 1};
get_egg(34) ->
    #{base_id => 10036, lev => 75, genre => 1};
get_egg(35) ->
    #{base_id => 20012, lev => 1, genre => 2,
      growth_type => 5};
get_egg(36) ->
    #{base_id => 10037, lev => 90, genre => 1,
      growth_type => 5};
get_egg(37) ->
    #{base_id => 20016, lev => 1, genre => 2,
      growth_type => 5};
get_egg(38) ->
    #{base_id => 20018, lev => 1, genre => 2,
      growth_type => 5};
get_egg(39) ->
    #{base_id => 20020, lev => 1, genre => 2,
      growth_type => 5};
get_egg(40) ->
    #{base_id => 10038, lev => 85, genre => 1,
      growth_type => 5};
get_egg(41) ->
    #{base_id => 10039, lev => 115, genre => 1,
      growth_type => 5};
get_egg(_) -> false.

get_fresh(1) ->
    #{base_id => 10003, next_id => 4, need_lev => 15,
      lev => 15, genre => 0,
      aptitude => {950, 950, 950, 950, 950},
      skills => [60037, 60038], growth_type => 4, type => 1,
      time => 0, auto_war => 0};
get_fresh(2) ->
    #{base_id => 10006, next_id => 4, need_lev => 35,
      lev => 35, genre => 0,
      aptitude => {920, 920, 920, 920, 920},
      skills => [60137, 60139, 60040, 60047],
      growth_type => 3, type => 1, time => 0, auto_war => 1};
get_fresh(3) ->
    #{base_id => 10009, next_id => 0, need_lev => 45,
      lev => 45, genre => 0,
      aptitude => {950, 950, 950, 950, 950},
      skills => [60019, 60152, 60046, 60057],
      growth_type => 3, type => 1, time => 0, auto_war => 1};
get_fresh(4) ->
    #{base_id => 29442, next_id => 0, need_lev => 19,
      lev => 1, skills => [], growth_type => 2, type => 2,
      time => 18000};
get_fresh(5) ->
    #{base_id => 29442, next_id => 0, need_lev => 19,
      lev => 1, skills => [], growth_type => 2, type => 2,
      time => 18000};
get_fresh(_) -> false.

get_reset(20615) ->
    #{loss => [{20074, 1}],
      skills =>
          [{60001, 100},
           {60002, 100},
           {60003, 100},
           {60004, 100},
           {60005, 100},
           {60006, 100},
           {60011, 100},
           {60012, 100},
           {60013, 100},
           {60021, 100},
           {60022, 100},
           {60026, 100},
           {60027, 100},
           {60028, 100},
           {60029, 100},
           {60030, 100},
           {60031, 100},
           {60032, 100},
           {60033, 100},
           {60034, 100},
           {60035, 100},
           {60036, 100},
           {60037, 100},
           {60038, 100},
           {60039, 100},
           {60040, 100},
           {60041, 100},
           {60042, 100},
           {60043, 100},
           {60044, 100},
           {60045, 100},
           {60046, 100},
           {60047, 100},
           {60048, 100},
           {60049, 100},
           {60050, 100},
           {60051, 100},
           {60052, 100},
           {60053, 100},
           {60055, 100},
           {60054, 100},
           {60055, 100},
           {60059, 100},
           {60060, 100},
           {60061, 100},
           {60062, 100},
           {60063, 100},
           {60064, 100},
           {60072, 100},
           {60076, 100},
           {60077, 100},
           {60078, 100},
           {60079, 100},
           {60080, 100},
           {60081, 100},
           {60083, 100}]};
get_reset(20616) ->
    #{loss => [{20075, 1}],
      skills =>
          [{60001, 100},
           {60002, 100},
           {60003, 100},
           {60004, 100},
           {60005, 100},
           {60006, 100},
           {60011, 100},
           {60012, 100},
           {60013, 100},
           {60021, 100},
           {60022, 100},
           {60026, 100},
           {60027, 100},
           {60028, 100},
           {60029, 100},
           {60030, 100},
           {60031, 100},
           {60032, 100},
           {60033, 100},
           {60034, 100},
           {60035, 100},
           {60036, 100},
           {60037, 100},
           {60038, 100},
           {60039, 100},
           {60040, 100},
           {60041, 100},
           {60042, 100},
           {60043, 100},
           {60044, 100},
           {60045, 100},
           {60046, 100},
           {60047, 100},
           {60048, 100},
           {60049, 100},
           {60050, 100},
           {60051, 100},
           {60052, 100},
           {60053, 100},
           {60055, 100},
           {60054, 100},
           {60055, 100},
           {60059, 100},
           {60060, 100},
           {60061, 100},
           {60062, 100},
           {60063, 100},
           {60064, 100},
           {60072, 100},
           {60076, 100},
           {60077, 100},
           {60078, 100},
           {60079, 100},
           {60080, 100},
           {60081, 100},
           {60083, 100}],
      tournament =>
          [{16, 150},
           {18, 200},
           {20, 220},
           {22, 230},
           {24, 80},
           {26, 70},
           {30, 50}],
      percent => [{5, 100}, {10, 70}, {9999, 50}]};
get_reset(20617) ->
    #{loss => [{20076, 1}],
      skills =>
          [{60001, 100},
           {60002, 100},
           {60003, 100},
           {60004, 100},
           {60005, 100},
           {60006, 100},
           {60011, 100},
           {60012, 100},
           {60013, 100},
           {60021, 100},
           {60022, 100},
           {60026, 100},
           {60027, 100},
           {60028, 100},
           {60029, 100},
           {60030, 100},
           {60031, 100},
           {60032, 100},
           {60033, 100},
           {60034, 100},
           {60035, 100},
           {60036, 100},
           {60037, 100},
           {60038, 100},
           {60039, 100},
           {60040, 100},
           {60041, 100},
           {60042, 100},
           {60043, 100},
           {60044, 100},
           {60045, 100},
           {60046, 100},
           {60047, 100},
           {60048, 100},
           {60049, 100},
           {60050, 100},
           {60051, 100},
           {60052, 100},
           {60053, 100},
           {60055, 100},
           {60054, 100},
           {60014, 100},
           {60015, 100},
           {60016, 100},
           {60019, 100},
           {60101, 100},
           {60102, 100},
           {60103, 100},
           {60104, 100},
           {60105, 100},
           {60106, 100},
           {60121, 100},
           {60122, 100},
           {60126, 100},
           {60127, 100},
           {60128, 100},
           {60129, 100},
           {60130, 100},
           {60131, 100},
           {60132, 100},
           {60133, 100},
           {60134, 100},
           {60135, 100},
           {60136, 100},
           {60137, 100},
           {60138, 100},
           {60139, 100},
           {60140, 100},
           {60141, 100},
           {60142, 100},
           {60143, 100},
           {60144, 100},
           {60145, 100},
           {60146, 100},
           {60147, 100},
           {60148, 100},
           {60149, 100},
           {60150, 100},
           {60151, 100},
           {60152, 100},
           {60153, 100},
           {60154, 100},
           {60155, 100},
           {60154, 100},
           {60155, 100},
           {60159, 100},
           {60160, 100},
           {60161, 100},
           {60162, 100},
           {60163, 100},
           {60164, 100},
           {60165, 100},
           {60166, 100},
           {60168, 100},
           {60169, 100},
           {60170, 100},
           {60171, 100},
           {60172, 100}],
      tournament =>
          [{64, 150},
           {72, 200},
           {80, 220},
           {88, 230},
           {96, 80},
           {104, 70},
           {120, 50}],
      percent => [{5, 100}, {10, 70}, {9999, 50}]};
get_reset(20638) ->
    #{loss => [{20639, 1}],
      skills =>
          [{60014, 100},
           {60015, 100},
           {60016, 100},
           {60019, 100},
           {60101, 100},
           {60102, 100},
           {60103, 100},
           {60104, 100},
           {60105, 100},
           {60106, 100},
           {60121, 100},
           {60122, 100},
           {60126, 100},
           {60127, 100},
           {60128, 100},
           {60129, 100},
           {60130, 100},
           {60131, 100},
           {60132, 100},
           {60133, 100},
           {60134, 100},
           {60135, 100},
           {60136, 100},
           {60137, 100},
           {60138, 100},
           {60139, 100},
           {60140, 100},
           {60141, 100},
           {60142, 100},
           {60143, 100},
           {60144, 100},
           {60145, 100},
           {60146, 100},
           {60147, 100},
           {60148, 100},
           {60149, 100},
           {60150, 100},
           {60151, 100},
           {60152, 100},
           {60153, 100},
           {60154, 100},
           {60155, 100},
           {60156, 100},
           {60157, 100},
           {60158, 100},
           {60159, 100},
           {60160, 100},
           {60161, 100},
           {60162, 100},
           {60163, 100},
           {60164, 100},
           {60165, 100},
           {60166, 100},
           {60168, 100},
           {60169, 100},
           {60170, 100},
           {60171, 100},
           {60172, 100},
           {60201, 100},
           {60202, 100},
           {60203, 100},
           {60204, 100},
           {60205, 100},
           {60206, 100},
           {60207, 100},
           {60221, 100},
           {60222, 100},
           {60226, 100},
           {60227, 100},
           {60228, 100},
           {60229, 100},
           {60230, 100},
           {60231, 100},
           {60232, 100},
           {60233, 100},
           {60234, 100},
           {60235, 100},
           {60236, 100},
           {60237, 100},
           {60238, 100},
           {60239, 100},
           {60240, 100},
           {60241, 100},
           {60242, 100},
           {60243, 100},
           {60244, 100},
           {60245, 100},
           {60247, 100},
           {60248, 100},
           {60249, 100},
           {60250, 100},
           {60251, 100},
           {60252, 100},
           {60253, 100},
           {60254, 100},
           {60255, 100},
           {60256, 100},
           {60257, 100},
           {60258, 100},
           {60259, 100},
           {60260, 100},
           {60261, 100},
           {60262, 100},
           {60263, 100},
           {60264, 100},
           {60265, 100},
           {60266, 100},
           {60268, 100},
           {60269, 100},
           {60270, 100},
           {60271, 100},
           {60272, 100}]};
get_reset(23856) ->
    #{loss => [{23859, 1}],
      skills =>
          [{60001, 700},
           {60002, 700},
           {60003, 700},
           {60005, 700},
           {60021, 700},
           {60022, 700},
           {60026, 700},
           {60027, 700},
           {60028, 700},
           {60029, 700},
           {60030, 700},
           {60031, 700},
           {60032, 700},
           {60033, 700},
           {60034, 700},
           {60035, 700},
           {60036, 700},
           {60038, 700},
           {60040, 700},
           {60042, 700},
           {60043, 700},
           {60044, 700},
           {60045, 700},
           {60046, 700},
           {60047, 700},
           {60048, 700},
           {60049, 700},
           {60050, 700},
           {60051, 700},
           {60052, 700},
           {60053, 700},
           {60054, 700},
           {60055, 700},
           {60056, 700},
           {60057, 700},
           {60058, 700},
           {60059, 700},
           {60060, 700},
           {60061, 700},
           {60062, 700},
           {60064, 700},
           {60076, 700},
           {60078, 700},
           {60079, 700},
           {60080, 700},
           {60081, 700},
           {60082, 700},
           {60083, 700},
           {60101, 300},
           {60102, 300},
           {60103, 300},
           {60105, 300},
           {60121, 300},
           {60122, 300},
           {60126, 300},
           {60127, 300},
           {60128, 300},
           {60129, 300},
           {60130, 300},
           {60131, 300},
           {60132, 300},
           {60133, 300},
           {60134, 300},
           {60135, 300},
           {60136, 300},
           {60138, 300},
           {60140, 300},
           {60142, 300},
           {60143, 300},
           {60144, 300},
           {60145, 300},
           {60146, 300},
           {60147, 300},
           {60148, 300},
           {60149, 300},
           {60150, 300},
           {60151, 300},
           {60152, 300},
           {60153, 300},
           {60154, 300},
           {60155, 300},
           {60156, 300},
           {60157, 300},
           {60158, 300},
           {60159, 300},
           {60160, 300},
           {60161, 300},
           {60162, 300},
           {60164, 300},
           {60166, 300},
           {60168, 300},
           {60169, 300},
           {60170, 300},
           {60171, 300},
           {60172, 300}]};
get_reset(23857) ->
    #{loss => [{23860, 1}],
      skills =>
          [{60101, 700},
           {60102, 700},
           {60103, 700},
           {60105, 700},
           {60121, 700},
           {60122, 700},
           {60126, 700},
           {60127, 700},
           {60128, 700},
           {60129, 700},
           {60130, 700},
           {60131, 700},
           {60132, 700},
           {60133, 700},
           {60134, 700},
           {60135, 700},
           {60136, 700},
           {60138, 700},
           {60140, 700},
           {60142, 700},
           {60143, 700},
           {60144, 700},
           {60145, 700},
           {60146, 700},
           {60147, 700},
           {60148, 700},
           {60149, 700},
           {60150, 700},
           {60151, 700},
           {60152, 700},
           {60153, 700},
           {60154, 700},
           {60155, 700},
           {60156, 700},
           {60157, 700},
           {60158, 700},
           {60159, 700},
           {60160, 700},
           {60161, 700},
           {60162, 700},
           {60164, 700},
           {60166, 700},
           {60168, 700},
           {60169, 700},
           {60170, 700},
           {60171, 700},
           {60172, 700}]};
get_reset(23858) ->
    #{loss => [{23861, 1}],
      skills =>
          [{60001, 300},
           {60002, 300},
           {60003, 300},
           {60005, 300},
           {60021, 300},
           {60022, 300},
           {60026, 300},
           {60027, 300},
           {60028, 300},
           {60029, 300},
           {60030, 300},
           {60031, 300},
           {60032, 300},
           {60033, 300},
           {60034, 300},
           {60035, 300},
           {60036, 300},
           {60038, 300},
           {60040, 300},
           {60042, 300},
           {60043, 300},
           {60044, 300},
           {60045, 300},
           {60046, 300},
           {60047, 300},
           {60048, 300},
           {60049, 300},
           {60050, 300},
           {60051, 300},
           {60052, 300},
           {60053, 300},
           {60054, 300},
           {60055, 300},
           {60056, 300},
           {60057, 300},
           {60058, 300},
           {60059, 300},
           {60060, 300},
           {60061, 300},
           {60062, 300},
           {60064, 300},
           {60076, 300},
           {60078, 300},
           {60079, 300},
           {60080, 300},
           {60081, 300},
           {60082, 300},
           {60083, 300},
           {60101, 700},
           {60102, 700},
           {60103, 700},
           {60105, 700},
           {60121, 700},
           {60122, 700},
           {60126, 700},
           {60127, 700},
           {60128, 700},
           {60129, 700},
           {60130, 700},
           {60131, 700},
           {60132, 700},
           {60133, 700},
           {60134, 700},
           {60135, 700},
           {60136, 700},
           {60138, 700},
           {60140, 700},
           {60142, 700},
           {60143, 700},
           {60144, 700},
           {60145, 700},
           {60146, 700},
           {60147, 700},
           {60148, 700},
           {60149, 700},
           {60150, 700},
           {60151, 700},
           {60152, 700},
           {60153, 700},
           {60154, 700},
           {60155, 700},
           {60156, 700},
           {60157, 700},
           {60158, 700},
           {60159, 700},
           {60160, 700},
           {60161, 700},
           {60162, 700},
           {60164, 700},
           {60166, 700},
           {60168, 700},
           {60169, 700},
           {60170, 700},
           {60171, 700},
           {60172, 700}]};
get_reset(_) -> false.

model(10000) -> 30000;
model(10001) -> 30001;
model(10002) -> 30002;
model(10003) -> 30003;
model(10004) -> 30006;
model(10005) -> 30005;
model(10006) -> 30004;
model(10007) -> 30007;
model(10008) -> 30008;
model(10009) -> 30009;
model(10010) -> 30010;
model(10011) -> 30011;
model(10012) -> 30012;
model(10013) -> 30013;
model(10014) -> 30014;
model(10015) -> 30015;
model(10016) -> 30016;
model(10017) -> 30017;
model(10019) -> 30019;
model(10021) -> 30021;
model(10022) -> 30022;
model(10023) -> 30036;
model(10024) -> 30038;
model(10025) -> 30039;
model(10026) -> 30043;
model(10027) -> 30042;
model(10028) -> 30044;
model(10029) -> 30047;
model(10030) -> 30048;
model(10031) -> 30051;
model(10032) -> 30052;
model(10033) -> 30054;
model(10034) -> 30055;
model(10035) -> 30059;
model(10036) -> 30060;
model(10037) -> 30061;
model(10038) -> 30066;
model(10039) -> 30065;
model(20000) -> 30027;
model(20001) -> 30029;
model(20004) -> 30037;
model(20002) -> 30028;
model(20003) -> 30032;
model(20005) -> 30046;
model(20006) -> 30050;
model(20007) -> 30053;
model(20008) -> 40071;
model(20009) -> 40171;
model(20010) -> 30057;
model(20011) -> 30057;
model(20012) -> 30058;
model(20013) -> 40071;
model(20014) -> 40171;
model(20015) -> 30058;
model(20016) -> 30062;
model(20017) -> 30062;
model(20018) -> 30063;
model(20019) -> 30063;
model(20020) -> 30064;
model(20021) -> 30064;
model(20022) -> 41034;
model(20023) -> 41034;
model(20024) -> 30746;
model(20025) -> 30746;
model(20026) -> 30054;
model(20027) -> 71114;
model(20028) -> 30067;
model(20029) -> 30067;
model(20030) -> 71114;
model(20031) -> 10030;
model(20032) -> 30652;
model(20033) -> 30651;
model(20034) -> 30042;
model(20035) -> 30065;
model(20036) -> 71006;
model(20037) -> 30060;
model(20038) -> 41002;
model(20039) -> 32024;
model(20041) -> 12058;
model(20042) -> 30077;
model(20043) -> 12066;
model(20044) -> 14031;
model(20045) -> 30087;
model(20046) -> 30086;
model(20047) -> 30069;
model(20048) -> 33001;
model(20049) -> 80002;
model(20050) -> 30068;
model(20051) -> 80003;
model(20052) -> 80004;
model(20053) -> 80110;
model(20055) -> 30080;
model(20057) -> 80710;
model(20058) -> 30078;
model(20060) -> 31192;
model(20061) -> 30096;
model(20062) -> 30094;
model(20063) -> 81111;
model(20064) -> 30092;
model(20065) -> 15001;
model(20066) -> 40079;
model(20067) -> 60001;
model(20068) -> 40076;
model(20069) -> 30240;
model(_) -> false.

pet_talk(10000) ->
    #{show => lang:get("荷叶在手！遮日避雨{face_1, 3}"),
      show_rate => 100, atk => lang:get("别小看我手里的荷叶，打人也是很疼的"),
      atk_rate => 10, dfd => lang:get("喂，轻点{face_1, 11}"),
      dfd_rate => 20, dead => lang:get("哎呀，我认输{face_1, 21}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("这里不安全，我先跑路了"), escape_rate => 100};
pet_talk(10001) ->
    #{show => lang:get("人家自带连击追击哦波{face_1,1}"),
      show_rate => 100,
      atk => lang:get("看我的连击追击流{face_1,36}"), atk_rate => 10,
      dfd => lang:get("体力加点能让我更抗揍波{face_1, 11}"),
      dfd_rate => 20,
      dead => lang:get("哎呀，是不是忘记给我加点了{face_1, 21}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我先去嗑本宠物经验书{face_1,15}"),
      escape_rate => 100};
pet_talk(10002) ->
    #{show => lang:get("小浣熊干脆面登场！{face_1, 25}"),
      show_rate => 100, atk => lang:get("松果炸弹！{face_1, 32}"),
      atk_rate => 10,
      dfd => lang:get("面都打成粉了怎么吃啊！{face_1, 21}"),
      dfd_rate => 20,
      dead => lang:get("以后不卖面给你们吃了{face_1, 37}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("卖完了，回去进货去{face_1, 10}"),
      escape_rate => 100};
pet_talk(10003) ->
    #{show => lang:get("自带高级连击的强力宠物就是我啦{face_1,20}"),
      show_rate => 100,
      atk => lang:get("每次升级记得给我加点哦{face_1, 7}"),
      atk_rate => 10, dfd => lang:get("小心我主人揍你哦{face_1, 21}"),
      dfd_rate => 20,
      dead => lang:get("哎呀，是不是忘记给我加点了{face_1, 21}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我先去嗑本宠物经验书{face_1,15}"),
      escape_rate => 100};
pet_talk(10004) ->
    #{show => lang:get("潜行着，伺机而发{face_1, 17}"),
      show_rate => 100,
      atk => lang:get("让我的镰刀收割掉你{face_1, 13}"),
      atk_rate => 10,
      dfd => lang:get("螳螂家族悍不畏死！{face_1, 12}"),
      dfd_rate => 20,
      dead => lang:get("你的名字我记下了！{face_1, 12}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("给你一次活着的机会！{face_1, 12}"),
      escape_rate => 100};
pet_talk(10005) ->
    #{show => lang:get("听说东方大陆有我的祖先{face_1, 22}"),
      show_rate => 100,
      atk => lang:get("是不是很疼呀~{face_1, 15}"), atk_rate => 10,
      dfd => lang:get("我的后背为我抵挡伤害{face_1, 22}"),
      dfd_rate => 20, dead => lang:get("再坚硬的甲，也有破碎的一天……"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("还是躲回壳里安全{face_1, 22}"),
      escape_rate => 100};
pet_talk(10006) ->
    #{show => lang:get("这附近有财宝？！{face_1, 31}"),
      show_rate => 100, atk => lang:get("把钱交出来！{face_1, 31}"),
      atk_rate => 10,
      dfd => lang:get("痛！我会十倍奉还！{face_1, 30}"),
      dfd_rate => 20, dead => lang:get("宝藏！在哪……{face_1, 13}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我去叫帮手去{face_1, 15}"),
      escape_rate => 100};
pet_talk(10007) ->
    #{show => lang:get("站得太久，出来活动活动{face_1, 26}"),
      show_rate => 100, atk => lang:get("老人家的拳头可不是吃素的！"),
      atk_rate => 10,
      dfd => lang:get("你不懂得尊重长辈吗？{face_1, 30}"),
      dfd_rate => 20,
      dead => lang:get("树不擅长运动，你懂的{face_1, 26}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("回归大自然了{face_1, 26}"),
      escape_rate => 100};
pet_talk(10008) ->
    #{show => lang:get("我从森林的深处而来{face_1, 9}"),
      show_rate => 100, atk => lang:get("别看我个子小，我可是很厉害的呢！"),
      atk_rate => 10,
      dfd => lang:get("欺负我，不会有好下场{face_1, 32}"),
      dfd_rate => 20,
      dead => lang:get("我先回森林里去了{face_1, 21}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("你给我等着！{face_1, 30}"),
      escape_rate => 100};
pet_talk(10009) ->
    #{show => lang:get("又有任务了？{face_1, 35}"),
      show_rate => 100, atk => lang:get("不知死活！{face_1, 32}"),
      atk_rate => 10, dfd => lang:get("我居然受伤了！{face_1, 30}"),
      dfd_rate => 20, dead => lang:get("任务失败了！{face_1, 23}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("暂时的离开是为了更好的胜利！"),
      escape_rate => 100};
pet_talk(10010) ->
    #{show => lang:get("我从极北之域而来，所过之地，皆已成冰"),
      show_rate => 100,
      atk => lang:get("你将被冰雪冻结至死{face_1, 10}"),
      atk_rate => 10,
      dfd => lang:get("这么萌的我你下得了手{face_1, 21}"),
      dfd_rate => 20, dead => lang:get("极北之域的朋友会替我报仇的！"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("极北四兄妹会回来的！"), escape_rate => 100};
pet_talk(10011) ->
    #{show => lang:get("俺犀牛战士一出场，大地都得抖两抖~"),
      show_rate => 100, atk => lang:get("吃俺一锤！{face_1, 32}"),
      atk_rate => 10, dfd => lang:get("皮厚，不怕打{face_1, 24}"),
      dfd_rate => 20,
      dead => lang:get("有事记得再叫俺~{face_1, 11}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("肚子饿了打不动人！{face_1, 11}"),
      escape_rate => 100};
pet_talk(10012) ->
    #{show => lang:get("哼！一群小不点！{face_1, 25}"),
      show_rate => 100,
      atk => lang:get("嘿！矮子，一棍敲死你{face_1, 13}"),
      atk_rate => 10,
      dfd => lang:get("你是在给我挠痒吗？{face_1, 24}"),
      dfd_rate => 20, dead => lang:get("这不可能！{face_1, 23}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("打不过就跑，是我的原则"), escape_rate => 100};
pet_talk(10013) ->
    #{show => lang:get("是谁又来打搅人家睡觉！{face_1, 33}"),
      show_rate => 100, atk => lang:get("让你吵醒我！{face_1, 30}"),
      atk_rate => 10,
      dfd => lang:get("我不生气，生气会变丑{face_1, 32}"),
      dfd_rate => 20,
      dead => lang:get("终于可以回去休息了！{face_1, 10}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("天气太热，我先回去补补水"), escape_rate => 100};
pet_talk(10014) ->
    #{show => lang:get("我是一匹来自北方的狼{face_1, 15}"),
      show_rate => 100,
      atk => lang:get("看你不顺眼就啃两口~{face_1, 15}"),
      atk_rate => 10, dfd => lang:get("在南方冻成了狗~{face_1, 27}"),
      dfd_rate => 20, dead => lang:get("南方太冷了，我还是回极北了……"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("极北四兄妹会回来的！"), escape_rate => 100};
pet_talk(10015) ->
    #{show => lang:get("恐惧吧凡人！{face_1, 13}"),
      show_rate => 100,
      atk => lang:get("燃烧你的灵魂！{face_1, 13}"), atk_rate => 10,
      dfd => lang:get("胆子不小！{face_1, 12}"), dfd_rate => 20,
      dead => lang:get("炎魔！永不朽！{face_1, 19}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("地狱深渊有人召唤我{face_1, 30}"),
      escape_rate => 100};
pet_talk(10016) ->
    #{show => lang:get("嘿，小子，想来打一架试试吗?"), show_rate => 100,
      atk => lang:get("左勾拳右勾拳{face_1, 25}"), atk_rate => 10,
      dfd => lang:get("看我灵活的步伐{face_1, 32}"), dfd_rate => 20,
      dead => lang:get("哎呀，被KO了{face_1, 27}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("这回合不算，下回合再来！"), escape_rate => 100};
pet_talk(10017) ->
    #{show => lang:get("对面那家伙看起来很好吃{face_1, 20}"),
      show_rate => 100, atk => lang:get("让我尝尝{face_1, 10}"),
      atk_rate => 10,
      dfd => lang:get("哟呵，这猎物还挣扎呢{face_1, 14}"),
      dfd_rate => 20,
      dead => lang:get("我得回去补补我的牙齿{face_1, 28}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("极北四兄妹会回来的！"), escape_rate => 100};
pet_talk(10019) ->
    #{show => lang:get("历经千万年风雨，我凝魂而生！"), show_rate => 100,
      atk => lang:get("吃我感悟千万年的一拳！{face_1, 32}"),
      atk_rate => 10,
      dfd => lang:get("打在石头上你不疼吗？{face_1, 35}"),
      dfd_rate => 20, dead => lang:get("身碎魂散了…{face_1, 39}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("灵魂之能消耗殆尽，需要补充"),
      escape_rate => 100};
pet_talk(10021) ->
    #{show => lang:get("我代表大自然惩罚你们！{face_1, 7}"),
      show_rate => 100,
      atk => lang:get("五雷轰顶！雷动八方！{face_1, 32}"),
      atk_rate => 10,
      dfd => lang:get("你无法伤到我的根本{face_1, 30}"),
      dfd_rate => 20,
      dead => lang:get("大自然不会原谅你们{face_1, 12}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("刮大风啦！快跑！{face_1, 11}"),
      escape_rate => 100};
pet_talk(10022) ->
    #{show => lang:get("将你们献祭！{face_1, 13}"),
      show_rate => 100, atk => lang:get("我为复仇而来{face_1, 13}"),
      atk_rate => 10,
      dfd => lang:get("伤痛，会愈发激起斗志{face_1, 12}"),
      dfd_rate => 20, dead => lang:get("我与你的仇恨，又多了一层！"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我会藏起来，随时要你命！"), escape_rate => 100};
pet_talk(10023) ->
    #{show => lang:get("夜已深，出来溜达溜达{face_1, 17}"),
      show_rate => 100,
      atk => lang:get("哦！你的鲜血颇为可口嘛{face_1, 4}"),
      atk_rate => 10, dfd => lang:get("哎呀，我流血了！{face_1, 24}"),
      dfd_rate => 20,
      dead => lang:get("天亮了，我得走了{face_1, 28}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("睡意又来了！让我躺会"), escape_rate => 100};
pet_talk(10024) ->
    #{show => lang:get("我其实是雷暴的领导{face_1, 15}"),
      show_rate => 100,
      atk => lang:get("被雷电一下是什么感觉？{face_1, 35}"),
      atk_rate => 10, dfd => lang:get("神你也敢打{face_1, 14}"),
      dfd_rate => 20, dead => lang:get("你这是亵渎神灵！会有神罚的！"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("神的字典里没有逃避！只是暂时休息"),
      escape_rate => 100};
pet_talk(10025) ->
    #{show => lang:get("吾神魂降临，收取汝之祭品"), show_rate => 100,
      atk => lang:get("月罚！{face_1, 32}"), atk_rate => 10,
      dfd => lang:get("神魂不惧伤害！{face_1, 25}"), dfd_rate => 20,
      dead => lang:get("祭品不够，魂归！"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("神的字典里没有逃避！只是暂时休息"),
      escape_rate => 100};
pet_talk(10026) ->
    #{show => lang:get("又要邀请我跳舞了吗？{face_1, 9}"),
      show_rate => 100,
      atk => lang:get("我的舞姿可算美妙？{face_1, 2}"), atk_rate => 10,
      dfd => lang:get("别来扰乱我的舞步！{face_1, 12}"),
      dfd_rate => 20, dead => lang:get("我还想再舞一曲{face_1, 8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("你们都不懂得我的舞蹈，不理你们了！"),
      escape_rate => 100};
pet_talk(10027) ->
    #{show => lang:get("人已死，心未灭{face_1, 25}"),
      show_rate => 100,
      atk => lang:get("你的灵魂将被我禁锢{face_1, 13}"),
      atk_rate => 10,
      dfd => lang:get("已死之人，何惧再亡{face_1, 24}"),
      dfd_rate => 20, dead => lang:get("魂……散了，待我再次凝聚，便是你的末日"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("待我回去召集袍泽再来"), escape_rate => 100};
pet_talk(10028) ->
    #{show => lang:get("吾乃剑尊弟子，为历练而来"), show_rate => 100,
      atk => lang:get("剑意随心，惊世一剑！{face_1, 32}"),
      atk_rate => 10,
      dfd => lang:get("哼，未伤分毫，再来{face_1, 25}"),
      dfd_rate => 20,
      dead => lang:get("为剑生，为剑死！{face_1, 32}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("修行不足，带我再去练练。"), escape_rate => 100};
pet_talk(10029) ->
    #{show => lang:get("向龙族献祭你的灵魂吧！{face_1,32}"),
      show_rate => 100,
      atk => lang:get("没有什么种族能承受我的一击{face_1,13}"),
      atk_rate => 10,
      dfd => lang:get("唔，这点伤害不算什么{face_1,32}"),
      dfd_rate => 20,
      dead => lang:get("待我重生！猎取你的灵魂！{face_1,12}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("低等的灵魂我不需要{face_1,44}"),
      escape_rate => 100};
pet_talk(10030) ->
    #{show => lang:get("我是上古时期女娲族的后人，你们可不能欺负我"),
      show_rate => 100, atk => lang:get("不要凝视我的眼睛，不然会被石化哟"),
      atk_rate => 10, dfd => lang:get("灵儿生气了！{face_1, 12}"),
      dfd_rate => 20,
      dead => lang:get("我的姐姐会为我报仇的！{face_1, 11}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("这里不好玩，回家去咯{face_1, 22}"),
      escape_rate => 100};
pet_talk(10031) ->
    #{show => lang:get("剑不见血不归鞘"), show_rate => 100,
      atk => lang:get("一剑，诛心{face_1, 53}"), atk_rate => 10,
      dfd => lang:get("你的技艺不精{face_1, 25}"), dfd_rate => 20,
      dead => lang:get("人亡剑断了{face_1, 41}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20,
      escape => lang:get("剑已钝，待我磨砺归来{face_1,44}"),
      escape_rate => 100};
pet_talk(10032) ->
    #{show => lang:get("我的一盏灯就装着一个灵魂"), show_rate => 100,
      atk => lang:get("阴阳灯，照阴阳！{face_1, 22}"), atk_rate => 10,
      dfd => lang:get("别打破了魂灯！你可赔不起"), dfd_rate => 20,
      dead => lang:get("我也得进灯里休息了{face_1, 8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("对面的人好丑，我的灯都不想收他"),
      escape_rate => 100};
pet_talk(10033) ->
    #{show => lang:get("颤抖吧！年轻人"), show_rate => 100,
      atk => lang:get("无所凋亡，惟行原力{face_1, 25}"),
      atk_rate => 10, dfd => lang:get("别碰我！我很厉害的"),
      dfd_rate => 20, dead => lang:get("置之死地而后生{face_1,21}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("身体不舒服，先走一步{face_1, 44}"),
      escape_rate => 100};
pet_talk(10034) ->
    #{show => lang:get("水，是万物之源！"), show_rate => 100,
      atk => lang:get("接受水灵的净化{face_1, 22}"), atk_rate => 10,
      dfd => lang:get("你的灵魂沾满了污秽！"), dfd_rate => 20,
      dead => lang:get("奇幻泡沫，一触就破{face_1, 8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("水深水浅，缘起缘灭"), escape_rate => 100};
pet_talk(10035) ->
    #{show => lang:get("我是阴影中的利剑！"), show_rate => 100,
      atk => lang:get("当你你看见我时！你已经死了{face_1, 25}"),
      atk_rate => 10, dfd => lang:get("你~怎么看见我的！"),
      dfd_rate => 20,
      dead => lang:get("幽冥不会死亡…只是凋零{face_1,46}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("死亡都找不到我{face_1, 25}"),
      escape_rate => 100};
pet_talk(10036) ->
    #{show => lang:get("我的心，在解冻！"), show_rate => 100,
      atk => lang:get("你的身体，已经开始结冰{face_1, 27}"),
      atk_rate => 10, dfd => lang:get("我的寒冷痛彻心扉！"),
      dfd_rate => 20,
      dead => lang:get("享受这冰冷的胜利吧{face_1, 33}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("如死亡一样冰冷"), escape_rate => 100};
pet_talk(10037) ->
    #{show => lang:get("魔镜，谁是最漂亮的女人！{face_1, 9}"),
      show_rate => 100,
      atk => lang:get("蛊惑心神，扰乱心智{face_1, 17}"),
      atk_rate => 10, dfd => lang:get("让我看看你的脸！"),
      dfd_rate => 20,
      dead => lang:get("总有一天我将成为你{face_1, 10}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("魔镜会记住你的~"), escape_rate => 100};
pet_talk(10038) ->
    #{show => lang:get("看看谁在欺负我的主人！"), show_rate => 100,
      atk => lang:get("坏人~{face_1, 17}"), atk_rate => 10,
      dfd => lang:get("你好凶啊！"), dfd_rate => 20,
      dead => lang:get("主人我先走了{face_1, 10}"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("主人我不会忘记你的~"),
      escape_rate => 100};
pet_talk(10039) ->
    #{show => lang:get("王者，总是慢慢悠悠的！"), show_rate => 100,
      atk => lang:get("吃我一锤{face_1, 27}"), atk_rate => 10,
      dfd => lang:get("纹丝不动！"), dfd_rate => 20,
      dead => lang:get("王者不会落幕！"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("快溜啊，等等我~"),
      escape_rate => 100};
pet_talk(20000) ->
    #{show => lang:get("哼！没见过长翅膀的天使\n--猪吗？！"),
      show_rate => 100,
      atk => lang:get("没钉耙也能锤你！{face_1, 32}"), atk_rate => 10,
      dfd => lang:get("我要向神告状去{face_1, 22}"), dfd_rate => 20,
      dead => lang:get("呜呜呜！他们欺负我！{face_1, 8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我有翅膀飞得快{face_1, 22}"),
      escape_rate => 100};
pet_talk(20001) ->
    #{show => lang:get("冥王那里少个帮手，谁有兴趣呀？"), show_rate => 100,
      atk => lang:get("让我看到你们的实力{face_1, 7}"), atk_rate => 10,
      dfd => lang:get("身手不错嘛{face_1, 24}"), dfd_rate => 20,
      dead => lang:get("我看好你哦~这就去跟冥王说说去~~"), dead_rate => 20,
      master_dead => "", master_dead_rate => 20, use => "",
      use_rate => 20, escape => lang:get("你的实力超出我的想象，先闪为尽"),
      escape_rate => 100};
pet_talk(20002) ->
    #{show => lang:get("月野兔是谁，我可不认识{face_1, 22}"),
      show_rate => 100,
      atk => lang:get("代表月亮消灭你们{face_1, 10}"), atk_rate => 10,
      dfd => lang:get("我受伤了吗…{face_1, 23}"), dfd_rate => 20,
      dead => lang:get("我得去吃些萝卜再来…{face_1, 14}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("月野车带我离开这个是非之地！"),
      escape_rate => 100};
pet_talk(20003) ->
    #{show => lang:get("我不是什么神兽，别瞎说{face_1, 7}"),
      show_rate => 100,
      atk => lang:get("我叫糖糖，是羊驼家族{face_1, 32}"),
      atk_rate => 10,
      dfd => lang:get("你是想抢我的波板糖吗{face_1, 11}"),
      dfd_rate => 20, dead => lang:get("我忍不住想骂对面的：“草泥马！”"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("别追我，不然我吐你一脸口水！"),
      escape_rate => 100};
pet_talk(20004) ->
    #{show => lang:get("我踏着五彩祥云而来{face_1, 25}"),
      show_rate => 100,
      atk => lang:get("看我来敲打敲打你！{face_1, 32}"),
      atk_rate => 10, dfd => lang:get("有点本事！{face_1, 38}再来！"),
      dfd_rate => 20, dead => lang:get("我猜到了开头，却没猜到结尾…"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("别浪费我的时间！我在找人"), escape_rate => 100};
pet_talk(20005) ->
    #{show => lang:get("我刚出生不久，来看看这个美妙的世界~"),
      show_rate => 100, atk => lang:get("喷你一脸{face_1, 32}"),
      atk_rate => 10, dfd => lang:get("打坏蛋壳要你赔！"),
      dfd_rate => 20, dead => lang:get("{face_1, 11}麻麻，他们打我"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("先回蛋壳里休息休息{face_1, 15}"),
      escape_rate => 100};
pet_talk(20006) ->
    #{show => lang:get("修炼千年，终于可以印证自己的剑法"),
      show_rate => 100, atk => lang:get("凤翼天翔{face_1, 25}"),
      atk_rate => 10, dfd => lang:get("输你一招，再来{face_1, 47}"),
      dfd_rate => 20, dead => lang:get("凤凰涅槃{face_1, 22}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("修行远远不够啊{face_1, 15}"),
      escape_rate => 100};
pet_talk(20007) ->
    #{show => lang:get("你是神马玩意儿呀{face_1, 35}"),
      show_rate => 100,
      atk => lang:get("万物寂灭，九天雷鸣{face_1, 25}"),
      atk_rate => 10,
      dfd => lang:get("打哪都行，不许打角{face_1, 24}"),
      dfd_rate => 20, dead => lang:get("说好的不许打角呢{face_1, 8}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("打不过，我就跑{face_1, 15}"),
      escape_rate => 100};
pet_talk(20008) ->
    #{show => "", show_rate => 100, atk => "",
      atk_rate => 10, dfd => "", dfd_rate => 20, dead => "",
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => "", escape_rate => 100};
pet_talk(20009) ->
    #{show => "", show_rate => 100, atk => "",
      atk_rate => 10, dfd => "", dfd_rate => 20, dead => "",
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => "", escape_rate => 100};
pet_talk(20010) ->
    #{show => lang:get("这下你可危险了{face_1,25}"),
      show_rate => 100,
      atk => lang:get("元素之力，毁天灭地{face_1,17}"), atk_rate => 10,
      dfd => lang:get("调皮，再来一回合！{face_1, 48}"),
      dfd_rate => 20,
      dead => lang:get("元素之力会毁灭你！{face_1, 46}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("我走了，不要想念我{face_1,21}"),
      escape_rate => 100};
pet_talk(20012) ->
    #{show => lang:get("魔鲸，请开始你的表演{face_1,38}"),
      show_rate => 100, atk => lang:get("注意你的脚下{face_1,10}"),
      atk_rate => 10, dfd => lang:get("请自觉配合演出！{face_1, 48}"),
      dfd_rate => 20, dead => lang:get("演出失败~{face_1, 45}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("皮皮鲸，我们走{face_1,44}"),
      escape_rate => 100};
pet_talk(20013) ->
    #{show => "", show_rate => 100, atk => "",
      atk_rate => 10, dfd => "", dfd_rate => 20, dead => "",
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => "", escape_rate => 100};
pet_talk(20014) ->
    #{show => "", show_rate => 100, atk => "",
      atk_rate => 10, dfd => "", dfd_rate => 20, dead => "",
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => "", escape_rate => 100};
pet_talk(20016) ->
    #{show => lang:get("圣光指引众神{face_1,25}"),
      show_rate => 100, atk => lang:get("接受圣光的洗礼吧{face_1,7}"),
      atk_rate => 10,
      dfd => lang:get("你无法击败圣光的力量{face_1, 41}"),
      dfd_rate => 20, dead => lang:get("圣光…与我同在{face_1, 37}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("回去晒个日光浴{face_1,44}"),
      escape_rate => 100};
pet_talk(20018) ->
    #{show => lang:get("奇迹的世界{face_1,38}"),
      show_rate => 100, atk => lang:get("凡事皆有可能{face_1,25}"),
      atk_rate => 10, dfd => lang:get("越奇越怪{face_1, 48}"),
      dfd_rate => 20,
      dead => lang:get("不过是一堆扑克牌而已{face_1, 45}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("全都疯了{face_1,44}"),
      escape_rate => 100};
pet_talk(20020) ->
    #{show => lang:get("是谁在玩火{face_1,25}"),
      show_rate => 100, atk => lang:get("炮弹可不长眼睛{face_1,7}"),
      atk_rate => 10,
      dfd => lang:get("你这是在危险的边缘试探{face_1, 48}"),
      dfd_rate => 20, dead => lang:get("炮火熄灭{face_1, 37}"),
      dead_rate => 20, master_dead => "",
      master_dead_rate => 20, use => "", use_rate => 20,
      escape => lang:get("别落下我的炮{face_1,44}"),
      escape_rate => 100};
pet_talk(_) -> false.

get_comprehend_skill(10000) -> [{60092, 1000}];
get_comprehend_skill(10001) ->
    [{60039, 1000}, {60033, 1000}, {60044, 1000}];
get_comprehend_skill(10002) ->
    [{60038, 1000}, {60001, 1000}, {60033, 1000}];
get_comprehend_skill(10003) ->
    [{60037, 1000}, {60003, 1000}, {60055, 1000}];
get_comprehend_skill(10004) ->
    [{60040, 1000}, {60005, 1000}, {60031, 1000}];
get_comprehend_skill(10005) ->
    [{60026, 1000}, {60052, 1000}, {60032, 1000}];
get_comprehend_skill(10006) ->
    [{60037, 1000},
     {60139, 1000},
     {60033, 1000},
     {60147, 1000}];
get_comprehend_skill(10007) ->
    [{60027, 1000},
     {60050, 1000},
     {60032, 1000},
     {60147, 1000}];
get_comprehend_skill(10008) ->
    [{60013, 1000},
     {60034, 1000},
     {60043, 1000},
     {60147, 1000}];
get_comprehend_skill(10009) ->
    [{60019, 1000},
     {60152, 1000},
     {60046, 1000},
     {60057, 1000}];
get_comprehend_skill(10010) ->
    [{60015, 1000},
     {60146, 1000},
     {60028, 1000},
     {60005, 1000}];
get_comprehend_skill(10011) ->
    [{60127, 1000},
     {60072, 1000},
     {60049, 1000},
     {60031, 1000}];
get_comprehend_skill(10012) ->
    [{60026, 1000},
     {60140, 1000},
     {60157, 1000},
     {60052, 1000}];
get_comprehend_skill(10013) ->
    [{60065, 2000}, {60059, 1}, {60060, 1}, {60161, 1}];
get_comprehend_skill(10014) ->
    [{60137, 1000},
     {60136, 1000},
     {60003, 1000},
     {60030, 1000}];
get_comprehend_skill(10015) ->
    [{60066, 2000}, {60014, 1}, {60053, 1}, {60147, 1}];
get_comprehend_skill(10016) ->
    [{60093, 3000},
     {60051, 333},
     {60155, 333},
     {60038, 334}];
get_comprehend_skill(10017) ->
    [{60018, 3000}, {60156, 20}, {60060, 20}, {60051, 20}];
get_comprehend_skill(10019) ->
    [{60067, 1500},
     {60069, 1500},
     {60127, 20},
     {60060, 20}];
get_comprehend_skill(10021) ->
    [{60068, 3000},
     {60159, 20},
     {60028, 20},
     {60049, 20},
     {60055, 20}];
get_comprehend_skill(10022) ->
    [{60020, 3000}, {60051, 20}, {60045, 20}, {60133, 20}];
get_comprehend_skill(10023) ->
    [{60074, 3000}, {60144, 20}, {60056, 20}, {60064, 20}];
get_comprehend_skill(10024) ->
    [{60075, 3000}, {60161, 20}, {60038, 20}, {60030, 20}];
get_comprehend_skill(10025) ->
    [{60019, 1000},
     {60127, 1000},
     {60126, 1000},
     {60029, 1000},
     {60054, 1000}];
get_comprehend_skill(10026) ->
    [{60084, 1500},
     {60512, 1500},
     {60172, 20},
     {60043, 20},
     {60160, 20}];
get_comprehend_skill(10027) ->
    [{60085, 3000}, {60104, 20}, {60040, 20}, {60052, 20}];
get_comprehend_skill(10028) ->
    [{60019, 20},
     {60086, 3000},
     {60145, 20},
     {60064, 20},
     {60054, 20}];
get_comprehend_skill(10029) ->
    [{60088, 3000},
     {60136, 20},
     {60138, 20},
     {60004, 20},
     {60003, 20}];
get_comprehend_skill(10030) ->
    [{60090, 3000},
     {60159, 20},
     {60155, 20},
     {60056, 20},
     {60030, 20}];
get_comprehend_skill(10031) ->
    [{60098, 3000},
     {60137, 20},
     {60133, 20},
     {60038, 20},
     {60021, 20}];
get_comprehend_skill(10032) ->
    [{60099, 3000},
     {60143, 20},
     {60130, 20},
     {60059, 20},
     {60045, 20}];
get_comprehend_skill(10033) ->
    [{60507, 3000},
     {60019, 20},
     {60151, 20},
     {60036, 20},
     {60052, 20}];
get_comprehend_skill(10034) ->
    [{60508, 3000},
     {60142, 20},
     {60157, 20},
     {60055, 20},
     {60030, 20}];
get_comprehend_skill(10035) ->
    [{60521, 3000},
     {60131, 20},
     {60137, 20},
     {60040, 20},
     {60030, 20}];
get_comprehend_skill(10036) ->
    [{60523, 1500},
     {60524, 1500},
     {60143, 20},
     {60055, 20},
     {60029, 20}];
get_comprehend_skill(10037) ->
    [{60130, 20}, {60157, 20}, {60061, 20}, {60533, 3000}];
get_comprehend_skill(10038) ->
    [{60557, 1500},
     {60016, 20},
     {60558, 1500},
     {60041, 20},
     {60056, 20}];
get_comprehend_skill(10039) ->
    [{60067, 1500},
     {60019, 20},
     {60129, 20},
     {60559, 1500},
     {60057, 20}];
get_comprehend_skill(20000) ->
    [{60137, 1000},
     {60139, 1000},
     {60030, 1000},
     {60133, 1000}];
get_comprehend_skill(20001) ->
    [{60018, 3000}, {60136, 20}, {60129, 20}, {60056, 20}];
get_comprehend_skill(20004) ->
    [{60073, 3000}, {60151, 20}, {60154, 20}, {60044, 20}];
get_comprehend_skill(20002) ->
    [{60019, 1000},
     {60151, 1000},
     {60040, 1000},
     {60044, 1000}];
get_comprehend_skill(20003) ->
    [{60015, 1000},
     {60159, 1000},
     {60161, 1000},
     {60052, 1000}];
get_comprehend_skill(20005) ->
    [{60087, 3000}, {60143, 20}, {60130, 20}, {60041, 20}];
get_comprehend_skill(20006) ->
    [{60096, 3000}, {60139, 20}, {60101, 20}, {60054, 20}];
get_comprehend_skill(20007) ->
    [{60505, 3000}, {60141, 20}, {60129, 20}, {60045, 20}];
get_comprehend_skill(20008) ->
    [{60039, 1000}, {60033, 1000}, {60044, 1000}];
get_comprehend_skill(20009) ->
    [{60096, 3000}, {60139, 20}, {60101, 20}, {60054, 20}];
get_comprehend_skill(20010) ->
    [{60514, 3000}, {60137, 20}, {60140, 20}, {60022, 20}];
get_comprehend_skill(20012) ->
    [{60518, 3000}, {60142, 20}, {60163, 20}, {60043, 20}];
get_comprehend_skill(20013) ->
    [{60039, 1000}, {60033, 1000}, {60044, 1000}];
get_comprehend_skill(20014) ->
    [{60096, 3000}, {60139, 20}, {60101, 20}, {60054, 20}];
get_comprehend_skill(20016) ->
    [{60534, 3000}, {60137, 20}, {60145, 20}, {60051, 20}];
get_comprehend_skill(20018) ->
    [{60549, 3000}, {60143, 20}, {60155, 20}, {60030, 20}];
get_comprehend_skill(20020) ->
    [{60555, 3000}, {60138, 20}, {60136, 20}, {60001, 20}];
get_comprehend_skill(_) -> false.

get_pet_special_skill(10013) -> [{60065, 2000}];
get_pet_special_skill(10015) -> [{60066, 2000}];
get_pet_special_skill(10016) -> [{60093, 2000}];
get_pet_special_skill(10017) -> [{60018, 2000}];
get_pet_special_skill(10019) ->
    [{60067, 1000}, {60069, 1000}];
get_pet_special_skill(10021) -> [{60068, 2000}];
get_pet_special_skill(10022) -> [{60020, 2000}];
get_pet_special_skill(10023) -> [{60074, 2000}];
get_pet_special_skill(10024) -> [{60075, 2000}];
get_pet_special_skill(20001) -> [{60018, 2000}];
get_pet_special_skill(20004) -> [{60073, 2000}];
get_pet_special_skill(10026) ->
    [{60084, 1000}, {60512, 1000}];
get_pet_special_skill(10027) -> [{60085, 2000}];
get_pet_special_skill(10028) -> [{60086, 2000}];
get_pet_special_skill(10029) -> [{60088, 2000}];
get_pet_special_skill(10030) -> [{60090, 2000}];
get_pet_special_skill(10031) -> [{60098, 2000}];
get_pet_special_skill(10032) -> [{60099, 2000}];
get_pet_special_skill(10033) -> [{60507, 2000}];
get_pet_special_skill(10034) -> [{60508, 2000}];
get_pet_special_skill(10035) -> [{60521, 2000}];
get_pet_special_skill(10036) ->
    [{60523, 1000}, {60524, 1000}];
get_pet_special_skill(10037) -> [{60533, 3000}];
get_pet_special_skill(10038) ->
    [{60557, 1000}, {60558, 1000}];
get_pet_special_skill(10039) ->
    [{60067, 1000}, {60559, 1000}];
get_pet_special_skill(20005) -> [{60087, 2000}];
get_pet_special_skill(20006) -> [{60096, 2000}];
get_pet_special_skill(20007) -> [{60505, 2000}];
get_pet_special_skill(20010) -> [{60514, 2000}];
get_pet_special_skill(20012) -> [{60518, 2000}];
get_pet_special_skill(20016) -> [{60534, 2000}];
get_pet_special_skill(20018) -> [{60549, 2000}];
get_pet_special_skill(20020) -> [{60555, 2000}];
get_pet_special_skill(_) -> false.

get_pet_low_special_skill(10000) -> [{60092, 1000}];
get_pet_low_special_skill(10001) ->
    [{60039, 1000}, {60033, 1000}, {60044, 1000}];
get_pet_low_special_skill(10002) ->
    [{60038, 1000}, {60001, 1000}, {60033, 1000}];
get_pet_low_special_skill(10003) ->
    [{60037, 1000}, {60003, 1000}, {60055, 1000}];
get_pet_low_special_skill(10004) ->
    [{60040, 1000}, {60005, 1000}, {60031, 1000}];
get_pet_low_special_skill(10005) ->
    [{60026, 1000}, {60052, 1000}, {60032, 1000}];
get_pet_low_special_skill(10006) ->
    [{60037, 1000},
     {60139, 1000},
     {60033, 1000},
     {60147, 1000}];
get_pet_low_special_skill(10007) ->
    [{60027, 1000},
     {60050, 1000},
     {60032, 1000},
     {60147, 1000}];
get_pet_low_special_skill(10008) ->
    [{60013, 1000},
     {60034, 1000},
     {60043, 1000},
     {60147, 1000}];
get_pet_low_special_skill(10009) ->
    [{60019, 1000},
     {60152, 1000},
     {60046, 1000},
     {60057, 1000}];
get_pet_low_special_skill(10010) ->
    [{60015, 1000},
     {60146, 1000},
     {60028, 1000},
     {60005, 1000}];
get_pet_low_special_skill(10011) ->
    [{60127, 1000},
     {60072, 1000},
     {60049, 1000},
     {60031, 1000}];
get_pet_low_special_skill(10012) ->
    [{60026, 1000},
     {60140, 1000},
     {60157, 1000},
     {60052, 1000}];
get_pet_low_special_skill(10013) ->
    [{60065, 2000}, {60059, 1}, {60060, 1}, {60161, 1}];
get_pet_low_special_skill(10014) ->
    [{60137, 1000},
     {60136, 1000},
     {60003, 1000},
     {60030, 1000}];
get_pet_low_special_skill(10015) ->
    [{60066, 2000}, {60014, 1}, {60053, 1}, {60147, 1}];
get_pet_low_special_skill(10016) ->
    [{60093, 3000}, {60051, 55}, {60155, 55}, {60038, 55}];
get_pet_low_special_skill(10017) ->
    [{60018, 3000}, {60156, 55}, {60060, 55}, {60051, 55}];
get_pet_low_special_skill(20008) ->
    [{60039, 1000}, {60033, 1000}, {60044, 1000}];
get_pet_low_special_skill(_) -> false.

get_aptitude_reimburse(10000) -> [{90000, 2000}];
get_aptitude_reimburse(10001) -> [{90000, 500}];
get_aptitude_reimburse(10002) -> [{90000, 500}];
get_aptitude_reimburse(10003) -> [{90000, 1000}];
get_aptitude_reimburse(10004) -> [{90000, 1000}];
get_aptitude_reimburse(10005) -> [{90000, 1000}];
get_aptitude_reimburse(10006) -> [{90000, 2000}];
get_aptitude_reimburse(10007) -> [{90000, 2000}];
get_aptitude_reimburse(10008) -> [{90000, 2000}];
get_aptitude_reimburse(10009) -> [{90000, 3000}];
get_aptitude_reimburse(10010) -> [{90000, 3000}];
get_aptitude_reimburse(10011) -> [{90000, 3000}];
get_aptitude_reimburse(10012) -> [{90000, 4000}];
get_aptitude_reimburse(10013) -> [{90000, 4000}];
get_aptitude_reimburse(10014) -> [{90000, 4000}];
get_aptitude_reimburse(10015) -> [{90000, 6000}];
get_aptitude_reimburse(10016) -> [{90000, 6000}];
get_aptitude_reimburse(10017) -> [{90000, 6000}];
get_aptitude_reimburse(10019) -> [{90000, 9000}];
get_aptitude_reimburse(10021) -> [{90000, 9000}];
get_aptitude_reimburse(10022) -> [{90000, 9000}];
get_aptitude_reimburse(10023) -> [{90000, 11000}];
get_aptitude_reimburse(10024) -> [{90000, 11000}];
get_aptitude_reimburse(10025) -> [{90000, 11000}];
get_aptitude_reimburse(10026) -> [{90000, 13000}];
get_aptitude_reimburse(10027) -> [{90000, 13000}];
get_aptitude_reimburse(10028) -> [{90000, 13000}];
get_aptitude_reimburse(10029) -> [{90000, 13000}];
get_aptitude_reimburse(10030) -> [{90000, 13000}];
get_aptitude_reimburse(10031) -> [{90000, 13000}];
get_aptitude_reimburse(10032) -> [{90000, 13000}];
get_aptitude_reimburse(10033) -> [{90000, 13000}];
get_aptitude_reimburse(10034) -> [{90000, 13000}];
get_aptitude_reimburse(10035) -> [{90000, 13000}];
get_aptitude_reimburse(10036) -> [{90000, 13000}];
get_aptitude_reimburse(10037) -> [{90000, 12000}];
get_aptitude_reimburse(10038) -> [{90000, 11000}];
get_aptitude_reimburse(10039) -> [{90000, 13000}];
get_aptitude_reimburse(_) -> [].

get_exchange_spec(20005) ->
    #{base_id => 20005, cost => [{22205, 10}],
      change_cost => [], genre => 2, talent => 3210};
get_exchange_spec(20006) ->
    #{base_id => 20006, cost => [{22205, 11}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20007) ->
    #{base_id => 20007, cost => [{22205, 12}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20010) ->
    #{base_id => 20010, cost => [{22205, 13}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20012) ->
    #{base_id => 20012, cost => [{22205, 13}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20016) ->
    #{base_id => 20016, cost => [{22205, 13}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20018) ->
    #{base_id => 20018, cost => [{22205, 13}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(20020) ->
    #{base_id => 20020, cost => [{22205, 5}, {22448, 8}],
      change_cost => [], genre => 2, talent => 3217};
get_exchange_spec(_Id) -> false.

get_refining_exp(50) -> 723;
get_refining_exp(51) -> 731;
get_refining_exp(52) -> 741;
get_refining_exp(53) -> 751;
get_refining_exp(54) -> 760;
get_refining_exp(55) -> 787;
get_refining_exp(56) -> 795;
get_refining_exp(57) -> 805;
get_refining_exp(58) -> 815;
get_refining_exp(59) -> 823;
get_refining_exp(60) -> 851;
get_refining_exp(61) -> 861;
get_refining_exp(62) -> 871;
get_refining_exp(63) -> 879;
get_refining_exp(64) -> 889;
get_refining_exp(65) -> 899;
get_refining_exp(66) -> 910;
get_refining_exp(67) -> 920;
get_refining_exp(68) -> 930;
get_refining_exp(69) -> 939;
get_refining_exp(70) -> 949;
get_refining_exp(71) -> 959;
get_refining_exp(72) -> 969;
get_refining_exp(73) -> 979;
get_refining_exp(74) -> 989;
get_refining_exp(75) -> 1000;
get_refining_exp(76) -> 1010;
get_refining_exp(77) -> 1020;
get_refining_exp(78) -> 1030;
get_refining_exp(79) -> 1041;
get_refining_exp(80) -> 1119;
get_refining_exp(81) -> 1130;
get_refining_exp(82) -> 1141;
get_refining_exp(83) -> 1151;
get_refining_exp(84) -> 1161;
get_refining_exp(85) -> 1172;
get_refining_exp(86) -> 1182;
get_refining_exp(87) -> 1194;
get_refining_exp(88) -> 1204;
get_refining_exp(89) -> 1214;
get_refining_exp(90) -> 1225;
get_refining_exp(91) -> 1237;
get_refining_exp(92) -> 1247;
get_refining_exp(93) -> 1257;
get_refining_exp(94) -> 1269;
get_refining_exp(95) -> 1279;
get_refining_exp(96) -> 1290;
get_refining_exp(97) -> 1302;
get_refining_exp(98) -> 1312;
get_refining_exp(99) -> 1322;
get_refining_exp(100) -> 1322;
get_refining_exp(101) -> 1322;
get_refining_exp(102) -> 1322;
get_refining_exp(103) -> 1322;
get_refining_exp(104) -> 1322;
get_refining_exp(105) -> 1322;
get_refining_exp(106) -> 1322;
get_refining_exp(107) -> 1322;
get_refining_exp(108) -> 1322;
get_refining_exp(109) -> 1322;
get_refining_exp(110) -> 1322;
get_refining_exp(111) -> 1322;
get_refining_exp(112) -> 1322;
get_refining_exp(113) -> 1322;
get_refining_exp(114) -> 1322;
get_refining_exp(115) -> 1322;
get_refining_exp(116) -> 1322;
get_refining_exp(117) -> 1322;
get_refining_exp(118) -> 1322;
get_refining_exp(119) -> 1322;
get_refining_exp(120) -> 1322;
get_refining_exp(121) -> 1322;
get_refining_exp(122) -> 1322;
get_refining_exp(123) -> 1322;
get_refining_exp(124) -> 1322;
get_refining_exp(125) -> 1322;
get_refining_exp(126) -> 1322;
get_refining_exp(127) -> 1322;
get_refining_exp(128) -> 1322;
get_refining_exp(129) -> 1322;
get_refining_exp(130) -> 1322;
get_refining_exp(131) -> 1322;
get_refining_exp(132) -> 1322;
get_refining_exp(133) -> 1322;
get_refining_exp(134) -> 1322;
get_refining_exp(135) -> 1322;
get_refining_exp(136) -> 1322;
get_refining_exp(137) -> 1322;
get_refining_exp(138) -> 1322;
get_refining_exp(139) -> 1322;
get_refining_exp(140) -> 1322;
get_refining_exp(141) -> 1322;
get_refining_exp(142) -> 1322;
get_refining_exp(143) -> 1322;
get_refining_exp(144) -> 1322;
get_refining_exp(145) -> 1322;
get_refining_exp(146) -> 1322;
get_refining_exp(147) -> 1322;
get_refining_exp(148) -> 1322;
get_refining_exp(149) -> 1322;
get_refining_exp(150) -> 1322;
get_refining_exp(151) -> 1322;
get_refining_exp(152) -> 1322;
get_refining_exp(153) -> 1322;
get_refining_exp(154) -> 1322;
get_refining_exp(155) -> 1322;
get_refining_exp(156) -> 1322;
get_refining_exp(_Lev) -> false.

get_refining_exp_sub(50) -> 253202;
get_refining_exp_sub(51) -> 260318;
get_refining_exp_sub(52) -> 268388;
get_refining_exp_sub(53) -> 277436;
get_refining_exp_sub(54) -> 287604;
get_refining_exp_sub(55) -> 298016;
get_refining_exp_sub(56) -> 308637;
get_refining_exp_sub(57) -> 319545;
get_refining_exp_sub(58) -> 330746;
get_refining_exp_sub(59) -> 342163;
get_refining_exp_sub(60) -> 454234;
get_refining_exp_sub(61) -> 468111;
get_refining_exp_sub(62) -> 482638;
get_refining_exp_sub(63) -> 498024;
get_refining_exp_sub(64) -> 514156;
get_refining_exp_sub(65) -> 530492;
get_refining_exp_sub(66) -> 549113;
get_refining_exp_sub(67) -> 570810;
get_refining_exp_sub(68) -> 595996;
get_refining_exp_sub(69) -> 623918;
get_refining_exp_sub(70) -> 655515;
get_refining_exp_sub(71) -> 690340;
get_refining_exp_sub(72) -> 730757;
get_refining_exp_sub(73) -> 774604;
get_refining_exp_sub(74) -> 820164;
get_refining_exp_sub(75) -> 869564;
get_refining_exp_sub(76) -> 920377;
get_refining_exp_sub(77) -> 973273;
get_refining_exp_sub(78) -> 1027948;
get_refining_exp_sub(79) -> 1089920;
get_refining_exp_sub(80) -> 1155563;
get_refining_exp_sub(81) -> 1226434;
get_refining_exp_sub(82) -> 1302640;
get_refining_exp_sub(83) -> 1384166;
get_refining_exp_sub(84) -> 1471176;
get_refining_exp_sub(85) -> 1561716;
get_refining_exp_sub(86) -> 1656434;
get_refining_exp_sub(87) -> 1755697;
get_refining_exp_sub(88) -> 1859479;
get_refining_exp_sub(89) -> 1975878;
get_refining_exp_sub(90) -> 2103099;
get_refining_exp_sub(91) -> 2241965;
get_refining_exp_sub(92) -> 2392491;
get_refining_exp_sub(93) -> 2554740;
get_refining_exp_sub(94) -> 2729029;
get_refining_exp_sub(95) -> 2910266;
get_refining_exp_sub(96) -> 3096206;
get_refining_exp_sub(97) -> 3289018;
get_refining_exp_sub(98) -> 3484277;
get_refining_exp_sub(99) -> 3682007;
get_refining_exp_sub(100) -> 3882234;
get_refining_exp_sub(101) -> 4084983;
get_refining_exp_sub(102) -> 4290278;
get_refining_exp_sub(103) -> 4498145;
get_refining_exp_sub(104) -> 4708610;
get_refining_exp_sub(105) -> 4921179;
get_refining_exp_sub(106) -> 5135874;
get_refining_exp_sub(107) -> 5352716;
get_refining_exp_sub(108) -> 5571726;
get_refining_exp_sub(109) -> 5792927;
get_refining_exp_sub(110) -> 6016339;
get_refining_exp_sub(111) -> 6241986;
get_refining_exp_sub(112) -> 6469889;
get_refining_exp_sub(113) -> 6700071;
get_refining_exp_sub(114) -> 6932555;
get_refining_exp_sub(115) -> 7167364;
get_refining_exp_sub(116) -> 7404520;
get_refining_exp_sub(117) -> 7644049;
get_refining_exp_sub(118) -> 7885972;
get_refining_exp_sub(119) -> 8130315;
get_refining_exp_sub(120) -> 8377101;
get_refining_exp_sub(121) -> 8626355;
get_refining_exp_sub(122) -> 8878101;
get_refining_exp_sub(123) -> 9132365;
get_refining_exp_sub(124) -> 9389172;
get_refining_exp_sub(125) -> 9648546;
get_refining_exp_sub(126) -> 9910514;
get_refining_exp_sub(127) -> 10172482;
get_refining_exp_sub(128) -> 10434450;
get_refining_exp_sub(129) -> 10696418;
get_refining_exp_sub(130) -> 10958386;
get_refining_exp_sub(131) -> 11220354;
get_refining_exp_sub(132) -> 11482322;
get_refining_exp_sub(133) -> 11744290;
get_refining_exp_sub(134) -> 12006258;
get_refining_exp_sub(135) -> 12268226;
get_refining_exp_sub(136) -> 12530194;
get_refining_exp_sub(137) -> 12792162;
get_refining_exp_sub(138) -> 13054130;
get_refining_exp_sub(139) -> 13316098;
get_refining_exp_sub(140) -> 13578066;
get_refining_exp_sub(141) -> 13840034;
get_refining_exp_sub(142) -> 14102002;
get_refining_exp_sub(143) -> 14363970;
get_refining_exp_sub(144) -> 14625938;
get_refining_exp_sub(145) -> 14887906;
get_refining_exp_sub(146) -> 15149874;
get_refining_exp_sub(147) -> 15411842;
get_refining_exp_sub(148) -> 15673810;
get_refining_exp_sub(149) -> 15935778;
get_refining_exp_sub(150) -> 16197746;
get_refining_exp_sub(_Lev) -> false.

get_refining_lev(Lev)
    when Lev >= 50 andalso Lev =< 59 ->
    #{min_lev => 50, max_lev => 59, args => 3000};
get_refining_lev(Lev)
    when Lev >= 60 andalso Lev =< 69 ->
    #{min_lev => 60, max_lev => 69, args => 3500};
get_refining_lev(Lev)
    when Lev >= 70 andalso Lev =< 79 ->
    #{min_lev => 70, max_lev => 79, args => 4000};
get_refining_lev(Lev)
    when Lev >= 80 andalso Lev =< 89 ->
    #{min_lev => 80, max_lev => 89, args => 4500};
get_refining_lev(Lev)
    when Lev >= 90 andalso Lev =< 99 ->
    #{min_lev => 90, max_lev => 99, args => 5000};
get_refining_lev(Lev)
    when Lev >= 100 andalso Lev =< 109 ->
    #{min_lev => 100, max_lev => 109, args => 5500};
get_refining_lev(Lev)
    when Lev >= 110 andalso Lev =< 119 ->
    #{min_lev => 110, max_lev => 119, args => 6000};
get_refining_lev(Lev)
    when Lev >= 120 andalso Lev =< 129 ->
    #{min_lev => 120, max_lev => 129, args => 6500};
get_refining_lev(Lev)
    when Lev >= 130 andalso Lev =< 139 ->
    #{min_lev => 130, max_lev => 139, args => 7000};
get_refining_lev(Lev)
    when Lev >= 140 andalso Lev =< 149 ->
    #{min_lev => 140, max_lev => 149, args => 7500};
get_refining_lev(Lev)
    when Lev >= 150 andalso Lev =< 159 ->
    #{min_lev => 150, max_lev => 159, args => 8000};
get_refining_lev(_Lev) -> false.

get_refining_apt(Apt)
    when Apt >= 0 andalso Apt =< 699 ->
    #{min_apt => 0, max_apt => 699, args => 100};
get_refining_apt(Apt)
    when Apt >= 700 andalso Apt =< 849 ->
    #{min_apt => 700, max_apt => 849, args => 200};
get_refining_apt(Apt)
    when Apt >= 850 andalso Apt =< 999 ->
    #{min_apt => 850, max_apt => 999, args => 250};
get_refining_apt(Apt)
    when Apt >= 1000 andalso Apt =< 1099 ->
    #{min_apt => 1000, max_apt => 1099, args => 300};
get_refining_apt(Apt)
    when Apt >= 1100 andalso Apt =< 1199 ->
    #{min_apt => 1100, max_apt => 1199, args => 350};
get_refining_apt(Apt)
    when Apt >= 1200 andalso Apt =< 999999 ->
    #{min_apt => 1200, max_apt => 999999, args => 400};
get_refining_apt(_Apt) -> false.

get_skin({10015, 30615}) ->
    #{model_id => 30215, skin_lev => 1,
      skin_name => lang:get("邪焰之心"), cost => [{23760, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10015, 30715}) ->
    #{model_id => 30215, skin_lev => 2,
      skin_name => lang:get("紫焰领主"), cost => [{23761, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10016, 30616}) ->
    #{model_id => 30216, skin_lev => 1,
      skin_name => lang:get("地下拳手"), cost => [{23760, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10016, 30716}) ->
    #{model_id => 30216, skin_lev => 2,
      skin_name => lang:get("功夫大师"), cost => [{23761, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10017, 30617}) ->
    #{model_id => 30217, skin_lev => 1,
      skin_name => lang:get("霜铠飞虎"), cost => [{23760, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10017, 30717}) ->
    #{model_id => 30217, skin_lev => 2,
      skin_name => lang:get("荒原之主"), cost => [{23761, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10019, 30619}) ->
    #{model_id => 30219, skin_lev => 1,
      skin_name => lang:get("日曜金岩"), cost => [{23762, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10019, 30719}) ->
    #{model_id => 30219, skin_lev => 2,
      skin_name => lang:get("熔岩山丘"), cost => [{23763, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10021, 30621}) ->
    #{model_id => 30221, skin_lev => 1,
      skin_name => lang:get("血之木乃伊"), cost => [{23762, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10021, 30721}) ->
    #{model_id => 30221, skin_lev => 2,
      skin_name => lang:get("黑金闪电"), cost => [{23763, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10022, 30622}) ->
    #{model_id => 30222, skin_lev => 1,
      skin_name => lang:get("双刀豪侠"), cost => [{23762, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10022, 30722}) ->
    #{model_id => 30722, skin_lev => 2,
      skin_name => lang:get("影武者"), cost => [{23763, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10023, 30636}) ->
    #{model_id => 30236, skin_lev => 1,
      skin_name => lang:get("白银伯爵"), cost => [{23764, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10023, 30736}) ->
    #{model_id => 30736, skin_lev => 2,
      skin_name => lang:get("猩红死神"), cost => [{23765, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10024, 30638}) ->
    #{model_id => 30638, skin_lev => 1,
      skin_name => lang:get("部族战神"), cost => [{23764, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10024, 30738}) ->
    #{model_id => 30738, skin_lev => 2,
      skin_name => lang:get("地狱之影"), cost => [{23765, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10025, 30639}) ->
    #{model_id => 30239, skin_lev => 1,
      skin_name => lang:get("苍白行者"), cost => [{23764, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10025, 30739}) ->
    #{model_id => 30739, skin_lev => 2,
      skin_name => lang:get("黄金雅典娜"), cost => [{23765, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10026, 30643}) ->
    #{model_id => 30243, skin_lev => 1,
      skin_name => lang:get("冰蓝花姬"), cost => [{23766, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10026, 30743}) ->
    #{model_id => 30743, skin_lev => 2,
      skin_name => lang:get("扑克女皇"), cost => [{23767, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10027, 30642}) ->
    #{model_id => 30242, skin_lev => 1,
      skin_name => lang:get("冥界骑士"), cost => [{23766, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10027, 30742}) ->
    #{model_id => 30742, skin_lev => 2,
      skin_name => lang:get("烈日行者"), cost => [{23767, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10028, 30644}) ->
    #{model_id => 30244, skin_lev => 1,
      skin_name => lang:get("流浪剑客"), cost => [{23766, 2}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10028, 30744}) ->
    #{model_id => 30744, skin_lev => 2,
      skin_name => lang:get("伏魔金刚"), cost => [{23767, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10029, 30647}) ->
    #{model_id => 30247, skin_lev => 1,
      skin_name => lang:get("深海来客"), cost => [{23768, 3}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10029, 30747}) ->
    #{model_id => 30747, skin_lev => 2,
      skin_name => lang:get("冰魂"), cost => [{23769, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10030, 30648}) ->
    #{model_id => 30248, skin_lev => 1,
      skin_name => lang:get("幽魂蛇女"), cost => [{23768, 3}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10030, 30748}) ->
    #{model_id => 30748, skin_lev => 2,
      skin_name => lang:get("美杜莎女王"), cost => [{23769, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10031, 30651}) ->
    #{model_id => 30651, skin_lev => 1,
      skin_name => lang:get("阴流剑豪"), cost => [{23772, 3}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10031, 30751}) ->
    #{model_id => 30751, skin_lev => 2,
      skin_name => lang:get("圣焰狐王"), cost => [{23773, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({10032, 30652}) ->
    #{model_id => 30652, skin_lev => 1,
      skin_name => lang:get("冰雪巫女"), cost => [{23772, 3}],
      phy_aptitude => 5, pdef_aptitude => 5, hp_aptitude => 5,
      magic_aptitude => 5, aspd_aptitude => 5, growth => 0};
get_skin({10032, 30752}) ->
    #{model_id => 30752, skin_lev => 2,
      skin_name => lang:get("糖果女帝"), cost => [{23773, 3}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 0};
get_skin({20002, 30328}) ->
    #{model_id => 30228, skin_lev => 1,
      skin_name => lang:get("非凡超人"), cost => [{23770, 1}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20002, 30428}) ->
    #{model_id => 30428, skin_lev => 2,
      skin_name => lang:get("教皇冕下"), cost => [{23770, 2}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20003, 30432}) ->
    #{model_id => 30432, skin_lev => 1,
      skin_name => lang:get("森林宠儿"), cost => [{23770, 1}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20003, 30332}) ->
    #{model_id => 30332, skin_lev => 2,
      skin_name => lang:get("魔法皇帝"), cost => [{23770, 2}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20000, 30327}) ->
    #{model_id => 30227, skin_lev => 1,
      skin_name => lang:get("恶魔绅士"), cost => [{23770, 2}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20000, 30427}) ->
    #{model_id => 30427, skin_lev => 2,
      skin_name => lang:get("虎克船长"), cost => [{23770, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20001, 30329}) ->
    #{model_id => 30229, skin_lev => 1,
      skin_name => lang:get("勾魂霜镰"), cost => [{23770, 2}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20001, 30429}) ->
    #{model_id => 30429, skin_lev => 2,
      skin_name => lang:get("黑桃爵士"), cost => [{23770, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20004, 30737}) ->
    #{model_id => 30237, skin_lev => 1,
      skin_name => lang:get("六道白猿"), cost => [{23770, 2}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20004, 30837}) ->
    #{model_id => 30837, skin_lev => 2,
      skin_name => lang:get("水神无支祁"), cost => [{23770, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20005, 30346}) ->
    #{model_id => 30246, skin_lev => 1,
      skin_name => lang:get("赤焰龙王"), cost => [{23770, 4}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20005, 30446}) ->
    #{model_id => 30446, skin_lev => 2,
      skin_name => lang:get("冰霜巨龙"), cost => [{23771, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20006, 30350}) ->
    #{model_id => 30250, skin_lev => 1,
      skin_name => lang:get("浴火神鸟"), cost => [{23770, 4}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20006, 30450}) ->
    #{model_id => 30450, skin_lev => 2,
      skin_name => lang:get("粉红爱神"), cost => [{23771, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20007, 30353}) ->
    #{model_id => 30353, skin_lev => 1,
      skin_name => lang:get("逐日神驹"), cost => [{23770, 4}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20007, 30453}) ->
    #{model_id => 30453, skin_lev => 2,
      skin_name => lang:get("死亡骑士"), cost => [{23771, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20010, 30357}) ->
    #{model_id => 30257, skin_lev => 1,
      skin_name => lang:get("赤炎酒仙"), cost => [{23770, 4}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20010, 30457}) ->
    #{model_id => 30457, skin_lev => 2,
      skin_name => lang:get("虚空剑客"), cost => [{23771, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin({20012, 30358}) ->
    #{model_id => 30358, skin_lev => 1,
      skin_name => lang:get("星海女巫"), cost => [{23770, 4}],
      phy_aptitude => 10, pdef_aptitude => 10,
      hp_aptitude => 10, magic_aptitude => 10,
      aspd_aptitude => 10, growth => 0};
get_skin({20012, 30458}) ->
    #{model_id => 30458, skin_lev => 2,
      skin_name => lang:get("魔童锦鲤"), cost => [{23771, 4}],
      phy_aptitude => 15, pdef_aptitude => 15,
      hp_aptitude => 15, magic_aptitude => 15,
      aspd_aptitude => 15, growth => 10};
get_skin(_) -> false.

get_lev_break_exchange(10031) ->
    #{need_lev_break_times => 1, need_lev => 105,
      loss => [{21230, 5}]};
get_lev_break_exchange(10032) ->
    #{need_lev_break_times => 1, need_lev => 105,
      loss => [{21231, 5}]};
get_lev_break_exchange(10033) ->
    #{need_lev_break_times => 1, need_lev => 110,
      loss => [{21232, 5}]};
get_lev_break_exchange(10034) ->
    #{need_lev_break_times => 1, need_lev => 110,
      loss => [{21233, 5}]};
get_lev_break_exchange(10035) ->
    #{need_lev_break_times => 1, need_lev => 120,
      loss => [{21234, 5}]};
get_lev_break_exchange(10036) ->
    #{need_lev_break_times => 1, need_lev => 120,
      loss => [{21235, 5}]};
get_lev_break_exchange(10037) ->
    #{need_lev_break_times => 0, need_lev => 90,
      loss => [{21236, 5}]};
get_lev_break_exchange(10038) ->
    #{need_lev_break_times => 0, need_lev => 85,
      loss => [{21237, 5}],
      aptitude => {960, 960, 1000, 960, 1000},
      skills => [60557, 60016, 60558, 60041, 60056, 60160],
      growth_type => 5};
get_lev_break_exchange(10039) ->
    #{need_lev_break_times => 1, need_lev => 115,
      loss => [{21238, 5}],
      aptitude => {960, 1000, 1000, 960, 960},
      skills => [60067, 60019, 60129, 60559, 60057, 60127],
      growth_type => 5};
get_lev_break_exchange(_) -> false.

get_attach_attr(1) ->
    #{lev => 1, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(2) ->
    #{lev => 2, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(3) ->
    #{lev => 3, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(4) ->
    #{lev => 4, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(5) ->
    #{lev => 5, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(6) ->
    #{lev => 6, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(7) ->
    #{lev => 7, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(8) ->
    #{lev => 8, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(9) ->
    #{lev => 9, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(10) ->
    #{lev => 10, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(11) ->
    #{lev => 11, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(12) ->
    #{lev => 12, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(13) ->
    #{lev => 13, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(14) ->
    #{lev => 14, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(15) ->
    #{lev => 15, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(16) ->
    #{lev => 16, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(17) ->
    #{lev => 17, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(18) ->
    #{lev => 18, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(19) ->
    #{lev => 19, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(20) ->
    #{lev => 20, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(21) ->
    #{lev => 21, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(22) ->
    #{lev => 22, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(23) ->
    #{lev => 23, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(24) ->
    #{lev => 24, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(25) ->
    #{lev => 25, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(26) ->
    #{lev => 26, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(27) ->
    #{lev => 27, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(28) ->
    #{lev => 28, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(29) ->
    #{lev => 29, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(30) ->
    #{lev => 30, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(31) ->
    #{lev => 31, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(32) ->
    #{lev => 32, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(33) ->
    #{lev => 33, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(34) ->
    #{lev => 34, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(35) ->
    #{lev => 35, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(36) ->
    #{lev => 36, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(37) ->
    #{lev => 37, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(38) ->
    #{lev => 38, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(39) ->
    #{lev => 39, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(40) ->
    #{lev => 40, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(41) ->
    #{lev => 41, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(42) ->
    #{lev => 42, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(43) ->
    #{lev => 43, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(44) ->
    #{lev => 44, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(45) ->
    #{lev => 45, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(46) ->
    #{lev => 46, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(47) ->
    #{lev => 47, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(48) ->
    #{lev => 48, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(49) ->
    #{lev => 49, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(50) ->
    #{lev => 50, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(51) ->
    #{lev => 51, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(52) ->
    #{lev => 52, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(53) ->
    #{lev => 53, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(54) ->
    #{lev => 54, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(55) ->
    #{lev => 55, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(56) ->
    #{lev => 56, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(57) ->
    #{lev => 57, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(58) ->
    #{lev => 58, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(59) ->
    #{lev => 59, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(60) ->
    #{lev => 60, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(61) ->
    #{lev => 61, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(62) ->
    #{lev => 62, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(63) ->
    #{lev => 63, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(64) ->
    #{lev => 64, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(65) ->
    #{lev => 65, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(66) ->
    #{lev => 66, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(67) ->
    #{lev => 67, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(68) ->
    #{lev => 68, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(69) ->
    #{lev => 69, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(70) ->
    #{lev => 70, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(71) ->
    #{lev => 71, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(72) ->
    #{lev => 72, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(73) ->
    #{lev => 73, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(74) ->
    #{lev => 74, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_attr(75) ->
    #{lev => 75, hp_max => 472, mp_max => 0, phy_dmg => 193,
      magic_dmg => 173, phy_def => 99, magic_def => 83,
      atk_speed => 0};
get_attach_attr(76) ->
    #{lev => 76, hp_max => 479, mp_max => 0, phy_dmg => 196,
      magic_dmg => 175, phy_def => 100, magic_def => 84,
      atk_speed => 0};
get_attach_attr(77) ->
    #{lev => 77, hp_max => 485, mp_max => 0, phy_dmg => 198,
      magic_dmg => 178, phy_def => 102, magic_def => 85,
      atk_speed => 0};
get_attach_attr(78) ->
    #{lev => 78, hp_max => 492, mp_max => 0, phy_dmg => 201,
      magic_dmg => 180, phy_def => 103, magic_def => 86,
      atk_speed => 0};
get_attach_attr(79) ->
    #{lev => 79, hp_max => 498, mp_max => 0, phy_dmg => 204,
      magic_dmg => 183, phy_def => 104, magic_def => 88,
      atk_speed => 0};
get_attach_attr(80) ->
    #{lev => 80, hp_max => 505, mp_max => 0, phy_dmg => 206,
      magic_dmg => 185, phy_def => 106, magic_def => 89,
      atk_speed => 0};
get_attach_attr(81) ->
    #{lev => 81, hp_max => 511, mp_max => 0, phy_dmg => 209,
      magic_dmg => 187, phy_def => 107, magic_def => 90,
      atk_speed => 0};
get_attach_attr(82) ->
    #{lev => 82, hp_max => 518, mp_max => 0, phy_dmg => 212,
      magic_dmg => 190, phy_def => 109, magic_def => 91,
      atk_speed => 0};
get_attach_attr(83) ->
    #{lev => 83, hp_max => 524, mp_max => 0, phy_dmg => 214,
      magic_dmg => 192, phy_def => 110, magic_def => 92,
      atk_speed => 0};
get_attach_attr(84) ->
    #{lev => 84, hp_max => 531, mp_max => 0, phy_dmg => 217,
      magic_dmg => 194, phy_def => 111, magic_def => 93,
      atk_speed => 0};
get_attach_attr(85) ->
    #{lev => 85, hp_max => 537, mp_max => 0, phy_dmg => 220,
      magic_dmg => 197, phy_def => 113, magic_def => 94,
      atk_speed => 0};
get_attach_attr(86) ->
    #{lev => 86, hp_max => 544, mp_max => 0, phy_dmg => 222,
      magic_dmg => 199, phy_def => 114, magic_def => 96,
      atk_speed => 0};
get_attach_attr(87) ->
    #{lev => 87, hp_max => 550, mp_max => 0, phy_dmg => 225,
      magic_dmg => 202, phy_def => 115, magic_def => 97,
      atk_speed => 0};
get_attach_attr(88) ->
    #{lev => 88, hp_max => 557, mp_max => 0, phy_dmg => 228,
      magic_dmg => 204, phy_def => 117, magic_def => 98,
      atk_speed => 0};
get_attach_attr(89) ->
    #{lev => 89, hp_max => 563, mp_max => 0, phy_dmg => 230,
      magic_dmg => 206, phy_def => 118, magic_def => 99,
      atk_speed => 0};
get_attach_attr(90) ->
    #{lev => 90, hp_max => 570, mp_max => 0, phy_dmg => 233,
      magic_dmg => 209, phy_def => 119, magic_def => 100,
      atk_speed => 0};
get_attach_attr(91) ->
    #{lev => 91, hp_max => 575, mp_max => 0, phy_dmg => 235,
      magic_dmg => 211, phy_def => 121, magic_def => 101,
      atk_speed => 0};
get_attach_attr(92) ->
    #{lev => 92, hp_max => 579, mp_max => 0, phy_dmg => 237,
      magic_dmg => 212, phy_def => 122, magic_def => 102,
      atk_speed => 0};
get_attach_attr(93) ->
    #{lev => 93, hp_max => 584, mp_max => 0, phy_dmg => 239,
      magic_dmg => 214, phy_def => 123, magic_def => 103,
      atk_speed => 0};
get_attach_attr(94) ->
    #{lev => 94, hp_max => 589, mp_max => 0, phy_dmg => 241,
      magic_dmg => 216, phy_def => 124, magic_def => 104,
      atk_speed => 0};
get_attach_attr(95) ->
    #{lev => 95, hp_max => 594, mp_max => 0, phy_dmg => 243,
      magic_dmg => 218, phy_def => 125, magic_def => 104,
      atk_speed => 0};
get_attach_attr(96) ->
    #{lev => 96, hp_max => 599, mp_max => 0, phy_dmg => 245,
      magic_dmg => 220, phy_def => 126, magic_def => 105,
      atk_speed => 0};
get_attach_attr(97) ->
    #{lev => 97, hp_max => 604, mp_max => 0, phy_dmg => 247,
      magic_dmg => 221, phy_def => 127, magic_def => 106,
      atk_speed => 0};
get_attach_attr(98) ->
    #{lev => 98, hp_max => 609, mp_max => 0, phy_dmg => 249,
      magic_dmg => 223, phy_def => 128, magic_def => 107,
      atk_speed => 0};
get_attach_attr(99) ->
    #{lev => 99, hp_max => 614, mp_max => 0, phy_dmg => 251,
      magic_dmg => 225, phy_def => 129, magic_def => 108,
      atk_speed => 0};
get_attach_attr(100) ->
    #{lev => 100, hp_max => 618, mp_max => 0,
      phy_dmg => 253, magic_dmg => 227, phy_def => 130,
      magic_def => 109, atk_speed => 0};
get_attach_attr(101) ->
    #{lev => 101, hp_max => 623, mp_max => 0,
      phy_dmg => 255, magic_dmg => 228, phy_def => 131,
      magic_def => 110, atk_speed => 0};
get_attach_attr(102) ->
    #{lev => 102, hp_max => 628, mp_max => 0,
      phy_dmg => 257, magic_dmg => 230, phy_def => 132,
      magic_def => 110, atk_speed => 0};
get_attach_attr(103) ->
    #{lev => 103, hp_max => 633, mp_max => 0,
      phy_dmg => 259, magic_dmg => 232, phy_def => 133,
      magic_def => 111, atk_speed => 0};
get_attach_attr(104) ->
    #{lev => 104, hp_max => 638, mp_max => 0,
      phy_dmg => 261, magic_dmg => 234, phy_def => 134,
      magic_def => 112, atk_speed => 0};
get_attach_attr(105) ->
    #{lev => 105, hp_max => 643, mp_max => 0,
      phy_dmg => 263, magic_dmg => 236, phy_def => 135,
      magic_def => 113, atk_speed => 0};
get_attach_attr(106) ->
    #{lev => 106, hp_max => 648, mp_max => 0,
      phy_dmg => 265, magic_dmg => 237, phy_def => 136,
      magic_def => 114, atk_speed => 0};
get_attach_attr(107) ->
    #{lev => 107, hp_max => 653, mp_max => 0,
      phy_dmg => 267, magic_dmg => 239, phy_def => 137,
      magic_def => 115, atk_speed => 0};
get_attach_attr(108) ->
    #{lev => 108, hp_max => 658, mp_max => 0,
      phy_dmg => 269, magic_dmg => 241, phy_def => 138,
      magic_def => 116, atk_speed => 0};
get_attach_attr(109) ->
    #{lev => 109, hp_max => 662, mp_max => 0,
      phy_dmg => 271, magic_dmg => 243, phy_def => 139,
      magic_def => 116, atk_speed => 0};
get_attach_attr(110) ->
    #{lev => 110, hp_max => 667, mp_max => 0,
      phy_dmg => 273, magic_dmg => 245, phy_def => 140,
      magic_def => 117, atk_speed => 0};
get_attach_attr(111) ->
    #{lev => 111, hp_max => 672, mp_max => 0,
      phy_dmg => 275, magic_dmg => 246, phy_def => 141,
      magic_def => 118, atk_speed => 0};
get_attach_attr(112) ->
    #{lev => 112, hp_max => 677, mp_max => 0,
      phy_dmg => 277, magic_dmg => 248, phy_def => 142,
      magic_def => 119, atk_speed => 0};
get_attach_attr(113) ->
    #{lev => 113, hp_max => 682, mp_max => 0,
      phy_dmg => 279, magic_dmg => 250, phy_def => 143,
      magic_def => 120, atk_speed => 0};
get_attach_attr(114) ->
    #{lev => 114, hp_max => 687, mp_max => 0,
      phy_dmg => 281, magic_dmg => 252, phy_def => 144,
      magic_def => 121, atk_speed => 0};
get_attach_attr(115) ->
    #{lev => 115, hp_max => 692, mp_max => 0,
      phy_dmg => 283, magic_dmg => 254, phy_def => 145,
      magic_def => 122, atk_speed => 0};
get_attach_attr(116) ->
    #{lev => 116, hp_max => 697, mp_max => 0,
      phy_dmg => 285, magic_dmg => 255, phy_def => 146,
      magic_def => 122, atk_speed => 0};
get_attach_attr(117) ->
    #{lev => 117, hp_max => 701, mp_max => 0,
      phy_dmg => 287, magic_dmg => 257, phy_def => 147,
      magic_def => 123, atk_speed => 0};
get_attach_attr(118) ->
    #{lev => 118, hp_max => 706, mp_max => 0,
      phy_dmg => 289, magic_dmg => 259, phy_def => 148,
      magic_def => 124, atk_speed => 0};
get_attach_attr(119) ->
    #{lev => 119, hp_max => 711, mp_max => 0,
      phy_dmg => 291, magic_dmg => 261, phy_def => 149,
      magic_def => 125, atk_speed => 0};
get_attach_attr(120) ->
    #{lev => 120, hp_max => 716, mp_max => 0,
      phy_dmg => 293, magic_dmg => 262, phy_def => 150,
      magic_def => 126, atk_speed => 0};
get_attach_attr(121) ->
    #{lev => 121, hp_max => 721, mp_max => 0,
      phy_dmg => 295, magic_dmg => 264, phy_def => 151,
      magic_def => 127, atk_speed => 0};
get_attach_attr(122) ->
    #{lev => 122, hp_max => 726, mp_max => 0,
      phy_dmg => 297, magic_dmg => 266, phy_def => 152,
      magic_def => 128, atk_speed => 0};
get_attach_attr(123) ->
    #{lev => 123, hp_max => 731, mp_max => 0,
      phy_dmg => 299, magic_dmg => 268, phy_def => 153,
      magic_def => 129, atk_speed => 0};
get_attach_attr(124) ->
    #{lev => 124, hp_max => 736, mp_max => 0,
      phy_dmg => 301, magic_dmg => 270, phy_def => 154,
      magic_def => 129, atk_speed => 0};
get_attach_attr(125) ->
    #{lev => 125, hp_max => 741, mp_max => 0,
      phy_dmg => 303, magic_dmg => 271, phy_def => 155,
      magic_def => 130, atk_speed => 0};
get_attach_attr(126) ->
    #{lev => 126, hp_max => 745, mp_max => 0,
      phy_dmg => 305, magic_dmg => 273, phy_def => 156,
      magic_def => 131, atk_speed => 0};
get_attach_attr(127) ->
    #{lev => 127, hp_max => 750, mp_max => 0,
      phy_dmg => 307, magic_dmg => 275, phy_def => 157,
      magic_def => 132, atk_speed => 0};
get_attach_attr(128) ->
    #{lev => 128, hp_max => 755, mp_max => 0,
      phy_dmg => 309, magic_dmg => 277, phy_def => 158,
      magic_def => 133, atk_speed => 0};
get_attach_attr(129) ->
    #{lev => 129, hp_max => 760, mp_max => 0,
      phy_dmg => 311, magic_dmg => 279, phy_def => 159,
      magic_def => 134, atk_speed => 0};
get_attach_attr(130) ->
    #{lev => 130, hp_max => 765, mp_max => 0,
      phy_dmg => 313, magic_dmg => 280, phy_def => 160,
      magic_def => 135, atk_speed => 0};
get_attach_attr(131) ->
    #{lev => 131, hp_max => 770, mp_max => 0,
      phy_dmg => 315, magic_dmg => 282, phy_def => 161,
      magic_def => 135, atk_speed => 0};
get_attach_attr(132) ->
    #{lev => 132, hp_max => 775, mp_max => 0,
      phy_dmg => 317, magic_dmg => 284, phy_def => 162,
      magic_def => 136, atk_speed => 0};
get_attach_attr(133) ->
    #{lev => 133, hp_max => 780, mp_max => 0,
      phy_dmg => 319, magic_dmg => 286, phy_def => 164,
      magic_def => 137, atk_speed => 0};
get_attach_attr(134) ->
    #{lev => 134, hp_max => 784, mp_max => 0,
      phy_dmg => 321, magic_dmg => 288, phy_def => 165,
      magic_def => 138, atk_speed => 0};
get_attach_attr(135) ->
    #{lev => 135, hp_max => 789, mp_max => 0,
      phy_dmg => 323, magic_dmg => 289, phy_def => 166,
      magic_def => 139, atk_speed => 0};
get_attach_attr(136) ->
    #{lev => 136, hp_max => 794, mp_max => 0,
      phy_dmg => 325, magic_dmg => 291, phy_def => 167,
      magic_def => 140, atk_speed => 0};
get_attach_attr(137) ->
    #{lev => 137, hp_max => 799, mp_max => 0,
      phy_dmg => 327, magic_dmg => 293, phy_def => 168,
      magic_def => 141, atk_speed => 0};
get_attach_attr(138) ->
    #{lev => 138, hp_max => 804, mp_max => 0,
      phy_dmg => 329, magic_dmg => 295, phy_def => 169,
      magic_def => 141, atk_speed => 0};
get_attach_attr(139) ->
    #{lev => 139, hp_max => 809, mp_max => 0,
      phy_dmg => 331, magic_dmg => 296, phy_def => 170,
      magic_def => 142, atk_speed => 0};
get_attach_attr(140) ->
    #{lev => 140, hp_max => 814, mp_max => 0,
      phy_dmg => 333, magic_dmg => 298, phy_def => 171,
      magic_def => 143, atk_speed => 0};
get_attach_attr(141) ->
    #{lev => 141, hp_max => 819, mp_max => 0,
      phy_dmg => 335, magic_dmg => 300, phy_def => 172,
      magic_def => 144, atk_speed => 0};
get_attach_attr(142) ->
    #{lev => 142, hp_max => 824, mp_max => 0,
      phy_dmg => 337, magic_dmg => 302, phy_def => 173,
      magic_def => 145, atk_speed => 0};
get_attach_attr(143) ->
    #{lev => 143, hp_max => 828, mp_max => 0,
      phy_dmg => 339, magic_dmg => 304, phy_def => 174,
      magic_def => 146, atk_speed => 0};
get_attach_attr(144) ->
    #{lev => 144, hp_max => 833, mp_max => 0,
      phy_dmg => 341, magic_dmg => 305, phy_def => 175,
      magic_def => 147, atk_speed => 0};
get_attach_attr(145) ->
    #{lev => 145, hp_max => 838, mp_max => 0,
      phy_dmg => 343, magic_dmg => 307, phy_def => 176,
      magic_def => 147, atk_speed => 0};
get_attach_attr(146) ->
    #{lev => 146, hp_max => 843, mp_max => 0,
      phy_dmg => 345, magic_dmg => 309, phy_def => 177,
      magic_def => 148, atk_speed => 0};
get_attach_attr(147) ->
    #{lev => 147, hp_max => 848, mp_max => 0,
      phy_dmg => 347, magic_dmg => 311, phy_def => 178,
      magic_def => 149, atk_speed => 0};
get_attach_attr(148) ->
    #{lev => 148, hp_max => 853, mp_max => 0,
      phy_dmg => 349, magic_dmg => 313, phy_def => 179,
      magic_def => 150, atk_speed => 0};
get_attach_attr(149) ->
    #{lev => 149, hp_max => 858, mp_max => 0,
      phy_dmg => 351, magic_dmg => 314, phy_def => 180,
      magic_def => 151, atk_speed => 0};
get_attach_attr(150) ->
    #{lev => 150, hp_max => 863, mp_max => 0,
      phy_dmg => 353, magic_dmg => 316, phy_def => 181,
      magic_def => 152, atk_speed => 0};
get_attach_attr(_) -> false.

get_attach_child_attr(1) ->
    #{lev => 1, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(2) ->
    #{lev => 2, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(3) ->
    #{lev => 3, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(4) ->
    #{lev => 4, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(5) ->
    #{lev => 5, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(6) ->
    #{lev => 6, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(7) ->
    #{lev => 7, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(8) ->
    #{lev => 8, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(9) ->
    #{lev => 9, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(10) ->
    #{lev => 10, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(11) ->
    #{lev => 11, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(12) ->
    #{lev => 12, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(13) ->
    #{lev => 13, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(14) ->
    #{lev => 14, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(15) ->
    #{lev => 15, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(16) ->
    #{lev => 16, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(17) ->
    #{lev => 17, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(18) ->
    #{lev => 18, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(19) ->
    #{lev => 19, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(20) ->
    #{lev => 20, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(21) ->
    #{lev => 21, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(22) ->
    #{lev => 22, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(23) ->
    #{lev => 23, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(24) ->
    #{lev => 24, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(25) ->
    #{lev => 25, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(26) ->
    #{lev => 26, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(27) ->
    #{lev => 27, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(28) ->
    #{lev => 28, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(29) ->
    #{lev => 29, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(30) ->
    #{lev => 30, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(31) ->
    #{lev => 31, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(32) ->
    #{lev => 32, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(33) ->
    #{lev => 33, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(34) ->
    #{lev => 34, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(35) ->
    #{lev => 35, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(36) ->
    #{lev => 36, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(37) ->
    #{lev => 37, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(38) ->
    #{lev => 38, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(39) ->
    #{lev => 39, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(40) ->
    #{lev => 40, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(41) ->
    #{lev => 41, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(42) ->
    #{lev => 42, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(43) ->
    #{lev => 43, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(44) ->
    #{lev => 44, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(45) ->
    #{lev => 45, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(46) ->
    #{lev => 46, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(47) ->
    #{lev => 47, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(48) ->
    #{lev => 48, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(49) ->
    #{lev => 49, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(50) ->
    #{lev => 50, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(51) ->
    #{lev => 51, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(52) ->
    #{lev => 52, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(53) ->
    #{lev => 53, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(54) ->
    #{lev => 54, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(55) ->
    #{lev => 55, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(56) ->
    #{lev => 56, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(57) ->
    #{lev => 57, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(58) ->
    #{lev => 58, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(59) ->
    #{lev => 59, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(60) ->
    #{lev => 60, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(61) ->
    #{lev => 61, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(62) ->
    #{lev => 62, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(63) ->
    #{lev => 63, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(64) ->
    #{lev => 64, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(65) ->
    #{lev => 65, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(66) ->
    #{lev => 66, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(67) ->
    #{lev => 67, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(68) ->
    #{lev => 68, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(69) ->
    #{lev => 69, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(70) ->
    #{lev => 70, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(71) ->
    #{lev => 71, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(72) ->
    #{lev => 72, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(73) ->
    #{lev => 73, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(74) ->
    #{lev => 74, hp_max => 0, mp_max => 0, phy_dmg => 0,
      magic_dmg => 0, phy_def => 0, magic_def => 0,
      atk_speed => 0};
get_attach_child_attr(75) ->
    #{lev => 75, hp_max => 472, mp_max => 0, phy_dmg => 193,
      magic_dmg => 173, phy_def => 99, magic_def => 83,
      atk_speed => 0};
get_attach_child_attr(76) ->
    #{lev => 76, hp_max => 479, mp_max => 0, phy_dmg => 196,
      magic_dmg => 175, phy_def => 100, magic_def => 84,
      atk_speed => 0};
get_attach_child_attr(77) ->
    #{lev => 77, hp_max => 485, mp_max => 0, phy_dmg => 198,
      magic_dmg => 178, phy_def => 102, magic_def => 85,
      atk_speed => 0};
get_attach_child_attr(78) ->
    #{lev => 78, hp_max => 492, mp_max => 0, phy_dmg => 201,
      magic_dmg => 180, phy_def => 103, magic_def => 86,
      atk_speed => 0};
get_attach_child_attr(79) ->
    #{lev => 79, hp_max => 498, mp_max => 0, phy_dmg => 204,
      magic_dmg => 183, phy_def => 104, magic_def => 88,
      atk_speed => 0};
get_attach_child_attr(80) ->
    #{lev => 80, hp_max => 505, mp_max => 0, phy_dmg => 206,
      magic_dmg => 185, phy_def => 106, magic_def => 89,
      atk_speed => 0};
get_attach_child_attr(81) ->
    #{lev => 81, hp_max => 511, mp_max => 0, phy_dmg => 209,
      magic_dmg => 187, phy_def => 107, magic_def => 90,
      atk_speed => 0};
get_attach_child_attr(82) ->
    #{lev => 82, hp_max => 518, mp_max => 0, phy_dmg => 212,
      magic_dmg => 190, phy_def => 109, magic_def => 91,
      atk_speed => 0};
get_attach_child_attr(83) ->
    #{lev => 83, hp_max => 524, mp_max => 0, phy_dmg => 214,
      magic_dmg => 192, phy_def => 110, magic_def => 92,
      atk_speed => 0};
get_attach_child_attr(84) ->
    #{lev => 84, hp_max => 531, mp_max => 0, phy_dmg => 217,
      magic_dmg => 194, phy_def => 111, magic_def => 93,
      atk_speed => 0};
get_attach_child_attr(85) ->
    #{lev => 85, hp_max => 537, mp_max => 0, phy_dmg => 220,
      magic_dmg => 197, phy_def => 113, magic_def => 94,
      atk_speed => 0};
get_attach_child_attr(86) ->
    #{lev => 86, hp_max => 544, mp_max => 0, phy_dmg => 222,
      magic_dmg => 199, phy_def => 114, magic_def => 96,
      atk_speed => 0};
get_attach_child_attr(87) ->
    #{lev => 87, hp_max => 550, mp_max => 0, phy_dmg => 225,
      magic_dmg => 202, phy_def => 115, magic_def => 97,
      atk_speed => 0};
get_attach_child_attr(88) ->
    #{lev => 88, hp_max => 557, mp_max => 0, phy_dmg => 228,
      magic_dmg => 204, phy_def => 117, magic_def => 98,
      atk_speed => 0};
get_attach_child_attr(89) ->
    #{lev => 89, hp_max => 563, mp_max => 0, phy_dmg => 230,
      magic_dmg => 206, phy_def => 118, magic_def => 99,
      atk_speed => 0};
get_attach_child_attr(90) ->
    #{lev => 90, hp_max => 570, mp_max => 0, phy_dmg => 233,
      magic_dmg => 209, phy_def => 119, magic_def => 100,
      atk_speed => 0};
get_attach_child_attr(91) ->
    #{lev => 91, hp_max => 575, mp_max => 0, phy_dmg => 235,
      magic_dmg => 211, phy_def => 121, magic_def => 101,
      atk_speed => 0};
get_attach_child_attr(92) ->
    #{lev => 92, hp_max => 579, mp_max => 0, phy_dmg => 237,
      magic_dmg => 212, phy_def => 122, magic_def => 102,
      atk_speed => 0};
get_attach_child_attr(93) ->
    #{lev => 93, hp_max => 584, mp_max => 0, phy_dmg => 239,
      magic_dmg => 214, phy_def => 123, magic_def => 103,
      atk_speed => 0};
get_attach_child_attr(94) ->
    #{lev => 94, hp_max => 589, mp_max => 0, phy_dmg => 241,
      magic_dmg => 216, phy_def => 124, magic_def => 104,
      atk_speed => 0};
get_attach_child_attr(95) ->
    #{lev => 95, hp_max => 594, mp_max => 0, phy_dmg => 243,
      magic_dmg => 218, phy_def => 125, magic_def => 104,
      atk_speed => 0};
get_attach_child_attr(96) ->
    #{lev => 96, hp_max => 599, mp_max => 0, phy_dmg => 245,
      magic_dmg => 220, phy_def => 126, magic_def => 105,
      atk_speed => 0};
get_attach_child_attr(97) ->
    #{lev => 97, hp_max => 604, mp_max => 0, phy_dmg => 247,
      magic_dmg => 221, phy_def => 127, magic_def => 106,
      atk_speed => 0};
get_attach_child_attr(98) ->
    #{lev => 98, hp_max => 609, mp_max => 0, phy_dmg => 249,
      magic_dmg => 223, phy_def => 128, magic_def => 107,
      atk_speed => 0};
get_attach_child_attr(99) ->
    #{lev => 99, hp_max => 614, mp_max => 0, phy_dmg => 251,
      magic_dmg => 225, phy_def => 129, magic_def => 108,
      atk_speed => 0};
get_attach_child_attr(100) ->
    #{lev => 100, hp_max => 618, mp_max => 0,
      phy_dmg => 253, magic_dmg => 227, phy_def => 130,
      magic_def => 109, atk_speed => 0};
get_attach_child_attr(101) ->
    #{lev => 101, hp_max => 623, mp_max => 0,
      phy_dmg => 255, magic_dmg => 228, phy_def => 131,
      magic_def => 110, atk_speed => 0};
get_attach_child_attr(102) ->
    #{lev => 102, hp_max => 628, mp_max => 0,
      phy_dmg => 257, magic_dmg => 230, phy_def => 132,
      magic_def => 110, atk_speed => 0};
get_attach_child_attr(103) ->
    #{lev => 103, hp_max => 633, mp_max => 0,
      phy_dmg => 259, magic_dmg => 232, phy_def => 133,
      magic_def => 111, atk_speed => 0};
get_attach_child_attr(104) ->
    #{lev => 104, hp_max => 638, mp_max => 0,
      phy_dmg => 261, magic_dmg => 234, phy_def => 134,
      magic_def => 112, atk_speed => 0};
get_attach_child_attr(105) ->
    #{lev => 105, hp_max => 643, mp_max => 0,
      phy_dmg => 263, magic_dmg => 236, phy_def => 135,
      magic_def => 113, atk_speed => 0};
get_attach_child_attr(106) ->
    #{lev => 106, hp_max => 648, mp_max => 0,
      phy_dmg => 265, magic_dmg => 237, phy_def => 136,
      magic_def => 114, atk_speed => 0};
get_attach_child_attr(107) ->
    #{lev => 107, hp_max => 653, mp_max => 0,
      phy_dmg => 267, magic_dmg => 239, phy_def => 137,
      magic_def => 115, atk_speed => 0};
get_attach_child_attr(108) ->
    #{lev => 108, hp_max => 658, mp_max => 0,
      phy_dmg => 269, magic_dmg => 241, phy_def => 138,
      magic_def => 116, atk_speed => 0};
get_attach_child_attr(109) ->
    #{lev => 109, hp_max => 662, mp_max => 0,
      phy_dmg => 271, magic_dmg => 243, phy_def => 139,
      magic_def => 116, atk_speed => 0};
get_attach_child_attr(110) ->
    #{lev => 110, hp_max => 667, mp_max => 0,
      phy_dmg => 273, magic_dmg => 245, phy_def => 140,
      magic_def => 117, atk_speed => 0};
get_attach_child_attr(111) ->
    #{lev => 111, hp_max => 672, mp_max => 0,
      phy_dmg => 275, magic_dmg => 246, phy_def => 141,
      magic_def => 118, atk_speed => 0};
get_attach_child_attr(112) ->
    #{lev => 112, hp_max => 677, mp_max => 0,
      phy_dmg => 277, magic_dmg => 248, phy_def => 142,
      magic_def => 119, atk_speed => 0};
get_attach_child_attr(113) ->
    #{lev => 113, hp_max => 682, mp_max => 0,
      phy_dmg => 279, magic_dmg => 250, phy_def => 143,
      magic_def => 120, atk_speed => 0};
get_attach_child_attr(114) ->
    #{lev => 114, hp_max => 687, mp_max => 0,
      phy_dmg => 281, magic_dmg => 252, phy_def => 144,
      magic_def => 121, atk_speed => 0};
get_attach_child_attr(115) ->
    #{lev => 115, hp_max => 692, mp_max => 0,
      phy_dmg => 283, magic_dmg => 254, phy_def => 145,
      magic_def => 122, atk_speed => 0};
get_attach_child_attr(116) ->
    #{lev => 116, hp_max => 697, mp_max => 0,
      phy_dmg => 285, magic_dmg => 255, phy_def => 146,
      magic_def => 122, atk_speed => 0};
get_attach_child_attr(117) ->
    #{lev => 117, hp_max => 701, mp_max => 0,
      phy_dmg => 287, magic_dmg => 257, phy_def => 147,
      magic_def => 123, atk_speed => 0};
get_attach_child_attr(118) ->
    #{lev => 118, hp_max => 706, mp_max => 0,
      phy_dmg => 289, magic_dmg => 259, phy_def => 148,
      magic_def => 124, atk_speed => 0};
get_attach_child_attr(119) ->
    #{lev => 119, hp_max => 711, mp_max => 0,
      phy_dmg => 291, magic_dmg => 261, phy_def => 149,
      magic_def => 125, atk_speed => 0};
get_attach_child_attr(120) ->
    #{lev => 120, hp_max => 716, mp_max => 0,
      phy_dmg => 293, magic_dmg => 262, phy_def => 150,
      magic_def => 126, atk_speed => 0};
get_attach_child_attr(121) ->
    #{lev => 121, hp_max => 721, mp_max => 0,
      phy_dmg => 295, magic_dmg => 264, phy_def => 151,
      magic_def => 127, atk_speed => 0};
get_attach_child_attr(122) ->
    #{lev => 122, hp_max => 726, mp_max => 0,
      phy_dmg => 297, magic_dmg => 266, phy_def => 152,
      magic_def => 128, atk_speed => 0};
get_attach_child_attr(123) ->
    #{lev => 123, hp_max => 731, mp_max => 0,
      phy_dmg => 299, magic_dmg => 268, phy_def => 153,
      magic_def => 129, atk_speed => 0};
get_attach_child_attr(124) ->
    #{lev => 124, hp_max => 736, mp_max => 0,
      phy_dmg => 301, magic_dmg => 270, phy_def => 154,
      magic_def => 129, atk_speed => 0};
get_attach_child_attr(125) ->
    #{lev => 125, hp_max => 741, mp_max => 0,
      phy_dmg => 303, magic_dmg => 271, phy_def => 155,
      magic_def => 130, atk_speed => 0};
get_attach_child_attr(126) ->
    #{lev => 126, hp_max => 745, mp_max => 0,
      phy_dmg => 305, magic_dmg => 273, phy_def => 156,
      magic_def => 131, atk_speed => 0};
get_attach_child_attr(127) ->
    #{lev => 127, hp_max => 750, mp_max => 0,
      phy_dmg => 307, magic_dmg => 275, phy_def => 157,
      magic_def => 132, atk_speed => 0};
get_attach_child_attr(128) ->
    #{lev => 128, hp_max => 755, mp_max => 0,
      phy_dmg => 309, magic_dmg => 277, phy_def => 158,
      magic_def => 133, atk_speed => 0};
get_attach_child_attr(129) ->
    #{lev => 129, hp_max => 760, mp_max => 0,
      phy_dmg => 311, magic_dmg => 279, phy_def => 159,
      magic_def => 134, atk_speed => 0};
get_attach_child_attr(130) ->
    #{lev => 130, hp_max => 765, mp_max => 0,
      phy_dmg => 313, magic_dmg => 280, phy_def => 160,
      magic_def => 135, atk_speed => 0};
get_attach_child_attr(131) ->
    #{lev => 131, hp_max => 770, mp_max => 0,
      phy_dmg => 315, magic_dmg => 282, phy_def => 161,
      magic_def => 135, atk_speed => 0};
get_attach_child_attr(132) ->
    #{lev => 132, hp_max => 775, mp_max => 0,
      phy_dmg => 317, magic_dmg => 284, phy_def => 162,
      magic_def => 136, atk_speed => 0};
get_attach_child_attr(133) ->
    #{lev => 133, hp_max => 780, mp_max => 0,
      phy_dmg => 319, magic_dmg => 286, phy_def => 164,
      magic_def => 137, atk_speed => 0};
get_attach_child_attr(134) ->
    #{lev => 134, hp_max => 784, mp_max => 0,
      phy_dmg => 321, magic_dmg => 288, phy_def => 165,
      magic_def => 138, atk_speed => 0};
get_attach_child_attr(135) ->
    #{lev => 135, hp_max => 789, mp_max => 0,
      phy_dmg => 323, magic_dmg => 289, phy_def => 166,
      magic_def => 139, atk_speed => 0};
get_attach_child_attr(136) ->
    #{lev => 136, hp_max => 794, mp_max => 0,
      phy_dmg => 325, magic_dmg => 291, phy_def => 167,
      magic_def => 140, atk_speed => 0};
get_attach_child_attr(137) ->
    #{lev => 137, hp_max => 799, mp_max => 0,
      phy_dmg => 327, magic_dmg => 293, phy_def => 168,
      magic_def => 141, atk_speed => 0};
get_attach_child_attr(138) ->
    #{lev => 138, hp_max => 804, mp_max => 0,
      phy_dmg => 329, magic_dmg => 295, phy_def => 169,
      magic_def => 141, atk_speed => 0};
get_attach_child_attr(139) ->
    #{lev => 139, hp_max => 809, mp_max => 0,
      phy_dmg => 331, magic_dmg => 296, phy_def => 170,
      magic_def => 142, atk_speed => 0};
get_attach_child_attr(140) ->
    #{lev => 140, hp_max => 814, mp_max => 0,
      phy_dmg => 333, magic_dmg => 298, phy_def => 171,
      magic_def => 143, atk_speed => 0};
get_attach_child_attr(141) ->
    #{lev => 141, hp_max => 819, mp_max => 0,
      phy_dmg => 335, magic_dmg => 300, phy_def => 172,
      magic_def => 144, atk_speed => 0};
get_attach_child_attr(142) ->
    #{lev => 142, hp_max => 824, mp_max => 0,
      phy_dmg => 337, magic_dmg => 302, phy_def => 173,
      magic_def => 145, atk_speed => 0};
get_attach_child_attr(143) ->
    #{lev => 143, hp_max => 828, mp_max => 0,
      phy_dmg => 339, magic_dmg => 304, phy_def => 174,
      magic_def => 146, atk_speed => 0};
get_attach_child_attr(144) ->
    #{lev => 144, hp_max => 833, mp_max => 0,
      phy_dmg => 341, magic_dmg => 305, phy_def => 175,
      magic_def => 147, atk_speed => 0};
get_attach_child_attr(145) ->
    #{lev => 145, hp_max => 838, mp_max => 0,
      phy_dmg => 343, magic_dmg => 307, phy_def => 176,
      magic_def => 147, atk_speed => 0};
get_attach_child_attr(146) ->
    #{lev => 146, hp_max => 843, mp_max => 0,
      phy_dmg => 345, magic_dmg => 309, phy_def => 177,
      magic_def => 148, atk_speed => 0};
get_attach_child_attr(147) ->
    #{lev => 147, hp_max => 848, mp_max => 0,
      phy_dmg => 347, magic_dmg => 311, phy_def => 178,
      magic_def => 149, atk_speed => 0};
get_attach_child_attr(148) ->
    #{lev => 148, hp_max => 853, mp_max => 0,
      phy_dmg => 349, magic_dmg => 313, phy_def => 179,
      magic_def => 150, atk_speed => 0};
get_attach_child_attr(149) ->
    #{lev => 149, hp_max => 858, mp_max => 0,
      phy_dmg => 351, magic_dmg => 314, phy_def => 180,
      magic_def => 151, atk_speed => 0};
get_attach_child_attr(150) ->
    #{lev => 150, hp_max => 863, mp_max => 0,
      phy_dmg => 353, magic_dmg => 316, phy_def => 181,
      magic_def => 152, atk_speed => 0};
get_attach_child_attr(_) -> false.

get_attach_ratio(10019, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60700, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60700, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60700, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60701, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60701, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60701, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60702, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60702, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60703, 1}]};
get_attach_ratio(10019, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60703, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3450 andalso Talent =< 3549 ->
    {500, [{60710, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3550 andalso Talent =< 3649 ->
    {550, [{60710, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3650 andalso Talent =< 3749 ->
    {600, [{60710, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3750 andalso Talent =< 3849 ->
    {650, [{60711, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3850 andalso Talent =< 3949 ->
    {700, [{60711, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 3950 andalso Talent =< 4049 ->
    {750, [{60711, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 4050 andalso Talent =< 4149 ->
    {800, [{60712, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 4150 andalso Talent =< 4249 ->
    {850, [{60712, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 4250 andalso Talent =< 4349 ->
    {900, [{60713, 1}]};
get_attach_ratio(10021, Talent)
    when Talent >= 4350 andalso Talent =< 10000 ->
    {1000, [{60713, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60720, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60720, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60720, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60721, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60721, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60721, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60722, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60722, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60723, 1}]};
get_attach_ratio(10022, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60723, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60730, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60730, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60730, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60731, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60731, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60731, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60732, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60732, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60733, 1}]};
get_attach_ratio(10023, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60733, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60740, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60740, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60740, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60741, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60741, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60741, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60742, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60742, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60743, 1}]};
get_attach_ratio(10024, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60743, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {500, [{60750, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {550, [{60750, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {600, [{60750, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {650, [{60751, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {700, [{60751, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {750, [{60751, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {800, [{60752, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {850, [{60752, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {900, [{60753, 1}]};
get_attach_ratio(10025, Talent)
    when Talent >= 4400 andalso Talent =< 10000 ->
    {1000, [{60753, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60760, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60760, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60760, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60761, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60761, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60761, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60762, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60762, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60763, 1}]};
get_attach_ratio(10026, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60763, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {500, [{60770, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {550, [{60770, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {600, [{60770, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {650, [{60771, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {700, [{60771, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {750, [{60771, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {800, [{60772, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {850, [{60772, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {900, [{60773, 1}]};
get_attach_ratio(10027, Talent)
    when Talent >= 4300 andalso Talent =< 10000 ->
    {1000, [{60773, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {500, [{60780, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {550, [{60780, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {600, [{60780, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {650, [{60781, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {700, [{60781, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {750, [{60781, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {800, [{60782, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {850, [{60782, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {900, [{60783, 1}]};
get_attach_ratio(10028, Talent)
    when Talent >= 4400 andalso Talent =< 10000 ->
    {1000, [{60783, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60790, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60790, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60790, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60790, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60791, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60791, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60791, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60792, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60792, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60792, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60793, 1}]};
get_attach_ratio(10029, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60793, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60800, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60800, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60800, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60800, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60801, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60801, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60801, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60802, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60802, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60802, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60803, 1}]};
get_attach_ratio(10030, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60803, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60880, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60880, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60880, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60880, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60881, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60881, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60881, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60882, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60882, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60882, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60883, 1}]};
get_attach_ratio(10031, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60883, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60890, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60890, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60890, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60890, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60891, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60891, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60891, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60892, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60892, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60892, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60893, 1}]};
get_attach_ratio(10032, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60893, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {500, [{60920, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {530, [{60920, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {560, [{60920, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {600, [{60920, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {650, [{60921, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {700, [{60921, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {750, [{60921, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {800, [{60922, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {850, [{60922, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {900, [{60922, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4700 andalso Talent =< 4799 ->
    {950, [{60923, 1}]};
get_attach_ratio(10033, Talent)
    when Talent >= 4800 andalso Talent =< 10000 ->
    {1000, [{60923, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {500, [{60930, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {530, [{60930, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {560, [{60930, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {600, [{60930, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {650, [{60931, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {700, [{60931, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {750, [{60931, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {800, [{60932, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {850, [{60932, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {900, [{60932, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4700 andalso Talent =< 4799 ->
    {950, [{60933, 1}]};
get_attach_ratio(10034, Talent)
    when Talent >= 4800 andalso Talent =< 10000 ->
    {1000, [{60933, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60830, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60830, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60830, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60831, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60831, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60831, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60832, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60832, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60833, 1}]};
get_attach_ratio(20000, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60833, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60840, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60840, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60840, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60841, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60841, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60841, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60842, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60842, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60843, 1}]};
get_attach_ratio(20001, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60843, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60860, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60860, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60860, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60861, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60861, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60861, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60862, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60862, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4400 andalso Talent =< 4449 ->
    {900, [{60863, 1}]};
get_attach_ratio(20002, Talent)
    when Talent >= 4450 andalso Talent =< 10000 ->
    {1000, [{60863, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60870, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60870, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60870, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60871, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60871, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60871, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60872, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60872, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4400 andalso Talent =< 4449 ->
    {900, [{60873, 1}]};
get_attach_ratio(20003, Talent)
    when Talent >= 4450 andalso Talent =< 10000 ->
    {1000, [{60873, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60850, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60850, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60850, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60851, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60851, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60851, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60852, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60852, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60853, 1}]};
get_attach_ratio(20004, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60853, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60820, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60820, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60820, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60820, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60821, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60821, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60821, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60822, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60822, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60822, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60823, 1}]};
get_attach_ratio(20005, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60823, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60810, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60810, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60810, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60810, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60811, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60811, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60811, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60812, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60812, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60812, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60813, 1}]};
get_attach_ratio(20006, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60813, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60910, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60910, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60910, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60910, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60911, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60911, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60911, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60912, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60912, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60912, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60913, 1}]};
get_attach_ratio(20007, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60913, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60940, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60940, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60940, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60940, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60941, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60941, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60941, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60942, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60942, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60942, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60943, 1}]};
get_attach_ratio(20010, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60943, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60950, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60950, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60950, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60950, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60951, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60951, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60951, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60952, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60952, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60952, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60953, 1}]};
get_attach_ratio(20012, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60953, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60960, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60960, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60960, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60960, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60961, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60961, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60961, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60962, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60962, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60962, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60963, 1}]};
get_attach_ratio(20016, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60963, 1}]};
get_attach_ratio(_, _) -> {0, []}.

get_attach_child_ratio(10019, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60700, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60700, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60700, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60701, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60701, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60701, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60702, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60702, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60703, 1}]};
get_attach_child_ratio(10019, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60703, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3450 andalso Talent =< 3549 ->
    {500, [{60710, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3550 andalso Talent =< 3649 ->
    {550, [{60710, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3650 andalso Talent =< 3749 ->
    {600, [{60710, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3750 andalso Talent =< 3849 ->
    {650, [{60711, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3850 andalso Talent =< 3949 ->
    {700, [{60711, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 3950 andalso Talent =< 4049 ->
    {750, [{60711, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 4050 andalso Talent =< 4149 ->
    {800, [{60712, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 4150 andalso Talent =< 4249 ->
    {850, [{60712, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 4250 andalso Talent =< 4349 ->
    {900, [{60713, 1}]};
get_attach_child_ratio(10021, Talent)
    when Talent >= 4350 andalso Talent =< 10000 ->
    {1000, [{60713, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60720, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60720, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60720, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60721, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60721, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60721, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60722, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60722, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60723, 1}]};
get_attach_child_ratio(10022, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60723, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60730, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60730, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60730, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60731, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60731, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60731, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60732, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60732, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60733, 1}]};
get_attach_child_ratio(10023, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60733, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60740, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60740, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60740, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60741, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60741, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60741, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60742, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60742, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60743, 1}]};
get_attach_child_ratio(10024, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60743, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {500, [{60750, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {550, [{60750, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {600, [{60750, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {650, [{60751, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {700, [{60751, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {750, [{60751, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {800, [{60752, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {850, [{60752, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {900, [{60753, 1}]};
get_attach_child_ratio(10025, Talent)
    when Talent >= 4400 andalso Talent =< 10000 ->
    {1000, [{60753, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3300 andalso Talent =< 3399 ->
    {500, [{60760, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {550, [{60760, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {600, [{60760, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {650, [{60761, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {700, [{60761, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {750, [{60761, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {800, [{60762, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {850, [{60762, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {900, [{60763, 1}]};
get_attach_child_ratio(10026, Talent)
    when Talent >= 4200 andalso Talent =< 10000 ->
    {1000, [{60763, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3400 andalso Talent =< 3499 ->
    {500, [{60770, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {550, [{60770, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {600, [{60770, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {650, [{60771, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {700, [{60771, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {750, [{60771, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {800, [{60772, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {850, [{60772, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {900, [{60773, 1}]};
get_attach_child_ratio(10027, Talent)
    when Talent >= 4300 andalso Talent =< 10000 ->
    {1000, [{60773, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 3500 andalso Talent =< 3599 ->
    {500, [{60780, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {550, [{60780, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {600, [{60780, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {650, [{60781, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {700, [{60781, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {750, [{60781, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {800, [{60782, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {850, [{60782, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {900, [{60783, 1}]};
get_attach_child_ratio(10028, Talent)
    when Talent >= 4400 andalso Talent =< 10000 ->
    {1000, [{60783, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60790, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60790, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60790, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60790, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60791, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60791, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60791, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60792, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60792, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60792, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60793, 1}]};
get_attach_child_ratio(10029, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60793, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60800, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60800, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60800, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60800, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60801, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60801, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60801, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60802, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60802, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60802, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60803, 1}]};
get_attach_child_ratio(10030, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60803, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60880, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60880, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60880, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60880, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60881, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60881, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60881, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60882, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60882, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60882, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60883, 1}]};
get_attach_child_ratio(10031, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60883, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60890, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60890, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60890, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60890, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60891, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60891, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60891, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60892, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60892, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60892, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60893, 1}]};
get_attach_child_ratio(10032, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60893, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {500, [{60920, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {530, [{60920, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {560, [{60920, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {600, [{60920, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {650, [{60921, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {700, [{60921, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {750, [{60921, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {800, [{60922, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {850, [{60922, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {900, [{60922, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4700 andalso Talent =< 4799 ->
    {950, [{60923, 1}]};
get_attach_child_ratio(10033, Talent)
    when Talent >= 4800 andalso Talent =< 10000 ->
    {1000, [{60923, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {500, [{60930, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {530, [{60930, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {560, [{60930, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {600, [{60930, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {650, [{60931, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {700, [{60931, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {750, [{60931, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {800, [{60932, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {850, [{60932, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {900, [{60932, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4700 andalso Talent =< 4799 ->
    {950, [{60933, 1}]};
get_attach_child_ratio(10034, Talent)
    when Talent >= 4800 andalso Talent =< 10000 ->
    {1000, [{60933, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60830, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60830, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60830, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60831, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60831, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60831, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60832, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60832, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60833, 1}]};
get_attach_child_ratio(20000, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60833, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60840, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60840, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60840, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60841, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60841, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60841, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60842, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60842, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60843, 1}]};
get_attach_child_ratio(20001, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60843, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60860, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60860, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60860, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60861, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60861, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60861, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60862, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60862, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4400 andalso Talent =< 4449 ->
    {900, [{60863, 1}]};
get_attach_child_ratio(20002, Talent)
    when Talent >= 4450 andalso Talent =< 10000 ->
    {1000, [{60863, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60870, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60870, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60870, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60871, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60871, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60871, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60872, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60872, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4400 andalso Talent =< 4449 ->
    {900, [{60873, 1}]};
get_attach_child_ratio(20003, Talent)
    when Talent >= 4450 andalso Talent =< 10000 ->
    {1000, [{60873, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60850, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {550, [{60850, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {600, [{60850, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {650, [{60851, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {700, [{60851, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {750, [{60851, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {800, [{60852, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {850, [{60852, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {900, [{60853, 1}]};
get_attach_child_ratio(20004, Talent)
    when Talent >= 4500 andalso Talent =< 10000 ->
    {1000, [{60853, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60820, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60820, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60820, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60820, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60821, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60821, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60821, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60822, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60822, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60822, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60823, 1}]};
get_attach_child_ratio(20005, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60823, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60810, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60810, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60810, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60810, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60811, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60811, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60811, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60812, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60812, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60812, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60813, 1}]};
get_attach_child_ratio(20006, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60813, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60910, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60910, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60910, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60910, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60911, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60911, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60911, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60912, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60912, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60912, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60913, 1}]};
get_attach_child_ratio(20007, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60913, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60940, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60940, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60940, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60940, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60941, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60941, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60941, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60942, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60942, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60942, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60943, 1}]};
get_attach_child_ratio(20010, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60943, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60950, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60950, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60950, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60950, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60951, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60951, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60951, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60952, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60952, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60952, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60953, 1}]};
get_attach_child_ratio(20012, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60953, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 3600 andalso Talent =< 3699 ->
    {500, [{60960, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 3700 andalso Talent =< 3799 ->
    {530, [{60960, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 3800 andalso Talent =< 3899 ->
    {560, [{60960, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 3900 andalso Talent =< 3999 ->
    {600, [{60960, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4000 andalso Talent =< 4099 ->
    {650, [{60961, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4100 andalso Talent =< 4199 ->
    {700, [{60961, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4200 andalso Talent =< 4299 ->
    {750, [{60961, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4300 andalso Talent =< 4399 ->
    {800, [{60962, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4400 andalso Talent =< 4499 ->
    {850, [{60962, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4500 andalso Talent =< 4599 ->
    {900, [{60962, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4600 andalso Talent =< 4699 ->
    {950, [{60963, 1}]};
get_attach_child_ratio(20016, Talent)
    when Talent >= 4700 andalso Talent =< 10000 ->
    {1000, [{60963, 1}]};
get_attach_child_ratio(_, _) -> {0, []}.

get_special_skills(20000) -> [{60506, 1}];
get_special_skills(_) -> [].

get_unreal_black() ->
    [10000,
     10001,
     10002,
     10003,
     10004,
     10005,
     10006,
     10007,
     10008,
     10009,
     10010,
     10011,
     10012,
     10013,
     10014].

get_unreal(24052) ->
    #pet_unreal_data{item_id = 24052, skills = [{60901, 1}],
                     skin_id = 31902};
get_unreal(24053) ->
    #pet_unreal_data{item_id = 24053, skills = [{60902, 1}],
                     skin_id = 31901};
get_unreal(24055) ->
    #pet_unreal_data{item_id = 24055, skills = [{60903, 1}],
                     skin_id = 32032};
get_unreal(24056) ->
    #pet_unreal_data{item_id = 24056, skills = [{60904, 1}],
                     skin_id = 32033};
get_unreal(_) -> false.

get_exchange_skill_info(10037) ->
    #{pet_id => 10037, skill_id => 60527,
      skills =>
          [{60528, 1},
           {60529, 1},
           {60530, 1},
           {60531, 1},
           {60532, 1}],
      cost => [{70211, 1}]};
get_exchange_skill_info(_) -> false.

