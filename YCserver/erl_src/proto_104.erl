-file("src/proto/proto_104.erl", 1).

-module(proto_104).

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

-file("src/proto/proto_104.erl", 14).

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

-file("src/proto/proto_104.erl", 15).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/proto/proto_104.erl", 16).

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

-file("src/proto/proto_104.erl", 17).

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

-file("src/proto/proto_104.erl", 18).

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

-file("src/proto/proto_104.erl", 19).

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

-file("src/proto/proto_104.erl", 20).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/proto/proto_104.erl", 21).

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

-file("src/proto/proto_104.erl", 22).

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

-file("src/proto/proto_104.erl", 23).

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

-file("src/proto/proto_104.erl", 24).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10400, {V0_channel, V0_msg}) ->
    D_a_t_a = <<V0_channel:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10400:16/little,
       D_a_t_a/binary>>};
pack(srv, 10400,
     {V0_channel,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_msg,
      V0_guild_name,
      V0_special}) ->
    D_a_t_a = <<V0_channel:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (protocol:pack(string, V0_guild_name))/binary,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10400:16/little,
       D_a_t_a/binary>>};
pack(cli, 10401, {}) ->
    {ok, <<2:32/little, 10401:16/little>>};
pack(srv, 10401, {V0_flag, V0_channel, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little, V0_channel:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10401:16/little,
       D_a_t_a/binary>>};
pack(cli, 10402,
     {V0_id, V0_platform, V0_zone_id, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10402:16/little,
       D_a_t_a/binary>>};
pack(srv, 10402,
     {V0_t_id,
      V0_t_platform,
      V0_t_zone_id,
      V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_face,
      V0_sex,
      V0_lev,
      V0_classes,
      V0_guild,
      V0_msg,
      V0_special}) ->
    D_a_t_a = <<V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone_id:16/little, V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_face:32/little, V0_sex:8/little, V0_lev:8/little,
                V0_classes:8/little,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_msg))/binary,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10402:16/little,
       D_a_t_a/binary>>};
pack(cli, 10403,
     {V0_channel, V0_voice, V0_time, V0_text, V0_id}) ->
    D_a_t_a = <<V0_channel:8/little,
                (byte_size(V0_voice)):32/little, V0_voice/binary,
                V0_time:8/little,
                (protocol:pack(string, V0_text))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10403:16/little,
       D_a_t_a/binary>>};
pack(srv, 10403,
     {V0_channel,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_special,
      V0_id,
      V0_time,
      V0_text}) ->
    D_a_t_a = <<V0_channel:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary,
                V0_id:32/little, V0_time:8/little,
                (protocol:pack(string, V0_text))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10403:16/little,
       D_a_t_a/binary>>};
pack(cli, 10404, {V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10404:16/little,
       D_a_t_a/binary>>};
pack(srv, 10404,
     {V0_platform,
      V0_zone_id,
      V0_id,
      #chat_voice{voice = V0_voice}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little,
                (byte_size(V0_voice)):32/little, V0_voice/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10404:16/little,
       D_a_t_a/binary>>};
pack(cli, 10405, {}) ->
    {ok, <<2:32/little, 10405:16/little>>};
pack(srv, 10405, {V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10405:16/little,
       D_a_t_a/binary>>};
pack(cli, 10406, {V0_type, V0_base_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10406:16/little,
       D_a_t_a/binary>>};
pack(srv, 10406,
     {V0_flag, V0_type, V0_base_id, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:8/little,
                V0_base_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10406:16/little,
       D_a_t_a/binary>>};
pack(cli, 10407,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10407:16/little,
       D_a_t_a/binary>>};
pack(srv, 10407,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      #item{id = V0_id, base_id = V0_base_id, bind = V0_bind,
            craft = V0_craft, enchant = V0_enchant,
            expire_type = V0_expire_type,
            expire_time = V0_expire_time, attr = V0_attr,
            extra = V0_extra}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_id:32/little, V0_base_id:32/little, V0_bind:8/little,
                V0_craft:8/little, V0_enchant:8/signed-little,
                V0_expire_type:8/little, V0_expire_time:32/little,
                (length(V0_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr]))/binary,
                (length(V0_extra)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_value:32/little,
                                   (protocol:pack(string, V1_str))/binary>>
                                 || {V1_name, V1_value, V1_str}
                                        <- V0_extra]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10407:16/little,
       D_a_t_a/binary>>};
pack(cli, 10408, {V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10408:16/little,
       D_a_t_a/binary>>};
pack(srv, 10408,
     {V0_platform,
      V0_zone_id,
      V0_id,
      #pet{name = V0_name, lev = V0_lev, base_id = V0_base_id,
           happy = V0_happy, grade = V0_grade, talent = V0_talent,
           genre = V0_genre, growth = V0_growth,
           growth_type = V0_growth_type, hp = V0_hp, mp = V0_mp,
           feed_point = V0_feed_point,
           attr =
               #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
                     atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
                     magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
                     magic_def = V0_magic_def},
           pet_attr =
               #pet_attr{hp_aptitude = V0_hp_aptitude,
                         phy_aptitude = V0_phy_aptitude,
                         pdef_aptitude = V0_pdef_aptitude,
                         magic_aptitude = V0_magic_aptitude,
                         aspd_aptitude = V0_aspd_aptitude,
                         max_hp_aptitude = V0_max_hp_aptitude,
                         max_phy_aptitude = V0_max_phy_aptitude,
                         max_pdef_aptitude = V0_max_pdef_aptitude,
                         max_magic_aptitude = V0_max_magic_aptitude,
                         max_aspd_aptitude = V0_max_aspd_aptitude},
           skills = V0_skills, stones = V0_stones,
           mount_skills = V0_mount_skills,
           handbook_attr = V0_handbook_attr,
           handbook_num = V0_handbook_num,
           star_handbook_num = V0_star_handbook_num,
           pet_skin = #pet_skin{use_skin = V0_use_skin},
           spirit_info = V0_spirit_info, unreal = V0_unreal,
           unreal_looks_flag = V0_unreal_looks_flag,
           pet_rune = V0_pet_rune}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_base_id:32/little,
                V0_happy:8/little, V0_grade:8/little,
                V0_talent:16/little, V0_genre:8/little,
                V0_growth:16/little, V0_growth_type:8/little,
                V0_hp:32/little, V0_mp:32/little,
                V0_feed_point:32/little, V0_hp_max:32/little,
                V0_mp_max:32/little, V0_atk_speed:16/little,
                V0_phy_dmg:32/little, V0_magic_dmg:32/little,
                V0_phy_def:32/little, V0_magic_def:32/little,
                V0_hp_aptitude:16/little, V0_phy_aptitude:16/little,
                V0_pdef_aptitude:16/little, V0_magic_aptitude:16/little,
                V0_aspd_aptitude:16/little,
                V0_max_hp_aptitude:16/little,
                V0_max_phy_aptitude:16/little,
                V0_max_pdef_aptitude:16/little,
                V0_max_magic_aptitude:16/little,
                V0_max_aspd_aptitude:16/little,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_source:8/little>>
                                 || #pet_skill{id = V1_id, source = V1_source}
                                        <- V0_skills]))/binary,
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
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          attr = V1_attr,
                                          reset_attr = V1_reset_attr,
                                          extra = V1_extra}
                                        <- V0_stones]))/binary,
                (length(V0_mount_skills)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:32/little>>
                                 || #mount_skill{skill_index = V1_skill_index,
                                                 skill_id = V1_skill_id,
                                                 skill_lev = V1_skill_lev}
                                        <- V0_mount_skills]))/binary,
                (length(V0_handbook_attr)):16/little,
                (list_to_binary([<<V1_attr_name:32/little,
                                   V1_attr_val:32/little>>
                                 || {V1_attr_name, V1_attr_val}
                                        <- V0_handbook_attr]))/binary,
                V0_handbook_num:8/little, V0_star_handbook_num:8/little,
                V0_use_skin:32/little,
                (length(V0_spirit_info)):16/little,
                (list_to_binary([<<V1_spirit_base_id:32/little,
                                   V1_spirit_talent:32/little,
                                   V1_spirit_lev:16/little>>
                                 || {V1_spirit_base_id,
                                     V1_spirit_talent,
                                     V1_spirit_lev}
                                        <- V0_spirit_info]))/binary,
                (length(V0_unreal)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_timeout:32/little>>
                                 || #pet_unreal{item_id = V1_item_id,
                                                timeout = V1_timeout}
                                        <- V0_unreal]))/binary,
                V0_unreal_looks_flag:8/little,
                (length(V0_pet_rune)):16/little,
                (list_to_binary([<<V1_rune_index:8/little,
                                   V1_rune_type:8/little,
                                   V1_rune_status:8/little,
                                   V1_rune_id:32/little, V1_rune_lev:8/little,
                                   V1_is_resonance:8/little,
                                   (length(V1_resonances)):16/little,
                                   (list_to_binary([<<V2_resonance_index:8/little,
                                                      V2_resonance_id:32/little,
                                                      V2_rune_index:8/little>>
                                                    || #pet_resonance{resonance_index
                                                                          =
                                                                          V2_resonance_index,
                                                                      resonance_id
                                                                          =
                                                                          V2_resonance_id,
                                                                      rune_index
                                                                          =
                                                                          V2_rune_index}
                                                           <- V1_resonances]))/binary>>
                                 || #pet_rune{rune_index = V1_rune_index,
                                              rune_type = V1_rune_type,
                                              rune_status = V1_rune_status,
                                              rune_id = V1_rune_id,
                                              rune_lev = V1_rune_lev,
                                              is_resonance = V1_is_resonance,
                                              resonances = V1_resonances}
                                        <- V0_pet_rune]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10408:16/little,
       D_a_t_a/binary>>};
pack(cli, 10409,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10409:16/little,
       D_a_t_a/binary>>};
pack(srv, 10409,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      #item{id = V0_id, base_id = V0_base_id, bind = V0_bind,
            craft = V0_craft, enchant = V0_enchant,
            expire_type = V0_expire_type,
            expire_time = V0_expire_time, attr = V0_attr,
            extra = V0_extra}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_id:32/little, V0_base_id:32/little, V0_bind:8/little,
                V0_craft:8/little, V0_enchant:8/signed-little,
                V0_expire_type:8/little, V0_expire_time:32/little,
                (length(V0_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr]))/binary,
                (length(V0_extra)):16/little,
                (list_to_binary([<<V1_name:32/little,
                                   V1_value:32/little,
                                   (protocol:pack(string, V1_str))/binary>>
                                 || {V1_name, V1_value, V1_str}
                                        <- V0_extra]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10409:16/little,
       D_a_t_a/binary>>};
pack(cli, 10410,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10410:16/little,
       D_a_t_a/binary>>};
pack(srv, 10410,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      #guard{base_id = V0_base_id, score = V0_score,
             quality = V0_quality,
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
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_base_id:32/little, V0_score:32/little,
                V0_quality:8/little, V0_hp_max:32/little,
                V0_mp_max:32/little, V0_atk_speed:16/little,
                V0_phy_dmg:32/little, V0_magic_dmg:32/little,
                V0_phy_def:32/little, V0_magic_def:32/little,
                V0_heal_val:16/little, (length(V0_eqm)):16/little,
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
                                   V1_timeout:32/little>>
                                 || #guard_eqm{base_id = V1_base_id,
                                               eqm_attrs = V1_eqm_attrs,
                                               gem = V1_gem,
                                               timeout = V1_timeout}
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
     <<(byte_size(D_a_t_a) + 2):32/little, 10410:16/little,
       D_a_t_a/binary>>};
pack(cli, 10411,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_voice,
      V0_time,
      V0_text,
      V0_cache_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, (byte_size(V0_voice)):32/little,
                V0_voice/binary, V0_time:8/little,
                (protocol:pack(string, V0_text))/binary,
                V0_cache_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10411:16/little,
       D_a_t_a/binary>>};
pack(srv, 10411,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_face,
      V0_sex,
      V0_lev,
      V0_classes,
      V0_guild,
      V0_cache_id,
      V0_time,
      V0_text,
      V0_special}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_face:32/little, V0_sex:8/little, V0_lev:8/little,
                V0_classes:8/little,
                (protocol:pack(string, V0_guild))/binary,
                V0_cache_id:32/little, V0_time:8/little,
                (protocol:pack(string, V0_text))/binary,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10411:16/little,
       D_a_t_a/binary>>};
pack(cli, 10412, {}) ->
    {ok, <<2:32/little, 10412:16/little>>};
pack(srv, 10412, {}) ->
    {ok, <<2:32/little, 10412:16/little>>};
pack(cli, 10413, {}) ->
    {ok, <<2:32/little, 10413:16/little>>};
pack(srv, 10413,
     {{V0_id, V0_platform, V0_zone_id}, V0_name, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10413:16/little,
       D_a_t_a/binary>>};
pack(cli, 10414, {}) ->
    {ok, <<2:32/little, 10414:16/little>>};
pack(srv, 10414, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_val:32/little>>
                                 || V1_val <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10414:16/little,
       D_a_t_a/binary>>};
pack(cli, 10415, {V0_bubble}) ->
    D_a_t_a = <<V0_bubble:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10415:16/little,
       D_a_t_a/binary>>};
pack(srv, 10415, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10415:16/little,
       D_a_t_a/binary>>};
pack(cli, 10416, {}) ->
    {ok, <<2:32/little, 10416:16/little>>};
pack(srv, 10416, {V0_bubble_id}) ->
    D_a_t_a = <<V0_bubble_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10416:16/little,
       D_a_t_a/binary>>};
pack(cli, 10417,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10417:16/little,
       D_a_t_a/binary>>};
pack(srv, 10417,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      V0_grade,
      V0_wing_id,
      V0_growth,
      V0_enhance,
      V0_tmp_grade,
      V0_tmp_wing_id,
      V0_tmp_growth,
      V0_star,
      V0_skill_data,
      V0_tmp_skill_data,
      V0_break_skills}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_grade:8/little, V0_wing_id:32/little,
                V0_growth:8/little, V0_enhance:8/little,
                V0_tmp_grade:8/little, V0_tmp_wing_id:32/little,
                V0_tmp_growth:8/little, V0_star:32/little,
                (length(V0_skill_data)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little>>
                                 || {V1_id, V1_lev} <- V0_skill_data]))/binary,
                (length(V0_tmp_skill_data)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_lev:8/little>>
                                 || {V1_id, V1_lev}
                                        <- V0_tmp_skill_data]))/binary,
                (length(V0_break_skills)):16/little,
                (list_to_binary([<<V1_skill_grade:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:8/little>>
                                 || #wing_lev_break_skill{skill_grade =
                                                              V1_skill_grade,
                                                          skill_id =
                                                              V1_skill_id,
                                                          skill_lev =
                                                              V1_skill_lev}
                                        <- V0_break_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10417:16/little,
       D_a_t_a/binary>>};
pack(cli, 10418,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10418:16/little,
       D_a_t_a/binary>>};
pack(srv, 10418,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      #mount{index = V0_index,
             mount_base_id = V0_mount_base_id,
             transformation_id = V0_transformation_id, lev = V0_lev,
             skill_point = V0_skill_point,
             fail_times = V0_fail_times,
             upgrade_lev = V0_upgrade_lev,
             live_status = V0_live_status,
             skill_list = V0_skill_list, spirit = V0_spirit,
             fight_times = V0_fight_times, growth = V0_growth,
             growth_item_num = V0_growth_item_num,
             speed_lev = V0_speed_lev, manger_pets = V0_manger_pets,
             decorate_list = V0_decorate_list,
             tmp_growth = V0_tmp_growth,
             tmp_skill_list = V0_tmp_skill_list, score = V0_score},
      V0_appearance_list,
      V0_dye_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_index:8/little, V0_mount_base_id:32/little,
                V0_transformation_id:32/little, V0_lev:32/little,
                V0_skill_point:32/little, V0_fail_times:32/little,
                V0_upgrade_lev:32/little, V0_live_status:8/little,
                (length(V0_skill_list)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:32/little>>
                                 || #mount_skill{skill_index = V1_skill_index,
                                                 skill_id = V1_skill_id,
                                                 skill_lev = V1_skill_lev}
                                        <- V0_skill_list]))/binary,
                V0_spirit:32/little, V0_fight_times:32/little,
                V0_growth:32/little, V0_growth_item_num:32/little,
                V0_speed_lev:32/little,
                (length(V0_manger_pets)):16/little,
                (list_to_binary([<<V1_pet_id:32/little>>
                                 || V1_pet_id <- V0_manger_pets]))/binary,
                (length(V0_decorate_list)):16/little,
                (list_to_binary([<<V1_decorate_index:8/little,
                                   V1_decorate_base_id:32/little,
                                   V1_is_hide:8/little>>
                                 || #mount_decorate{decorate_index =
                                                        V1_decorate_index,
                                                    decorate_base_id =
                                                        V1_decorate_base_id,
                                                    is_hide = V1_is_hide}
                                        <- V0_decorate_list]))/binary,
                V0_tmp_growth:32/little,
                (length(V0_tmp_skill_list)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little>>
                                 || {V1_skill_index, V1_skill_id}
                                        <- V0_tmp_skill_list]))/binary,
                V0_score:32/little,
                (length(V0_appearance_list)):16/little,
                (list_to_binary([<<V1_appearance_id:32/little,
                                   V1_expire_time:32/little>>
                                 || {V1_appearance_id, V1_expire_time}
                                        <- V0_appearance_list]))/binary,
                V0_dye_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10418:16/little,
       D_a_t_a/binary>>};
pack(cli, 10419, {V0_match_id}) ->
    D_a_t_a = <<V0_match_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10419:16/little,
       D_a_t_a/binary>>};
pack(srv, 10419, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10419:16/little,
       D_a_t_a/binary>>};
pack(cli, 10420,
     {V0_child_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10420:16/little,
       D_a_t_a/binary>>};
pack(srv, 10420, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10420:16/little,
       D_a_t_a/binary>>};
pack(cli, 10421, {V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10421:16/little,
       D_a_t_a/binary>>};
pack(srv, 10421,
     {V0_platform,
      V0_zone_id,
      V0_id,
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
             stones = V0_stones, spirit_info = V0_spirit_info,
             child_skin = V0_child_skin}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little,
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
                                        <- V0_stones]))/binary,
                (length(V0_spirit_info)):16/little,
                (list_to_binary([<<V1_spirit_base_id:32/little,
                                   V1_spirit_talent:32/little,
                                   V1_spirit_lev:16/little>>
                                 || {V1_spirit_base_id,
                                     V1_spirit_talent,
                                     V1_spirit_lev}
                                        <- V0_spirit_info]))/binary,
                (length(V0_child_skin)):16/little,
                (list_to_binary([<<V1_skin_id:32/little,
                                   V1_skin_active_flag:8/little,
                                   V1_expire_time:32/little>>
                                 || #child_skin{skin_id = V1_skin_id,
                                                skin_active_flag =
                                                    V1_skin_active_flag,
                                                expire_time = V1_expire_time}
                                        <- V0_child_skin]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10421:16/little,
       D_a_t_a/binary>>};
pack(cli, 10422, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10422:16/little,
       D_a_t_a/binary>>};
pack(srv, 10422, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10422:16/little,
       D_a_t_a/binary>>};
pack(cli, 10423, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10423:16/little,
       D_a_t_a/binary>>};
pack(srv, 10423, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10423:16/little,
       D_a_t_a/binary>>};
pack(cli, 10424,
     {V0_channel,
      V0_group_id,
      V0_group_platform,
      V0_group_zone_id,
      V0_msg}) ->
    D_a_t_a = <<V0_channel:8/little, V0_group_id:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10424:16/little,
       D_a_t_a/binary>>};
pack(srv, 10424,
     {V0_channel,
      {V0_group_id, V0_group_platform, V0_group_zone_id},
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_msg,
      V0_guild_name,
      V0_special}) ->
    D_a_t_a = <<V0_channel:8/little, V0_group_id:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (protocol:pack(string, V0_guild_name))/binary,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10424:16/little,
       D_a_t_a/binary>>};
pack(cli, 10425,
     {V0_channel,
      V0_group_id,
      V0_group_platform,
      V0_group_zone_id,
      V0_voice,
      V0_time,
      V0_text,
      V0_id}) ->
    D_a_t_a = <<V0_channel:8/little, V0_group_id:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little,
                (byte_size(V0_voice)):32/little, V0_voice/binary,
                V0_time:8/little,
                (protocol:pack(string, V0_text))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10425:16/little,
       D_a_t_a/binary>>};
pack(srv, 10425,
     {V0_channel,
      V0_group_id,
      V0_group_platform,
      V0_group_zone_id,
      V0_rid,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_special,
      V0_id,
      V0_time,
      V0_text}) ->
    D_a_t_a = <<V0_channel:8/little, V0_group_id:32/little,
                (protocol:pack(string, V0_group_platform))/binary,
                V0_group_zone_id:16/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                (length(V0_special)):16/little,
                (list_to_binary([<<V1_type:8/little, V1_val:32/little>>
                                 || {V1_type, V1_val} <- V0_special]))/binary,
                V0_id:32/little, V0_time:8/little,
                (protocol:pack(string, V0_text))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10425:16/little,
       D_a_t_a/binary>>};
pack(cli, 10426, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10426:16/little,
       D_a_t_a/binary>>};
pack(srv, 10426, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10426:16/little,
       D_a_t_a/binary>>};
pack(cli, 10427,
     {V0_platform, V0_zone_id, V0_query_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10427:16/little,
       D_a_t_a/binary>>};
pack(srv, 10427,
     {V0_platform,
      V0_zone_id,
      V0_query_id,
      #talisman{id = V0_id, base_id = V0_base_id, fc = V0_fc,
                attr = V0_attr}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_query_id:32/little,
                V0_id:32/little, V0_base_id:32/little, V0_fc:32/little,
                (length(V0_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10427:16/little,
       D_a_t_a/binary>>};
pack(cli, 10428, {}) ->
    {ok, <<2:32/little, 10428:16/little>>};
pack(srv, 10428, {V0_m_list, V0_b_list}) ->
    D_a_t_a = <<(length(V0_m_list)):16/little,
                (list_to_binary([<<V1_val:32/little>>
                                 || V1_val <- V0_m_list]))/binary,
                (length(V0_b_list)):16/little,
                (list_to_binary([<<V1_val:32/little>>
                                 || V1_val <- V0_b_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10428:16/little,
       D_a_t_a/binary>>};
pack(cli, 10429, {}) ->
    {ok, <<2:32/little, 10429:16/little>>};
pack(srv, 10429, {V0_val, V0_type, V0_num, V0_own}) ->
    D_a_t_a = <<V0_val:32/little, V0_type:8/little,
                V0_num:32/little, V0_own:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10429:16/little,
       D_a_t_a/binary>>};
pack(cli, 10430, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10430:16/little,
       D_a_t_a/binary>>};
pack(srv, 10430, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10430:16/little,
       D_a_t_a/binary>>};
pack(cli, 10431, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10431:16/little,
       D_a_t_a/binary>>};
pack(srv, 10431, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10431:16/little,
       D_a_t_a/binary>>};
pack(cli, 10432, {}) ->
    {ok, <<2:32/little, 10432:16/little>>};
pack(srv, 10432, {V0_flag, V0_channel, V0_code}) ->
    D_a_t_a = <<V0_flag:8/little, V0_channel:8/little,
                V0_code:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10432:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10400, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_channel, V1_msg}};
unpack(cli, 10400, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_msg, _B9} = protocol:string(_B8),
    {V1_guild_name, _B10} = protocol:string(_B9),
    {V1_special, _B15} = protocol:array(_B10,
                                        fun (_B11) ->
                                                {V2_type, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_val, _B13} =
                                                    protocol:uint32(_B12),
                                                {{V2_type, V2_val}, _B13}
                                        end),
    {ok,
     {V1_channel,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_msg,
      V1_guild_name,
      V1_special}};
unpack(srv, 10401, _B0) -> {ok, {}};
unpack(cli, 10401, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_channel, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_channel, V1_msg}};
unpack(srv, 10402, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_msg}};
unpack(cli, 10402, _B0) ->
    {V1_t_id, _B1} = protocol:uint32(_B0),
    {V1_t_platform, _B2} = protocol:string(_B1),
    {V1_t_zone_id, _B3} = protocol:uint16(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint16(_B5),
    {V1_name, _B7} = protocol:string(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_lev, _B10} = protocol:uint8(_B9),
    {V1_classes, _B11} = protocol:uint8(_B10),
    {V1_guild, _B12} = protocol:string(_B11),
    {V1_msg, _B13} = protocol:string(_B12),
    {V1_special, _B18} = protocol:array(_B13,
                                        fun (_B14) ->
                                                {V2_type, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_val, _B16} =
                                                    protocol:uint32(_B15),
                                                {{V2_type, V2_val}, _B16}
                                        end),
    {ok,
     {V1_t_id,
      V1_t_platform,
      V1_t_zone_id,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_face,
      V1_sex,
      V1_lev,
      V1_classes,
      V1_guild,
      V1_msg,
      V1_special}};
unpack(srv, 10403, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_voice, _B2} = protocol:byte(_B1),
    {V1_time, _B3} = protocol:uint8(_B2),
    {V1_text, _B4} = protocol:string(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {ok, {V1_channel, V1_voice, V1_time, V1_text, V1_id}};
unpack(cli, 10403, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_special, _B13} = protocol:array(_B8,
                                        fun (_B9) ->
                                                {V2_type, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_val, _B11} =
                                                    protocol:uint32(_B10),
                                                {{V2_type, V2_val}, _B11}
                                        end),
    {V1_id, _B14} = protocol:uint32(_B13),
    {V1_time, _B15} = protocol:uint8(_B14),
    {V1_text, _B16} = protocol:string(_B15),
    {ok,
     {V1_channel,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_special,
      V1_id,
      V1_time,
      V1_text}};
unpack(srv, 10404, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_id}};
unpack(cli, 10404, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_voice, _B4} = protocol:byte(_B3),
    {ok, {V1_platform, V1_zone_id, V1_id, V1_voice}};
unpack(srv, 10405, _B0) -> {ok, {}};
unpack(cli, 10405, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_id}};
unpack(srv, 10406, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_base_id}};
unpack(cli, 10406, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_type, V1_base_id, V1_id}};
unpack(srv, 10407, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10407, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_base_id, _B5} = protocol:uint32(_B4),
    {V1_bind, _B6} = protocol:uint8(_B5),
    {V1_craft, _B7} = protocol:uint8(_B6),
    {V1_enchant, _B8} = protocol:int8(_B7),
    {V1_expire_type, _B9} = protocol:uint8(_B8),
    {V1_expire_time, _B10} = protocol:uint32(_B9),
    {V1_attr, _B17} = protocol:array(_B10,
                                     fun (_B11) ->
                                             {V2_type, _B12} =
                                                 protocol:uint16(_B11),
                                             {V2_name, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_flag, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_val, _B15} =
                                                 protocol:int32(_B14),
                                             {{V2_type,
                                               V2_name,
                                               V2_flag,
                                               V2_val},
                                              _B15}
                                     end),
    {V1_extra, _B23} = protocol:array(_B17,
                                      fun (_B18) ->
                                              {V2_name, _B19} =
                                                  protocol:uint32(_B18),
                                              {V2_value, _B20} =
                                                  protocol:uint32(_B19),
                                              {V2_str, _B21} =
                                                  protocol:string(_B20),
                                              {{V2_name, V2_value, V2_str},
                                               _B21}
                                      end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_id,
      V1_base_id,
      V1_bind,
      V1_craft,
      V1_enchant,
      V1_expire_type,
      V1_expire_time,
      V1_attr,
      V1_extra}};
unpack(srv, 10408, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_id}};
unpack(cli, 10408, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_base_id, _B6} = protocol:uint32(_B5),
    {V1_happy, _B7} = protocol:uint8(_B6),
    {V1_grade, _B8} = protocol:uint8(_B7),
    {V1_talent, _B9} = protocol:uint16(_B8),
    {V1_genre, _B10} = protocol:uint8(_B9),
    {V1_growth, _B11} = protocol:uint16(_B10),
    {V1_growth_type, _B12} = protocol:uint8(_B11),
    {V1_hp, _B13} = protocol:uint32(_B12),
    {V1_mp, _B14} = protocol:uint32(_B13),
    {V1_feed_point, _B15} = protocol:uint32(_B14),
    {V1_hp_max, _B16} = protocol:uint32(_B15),
    {V1_mp_max, _B17} = protocol:uint32(_B16),
    {V1_atk_speed, _B18} = protocol:uint16(_B17),
    {V1_phy_dmg, _B19} = protocol:uint32(_B18),
    {V1_magic_dmg, _B20} = protocol:uint32(_B19),
    {V1_phy_def, _B21} = protocol:uint32(_B20),
    {V1_magic_def, _B22} = protocol:uint32(_B21),
    {V1_hp_aptitude, _B23} = protocol:uint16(_B22),
    {V1_phy_aptitude, _B24} = protocol:uint16(_B23),
    {V1_pdef_aptitude, _B25} = protocol:uint16(_B24),
    {V1_magic_aptitude, _B26} = protocol:uint16(_B25),
    {V1_aspd_aptitude, _B27} = protocol:uint16(_B26),
    {V1_max_hp_aptitude, _B28} = protocol:uint16(_B27),
    {V1_max_phy_aptitude, _B29} = protocol:uint16(_B28),
    {V1_max_pdef_aptitude, _B30} = protocol:uint16(_B29),
    {V1_max_magic_aptitude, _B31} = protocol:uint16(_B30),
    {V1_max_aspd_aptitude, _B32} = protocol:uint16(_B31),
    {V1_skills, _B37} = protocol:array(_B32,
                                       fun (_B33) ->
                                               {V2_id, _B34} =
                                                   protocol:uint32(_B33),
                                               {V2_source, _B35} =
                                                   protocol:uint8(_B34),
                                               {{V2_id, V2_source}, _B35}
                                       end),
    {V1_stones, _B62} = protocol:array(_B37,
                                       fun (_B38) ->
                                               {V2_id, _B39} =
                                                   protocol:uint32(_B38),
                                               {V2_base_id, _B40} =
                                                   protocol:uint32(_B39),
                                               {V2_attr, _B47} =
                                                   protocol:array(_B40,
                                                                  fun (_B41) ->
                                                                          {V3_type,
                                                                           _B42} =
                                                                              protocol:uint16(_B41),
                                                                          {V3_name,
                                                                           _B43} =
                                                                              protocol:uint32(_B42),
                                                                          {V3_flag,
                                                                           _B44} =
                                                                              protocol:uint32(_B43),
                                                                          {V3_val,
                                                                           _B45} =
                                                                              protocol:int32(_B44),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B45}
                                                                  end),
                                               {V2_reset_attr, _B54} =
                                                   protocol:array(_B47,
                                                                  fun (_B48) ->
                                                                          {V3_type,
                                                                           _B49} =
                                                                              protocol:uint16(_B48),
                                                                          {V3_name,
                                                                           _B50} =
                                                                              protocol:uint32(_B49),
                                                                          {V3_flag,
                                                                           _B51} =
                                                                              protocol:uint32(_B50),
                                                                          {V3_val,
                                                                           _B52} =
                                                                              protocol:int32(_B51),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B52}
                                                                  end),
                                               {V2_extra, _B60} =
                                                   protocol:array(_B54,
                                                                  fun (_B55) ->
                                                                          {V3_name,
                                                                           _B56} =
                                                                              protocol:uint32(_B55),
                                                                          {V3_value,
                                                                           _B57} =
                                                                              protocol:uint32(_B56),
                                                                          {V3_str,
                                                                           _B58} =
                                                                              protocol:string(_B57),
                                                                          {{V3_name,
                                                                            V3_value,
                                                                            V3_str},
                                                                           _B58}
                                                                  end),
                                               {{V2_id,
                                                 V2_base_id,
                                                 V2_attr,
                                                 V2_reset_attr,
                                                 V2_extra},
                                                _B60}
                                       end),
    {V1_mount_skills, _B68} = protocol:array(_B62,
                                             fun (_B63) ->
                                                     {V2_skill_index, _B64} =
                                                         protocol:uint8(_B63),
                                                     {V2_skill_id, _B65} =
                                                         protocol:uint32(_B64),
                                                     {V2_skill_lev, _B66} =
                                                         protocol:uint32(_B65),
                                                     {{V2_skill_index,
                                                       V2_skill_id,
                                                       V2_skill_lev},
                                                      _B66}
                                             end),
    {V1_handbook_attr, _B73} = protocol:array(_B68,
                                              fun (_B69) ->
                                                      {V2_attr_name, _B70} =
                                                          protocol:uint32(_B69),
                                                      {V2_attr_val, _B71} =
                                                          protocol:uint32(_B70),
                                                      {{V2_attr_name,
                                                        V2_attr_val},
                                                       _B71}
                                              end),
    {V1_handbook_num, _B74} = protocol:uint8(_B73),
    {V1_star_handbook_num, _B75} = protocol:uint8(_B74),
    {V1_use_skin, _B76} = protocol:uint32(_B75),
    {V1_spirit_info, _B82} = protocol:array(_B76,
                                            fun (_B77) ->
                                                    {V2_spirit_base_id, _B78} =
                                                        protocol:uint32(_B77),
                                                    {V2_spirit_talent, _B79} =
                                                        protocol:uint32(_B78),
                                                    {V2_spirit_lev, _B80} =
                                                        protocol:uint16(_B79),
                                                    {{V2_spirit_base_id,
                                                      V2_spirit_talent,
                                                      V2_spirit_lev},
                                                     _B80}
                                            end),
    {V1_unreal, _B87} = protocol:array(_B82,
                                       fun (_B83) ->
                                               {V2_item_id, _B84} =
                                                   protocol:uint32(_B83),
                                               {V2_timeout, _B85} =
                                                   protocol:uint32(_B84),
                                               {{V2_item_id, V2_timeout}, _B85}
                                       end),
    {V1_unreal_looks_flag, _B88} = protocol:uint8(_B87),
    {V1_pet_rune, _B103} = protocol:array(_B88,
                                          fun (_B89) ->
                                                  {V2_rune_index, _B90} =
                                                      protocol:uint8(_B89),
                                                  {V2_rune_type, _B91} =
                                                      protocol:uint8(_B90),
                                                  {V2_rune_status, _B92} =
                                                      protocol:uint8(_B91),
                                                  {V2_rune_id, _B93} =
                                                      protocol:uint32(_B92),
                                                  {V2_rune_lev, _B94} =
                                                      protocol:uint8(_B93),
                                                  {V2_is_resonance, _B95} =
                                                      protocol:uint8(_B94),
                                                  {V2_resonances, _B101} =
                                                      protocol:array(_B95,
                                                                     fun
                                                                         (_B96) ->
                                                                             {V3_resonance_index,
                                                                              _B97} =
                                                                                 protocol:uint8(_B96),
                                                                             {V3_resonance_id,
                                                                              _B98} =
                                                                                 protocol:uint32(_B97),
                                                                             {V3_rune_index,
                                                                              _B99} =
                                                                                 protocol:uint8(_B98),
                                                                             {{V3_resonance_index,
                                                                               V3_resonance_id,
                                                                               V3_rune_index},
                                                                              _B99}
                                                                     end),
                                                  {{V2_rune_index,
                                                    V2_rune_type,
                                                    V2_rune_status,
                                                    V2_rune_id,
                                                    V2_rune_lev,
                                                    V2_is_resonance,
                                                    V2_resonances},
                                                   _B101}
                                          end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_id,
      V1_name,
      V1_lev,
      V1_base_id,
      V1_happy,
      V1_grade,
      V1_talent,
      V1_genre,
      V1_growth,
      V1_growth_type,
      V1_hp,
      V1_mp,
      V1_feed_point,
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
      V1_skills,
      V1_stones,
      V1_mount_skills,
      V1_handbook_attr,
      V1_handbook_num,
      V1_star_handbook_num,
      V1_use_skin,
      V1_spirit_info,
      V1_unreal,
      V1_unreal_looks_flag,
      V1_pet_rune}};
unpack(srv, 10409, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10409, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_base_id, _B5} = protocol:uint32(_B4),
    {V1_bind, _B6} = protocol:uint8(_B5),
    {V1_craft, _B7} = protocol:uint8(_B6),
    {V1_enchant, _B8} = protocol:int8(_B7),
    {V1_expire_type, _B9} = protocol:uint8(_B8),
    {V1_expire_time, _B10} = protocol:uint32(_B9),
    {V1_attr, _B17} = protocol:array(_B10,
                                     fun (_B11) ->
                                             {V2_type, _B12} =
                                                 protocol:uint16(_B11),
                                             {V2_name, _B13} =
                                                 protocol:uint32(_B12),
                                             {V2_flag, _B14} =
                                                 protocol:uint32(_B13),
                                             {V2_val, _B15} =
                                                 protocol:int32(_B14),
                                             {{V2_type,
                                               V2_name,
                                               V2_flag,
                                               V2_val},
                                              _B15}
                                     end),
    {V1_extra, _B23} = protocol:array(_B17,
                                      fun (_B18) ->
                                              {V2_name, _B19} =
                                                  protocol:uint32(_B18),
                                              {V2_value, _B20} =
                                                  protocol:uint32(_B19),
                                              {V2_str, _B21} =
                                                  protocol:string(_B20),
                                              {{V2_name, V2_value, V2_str},
                                               _B21}
                                      end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_id,
      V1_base_id,
      V1_bind,
      V1_craft,
      V1_enchant,
      V1_expire_type,
      V1_expire_time,
      V1_attr,
      V1_extra}};
unpack(srv, 10410, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10410, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
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
    {V1_eqm, _B31} = protocol:array(_B14,
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
                                            {V2_gem, _B28} =
                                                protocol:array(_B22,
                                                               fun (_B23) ->
                                                                       {V3_id,
                                                                        _B24} =
                                                                           protocol:uint8(_B23),
                                                                       {V3_base_id,
                                                                        _B25} =
                                                                           protocol:uint32(_B24),
                                                                       {V3_type,
                                                                        _B26} =
                                                                           protocol:uint8(_B25),
                                                                       {{V3_id,
                                                                         V3_base_id,
                                                                         V3_type},
                                                                        _B26}
                                                               end),
                                            {V2_timeout, _B29} =
                                                protocol:uint32(_B28),
                                            {{V2_base_id,
                                              V2_eqm_attrs,
                                              V2_gem,
                                              V2_timeout},
                                             _B29}
                                    end),
    {V1_aroused, _B42} = protocol:array(_B31,
                                        fun (_B32) ->
                                                {V2_id, _B33} =
                                                    protocol:uint32(_B32),
                                                {V2_lev, _B34} =
                                                    protocol:uint16(_B33),
                                                {V2_exp, _B35} =
                                                    protocol:uint32(_B34),
                                                {V2_attrs, _B40} =
                                                    protocol:array(_B35,
                                                                   fun (_B36) ->
                                                                           {V3_name,
                                                                            _B37} =
                                                                               protocol:uint32(_B36),
                                                                           {V3_val,
                                                                            _B38} =
                                                                               protocol:int32(_B37),
                                                                           {{V3_name,
                                                                             V3_val},
                                                                            _B38}
                                                                   end),
                                                {{V2_id,
                                                  V2_lev,
                                                  V2_exp,
                                                  V2_attrs},
                                                 _B40}
                                        end),
    {V1_attrs, _B47} = protocol:array(_B42,
                                      fun (_B43) ->
                                              {V2_name, _B44} =
                                                  protocol:uint32(_B43),
                                              {V2_val, _B45} =
                                                  protocol:int32(_B44),
                                              {{V2_name, V2_val}, _B45}
                                      end),
    {V1_skills, _B52} = protocol:array(_B47,
                                       fun (_B48) ->
                                               {V2_skill_id, _B49} =
                                                   protocol:uint32(_B48),
                                               {V2_skill_lev, _B50} =
                                                   protocol:uint8(_B49),
                                               {{V2_skill_id, V2_skill_lev},
                                                _B50}
                                       end),
    {V1_growth, _B53} = protocol:uint32(_B52),
    {V1_active, _B54} = protocol:uint8(_B53),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_base_id,
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
unpack(srv, 10411, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_voice, _B4} = protocol:byte(_B3),
    {V1_time, _B5} = protocol:uint8(_B4),
    {V1_text, _B6} = protocol:string(_B5),
    {V1_cache_id, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_voice,
      V1_time,
      V1_text,
      V1_cache_id}};
unpack(cli, 10411, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_face, _B5} = protocol:uint32(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_classes, _B8} = protocol:uint8(_B7),
    {V1_guild, _B9} = protocol:string(_B8),
    {V1_cache_id, _B10} = protocol:uint32(_B9),
    {V1_time, _B11} = protocol:uint8(_B10),
    {V1_text, _B12} = protocol:string(_B11),
    {V1_special, _B17} = protocol:array(_B12,
                                        fun (_B13) ->
                                                {V2_type, _B14} =
                                                    protocol:uint8(_B13),
                                                {V2_val, _B15} =
                                                    protocol:uint32(_B14),
                                                {{V2_type, V2_val}, _B15}
                                        end),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_face,
      V1_sex,
      V1_lev,
      V1_classes,
      V1_guild,
      V1_cache_id,
      V1_time,
      V1_text,
      V1_special}};
unpack(srv, 10412, _B0) -> {ok, {}};
unpack(cli, 10412, _B0) -> {ok, {}};
unpack(srv, 10413, _B0) -> {ok, {}};
unpack(cli, 10413, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_name, V1_msg}};
unpack(srv, 10414, _B0) -> {ok, {}};
unpack(cli, 10414, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_val, _B2} =
                                                protocol:uint32(_B1),
                                            {{V2_val}, _B2}
                                    end),
    {ok, {V1_list}};
unpack(srv, 10415, _B0) ->
    {V1_bubble, _B1} = protocol:uint16(_B0),
    {ok, {V1_bubble}};
unpack(cli, 10415, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10416, _B0) -> {ok, {}};
unpack(cli, 10416, _B0) ->
    {V1_bubble_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_bubble_id}};
unpack(srv, 10417, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10417, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_grade, _B4} = protocol:uint8(_B3),
    {V1_wing_id, _B5} = protocol:uint32(_B4),
    {V1_growth, _B6} = protocol:uint8(_B5),
    {V1_enhance, _B7} = protocol:uint8(_B6),
    {V1_tmp_grade, _B8} = protocol:uint8(_B7),
    {V1_tmp_wing_id, _B9} = protocol:uint32(_B8),
    {V1_tmp_growth, _B10} = protocol:uint8(_B9),
    {V1_star, _B11} = protocol:uint32(_B10),
    {V1_skill_data, _B16} = protocol:array(_B11,
                                           fun (_B12) ->
                                                   {V2_id, _B13} =
                                                       protocol:uint32(_B12),
                                                   {V2_lev, _B14} =
                                                       protocol:uint8(_B13),
                                                   {{V2_id, V2_lev}, _B14}
                                           end),
    {V1_tmp_skill_data, _B21} = protocol:array(_B16,
                                               fun (_B17) ->
                                                       {V2_id, _B18} =
                                                           protocol:uint32(_B17),
                                                       {V2_lev, _B19} =
                                                           protocol:uint8(_B18),
                                                       {{V2_id, V2_lev}, _B19}
                                               end),
    {V1_break_skills, _B27} = protocol:array(_B21,
                                             fun (_B22) ->
                                                     {V2_skill_grade, _B23} =
                                                         protocol:uint8(_B22),
                                                     {V2_skill_id, _B24} =
                                                         protocol:uint32(_B23),
                                                     {V2_skill_lev, _B25} =
                                                         protocol:uint8(_B24),
                                                     {{V2_skill_grade,
                                                       V2_skill_id,
                                                       V2_skill_lev},
                                                      _B25}
                                             end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_grade,
      V1_wing_id,
      V1_growth,
      V1_enhance,
      V1_tmp_grade,
      V1_tmp_wing_id,
      V1_tmp_growth,
      V1_star,
      V1_skill_data,
      V1_tmp_skill_data,
      V1_break_skills}};
unpack(srv, 10418, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10418, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_index, _B4} = protocol:uint8(_B3),
    {V1_mount_base_id, _B5} = protocol:uint32(_B4),
    {V1_transformation_id, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_skill_point, _B8} = protocol:uint32(_B7),
    {V1_fail_times, _B9} = protocol:uint32(_B8),
    {V1_upgrade_lev, _B10} = protocol:uint32(_B9),
    {V1_live_status, _B11} = protocol:uint8(_B10),
    {V1_skill_list, _B17} = protocol:array(_B11,
                                           fun (_B12) ->
                                                   {V2_skill_index, _B13} =
                                                       protocol:uint8(_B12),
                                                   {V2_skill_id, _B14} =
                                                       protocol:uint32(_B13),
                                                   {V2_skill_lev, _B15} =
                                                       protocol:uint32(_B14),
                                                   {{V2_skill_index,
                                                     V2_skill_id,
                                                     V2_skill_lev},
                                                    _B15}
                                           end),
    {V1_spirit, _B18} = protocol:uint32(_B17),
    {V1_fight_times, _B19} = protocol:uint32(_B18),
    {V1_growth, _B20} = protocol:uint32(_B19),
    {V1_growth_item_num, _B21} = protocol:uint32(_B20),
    {V1_speed_lev, _B22} = protocol:uint32(_B21),
    {V1_manger_pets, _B26} = protocol:array(_B22,
                                            fun (_B23) ->
                                                    {V2_pet_id, _B24} =
                                                        protocol:uint32(_B23),
                                                    {{V2_pet_id}, _B24}
                                            end),
    {V1_decorate_list, _B32} = protocol:array(_B26,
                                              fun (_B27) ->
                                                      {V2_decorate_index,
                                                       _B28} =
                                                          protocol:uint8(_B27),
                                                      {V2_decorate_base_id,
                                                       _B29} =
                                                          protocol:uint32(_B28),
                                                      {V2_is_hide, _B30} =
                                                          protocol:uint8(_B29),
                                                      {{V2_decorate_index,
                                                        V2_decorate_base_id,
                                                        V2_is_hide},
                                                       _B30}
                                              end),
    {V1_tmp_growth, _B33} = protocol:uint32(_B32),
    {V1_tmp_skill_list, _B38} = protocol:array(_B33,
                                               fun (_B34) ->
                                                       {V2_skill_index, _B35} =
                                                           protocol:uint8(_B34),
                                                       {V2_skill_id, _B36} =
                                                           protocol:uint32(_B35),
                                                       {{V2_skill_index,
                                                         V2_skill_id},
                                                        _B36}
                                               end),
    {V1_score, _B39} = protocol:uint32(_B38),
    {V1_appearance_list, _B44} = protocol:array(_B39,
                                                fun (_B40) ->
                                                        {V2_appearance_id,
                                                         _B41} =
                                                            protocol:uint32(_B40),
                                                        {V2_expire_time, _B42} =
                                                            protocol:uint32(_B41),
                                                        {{V2_appearance_id,
                                                          V2_expire_time},
                                                         _B42}
                                                end),
    {V1_dye_id, _B45} = protocol:uint32(_B44),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_index,
      V1_mount_base_id,
      V1_transformation_id,
      V1_lev,
      V1_skill_point,
      V1_fail_times,
      V1_upgrade_lev,
      V1_live_status,
      V1_skill_list,
      V1_spirit,
      V1_fight_times,
      V1_growth,
      V1_growth_item_num,
      V1_speed_lev,
      V1_manger_pets,
      V1_decorate_list,
      V1_tmp_growth,
      V1_tmp_skill_list,
      V1_score,
      V1_appearance_list,
      V1_dye_id}};
unpack(srv, 10419, _B0) ->
    {V1_match_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_match_id}};
unpack(cli, 10419, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10420, _B0) ->
    {V1_child_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_child_id, V1_platform, V1_zone_id}};
unpack(cli, 10420, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 10421, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_id}};
unpack(cli, 10421, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
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
    {V1_spirit_info, _B116} = protocol:array(_B110,
                                             fun (_B111) ->
                                                     {V2_spirit_base_id,
                                                      _B112} =
                                                         protocol:uint32(_B111),
                                                     {V2_spirit_talent, _B113} =
                                                         protocol:uint32(_B112),
                                                     {V2_spirit_lev, _B114} =
                                                         protocol:uint16(_B113),
                                                     {{V2_spirit_base_id,
                                                       V2_spirit_talent,
                                                       V2_spirit_lev},
                                                      _B114}
                                             end),
    {V1_child_skin, _B122} = protocol:array(_B116,
                                            fun (_B117) ->
                                                    {V2_skin_id, _B118} =
                                                        protocol:uint32(_B117),
                                                    {V2_skin_active_flag,
                                                     _B119} =
                                                        protocol:uint8(_B118),
                                                    {V2_expire_time, _B120} =
                                                        protocol:uint32(_B119),
                                                    {{V2_skin_id,
                                                      V2_skin_active_flag,
                                                      V2_expire_time},
                                                     _B120}
                                            end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_id,
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
      V1_stones,
      V1_spirit_info,
      V1_child_skin}};
unpack(srv, 10422, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10422, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10423, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 10423, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(srv, 10424, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_group_platform, _B3} = protocol:string(_B2),
    {V1_group_zone_id, _B4} = protocol:uint16(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok,
     {V1_channel,
      V1_group_id,
      V1_group_platform,
      V1_group_zone_id,
      V1_msg}};
unpack(cli, 10424, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_group_platform, _B3} = protocol:string(_B2),
    {V1_group_zone_id, _B4} = protocol:uint16(_B3),
    {V1_rid, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_classes, _B10} = protocol:uint8(_B9),
    {V1_lev, _B11} = protocol:uint8(_B10),
    {V1_msg, _B12} = protocol:string(_B11),
    {V1_guild_name, _B13} = protocol:string(_B12),
    {V1_special, _B18} = protocol:array(_B13,
                                        fun (_B14) ->
                                                {V2_type, _B15} =
                                                    protocol:uint8(_B14),
                                                {V2_val, _B16} =
                                                    protocol:uint32(_B15),
                                                {{V2_type, V2_val}, _B16}
                                        end),
    {ok,
     {V1_channel,
      V1_group_id,
      V1_group_platform,
      V1_group_zone_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_msg,
      V1_guild_name,
      V1_special}};
unpack(srv, 10425, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_group_platform, _B3} = protocol:string(_B2),
    {V1_group_zone_id, _B4} = protocol:uint16(_B3),
    {V1_voice, _B5} = protocol:byte(_B4),
    {V1_time, _B6} = protocol:uint8(_B5),
    {V1_text, _B7} = protocol:string(_B6),
    {V1_id, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_channel,
      V1_group_id,
      V1_group_platform,
      V1_group_zone_id,
      V1_voice,
      V1_time,
      V1_text,
      V1_id}};
unpack(cli, 10425, _B0) ->
    {V1_channel, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_group_platform, _B3} = protocol:string(_B2),
    {V1_group_zone_id, _B4} = protocol:uint16(_B3),
    {V1_rid, _B5} = protocol:uint32(_B4),
    {V1_platform, _B6} = protocol:string(_B5),
    {V1_zone_id, _B7} = protocol:uint16(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_classes, _B10} = protocol:uint8(_B9),
    {V1_lev, _B11} = protocol:uint8(_B10),
    {V1_special, _B16} = protocol:array(_B11,
                                        fun (_B12) ->
                                                {V2_type, _B13} =
                                                    protocol:uint8(_B12),
                                                {V2_val, _B14} =
                                                    protocol:uint32(_B13),
                                                {{V2_type, V2_val}, _B14}
                                        end),
    {V1_id, _B17} = protocol:uint32(_B16),
    {V1_time, _B18} = protocol:uint8(_B17),
    {V1_text, _B19} = protocol:string(_B18),
    {ok,
     {V1_channel,
      V1_group_id,
      V1_group_platform,
      V1_group_zone_id,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_special,
      V1_id,
      V1_time,
      V1_text}};
unpack(srv, 10426, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(cli, 10426, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10427, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_platform, V1_zone_id, V1_query_id}};
unpack(cli, 10427, _B0) ->
    {V1_platform, _B1} = protocol:string(_B0),
    {V1_zone_id, _B2} = protocol:uint16(_B1),
    {V1_query_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_base_id, _B5} = protocol:uint32(_B4),
    {V1_fc, _B6} = protocol:uint32(_B5),
    {V1_attr, _B13} = protocol:array(_B6,
                                     fun (_B7) ->
                                             {V2_type, _B8} =
                                                 protocol:uint16(_B7),
                                             {V2_name, _B9} =
                                                 protocol:uint32(_B8),
                                             {V2_flag, _B10} =
                                                 protocol:uint32(_B9),
                                             {V2_val, _B11} =
                                                 protocol:int32(_B10),
                                             {{V2_type,
                                               V2_name,
                                               V2_flag,
                                               V2_val},
                                              _B11}
                                     end),
    {ok,
     {V1_platform,
      V1_zone_id,
      V1_query_id,
      V1_id,
      V1_base_id,
      V1_fc,
      V1_attr}};
unpack(srv, 10428, _B0) -> {ok, {}};
unpack(cli, 10428, _B0) ->
    {V1_m_list, _B4} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_val, _B2} =
                                                  protocol:uint32(_B1),
                                              {{V2_val}, _B2}
                                      end),
    {V1_b_list, _B8} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_val, _B6} =
                                                  protocol:uint32(_B5),
                                              {{V2_val}, _B6}
                                      end),
    {ok, {V1_m_list, V1_b_list}};
unpack(srv, 10429, _B0) -> {ok, {}};
unpack(cli, 10429, _B0) ->
    {V1_val, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {V1_own, _B4} = protocol:uint8(_B3),
    {ok, {V1_val, V1_type, V1_num, V1_own}};
unpack(srv, 10430, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10430, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10431, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 10431, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10432, _B0) -> {ok, {}};
unpack(cli, 10432, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_channel, _B2} = protocol:uint8(_B1),
    {V1_code, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_channel, V1_code}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

