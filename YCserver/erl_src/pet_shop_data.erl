-file("src/data/pet_shop_data.erl", 1).

-module(pet_shop_data).

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

-file("src/data/pet_shop_data.erl", 13).

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

-file("src/data/pet_shop_data.erl", 14).

-export([get_all_pet_cfg/0,
         get_lev_pets/1,
         get_max_lev_tab/0,
         get_min_lev_tab/0,
         get_pet_cfg/1]).

get_pet_cfg(10001) ->
    #pet_shop_data{base_id = 10001, name = lang:get("波波球"),
                   actv_lev = 5, def_buy_price = 7500, stock = 20};
get_pet_cfg(10002) ->
    #pet_shop_data{base_id = 10002, name = lang:get("小浣熊"),
                   actv_lev = 5, def_buy_price = 7500, stock = 20};
get_pet_cfg(10003) ->
    #pet_shop_data{base_id = 10003, name = lang:get("小胡巴"),
                   actv_lev = 15, def_buy_price = 10000, stock = 20};
get_pet_cfg(10004) ->
    #pet_shop_data{base_id = 10004, name = lang:get("卡其兽"),
                   actv_lev = 15, def_buy_price = 10000, stock = 20};
get_pet_cfg(10005) ->
    #pet_shop_data{base_id = 10005, name = lang:get("龙龟"),
                   actv_lev = 15, def_buy_price = 10000, stock = 20};
get_pet_cfg(10006) ->
    #pet_shop_data{base_id = 10006, name = lang:get("螳螂忍者"),
                   actv_lev = 35, def_buy_price = 12500, stock = 20};
get_pet_cfg(10007) ->
    #pet_shop_data{base_id = 10007, name = lang:get("树人"),
                   actv_lev = 35, def_buy_price = 12500, stock = 20};
get_pet_cfg(10008) ->
    #pet_shop_data{base_id = 10008, name = lang:get("森林精灵"),
                   actv_lev = 35, def_buy_price = 12500, stock = 20};
get_pet_cfg(10009) ->
    #pet_shop_data{base_id = 10009, name = lang:get("钢甲蝎"),
                   actv_lev = 45, def_buy_price = 15000, stock = 20};
get_pet_cfg(10010) ->
    #pet_shop_data{base_id = 10010, name = lang:get("雪狐"),
                   actv_lev = 45, def_buy_price = 15000, stock = 20};
get_pet_cfg(10011) ->
    #pet_shop_data{base_id = 10011, name = lang:get("蝴蝶仙女"),
                   actv_lev = 45, def_buy_price = 15000, stock = 20};
get_pet_cfg(10012) ->
    #pet_shop_data{base_id = 10012, name = lang:get("森林巨人"),
                   actv_lev = 55, def_buy_price = 17500, stock = 20};
get_pet_cfg(10013) ->
    #pet_shop_data{base_id = 10013, name = lang:get("人鱼精灵"),
                   actv_lev = 55, def_buy_price = 17500, stock = 20};
get_pet_cfg(10014) ->
    #pet_shop_data{base_id = 10014, name = lang:get("霜狼"),
                   actv_lev = 55, def_buy_price = 17500, stock = 20};
get_pet_cfg(10015) ->
    #pet_shop_data{base_id = 10015, name = lang:get("炎魔"),
                   actv_lev = 65, def_buy_price = 20000, stock = 20};
get_pet_cfg(10016) ->
    #pet_shop_data{base_id = 10016, name = lang:get("冰熊"),
                   actv_lev = 65, def_buy_price = 20000, stock = 20};
get_pet_cfg(10017) ->
    #pet_shop_data{base_id = 10017, name = lang:get("剑齿虎"),
                   actv_lev = 65, def_buy_price = 20000, stock = 20};
get_pet_cfg(10019) ->
    #pet_shop_data{base_id = 10019, name = lang:get("石头人"),
                   actv_lev = 75, def_buy_price = 22500, stock = 20};
get_pet_cfg(10021) ->
    #pet_shop_data{base_id = 10021, name = lang:get("风暴"),
                   actv_lev = 75, def_buy_price = 22500, stock = 20};
get_pet_cfg(10022) ->
    #pet_shop_data{base_id = 10022, name = lang:get("剑灵"),
                   actv_lev = 75, def_buy_price = 25000, stock = 20};
get_pet_cfg(10023) ->
    #pet_shop_data{base_id = 10023, name = lang:get("血伯爵"),
                   actv_lev = 85, def_buy_price = 27500, stock = 20};
get_pet_cfg(10024) ->
    #pet_shop_data{base_id = 10024, name = lang:get("雷霆战神"),
                   actv_lev = 85, def_buy_price = 27500, stock = 20};
get_pet_cfg(10025) ->
    #pet_shop_data{base_id = 10025, name = lang:get("月光女神"),
                   actv_lev = 85, def_buy_price = 30000, stock = 20};
get_pet_cfg(10026) ->
    #pet_shop_data{base_id = 10026, name = lang:get("蝴蝶舞娘"),
                   actv_lev = 95, def_buy_price = 32500, stock = 20};
get_pet_cfg(10027) ->
    #pet_shop_data{base_id = 10027, name = lang:get("死亡骑士"),
                   actv_lev = 95, def_buy_price = 32500, stock = 20};
get_pet_cfg(10028) ->
    #pet_shop_data{base_id = 10028, name = lang:get("幻影剑客"),
                   actv_lev = 95, def_buy_price = 35000, stock = 20};
get_pet_cfg(10029) ->
    #pet_shop_data{base_id = 10029, name = lang:get("幽冥行者"),
                   actv_lev = 95, def_buy_price = 35000, stock = 20};
get_pet_cfg(10030) ->
    #pet_shop_data{base_id = 10030, name = lang:get("冰晶女王"),
                   actv_lev = 95, def_buy_price = 35000, stock = 20};
get_pet_cfg(_) -> none.

get_max_lev_tab() -> 95.

get_min_lev_tab() -> 5.

get_lev_pets(5) -> [10001, 10002];
get_lev_pets(15) -> [10003, 10004, 10005];
get_lev_pets(35) -> [10006, 10007, 10008];
get_lev_pets(45) -> [10009, 10010, 10011];
get_lev_pets(55) -> [10012, 10013, 10014];
get_lev_pets(65) -> [10015, 10016, 10017];
get_lev_pets(75) -> [10019, 10021, 10022];
get_lev_pets(85) -> [10023, 10024, 10025];
get_lev_pets(95) -> [10026, 10027, 10028, 10029, 10030];
get_lev_pets(_Lev) -> [].

get_all_pet_cfg() ->
    [#pet_shop_data{base_id = 10001, name = lang:get("波波球"),
                    actv_lev = 5, def_buy_price = 7500, stock = 20},
     #pet_shop_data{base_id = 10002, name = lang:get("小浣熊"),
                    actv_lev = 5, def_buy_price = 7500, stock = 20},
     #pet_shop_data{base_id = 10003, name = lang:get("小胡巴"),
                    actv_lev = 15, def_buy_price = 10000, stock = 20},
     #pet_shop_data{base_id = 10004, name = lang:get("卡其兽"),
                    actv_lev = 15, def_buy_price = 10000, stock = 20},
     #pet_shop_data{base_id = 10005, name = lang:get("龙龟"),
                    actv_lev = 15, def_buy_price = 10000, stock = 20},
     #pet_shop_data{base_id = 10006, name = lang:get("螳螂忍者"),
                    actv_lev = 35, def_buy_price = 12500, stock = 20},
     #pet_shop_data{base_id = 10007, name = lang:get("树人"),
                    actv_lev = 35, def_buy_price = 12500, stock = 20},
     #pet_shop_data{base_id = 10008, name = lang:get("森林精灵"),
                    actv_lev = 35, def_buy_price = 12500, stock = 20},
     #pet_shop_data{base_id = 10009, name = lang:get("钢甲蝎"),
                    actv_lev = 45, def_buy_price = 15000, stock = 20},
     #pet_shop_data{base_id = 10010, name = lang:get("雪狐"),
                    actv_lev = 45, def_buy_price = 15000, stock = 20},
     #pet_shop_data{base_id = 10011, name = lang:get("蝴蝶仙女"),
                    actv_lev = 45, def_buy_price = 15000, stock = 20},
     #pet_shop_data{base_id = 10012, name = lang:get("森林巨人"),
                    actv_lev = 55, def_buy_price = 17500, stock = 20},
     #pet_shop_data{base_id = 10013, name = lang:get("人鱼精灵"),
                    actv_lev = 55, def_buy_price = 17500, stock = 20},
     #pet_shop_data{base_id = 10014, name = lang:get("霜狼"),
                    actv_lev = 55, def_buy_price = 17500, stock = 20},
     #pet_shop_data{base_id = 10015, name = lang:get("炎魔"),
                    actv_lev = 65, def_buy_price = 20000, stock = 20},
     #pet_shop_data{base_id = 10016, name = lang:get("冰熊"),
                    actv_lev = 65, def_buy_price = 20000, stock = 20},
     #pet_shop_data{base_id = 10017, name = lang:get("剑齿虎"),
                    actv_lev = 65, def_buy_price = 20000, stock = 20},
     #pet_shop_data{base_id = 10019, name = lang:get("石头人"),
                    actv_lev = 75, def_buy_price = 22500, stock = 20},
     #pet_shop_data{base_id = 10021, name = lang:get("风暴"),
                    actv_lev = 75, def_buy_price = 22500, stock = 20},
     #pet_shop_data{base_id = 10022, name = lang:get("剑灵"),
                    actv_lev = 75, def_buy_price = 25000, stock = 20},
     #pet_shop_data{base_id = 10023, name = lang:get("血伯爵"),
                    actv_lev = 85, def_buy_price = 27500, stock = 20},
     #pet_shop_data{base_id = 10024, name = lang:get("雷霆战神"),
                    actv_lev = 85, def_buy_price = 27500, stock = 20},
     #pet_shop_data{base_id = 10025, name = lang:get("月光女神"),
                    actv_lev = 85, def_buy_price = 30000, stock = 20},
     #pet_shop_data{base_id = 10026, name = lang:get("蝴蝶舞娘"),
                    actv_lev = 95, def_buy_price = 32500, stock = 20},
     #pet_shop_data{base_id = 10027, name = lang:get("死亡骑士"),
                    actv_lev = 95, def_buy_price = 32500, stock = 20},
     #pet_shop_data{base_id = 10028, name = lang:get("幻影剑客"),
                    actv_lev = 95, def_buy_price = 35000, stock = 20},
     #pet_shop_data{base_id = 10029, name = lang:get("幽冥行者"),
                    actv_lev = 95, def_buy_price = 35000, stock = 20},
     #pet_shop_data{base_id = 10030, name = lang:get("冰晶女王"),
                    actv_lev = 95, def_buy_price = 35000, stock = 20}].

