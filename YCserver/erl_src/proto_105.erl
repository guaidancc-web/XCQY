-file("src/proto/proto_105.erl", 1).

-module(proto_105).

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

-file("src/proto/proto_105.erl", 14).

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

-file("src/proto/proto_105.erl", 15).

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

-file("src/proto/proto_105.erl", 16).

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

-file("src/proto/proto_105.erl", 17).

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

-file("src/proto/proto_105.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10500, {}) ->
    {ok, <<2:32/little, 10500:16/little>>};
pack(srv, 10500,
     {V0_pet_nums, V0_fresh_id, V0_time, V0_pet_list}) ->
    D_a_t_a = <<V0_pet_nums:8/little, V0_fresh_id:8/little,
                V0_time:32/little, (length(V0_pet_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_exp:32/little,
                                   V1_max_exp:32/little, V1_status:8/little,
                                   V1_base_id:32/little, V1_happy:32/little,
                                   V1_grade:8/little, V1_talent:16/little,
                                   V1_genre:8/little, V1_growth:16/little,
                                   V1_growth_type:8/little, V1_hp:32/little,
                                   V1_mp:32/little, V1_feed_point:32/little,
                                   V1_free_reset_flag:32/little,
                                   V1_use_growth:8/little, V1_lock:8/little,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little, V1_point:16/little,
                                   V1_p_str:16/little, V1_p_con:16/little,
                                   V1_p_mag:16/little, V1_p_agi:16/little,
                                   V1_p_end:16/little, V1_hp_aptitude:16/little,
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
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #pet_skill{id = V2_id,
                                                                  source =
                                                                      V2_source,
                                                                  is_lock =
                                                                      V2_is_lock}
                                                           <- V1_skills]))/binary,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
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
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             attr = V2_attr,
                                                             reset_attr =
                                                                 V2_reset_attr,
                                                             extra = V2_extra}
                                                           <- V1_stones]))/binary,
                                   (length(V1_grade_attr)):16/little,
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
                                                           <- V1_grade_attr]))/binary,
                                   V1_break_times:8/little,
                                   (length(V1_handbook_attr)):16/little,
                                   (list_to_binary([<<V2_attr_name:32/little,
                                                      V2_attr_val:32/little>>
                                                    || {V2_attr_name,
                                                        V2_attr_val}
                                                           <- V1_handbook_attr]))/binary,
                                   V1_handbook_num:8/little,
                                   V1_star_handbook_num:8/little,
                                   V1_use_skin:32/little,
                                   (length(V1_has_skin)):16/little,
                                   (list_to_binary([<<V2_skin_id:32/little>>
                                                    || V2_skin_id
                                                           <- V1_has_skin]))/binary,
                                   V1_spirit_attached:8/little,
                                   V1_spirit_attached_id:32/little,
                                   (length(V1_unreal)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_timeout:32/little>>
                                                    || #pet_unreal{item_id =
                                                                       V2_item_id,
                                                                   timeout =
                                                                       V2_timeout}
                                                           <- V1_unreal]))/binary,
                                   V1_spirit_child_flag:8/little,
                                   V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_unreal_looks_flag:8/little,
                                   (length(V1_pet_rune)):16/little,
                                   (list_to_binary([<<V2_rune_index:8/little,
                                                      V2_rune_type:8/little,
                                                      V2_rune_status:8/little,
                                                      V2_rune_id:32/little,
                                                      V2_rune_lev:8/little,
                                                      V2_is_resonance:8/little,
                                                      (length(V2_resonances)):16/little,
                                                      (list_to_binary([<<V3_resonance_index:8/little,
                                                                         V3_resonance_id:32/little,
                                                                         V3_rune_index:8/little>>
                                                                       || #pet_resonance{resonance_index
                                                                                             =
                                                                                             V3_resonance_index,
                                                                                         resonance_id
                                                                                             =
                                                                                             V3_resonance_id,
                                                                                         rune_index
                                                                                             =
                                                                                             V3_rune_index}
                                                                              <- V2_resonances]))/binary>>
                                                    || #pet_rune{rune_index =
                                                                     V2_rune_index,
                                                                 rune_type =
                                                                     V2_rune_type,
                                                                 rune_status =
                                                                     V2_rune_status,
                                                                 rune_id =
                                                                     V2_rune_id,
                                                                 rune_lev =
                                                                     V2_rune_lev,
                                                                 is_resonance =
                                                                     V2_is_resonance,
                                                                 resonances =
                                                                     V2_resonances}
                                                           <- V1_pet_rune]))/binary>>
                                 || #pet{id = V1_id, name = V1_name,
                                         lev = V1_lev, exp = V1_exp,
                                         max_exp = V1_max_exp,
                                         status = V1_status,
                                         base_id = V1_base_id, happy = V1_happy,
                                         grade = V1_grade, talent = V1_talent,
                                         genre = V1_genre, growth = V1_growth,
                                         growth_type = V1_growth_type,
                                         hp = V1_hp, mp = V1_mp,
                                         feed_point = V1_feed_point,
                                         free_reset_flag = V1_free_reset_flag,
                                         use_growth = V1_use_growth,
                                         lock = V1_lock,
                                         attr =
                                             #attr{hp_max = V1_hp_max,
                                                   mp_max = V1_mp_max,
                                                   atk_speed = V1_atk_speed,
                                                   phy_dmg = V1_phy_dmg,
                                                   magic_dmg = V1_magic_dmg,
                                                   phy_def = V1_phy_def,
                                                   magic_def = V1_magic_def,
                                                   strength = V1_strength,
                                                   constitution =
                                                       V1_constitution,
                                                   magic = V1_magic,
                                                   agility = V1_agility,
                                                   endurance = V1_endurance},
                                         pet_attr =
                                             #pet_attr{point = V1_point,
                                                       p_str = V1_p_str,
                                                       p_con = V1_p_con,
                                                       p_mag = V1_p_mag,
                                                       p_agi = V1_p_agi,
                                                       p_end = V1_p_end,
                                                       hp_aptitude =
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
                                         skills = V1_skills, stones = V1_stones,
                                         grade_attr = V1_grade_attr,
                                         break_times = V1_break_times,
                                         handbook_attr = V1_handbook_attr,
                                         handbook_num = V1_handbook_num,
                                         star_handbook_num =
                                             V1_star_handbook_num,
                                         pet_skin =
                                             #pet_skin{use_skin = V1_use_skin,
                                                       has_skin = V1_has_skin},
                                         spirit_attached = V1_spirit_attached,
                                         spirit_attached_id =
                                             V1_spirit_attached_id,
                                         unreal = V1_unreal,
                                         spirit_child_flag =
                                             V1_spirit_child_flag,
                                         spirit_child_id =
                                             {V1_child_id,
                                              V1_platform,
                                              V1_zone_id},
                                         unreal_looks_flag =
                                             V1_unreal_looks_flag,
                                         pet_rune = V1_pet_rune}
                                        <- V0_pet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10500:16/little,
       D_a_t_a/binary>>};
pack(cli, 10501, {V0_id, V0_mode}) ->
    D_a_t_a = <<V0_id:32/little, V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10501:16/little,
       D_a_t_a/binary>>};
pack(srv, 10501, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10501:16/little,
       D_a_t_a/binary>>};
pack(cli, 10502, {}) ->
    {ok, <<2:32/little, 10502:16/little>>};
pack(srv, 10502,
     {V0_id,
      V0_name,
      V0_exp,
      V0_max_exp,
      V0_lev,
      V0_happy,
      V0_status}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_exp:32/little, V0_max_exp:32/little, V0_lev:8/little,
                V0_happy:32/little, V0_status:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10502:16/little,
       D_a_t_a/binary>>};
pack(cli, 10503, {}) ->
    {ok, <<2:32/little, 10503:16/little>>};
pack(srv, 10503,
     {V0_id,
      V0_talent,
      V0_genre,
      V0_growth,
      V0_growth_type,
      V0_hp,
      V0_mp,
      V0_feed_point,
      V0_free_reset_flag,
      V0_use_growth,
      #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
            atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
            magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
            magic_def = V0_magic_def, strength = V0_strength,
            constitution = V0_constitution, magic = V0_magic,
            agility = V0_agility, endurance = V0_endurance},
      #pet_attr{point = V0_point, p_str = V0_p_str,
                p_con = V0_p_con, p_mag = V0_p_mag, p_agi = V0_p_agi,
                p_end = V0_p_end, hp_aptitude = V0_hp_aptitude,
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
                max_aspd_apt_used = V0_max_aspd_apt_used},
      V0_grade_attr,
      V0_break_times,
      V0_handbook_attr,
      V0_handbook_num,
      V0_star_handbook_num,
      V0_spirit_attached,
      V0_spirit_attached_id,
      V0_unreal,
      V0_spirit_child_flag,
      {V0_child_id, V0_platform, V0_zone_id},
      V0_unreal_looks_flag}) ->
    D_a_t_a = <<V0_id:32/little, V0_talent:16/little,
                V0_genre:8/little, V0_growth:16/little,
                V0_growth_type:8/little, V0_hp:32/little,
                V0_mp:32/little, V0_feed_point:32/little,
                V0_free_reset_flag:32/little, V0_use_growth:8/little,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little,
                V0_point:16/little, V0_p_str:16/little,
                V0_p_con:16/little, V0_p_mag:16/little,
                V0_p_agi:16/little, V0_p_end:16/little,
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
                V0_max_aspd_apt_used:8/little,
                (length(V0_grade_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_grade_attr]))/binary,
                V0_break_times:8/little,
                (length(V0_handbook_attr)):16/little,
                (list_to_binary([<<V1_attr_name:32/little,
                                   V1_attr_val:32/little>>
                                 || {V1_attr_name, V1_attr_val}
                                        <- V0_handbook_attr]))/binary,
                V0_handbook_num:8/little, V0_star_handbook_num:8/little,
                V0_spirit_attached:8/little,
                V0_spirit_attached_id:32/little,
                (length(V0_unreal)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_timeout:32/little>>
                                 || #pet_unreal{item_id = V1_item_id,
                                                timeout = V1_timeout}
                                        <- V0_unreal]))/binary,
                V0_spirit_child_flag:8/little, V0_child_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_unreal_looks_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10503:16/little,
       D_a_t_a/binary>>};
pack(cli, 10504, {}) ->
    {ok, <<2:32/little, 10504:16/little>>};
pack(srv, 10504, {V0_pet_list}) ->
    D_a_t_a = <<(length(V0_pet_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_exp:32/little,
                                   V1_max_exp:32/little, V1_status:8/little,
                                   V1_base_id:32/little, V1_happy:32/little,
                                   V1_grade:8/little, V1_talent:16/little,
                                   V1_genre:8/little, V1_growth:16/little,
                                   V1_growth_type:8/little, V1_hp:32/little,
                                   V1_mp:32/little, V1_feed_point:32/little,
                                   V1_free_reset_flag:32/little,
                                   V1_lock:8/little, V1_hp_max:32/little,
                                   V1_mp_max:32/little, V1_atk_speed:16/little,
                                   V1_phy_dmg:32/little, V1_magic_dmg:32/little,
                                   V1_phy_def:32/little, V1_magic_def:32/little,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little, V1_point:16/little,
                                   V1_p_str:16/little, V1_p_con:16/little,
                                   V1_p_mag:16/little, V1_p_agi:16/little,
                                   V1_p_end:16/little, V1_hp_aptitude:16/little,
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
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #pet_skill{id = V2_id,
                                                                  source =
                                                                      V2_source,
                                                                  is_lock =
                                                                      V2_is_lock}
                                                           <- V1_skills]))/binary,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
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
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             attr = V2_attr,
                                                             reset_attr =
                                                                 V2_reset_attr,
                                                             extra = V2_extra}
                                                           <- V1_stones]))/binary,
                                   (length(V1_grade_attr)):16/little,
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
                                                           <- V1_grade_attr]))/binary,
                                   V1_break_times:8/little,
                                   (length(V1_handbook_attr)):16/little,
                                   (list_to_binary([<<V2_attr_name:32/little,
                                                      V2_attr_val:32/little>>
                                                    || {V2_attr_name,
                                                        V2_attr_val}
                                                           <- V1_handbook_attr]))/binary,
                                   V1_handbook_num:8/little,
                                   V1_star_handbook_num:8/little,
                                   V1_use_skin:32/little,
                                   (length(V1_has_skin)):16/little,
                                   (list_to_binary([<<V2_skin_id:32/little>>
                                                    || V2_skin_id
                                                           <- V1_has_skin]))/binary,
                                   V1_spirit_attached:8/little,
                                   V1_spirit_attached_id:32/little,
                                   (length(V1_unreal)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_timeout:32/little>>
                                                    || #pet_unreal{item_id =
                                                                       V2_item_id,
                                                                   timeout =
                                                                       V2_timeout}
                                                           <- V1_unreal]))/binary,
                                   V1_spirit_child_flag:8/little,
                                   V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_unreal_looks_flag:8/little,
                                   (length(V1_pet_rune)):16/little,
                                   (list_to_binary([<<V2_rune_index:8/little,
                                                      V2_rune_type:8/little,
                                                      V2_rune_status:8/little,
                                                      V2_rune_id:32/little,
                                                      V2_rune_lev:8/little,
                                                      V2_is_resonance:8/little,
                                                      (length(V2_resonances)):16/little,
                                                      (list_to_binary([<<V3_resonance_index:8/little,
                                                                         V3_resonance_id:32/little,
                                                                         V3_rune_index:8/little>>
                                                                       || #pet_resonance{resonance_index
                                                                                             =
                                                                                             V3_resonance_index,
                                                                                         resonance_id
                                                                                             =
                                                                                             V3_resonance_id,
                                                                                         rune_index
                                                                                             =
                                                                                             V3_rune_index}
                                                                              <- V2_resonances]))/binary>>
                                                    || #pet_rune{rune_index =
                                                                     V2_rune_index,
                                                                 rune_type =
                                                                     V2_rune_type,
                                                                 rune_status =
                                                                     V2_rune_status,
                                                                 rune_id =
                                                                     V2_rune_id,
                                                                 rune_lev =
                                                                     V2_rune_lev,
                                                                 is_resonance =
                                                                     V2_is_resonance,
                                                                 resonances =
                                                                     V2_resonances}
                                                           <- V1_pet_rune]))/binary>>
                                 || #pet{id = V1_id, name = V1_name,
                                         lev = V1_lev, exp = V1_exp,
                                         max_exp = V1_max_exp,
                                         status = V1_status,
                                         base_id = V1_base_id, happy = V1_happy,
                                         grade = V1_grade, talent = V1_talent,
                                         genre = V1_genre, growth = V1_growth,
                                         growth_type = V1_growth_type,
                                         hp = V1_hp, mp = V1_mp,
                                         feed_point = V1_feed_point,
                                         free_reset_flag = V1_free_reset_flag,
                                         lock = V1_lock,
                                         attr =
                                             #attr{hp_max = V1_hp_max,
                                                   mp_max = V1_mp_max,
                                                   atk_speed = V1_atk_speed,
                                                   phy_dmg = V1_phy_dmg,
                                                   magic_dmg = V1_magic_dmg,
                                                   phy_def = V1_phy_def,
                                                   magic_def = V1_magic_def,
                                                   strength = V1_strength,
                                                   constitution =
                                                       V1_constitution,
                                                   magic = V1_magic,
                                                   agility = V1_agility,
                                                   endurance = V1_endurance},
                                         pet_attr =
                                             #pet_attr{point = V1_point,
                                                       p_str = V1_p_str,
                                                       p_con = V1_p_con,
                                                       p_mag = V1_p_mag,
                                                       p_agi = V1_p_agi,
                                                       p_end = V1_p_end,
                                                       hp_aptitude =
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
                                         skills = V1_skills, stones = V1_stones,
                                         grade_attr = V1_grade_attr,
                                         break_times = V1_break_times,
                                         handbook_attr = V1_handbook_attr,
                                         handbook_num = V1_handbook_num,
                                         star_handbook_num =
                                             V1_star_handbook_num,
                                         pet_skin =
                                             #pet_skin{use_skin = V1_use_skin,
                                                       has_skin = V1_has_skin},
                                         spirit_attached = V1_spirit_attached,
                                         spirit_attached_id =
                                             V1_spirit_attached_id,
                                         unreal = V1_unreal,
                                         spirit_child_flag =
                                             V1_spirit_child_flag,
                                         spirit_child_id =
                                             {V1_child_id,
                                              V1_platform,
                                              V1_zone_id},
                                         unreal_looks_flag =
                                             V1_unreal_looks_flag,
                                         pet_rune = V1_pet_rune}
                                        <- V0_pet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10504:16/little,
       D_a_t_a/binary>>};
pack(cli, 10505, {V0_id, V0_item_flag}) ->
    D_a_t_a = <<V0_id:32/little, V0_item_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10505:16/little,
       D_a_t_a/binary>>};
pack(srv, 10505,
     {V0_flag, V0_msg, V0_id, V0_genre, V0_wash_time}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_genre:8/little, V0_wash_time:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10505:16/little,
       D_a_t_a/binary>>};
pack(cli, 10507, {V0_id, V0_item_id, V0_hole_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_item_id:32/little,
                V0_hole_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10507:16/little,
       D_a_t_a/binary>>};
pack(srv, 10507, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10507:16/little,
       D_a_t_a/binary>>};
pack(cli, 10508, {V0_id, V0_item_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10508:16/little,
       D_a_t_a/binary>>};
pack(srv, 10508, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10508:16/little,
       D_a_t_a/binary>>};
pack(cli, 10509, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10509:16/little,
       D_a_t_a/binary>>};
pack(srv, 10509, {V0_flag, V0_msg, V0_id, V0_grade}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                V0_grade:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10509:16/little,
       D_a_t_a/binary>>};
pack(cli, 10510, {V0_id, V0_aptitude}) ->
    D_a_t_a = <<V0_id:32/little, V0_aptitude:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10510:16/little,
       D_a_t_a/binary>>};
pack(srv, 10510, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10510:16/little,
       D_a_t_a/binary>>};
pack(cli, 10511, {}) ->
    {ok, <<2:32/little, 10511:16/little>>};
pack(srv, 10511, {V0_id, V0_skills}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_source:8/little,
                                   V1_is_lock:8/little>>
                                 || #pet_skill{id = V1_id, source = V1_source,
                                               is_lock = V1_is_lock}
                                        <- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10511:16/little,
       D_a_t_a/binary>>};
pack(cli, 10512, {}) ->
    {ok, <<2:32/little, 10512:16/little>>};
pack(srv, 10512, {V0_id, V0_grade, V0_stones}) ->
    D_a_t_a = <<V0_id:32/little, V0_grade:8/little,
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
                                        <- V0_stones]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10512:16/little,
       D_a_t_a/binary>>};
pack(cli, 10513,
     {V0_id,
      V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_id:32/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10513:16/little,
       D_a_t_a/binary>>};
pack(srv, 10513, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10513:16/little,
       D_a_t_a/binary>>};
pack(cli, 10515, {V0_id}) ->
    D_a_t_a = <<V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10515:16/little,
       D_a_t_a/binary>>};
pack(srv, 10515, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10515:16/little,
       D_a_t_a/binary>>};
pack(cli, 10516, {V0_lev}) ->
    D_a_t_a = <<V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10516:16/little,
       D_a_t_a/binary>>};
pack(srv, 10516, {V0_rest, V0_pets, V0_own_pets}) ->
    D_a_t_a = <<V0_rest:8/little,
                (length(V0_pets)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_stock:8/little>>
                                 || #pet_goods{base_id = V1_base_id,
                                               stock = V1_stock}
                                        <- V0_pets]))/binary,
                (length(V0_own_pets)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_stock:8/little>>
                                 || #pet_goods{base_id = V1_base_id,
                                               stock = V1_stock}
                                        <- V0_own_pets]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10516:16/little,
       D_a_t_a/binary>>};
pack(cli, 10517, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10517:16/little,
       D_a_t_a/binary>>};
pack(srv, 10517, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10517:16/little,
       D_a_t_a/binary>>};
pack(cli, 10518, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10518:16/little,
       D_a_t_a/binary>>};
pack(srv, 10518, {V0_flag, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10518:16/little,
       D_a_t_a/binary>>};
pack(cli, 10519, {V0_id, V0_name}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10519:16/little,
       D_a_t_a/binary>>};
pack(srv, 10519, {V0_flag, V0_msg, V0_id, V0_name}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary, V0_id:32/little,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10519:16/little,
       D_a_t_a/binary>>};
pack(cli, 10520,
     {V0_id,
      V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_id:32/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10520:16/little,
       D_a_t_a/binary>>};
pack(srv, 10520,
     {V0_id,
      V0_result,
      V0_msg,
      #pet_attr{pre_str = V0_pre_str, pre_con = V0_pre_con,
                pre_mag = V0_pre_mag, pre_agi = V0_pre_agi,
                pre_end = V0_pre_end}}) ->
    D_a_t_a = <<V0_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pre_str:16/little, V0_pre_con:16/little,
                V0_pre_mag:16/little, V0_pre_agi:16/little,
                V0_pre_end:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10520:16/little,
       D_a_t_a/binary>>};
pack(cli, 10521, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10521:16/little,
       D_a_t_a/binary>>};
pack(srv, 10521,
     {V0_id,
      #pet_attr{pre_str = V0_pre_str, pre_con = V0_pre_con,
                pre_mag = V0_pre_mag, pre_agi = V0_pre_agi,
                pre_end = V0_pre_end}}) ->
    D_a_t_a = <<V0_id:32/little, V0_pre_str:16/little,
                V0_pre_con:16/little, V0_pre_mag:16/little,
                V0_pre_agi:16/little, V0_pre_end:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10521:16/little,
       D_a_t_a/binary>>};
pack(cli, 10522, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10522:16/little,
       D_a_t_a/binary>>};
pack(srv, 10522, {V0_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10522:16/little,
       D_a_t_a/binary>>};
pack(cli, 10523, {}) ->
    {ok, <<2:32/little, 10523:16/little>>};
pack(srv, 10523, {V0_pet_nums, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_pet_nums:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10523:16/little,
       D_a_t_a/binary>>};
pack(cli, 10524, {V0_genre}) ->
    D_a_t_a = <<V0_genre:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10524:16/little,
       D_a_t_a/binary>>};
pack(srv, 10524, {V0_base_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10524:16/little,
       D_a_t_a/binary>>};
pack(cli, 10525, {}) ->
    {ok, <<2:32/little, 10525:16/little>>};
pack(srv, 10525,
     {V0_id, V0_hp, V0_mp, V0_hp_max, V0_mp_max}) ->
    D_a_t_a = <<V0_id:32/little, V0_hp:32/little,
                V0_mp:32/little, V0_hp_max:32/little,
                V0_mp_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10525:16/little,
       D_a_t_a/binary>>};
pack(cli, 10526, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10526:16/little,
       D_a_t_a/binary>>};
pack(srv, 10526, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10526:16/little,
       D_a_t_a/binary>>};
pack(cli, 10527, {}) ->
    {ok, <<2:32/little, 10527:16/little>>};
pack(srv, 10527,
     {V0_result, V0_msg, V0_fresh_id, V0_time}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_fresh_id:8/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10527:16/little,
       D_a_t_a/binary>>};
pack(cli, 10528, {}) ->
    {ok, <<2:32/little, 10528:16/little>>};
pack(srv, 10528, {V0_pet_nums, V0_pet_list}) ->
    D_a_t_a = <<V0_pet_nums:8/little,
                (length(V0_pet_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_exp:32/little,
                                   V1_max_exp:32/little, V1_base_id:32/little,
                                   V1_happy:32/little, V1_grade:8/little,
                                   V1_talent:16/little, V1_genre:8/little,
                                   V1_growth:16/little, V1_growth_type:8/little,
                                   V1_hp:32/little, V1_mp:32/little,
                                   V1_feed_point:32/little,
                                   V1_free_reset_flag:32/little,
                                   V1_use_growth:8/little, V1_hp_max:32/little,
                                   V1_mp_max:32/little, V1_atk_speed:16/little,
                                   V1_phy_dmg:32/little, V1_magic_dmg:32/little,
                                   V1_phy_def:32/little, V1_magic_def:32/little,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little, V1_point:16/little,
                                   V1_p_str:16/little, V1_p_con:16/little,
                                   V1_p_mag:16/little, V1_p_agi:16/little,
                                   V1_p_end:16/little, V1_hp_aptitude:16/little,
                                   V1_phy_aptitude:16/little,
                                   V1_pdef_aptitude:16/little,
                                   V1_magic_aptitude:16/little,
                                   V1_aspd_aptitude:16/little,
                                   V1_max_hp_aptitude:16/little,
                                   V1_max_phy_aptitude:16/little,
                                   V1_max_pdef_aptitude:16/little,
                                   V1_max_magic_aptitude:16/little,
                                   V1_max_aspd_aptitude:16/little,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #pet_skill{id = V2_id,
                                                                  source =
                                                                      V2_source,
                                                                  is_lock =
                                                                      V2_is_lock}
                                                           <- V1_skills]))/binary,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
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
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             attr = V2_attr,
                                                             reset_attr =
                                                                 V2_reset_attr,
                                                             extra = V2_extra}
                                                           <- V1_stones]))/binary,
                                   (length(V1_grade_attr)):16/little,
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
                                                           <- V1_grade_attr]))/binary,
                                   V1_use_skin:32/little,
                                   (length(V1_has_skin)):16/little,
                                   (list_to_binary([<<V2_skin_id:32/little>>
                                                    || V2_skin_id
                                                           <- V1_has_skin]))/binary,
                                   V1_spirit_attached:8/little,
                                   V1_spirit_attached_id:32/little,
                                   (length(V1_unreal)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_timeout:32/little>>
                                                    || #pet_unreal{item_id =
                                                                       V2_item_id,
                                                                   timeout =
                                                                       V2_timeout}
                                                           <- V1_unreal]))/binary,
                                   V1_spirit_child_flag:8/little,
                                   V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_unreal_looks_flag:8/little,
                                   (length(V1_pet_rune)):16/little,
                                   (list_to_binary([<<V2_rune_index:8/little,
                                                      V2_rune_type:8/little,
                                                      V2_rune_status:8/little,
                                                      V2_rune_id:32/little,
                                                      V2_rune_lev:8/little,
                                                      V2_is_resonance:8/little,
                                                      (length(V2_resonances)):16/little,
                                                      (list_to_binary([<<V3_resonance_index:8/little,
                                                                         V3_resonance_id:32/little,
                                                                         V3_rune_index:8/little>>
                                                                       || #pet_resonance{resonance_index
                                                                                             =
                                                                                             V3_resonance_index,
                                                                                         resonance_id
                                                                                             =
                                                                                             V3_resonance_id,
                                                                                         rune_index
                                                                                             =
                                                                                             V3_rune_index}
                                                                              <- V2_resonances]))/binary>>
                                                    || #pet_rune{rune_index =
                                                                     V2_rune_index,
                                                                 rune_type =
                                                                     V2_rune_type,
                                                                 rune_status =
                                                                     V2_rune_status,
                                                                 rune_id =
                                                                     V2_rune_id,
                                                                 rune_lev =
                                                                     V2_rune_lev,
                                                                 is_resonance =
                                                                     V2_is_resonance,
                                                                 resonances =
                                                                     V2_resonances}
                                                           <- V1_pet_rune]))/binary>>
                                 || #pet{id = V1_id, name = V1_name,
                                         lev = V1_lev, exp = V1_exp,
                                         max_exp = V1_max_exp,
                                         base_id = V1_base_id, happy = V1_happy,
                                         grade = V1_grade, talent = V1_talent,
                                         genre = V1_genre, growth = V1_growth,
                                         growth_type = V1_growth_type,
                                         hp = V1_hp, mp = V1_mp,
                                         feed_point = V1_feed_point,
                                         free_reset_flag = V1_free_reset_flag,
                                         use_growth = V1_use_growth,
                                         attr =
                                             #attr{hp_max = V1_hp_max,
                                                   mp_max = V1_mp_max,
                                                   atk_speed = V1_atk_speed,
                                                   phy_dmg = V1_phy_dmg,
                                                   magic_dmg = V1_magic_dmg,
                                                   phy_def = V1_phy_def,
                                                   magic_def = V1_magic_def,
                                                   strength = V1_strength,
                                                   constitution =
                                                       V1_constitution,
                                                   magic = V1_magic,
                                                   agility = V1_agility,
                                                   endurance = V1_endurance},
                                         pet_attr =
                                             #pet_attr{point = V1_point,
                                                       p_str = V1_p_str,
                                                       p_con = V1_p_con,
                                                       p_mag = V1_p_mag,
                                                       p_agi = V1_p_agi,
                                                       p_end = V1_p_end,
                                                       hp_aptitude =
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
                                                           V1_max_aspd_aptitude},
                                         skills = V1_skills, stones = V1_stones,
                                         grade_attr = V1_grade_attr,
                                         pet_skin =
                                             #pet_skin{use_skin = V1_use_skin,
                                                       has_skin = V1_has_skin},
                                         spirit_attached = V1_spirit_attached,
                                         spirit_attached_id =
                                             V1_spirit_attached_id,
                                         unreal = V1_unreal,
                                         spirit_child_flag =
                                             V1_spirit_child_flag,
                                         spirit_child_id =
                                             {V1_child_id,
                                              V1_platform,
                                              V1_zone_id},
                                         unreal_looks_flag =
                                             V1_unreal_looks_flag,
                                         pet_rune = V1_pet_rune}
                                        <- V0_pet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10528:16/little,
       D_a_t_a/binary>>};
pack(cli, 10529, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10529:16/little,
       D_a_t_a/binary>>};
pack(srv, 10529, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10529:16/little,
       D_a_t_a/binary>>};
pack(cli, 10530, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10530:16/little,
       D_a_t_a/binary>>};
pack(srv, 10530, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10530:16/little,
       D_a_t_a/binary>>};
pack(cli, 10531, {}) ->
    {ok, <<2:32/little, 10531:16/little>>};
pack(srv, 10531, {V0_pet_list}) ->
    D_a_t_a = <<(length(V0_pet_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_exp:32/little,
                                   V1_max_exp:32/little, V1_status:8/little,
                                   V1_base_id:32/little, V1_happy:32/little,
                                   V1_grade:8/little, V1_talent:16/little,
                                   V1_genre:8/little, V1_growth:16/little,
                                   V1_growth_type:8/little, V1_hp:32/little,
                                   V1_mp:32/little, V1_feed_point:32/little,
                                   V1_free_reset_flag:32/little,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little, V1_point:16/little,
                                   V1_p_str:16/little, V1_p_con:16/little,
                                   V1_p_mag:16/little, V1_p_agi:16/little,
                                   V1_p_end:16/little, V1_hp_aptitude:16/little,
                                   V1_phy_aptitude:16/little,
                                   V1_pdef_aptitude:16/little,
                                   V1_magic_aptitude:16/little,
                                   V1_aspd_aptitude:16/little,
                                   V1_max_hp_aptitude:16/little,
                                   V1_max_phy_aptitude:16/little,
                                   V1_max_pdef_aptitude:16/little,
                                   V1_max_magic_aptitude:16/little,
                                   V1_max_aspd_aptitude:16/little,
                                   (length(V1_skills)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
                                                      V2_source:8/little,
                                                      V2_is_lock:8/little>>
                                                    || #pet_skill{id = V2_id,
                                                                  source =
                                                                      V2_source,
                                                                  is_lock =
                                                                      V2_is_lock}
                                                           <- V1_skills]))/binary,
                                   (length(V1_stones)):16/little,
                                   (list_to_binary([<<V2_id:32/little,
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
                                                    || #item{id = V2_id,
                                                             base_id =
                                                                 V2_base_id,
                                                             attr = V2_attr,
                                                             reset_attr =
                                                                 V2_reset_attr,
                                                             extra = V2_extra}
                                                           <- V1_stones]))/binary,
                                   (length(V1_grade_attr)):16/little,
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
                                                           <- V1_grade_attr]))/binary,
                                   V1_use_skin:32/little,
                                   (length(V1_has_skin)):16/little,
                                   (list_to_binary([<<V2_skin_id:32/little>>
                                                    || V2_skin_id
                                                           <- V1_has_skin]))/binary,
                                   V1_spirit_attached:8/little,
                                   V1_spirit_attached_id:32/little,
                                   (length(V1_unreal)):16/little,
                                   (list_to_binary([<<V2_item_id:32/little,
                                                      V2_timeout:32/little>>
                                                    || #pet_unreal{item_id =
                                                                       V2_item_id,
                                                                   timeout =
                                                                       V2_timeout}
                                                           <- V1_unreal]))/binary,
                                   V1_spirit_child_flag:8/little,
                                   V1_child_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   V1_unreal_looks_flag:8/little,
                                   (length(V1_pet_rune)):16/little,
                                   (list_to_binary([<<V2_rune_index:8/little,
                                                      V2_rune_type:8/little,
                                                      V2_rune_status:8/little,
                                                      V2_rune_id:32/little,
                                                      V2_rune_lev:8/little,
                                                      V2_is_resonance:8/little,
                                                      (length(V2_resonances)):16/little,
                                                      (list_to_binary([<<V3_resonance_index:8/little,
                                                                         V3_resonance_id:32/little,
                                                                         V3_rune_index:8/little>>
                                                                       || #pet_resonance{resonance_index
                                                                                             =
                                                                                             V3_resonance_index,
                                                                                         resonance_id
                                                                                             =
                                                                                             V3_resonance_id,
                                                                                         rune_index
                                                                                             =
                                                                                             V3_rune_index}
                                                                              <- V2_resonances]))/binary>>
                                                    || #pet_rune{rune_index =
                                                                     V2_rune_index,
                                                                 rune_type =
                                                                     V2_rune_type,
                                                                 rune_status =
                                                                     V2_rune_status,
                                                                 rune_id =
                                                                     V2_rune_id,
                                                                 rune_lev =
                                                                     V2_rune_lev,
                                                                 is_resonance =
                                                                     V2_is_resonance,
                                                                 resonances =
                                                                     V2_resonances}
                                                           <- V1_pet_rune]))/binary>>
                                 || #pet{id = V1_id, name = V1_name,
                                         lev = V1_lev, exp = V1_exp,
                                         max_exp = V1_max_exp,
                                         status = V1_status,
                                         base_id = V1_base_id, happy = V1_happy,
                                         grade = V1_grade, talent = V1_talent,
                                         genre = V1_genre, growth = V1_growth,
                                         growth_type = V1_growth_type,
                                         hp = V1_hp, mp = V1_mp,
                                         feed_point = V1_feed_point,
                                         free_reset_flag = V1_free_reset_flag,
                                         attr =
                                             #attr{hp_max = V1_hp_max,
                                                   mp_max = V1_mp_max,
                                                   atk_speed = V1_atk_speed,
                                                   phy_dmg = V1_phy_dmg,
                                                   magic_dmg = V1_magic_dmg,
                                                   phy_def = V1_phy_def,
                                                   magic_def = V1_magic_def,
                                                   strength = V1_strength,
                                                   constitution =
                                                       V1_constitution,
                                                   magic = V1_magic,
                                                   agility = V1_agility,
                                                   endurance = V1_endurance},
                                         pet_attr =
                                             #pet_attr{point = V1_point,
                                                       p_str = V1_p_str,
                                                       p_con = V1_p_con,
                                                       p_mag = V1_p_mag,
                                                       p_agi = V1_p_agi,
                                                       p_end = V1_p_end,
                                                       hp_aptitude =
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
                                                           V1_max_aspd_aptitude},
                                         skills = V1_skills, stones = V1_stones,
                                         grade_attr = V1_grade_attr,
                                         pet_skin =
                                             #pet_skin{use_skin = V1_use_skin,
                                                       has_skin = V1_has_skin},
                                         spirit_attached = V1_spirit_attached,
                                         spirit_attached_id =
                                             V1_spirit_attached_id,
                                         unreal = V1_unreal,
                                         spirit_child_flag =
                                             V1_spirit_child_flag,
                                         spirit_child_id =
                                             {V1_child_id,
                                              V1_platform,
                                              V1_zone_id},
                                         unreal_looks_flag =
                                             V1_unreal_looks_flag,
                                         pet_rune = V1_pet_rune}
                                        <- V0_pet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10531:16/little,
       D_a_t_a/binary>>};
pack(cli, 10532, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10532:16/little,
       D_a_t_a/binary>>};
pack(srv, 10532, {V0_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10532:16/little,
       D_a_t_a/binary>>};
pack(cli, 10533, {}) ->
    {ok, <<2:32/little, 10533:16/little>>};
pack(srv, 10533, {V0_pet_nums, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_pet_nums:8/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10533:16/little,
       D_a_t_a/binary>>};
pack(cli, 10534, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10534:16/little,
       D_a_t_a/binary>>};
pack(srv, 10534,
     {V0_id, V0_result, V0_msg, V0_pay_flag}) ->
    D_a_t_a = <<V0_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pay_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10534:16/little,
       D_a_t_a/binary>>};
pack(cli, 10535, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10535:16/little,
       D_a_t_a/binary>>};
pack(srv, 10535, {V0_id, V0_combat_talk}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_combat_talk)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || {V1_type, V1_msg}
                                        <- V0_combat_talk]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10535:16/little,
       D_a_t_a/binary>>};
pack(cli, 10536, {V0_id, V0_type, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10536:16/little,
       D_a_t_a/binary>>};
pack(srv, 10536,
     {V0_id, V0_result, V0_reason, V0_type, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_reason))/binary,
                V0_type:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10536:16/little,
       D_a_t_a/binary>>};
pack(cli, 10537, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10537:16/little,
       D_a_t_a/binary>>};
pack(srv, 10537, {V0_op_code, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10537:16/little,
       D_a_t_a/binary>>};
pack(cli, 10538, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10538:16/little,
       D_a_t_a/binary>>};
pack(srv, 10538, {V0_op_code, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_op_code:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10538:16/little,
       D_a_t_a/binary>>};
pack(cli, 10539, {V0_id, V0_base_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10539:16/little,
       D_a_t_a/binary>>};
pack(srv, 10539,
     {V0_id, V0_base_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little,
                V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10539:16/little,
       D_a_t_a/binary>>};
pack(cli, 10540, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10540:16/little,
       D_a_t_a/binary>>};
pack(srv, 10540, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10540:16/little,
       D_a_t_a/binary>>};
pack(cli, 10541, {V0_pet_id, V0_item_id}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10541:16/little,
       D_a_t_a/binary>>};
pack(srv, 10541, {V0_result, V0_pet_id, V0_item_id}) ->
    D_a_t_a = <<V0_result:8/little, V0_pet_id:32/little,
                V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10541:16/little,
       D_a_t_a/binary>>};
pack(cli, 10542, {V0_pet_id, V0_item_id}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10542:16/little,
       D_a_t_a/binary>>};
pack(srv, 10542, {V0_result, V0_pet_id, V0_item_id}) ->
    D_a_t_a = <<V0_result:8/little, V0_pet_id:32/little,
                V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10542:16/little,
       D_a_t_a/binary>>};
pack(cli, 10543, {}) ->
    {ok, <<2:32/little, 10543:16/little>>};
pack(srv, 10543, {V0_num}) ->
    D_a_t_a = <<V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10543:16/little,
       D_a_t_a/binary>>};
pack(cli, 10544,
     {V0_pet_id, V0_stone_id, V0_item_id}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_stone_id:32/little,
                V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10544:16/little,
       D_a_t_a/binary>>};
pack(srv, 10544, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10544:16/little,
       D_a_t_a/binary>>};
pack(cli, 10545, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10545:16/little,
       D_a_t_a/binary>>};
pack(srv, 10545, {V0_base_id, V0_result, V0_msg}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10545:16/little,
       D_a_t_a/binary>>};
pack(cli, 10546, {V0_id, V0_base_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10546:16/little,
       D_a_t_a/binary>>};
pack(srv, 10546, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10546:16/little,
       D_a_t_a/binary>>};
pack(cli, 10547, {}) ->
    {ok, <<2:32/little, 10547:16/little>>};
pack(srv, 10547, {V0_pet_base_id, V0_genre}) ->
    D_a_t_a = <<V0_pet_base_id:32/little,
                V0_genre:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10547:16/little,
       D_a_t_a/binary>>};
pack(cli, 10548, {V0_id, V0_id_sub}) ->
    D_a_t_a = <<V0_id:32/little, V0_id_sub:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10548:16/little,
       D_a_t_a/binary>>};
pack(srv, 10548, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10548:16/little,
       D_a_t_a/binary>>};
pack(cli, 10549, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10549:16/little,
       D_a_t_a/binary>>};
pack(srv, 10549,
     {V0_result, V0_msg, V0_moon, V0_sun}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_moon:16/little, V0_sun:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10549:16/little,
       D_a_t_a/binary>>};
pack(cli, 10550, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10550:16/little,
       D_a_t_a/binary>>};
pack(srv, 10550, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10550:16/little,
       D_a_t_a/binary>>};
pack(cli, 10551, {}) ->
    {ok, <<2:32/little, 10551:16/little>>};
pack(srv, 10551, {V0_moon, V0_sun}) ->
    D_a_t_a = <<V0_moon:16/little, V0_sun:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10551:16/little,
       D_a_t_a/binary>>};
pack(cli, 10552, {}) ->
    {ok, <<2:32/little, 10552:16/little>>};
pack(srv, 10552, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10552:16/little,
       D_a_t_a/binary>>};
pack(cli, 10553, {V0_id, V0_skill_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10553:16/little,
       D_a_t_a/binary>>};
pack(srv, 10553, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10553:16/little,
       D_a_t_a/binary>>};
pack(cli, 10554, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10554:16/little,
       D_a_t_a/binary>>};
pack(srv, 10554, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10554:16/little,
       D_a_t_a/binary>>};
pack(cli, 10555, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10555:16/little,
       D_a_t_a/binary>>};
pack(srv, 10555,
     {V0_id,
      #pet_tmp_aptitude{is_valid = V0_is_valid,
                        tmp_genre = V0_tmp_genre,
                        tmp_pet_attr =
                            #pet_attr{point = V0_point, p_str = V0_p_str,
                                      p_con = V0_p_con, p_mag = V0_p_mag,
                                      p_agi = V0_p_agi, p_end = V0_p_end,
                                      hp_aptitude = V0_hp_aptitude,
                                      phy_aptitude = V0_phy_aptitude,
                                      pdef_aptitude = V0_pdef_aptitude,
                                      magic_aptitude = V0_magic_aptitude,
                                      aspd_aptitude = V0_aspd_aptitude,
                                      max_hp_aptitude = V0_max_hp_aptitude,
                                      max_phy_aptitude = V0_max_phy_aptitude,
                                      max_pdef_aptitude = V0_max_pdef_aptitude,
                                      max_magic_aptitude =
                                          V0_max_magic_aptitude,
                                      max_aspd_aptitude = V0_max_aspd_aptitude},
                        tmp_skills = V0_tmp_skills, tmp_growth = V0_tmp_growth,
                        tmp_growth_type = V0_tmp_growth_type,
                        tmp_happy = V0_tmp_happy, talent = V0_talent}}) ->
    D_a_t_a = <<V0_id:32/little, V0_is_valid:8/little,
                V0_tmp_genre:8/little, V0_point:16/little,
                V0_p_str:16/little, V0_p_con:16/little,
                V0_p_mag:16/little, V0_p_agi:16/little,
                V0_p_end:16/little, V0_hp_aptitude:16/little,
                V0_phy_aptitude:16/little, V0_pdef_aptitude:16/little,
                V0_magic_aptitude:16/little, V0_aspd_aptitude:16/little,
                V0_max_hp_aptitude:16/little,
                V0_max_phy_aptitude:16/little,
                V0_max_pdef_aptitude:16/little,
                V0_max_magic_aptitude:16/little,
                V0_max_aspd_aptitude:16/little,
                (length(V0_tmp_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_source:8/little,
                                   V1_is_lock:8/little>>
                                 || #pet_skill{id = V1_id, source = V1_source,
                                               is_lock = V1_is_lock}
                                        <- V0_tmp_skills]))/binary,
                V0_tmp_growth:16/little, V0_tmp_growth_type:8/little,
                V0_tmp_happy:32/little, V0_talent:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10555:16/little,
       D_a_t_a/binary>>};
pack(cli, 10556, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10556:16/little,
       D_a_t_a/binary>>};
pack(srv, 10556, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10556:16/little,
       D_a_t_a/binary>>};
pack(cli, 10557, {V0_id, V0_skin_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_skin_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10557:16/little,
       D_a_t_a/binary>>};
pack(srv, 10557, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10557:16/little,
       D_a_t_a/binary>>};
pack(cli, 10558, {V0_id, V0_skin_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_skin_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10558:16/little,
       D_a_t_a/binary>>};
pack(srv, 10558, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10558:16/little,
       D_a_t_a/binary>>};
pack(cli, 10559, {}) ->
    {ok, <<2:32/little, 10559:16/little>>};
pack(srv, 10559,
     {V0_id,
      #pet_skin{use_skin = V0_use_skin,
                has_skin = V0_has_skin}}) ->
    D_a_t_a = <<V0_id:32/little, V0_use_skin:32/little,
                (length(V0_has_skin)):16/little,
                (list_to_binary([<<V1_skin_id:32/little>>
                                 || V1_skin_id <- V0_has_skin]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10559:16/little,
       D_a_t_a/binary>>};
pack(cli, 10560, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10560:16/little,
       D_a_t_a/binary>>};
pack(srv, 10560, {V0_base_id, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10560:16/little,
       D_a_t_a/binary>>};
pack(cli, 10561,
     {V0_master_pet_id, V0_attach_pet_id}) ->
    D_a_t_a = <<V0_master_pet_id:32/little,
                V0_attach_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10561:16/little,
       D_a_t_a/binary>>};
pack(srv, 10561, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10561:16/little,
       D_a_t_a/binary>>};
pack(cli, 10562, {V0_attach_pet_id}) ->
    D_a_t_a = <<V0_attach_pet_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10562:16/little,
       D_a_t_a/binary>>};
pack(srv, 10562, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10562:16/little,
       D_a_t_a/binary>>};
pack(cli, 10563, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10563:16/little,
       D_a_t_a/binary>>};
pack(srv, 10563, {V0_id, V0_attr}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_attr)):16/little,
                (list_to_binary([<<V1_type:16/little, V1_name:32/little,
                                   V1_flag:32/little, V1_val:32/signed-little>>
                                 || #attr_base{type = V1_type, name = V1_name,
                                               flag = V1_flag, val = V1_val}
                                        <- V0_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10563:16/little,
       D_a_t_a/binary>>};
pack(cli, 10564, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10564:16/little,
       D_a_t_a/binary>>};
pack(srv, 10564, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10564:16/little,
       D_a_t_a/binary>>};
pack(cli, 10565, {V0_pet_id, V0_item_id}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_item_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10565:16/little,
       D_a_t_a/binary>>};
pack(srv, 10565, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10565:16/little,
       D_a_t_a/binary>>};
pack(cli, 10566, {V0_id, V0_id_sub}) ->
    D_a_t_a = <<V0_id:32/little, V0_id_sub:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10566:16/little,
       D_a_t_a/binary>>};
pack(srv, 10566, {V0_attr}) ->
    D_a_t_a = <<(length(V0_attr)):16/little,
                (list_to_binary([<<V1_type:32/little,
                                   V1_value:32/little>>
                                 || {V1_type, V1_value} <- V0_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10566:16/little,
       D_a_t_a/binary>>};
pack(cli, 10567, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10567:16/little,
       D_a_t_a/binary>>};
pack(srv, 10567, {V0_id, V0_extra_attr}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_extra_attr)):16/little,
                (list_to_binary([<<V1_type:32/little,
                                   V1_hp_max:32/little, V1_mp_max:32/little,
                                   V1_atk_speed:16/little, V1_phy_dmg:32/little,
                                   V1_magic_dmg:32/little, V1_phy_def:32/little,
                                   V1_magic_def:32/little,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little>>
                                 || {V1_type,
                                     #attr{hp_max = V1_hp_max,
                                           mp_max = V1_mp_max,
                                           atk_speed = V1_atk_speed,
                                           phy_dmg = V1_phy_dmg,
                                           magic_dmg = V1_magic_dmg,
                                           phy_def = V1_phy_def,
                                           magic_def = V1_magic_def,
                                           strength = V1_strength,
                                           constitution = V1_constitution,
                                           magic = V1_magic,
                                           agility = V1_agility,
                                           endurance = V1_endurance}}
                                        <- V0_extra_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10567:16/little,
       D_a_t_a/binary>>};
pack(cli, 10568, {V0_id, V0_base_id, V0_hole_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_base_id:32/little,
                V0_hole_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10568:16/little,
       D_a_t_a/binary>>};
pack(srv, 10568, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10568:16/little,
       D_a_t_a/binary>>};
pack(cli, 10569, {}) ->
    {ok, <<2:32/little, 10569:16/little>>};
pack(srv, 10569, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10569:16/little,
       D_a_t_a/binary>>};
pack(cli, 10570, {}) ->
    {ok, <<2:32/little, 10570:16/little>>};
pack(srv, 10570,
     {V0_flag, V0_msg, V0_pet_id, V0_reward}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_pet_id:32/little, (length(V0_reward)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little, V1_spec_effects:32/little>>
                                 || {V1_item_id, V1_num, V1_spec_effects}
                                        <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10570:16/little,
       D_a_t_a/binary>>};
pack(cli, 10571, {}) ->
    {ok, <<2:32/little, 10571:16/little>>};
pack(srv, 10571, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10571:16/little,
       D_a_t_a/binary>>};
pack(cli, 10572, {}) ->
    {ok, <<2:32/little, 10572:16/little>>};
pack(srv, 10572, {V0_flag, V0_times}) ->
    D_a_t_a = <<V0_flag:8/little, V0_times:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10572:16/little,
       D_a_t_a/binary>>};
pack(cli, 10573, {V0_pet_id, V0_skill_id}) ->
    D_a_t_a = <<V0_pet_id:32/little,
                V0_skill_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10573:16/little,
       D_a_t_a/binary>>};
pack(srv, 10573, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10573:16/little,
       D_a_t_a/binary>>};
pack(cli, 10574, {V0_pet_id, V0_unreal_flag}) ->
    D_a_t_a = <<V0_pet_id:32/little,
                V0_unreal_flag:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10574:16/little,
       D_a_t_a/binary>>};
pack(srv, 10574, {}) ->
    {ok, <<2:32/little, 10574:16/little>>};
pack(cli, 10575,
     {V0_pet_id, V0_rune_index, V0_rune_id}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_rune_index:8/little,
                V0_rune_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10575:16/little,
       D_a_t_a/binary>>};
pack(srv, 10575,
     {V0_flag, V0_msg, V0_rune_index, V0_rune_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rune_index:8/little, V0_rune_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10575:16/little,
       D_a_t_a/binary>>};
pack(cli, 10576, {V0_pet_id, V0_rune_index, V0_type}) ->
    D_a_t_a = <<V0_pet_id:32/little, V0_rune_index:8/little,
                V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10576:16/little,
       D_a_t_a/binary>>};
pack(srv, 10576, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10576:16/little,
       D_a_t_a/binary>>};
pack(cli, 10577, {V0_pet_id, V0_rune_index}) ->
    D_a_t_a = <<V0_pet_id:32/little,
                V0_rune_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10577:16/little,
       D_a_t_a/binary>>};
pack(srv, 10577, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10577:16/little,
       D_a_t_a/binary>>};
pack(cli, 10578, {V0_pet_id, V0_resonance_index}) ->
    D_a_t_a = <<V0_pet_id:32/little,
                V0_resonance_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10578:16/little,
       D_a_t_a/binary>>};
pack(srv, 10578,
     {V0_flag, V0_msg, V0_resonance_index}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_resonance_index:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10578:16/little,
       D_a_t_a/binary>>};
pack(cli, 10579, {}) ->
    {ok, <<2:32/little, 10579:16/little>>};
pack(srv, 10579, {V0_id, V0_pet_rune}) ->
    D_a_t_a = <<V0_id:32/little,
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
     <<(byte_size(D_a_t_a) + 2):32/little, 10579:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10500, _B0) -> {ok, {}};
unpack(cli, 10500, _B0) ->
    {V1_pet_nums, _B1} = protocol:uint8(_B0),
    {V1_fresh_id, _B2} = protocol:uint8(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {V1_pet_list, _B136} = protocol:array(_B3,
                                          fun (_B4) ->
                                                  {V2_id, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_lev, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_exp, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_max_exp, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_status, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_base_id, _B11} =
                                                      protocol:uint32(_B10),
                                                  {V2_happy, _B12} =
                                                      protocol:uint32(_B11),
                                                  {V2_grade, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_talent, _B14} =
                                                      protocol:uint16(_B13),
                                                  {V2_genre, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_growth, _B16} =
                                                      protocol:uint16(_B15),
                                                  {V2_growth_type, _B17} =
                                                      protocol:uint8(_B16),
                                                  {V2_hp, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_mp, _B19} =
                                                      protocol:uint32(_B18),
                                                  {V2_feed_point, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_free_reset_flag, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_use_growth, _B22} =
                                                      protocol:uint8(_B21),
                                                  {V2_lock, _B23} =
                                                      protocol:uint8(_B22),
                                                  {V2_hp_max, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_mp_max, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_atk_speed, _B26} =
                                                      protocol:uint16(_B25),
                                                  {V2_phy_dmg, _B27} =
                                                      protocol:uint32(_B26),
                                                  {V2_magic_dmg, _B28} =
                                                      protocol:uint32(_B27),
                                                  {V2_phy_def, _B29} =
                                                      protocol:uint32(_B28),
                                                  {V2_magic_def, _B30} =
                                                      protocol:uint32(_B29),
                                                  {V2_strength, _B31} =
                                                      protocol:uint16(_B30),
                                                  {V2_constitution, _B32} =
                                                      protocol:uint16(_B31),
                                                  {V2_magic, _B33} =
                                                      protocol:uint16(_B32),
                                                  {V2_agility, _B34} =
                                                      protocol:uint16(_B33),
                                                  {V2_endurance, _B35} =
                                                      protocol:uint16(_B34),
                                                  {V2_point, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_p_str, _B37} =
                                                      protocol:uint16(_B36),
                                                  {V2_p_con, _B38} =
                                                      protocol:uint16(_B37),
                                                  {V2_p_mag, _B39} =
                                                      protocol:uint16(_B38),
                                                  {V2_p_agi, _B40} =
                                                      protocol:uint16(_B39),
                                                  {V2_p_end, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_hp_aptitude, _B42} =
                                                      protocol:uint16(_B41),
                                                  {V2_phy_aptitude, _B43} =
                                                      protocol:uint16(_B42),
                                                  {V2_pdef_aptitude, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_magic_aptitude, _B45} =
                                                      protocol:uint16(_B44),
                                                  {V2_aspd_aptitude, _B46} =
                                                      protocol:uint16(_B45),
                                                  {V2_max_hp_aptitude, _B47} =
                                                      protocol:uint16(_B46),
                                                  {V2_max_phy_aptitude, _B48} =
                                                      protocol:uint16(_B47),
                                                  {V2_max_pdef_aptitude, _B49} =
                                                      protocol:uint16(_B48),
                                                  {V2_max_magic_aptitude,
                                                   _B50} =
                                                      protocol:uint16(_B49),
                                                  {V2_max_aspd_aptitude, _B51} =
                                                      protocol:uint16(_B50),
                                                  {V2_max_hp_apt_used, _B52} =
                                                      protocol:uint8(_B51),
                                                  {V2_max_phy_apt_used, _B53} =
                                                      protocol:uint8(_B52),
                                                  {V2_max_pdef_apt_used, _B54} =
                                                      protocol:uint8(_B53),
                                                  {V2_max_magic_apt_used,
                                                   _B55} =
                                                      protocol:uint8(_B54),
                                                  {V2_max_aspd_apt_used, _B56} =
                                                      protocol:uint8(_B55),
                                                  {V2_skills, _B62} =
                                                      protocol:array(_B56,
                                                                     fun
                                                                         (_B57) ->
                                                                             {V3_id,
                                                                              _B58} =
                                                                                 protocol:uint32(_B57),
                                                                             {V3_source,
                                                                              _B59} =
                                                                                 protocol:uint8(_B58),
                                                                             {V3_is_lock,
                                                                              _B60} =
                                                                                 protocol:uint8(_B59),
                                                                             {{V3_id,
                                                                               V3_source,
                                                                               V3_is_lock},
                                                                              _B60}
                                                                     end),
                                                  {V2_stones, _B87} =
                                                      protocol:array(_B62,
                                                                     fun
                                                                         (_B63) ->
                                                                             {V3_id,
                                                                              _B64} =
                                                                                 protocol:uint32(_B63),
                                                                             {V3_base_id,
                                                                              _B65} =
                                                                                 protocol:uint32(_B64),
                                                                             {V3_attr,
                                                                              _B72} =
                                                                                 protocol:array(_B65,
                                                                                                fun
                                                                                                    (_B66) ->
                                                                                                        {V4_type,
                                                                                                         _B67} =
                                                                                                            protocol:uint16(_B66),
                                                                                                        {V4_name,
                                                                                                         _B68} =
                                                                                                            protocol:uint32(_B67),
                                                                                                        {V4_flag,
                                                                                                         _B69} =
                                                                                                            protocol:uint32(_B68),
                                                                                                        {V4_val,
                                                                                                         _B70} =
                                                                                                            protocol:int32(_B69),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B70}
                                                                                                end),
                                                                             {V3_reset_attr,
                                                                              _B79} =
                                                                                 protocol:array(_B72,
                                                                                                fun
                                                                                                    (_B73) ->
                                                                                                        {V4_type,
                                                                                                         _B74} =
                                                                                                            protocol:uint16(_B73),
                                                                                                        {V4_name,
                                                                                                         _B75} =
                                                                                                            protocol:uint32(_B74),
                                                                                                        {V4_flag,
                                                                                                         _B76} =
                                                                                                            protocol:uint32(_B75),
                                                                                                        {V4_val,
                                                                                                         _B77} =
                                                                                                            protocol:int32(_B76),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B77}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B85} =
                                                                                 protocol:array(_B79,
                                                                                                fun
                                                                                                    (_B80) ->
                                                                                                        {V4_name,
                                                                                                         _B81} =
                                                                                                            protocol:uint32(_B80),
                                                                                                        {V4_value,
                                                                                                         _B82} =
                                                                                                            protocol:uint32(_B81),
                                                                                                        {V4_str,
                                                                                                         _B83} =
                                                                                                            protocol:string(_B82),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B83}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_attr,
                                                                               V3_reset_attr,
                                                                               V3_extra},
                                                                              _B85}
                                                                     end),
                                                  {V2_grade_attr, _B94} =
                                                      protocol:array(_B87,
                                                                     fun
                                                                         (_B88) ->
                                                                             {V3_type,
                                                                              _B89} =
                                                                                 protocol:uint16(_B88),
                                                                             {V3_name,
                                                                              _B90} =
                                                                                 protocol:uint32(_B89),
                                                                             {V3_flag,
                                                                              _B91} =
                                                                                 protocol:uint32(_B90),
                                                                             {V3_val,
                                                                              _B92} =
                                                                                 protocol:int32(_B91),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B92}
                                                                     end),
                                                  {V2_break_times, _B95} =
                                                      protocol:uint8(_B94),
                                                  {V2_handbook_attr, _B100} =
                                                      protocol:array(_B95,
                                                                     fun
                                                                         (_B96) ->
                                                                             {V3_attr_name,
                                                                              _B97} =
                                                                                 protocol:uint32(_B96),
                                                                             {V3_attr_val,
                                                                              _B98} =
                                                                                 protocol:uint32(_B97),
                                                                             {{V3_attr_name,
                                                                               V3_attr_val},
                                                                              _B98}
                                                                     end),
                                                  {V2_handbook_num, _B101} =
                                                      protocol:uint8(_B100),
                                                  {V2_star_handbook_num,
                                                   _B102} =
                                                      protocol:uint8(_B101),
                                                  {V2_use_skin, _B103} =
                                                      protocol:uint32(_B102),
                                                  {V2_has_skin, _B107} =
                                                      protocol:array(_B103,
                                                                     fun
                                                                         (_B104) ->
                                                                             {V3_skin_id,
                                                                              _B105} =
                                                                                 protocol:uint32(_B104),
                                                                             {{V3_skin_id},
                                                                              _B105}
                                                                     end),
                                                  {V2_spirit_attached, _B108} =
                                                      protocol:uint8(_B107),
                                                  {V2_spirit_attached_id,
                                                   _B109} =
                                                      protocol:uint32(_B108),
                                                  {V2_unreal, _B114} =
                                                      protocol:array(_B109,
                                                                     fun
                                                                         (_B110) ->
                                                                             {V3_item_id,
                                                                              _B111} =
                                                                                 protocol:uint32(_B110),
                                                                             {V3_timeout,
                                                                              _B112} =
                                                                                 protocol:uint32(_B111),
                                                                             {{V3_item_id,
                                                                               V3_timeout},
                                                                              _B112}
                                                                     end),
                                                  {V2_spirit_child_flag,
                                                   _B115} =
                                                      protocol:uint8(_B114),
                                                  {V2_child_id, _B116} =
                                                      protocol:uint32(_B115),
                                                  {V2_platform, _B117} =
                                                      protocol:string(_B116),
                                                  {V2_zone_id, _B118} =
                                                      protocol:uint16(_B117),
                                                  {V2_unreal_looks_flag,
                                                   _B119} =
                                                      protocol:uint8(_B118),
                                                  {V2_pet_rune, _B134} =
                                                      protocol:array(_B119,
                                                                     fun
                                                                         (_B120) ->
                                                                             {V3_rune_index,
                                                                              _B121} =
                                                                                 protocol:uint8(_B120),
                                                                             {V3_rune_type,
                                                                              _B122} =
                                                                                 protocol:uint8(_B121),
                                                                             {V3_rune_status,
                                                                              _B123} =
                                                                                 protocol:uint8(_B122),
                                                                             {V3_rune_id,
                                                                              _B124} =
                                                                                 protocol:uint32(_B123),
                                                                             {V3_rune_lev,
                                                                              _B125} =
                                                                                 protocol:uint8(_B124),
                                                                             {V3_is_resonance,
                                                                              _B126} =
                                                                                 protocol:uint8(_B125),
                                                                             {V3_resonances,
                                                                              _B132} =
                                                                                 protocol:array(_B126,
                                                                                                fun
                                                                                                    (_B127) ->
                                                                                                        {V4_resonance_index,
                                                                                                         _B128} =
                                                                                                            protocol:uint8(_B127),
                                                                                                        {V4_resonance_id,
                                                                                                         _B129} =
                                                                                                            protocol:uint32(_B128),
                                                                                                        {V4_rune_index,
                                                                                                         _B130} =
                                                                                                            protocol:uint8(_B129),
                                                                                                        {{V4_resonance_index,
                                                                                                          V4_resonance_id,
                                                                                                          V4_rune_index},
                                                                                                         _B130}
                                                                                                end),
                                                                             {{V3_rune_index,
                                                                               V3_rune_type,
                                                                               V3_rune_status,
                                                                               V3_rune_id,
                                                                               V3_rune_lev,
                                                                               V3_is_resonance,
                                                                               V3_resonances},
                                                                              _B132}
                                                                     end),
                                                  {{V2_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_exp,
                                                    V2_max_exp,
                                                    V2_status,
                                                    V2_base_id,
                                                    V2_happy,
                                                    V2_grade,
                                                    V2_talent,
                                                    V2_genre,
                                                    V2_growth,
                                                    V2_growth_type,
                                                    V2_hp,
                                                    V2_mp,
                                                    V2_feed_point,
                                                    V2_free_reset_flag,
                                                    V2_use_growth,
                                                    V2_lock,
                                                    V2_hp_max,
                                                    V2_mp_max,
                                                    V2_atk_speed,
                                                    V2_phy_dmg,
                                                    V2_magic_dmg,
                                                    V2_phy_def,
                                                    V2_magic_def,
                                                    V2_strength,
                                                    V2_constitution,
                                                    V2_magic,
                                                    V2_agility,
                                                    V2_endurance,
                                                    V2_point,
                                                    V2_p_str,
                                                    V2_p_con,
                                                    V2_p_mag,
                                                    V2_p_agi,
                                                    V2_p_end,
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
                                                    V2_skills,
                                                    V2_stones,
                                                    V2_grade_attr,
                                                    V2_break_times,
                                                    V2_handbook_attr,
                                                    V2_handbook_num,
                                                    V2_star_handbook_num,
                                                    V2_use_skin,
                                                    V2_has_skin,
                                                    V2_spirit_attached,
                                                    V2_spirit_attached_id,
                                                    V2_unreal,
                                                    V2_spirit_child_flag,
                                                    V2_child_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_unreal_looks_flag,
                                                    V2_pet_rune},
                                                   _B134}
                                          end),
    {ok, {V1_pet_nums, V1_fresh_id, V1_time, V1_pet_list}};
unpack(srv, 10501, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_mode, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_mode}};
unpack(cli, 10501, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10502, _B0) -> {ok, {}};
unpack(cli, 10502, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_exp, _B3} = protocol:uint32(_B2),
    {V1_max_exp, _B4} = protocol:uint32(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_happy, _B6} = protocol:uint32(_B5),
    {V1_status, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_id,
      V1_name,
      V1_exp,
      V1_max_exp,
      V1_lev,
      V1_happy,
      V1_status}};
unpack(srv, 10503, _B0) -> {ok, {}};
unpack(cli, 10503, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_talent, _B2} = protocol:uint16(_B1),
    {V1_genre, _B3} = protocol:uint8(_B2),
    {V1_growth, _B4} = protocol:uint16(_B3),
    {V1_growth_type, _B5} = protocol:uint8(_B4),
    {V1_hp, _B6} = protocol:uint32(_B5),
    {V1_mp, _B7} = protocol:uint32(_B6),
    {V1_feed_point, _B8} = protocol:uint32(_B7),
    {V1_free_reset_flag, _B9} = protocol:uint32(_B8),
    {V1_use_growth, _B10} = protocol:uint8(_B9),
    {V1_hp_max, _B11} = protocol:uint32(_B10),
    {V1_mp_max, _B12} = protocol:uint32(_B11),
    {V1_atk_speed, _B13} = protocol:uint16(_B12),
    {V1_phy_dmg, _B14} = protocol:uint32(_B13),
    {V1_magic_dmg, _B15} = protocol:uint32(_B14),
    {V1_phy_def, _B16} = protocol:uint32(_B15),
    {V1_magic_def, _B17} = protocol:uint32(_B16),
    {V1_strength, _B18} = protocol:uint16(_B17),
    {V1_constitution, _B19} = protocol:uint16(_B18),
    {V1_magic, _B20} = protocol:uint16(_B19),
    {V1_agility, _B21} = protocol:uint16(_B20),
    {V1_endurance, _B22} = protocol:uint16(_B21),
    {V1_point, _B23} = protocol:uint16(_B22),
    {V1_p_str, _B24} = protocol:uint16(_B23),
    {V1_p_con, _B25} = protocol:uint16(_B24),
    {V1_p_mag, _B26} = protocol:uint16(_B25),
    {V1_p_agi, _B27} = protocol:uint16(_B26),
    {V1_p_end, _B28} = protocol:uint16(_B27),
    {V1_hp_aptitude, _B29} = protocol:uint16(_B28),
    {V1_phy_aptitude, _B30} = protocol:uint16(_B29),
    {V1_pdef_aptitude, _B31} = protocol:uint16(_B30),
    {V1_magic_aptitude, _B32} = protocol:uint16(_B31),
    {V1_aspd_aptitude, _B33} = protocol:uint16(_B32),
    {V1_max_hp_aptitude, _B34} = protocol:uint16(_B33),
    {V1_max_phy_aptitude, _B35} = protocol:uint16(_B34),
    {V1_max_pdef_aptitude, _B36} = protocol:uint16(_B35),
    {V1_max_magic_aptitude, _B37} = protocol:uint16(_B36),
    {V1_max_aspd_aptitude, _B38} = protocol:uint16(_B37),
    {V1_max_hp_apt_used, _B39} = protocol:uint8(_B38),
    {V1_max_phy_apt_used, _B40} = protocol:uint8(_B39),
    {V1_max_pdef_apt_used, _B41} = protocol:uint8(_B40),
    {V1_max_magic_apt_used, _B42} = protocol:uint8(_B41),
    {V1_max_aspd_apt_used, _B43} = protocol:uint8(_B42),
    {V1_grade_attr, _B50} = protocol:array(_B43,
                                           fun (_B44) ->
                                                   {V2_type, _B45} =
                                                       protocol:uint16(_B44),
                                                   {V2_name, _B46} =
                                                       protocol:uint32(_B45),
                                                   {V2_flag, _B47} =
                                                       protocol:uint32(_B46),
                                                   {V2_val, _B48} =
                                                       protocol:int32(_B47),
                                                   {{V2_type,
                                                     V2_name,
                                                     V2_flag,
                                                     V2_val},
                                                    _B48}
                                           end),
    {V1_break_times, _B51} = protocol:uint8(_B50),
    {V1_handbook_attr, _B56} = protocol:array(_B51,
                                              fun (_B52) ->
                                                      {V2_attr_name, _B53} =
                                                          protocol:uint32(_B52),
                                                      {V2_attr_val, _B54} =
                                                          protocol:uint32(_B53),
                                                      {{V2_attr_name,
                                                        V2_attr_val},
                                                       _B54}
                                              end),
    {V1_handbook_num, _B57} = protocol:uint8(_B56),
    {V1_star_handbook_num, _B58} = protocol:uint8(_B57),
    {V1_spirit_attached, _B59} = protocol:uint8(_B58),
    {V1_spirit_attached_id, _B60} = protocol:uint32(_B59),
    {V1_unreal, _B65} = protocol:array(_B60,
                                       fun (_B61) ->
                                               {V2_item_id, _B62} =
                                                   protocol:uint32(_B61),
                                               {V2_timeout, _B63} =
                                                   protocol:uint32(_B62),
                                               {{V2_item_id, V2_timeout}, _B63}
                                       end),
    {V1_spirit_child_flag, _B66} = protocol:uint8(_B65),
    {V1_child_id, _B67} = protocol:uint32(_B66),
    {V1_platform, _B68} = protocol:string(_B67),
    {V1_zone_id, _B69} = protocol:uint16(_B68),
    {V1_unreal_looks_flag, _B70} = protocol:uint8(_B69),
    {ok,
     {V1_id,
      V1_talent,
      V1_genre,
      V1_growth,
      V1_growth_type,
      V1_hp,
      V1_mp,
      V1_feed_point,
      V1_free_reset_flag,
      V1_use_growth,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance,
      V1_point,
      V1_p_str,
      V1_p_con,
      V1_p_mag,
      V1_p_agi,
      V1_p_end,
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
      V1_max_aspd_apt_used,
      V1_grade_attr,
      V1_break_times,
      V1_handbook_attr,
      V1_handbook_num,
      V1_star_handbook_num,
      V1_spirit_attached,
      V1_spirit_attached_id,
      V1_unreal,
      V1_spirit_child_flag,
      V1_child_id,
      V1_platform,
      V1_zone_id,
      V1_unreal_looks_flag}};
unpack(srv, 10504, _B0) -> {ok, {}};
unpack(cli, 10504, _B0) ->
    {V1_pet_list, _B132} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_name, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_lev, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_exp, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_max_exp, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_status, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_base_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_happy, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_grade, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_talent, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_genre, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_growth, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_growth_type, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_hp, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_mp, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_feed_point, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_free_reset_flag, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_lock, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_hp_max, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_mp_max, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_atk_speed, _B22} =
                                                      protocol:uint16(_B21),
                                                  {V2_phy_dmg, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_magic_dmg, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_phy_def, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_magic_def, _B26} =
                                                      protocol:uint32(_B25),
                                                  {V2_strength, _B27} =
                                                      protocol:uint16(_B26),
                                                  {V2_constitution, _B28} =
                                                      protocol:uint16(_B27),
                                                  {V2_magic, _B29} =
                                                      protocol:uint16(_B28),
                                                  {V2_agility, _B30} =
                                                      protocol:uint16(_B29),
                                                  {V2_endurance, _B31} =
                                                      protocol:uint16(_B30),
                                                  {V2_point, _B32} =
                                                      protocol:uint16(_B31),
                                                  {V2_p_str, _B33} =
                                                      protocol:uint16(_B32),
                                                  {V2_p_con, _B34} =
                                                      protocol:uint16(_B33),
                                                  {V2_p_mag, _B35} =
                                                      protocol:uint16(_B34),
                                                  {V2_p_agi, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_p_end, _B37} =
                                                      protocol:uint16(_B36),
                                                  {V2_hp_aptitude, _B38} =
                                                      protocol:uint16(_B37),
                                                  {V2_phy_aptitude, _B39} =
                                                      protocol:uint16(_B38),
                                                  {V2_pdef_aptitude, _B40} =
                                                      protocol:uint16(_B39),
                                                  {V2_magic_aptitude, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_aspd_aptitude, _B42} =
                                                      protocol:uint16(_B41),
                                                  {V2_max_hp_aptitude, _B43} =
                                                      protocol:uint16(_B42),
                                                  {V2_max_phy_aptitude, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_max_pdef_aptitude, _B45} =
                                                      protocol:uint16(_B44),
                                                  {V2_max_magic_aptitude,
                                                   _B46} =
                                                      protocol:uint16(_B45),
                                                  {V2_max_aspd_aptitude, _B47} =
                                                      protocol:uint16(_B46),
                                                  {V2_max_hp_apt_used, _B48} =
                                                      protocol:uint8(_B47),
                                                  {V2_max_phy_apt_used, _B49} =
                                                      protocol:uint8(_B48),
                                                  {V2_max_pdef_apt_used, _B50} =
                                                      protocol:uint8(_B49),
                                                  {V2_max_magic_apt_used,
                                                   _B51} =
                                                      protocol:uint8(_B50),
                                                  {V2_max_aspd_apt_used, _B52} =
                                                      protocol:uint8(_B51),
                                                  {V2_skills, _B58} =
                                                      protocol:array(_B52,
                                                                     fun
                                                                         (_B53) ->
                                                                             {V3_id,
                                                                              _B54} =
                                                                                 protocol:uint32(_B53),
                                                                             {V3_source,
                                                                              _B55} =
                                                                                 protocol:uint8(_B54),
                                                                             {V3_is_lock,
                                                                              _B56} =
                                                                                 protocol:uint8(_B55),
                                                                             {{V3_id,
                                                                               V3_source,
                                                                               V3_is_lock},
                                                                              _B56}
                                                                     end),
                                                  {V2_stones, _B83} =
                                                      protocol:array(_B58,
                                                                     fun
                                                                         (_B59) ->
                                                                             {V3_id,
                                                                              _B60} =
                                                                                 protocol:uint32(_B59),
                                                                             {V3_base_id,
                                                                              _B61} =
                                                                                 protocol:uint32(_B60),
                                                                             {V3_attr,
                                                                              _B68} =
                                                                                 protocol:array(_B61,
                                                                                                fun
                                                                                                    (_B62) ->
                                                                                                        {V4_type,
                                                                                                         _B63} =
                                                                                                            protocol:uint16(_B62),
                                                                                                        {V4_name,
                                                                                                         _B64} =
                                                                                                            protocol:uint32(_B63),
                                                                                                        {V4_flag,
                                                                                                         _B65} =
                                                                                                            protocol:uint32(_B64),
                                                                                                        {V4_val,
                                                                                                         _B66} =
                                                                                                            protocol:int32(_B65),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B66}
                                                                                                end),
                                                                             {V3_reset_attr,
                                                                              _B75} =
                                                                                 protocol:array(_B68,
                                                                                                fun
                                                                                                    (_B69) ->
                                                                                                        {V4_type,
                                                                                                         _B70} =
                                                                                                            protocol:uint16(_B69),
                                                                                                        {V4_name,
                                                                                                         _B71} =
                                                                                                            protocol:uint32(_B70),
                                                                                                        {V4_flag,
                                                                                                         _B72} =
                                                                                                            protocol:uint32(_B71),
                                                                                                        {V4_val,
                                                                                                         _B73} =
                                                                                                            protocol:int32(_B72),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B73}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B81} =
                                                                                 protocol:array(_B75,
                                                                                                fun
                                                                                                    (_B76) ->
                                                                                                        {V4_name,
                                                                                                         _B77} =
                                                                                                            protocol:uint32(_B76),
                                                                                                        {V4_value,
                                                                                                         _B78} =
                                                                                                            protocol:uint32(_B77),
                                                                                                        {V4_str,
                                                                                                         _B79} =
                                                                                                            protocol:string(_B78),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B79}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_attr,
                                                                               V3_reset_attr,
                                                                               V3_extra},
                                                                              _B81}
                                                                     end),
                                                  {V2_grade_attr, _B90} =
                                                      protocol:array(_B83,
                                                                     fun
                                                                         (_B84) ->
                                                                             {V3_type,
                                                                              _B85} =
                                                                                 protocol:uint16(_B84),
                                                                             {V3_name,
                                                                              _B86} =
                                                                                 protocol:uint32(_B85),
                                                                             {V3_flag,
                                                                              _B87} =
                                                                                 protocol:uint32(_B86),
                                                                             {V3_val,
                                                                              _B88} =
                                                                                 protocol:int32(_B87),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B88}
                                                                     end),
                                                  {V2_break_times, _B91} =
                                                      protocol:uint8(_B90),
                                                  {V2_handbook_attr, _B96} =
                                                      protocol:array(_B91,
                                                                     fun
                                                                         (_B92) ->
                                                                             {V3_attr_name,
                                                                              _B93} =
                                                                                 protocol:uint32(_B92),
                                                                             {V3_attr_val,
                                                                              _B94} =
                                                                                 protocol:uint32(_B93),
                                                                             {{V3_attr_name,
                                                                               V3_attr_val},
                                                                              _B94}
                                                                     end),
                                                  {V2_handbook_num, _B97} =
                                                      protocol:uint8(_B96),
                                                  {V2_star_handbook_num, _B98} =
                                                      protocol:uint8(_B97),
                                                  {V2_use_skin, _B99} =
                                                      protocol:uint32(_B98),
                                                  {V2_has_skin, _B103} =
                                                      protocol:array(_B99,
                                                                     fun
                                                                         (_B100) ->
                                                                             {V3_skin_id,
                                                                              _B101} =
                                                                                 protocol:uint32(_B100),
                                                                             {{V3_skin_id},
                                                                              _B101}
                                                                     end),
                                                  {V2_spirit_attached, _B104} =
                                                      protocol:uint8(_B103),
                                                  {V2_spirit_attached_id,
                                                   _B105} =
                                                      protocol:uint32(_B104),
                                                  {V2_unreal, _B110} =
                                                      protocol:array(_B105,
                                                                     fun
                                                                         (_B106) ->
                                                                             {V3_item_id,
                                                                              _B107} =
                                                                                 protocol:uint32(_B106),
                                                                             {V3_timeout,
                                                                              _B108} =
                                                                                 protocol:uint32(_B107),
                                                                             {{V3_item_id,
                                                                               V3_timeout},
                                                                              _B108}
                                                                     end),
                                                  {V2_spirit_child_flag,
                                                   _B111} =
                                                      protocol:uint8(_B110),
                                                  {V2_child_id, _B112} =
                                                      protocol:uint32(_B111),
                                                  {V2_platform, _B113} =
                                                      protocol:string(_B112),
                                                  {V2_zone_id, _B114} =
                                                      protocol:uint16(_B113),
                                                  {V2_unreal_looks_flag,
                                                   _B115} =
                                                      protocol:uint8(_B114),
                                                  {V2_pet_rune, _B130} =
                                                      protocol:array(_B115,
                                                                     fun
                                                                         (_B116) ->
                                                                             {V3_rune_index,
                                                                              _B117} =
                                                                                 protocol:uint8(_B116),
                                                                             {V3_rune_type,
                                                                              _B118} =
                                                                                 protocol:uint8(_B117),
                                                                             {V3_rune_status,
                                                                              _B119} =
                                                                                 protocol:uint8(_B118),
                                                                             {V3_rune_id,
                                                                              _B120} =
                                                                                 protocol:uint32(_B119),
                                                                             {V3_rune_lev,
                                                                              _B121} =
                                                                                 protocol:uint8(_B120),
                                                                             {V3_is_resonance,
                                                                              _B122} =
                                                                                 protocol:uint8(_B121),
                                                                             {V3_resonances,
                                                                              _B128} =
                                                                                 protocol:array(_B122,
                                                                                                fun
                                                                                                    (_B123) ->
                                                                                                        {V4_resonance_index,
                                                                                                         _B124} =
                                                                                                            protocol:uint8(_B123),
                                                                                                        {V4_resonance_id,
                                                                                                         _B125} =
                                                                                                            protocol:uint32(_B124),
                                                                                                        {V4_rune_index,
                                                                                                         _B126} =
                                                                                                            protocol:uint8(_B125),
                                                                                                        {{V4_resonance_index,
                                                                                                          V4_resonance_id,
                                                                                                          V4_rune_index},
                                                                                                         _B126}
                                                                                                end),
                                                                             {{V3_rune_index,
                                                                               V3_rune_type,
                                                                               V3_rune_status,
                                                                               V3_rune_id,
                                                                               V3_rune_lev,
                                                                               V3_is_resonance,
                                                                               V3_resonances},
                                                                              _B128}
                                                                     end),
                                                  {{V2_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_exp,
                                                    V2_max_exp,
                                                    V2_status,
                                                    V2_base_id,
                                                    V2_happy,
                                                    V2_grade,
                                                    V2_talent,
                                                    V2_genre,
                                                    V2_growth,
                                                    V2_growth_type,
                                                    V2_hp,
                                                    V2_mp,
                                                    V2_feed_point,
                                                    V2_free_reset_flag,
                                                    V2_lock,
                                                    V2_hp_max,
                                                    V2_mp_max,
                                                    V2_atk_speed,
                                                    V2_phy_dmg,
                                                    V2_magic_dmg,
                                                    V2_phy_def,
                                                    V2_magic_def,
                                                    V2_strength,
                                                    V2_constitution,
                                                    V2_magic,
                                                    V2_agility,
                                                    V2_endurance,
                                                    V2_point,
                                                    V2_p_str,
                                                    V2_p_con,
                                                    V2_p_mag,
                                                    V2_p_agi,
                                                    V2_p_end,
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
                                                    V2_skills,
                                                    V2_stones,
                                                    V2_grade_attr,
                                                    V2_break_times,
                                                    V2_handbook_attr,
                                                    V2_handbook_num,
                                                    V2_star_handbook_num,
                                                    V2_use_skin,
                                                    V2_has_skin,
                                                    V2_spirit_attached,
                                                    V2_spirit_attached_id,
                                                    V2_unreal,
                                                    V2_spirit_child_flag,
                                                    V2_child_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_unreal_looks_flag,
                                                    V2_pet_rune},
                                                   _B130}
                                          end),
    {ok, {V1_pet_list}};
unpack(srv, 10505, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_item_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_item_flag}};
unpack(cli, 10505, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_genre, _B4} = protocol:uint8(_B3),
    {V1_wash_time, _B5} = protocol:uint16(_B4),
    {ok, {V1_flag, V1_msg, V1_id, V1_genre, V1_wash_time}};
unpack(srv, 10507, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_hole_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_item_id, V1_hole_id}};
unpack(cli, 10507, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10508, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_item_id}};
unpack(cli, 10508, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10509, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10509, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_grade, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_grade}};
unpack(srv, 10510, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_aptitude, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_aptitude}};
unpack(cli, 10510, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10511, _B0) -> {ok, {}};
unpack(cli, 10511, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_skills, _B7} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_id, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_source, _B4} =
                                                  protocol:uint8(_B3),
                                              {V2_is_lock, _B5} =
                                                  protocol:uint8(_B4),
                                              {{V2_id, V2_source, V2_is_lock},
                                               _B5}
                                      end),
    {ok, {V1_id, V1_skills}};
unpack(srv, 10512, _B0) -> {ok, {}};
unpack(cli, 10512, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_grade, _B2} = protocol:uint8(_B1),
    {V1_stones, _B27} = protocol:array(_B2,
                                       fun (_B3) ->
                                               {V2_id, _B4} =
                                                   protocol:uint32(_B3),
                                               {V2_base_id, _B5} =
                                                   protocol:uint32(_B4),
                                               {V2_attr, _B12} =
                                                   protocol:array(_B5,
                                                                  fun (_B6) ->
                                                                          {V3_type,
                                                                           _B7} =
                                                                              protocol:uint16(_B6),
                                                                          {V3_name,
                                                                           _B8} =
                                                                              protocol:uint32(_B7),
                                                                          {V3_flag,
                                                                           _B9} =
                                                                              protocol:uint32(_B8),
                                                                          {V3_val,
                                                                           _B10} =
                                                                              protocol:int32(_B9),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B10}
                                                                  end),
                                               {V2_reset_attr, _B19} =
                                                   protocol:array(_B12,
                                                                  fun (_B13) ->
                                                                          {V3_type,
                                                                           _B14} =
                                                                              protocol:uint16(_B13),
                                                                          {V3_name,
                                                                           _B15} =
                                                                              protocol:uint32(_B14),
                                                                          {V3_flag,
                                                                           _B16} =
                                                                              protocol:uint32(_B15),
                                                                          {V3_val,
                                                                           _B17} =
                                                                              protocol:int32(_B16),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B17}
                                                                  end),
                                               {V2_extra, _B25} =
                                                   protocol:array(_B19,
                                                                  fun (_B20) ->
                                                                          {V3_name,
                                                                           _B21} =
                                                                              protocol:uint32(_B20),
                                                                          {V3_value,
                                                                           _B22} =
                                                                              protocol:uint32(_B21),
                                                                          {V3_str,
                                                                           _B23} =
                                                                              protocol:string(_B22),
                                                                          {{V3_name,
                                                                            V3_value,
                                                                            V3_str},
                                                                           _B23}
                                                                  end),
                                               {{V2_id,
                                                 V2_base_id,
                                                 V2_attr,
                                                 V2_reset_attr,
                                                 V2_extra},
                                                _B25}
                                       end),
    {ok, {V1_id, V1_grade, V1_stones}};
unpack(srv, 10513, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_strength, _B2} = protocol:uint16(_B1),
    {V1_constitution, _B3} = protocol:uint16(_B2),
    {V1_magic, _B4} = protocol:uint16(_B3),
    {V1_agility, _B5} = protocol:uint16(_B4),
    {V1_endurance, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_id,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(cli, 10513, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10515, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_id}};
unpack(cli, 10515, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10516, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_lev}};
unpack(cli, 10516, _B0) ->
    {V1_rest, _B1} = protocol:uint8(_B0),
    {V1_pets, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_base_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_stock, _B4} =
                                                protocol:uint8(_B3),
                                            {{V2_base_id, V2_stock}, _B4}
                                    end),
    {V1_own_pets, _B11} = protocol:array(_B6,
                                         fun (_B7) ->
                                                 {V2_base_id, _B8} =
                                                     protocol:uint32(_B7),
                                                 {V2_stock, _B9} =
                                                     protocol:uint8(_B8),
                                                 {{V2_base_id, V2_stock}, _B9}
                                         end),
    {ok, {V1_rest, V1_pets, V1_own_pets}};
unpack(srv, 10517, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10517, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10518, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10518, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_id}};
unpack(srv, 10519, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_name}};
unpack(cli, 10519, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_msg, V1_id, V1_name}};
unpack(srv, 10520, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_strength, _B2} = protocol:uint16(_B1),
    {V1_constitution, _B3} = protocol:uint16(_B2),
    {V1_magic, _B4} = protocol:uint16(_B3),
    {V1_agility, _B5} = protocol:uint16(_B4),
    {V1_endurance, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_id,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(cli, 10520, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_pre_str, _B4} = protocol:uint16(_B3),
    {V1_pre_con, _B5} = protocol:uint16(_B4),
    {V1_pre_mag, _B6} = protocol:uint16(_B5),
    {V1_pre_agi, _B7} = protocol:uint16(_B6),
    {V1_pre_end, _B8} = protocol:uint16(_B7),
    {ok,
     {V1_id,
      V1_result,
      V1_msg,
      V1_pre_str,
      V1_pre_con,
      V1_pre_mag,
      V1_pre_agi,
      V1_pre_end}};
unpack(srv, 10521, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10521, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_pre_str, _B2} = protocol:uint16(_B1),
    {V1_pre_con, _B3} = protocol:uint16(_B2),
    {V1_pre_mag, _B4} = protocol:uint16(_B3),
    {V1_pre_agi, _B5} = protocol:uint16(_B4),
    {V1_pre_end, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_id,
      V1_pre_str,
      V1_pre_con,
      V1_pre_mag,
      V1_pre_agi,
      V1_pre_end}};
unpack(srv, 10522, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10522, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_result, V1_msg}};
unpack(srv, 10523, _B0) -> {ok, {}};
unpack(cli, 10523, _B0) ->
    {V1_pet_nums, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_pet_nums, V1_result, V1_msg}};
unpack(srv, 10524, _B0) ->
    {V1_genre, _B1} = protocol:uint8(_B0),
    {ok, {V1_genre}};
unpack(cli, 10524, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_base_id, V1_result, V1_msg}};
unpack(srv, 10525, _B0) -> {ok, {}};
unpack(cli, 10525, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hp, _B2} = protocol:uint32(_B1),
    {V1_mp, _B3} = protocol:uint32(_B2),
    {V1_hp_max, _B4} = protocol:uint32(_B3),
    {V1_mp_max, _B5} = protocol:uint32(_B4),
    {ok, {V1_id, V1_hp, V1_mp, V1_hp_max, V1_mp_max}};
unpack(srv, 10526, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10526, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10527, _B0) -> {ok, {}};
unpack(cli, 10527, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_fresh_id, _B3} = protocol:uint8(_B2),
    {V1_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_fresh_id, V1_time}};
unpack(srv, 10528, _B0) -> {ok, {}};
unpack(cli, 10528, _B0) ->
    {V1_pet_nums, _B1} = protocol:uint8(_B0),
    {V1_pet_list, _B119} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_name, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_lev, _B5} =
                                                      protocol:uint8(_B4),
                                                  {V2_exp, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_max_exp, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_base_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_happy, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_grade, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_talent, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_genre, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_growth, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_growth_type, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_hp, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_mp, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_feed_point, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_free_reset_flag, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_use_growth, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_hp_max, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_mp_max, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_atk_speed, _B22} =
                                                      protocol:uint16(_B21),
                                                  {V2_phy_dmg, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_magic_dmg, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_phy_def, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_magic_def, _B26} =
                                                      protocol:uint32(_B25),
                                                  {V2_strength, _B27} =
                                                      protocol:uint16(_B26),
                                                  {V2_constitution, _B28} =
                                                      protocol:uint16(_B27),
                                                  {V2_magic, _B29} =
                                                      protocol:uint16(_B28),
                                                  {V2_agility, _B30} =
                                                      protocol:uint16(_B29),
                                                  {V2_endurance, _B31} =
                                                      protocol:uint16(_B30),
                                                  {V2_point, _B32} =
                                                      protocol:uint16(_B31),
                                                  {V2_p_str, _B33} =
                                                      protocol:uint16(_B32),
                                                  {V2_p_con, _B34} =
                                                      protocol:uint16(_B33),
                                                  {V2_p_mag, _B35} =
                                                      protocol:uint16(_B34),
                                                  {V2_p_agi, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_p_end, _B37} =
                                                      protocol:uint16(_B36),
                                                  {V2_hp_aptitude, _B38} =
                                                      protocol:uint16(_B37),
                                                  {V2_phy_aptitude, _B39} =
                                                      protocol:uint16(_B38),
                                                  {V2_pdef_aptitude, _B40} =
                                                      protocol:uint16(_B39),
                                                  {V2_magic_aptitude, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_aspd_aptitude, _B42} =
                                                      protocol:uint16(_B41),
                                                  {V2_max_hp_aptitude, _B43} =
                                                      protocol:uint16(_B42),
                                                  {V2_max_phy_aptitude, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_max_pdef_aptitude, _B45} =
                                                      protocol:uint16(_B44),
                                                  {V2_max_magic_aptitude,
                                                   _B46} =
                                                      protocol:uint16(_B45),
                                                  {V2_max_aspd_aptitude, _B47} =
                                                      protocol:uint16(_B46),
                                                  {V2_skills, _B53} =
                                                      protocol:array(_B47,
                                                                     fun
                                                                         (_B48) ->
                                                                             {V3_id,
                                                                              _B49} =
                                                                                 protocol:uint32(_B48),
                                                                             {V3_source,
                                                                              _B50} =
                                                                                 protocol:uint8(_B49),
                                                                             {V3_is_lock,
                                                                              _B51} =
                                                                                 protocol:uint8(_B50),
                                                                             {{V3_id,
                                                                               V3_source,
                                                                               V3_is_lock},
                                                                              _B51}
                                                                     end),
                                                  {V2_stones, _B78} =
                                                      protocol:array(_B53,
                                                                     fun
                                                                         (_B54) ->
                                                                             {V3_id,
                                                                              _B55} =
                                                                                 protocol:uint32(_B54),
                                                                             {V3_base_id,
                                                                              _B56} =
                                                                                 protocol:uint32(_B55),
                                                                             {V3_attr,
                                                                              _B63} =
                                                                                 protocol:array(_B56,
                                                                                                fun
                                                                                                    (_B57) ->
                                                                                                        {V4_type,
                                                                                                         _B58} =
                                                                                                            protocol:uint16(_B57),
                                                                                                        {V4_name,
                                                                                                         _B59} =
                                                                                                            protocol:uint32(_B58),
                                                                                                        {V4_flag,
                                                                                                         _B60} =
                                                                                                            protocol:uint32(_B59),
                                                                                                        {V4_val,
                                                                                                         _B61} =
                                                                                                            protocol:int32(_B60),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B61}
                                                                                                end),
                                                                             {V3_reset_attr,
                                                                              _B70} =
                                                                                 protocol:array(_B63,
                                                                                                fun
                                                                                                    (_B64) ->
                                                                                                        {V4_type,
                                                                                                         _B65} =
                                                                                                            protocol:uint16(_B64),
                                                                                                        {V4_name,
                                                                                                         _B66} =
                                                                                                            protocol:uint32(_B65),
                                                                                                        {V4_flag,
                                                                                                         _B67} =
                                                                                                            protocol:uint32(_B66),
                                                                                                        {V4_val,
                                                                                                         _B68} =
                                                                                                            protocol:int32(_B67),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B68}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B76} =
                                                                                 protocol:array(_B70,
                                                                                                fun
                                                                                                    (_B71) ->
                                                                                                        {V4_name,
                                                                                                         _B72} =
                                                                                                            protocol:uint32(_B71),
                                                                                                        {V4_value,
                                                                                                         _B73} =
                                                                                                            protocol:uint32(_B72),
                                                                                                        {V4_str,
                                                                                                         _B74} =
                                                                                                            protocol:string(_B73),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B74}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_attr,
                                                                               V3_reset_attr,
                                                                               V3_extra},
                                                                              _B76}
                                                                     end),
                                                  {V2_grade_attr, _B85} =
                                                      protocol:array(_B78,
                                                                     fun
                                                                         (_B79) ->
                                                                             {V3_type,
                                                                              _B80} =
                                                                                 protocol:uint16(_B79),
                                                                             {V3_name,
                                                                              _B81} =
                                                                                 protocol:uint32(_B80),
                                                                             {V3_flag,
                                                                              _B82} =
                                                                                 protocol:uint32(_B81),
                                                                             {V3_val,
                                                                              _B83} =
                                                                                 protocol:int32(_B82),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B83}
                                                                     end),
                                                  {V2_use_skin, _B86} =
                                                      protocol:uint32(_B85),
                                                  {V2_has_skin, _B90} =
                                                      protocol:array(_B86,
                                                                     fun
                                                                         (_B87) ->
                                                                             {V3_skin_id,
                                                                              _B88} =
                                                                                 protocol:uint32(_B87),
                                                                             {{V3_skin_id},
                                                                              _B88}
                                                                     end),
                                                  {V2_spirit_attached, _B91} =
                                                      protocol:uint8(_B90),
                                                  {V2_spirit_attached_id,
                                                   _B92} =
                                                      protocol:uint32(_B91),
                                                  {V2_unreal, _B97} =
                                                      protocol:array(_B92,
                                                                     fun
                                                                         (_B93) ->
                                                                             {V3_item_id,
                                                                              _B94} =
                                                                                 protocol:uint32(_B93),
                                                                             {V3_timeout,
                                                                              _B95} =
                                                                                 protocol:uint32(_B94),
                                                                             {{V3_item_id,
                                                                               V3_timeout},
                                                                              _B95}
                                                                     end),
                                                  {V2_spirit_child_flag, _B98} =
                                                      protocol:uint8(_B97),
                                                  {V2_child_id, _B99} =
                                                      protocol:uint32(_B98),
                                                  {V2_platform, _B100} =
                                                      protocol:string(_B99),
                                                  {V2_zone_id, _B101} =
                                                      protocol:uint16(_B100),
                                                  {V2_unreal_looks_flag,
                                                   _B102} =
                                                      protocol:uint8(_B101),
                                                  {V2_pet_rune, _B117} =
                                                      protocol:array(_B102,
                                                                     fun
                                                                         (_B103) ->
                                                                             {V3_rune_index,
                                                                              _B104} =
                                                                                 protocol:uint8(_B103),
                                                                             {V3_rune_type,
                                                                              _B105} =
                                                                                 protocol:uint8(_B104),
                                                                             {V3_rune_status,
                                                                              _B106} =
                                                                                 protocol:uint8(_B105),
                                                                             {V3_rune_id,
                                                                              _B107} =
                                                                                 protocol:uint32(_B106),
                                                                             {V3_rune_lev,
                                                                              _B108} =
                                                                                 protocol:uint8(_B107),
                                                                             {V3_is_resonance,
                                                                              _B109} =
                                                                                 protocol:uint8(_B108),
                                                                             {V3_resonances,
                                                                              _B115} =
                                                                                 protocol:array(_B109,
                                                                                                fun
                                                                                                    (_B110) ->
                                                                                                        {V4_resonance_index,
                                                                                                         _B111} =
                                                                                                            protocol:uint8(_B110),
                                                                                                        {V4_resonance_id,
                                                                                                         _B112} =
                                                                                                            protocol:uint32(_B111),
                                                                                                        {V4_rune_index,
                                                                                                         _B113} =
                                                                                                            protocol:uint8(_B112),
                                                                                                        {{V4_resonance_index,
                                                                                                          V4_resonance_id,
                                                                                                          V4_rune_index},
                                                                                                         _B113}
                                                                                                end),
                                                                             {{V3_rune_index,
                                                                               V3_rune_type,
                                                                               V3_rune_status,
                                                                               V3_rune_id,
                                                                               V3_rune_lev,
                                                                               V3_is_resonance,
                                                                               V3_resonances},
                                                                              _B115}
                                                                     end),
                                                  {{V2_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_exp,
                                                    V2_max_exp,
                                                    V2_base_id,
                                                    V2_happy,
                                                    V2_grade,
                                                    V2_talent,
                                                    V2_genre,
                                                    V2_growth,
                                                    V2_growth_type,
                                                    V2_hp,
                                                    V2_mp,
                                                    V2_feed_point,
                                                    V2_free_reset_flag,
                                                    V2_use_growth,
                                                    V2_hp_max,
                                                    V2_mp_max,
                                                    V2_atk_speed,
                                                    V2_phy_dmg,
                                                    V2_magic_dmg,
                                                    V2_phy_def,
                                                    V2_magic_def,
                                                    V2_strength,
                                                    V2_constitution,
                                                    V2_magic,
                                                    V2_agility,
                                                    V2_endurance,
                                                    V2_point,
                                                    V2_p_str,
                                                    V2_p_con,
                                                    V2_p_mag,
                                                    V2_p_agi,
                                                    V2_p_end,
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
                                                    V2_skills,
                                                    V2_stones,
                                                    V2_grade_attr,
                                                    V2_use_skin,
                                                    V2_has_skin,
                                                    V2_spirit_attached,
                                                    V2_spirit_attached_id,
                                                    V2_unreal,
                                                    V2_spirit_child_flag,
                                                    V2_child_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_unreal_looks_flag,
                                                    V2_pet_rune},
                                                   _B117}
                                          end),
    {ok, {V1_pet_nums, V1_pet_list}};
unpack(srv, 10529, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10529, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10530, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10530, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10531, _B0) -> {ok, {}};
unpack(cli, 10531, _B0) ->
    {V1_pet_list, _B118} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_name, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_lev, _B4} =
                                                      protocol:uint8(_B3),
                                                  {V2_exp, _B5} =
                                                      protocol:uint32(_B4),
                                                  {V2_max_exp, _B6} =
                                                      protocol:uint32(_B5),
                                                  {V2_status, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_base_id, _B8} =
                                                      protocol:uint32(_B7),
                                                  {V2_happy, _B9} =
                                                      protocol:uint32(_B8),
                                                  {V2_grade, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_talent, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_genre, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_growth, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_growth_type, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_hp, _B15} =
                                                      protocol:uint32(_B14),
                                                  {V2_mp, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_feed_point, _B17} =
                                                      protocol:uint32(_B16),
                                                  {V2_free_reset_flag, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_hp_max, _B19} =
                                                      protocol:uint32(_B18),
                                                  {V2_mp_max, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_atk_speed, _B21} =
                                                      protocol:uint16(_B20),
                                                  {V2_phy_dmg, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_magic_dmg, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_phy_def, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_magic_def, _B25} =
                                                      protocol:uint32(_B24),
                                                  {V2_strength, _B26} =
                                                      protocol:uint16(_B25),
                                                  {V2_constitution, _B27} =
                                                      protocol:uint16(_B26),
                                                  {V2_magic, _B28} =
                                                      protocol:uint16(_B27),
                                                  {V2_agility, _B29} =
                                                      protocol:uint16(_B28),
                                                  {V2_endurance, _B30} =
                                                      protocol:uint16(_B29),
                                                  {V2_point, _B31} =
                                                      protocol:uint16(_B30),
                                                  {V2_p_str, _B32} =
                                                      protocol:uint16(_B31),
                                                  {V2_p_con, _B33} =
                                                      protocol:uint16(_B32),
                                                  {V2_p_mag, _B34} =
                                                      protocol:uint16(_B33),
                                                  {V2_p_agi, _B35} =
                                                      protocol:uint16(_B34),
                                                  {V2_p_end, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_hp_aptitude, _B37} =
                                                      protocol:uint16(_B36),
                                                  {V2_phy_aptitude, _B38} =
                                                      protocol:uint16(_B37),
                                                  {V2_pdef_aptitude, _B39} =
                                                      protocol:uint16(_B38),
                                                  {V2_magic_aptitude, _B40} =
                                                      protocol:uint16(_B39),
                                                  {V2_aspd_aptitude, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_max_hp_aptitude, _B42} =
                                                      protocol:uint16(_B41),
                                                  {V2_max_phy_aptitude, _B43} =
                                                      protocol:uint16(_B42),
                                                  {V2_max_pdef_aptitude, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_max_magic_aptitude,
                                                   _B45} =
                                                      protocol:uint16(_B44),
                                                  {V2_max_aspd_aptitude, _B46} =
                                                      protocol:uint16(_B45),
                                                  {V2_skills, _B52} =
                                                      protocol:array(_B46,
                                                                     fun
                                                                         (_B47) ->
                                                                             {V3_id,
                                                                              _B48} =
                                                                                 protocol:uint32(_B47),
                                                                             {V3_source,
                                                                              _B49} =
                                                                                 protocol:uint8(_B48),
                                                                             {V3_is_lock,
                                                                              _B50} =
                                                                                 protocol:uint8(_B49),
                                                                             {{V3_id,
                                                                               V3_source,
                                                                               V3_is_lock},
                                                                              _B50}
                                                                     end),
                                                  {V2_stones, _B77} =
                                                      protocol:array(_B52,
                                                                     fun
                                                                         (_B53) ->
                                                                             {V3_id,
                                                                              _B54} =
                                                                                 protocol:uint32(_B53),
                                                                             {V3_base_id,
                                                                              _B55} =
                                                                                 protocol:uint32(_B54),
                                                                             {V3_attr,
                                                                              _B62} =
                                                                                 protocol:array(_B55,
                                                                                                fun
                                                                                                    (_B56) ->
                                                                                                        {V4_type,
                                                                                                         _B57} =
                                                                                                            protocol:uint16(_B56),
                                                                                                        {V4_name,
                                                                                                         _B58} =
                                                                                                            protocol:uint32(_B57),
                                                                                                        {V4_flag,
                                                                                                         _B59} =
                                                                                                            protocol:uint32(_B58),
                                                                                                        {V4_val,
                                                                                                         _B60} =
                                                                                                            protocol:int32(_B59),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B60}
                                                                                                end),
                                                                             {V3_reset_attr,
                                                                              _B69} =
                                                                                 protocol:array(_B62,
                                                                                                fun
                                                                                                    (_B63) ->
                                                                                                        {V4_type,
                                                                                                         _B64} =
                                                                                                            protocol:uint16(_B63),
                                                                                                        {V4_name,
                                                                                                         _B65} =
                                                                                                            protocol:uint32(_B64),
                                                                                                        {V4_flag,
                                                                                                         _B66} =
                                                                                                            protocol:uint32(_B65),
                                                                                                        {V4_val,
                                                                                                         _B67} =
                                                                                                            protocol:int32(_B66),
                                                                                                        {{V4_type,
                                                                                                          V4_name,
                                                                                                          V4_flag,
                                                                                                          V4_val},
                                                                                                         _B67}
                                                                                                end),
                                                                             {V3_extra,
                                                                              _B75} =
                                                                                 protocol:array(_B69,
                                                                                                fun
                                                                                                    (_B70) ->
                                                                                                        {V4_name,
                                                                                                         _B71} =
                                                                                                            protocol:uint32(_B70),
                                                                                                        {V4_value,
                                                                                                         _B72} =
                                                                                                            protocol:uint32(_B71),
                                                                                                        {V4_str,
                                                                                                         _B73} =
                                                                                                            protocol:string(_B72),
                                                                                                        {{V4_name,
                                                                                                          V4_value,
                                                                                                          V4_str},
                                                                                                         _B73}
                                                                                                end),
                                                                             {{V3_id,
                                                                               V3_base_id,
                                                                               V3_attr,
                                                                               V3_reset_attr,
                                                                               V3_extra},
                                                                              _B75}
                                                                     end),
                                                  {V2_grade_attr, _B84} =
                                                      protocol:array(_B77,
                                                                     fun
                                                                         (_B78) ->
                                                                             {V3_type,
                                                                              _B79} =
                                                                                 protocol:uint16(_B78),
                                                                             {V3_name,
                                                                              _B80} =
                                                                                 protocol:uint32(_B79),
                                                                             {V3_flag,
                                                                              _B81} =
                                                                                 protocol:uint32(_B80),
                                                                             {V3_val,
                                                                              _B82} =
                                                                                 protocol:int32(_B81),
                                                                             {{V3_type,
                                                                               V3_name,
                                                                               V3_flag,
                                                                               V3_val},
                                                                              _B82}
                                                                     end),
                                                  {V2_use_skin, _B85} =
                                                      protocol:uint32(_B84),
                                                  {V2_has_skin, _B89} =
                                                      protocol:array(_B85,
                                                                     fun
                                                                         (_B86) ->
                                                                             {V3_skin_id,
                                                                              _B87} =
                                                                                 protocol:uint32(_B86),
                                                                             {{V3_skin_id},
                                                                              _B87}
                                                                     end),
                                                  {V2_spirit_attached, _B90} =
                                                      protocol:uint8(_B89),
                                                  {V2_spirit_attached_id,
                                                   _B91} =
                                                      protocol:uint32(_B90),
                                                  {V2_unreal, _B96} =
                                                      protocol:array(_B91,
                                                                     fun
                                                                         (_B92) ->
                                                                             {V3_item_id,
                                                                              _B93} =
                                                                                 protocol:uint32(_B92),
                                                                             {V3_timeout,
                                                                              _B94} =
                                                                                 protocol:uint32(_B93),
                                                                             {{V3_item_id,
                                                                               V3_timeout},
                                                                              _B94}
                                                                     end),
                                                  {V2_spirit_child_flag, _B97} =
                                                      protocol:uint8(_B96),
                                                  {V2_child_id, _B98} =
                                                      protocol:uint32(_B97),
                                                  {V2_platform, _B99} =
                                                      protocol:string(_B98),
                                                  {V2_zone_id, _B100} =
                                                      protocol:uint16(_B99),
                                                  {V2_unreal_looks_flag,
                                                   _B101} =
                                                      protocol:uint8(_B100),
                                                  {V2_pet_rune, _B116} =
                                                      protocol:array(_B101,
                                                                     fun
                                                                         (_B102) ->
                                                                             {V3_rune_index,
                                                                              _B103} =
                                                                                 protocol:uint8(_B102),
                                                                             {V3_rune_type,
                                                                              _B104} =
                                                                                 protocol:uint8(_B103),
                                                                             {V3_rune_status,
                                                                              _B105} =
                                                                                 protocol:uint8(_B104),
                                                                             {V3_rune_id,
                                                                              _B106} =
                                                                                 protocol:uint32(_B105),
                                                                             {V3_rune_lev,
                                                                              _B107} =
                                                                                 protocol:uint8(_B106),
                                                                             {V3_is_resonance,
                                                                              _B108} =
                                                                                 protocol:uint8(_B107),
                                                                             {V3_resonances,
                                                                              _B114} =
                                                                                 protocol:array(_B108,
                                                                                                fun
                                                                                                    (_B109) ->
                                                                                                        {V4_resonance_index,
                                                                                                         _B110} =
                                                                                                            protocol:uint8(_B109),
                                                                                                        {V4_resonance_id,
                                                                                                         _B111} =
                                                                                                            protocol:uint32(_B110),
                                                                                                        {V4_rune_index,
                                                                                                         _B112} =
                                                                                                            protocol:uint8(_B111),
                                                                                                        {{V4_resonance_index,
                                                                                                          V4_resonance_id,
                                                                                                          V4_rune_index},
                                                                                                         _B112}
                                                                                                end),
                                                                             {{V3_rune_index,
                                                                               V3_rune_type,
                                                                               V3_rune_status,
                                                                               V3_rune_id,
                                                                               V3_rune_lev,
                                                                               V3_is_resonance,
                                                                               V3_resonances},
                                                                              _B114}
                                                                     end),
                                                  {{V2_id,
                                                    V2_name,
                                                    V2_lev,
                                                    V2_exp,
                                                    V2_max_exp,
                                                    V2_status,
                                                    V2_base_id,
                                                    V2_happy,
                                                    V2_grade,
                                                    V2_talent,
                                                    V2_genre,
                                                    V2_growth,
                                                    V2_growth_type,
                                                    V2_hp,
                                                    V2_mp,
                                                    V2_feed_point,
                                                    V2_free_reset_flag,
                                                    V2_hp_max,
                                                    V2_mp_max,
                                                    V2_atk_speed,
                                                    V2_phy_dmg,
                                                    V2_magic_dmg,
                                                    V2_phy_def,
                                                    V2_magic_def,
                                                    V2_strength,
                                                    V2_constitution,
                                                    V2_magic,
                                                    V2_agility,
                                                    V2_endurance,
                                                    V2_point,
                                                    V2_p_str,
                                                    V2_p_con,
                                                    V2_p_mag,
                                                    V2_p_agi,
                                                    V2_p_end,
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
                                                    V2_skills,
                                                    V2_stones,
                                                    V2_grade_attr,
                                                    V2_use_skin,
                                                    V2_has_skin,
                                                    V2_spirit_attached,
                                                    V2_spirit_attached_id,
                                                    V2_unreal,
                                                    V2_spirit_child_flag,
                                                    V2_child_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_unreal_looks_flag,
                                                    V2_pet_rune},
                                                   _B116}
                                          end),
    {ok, {V1_pet_list}};
unpack(srv, 10532, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10532, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_result, V1_msg}};
unpack(srv, 10533, _B0) -> {ok, {}};
unpack(cli, 10533, _B0) ->
    {V1_pet_nums, _B1} = protocol:uint8(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_pet_nums, V1_result, V1_msg}};
unpack(srv, 10534, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10534, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_pay_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_result, V1_msg, V1_pay_flag}};
unpack(srv, 10535, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10535, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_combat_talk, _B6} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_type, _B3} =
                                                       protocol:uint8(_B2),
                                                   {V2_msg, _B4} =
                                                       protocol:string(_B3),
                                                   {{V2_type, V2_msg}, _B4}
                                           end),
    {ok, {V1_id, V1_combat_talk}};
unpack(srv, 10536, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_id, V1_type, V1_msg}};
unpack(cli, 10536, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_reason, _B3} = protocol:string(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok, {V1_id, V1_result, V1_reason, V1_type, V1_msg}};
unpack(srv, 10537, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10537, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_op_code, V1_id, V1_msg}};
unpack(srv, 10538, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10538, _B0) ->
    {V1_op_code, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_op_code, V1_id, V1_msg}};
unpack(srv, 10539, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_base_id}};
unpack(cli, 10539, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_result, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_base_id, V1_result, V1_msg}};
unpack(srv, 10540, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10540, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10541, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pet_id, V1_item_id}};
unpack(cli, 10541, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_pet_id, _B2} = protocol:uint32(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_pet_id, V1_item_id}};
unpack(srv, 10542, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pet_id, V1_item_id}};
unpack(cli, 10542, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_pet_id, _B2} = protocol:uint32(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_pet_id, V1_item_id}};
unpack(srv, 10543, _B0) -> {ok, {}};
unpack(cli, 10543, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_num}};
unpack(srv, 10544, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_stone_id, _B2} = protocol:uint32(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_pet_id, V1_stone_id, V1_item_id}};
unpack(cli, 10544, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10545, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10545, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_base_id, V1_result, V1_msg}};
unpack(srv, 10546, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_base_id}};
unpack(cli, 10546, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10547, _B0) -> {ok, {}};
unpack(cli, 10547, _B0) ->
    {V1_pet_base_id, _B1} = protocol:uint32(_B0),
    {V1_genre, _B2} = protocol:uint8(_B1),
    {ok, {V1_pet_base_id, V1_genre}};
unpack(srv, 10548, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_id_sub, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_id_sub}};
unpack(cli, 10548, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10549, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10549, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_moon, _B3} = protocol:uint16(_B2),
    {V1_sun, _B4} = protocol:uint16(_B3),
    {ok, {V1_result, V1_msg, V1_moon, V1_sun}};
unpack(srv, 10550, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10550, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 10551, _B0) -> {ok, {}};
unpack(cli, 10551, _B0) ->
    {V1_moon, _B1} = protocol:uint16(_B0),
    {V1_sun, _B2} = protocol:uint16(_B1),
    {ok, {V1_moon, V1_sun}};
unpack(srv, 10552, _B0) -> {ok, {}};
unpack(cli, 10552, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10553, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_skill_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_skill_id}};
unpack(cli, 10553, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10554, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10554, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10555, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10555, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_valid, _B2} = protocol:uint8(_B1),
    {V1_tmp_genre, _B3} = protocol:uint8(_B2),
    {V1_point, _B4} = protocol:uint16(_B3),
    {V1_p_str, _B5} = protocol:uint16(_B4),
    {V1_p_con, _B6} = protocol:uint16(_B5),
    {V1_p_mag, _B7} = protocol:uint16(_B6),
    {V1_p_agi, _B8} = protocol:uint16(_B7),
    {V1_p_end, _B9} = protocol:uint16(_B8),
    {V1_hp_aptitude, _B10} = protocol:uint16(_B9),
    {V1_phy_aptitude, _B11} = protocol:uint16(_B10),
    {V1_pdef_aptitude, _B12} = protocol:uint16(_B11),
    {V1_magic_aptitude, _B13} = protocol:uint16(_B12),
    {V1_aspd_aptitude, _B14} = protocol:uint16(_B13),
    {V1_max_hp_aptitude, _B15} = protocol:uint16(_B14),
    {V1_max_phy_aptitude, _B16} = protocol:uint16(_B15),
    {V1_max_pdef_aptitude, _B17} = protocol:uint16(_B16),
    {V1_max_magic_aptitude, _B18} = protocol:uint16(_B17),
    {V1_max_aspd_aptitude, _B19} = protocol:uint16(_B18),
    {V1_tmp_skills, _B25} = protocol:array(_B19,
                                           fun (_B20) ->
                                                   {V2_id, _B21} =
                                                       protocol:uint32(_B20),
                                                   {V2_source, _B22} =
                                                       protocol:uint8(_B21),
                                                   {V2_is_lock, _B23} =
                                                       protocol:uint8(_B22),
                                                   {{V2_id,
                                                     V2_source,
                                                     V2_is_lock},
                                                    _B23}
                                           end),
    {V1_tmp_growth, _B26} = protocol:uint16(_B25),
    {V1_tmp_growth_type, _B27} = protocol:uint8(_B26),
    {V1_tmp_happy, _B28} = protocol:uint32(_B27),
    {V1_talent, _B29} = protocol:uint16(_B28),
    {ok,
     {V1_id,
      V1_is_valid,
      V1_tmp_genre,
      V1_point,
      V1_p_str,
      V1_p_con,
      V1_p_mag,
      V1_p_agi,
      V1_p_end,
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
      V1_tmp_skills,
      V1_tmp_growth,
      V1_tmp_growth_type,
      V1_tmp_happy,
      V1_talent}};
unpack(srv, 10556, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 10556, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10557, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_skin_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_skin_id}};
unpack(cli, 10557, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10558, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_skin_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_skin_id}};
unpack(cli, 10558, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10559, _B0) -> {ok, {}};
unpack(cli, 10559, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_use_skin, _B2} = protocol:uint32(_B1),
    {V1_has_skin, _B6} = protocol:array(_B2,
                                        fun (_B3) ->
                                                {V2_skin_id, _B4} =
                                                    protocol:uint32(_B3),
                                                {{V2_skin_id}, _B4}
                                        end),
    {ok, {V1_id, V1_use_skin, V1_has_skin}};
unpack(srv, 10560, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 10560, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_base_id, V1_flag, V1_msg}};
unpack(srv, 10561, _B0) ->
    {V1_master_pet_id, _B1} = protocol:uint32(_B0),
    {V1_attach_pet_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_master_pet_id, V1_attach_pet_id}};
unpack(cli, 10561, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10562, _B0) ->
    {V1_attach_pet_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_attach_pet_id}};
unpack(cli, 10562, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10563, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10563, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_attr, _B8} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_type, _B3} =
                                                protocol:uint16(_B2),
                                            {V2_name, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_flag, _B5} =
                                                protocol:uint32(_B4),
                                            {V2_val, _B6} = protocol:int32(_B5),
                                            {{V2_type,
                                              V2_name,
                                              V2_flag,
                                              V2_val},
                                             _B6}
                                    end),
    {ok, {V1_id, V1_attr}};
unpack(srv, 10564, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10564, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10565, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pet_id, V1_item_id}};
unpack(cli, 10565, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10566, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_id_sub, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_id_sub}};
unpack(cli, 10566, _B0) ->
    {V1_attr, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_type, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_value, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_type, V2_value}, _B3}
                                    end),
    {ok, {V1_attr}};
unpack(srv, 10567, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 10567, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_extra_attr, _B17} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_type, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_hp_max, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_mp_max, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_atk_speed, _B6} =
                                                       protocol:uint16(_B5),
                                                   {V2_phy_dmg, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_magic_dmg, _B8} =
                                                       protocol:uint32(_B7),
                                                   {V2_phy_def, _B9} =
                                                       protocol:uint32(_B8),
                                                   {V2_magic_def, _B10} =
                                                       protocol:uint32(_B9),
                                                   {V2_strength, _B11} =
                                                       protocol:uint16(_B10),
                                                   {V2_constitution, _B12} =
                                                       protocol:uint16(_B11),
                                                   {V2_magic, _B13} =
                                                       protocol:uint16(_B12),
                                                   {V2_agility, _B14} =
                                                       protocol:uint16(_B13),
                                                   {V2_endurance, _B15} =
                                                       protocol:uint16(_B14),
                                                   {{V2_type,
                                                     V2_hp_max,
                                                     V2_mp_max,
                                                     V2_atk_speed,
                                                     V2_phy_dmg,
                                                     V2_magic_dmg,
                                                     V2_phy_def,
                                                     V2_magic_def,
                                                     V2_strength,
                                                     V2_constitution,
                                                     V2_magic,
                                                     V2_agility,
                                                     V2_endurance},
                                                    _B15}
                                           end),
    {ok, {V1_id, V1_extra_attr}};
unpack(srv, 10568, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_hole_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_base_id, V1_hole_id}};
unpack(cli, 10568, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10569, _B0) -> {ok, {}};
unpack(cli, 10569, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10570, _B0) -> {ok, {}};
unpack(cli, 10570, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pet_id, _B3} = protocol:uint32(_B2),
    {V1_reward, _B9} = protocol:array(_B3,
                                      fun (_B4) ->
                                              {V2_item_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_num, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_spec_effects, _B7} =
                                                  protocol:uint32(_B6),
                                              {{V2_item_id,
                                                V2_num,
                                                V2_spec_effects},
                                               _B7}
                                      end),
    {ok, {V1_flag, V1_msg, V1_pet_id, V1_reward}};
unpack(srv, 10571, _B0) -> {ok, {}};
unpack(cli, 10571, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10572, _B0) -> {ok, {}};
unpack(cli, 10572, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {ok, {V1_flag, V1_times}};
unpack(srv, 10573, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_skill_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pet_id, V1_skill_id}};
unpack(cli, 10573, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10574, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_unreal_flag, _B2} = protocol:uint32(_B1),
    {ok, {V1_pet_id, V1_unreal_flag}};
unpack(cli, 10574, _B0) -> {ok, {}};
unpack(srv, 10575, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_rune_index, _B2} = protocol:uint8(_B1),
    {V1_rune_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_pet_id, V1_rune_index, V1_rune_id}};
unpack(cli, 10575, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rune_index, _B3} = protocol:uint8(_B2),
    {V1_rune_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_rune_index, V1_rune_id}};
unpack(srv, 10576, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_rune_index, _B2} = protocol:uint8(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_pet_id, V1_rune_index, V1_type}};
unpack(cli, 10576, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10577, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_rune_index, _B2} = protocol:uint8(_B1),
    {ok, {V1_pet_id, V1_rune_index}};
unpack(cli, 10577, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10578, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_resonance_index, _B2} = protocol:uint8(_B1),
    {ok, {V1_pet_id, V1_resonance_index}};
unpack(cli, 10578, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_resonance_index, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_resonance_index}};
unpack(srv, 10579, _B0) -> {ok, {}};
unpack(cli, 10579, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_pet_rune, _B16} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_rune_index, _B3} =
                                                     protocol:uint8(_B2),
                                                 {V2_rune_type, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_rune_status, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_rune_id, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_rune_lev, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_is_resonance, _B8} =
                                                     protocol:uint8(_B7),
                                                 {V2_resonances, _B14} =
                                                     protocol:array(_B8,
                                                                    fun (_B9) ->
                                                                            {V3_resonance_index,
                                                                             _B10} =
                                                                                protocol:uint8(_B9),
                                                                            {V3_resonance_id,
                                                                             _B11} =
                                                                                protocol:uint32(_B10),
                                                                            {V3_rune_index,
                                                                             _B12} =
                                                                                protocol:uint8(_B11),
                                                                            {{V3_resonance_index,
                                                                              V3_resonance_id,
                                                                              V3_rune_index},
                                                                             _B12}
                                                                    end),
                                                 {{V2_rune_index,
                                                   V2_rune_type,
                                                   V2_rune_status,
                                                   V2_rune_id,
                                                   V2_rune_lev,
                                                   V2_is_resonance,
                                                   V2_resonances},
                                                  _B14}
                                         end),
    {ok, {V1_id, V1_pet_rune}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

