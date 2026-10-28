-file("src/proto/proto_194.erl", 1).

-module(proto_194).

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

-file("src/proto/proto_194.erl", 14).

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

-file("src/proto/proto_194.erl", 15).

-file("inc/review.hrl", 1).

-record(review,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         type = 1 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         pro = 0 :: non_neg_integer(),
         con = 0 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer(),
         pets = [],
         guards = []}).

-record(review_index,
        {key = {0, 0} :: tuple(),
         ids = [] :: list(),
         hots = [] :: list()}).

-record(review_report,
        {id = {0, "", 0},
         rid = {0, "", 0},
         type = 0,
         base_id = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-file("src/proto/proto_194.erl", 16).

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

-file("src/proto/proto_194.erl", 17).

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

-file("src/proto/proto_194.erl", 18).

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

-file("src/proto/proto_194.erl", 19).

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

-file("src/proto/proto_194.erl", 20).

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

-file("src/proto/proto_194.erl", 21).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19400, {V0_type, V0_base_id, V0_page}) ->
    D_a_t_a = <<V0_type:8/little, V0_base_id:32/little,
                V0_page:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19400:16/little,
       D_a_t_a/binary>>};
pack(srv, 19400,
     {V0_type, V0_base_id, V0_page, V0_review}) ->
    D_a_t_a = <<V0_type:8/little, V0_base_id:32/little,
                V0_page:8/little, (length(V0_review)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little, V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string, V1_content))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little, V1_pro:32/little,
                                   V1_con:32/little,
                                   (length(V1_pets)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name))/binary>>
                                                    || #pet{name = V2_name}
                                                           <- V1_pets]))/binary,
                                   (length(V1_guards)):16/little,
                                   (list_to_binary([<<(protocol:pack(string,
                                                                     V2_name))/binary>>
                                                    || #guard{name = V2_name}
                                                           <- V1_guards]))/binary>>
                                 || #review{id =
                                                {V1_m_id,
                                                 V1_m_platform,
                                                 V1_m_zone_id},
                                            rid =
                                                {V1_role_id,
                                                 V1_platform,
                                                 V1_zone_id},
                                            name = V1_name,
                                            content = V1_content, sex = V1_sex,
                                            classes = V1_classes,
                                            ctime = V1_ctime, pro = V1_pro,
                                            con = V1_con, pets = V1_pets,
                                            guards = V1_guards}
                                        <- V0_review]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19400:16/little,
       D_a_t_a/binary>>};
pack(cli, 19401,
     {V0_type, V0_base_id, V0_content, V0_ids}) ->
    D_a_t_a = <<V0_type:8/little, V0_base_id:32/little,
                (protocol:pack(string, V0_content))/binary,
                (length(V0_ids)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19401:16/little,
       D_a_t_a/binary>>};
pack(srv, 19401,
     {V0_result,
      V0_msg,
      {V0_m_id, V0_m_platform, V0_m_zone_id}}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19401:16/little,
       D_a_t_a/binary>>};
pack(cli, 19402, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19402:16/little,
       D_a_t_a/binary>>};
pack(srv, 19402,
     {V0_flag,
      V0_msg,
      {V0_m_id, V0_m_platform, V0_m_zone_id},
      V0_pro}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_pro:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19402:16/little,
       D_a_t_a/binary>>};
pack(cli, 19403, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19403:16/little,
       D_a_t_a/binary>>};
pack(srv, 19403,
     {V0_flag,
      V0_msg,
      {V0_m_id, V0_m_platform, V0_m_zone_id},
      V0_con}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_con:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19403:16/little,
       D_a_t_a/binary>>};
pack(cli, 19404, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19404:16/little,
       D_a_t_a/binary>>};
pack(srv, 19404, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19404:16/little,
       D_a_t_a/binary>>};
pack(cli, 19405, {}) ->
    {ok, <<2:32/little, 19405:16/little>>};
pack(srv, 19405, {V0_voted, V0_posted}) ->
    D_a_t_a = <<(length(V0_voted)):16/little,
                (list_to_binary([<<V1_m_id:32/little,
                                   (protocol:pack(string,
                                                  V1_m_platform))/binary,
                                   V1_m_zone_id:16/little,
                                   V1_vote_type:8/little>>
                                 || {{V1_m_id, V1_m_platform, V1_m_zone_id},
                                     V1_vote_type}
                                        <- V0_voted]))/binary,
                (length(V0_posted)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_base_id:32/little>>
                                 || {V1_type, V1_base_id}
                                        <- V0_posted]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19405:16/little,
       D_a_t_a/binary>>};
pack(cli, 19406,
     {V0_m_id, V0_platform, V0_zone_id, V0_id}) ->
    D_a_t_a = <<V0_m_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19406:16/little,
       D_a_t_a/binary>>};
pack(srv, 19406,
     {{V0_m_id, V0_m_platform, V0_m_zone_id},
      #pet{id = V0_id, name = V0_name, lev = V0_lev,
           base_id = V0_base_id, happy = V0_happy,
           grade = V0_grade, talent = V0_talent, genre = V0_genre,
           growth = V0_growth, growth_type = V0_growth_type,
           hp = V0_hp, mp = V0_mp, feed_point = V0_feed_point,
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
           pet_rune = V0_pet_rune}}) ->
    D_a_t_a = <<V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_id:32/little,
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
                V0_use_skin:32/little, (length(V0_pet_rune)):16/little,
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
     <<(byte_size(D_a_t_a) + 2):32/little, 19406:16/little,
       D_a_t_a/binary>>};
pack(cli, 19407, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19407:16/little,
       D_a_t_a/binary>>};
pack(srv, 19407,
     {{V0_m_id, V0_m_platform, V0_m_zone_id},
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
    D_a_t_a = <<V0_m_id:32/little,
                (protocol:pack(string, V0_m_platform))/binary,
                V0_m_zone_id:16/little, V0_base_id:32/little,
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
     <<(byte_size(D_a_t_a) + 2):32/little, 19407:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19400, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_base_id, V1_page}};
unpack(cli, 19400, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_review, _B27} = protocol:array(_B3,
                                       fun (_B4) ->
                                               {V2_m_id, _B5} =
                                                   protocol:uint32(_B4),
                                               {V2_m_platform, _B6} =
                                                   protocol:string(_B5),
                                               {V2_m_zone_id, _B7} =
                                                   protocol:uint16(_B6),
                                               {V2_role_id, _B8} =
                                                   protocol:uint32(_B7),
                                               {V2_platform, _B9} =
                                                   protocol:string(_B8),
                                               {V2_zone_id, _B10} =
                                                   protocol:uint16(_B9),
                                               {V2_name, _B11} =
                                                   protocol:string(_B10),
                                               {V2_content, _B12} =
                                                   protocol:string(_B11),
                                               {V2_sex, _B13} =
                                                   protocol:uint8(_B12),
                                               {V2_classes, _B14} =
                                                   protocol:uint8(_B13),
                                               {V2_ctime, _B15} =
                                                   protocol:uint32(_B14),
                                               {V2_pro, _B16} =
                                                   protocol:uint32(_B15),
                                               {V2_con, _B17} =
                                                   protocol:uint32(_B16),
                                               {V2_pets, _B21} =
                                                   protocol:array(_B17,
                                                                  fun (_B18) ->
                                                                          {V3_name,
                                                                           _B19} =
                                                                              protocol:string(_B18),
                                                                          {{V3_name},
                                                                           _B19}
                                                                  end),
                                               {V2_guards, _B25} =
                                                   protocol:array(_B21,
                                                                  fun (_B22) ->
                                                                          {V3_name,
                                                                           _B23} =
                                                                              protocol:string(_B22),
                                                                          {{V3_name},
                                                                           _B23}
                                                                  end),
                                               {{V2_m_id,
                                                 V2_m_platform,
                                                 V2_m_zone_id,
                                                 V2_role_id,
                                                 V2_platform,
                                                 V2_zone_id,
                                                 V2_name,
                                                 V2_content,
                                                 V2_sex,
                                                 V2_classes,
                                                 V2_ctime,
                                                 V2_pro,
                                                 V2_con,
                                                 V2_pets,
                                                 V2_guards},
                                                _B25}
                                       end),
    {ok, {V1_type, V1_base_id, V1_page, V1_review}};
unpack(srv, 19401, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_content, _B3} = protocol:string(_B2),
    {V1_ids, _B7} = protocol:array(_B3,
                                   fun (_B4) ->
                                           {V2_id, _B5} = protocol:uint32(_B4),
                                           {{V2_id}, _B5}
                                   end),
    {ok, {V1_type, V1_base_id, V1_content, V1_ids}};
unpack(cli, 19401, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_m_id, _B3} = protocol:uint32(_B2),
    {V1_m_platform, _B4} = protocol:string(_B3),
    {V1_m_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_result,
      V1_msg,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id}};
unpack(srv, 19402, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19402, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_m_id, _B3} = protocol:uint32(_B2),
    {V1_m_platform, _B4} = protocol:string(_B3),
    {V1_m_zone_id, _B5} = protocol:uint16(_B4),
    {V1_pro, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_flag,
      V1_msg,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
      V1_pro}};
unpack(srv, 19403, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19403, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_m_id, _B3} = protocol:uint32(_B2),
    {V1_m_platform, _B4} = protocol:string(_B3),
    {V1_m_zone_id, _B5} = protocol:uint16(_B4),
    {V1_con, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_flag,
      V1_msg,
      V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
      V1_con}};
unpack(srv, 19404, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19404, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19405, _B0) -> {ok, {}};
unpack(cli, 19405, _B0) ->
    {V1_voted, _B7} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_m_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_m_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_m_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_vote_type, _B5} =
                                                 protocol:uint8(_B4),
                                             {{V2_m_id,
                                               V2_m_platform,
                                               V2_m_zone_id,
                                               V2_vote_type},
                                              _B5}
                                     end),
    {V1_posted, _B12} = protocol:array(_B7,
                                       fun (_B8) ->
                                               {V2_type, _B9} =
                                                   protocol:uint8(_B8),
                                               {V2_base_id, _B10} =
                                                   protocol:uint32(_B9),
                                               {{V2_type, V2_base_id}, _B10}
                                       end),
    {ok, {V1_voted, V1_posted}};
unpack(srv, 19406, _B0) ->
    {V1_m_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_m_id, V1_platform, V1_zone_id, V1_id}};
unpack(cli, 19406, _B0) ->
    {V1_m_id, _B1} = protocol:uint32(_B0),
    {V1_m_platform, _B2} = protocol:string(_B1),
    {V1_m_zone_id, _B3} = protocol:uint16(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_base_id, _B7} = protocol:uint32(_B6),
    {V1_happy, _B8} = protocol:uint8(_B7),
    {V1_grade, _B9} = protocol:uint8(_B8),
    {V1_talent, _B10} = protocol:uint16(_B9),
    {V1_genre, _B11} = protocol:uint8(_B10),
    {V1_growth, _B12} = protocol:uint16(_B11),
    {V1_growth_type, _B13} = protocol:uint8(_B12),
    {V1_hp, _B14} = protocol:uint32(_B13),
    {V1_mp, _B15} = protocol:uint32(_B14),
    {V1_feed_point, _B16} = protocol:uint32(_B15),
    {V1_hp_max, _B17} = protocol:uint32(_B16),
    {V1_mp_max, _B18} = protocol:uint32(_B17),
    {V1_atk_speed, _B19} = protocol:uint16(_B18),
    {V1_phy_dmg, _B20} = protocol:uint32(_B19),
    {V1_magic_dmg, _B21} = protocol:uint32(_B20),
    {V1_phy_def, _B22} = protocol:uint32(_B21),
    {V1_magic_def, _B23} = protocol:uint32(_B22),
    {V1_hp_aptitude, _B24} = protocol:uint16(_B23),
    {V1_phy_aptitude, _B25} = protocol:uint16(_B24),
    {V1_pdef_aptitude, _B26} = protocol:uint16(_B25),
    {V1_magic_aptitude, _B27} = protocol:uint16(_B26),
    {V1_aspd_aptitude, _B28} = protocol:uint16(_B27),
    {V1_max_hp_aptitude, _B29} = protocol:uint16(_B28),
    {V1_max_phy_aptitude, _B30} = protocol:uint16(_B29),
    {V1_max_pdef_aptitude, _B31} = protocol:uint16(_B30),
    {V1_max_magic_aptitude, _B32} = protocol:uint16(_B31),
    {V1_max_aspd_aptitude, _B33} = protocol:uint16(_B32),
    {V1_skills, _B38} = protocol:array(_B33,
                                       fun (_B34) ->
                                               {V2_id, _B35} =
                                                   protocol:uint32(_B34),
                                               {V2_source, _B36} =
                                                   protocol:uint8(_B35),
                                               {{V2_id, V2_source}, _B36}
                                       end),
    {V1_stones, _B63} = protocol:array(_B38,
                                       fun (_B39) ->
                                               {V2_id, _B40} =
                                                   protocol:uint32(_B39),
                                               {V2_base_id, _B41} =
                                                   protocol:uint32(_B40),
                                               {V2_attr, _B48} =
                                                   protocol:array(_B41,
                                                                  fun (_B42) ->
                                                                          {V3_type,
                                                                           _B43} =
                                                                              protocol:uint16(_B42),
                                                                          {V3_name,
                                                                           _B44} =
                                                                              protocol:uint32(_B43),
                                                                          {V3_flag,
                                                                           _B45} =
                                                                              protocol:uint32(_B44),
                                                                          {V3_val,
                                                                           _B46} =
                                                                              protocol:int32(_B45),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B46}
                                                                  end),
                                               {V2_reset_attr, _B55} =
                                                   protocol:array(_B48,
                                                                  fun (_B49) ->
                                                                          {V3_type,
                                                                           _B50} =
                                                                              protocol:uint16(_B49),
                                                                          {V3_name,
                                                                           _B51} =
                                                                              protocol:uint32(_B50),
                                                                          {V3_flag,
                                                                           _B52} =
                                                                              protocol:uint32(_B51),
                                                                          {V3_val,
                                                                           _B53} =
                                                                              protocol:int32(_B52),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B53}
                                                                  end),
                                               {V2_extra, _B61} =
                                                   protocol:array(_B55,
                                                                  fun (_B56) ->
                                                                          {V3_name,
                                                                           _B57} =
                                                                              protocol:uint32(_B56),
                                                                          {V3_value,
                                                                           _B58} =
                                                                              protocol:uint32(_B57),
                                                                          {V3_str,
                                                                           _B59} =
                                                                              protocol:string(_B58),
                                                                          {{V3_name,
                                                                            V3_value,
                                                                            V3_str},
                                                                           _B59}
                                                                  end),
                                               {{V2_id,
                                                 V2_base_id,
                                                 V2_attr,
                                                 V2_reset_attr,
                                                 V2_extra},
                                                _B61}
                                       end),
    {V1_mount_skills, _B69} = protocol:array(_B63,
                                             fun (_B64) ->
                                                     {V2_skill_index, _B65} =
                                                         protocol:uint8(_B64),
                                                     {V2_skill_id, _B66} =
                                                         protocol:uint32(_B65),
                                                     {V2_skill_lev, _B67} =
                                                         protocol:uint32(_B66),
                                                     {{V2_skill_index,
                                                       V2_skill_id,
                                                       V2_skill_lev},
                                                      _B67}
                                             end),
    {V1_handbook_attr, _B74} = protocol:array(_B69,
                                              fun (_B70) ->
                                                      {V2_attr_name, _B71} =
                                                          protocol:uint32(_B70),
                                                      {V2_attr_val, _B72} =
                                                          protocol:uint32(_B71),
                                                      {{V2_attr_name,
                                                        V2_attr_val},
                                                       _B72}
                                              end),
    {V1_handbook_num, _B75} = protocol:uint8(_B74),
    {V1_star_handbook_num, _B76} = protocol:uint8(_B75),
    {V1_use_skin, _B77} = protocol:uint32(_B76),
    {V1_pet_rune, _B92} = protocol:array(_B77,
                                         fun (_B78) ->
                                                 {V2_rune_index, _B79} =
                                                     protocol:uint8(_B78),
                                                 {V2_rune_type, _B80} =
                                                     protocol:uint8(_B79),
                                                 {V2_rune_status, _B81} =
                                                     protocol:uint8(_B80),
                                                 {V2_rune_id, _B82} =
                                                     protocol:uint32(_B81),
                                                 {V2_rune_lev, _B83} =
                                                     protocol:uint8(_B82),
                                                 {V2_is_resonance, _B84} =
                                                     protocol:uint8(_B83),
                                                 {V2_resonances, _B90} =
                                                     protocol:array(_B84,
                                                                    fun
                                                                        (_B85) ->
                                                                            {V3_resonance_index,
                                                                             _B86} =
                                                                                protocol:uint8(_B85),
                                                                            {V3_resonance_id,
                                                                             _B87} =
                                                                                protocol:uint32(_B86),
                                                                            {V3_rune_index,
                                                                             _B88} =
                                                                                protocol:uint8(_B87),
                                                                            {{V3_resonance_index,
                                                                              V3_resonance_id,
                                                                              V3_rune_index},
                                                                             _B88}
                                                                    end),
                                                 {{V2_rune_index,
                                                   V2_rune_type,
                                                   V2_rune_status,
                                                   V2_rune_id,
                                                   V2_rune_lev,
                                                   V2_is_resonance,
                                                   V2_resonances},
                                                  _B90}
                                         end),
    {ok,
     {V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
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
      V1_pet_rune}};
unpack(srv, 19407, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 19407, _B0) ->
    {V1_m_id, _B1} = protocol:uint32(_B0),
    {V1_m_platform, _B2} = protocol:string(_B1),
    {V1_m_zone_id, _B3} = protocol:uint16(_B2),
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
     {V1_m_id,
      V1_m_platform,
      V1_m_zone_id,
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
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

