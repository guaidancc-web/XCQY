-file("src/data/npc_shop_data.erl", 1).

-module(npc_shop_data).

-export([get_medicine/1,
         get_eqm/1,
         get/1,
         get_classes_item/1,
         get_item_list/1,
         get_challenge_medicine/1,
         get_fashion_exchange/1]).

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

-file("src/data/npc_shop_data.erl", 21).

-file("inc/npc_shop.hrl", 1).

-record(npc_shop_item_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | pos_integer(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         step = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         lev_limit = 0 :: non_neg_integer(),
         price :: undefined | pos_integer(),
         item_cost :: undefined | pos_integer()}).

-file("src/data/npc_shop_data.erl", 22).

get_medicine(21400) ->
    #npc_shop_item_data{base_id = 21400, classes = 0,
                        sex = 2, type = 1, name = lang:get("明月草"), price = 3600,
                        item_cost = []};
get_medicine(21406) ->
    #npc_shop_item_data{base_id = 21406, classes = 0,
                        sex = 2, type = 1, step = 10, name = lang:get("凤凰极光"),
                        price = 22500, item_cost = []};
get_medicine(21410) ->
    #npc_shop_item_data{base_id = 21410, classes = 0,
                        sex = 2, type = 1, name = lang:get("接骨木"), price = 960,
                        item_cost = []};
get_medicine(21411) ->
    #npc_shop_item_data{base_id = 21411, classes = 0,
                        sex = 2, type = 1, name = lang:get("曼陀罗"), price = 960,
                        item_cost = []};
get_medicine(21412) ->
    #npc_shop_item_data{base_id = 21412, classes = 0,
                        sex = 2, type = 1, name = lang:get("迷迭香"), price = 1800,
                        item_cost = []};
get_medicine(21413) ->
    #npc_shop_item_data{base_id = 21413, classes = 0,
                        sex = 2, type = 1, name = lang:get("紫罗兰"), price = 1800,
                        item_cost = []};
get_medicine(21414) ->
    #npc_shop_item_data{base_id = 21414, classes = 0,
                        sex = 2, type = 1, name = lang:get("魔法石"), price = 1200,
                        item_cost = []};
get_medicine(_) -> none.

get_eqm(10511) ->
    #npc_shop_item_data{base_id = 10511, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("秘银指环"),
                        price = 2750, item_cost = []};
get_eqm(10512) ->
    #npc_shop_item_data{base_id = 10512, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("风语项链"),
                        price = 2750, item_cost = []};
get_eqm(10514) ->
    #npc_shop_item_data{base_id = 10514, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("影钢手镯"),
                        price = 2750, item_cost = []};
get_eqm(10011) ->
    #npc_shop_item_data{base_id = 10011, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("流光之刃"),
                        price = 5000, item_cost = []};
get_eqm(10012) ->
    #npc_shop_item_data{base_id = 10012, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士锁甲"),
                        price = 2750, item_cost = []};
get_eqm(10013) ->
    #npc_shop_item_data{base_id = 10013, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士腰带"),
                        price = 2750, item_cost = []};
get_eqm(10014) ->
    #npc_shop_item_data{base_id = 10014, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士裤子"),
                        price = 2750, item_cost = []};
get_eqm(10016) ->
    #npc_shop_item_data{base_id = 10016, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士鞋子"),
                        price = 2750, item_cost = []};
get_eqm(10111) ->
    #npc_shop_item_data{base_id = 10111, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("奥能法杖"),
                        price = 5000, item_cost = []};
get_eqm(10112) ->
    #npc_shop_item_data{base_id = 10112, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法袍"),
                        price = 2750, item_cost = []};
get_eqm(10113) ->
    #npc_shop_item_data{base_id = 10113, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师腰带"),
                        price = 2750, item_cost = []};
get_eqm(10114) ->
    #npc_shop_item_data{base_id = 10114, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法裤"),
                        price = 2750, item_cost = []};
get_eqm(10116) ->
    #npc_shop_item_data{base_id = 10116, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法鞋"),
                        price = 2750, item_cost = []};
get_eqm(10211) ->
    #npc_shop_item_data{base_id = 10211, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("爆裂长弓"),
                        price = 5000, item_cost = []};
get_eqm(10212) ->
    #npc_shop_item_data{base_id = 10212, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手轻甲"),
                        price = 2750, item_cost = []};
get_eqm(10213) ->
    #npc_shop_item_data{base_id = 10213, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手腰带"),
                        price = 2750, item_cost = []};
get_eqm(10214) ->
    #npc_shop_item_data{base_id = 10214, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手裤子"),
                        price = 2750, item_cost = []};
get_eqm(10216) ->
    #npc_shop_item_data{base_id = 10216, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手鞋子"),
                        price = 2750, item_cost = []};
get_eqm(10311) ->
    #npc_shop_item_data{base_id = 10311, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻影拳甲"),
                        price = 5000, item_cost = []};
get_eqm(10312) ->
    #npc_shop_item_data{base_id = 10312, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者铠甲"),
                        price = 2750, item_cost = []};
get_eqm(10313) ->
    #npc_shop_item_data{base_id = 10313, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者腰带"),
                        price = 2750, item_cost = []};
get_eqm(10314) ->
    #npc_shop_item_data{base_id = 10314, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者裤子"),
                        price = 2750, item_cost = []};
get_eqm(10316) ->
    #npc_shop_item_data{base_id = 10316, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者鞋子"),
                        price = 2750, item_cost = []};
get_eqm(10411) ->
    #npc_shop_item_data{base_id = 10411, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("言咒魔典"),
                        price = 5000, item_cost = []};
get_eqm(10412) ->
    #npc_shop_item_data{base_id = 10412, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师布甲"),
                        price = 2750, item_cost = []};
get_eqm(10413) ->
    #npc_shop_item_data{base_id = 10413, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师腰带"),
                        price = 2750, item_cost = []};
get_eqm(10414) ->
    #npc_shop_item_data{base_id = 10414, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师裤子"),
                        price = 2750, item_cost = []};
get_eqm(10416) ->
    #npc_shop_item_data{base_id = 10416, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师轻鞋"),
                        price = 2750, item_cost = []};
get_eqm(10611) ->
    #npc_shop_item_data{base_id = 10611, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("新月战刃"),
                        price = 5000, item_cost = []};
get_eqm(10612) ->
    #npc_shop_item_data{base_id = 10612, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人战袍"),
                        price = 2750, item_cost = []};
get_eqm(10613) ->
    #npc_shop_item_data{base_id = 10613, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人腰带"),
                        price = 2750, item_cost = []};
get_eqm(10614) ->
    #npc_shop_item_data{base_id = 10614, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人护腿"),
                        price = 2750, item_cost = []};
get_eqm(10616) ->
    #npc_shop_item_data{base_id = 10616, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人战靴"),
                        price = 2750, item_cost = []};
get_eqm(10711) ->
    #npc_shop_item_data{base_id = 10711, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("帝国枪盾"),
                        price = 5000, item_cost = []};
get_eqm(10712) ->
    #npc_shop_item_data{base_id = 10712, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士板甲"),
                        price = 2750, item_cost = []};
get_eqm(10713) ->
    #npc_shop_item_data{base_id = 10713, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士腰带"),
                        price = 2750, item_cost = []};
get_eqm(10714) ->
    #npc_shop_item_data{base_id = 10714, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士重靴"),
                        price = 2750, item_cost = []};
get_eqm(10716) ->
    #npc_shop_item_data{base_id = 10716, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士腿铠"),
                        price = 2750, item_cost = []};
get_eqm(10521) ->
    #npc_shop_item_data{base_id = 10521, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("精金指环"),
                        price = 26000, item_cost = []};
get_eqm(10522) ->
    #npc_shop_item_data{base_id = 10522, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("光逝项链"),
                        price = 26000, item_cost = []};
get_eqm(10524) ->
    #npc_shop_item_data{base_id = 10524, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("霜霭手镯"),
                        price = 26000, item_cost = []};
get_eqm(10021) ->
    #npc_shop_item_data{base_id = 10021, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("血牙双剑"),
                        price = 38000, item_cost = []};
get_eqm(10022) ->
    #npc_shop_item_data{base_id = 10022, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者锁甲"),
                        price = 26000, item_cost = []};
get_eqm(10023) ->
    #npc_shop_item_data{base_id = 10023, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者腰带"),
                        price = 26000, item_cost = []};
get_eqm(10024) ->
    #npc_shop_item_data{base_id = 10024, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者裤子"),
                        price = 26000, item_cost = []};
get_eqm(10026) ->
    #npc_shop_item_data{base_id = 10026, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者鞋子"),
                        price = 26000, item_cost = []};
get_eqm(10121) ->
    #npc_shop_item_data{base_id = 10121, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("风暴权杖"),
                        price = 38000, item_cost = []};
get_eqm(10122) ->
    #npc_shop_item_data{base_id = 10122, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法袍"),
                        price = 24000, item_cost = []};
get_eqm(10123) ->
    #npc_shop_item_data{base_id = 10123, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使腰带"),
                        price = 24000, item_cost = []};
get_eqm(10124) ->
    #npc_shop_item_data{base_id = 10124, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法裤"),
                        price = 24000, item_cost = []};
get_eqm(10126) ->
    #npc_shop_item_data{base_id = 10126, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法鞋"),
                        price = 24000, item_cost = []};
get_eqm(10221) ->
    #npc_shop_item_data{base_id = 10221, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("暮光长弓"),
                        price = 38000, item_cost = []};
get_eqm(10222) ->
    #npc_shop_item_data{base_id = 10222, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者轻甲"),
                        price = 24000, item_cost = []};
get_eqm(10223) ->
    #npc_shop_item_data{base_id = 10223, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者腰带"),
                        price = 24000, item_cost = []};
get_eqm(10224) ->
    #npc_shop_item_data{base_id = 10224, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者裤子"),
                        price = 24000, item_cost = []};
get_eqm(10226) ->
    #npc_shop_item_data{base_id = 10226, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者鞋子"),
                        price = 24000, item_cost = []};
get_eqm(10321) ->
    #npc_shop_item_data{base_id = 10321, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("冰岩巨锤"),
                        price = 38000, item_cost = []};
get_eqm(10322) ->
    #npc_shop_item_data{base_id = 10322, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使铠甲"),
                        price = 24000, item_cost = []};
get_eqm(10323) ->
    #npc_shop_item_data{base_id = 10323, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使腰带"),
                        price = 24000, item_cost = []};
get_eqm(10324) ->
    #npc_shop_item_data{base_id = 10324, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使裤子"),
                        price = 24000, item_cost = []};
get_eqm(10326) ->
    #npc_shop_item_data{base_id = 10326, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使鞋子"),
                        price = 24000, item_cost = []};
get_eqm(10421) ->
    #npc_shop_item_data{base_id = 10421, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("秩序法典"),
                        price = 38000, item_cost = []};
get_eqm(10422) ->
    #npc_shop_item_data{base_id = 10422, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者布甲"),
                        price = 24000, item_cost = []};
get_eqm(10423) ->
    #npc_shop_item_data{base_id = 10423, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者腰带"),
                        price = 24000, item_cost = []};
get_eqm(10424) ->
    #npc_shop_item_data{base_id = 10424, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者裤子"),
                        price = 24000, item_cost = []};
get_eqm(10426) ->
    #npc_shop_item_data{base_id = 10426, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者轻鞋"),
                        price = 24000, item_cost = []};
get_eqm(10621) ->
    #npc_shop_item_data{base_id = 10621, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("月神战刃"),
                        price = 38000, item_cost = []};
get_eqm(10622) ->
    #npc_shop_item_data{base_id = 10622, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌战袍"),
                        price = 24000, item_cost = []};
get_eqm(10623) ->
    #npc_shop_item_data{base_id = 10623, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌腰带"),
                        price = 24000, item_cost = []};
get_eqm(10624) ->
    #npc_shop_item_data{base_id = 10624, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌护腿"),
                        price = 24000, item_cost = []};
get_eqm(10626) ->
    #npc_shop_item_data{base_id = 10626, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌战靴"),
                        price = 24000, item_cost = []};
get_eqm(10721) ->
    #npc_shop_item_data{base_id = 10721, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("守护枪盾"),
                        price = 38000, item_cost = []};
get_eqm(10722) ->
    #npc_shop_item_data{base_id = 10722, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者板甲"),
                        price = 24000, item_cost = []};
get_eqm(10723) ->
    #npc_shop_item_data{base_id = 10723, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者腰带"),
                        price = 24000, item_cost = []};
get_eqm(10724) ->
    #npc_shop_item_data{base_id = 10724, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者重靴"),
                        price = 24000, item_cost = []};
get_eqm(10726) ->
    #npc_shop_item_data{base_id = 10726, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者腿铠"),
                        price = 24000, item_cost = []};
get_eqm(10531) ->
    #npc_shop_item_data{base_id = 10531, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("群山徽记"),
                        price = 58000, item_cost = []};
get_eqm(10532) ->
    #npc_shop_item_data{base_id = 10532, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("潮汐项链"),
                        price = 58000, item_cost = []};
get_eqm(10534) ->
    #npc_shop_item_data{base_id = 10534, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("雷铸手镯"),
                        price = 58000, item_cost = []};
get_eqm(10031) ->
    #npc_shop_item_data{base_id = 10031, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("狮心"),
                        price = 80000, item_cost = []};
get_eqm(10032) ->
    #npc_shop_item_data{base_id = 10032, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风锁甲"),
                        price = 58000, item_cost = []};
get_eqm(10033) ->
    #npc_shop_item_data{base_id = 10033, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风腰带"),
                        price = 58000, item_cost = []};
get_eqm(10034) ->
    #npc_shop_item_data{base_id = 10034, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风裤子"),
                        price = 58000, item_cost = []};
get_eqm(10036) ->
    #npc_shop_item_data{base_id = 10036, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风鞋子"),
                        price = 58000, item_cost = []};
get_eqm(10131) ->
    #npc_shop_item_data{base_id = 10131, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("高塔"),
                        price = 80000, item_cost = []};
get_eqm(10132) ->
    #npc_shop_item_data{base_id = 10132, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法袍"),
                        price = 58000, item_cost = []};
get_eqm(10133) ->
    #npc_shop_item_data{base_id = 10133, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆腰带"),
                        price = 58000, item_cost = []};
get_eqm(10134) ->
    #npc_shop_item_data{base_id = 10134, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法裤"),
                        price = 58000, item_cost = []};
get_eqm(10136) ->
    #npc_shop_item_data{base_id = 10136, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法鞋"),
                        price = 58000, item_cost = []};
get_eqm(10231) ->
    #npc_shop_item_data{base_id = 10231, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("箭歌"),
                        price = 80000, item_cost = []};
get_eqm(10232) ->
    #npc_shop_item_data{base_id = 10232, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影轻甲"),
                        price = 58000, item_cost = []};
get_eqm(10233) ->
    #npc_shop_item_data{base_id = 10233, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影腰带"),
                        price = 58000, item_cost = []};
get_eqm(10234) ->
    #npc_shop_item_data{base_id = 10234, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影裤子"),
                        price = 58000, item_cost = []};
get_eqm(10236) ->
    #npc_shop_item_data{base_id = 10236, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影鞋子"),
                        price = 58000, item_cost = []};
get_eqm(10331) ->
    #npc_shop_item_data{base_id = 10331, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("崩山"),
                        price = 80000, item_cost = []};
get_eqm(10332) ->
    #npc_shop_item_data{base_id = 10332, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性铠甲"),
                        price = 58000, item_cost = []};
get_eqm(10333) ->
    #npc_shop_item_data{base_id = 10333, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性腰带"),
                        price = 58000, item_cost = []};
get_eqm(10334) ->
    #npc_shop_item_data{base_id = 10334, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性裤子"),
                        price = 58000, item_cost = []};
get_eqm(10336) ->
    #npc_shop_item_data{base_id = 10336, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性鞋子"),
                        price = 58000, item_cost = []};
get_eqm(10431) ->
    #npc_shop_item_data{base_id = 10431, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("赦令"),
                        price = 80000, item_cost = []};
get_eqm(10432) ->
    #npc_shop_item_data{base_id = 10432, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言布甲"),
                        price = 58000, item_cost = []};
get_eqm(10433) ->
    #npc_shop_item_data{base_id = 10433, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言腰带"),
                        price = 58000, item_cost = []};
get_eqm(10434) ->
    #npc_shop_item_data{base_id = 10434, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言裤子"),
                        price = 58000, item_cost = []};
get_eqm(10436) ->
    #npc_shop_item_data{base_id = 10436, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言轻鞋"),
                        price = 58000, item_cost = []};
get_eqm(10631) ->
    #npc_shop_item_data{base_id = 10631, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("霜天"),
                        price = 80000, item_cost = []};
get_eqm(10632) ->
    #npc_shop_item_data{base_id = 10632, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影战袍"),
                        price = 58000, item_cost = []};
get_eqm(10633) ->
    #npc_shop_item_data{base_id = 10633, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影腰带"),
                        price = 58000, item_cost = []};
get_eqm(10634) ->
    #npc_shop_item_data{base_id = 10634, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影护腿"),
                        price = 58000, item_cost = []};
get_eqm(10636) ->
    #npc_shop_item_data{base_id = 10636, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影战靴"),
                        price = 58000, item_cost = []};
get_eqm(10731) ->
    #npc_shop_item_data{base_id = 10731, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("壁垒"),
                        price = 80000, item_cost = []};
get_eqm(10732) ->
    #npc_shop_item_data{base_id = 10732, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏板甲"),
                        price = 58000, item_cost = []};
get_eqm(10733) ->
    #npc_shop_item_data{base_id = 10733, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏腰带"),
                        price = 58000, item_cost = []};
get_eqm(10734) ->
    #npc_shop_item_data{base_id = 10734, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏重靴"),
                        price = 58000, item_cost = []};
get_eqm(10736) ->
    #npc_shop_item_data{base_id = 10736, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏腿铠"),
                        price = 58000, item_cost = []};
get_eqm(_) -> none.

get(10511) ->
    #npc_shop_item_data{base_id = 10511, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("秘银指环"),
                        price = 2750, item_cost = []};
get(10512) ->
    #npc_shop_item_data{base_id = 10512, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("风语项链"),
                        price = 2750, item_cost = []};
get(10514) ->
    #npc_shop_item_data{base_id = 10514, classes = 0,
                        sex = 2, type = 2, group = 10, name = lang:get("影钢手镯"),
                        price = 2750, item_cost = []};
get(10011) ->
    #npc_shop_item_data{base_id = 10011, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("流光之刃"),
                        price = 5000, item_cost = []};
get(10012) ->
    #npc_shop_item_data{base_id = 10012, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士锁甲"),
                        price = 2750, item_cost = []};
get(10013) ->
    #npc_shop_item_data{base_id = 10013, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士腰带"),
                        price = 2750, item_cost = []};
get(10014) ->
    #npc_shop_item_data{base_id = 10014, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士裤子"),
                        price = 2750, item_cost = []};
get(10016) ->
    #npc_shop_item_data{base_id = 10016, classes = 1,
                        sex = 2, type = 2, group = 10, name = lang:get("狂剑士鞋子"),
                        price = 2750, item_cost = []};
get(10111) ->
    #npc_shop_item_data{base_id = 10111, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("奥能法杖"),
                        price = 5000, item_cost = []};
get(10112) ->
    #npc_shop_item_data{base_id = 10112, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法袍"),
                        price = 2750, item_cost = []};
get(10113) ->
    #npc_shop_item_data{base_id = 10113, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师腰带"),
                        price = 2750, item_cost = []};
get(10114) ->
    #npc_shop_item_data{base_id = 10114, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法裤"),
                        price = 2750, item_cost = []};
get(10116) ->
    #npc_shop_item_data{base_id = 10116, classes = 2,
                        sex = 2, type = 2, group = 10, name = lang:get("魔法师法鞋"),
                        price = 2750, item_cost = []};
get(10211) ->
    #npc_shop_item_data{base_id = 10211, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("爆裂长弓"),
                        price = 5000, item_cost = []};
get(10212) ->
    #npc_shop_item_data{base_id = 10212, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手轻甲"),
                        price = 2750, item_cost = []};
get(10213) ->
    #npc_shop_item_data{base_id = 10213, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手腰带"),
                        price = 2750, item_cost = []};
get(10214) ->
    #npc_shop_item_data{base_id = 10214, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手裤子"),
                        price = 2750, item_cost = []};
get(10216) ->
    #npc_shop_item_data{base_id = 10216, classes = 3,
                        sex = 2, type = 2, group = 10, name = lang:get("神射手鞋子"),
                        price = 2750, item_cost = []};
get(10311) ->
    #npc_shop_item_data{base_id = 10311, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻影拳甲"),
                        price = 5000, item_cost = []};
get(10312) ->
    #npc_shop_item_data{base_id = 10312, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者铠甲"),
                        price = 2750, item_cost = []};
get(10313) ->
    #npc_shop_item_data{base_id = 10313, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者腰带"),
                        price = 2750, item_cost = []};
get(10314) ->
    #npc_shop_item_data{base_id = 10314, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者裤子"),
                        price = 2750, item_cost = []};
get(10316) ->
    #npc_shop_item_data{base_id = 10316, classes = 4,
                        sex = 2, type = 2, group = 10, name = lang:get("幻灵者鞋子"),
                        price = 2750, item_cost = []};
get(10411) ->
    #npc_shop_item_data{base_id = 10411, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("言咒魔典"),
                        price = 5000, item_cost = []};
get(10412) ->
    #npc_shop_item_data{base_id = 10412, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师布甲"),
                        price = 2750, item_cost = []};
get(10413) ->
    #npc_shop_item_data{base_id = 10413, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师腰带"),
                        price = 2750, item_cost = []};
get(10414) ->
    #npc_shop_item_data{base_id = 10414, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师裤子"),
                        price = 2750, item_cost = []};
get(10416) ->
    #npc_shop_item_data{base_id = 10416, classes = 5,
                        sex = 2, type = 2, group = 10, name = lang:get("秘言师轻鞋"),
                        price = 2750, item_cost = []};
get(10611) ->
    #npc_shop_item_data{base_id = 10611, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("新月战刃"),
                        price = 5000, item_cost = []};
get(10612) ->
    #npc_shop_item_data{base_id = 10612, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人战袍"),
                        price = 2750, item_cost = []};
get(10613) ->
    #npc_shop_item_data{base_id = 10613, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人腰带"),
                        price = 2750, item_cost = []};
get(10614) ->
    #npc_shop_item_data{base_id = 10614, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人护腿"),
                        price = 2750, item_cost = []};
get(10616) ->
    #npc_shop_item_data{base_id = 10616, classes = 6,
                        sex = 2, type = 2, group = 10, name = lang:get("守夜人战靴"),
                        price = 2750, item_cost = []};
get(10711) ->
    #npc_shop_item_data{base_id = 10711, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("帝国枪盾"),
                        price = 5000, item_cost = []};
get(10712) ->
    #npc_shop_item_data{base_id = 10712, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士板甲"),
                        price = 2750, item_cost = []};
get(10713) ->
    #npc_shop_item_data{base_id = 10713, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士腰带"),
                        price = 2750, item_cost = []};
get(10714) ->
    #npc_shop_item_data{base_id = 10714, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士重靴"),
                        price = 2750, item_cost = []};
get(10716) ->
    #npc_shop_item_data{base_id = 10716, classes = 7,
                        sex = 2, type = 2, group = 10, name = lang:get("圣骑士腿铠"),
                        price = 2750, item_cost = []};
get(10521) ->
    #npc_shop_item_data{base_id = 10521, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("精金指环"),
                        price = 26000, item_cost = []};
get(10522) ->
    #npc_shop_item_data{base_id = 10522, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("光逝项链"),
                        price = 26000, item_cost = []};
get(10524) ->
    #npc_shop_item_data{base_id = 10524, classes = 0,
                        sex = 2, type = 2, group = 20, name = lang:get("霜霭手镯"),
                        price = 26000, item_cost = []};
get(10021) ->
    #npc_shop_item_data{base_id = 10021, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("血牙双剑"),
                        price = 38000, item_cost = []};
get(10022) ->
    #npc_shop_item_data{base_id = 10022, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者锁甲"),
                        price = 26000, item_cost = []};
get(10023) ->
    #npc_shop_item_data{base_id = 10023, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者腰带"),
                        price = 26000, item_cost = []};
get(10024) ->
    #npc_shop_item_data{base_id = 10024, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者裤子"),
                        price = 26000, item_cost = []};
get(10026) ->
    #npc_shop_item_data{base_id = 10026, classes = 1,
                        sex = 2, type = 2, group = 20, name = lang:get("剑语者鞋子"),
                        price = 26000, item_cost = []};
get(10121) ->
    #npc_shop_item_data{base_id = 10121, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("风暴权杖"),
                        price = 38000, item_cost = []};
get(10122) ->
    #npc_shop_item_data{base_id = 10122, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法袍"),
                        price = 24000, item_cost = []};
get(10123) ->
    #npc_shop_item_data{base_id = 10123, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使腰带"),
                        price = 24000, item_cost = []};
get(10124) ->
    #npc_shop_item_data{base_id = 10124, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法裤"),
                        price = 24000, item_cost = []};
get(10126) ->
    #npc_shop_item_data{base_id = 10126, classes = 2,
                        sex = 2, type = 2, group = 20, name = lang:get("元素使法鞋"),
                        price = 24000, item_cost = []};
get(10221) ->
    #npc_shop_item_data{base_id = 10221, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("暮光长弓"),
                        price = 38000, item_cost = []};
get(10222) ->
    #npc_shop_item_data{base_id = 10222, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者轻甲"),
                        price = 24000, item_cost = []};
get(10223) ->
    #npc_shop_item_data{base_id = 10223, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者腰带"),
                        price = 24000, item_cost = []};
get(10224) ->
    #npc_shop_item_data{base_id = 10224, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者裤子"),
                        price = 24000, item_cost = []};
get(10226) ->
    #npc_shop_item_data{base_id = 10226, classes = 3,
                        sex = 2, type = 2, group = 20, name = lang:get("巡游者鞋子"),
                        price = 24000, item_cost = []};
get(10321) ->
    #npc_shop_item_data{base_id = 10321, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("冰岩巨锤"),
                        price = 38000, item_cost = []};
get(10322) ->
    #npc_shop_item_data{base_id = 10322, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使铠甲"),
                        price = 24000, item_cost = []};
get(10323) ->
    #npc_shop_item_data{base_id = 10323, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使腰带"),
                        price = 24000, item_cost = []};
get(10324) ->
    #npc_shop_item_data{base_id = 10324, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使裤子"),
                        price = 24000, item_cost = []};
get(10326) ->
    #npc_shop_item_data{base_id = 10326, classes = 4,
                        sex = 2, type = 2, group = 20, name = lang:get("守护使鞋子"),
                        price = 24000, item_cost = []};
get(10421) ->
    #npc_shop_item_data{base_id = 10421, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("秩序法典"),
                        price = 38000, item_cost = []};
get(10422) ->
    #npc_shop_item_data{base_id = 10422, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者布甲"),
                        price = 24000, item_cost = []};
get(10423) ->
    #npc_shop_item_data{base_id = 10423, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者腰带"),
                        price = 24000, item_cost = []};
get(10424) ->
    #npc_shop_item_data{base_id = 10424, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者裤子"),
                        price = 24000, item_cost = []};
get(10426) ->
    #npc_shop_item_data{base_id = 10426, classes = 5,
                        sex = 2, type = 2, group = 20, name = lang:get("预言者轻鞋"),
                        price = 24000, item_cost = []};
get(10621) ->
    #npc_shop_item_data{base_id = 10621, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("月神战刃"),
                        price = 38000, item_cost = []};
get(10622) ->
    #npc_shop_item_data{base_id = 10622, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌战袍"),
                        price = 24000, item_cost = []};
get(10623) ->
    #npc_shop_item_data{base_id = 10623, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌腰带"),
                        price = 24000, item_cost = []};
get(10624) ->
    #npc_shop_item_data{base_id = 10624, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌护腿"),
                        price = 24000, item_cost = []};
get(10626) ->
    #npc_shop_item_data{base_id = 10626, classes = 6,
                        sex = 2, type = 2, group = 20, name = lang:get("夜歌战靴"),
                        price = 24000, item_cost = []};
get(10721) ->
    #npc_shop_item_data{base_id = 10721, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("守护枪盾"),
                        price = 38000, item_cost = []};
get(10722) ->
    #npc_shop_item_data{base_id = 10722, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者板甲"),
                        price = 24000, item_cost = []};
get(10723) ->
    #npc_shop_item_data{base_id = 10723, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者腰带"),
                        price = 24000, item_cost = []};
get(10724) ->
    #npc_shop_item_data{base_id = 10724, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者重靴"),
                        price = 24000, item_cost = []};
get(10726) ->
    #npc_shop_item_data{base_id = 10726, classes = 7,
                        sex = 2, type = 2, group = 20, name = lang:get("审判者腿铠"),
                        price = 24000, item_cost = []};
get(10531) ->
    #npc_shop_item_data{base_id = 10531, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("群山徽记"),
                        price = 58000, item_cost = []};
get(10532) ->
    #npc_shop_item_data{base_id = 10532, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("潮汐项链"),
                        price = 58000, item_cost = []};
get(10534) ->
    #npc_shop_item_data{base_id = 10534, classes = 0,
                        sex = 2, type = 2, group = 30, name = lang:get("雷铸手镯"),
                        price = 58000, item_cost = []};
get(10031) ->
    #npc_shop_item_data{base_id = 10031, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("狮心"),
                        price = 80000, item_cost = []};
get(10032) ->
    #npc_shop_item_data{base_id = 10032, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风锁甲"),
                        price = 58000, item_cost = []};
get(10033) ->
    #npc_shop_item_data{base_id = 10033, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风腰带"),
                        price = 58000, item_cost = []};
get(10034) ->
    #npc_shop_item_data{base_id = 10034, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风裤子"),
                        price = 58000, item_cost = []};
get(10036) ->
    #npc_shop_item_data{base_id = 10036, classes = 1,
                        sex = 2, type = 2, group = 30, name = lang:get("怒风鞋子"),
                        price = 58000, item_cost = []};
get(10131) ->
    #npc_shop_item_data{base_id = 10131, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("高塔"),
                        price = 80000, item_cost = []};
get(10132) ->
    #npc_shop_item_data{base_id = 10132, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法袍"),
                        price = 58000, item_cost = []};
get(10133) ->
    #npc_shop_item_data{base_id = 10133, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆腰带"),
                        price = 58000, item_cost = []};
get(10134) ->
    #npc_shop_item_data{base_id = 10134, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法裤"),
                        price = 58000, item_cost = []};
get(10136) ->
    #npc_shop_item_data{base_id = 10136, classes = 2,
                        sex = 2, type = 2, group = 30, name = lang:get("雷霆法鞋"),
                        price = 58000, item_cost = []};
get(10231) ->
    #npc_shop_item_data{base_id = 10231, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("箭歌"),
                        price = 80000, item_cost = []};
get(10232) ->
    #npc_shop_item_data{base_id = 10232, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影轻甲"),
                        price = 58000, item_cost = []};
get(10233) ->
    #npc_shop_item_data{base_id = 10233, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影腰带"),
                        price = 58000, item_cost = []};
get(10234) ->
    #npc_shop_item_data{base_id = 10234, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影裤子"),
                        price = 58000, item_cost = []};
get(10236) ->
    #npc_shop_item_data{base_id = 10236, classes = 3,
                        sex = 2, type = 2, group = 30, name = lang:get("迅影鞋子"),
                        price = 58000, item_cost = []};
get(10331) ->
    #npc_shop_item_data{base_id = 10331, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("崩山"),
                        price = 80000, item_cost = []};
get(10332) ->
    #npc_shop_item_data{base_id = 10332, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性铠甲"),
                        price = 58000, item_cost = []};
get(10333) ->
    #npc_shop_item_data{base_id = 10333, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性腰带"),
                        price = 58000, item_cost = []};
get(10334) ->
    #npc_shop_item_data{base_id = 10334, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性裤子"),
                        price = 58000, item_cost = []};
get(10336) ->
    #npc_shop_item_data{base_id = 10336, classes = 4,
                        sex = 2, type = 2, group = 30, name = lang:get("野性鞋子"),
                        price = 58000, item_cost = []};
get(10431) ->
    #npc_shop_item_data{base_id = 10431, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("赦令"),
                        price = 80000, item_cost = []};
get(10432) ->
    #npc_shop_item_data{base_id = 10432, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言布甲"),
                        price = 58000, item_cost = []};
get(10433) ->
    #npc_shop_item_data{base_id = 10433, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言腰带"),
                        price = 58000, item_cost = []};
get(10434) ->
    #npc_shop_item_data{base_id = 10434, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言裤子"),
                        price = 58000, item_cost = []};
get(10436) ->
    #npc_shop_item_data{base_id = 10436, classes = 5,
                        sex = 2, type = 2, group = 30, name = lang:get("真言轻鞋"),
                        price = 58000, item_cost = []};
get(10631) ->
    #npc_shop_item_data{base_id = 10631, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("霜天"),
                        price = 80000, item_cost = []};
get(10632) ->
    #npc_shop_item_data{base_id = 10632, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影战袍"),
                        price = 58000, item_cost = []};
get(10633) ->
    #npc_shop_item_data{base_id = 10633, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影腰带"),
                        price = 58000, item_cost = []};
get(10634) ->
    #npc_shop_item_data{base_id = 10634, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影护腿"),
                        price = 58000, item_cost = []};
get(10636) ->
    #npc_shop_item_data{base_id = 10636, classes = 6,
                        sex = 2, type = 2, group = 30, name = lang:get("寒影战靴"),
                        price = 58000, item_cost = []};
get(10731) ->
    #npc_shop_item_data{base_id = 10731, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("壁垒"),
                        price = 80000, item_cost = []};
get(10732) ->
    #npc_shop_item_data{base_id = 10732, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏板甲"),
                        price = 58000, item_cost = []};
get(10733) ->
    #npc_shop_item_data{base_id = 10733, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏腰带"),
                        price = 58000, item_cost = []};
get(10734) ->
    #npc_shop_item_data{base_id = 10734, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏重靴"),
                        price = 58000, item_cost = []};
get(10736) ->
    #npc_shop_item_data{base_id = 10736, classes = 7,
                        sex = 2, type = 2, group = 30, name = lang:get("无畏腿铠"),
                        price = 58000, item_cost = []};
get(21400) ->
    #npc_shop_item_data{base_id = 21400, classes = 0,
                        sex = 2, type = 1, name = lang:get("明月草"), price = 3600,
                        item_cost = []};
get(21406) ->
    #npc_shop_item_data{base_id = 21406, classes = 0,
                        sex = 2, type = 1, step = 10, name = lang:get("凤凰极光"),
                        price = 22500, item_cost = []};
get(21410) ->
    #npc_shop_item_data{base_id = 21410, classes = 0,
                        sex = 2, type = 1, name = lang:get("接骨木"), price = 960,
                        item_cost = []};
get(21411) ->
    #npc_shop_item_data{base_id = 21411, classes = 0,
                        sex = 2, type = 1, name = lang:get("曼陀罗"), price = 960,
                        item_cost = []};
get(21412) ->
    #npc_shop_item_data{base_id = 21412, classes = 0,
                        sex = 2, type = 1, name = lang:get("迷迭香"), price = 1800,
                        item_cost = []};
get(21413) ->
    #npc_shop_item_data{base_id = 21413, classes = 0,
                        sex = 2, type = 1, name = lang:get("紫罗兰"), price = 1800,
                        item_cost = []};
get(21414) ->
    #npc_shop_item_data{base_id = 21414, classes = 0,
                        sex = 2, type = 1, name = lang:get("魔法石"), price = 1200,
                        item_cost = []};
get(_BaseId) -> none.

get_classes_item(0) ->
    [#npc_shop_item_data{base_id = 10511, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("秘银指环"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10512, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("风语项链"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10514, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("影钢手镯"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10521, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("精金指环"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10522, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("光逝项链"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10524, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("霜霭手镯"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10531, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("群山徽记"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10532, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("潮汐项链"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10534, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("雷铸手镯"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 21400, classes = 0,
                         sex = 2, type = 1, name = lang:get("明月草"),
                         price = 3600, item_cost = []},
     #npc_shop_item_data{base_id = 21406, classes = 0,
                         sex = 2, type = 1, step = 10, name = lang:get("凤凰极光"),
                         price = 22500, item_cost = []},
     #npc_shop_item_data{base_id = 21410, classes = 0,
                         sex = 2, type = 1, name = lang:get("接骨木"), price = 960,
                         item_cost = []},
     #npc_shop_item_data{base_id = 21411, classes = 0,
                         sex = 2, type = 1, name = lang:get("曼陀罗"), price = 960,
                         item_cost = []},
     #npc_shop_item_data{base_id = 21412, classes = 0,
                         sex = 2, type = 1, name = lang:get("迷迭香"),
                         price = 1800, item_cost = []},
     #npc_shop_item_data{base_id = 21413, classes = 0,
                         sex = 2, type = 1, name = lang:get("紫罗兰"),
                         price = 1800, item_cost = []},
     #npc_shop_item_data{base_id = 21414, classes = 0,
                         sex = 2, type = 1, name = lang:get("魔法石"),
                         price = 1200, item_cost = []}];
get_classes_item(1) ->
    [#npc_shop_item_data{base_id = 10011, classes = 1,
                         sex = 2, type = 2, group = 10, name = lang:get("流光之刃"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10012, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士锁甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10013, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10014, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10016, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10021, classes = 1,
                         sex = 2, type = 2, group = 20, name = lang:get("血牙双剑"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10022, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者锁甲"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10023, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者腰带"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10024, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者裤子"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10026, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者鞋子"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10031, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("狮心"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10032, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风锁甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10033, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10034, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10036, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风鞋子"),
                         price = 58000, item_cost = []}];
get_classes_item(2) ->
    [#npc_shop_item_data{base_id = 10111, classes = 2,
                         sex = 2, type = 2, group = 10, name = lang:get("奥能法杖"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10112, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法袍"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10113, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10114, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法裤"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10116, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法鞋"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10121, classes = 2,
                         sex = 2, type = 2, group = 20, name = lang:get("风暴权杖"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10122, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法袍"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10123, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10124, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法裤"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10126, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法鞋"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10131, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("高塔"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10132, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法袍"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10133, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10134, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法裤"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10136, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法鞋"),
                         price = 58000, item_cost = []}];
get_classes_item(3) ->
    [#npc_shop_item_data{base_id = 10211, classes = 3,
                         sex = 2, type = 2, group = 10, name = lang:get("爆裂长弓"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10212, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手轻甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10213, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10214, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10216, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10221, classes = 3,
                         sex = 2, type = 2, group = 20, name = lang:get("暮光长弓"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10222, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者轻甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10223, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10224, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10226, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者鞋子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10231, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("箭歌"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10232, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影轻甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10233, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10234, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10236, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影鞋子"),
                         price = 58000, item_cost = []}];
get_classes_item(4) ->
    [#npc_shop_item_data{base_id = 10311, classes = 4,
                         sex = 2, type = 2, group = 10, name = lang:get("幻影拳甲"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10312, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者铠甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10313, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10314, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10316, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10321, classes = 4,
                         sex = 2, type = 2, group = 20, name = lang:get("冰岩巨锤"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10322, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使铠甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10323, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10324, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10326, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使鞋子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10331, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("崩山"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10332, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性铠甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10333, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10334, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10336, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性鞋子"),
                         price = 58000, item_cost = []}];
get_classes_item(5) ->
    [#npc_shop_item_data{base_id = 10411, classes = 5,
                         sex = 2, type = 2, group = 10, name = lang:get("言咒魔典"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10412, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师布甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10413, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10414, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10416, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师轻鞋"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10421, classes = 5,
                         sex = 2, type = 2, group = 20, name = lang:get("秩序法典"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10422, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者布甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10423, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10424, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10426, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者轻鞋"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10431, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("赦令"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10432, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言布甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10433, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10434, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10436, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言轻鞋"),
                         price = 58000, item_cost = []}];
get_classes_item(6) ->
    [#npc_shop_item_data{base_id = 10611, classes = 6,
                         sex = 2, type = 2, group = 10, name = lang:get("新月战刃"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10612, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人战袍"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10613, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10614, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人护腿"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10616, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人战靴"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10621, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("月神战刃"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10622, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌战袍"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10623, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌腰带"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10624, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌护腿"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10626, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌战靴"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10631, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("霜天"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10632, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影战袍"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10633, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10634, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影护腿"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10636, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影战靴"),
                         price = 58000, item_cost = []}];
get_classes_item(7) ->
    [#npc_shop_item_data{base_id = 10711, classes = 7,
                         sex = 2, type = 2, group = 10, name = lang:get("帝国枪盾"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10712, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士板甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10713, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10714, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士重靴"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10716, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士腿铠"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10721, classes = 7,
                         sex = 2, type = 2, group = 20, name = lang:get("守护枪盾"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10722, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者板甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10723, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10724, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者重靴"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10726, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者腿铠"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10731, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("壁垒"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10732, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏板甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10733, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10734, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏重靴"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10736, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏腿铠"),
                         price = 58000, item_cost = []}];
get_classes_item(_) -> [].

get_item_list({2, 0}) ->
    [#npc_shop_item_data{base_id = 10511, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("秘银指环"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10512, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("风语项链"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10514, classes = 0,
                         sex = 2, type = 2, group = 10, name = lang:get("影钢手镯"),
                         price = 2750, item_cost = []},
     #npc_shop_item_data{base_id = 10521, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("精金指环"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10522, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("光逝项链"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10524, classes = 0,
                         sex = 2, type = 2, group = 20, name = lang:get("霜霭手镯"),
                         price = 26000, item_cost = []},
     #npc_shop_item_data{base_id = 10531, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("群山徽记"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10532, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("潮汐项链"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10534, classes = 0,
                         sex = 2, type = 2, group = 30, name = lang:get("雷铸手镯"),
                         price = 58000, item_cost = []}];
get_item_list({2, 1}) ->
    [#npc_shop_item_data{base_id = 10011, classes = 1,
                         sex = 2, type = 2, group = 10, name = lang:get("流光之刃"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10012, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士锁甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10013, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10014, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10016, classes = 1,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("狂剑士鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10021, classes = 1,
                         sex = 2, type = 2, group = 20, name = lang:get("血牙双剑"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10022, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者锁甲"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10023, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者腰带"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10024, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者裤子"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10026, classes = 1,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("剑语者鞋子"), price = 26000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10031, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("狮心"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10032, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风锁甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10033, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10034, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10036, classes = 1,
                         sex = 2, type = 2, group = 30, name = lang:get("怒风鞋子"),
                         price = 58000, item_cost = []}];
get_item_list({2, 2}) ->
    [#npc_shop_item_data{base_id = 10111, classes = 2,
                         sex = 2, type = 2, group = 10, name = lang:get("奥能法杖"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10112, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法袍"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10113, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10114, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法裤"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10116, classes = 2,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("魔法师法鞋"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10121, classes = 2,
                         sex = 2, type = 2, group = 20, name = lang:get("风暴权杖"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10122, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法袍"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10123, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10124, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法裤"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10126, classes = 2,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("元素使法鞋"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10131, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("高塔"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10132, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法袍"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10133, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10134, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法裤"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10136, classes = 2,
                         sex = 2, type = 2, group = 30, name = lang:get("雷霆法鞋"),
                         price = 58000, item_cost = []}];
get_item_list({2, 3}) ->
    [#npc_shop_item_data{base_id = 10211, classes = 3,
                         sex = 2, type = 2, group = 10, name = lang:get("爆裂长弓"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10212, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手轻甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10213, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10214, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10216, classes = 3,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("神射手鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10221, classes = 3,
                         sex = 2, type = 2, group = 20, name = lang:get("暮光长弓"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10222, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者轻甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10223, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10224, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10226, classes = 3,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("巡游者鞋子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10231, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("箭歌"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10232, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影轻甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10233, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10234, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10236, classes = 3,
                         sex = 2, type = 2, group = 30, name = lang:get("迅影鞋子"),
                         price = 58000, item_cost = []}];
get_item_list({2, 4}) ->
    [#npc_shop_item_data{base_id = 10311, classes = 4,
                         sex = 2, type = 2, group = 10, name = lang:get("幻影拳甲"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10312, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者铠甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10313, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10314, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10316, classes = 4,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("幻灵者鞋子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10321, classes = 4,
                         sex = 2, type = 2, group = 20, name = lang:get("冰岩巨锤"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10322, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使铠甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10323, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10324, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10326, classes = 4,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("守护使鞋子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10331, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("崩山"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10332, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性铠甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10333, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10334, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10336, classes = 4,
                         sex = 2, type = 2, group = 30, name = lang:get("野性鞋子"),
                         price = 58000, item_cost = []}];
get_item_list({2, 5}) ->
    [#npc_shop_item_data{base_id = 10411, classes = 5,
                         sex = 2, type = 2, group = 10, name = lang:get("言咒魔典"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10412, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师布甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10413, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10414, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师裤子"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10416, classes = 5,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("秘言师轻鞋"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10421, classes = 5,
                         sex = 2, type = 2, group = 20, name = lang:get("秩序法典"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10422, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者布甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10423, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10424, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者裤子"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10426, classes = 5,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("预言者轻鞋"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10431, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("赦令"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10432, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言布甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10433, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10434, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言裤子"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10436, classes = 5,
                         sex = 2, type = 2, group = 30, name = lang:get("真言轻鞋"),
                         price = 58000, item_cost = []}];
get_item_list({2, 6}) ->
    [#npc_shop_item_data{base_id = 10611, classes = 6,
                         sex = 2, type = 2, group = 10, name = lang:get("新月战刃"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10612, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人战袍"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10613, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10614, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人护腿"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10616, classes = 6,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("守夜人战靴"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10621, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("月神战刃"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10622, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌战袍"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10623, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌腰带"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10624, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌护腿"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10626, classes = 6,
                         sex = 2, type = 2, group = 20, name = lang:get("夜歌战靴"),
                         price = 24000, item_cost = []},
     #npc_shop_item_data{base_id = 10631, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("霜天"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10632, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影战袍"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10633, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10634, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影护腿"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10636, classes = 6,
                         sex = 2, type = 2, group = 30, name = lang:get("寒影战靴"),
                         price = 58000, item_cost = []}];
get_item_list({2, 7}) ->
    [#npc_shop_item_data{base_id = 10711, classes = 7,
                         sex = 2, type = 2, group = 10, name = lang:get("帝国枪盾"),
                         price = 5000, item_cost = []},
     #npc_shop_item_data{base_id = 10712, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士板甲"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10713, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士腰带"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10714, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士重靴"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10716, classes = 7,
                         sex = 2, type = 2, group = 10,
                         name = lang:get("圣骑士腿铠"), price = 2750,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10721, classes = 7,
                         sex = 2, type = 2, group = 20, name = lang:get("守护枪盾"),
                         price = 38000, item_cost = []},
     #npc_shop_item_data{base_id = 10722, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者板甲"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10723, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者腰带"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10724, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者重靴"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10726, classes = 7,
                         sex = 2, type = 2, group = 20,
                         name = lang:get("审判者腿铠"), price = 24000,
                         item_cost = []},
     #npc_shop_item_data{base_id = 10731, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("壁垒"),
                         price = 80000, item_cost = []},
     #npc_shop_item_data{base_id = 10732, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏板甲"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10733, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏腰带"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10734, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏重靴"),
                         price = 58000, item_cost = []},
     #npc_shop_item_data{base_id = 10736, classes = 7,
                         sex = 2, type = 2, group = 30, name = lang:get("无畏腿铠"),
                         price = 58000, item_cost = []}];
get_item_list({1, 0}) ->
    [#npc_shop_item_data{base_id = 21400, classes = 0,
                         sex = 2, type = 1, name = lang:get("明月草"),
                         price = 3600, item_cost = []},
     #npc_shop_item_data{base_id = 21406, classes = 0,
                         sex = 2, type = 1, step = 10, name = lang:get("凤凰极光"),
                         price = 22500, item_cost = []},
     #npc_shop_item_data{base_id = 21410, classes = 0,
                         sex = 2, type = 1, name = lang:get("接骨木"), price = 960,
                         item_cost = []},
     #npc_shop_item_data{base_id = 21411, classes = 0,
                         sex = 2, type = 1, name = lang:get("曼陀罗"), price = 960,
                         item_cost = []},
     #npc_shop_item_data{base_id = 21412, classes = 0,
                         sex = 2, type = 1, name = lang:get("迷迭香"),
                         price = 1800, item_cost = []},
     #npc_shop_item_data{base_id = 21413, classes = 0,
                         sex = 2, type = 1, name = lang:get("紫罗兰"),
                         price = 1800, item_cost = []},
     #npc_shop_item_data{base_id = 21414, classes = 0,
                         sex = 2, type = 1, name = lang:get("魔法石"),
                         price = 1200, item_cost = []}];
get_item_list(_) -> [].

get_challenge_medicine(21451) ->
    #npc_shop_item_data{base_id = 21451, classes = 0,
                        sex = 2, type = 3, name = lang:get("金月桂(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21452) ->
    #npc_shop_item_data{base_id = 21452, classes = 0,
                        sex = 2, type = 3, name = lang:get("幻光粉(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21453) ->
    #npc_shop_item_data{base_id = 21453, classes = 0,
                        sex = 2, type = 3, name = lang:get("珊瑚晨露(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21454) ->
    #npc_shop_item_data{base_id = 21454, classes = 0,
                        sex = 2, type = 3, name = lang:get("星辰露(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21455) ->
    #npc_shop_item_data{base_id = 21455, classes = 0,
                        sex = 2, type = 3, name = lang:get("月光泉(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21456) ->
    #npc_shop_item_data{base_id = 21456, classes = 0,
                        sex = 2, type = 3, name = lang:get("凤凰复活散(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21457) ->
    #npc_shop_item_data{base_id = 21457, classes = 0,
                        sex = 2, type = 3, name = lang:get("神佑仙泉(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21458) ->
    #npc_shop_item_data{base_id = 21458, classes = 0,
                        sex = 2, type = 3, name = lang:get("踏梦尘(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21459) ->
    #npc_shop_item_data{base_id = 21459, classes = 0,
                        sex = 2, type = 3, name = lang:get("爆燃果(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(21460) ->
    #npc_shop_item_data{base_id = 21460, classes = 0,
                        sex = 2, type = 3, name = lang:get("烈焰果(擂)"),
                        price = 500, item_cost = []};
get_challenge_medicine(_) -> none.

get_fashion_exchange(29552) ->
    #npc_shop_item_data{base_id = 29552, classes = 0,
                        sex = 0, type = 4, name = lang:get("青葱岁月·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29553) ->
    #npc_shop_item_data{base_id = 29553, classes = 0,
                        sex = 1, type = 4, name = lang:get("青葱岁月·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29577) ->
    #npc_shop_item_data{base_id = 29577, classes = 0,
                        sex = 0, type = 4, name = lang:get("森之精灵·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29578) ->
    #npc_shop_item_data{base_id = 29578, classes = 0,
                        sex = 1, type = 4, name = lang:get("森之精灵·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29434) ->
    #npc_shop_item_data{base_id = 29434, classes = 0,
                        sex = 1, type = 4, name = lang:get("炽热蔷薇·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29433) ->
    #npc_shop_item_data{base_id = 29433, classes = 0,
                        sex = 0, type = 4, name = lang:get("炽热蔷薇·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29367) ->
    #npc_shop_item_data{base_id = 29367, classes = 0,
                        sex = 0, type = 4, name = lang:get("月白风清·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29368) ->
    #npc_shop_item_data{base_id = 29368, classes = 0,
                        sex = 1, type = 4, name = lang:get("月白风清·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29399) ->
    #npc_shop_item_data{base_id = 29399, classes = 0,
                        sex = 0, type = 4, name = lang:get("星空幻想·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29400) ->
    #npc_shop_item_data{base_id = 29400, classes = 0,
                        sex = 1, type = 4, name = lang:get("星空幻想·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29448) ->
    #npc_shop_item_data{base_id = 29448, classes = 0,
                        sex = 0, type = 4, name = lang:get("狐狸公主·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29449) ->
    #npc_shop_item_data{base_id = 29449, classes = 0,
                        sex = 1, type = 4, name = lang:get("狼爵绅士·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29457) ->
    #npc_shop_item_data{base_id = 29457, classes = 0,
                        sex = 0, type = 4, name = lang:get("少女心思·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29458) ->
    #npc_shop_item_data{base_id = 29458, classes = 0,
                        sex = 1, type = 4, name = lang:get("神探披风·永久"),
                        price = 0, item_cost = [{24022, 2}]};
get_fashion_exchange(29554) ->
    #npc_shop_item_data{base_id = 29554, classes = 0,
                        sex = 2, type = 4, name = lang:get("青春记忆·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29579) ->
    #npc_shop_item_data{base_id = 29579, classes = 0,
                        sex = 2, type = 4, name = lang:get("暖春精灵·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29548) ->
    #npc_shop_item_data{base_id = 29548, classes = 0,
                        sex = 1, type = 4, name = lang:get("森灵幻想·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29549) ->
    #npc_shop_item_data{base_id = 29549, classes = 0,
                        sex = 0, type = 4, name = lang:get("森灵幻想·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29556) ->
    #npc_shop_item_data{base_id = 29556, classes = 0,
                        sex = 0, type = 4, name = lang:get("美丽青春·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29557) ->
    #npc_shop_item_data{base_id = 29557, classes = 0,
                        sex = 1, type = 4, name = lang:get("热血青春·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29491) ->
    #npc_shop_item_data{base_id = 29491, classes = 0,
                        sex = 0, type = 4, name = lang:get("萌兔发卡·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29492) ->
    #npc_shop_item_data{base_id = 29492, classes = 0,
                        sex = 1, type = 4, name = lang:get("暖熊耳麦·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29455) ->
    #npc_shop_item_data{base_id = 29455, classes = 0,
                        sex = 0, type = 4, name = lang:get("公主暖帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29456) ->
    #npc_shop_item_data{base_id = 29456, classes = 0,
                        sex = 1, type = 4, name = lang:get("狼爵礼帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29446) ->
    #npc_shop_item_data{base_id = 29446, classes = 0,
                        sex = 2, type = 4, name = lang:get("北极小熊帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29469) ->
    #npc_shop_item_data{base_id = 29469, classes = 0,
                        sex = 2, type = 4, name = lang:get("萌蛋儿·永久"), price = 0,
                        item_cost = [{24022, 1}]};
get_fashion_exchange(29478) ->
    #npc_shop_item_data{base_id = 29478, classes = 0,
                        sex = 2, type = 4, name = lang:get("星梦小羊·180天"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29445) ->
    #npc_shop_item_data{base_id = 29445, classes = 0,
                        sex = 2, type = 4, name = lang:get("圣诞雪人·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29350) ->
    #npc_shop_item_data{base_id = 29350, classes = 0,
                        sex = 2, type = 4, name = lang:get("呆萌兔·永久"), price = 0,
                        item_cost = [{24022, 1}]};
get_fashion_exchange(29345) ->
    #npc_shop_item_data{base_id = 29345, classes = 0,
                        sex = 2, type = 4, name = lang:get("粽情飘香·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29369) ->
    #npc_shop_item_data{base_id = 29369, classes = 0,
                        sex = 2, type = 4, name = lang:get("抱月白猫·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29370) ->
    #npc_shop_item_data{base_id = 29370, classes = 0,
                        sex = 2, type = 4, name = lang:get("抱月黑猫·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29401) ->
    #npc_shop_item_data{base_id = 29401, classes = 0,
                        sex = 2, type = 4, name = lang:get("南瓜小Q·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29452) ->
    #npc_shop_item_data{base_id = 29452, classes = 0,
                        sex = 2, type = 4, name = lang:get("金鱼送福·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29343) ->
    #npc_shop_item_data{base_id = 29343, classes = 0,
                        sex = 1, type = 4, name = lang:get("时尚贝雷·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29344) ->
    #npc_shop_item_data{base_id = 29344, classes = 0,
                        sex = 0, type = 4, name = lang:get("时尚贝雷·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29348) ->
    #npc_shop_item_data{base_id = 29348, classes = 0,
                        sex = 1, type = 4, name = lang:get("时尚墨镜·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29349) ->
    #npc_shop_item_data{base_id = 29349, classes = 0,
                        sex = 0, type = 4, name = lang:get("冷傲警帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29384) ->
    #npc_shop_item_data{base_id = 29384, classes = 0,
                        sex = 2, type = 4, name = lang:get("牛仔帽·永久"), price = 0,
                        item_cost = [{24022, 1}]};
get_fashion_exchange(29402) ->
    #npc_shop_item_data{base_id = 29402, classes = 0,
                        sex = 0, type = 4, name = lang:get("幻梦蓝蝶·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29403) ->
    #npc_shop_item_data{base_id = 29403, classes = 0,
                        sex = 2, type = 4, name = lang:get("时空兔耳帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29405) ->
    #npc_shop_item_data{base_id = 29405, classes = 0,
                        sex = 2, type = 4, name = lang:get("小章鱼·永久"), price = 0,
                        item_cost = [{24022, 1}]};
get_fashion_exchange(29406) ->
    #npc_shop_item_data{base_id = 29406, classes = 0,
                        sex = 2, type = 4, name = lang:get("阿拉蕾帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(70233) ->
    #npc_shop_item_data{base_id = 70233, classes = 0,
                        sex = 0, type = 4, name = lang:get("火焰飞羽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29435) ->
    #npc_shop_item_data{base_id = 29435, classes = 0,
                        sex = 1, type = 4, name = lang:get("火焰飞羽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29459) ->
    #npc_shop_item_data{base_id = 29459, classes = 0,
                        sex = 2, type = 4, name = lang:get("侦探鹿皮帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(29468) ->
    #npc_shop_item_data{base_id = 29468, classes = 0,
                        sex = 2, type = 4, name = lang:get("星羽绒帽·永久"),
                        price = 0, item_cost = [{24022, 1}]};
get_fashion_exchange(_) -> false.

