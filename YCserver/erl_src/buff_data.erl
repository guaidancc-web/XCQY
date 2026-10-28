-file("src/data/buff_data.erl", 1).

-module(buff_data).

-export([get/1,
         get_class_conflict/1,
         get_looks/1,
         rand_ids/1,
         get_dynamic_attr/1,
         transform_combat_type/0,
         pet_former_combat_type/0,
         get_glyph/1,
         fruit_buff_ids/0]).

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

-file("src/data/buff_data.erl", 22).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/data/buff_data.erl", 23).

get(10000) ->
    #buff_base{id = 10000, name = lang:get("波波幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 30}, {56, -30}],
               looks = [{1, 30701}], effect = [{1, 82000, 1}],
               desc =
                   lang:get("变身<color='#00ff00'>波波球</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10001) ->
    #buff_base{id = 10001, name = lang:get("螳螂忍者幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}, {57, -30}],
               looks = [{1, 30704}], effect = [{1, 82005, 1}],
               desc =
                   lang:get("变身<color='#00ff00'>螳螂忍者</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10002) ->
    #buff_base{id = 10002, name = lang:get("飞刃忍者幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 50}],
               looks = [{1, 30709}],
               desc =
                   lang:get("变身为<color='#00ff00'>飞刃忍者</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10003) ->
    #buff_base{id = 10003, name = lang:get("森林巨人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}, {54, -30}],
               looks = [{1, 30712}], effect = [{1, 82021, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林巨人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10004) ->
    #buff_base{id = 10004, name = lang:get("炎魔幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 50}, {53, -50}],
               looks = [{1, 30715}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>炎魔</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10005) ->
    #buff_base{id = 10005, name = lang:get("云露幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 30}, {51, -30}],
               looks = [{1, 30700}], effect = [{1, 82006, 1}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>云露</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10006) ->
    #buff_base{id = 10006, name = lang:get("小浣熊幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 20}],
               looks = [{1, 30702}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>小浣熊</color>，持续<color='#"
                            "00ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff0"
                            "0'>3</color>场PVP战斗。")};
get(10007) ->
    #buff_base{id = 10007, name = lang:get("花莹幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 30}, {56, -30}],
               looks = [{1, 30703}], effect = [{1, 82022, 1}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>花莹</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10010) ->
    #buff_base{id = 10010, name = lang:get("小虎船长幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}, {56, -30}],
               looks = [{1, 30706}], effect = [{1, 82000, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>小虎船长</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10011) ->
    #buff_base{id = 10011, name = lang:get("树人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 30}, {56, -30}, {57, -30}],
               looks = [{1, 30707}], effect = [{1, 82001, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>树人</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10012) ->
    #buff_base{id = 10012, name = lang:get("雪狐幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 40}, {56, -30}],
               looks = [{1, 30710}], effect = [{1, 82023, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雪狐</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10013) ->
    #buff_base{id = 10013, name = lang:get("人鱼精灵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 40}, {56, -30}],
               looks = [{1, 30713}], effect = [{1, 82006, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>人鱼精灵</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10014) ->
    #buff_base{id = 10014, name = lang:get("功夫熊幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 60}, {54, -30}, {55, -30}],
               looks = [{1, 30716}], effect = [{1, 82007, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>功夫熊</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10020) ->
    #buff_base{id = 10020, name = lang:get("龙龟幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 30}, {53, -30}],
               looks = [{1, 30705}], effect = [{1, 82020, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙龟</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10021) ->
    #buff_base{id = 10021, name = lang:get("森林精灵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, -30}],
               looks = [{1, 30708}], effect = [{1, 82002, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林精灵</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10022) ->
    #buff_base{id = 10022, name = lang:get("犀牛战士幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 50}, {54, -20}, {55, -20}],
               looks = [{1, 30711}],
               desc =
                   lang:get("变身为<color='#00ff00'>犀牛战士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10023) ->
    #buff_base{id = 10023, name = lang:get("霜狼幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 40}, {57, -40}],
               looks = [{1, 30714}], effect = [{1, 82024, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>霜狼</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10024) ->
    #buff_base{id = 10024, name = lang:get("剑齿虎幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 50}, {56, -30}],
               looks = [{1, 30717}], effect = [{1, 82013, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑齿虎</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10025) ->
    #buff_base{id = 10025, name = lang:get("剑灵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}, {56, -30}],
               looks = [{1, 30722}], effect = [{1, 82009, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10026) ->
    #buff_base{id = 10026, name = lang:get("石头人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -30}, {55, -30}],
               looks = [{1, 30719}], effect = [{1, 82029, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石头人</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10027) ->
    #buff_base{id = 10027, name = lang:get("雷暴幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}, {56, -30}],
               looks = [{1, 30721}], effect = [{1, 82008, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷暴</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10028) ->
    #buff_base{id = 10028, name = lang:get("血伯爵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}, {56, -30}],
               looks = [{1, 30723}], effect = [{1, 82010, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>血伯爵</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10029) ->
    #buff_base{id = 10029, name = lang:get("雷霆战神幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}, {56, -30}],
               looks = [{1, 30724}], effect = [{1, 82011, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷霆战神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10030) ->
    #buff_base{id = 10030, name = lang:get("女神幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30725}], effect = [{1, 82053, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>月光女神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10031) ->
    #buff_base{id = 10031, name = lang:get("蝴蝶幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{55, 80}, {56, -30}, {22, 200}],
               looks = [{1, 30726}],
               desc =
                   lang:get("变身为<color='#00ff00'>蝴蝶花姬</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10032) ->
    #buff_base{id = 10032, name = lang:get("死骑幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30727}], effect = [{1, 82013, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>死亡骑士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10033) ->
    #buff_base{id = 10033, name = lang:get("剑客幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}, {57, -40}],
               looks = [{1, 30728}], effect = [{1, 82046, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>幻影剑客</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10034) ->
    #buff_base{id = 10034, name = lang:get("龙魂猎人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}, {57, -30}],
               looks = [{1, 30735}], effect = [{1, 82055, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙魂猎人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10035) ->
    #buff_base{id = 10035, name = lang:get("石灵儿幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}, {56, -20}],
               looks = [{1, 30736}], effect = [{1, 82058, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石灵儿</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10055) ->
    #buff_base{id = 10055, name = lang:get("剑灵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}, {56, -30}],
               looks = [{1, 30740}], effect = [{1, 82009, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10056) ->
    #buff_base{id = 10056, name = lang:get("石头人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -30}, {55, -30}],
               looks = [{1, 30741}], effect = [{1, 82029, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石头人</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10057) ->
    #buff_base{id = 10057, name = lang:get("雷暴幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}, {56, -30}],
               looks = [{1, 30742}], effect = [{1, 82008, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷暴</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10058) ->
    #buff_base{id = 10058, name = lang:get("血伯爵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}, {56, -30}],
               looks = [{1, 30743}], effect = [{1, 82010, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>血伯爵</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10059) ->
    #buff_base{id = 10059, name = lang:get("雷霆战神幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}, {56, -30}],
               looks = [{1, 30744}], effect = [{1, 82011, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷霆战神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10060) ->
    #buff_base{id = 10060, name = lang:get("女神幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30745}], effect = [{1, 82053, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>月光女神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10061) ->
    #buff_base{id = 10061, name = lang:get("蝴蝶幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{55, 80}, {56, -30}, {22, 200}],
               looks = [{1, 30746}],
               desc =
                   lang:get("变身为<color='#00ff00'>蝴蝶花姬</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10062) ->
    #buff_base{id = 10062, name = lang:get("死骑幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30747}], effect = [{1, 82013, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>死亡骑士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10063) ->
    #buff_base{id = 10063, name = lang:get("剑客幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}, {57, -40}],
               looks = [{1, 30748}], effect = [{1, 82046, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>幻影剑客</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10064) ->
    #buff_base{id = 10064, name = lang:get("龙魂猎人幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}, {57, -30}],
               looks = [{1, 30749}], effect = [{1, 82055, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙魂猎人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10065) ->
    #buff_base{id = 10065, name = lang:get("石灵儿幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}, {56, -20}],
               looks = [{1, 30750}], effect = [{1, 82058, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石灵儿</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50000) ->
    #buff_base{id = 50000, name = lang:get("波波幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 30}],
               looks = [{1, 30801}], effect = [{1, 82000, 1}],
               desc =
                   lang:get("变身<color='#00ff00'>波波球</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50001) ->
    #buff_base{id = 50001, name = lang:get("螳螂忍者幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}],
               looks = [{1, 30804}], effect = [{1, 82005, 1}],
               desc =
                   lang:get("变身<color='#00ff00'>螳螂忍者</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50002) ->
    #buff_base{id = 50002, name = lang:get("飞刃忍者幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 70}],
               looks = [{1, 30809}],
               desc =
                   lang:get("变身为<color='#00ff00'>飞刃忍者</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50003) ->
    #buff_base{id = 50003, name = lang:get("森林巨人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}, {54, -30}],
               looks = [{1, 30812}], effect = [{1, 82027, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林巨人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50004) ->
    #buff_base{id = 50004, name = lang:get("炎魔幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}, {53, -50}],
               looks = [{1, 30815}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>炎魔</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50005) ->
    #buff_base{id = 50005, name = lang:get("云露幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 30}],
               looks = [{1, 30800}], effect = [{1, 82006, 1}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>云露</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50006) ->
    #buff_base{id = 50006, name = lang:get("小浣熊幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 40}],
               looks = [{1, 30802}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>小浣熊</color>，持续<color='#"
                            "00ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff0"
                            "0'>3</color>场PVP战斗。")};
get(50007) ->
    #buff_base{id = 50007, name = lang:get("花莹幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 30}],
               looks = [{1, 30803}], effect = [{1, 82022, 1}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>花莹</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50010) ->
    #buff_base{id = 50010, name = lang:get("小虎船长幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 30}],
               looks = [{1, 30806}], effect = [{1, 82000, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>小虎船长</color>持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50011) ->
    #buff_base{id = 50011, name = lang:get("树人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 50}, {56, -30}, {57, -30}],
               looks = [{1, 30807}], effect = [{1, 82001, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>树人</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50012) ->
    #buff_base{id = 50012, name = lang:get("雪狐幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 40}],
               looks = [{1, 30810}], effect = [{1, 82023, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雪狐</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50013) ->
    #buff_base{id = 50013, name = lang:get("人鱼精灵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 40}],
               looks = [{1, 30813}], effect = [{1, 82006, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>人鱼精灵</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50014) ->
    #buff_base{id = 50014, name = lang:get("功夫熊幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 60}, {54, -30}, {55, -30}],
               looks = [{1, 30816}], effect = [{1, 82028, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>功夫熊</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50020) ->
    #buff_base{id = 50020, name = lang:get("龙龟幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 30}],
               looks = [{1, 30805}], effect = [{1, 82020, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙龟</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50021) ->
    #buff_base{id = 50021, name = lang:get("森林精灵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 20}, {53, -30}],
               looks = [{1, 30808}], effect = [{1, 82002, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林精灵</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50022) ->
    #buff_base{id = 50022, name = lang:get("犀牛战士幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 70}, {54, -20}, {55, -20}],
               looks = [{1, 30811}],
               desc =
                   lang:get("变身为<color='#00ff00'>犀牛战士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50023) ->
    #buff_base{id = 50023, name = lang:get("霜狼幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 40}, {57, -40}],
               looks = [{1, 30814}], effect = [{1, 82011, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>霜狼</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50024) ->
    #buff_base{id = 50024, name = lang:get("剑齿虎幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 50}],
               looks = [{1, 30817}], effect = [{1, 82013, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑齿虎</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50025) ->
    #buff_base{id = 50025, name = lang:get("剑灵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}],
               looks = [{1, 30822}], effect = [{1, 82009, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50026) ->
    #buff_base{id = 50026, name = lang:get("石头人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 100}, {54, -30}, {55, -30}],
               looks = [{1, 30819}], effect = [{1, 82029, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石头人</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50027) ->
    #buff_base{id = 50027, name = lang:get("雷暴幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}],
               looks = [{1, 30821}], effect = [{1, 82008, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷暴</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50028) ->
    #buff_base{id = 50028, name = lang:get("血伯爵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}],
               looks = [{1, 30823}], effect = [{1, 82010, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>血伯爵</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50029) ->
    #buff_base{id = 50029, name = lang:get("雷霆战神幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30824}], effect = [{1, 82011, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷霆战神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50030) ->
    #buff_base{id = 50030, name = lang:get("女神幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 100}, {54, -20}, {55, -20}],
               looks = [{1, 30825}], effect = [{1, 82054, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>月光女神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50031) ->
    #buff_base{id = 50031, name = lang:get("蝴蝶幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}, {22, 200}],
               looks = [{1, 30826}],
               desc =
                   lang:get("变身为<color='#00ff00'>蝴蝶花姬</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50032) ->
    #buff_base{id = 50032, name = lang:get("死骑幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30827}], effect = [{1, 82043, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>死亡骑士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50033) ->
    #buff_base{id = 50033, name = lang:get("剑客幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30828}], effect = [{1, 82046, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>幻影剑客</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50034) ->
    #buff_base{id = 50034, name = lang:get("龙魂猎人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30831}], effect = [{1, 82056, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙魂猎人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50035) ->
    #buff_base{id = 50035, name = lang:get("石灵儿幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}],
               looks = [{1, 30832}], effect = [{1, 82058, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石灵儿</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50036) ->
    #buff_base{id = 50036, name = lang:get("剑灵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}],
               looks = [{1, 30833}], effect = [{1, 82009, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50037) ->
    #buff_base{id = 50037, name = lang:get("石头人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 100}, {54, -30}, {55, -30}],
               looks = [{1, 30834}], effect = [{1, 82029, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石头人</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50038) ->
    #buff_base{id = 50038, name = lang:get("雷暴幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}],
               looks = [{1, 30835}], effect = [{1, 82008, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷暴</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(50039) ->
    #buff_base{id = 50039, name = lang:get("血伯爵幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}],
               looks = [{1, 30836}], effect = [{1, 82010, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>血伯爵</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(50040) ->
    #buff_base{id = 50040, name = lang:get("雷霆战神幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30837}], effect = [{1, 82011, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>雷霆战神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50041) ->
    #buff_base{id = 50041, name = lang:get("女神幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 100}, {54, -20}, {55, -20}],
               looks = [{1, 30838}], effect = [{1, 82054, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>月光女神</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50042) ->
    #buff_base{id = 50042, name = lang:get("蝴蝶幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}, {22, 200}],
               looks = [{1, 30839}],
               desc =
                   lang:get("变身为<color='#00ff00'>蝴蝶花姬</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50043) ->
    #buff_base{id = 50043, name = lang:get("死骑幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 80}, {54, -20}, {55, -20}],
               looks = [{1, 30840}], effect = [{1, 82043, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>死亡骑士</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50044) ->
    #buff_base{id = 50044, name = lang:get("剑客幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30841}], effect = [{1, 82046, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>幻影剑客</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50045) ->
    #buff_base{id = 50045, name = lang:get("龙魂猎人幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30842}], effect = [{1, 82056, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙魂猎人</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(50046) ->
    #buff_base{id = 50046, name = lang:get("石灵儿幻化（变异）"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}],
               looks = [{1, 30843}], effect = [{1, 82058, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>石灵儿</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51000) ->
    #buff_base{id = 51000, name = lang:get("菲雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 50}],
               looks = [{1, 30900}], effect = [{1, 82030, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>菲雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51001) ->
    #buff_base{id = 51001, name = lang:get("蓝雯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 50}],
               looks = [{1, 30901}], effect = [{1, 82031, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>蓝雯</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51002) ->
    #buff_base{id = 51002, name = lang:get("琴雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 60}],
               looks = [{1, 30902}], effect = [{1, 82032, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>琴雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51003) ->
    #buff_base{id = 51003, name = lang:get("凯恩幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 40}],
               looks = [{1, 30903}], effect = [{1, 82033, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯恩</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51004) ->
    #buff_base{id = 51004, name = lang:get("阿瑞斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}],
               looks = [{1, 30904}], effect = [{1, 82034, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>阿瑞斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51005) ->
    #buff_base{id = 51005, name = lang:get("福波斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}],
               looks = [{1, 30905}], effect = [{1, 82035, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>福波斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51006) ->
    #buff_base{id = 51006, name = lang:get("露露幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 70}],
               looks = [{1, 30906}], effect = [{1, 82036, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>露露</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51007) ->
    #buff_base{id = 51007, name = lang:get("佛格瑞特幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 50}],
               looks = [{1, 30907}], effect = [{1, 82037, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>佛格瑞特</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51008) ->
    #buff_base{id = 51008, name = lang:get("姬幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 80}],
               looks = [{1, 30908}], effect = [{1, 82038, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>姬</color>，持续<color='#00ff"
                            "00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>3"
                            "</color>场PVP战斗。")};
get(51009) ->
    #buff_base{id = 51009, name = lang:get("莉娜幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}],
               looks = [{1, 30909}], effect = [{1, 82039, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>莉娜</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51010) ->
    #buff_base{id = 51010, name = lang:get("无名幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30910}], effect = [{1, 82040, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>无名</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51011) ->
    #buff_base{id = 51011, name = lang:get("利贝尔幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 60}],
               looks = [{1, 30911}], effect = [{1, 82041, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>利贝尔二世</color>，持续<color='#"
                            "00ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff0"
                            "0'>3</color>场PVP战斗。")};
get(51012) ->
    #buff_base{id = 51012, name = lang:get("凯瑟琳幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30912}], effect = [{1, 82042, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯瑟琳</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51013) ->
    #buff_base{id = 51013, name = lang:get("南瓜精灵幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 60}, {51, 20}],
               looks = [{1, 30829}], effect = [{1, 82044, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>南瓜精灵</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51014) ->
    #buff_base{id = 51014, name = lang:get("南瓜恶魔幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{54, 80}, {55, 80}, {26, 20}],
               looks = [{1, 30830}], effect = [{1, 82045, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>南瓜恶魔</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51015) ->
    #buff_base{id = 51015, name = lang:get("博学小猪幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{56, 13}, {57, 14}, {51, 52}],
               looks = [{1, 76882}, {4, 10039}],
               desc =
                   lang:get("变身为<color='#00ff00'>博学小猪</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51100) ->
    #buff_base{id = 51100, name = lang:get("菲雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 60}],
               looks = [{1, 30900}], effect = [{1, 82030, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>菲雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51101) ->
    #buff_base{id = 51101, name = lang:get("蓝雯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 60}],
               looks = [{1, 30901}], effect = [{1, 82031, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>蓝雯</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51102) ->
    #buff_base{id = 51102, name = lang:get("琴雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 70}],
               looks = [{1, 30902}], effect = [{1, 82032, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>琴雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51103) ->
    #buff_base{id = 51103, name = lang:get("凯恩幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 50}],
               looks = [{1, 30903}], effect = [{1, 82033, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯恩</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51104) ->
    #buff_base{id = 51104, name = lang:get("阿瑞斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30904}], effect = [{1, 82034, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>阿瑞斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51105) ->
    #buff_base{id = 51105, name = lang:get("福波斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}],
               looks = [{1, 30905}], effect = [{1, 82035, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>福波斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51106) ->
    #buff_base{id = 51106, name = lang:get("露露幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 80}],
               looks = [{1, 30906}], effect = [{1, 82036, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>露露</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51107) ->
    #buff_base{id = 51107, name = lang:get("佛格瑞特幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 60}],
               looks = [{1, 30907}], effect = [{1, 82037, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>佛格瑞特</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51108) ->
    #buff_base{id = 51108, name = lang:get("姬幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 90}],
               looks = [{1, 30908}], effect = [{1, 82038, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>姬</color>，持续<color='#00ff"
                            "00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>3"
                            "</color>场PVP战斗。")};
get(51109) ->
    #buff_base{id = 51109, name = lang:get("莉娜幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}],
               looks = [{1, 30909}], effect = [{1, 82039, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>莉娜</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51110) ->
    #buff_base{id = 51110, name = lang:get("无名幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30910}], effect = [{1, 82040, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>无名</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51111) ->
    #buff_base{id = 51111, name = lang:get("利贝尔幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 80}],
               looks = [{1, 30911}], effect = [{1, 82041, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>利贝尔二世</color>，持续<color='#"
                            "00ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff0"
                            "0'>3</color>场PVP战斗。")};
get(51112) ->
    #buff_base{id = 51112, name = lang:get("凯瑟琳幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30912}], effect = [{1, 82042, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯瑟琳</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51200) ->
    #buff_base{id = 51200, name = lang:get("菲雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 70}],
               looks = [{1, 30900}], effect = [{1, 82030, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>菲雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51201) ->
    #buff_base{id = 51201, name = lang:get("蓝雯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 70}],
               looks = [{1, 30901}], effect = [{1, 82031, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>蓝雯</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51202) ->
    #buff_base{id = 51202, name = lang:get("琴雅幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 80}],
               looks = [{1, 30902}], effect = [{1, 82032, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>琴雅</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51203) ->
    #buff_base{id = 51203, name = lang:get("凯恩幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 60}],
               looks = [{1, 30903}], effect = [{1, 82033, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯恩</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51204) ->
    #buff_base{id = 51204, name = lang:get("阿瑞斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}],
               looks = [{1, 30904}], effect = [{1, 82034, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>阿瑞斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51205) ->
    #buff_base{id = 51205, name = lang:get("福波斯幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 80}],
               looks = [{1, 30905}], effect = [{1, 82035, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>福波斯</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(51206) ->
    #buff_base{id = 51206, name = lang:get("露露幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 90}],
               looks = [{1, 30906}], effect = [{1, 82036, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>露露</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51207) ->
    #buff_base{id = 51207, name = lang:get("佛格瑞特幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 70}],
               looks = [{1, 30907}], effect = [{1, 82037, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>佛格瑞特</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(51208) ->
    #buff_base{id = 51208, name = lang:get("姬幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{51, 100}],
               looks = [{1, 30908}], effect = [{1, 82038, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>姬</color>，持续<color='#00ff"
                            "00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>3"
                            "</color>场PVP战斗。")};
get(51209) ->
    #buff_base{id = 51209, name = lang:get("莉娜幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 90}],
               looks = [{1, 30909}], effect = [{1, 82039, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>莉娜</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51210) ->
    #buff_base{id = 51210, name = lang:get("无名幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 90}],
               looks = [{1, 30910}], effect = [{1, 82040, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>无名</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(51211) ->
    #buff_base{id = 51211, name = lang:get("利贝尔幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 90}],
               looks = [{1, 30911}], effect = [{1, 82041, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>利贝尔二世</color>，持续<color='#"
                            "00ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff0"
                            "0'>3</color>场PVP战斗。")};
get(51212) ->
    #buff_base{id = 51212, name = lang:get("凯瑟琳幻化"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 90}],
               looks = [{1, 30912}], effect = [{1, 82042, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>凯瑟琳</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10040) ->
    #buff_base{id = 10040, name = lang:get("幻境仙童"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 99, attr = [{51, 100}, {23, 100}],
               looks = [{1, 30700}, {5, 30112}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>每失败一次己方所有单位<col"
                            "or='#00ff00'>能力提升</color>")};
get(10041) ->
    #buff_base{id = 10041, name = lang:get("幻境守卫"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30705}, {5, 30113}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>可参与战斗的<color='#"
                            "00ff00'>守护为3人</color>")};
get(10042) ->
    #buff_base{id = 10042, name = lang:get("幻彩精灵"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30708}, {5, 30114}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>可参与战斗的<color='#"
                            "00ff00'>守护为2人</color>")};
get(10043) ->
    #buff_base{id = 10043, name = lang:get("幻境力士"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, guard_attr = [{51, 300}],
               looks = [{1, 30716}, {5, 30115}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>所有守护<color='#00"
                            "ff00'>生命值+30%</color>")};
get(10044) ->
    #buff_base{id = 10044, name = lang:get("幻影剑客"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, guard_attr = [{23, 200}],
               looks = [{1, 30722}, {5, 30116}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>所有守护<color='#00"
                            "ff00'>伤害+20%</color>")};
get(10045) ->
    #buff_base{id = 10045, name = lang:get("幻境之神"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 2, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 3600,
               max_effect_lev = 1,
               looks = [{1, 30726}, {5, 30117}, {4, 10032}],
               desc =
                   lang:get("<color='#ffff00'>场景效果：</color>战斗胜利获得<color='#"
                            "00ff00'>积分+20%</color>")};
get(10046) ->
    #buff_base{id = 10046, name = lang:get("加属性"),
               class = 21001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 900,
               max_effect_lev = 5,
               attr = [{23, 30}, {30, 30}, {31, 30}],
               guard_attr = [{23, 30}, {30, 30}, {31, 30}],
               desc =
                   lang:get("<color='#ffff00'>加属性:</color>角色和守护<color='#00"
                            "ff00'>伤害加成3%</color>,受到伤害减免<color='#00ff00'>3"
                            "%</color>,最多叠加5层")};
get(10047) ->
    #buff_base{id = 10047, name = lang:get("神兽百幻果[美猴王]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 80}, {57, -30}],
               looks = [{1, 30729}], effect = [{1, 82014, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>美猴王</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10048) ->
    #buff_base{id = 10048, name = lang:get("神兽百幻果[天使猪]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr = [{51, 50}, {56, 30}, {57, 30}],
               looks = [{1, 30730}], effect = [{1, 82015, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>天使飞猪</color>，持续<color='#0"
                            "0ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00"
                            "'>3</color>场PVP战斗。")};
get(10049) ->
    #buff_base{id = 10049, name = lang:get("神兽百幻果[南瓜君]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{54, 80}, {56, -50}],
               looks = [{1, 30731}], effect = [{1, 82016, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>南瓜君</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10050) ->
    #buff_base{id = 10050, name = lang:get("神兽百幻果[精灵龙]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 75}, {56, -30}],
               looks = [{1, 30732}], effect = [{1, 82019, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>精灵龙</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10051) ->
    #buff_base{id = 10051, name = lang:get("神兽百幻果[糖糖]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{55, 50}, {51, 30}],
               looks = [{1, 30733}], effect = [{1, 82018, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>糖糖</color>，持续<color='#00f"
                            "f00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'>"
                            "3</color>场PVP战斗。")};
get(10052) ->
    #buff_base{id = 10052, name = lang:get("神兽百幻果[皎月兔]"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{53, 60}, {61, 20}],
               looks = [{1, 30734}], effect = [{1, 82000, 1}],
               desc =
                   lang:get("变身为<color='#00ff00'>皎月兔</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(10090) ->
    #buff_base{id = 10090, name = lang:get("祝福果"),
               class = 10090, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 2, max_time_num = 24, duration = 3600,
               max_effect_lev = 1, attr = [{44, 50}],
               desc =
                   lang:get("祝福果散发的香气让您在普通战斗中获得<color='#ffff00'>15%</color"
                            ">的经验加成，持续<color='#ffff00'>1</color>小时")};
get(10091) ->
    #buff_base{id = 10091, name = lang:get("魔法石"),
               class = 10091, lev = 1, pvp_limit = 0, cancel = 1,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, effect = [{2, 1, 1}],
               desc = lang:get("在挂野区域不会被怪物攻击。")};
get(10110) ->
    #buff_base{id = 10110, name = lang:get("生命雕文1"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 150}]};
get(10111) ->
    #buff_base{id = 10111, name = lang:get("生命雕文2"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 350}]};
get(10112) ->
    #buff_base{id = 10112, name = lang:get("生命雕文3"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 550}]};
get(10113) ->
    #buff_base{id = 10113, name = lang:get("生命雕文4"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 750}]};
get(10114) ->
    #buff_base{id = 10114, name = lang:get("生命雕文5"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 950}]};
get(10115) ->
    #buff_base{id = 10115, name = lang:get("生命雕文6"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 1150}]};
get(10116) ->
    #buff_base{id = 10116, name = lang:get("生命雕文7"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 1350}]};
get(10117) ->
    #buff_base{id = 10117, name = lang:get("生命雕文8"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 1550}]};
get(10118) ->
    #buff_base{id = 10118, name = lang:get("生命雕文9"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 1750}]};
get(10119) ->
    #buff_base{id = 10119, name = lang:get("生命雕文10"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 1900}]};
get(11119) ->
    #buff_base{id = 11119, name = lang:get("生命雕文11"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 2050}]};
get(10120) ->
    #buff_base{id = 10120, name = lang:get("攻击雕纹1"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 45}]};
get(10121) ->
    #buff_base{id = 10121, name = lang:get("攻击雕纹2"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 104}]};
get(10122) ->
    #buff_base{id = 10122, name = lang:get("攻击雕纹3"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 164}]};
get(10123) ->
    #buff_base{id = 10123, name = lang:get("攻击雕纹4"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 223}]};
get(10124) ->
    #buff_base{id = 10124, name = lang:get("攻击雕纹5"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 283}]};
get(10125) ->
    #buff_base{id = 10125, name = lang:get("攻击雕纹6"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 342}]};
get(10126) ->
    #buff_base{id = 10126, name = lang:get("攻击雕纹7"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 402}]};
get(10127) ->
    #buff_base{id = 10127, name = lang:get("攻击雕纹8"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 461}]};
get(10128) ->
    #buff_base{id = 10128, name = lang:get("攻击雕纹9"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 521}]};
get(10129) ->
    #buff_base{id = 10129, name = lang:get("攻击雕纹10"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 565}]};
get(11129) ->
    #buff_base{id = 11129, name = lang:get("攻击雕文11"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 610}]};
get(10130) ->
    #buff_base{id = 10130, name = lang:get("魔力雕文1"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 36}]};
get(10131) ->
    #buff_base{id = 10131, name = lang:get("魔力雕文2"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 83}]};
get(10132) ->
    #buff_base{id = 10132, name = lang:get("魔力雕文3"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 131}]};
get(10133) ->
    #buff_base{id = 10133, name = lang:get("魔力雕文4"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 179}]};
get(10134) ->
    #buff_base{id = 10134, name = lang:get("魔力雕文5"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 226}]};
get(10135) ->
    #buff_base{id = 10135, name = lang:get("魔力雕文6"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 274}]};
get(10136) ->
    #buff_base{id = 10136, name = lang:get("魔力雕文7"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 321}]};
get(10137) ->
    #buff_base{id = 10137, name = lang:get("魔力雕文8"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 369}]};
get(10138) ->
    #buff_base{id = 10138, name = lang:get("魔力雕文9"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 417}]};
get(10139) ->
    #buff_base{id = 10139, name = lang:get("魔力雕文10"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 452}]};
get(11139) ->
    #buff_base{id = 11139, name = lang:get("魔力雕文11"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 488}]};
get(10140) ->
    #buff_base{id = 10140, name = lang:get("速度雕文1"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 4}]};
get(10141) ->
    #buff_base{id = 10141, name = lang:get("速度雕文2"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 10}]};
get(10142) ->
    #buff_base{id = 10142, name = lang:get("速度雕文3"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 16}]};
get(10143) ->
    #buff_base{id = 10143, name = lang:get("速度雕文4"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 22}]};
get(10144) ->
    #buff_base{id = 10144, name = lang:get("速度雕文5"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 28}]};
get(10145) ->
    #buff_base{id = 10145, name = lang:get("速度雕文6"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 34}]};
get(10146) ->
    #buff_base{id = 10146, name = lang:get("速度雕文7"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 40}]};
get(10147) ->
    #buff_base{id = 10147, name = lang:get("速度雕文8"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 46}]};
get(10148) ->
    #buff_base{id = 10148, name = lang:get("速度雕文9"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 52}]};
get(10149) ->
    #buff_base{id = 10149, name = lang:get("速度雕文10"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 56}]};
get(11149) ->
    #buff_base{id = 11149, name = lang:get("速度雕文11"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 61}]};
get(10150) ->
    #buff_base{id = 10150, name = lang:get("防御雕文1"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 23}]};
get(10151) ->
    #buff_base{id = 10151, name = lang:get("防御雕文2"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 54}]};
get(10152) ->
    #buff_base{id = 10152, name = lang:get("防御雕文3"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 85}]};
get(10153) ->
    #buff_base{id = 10153, name = lang:get("防御雕文4"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 116}]};
get(10154) ->
    #buff_base{id = 10154, name = lang:get("防御雕文5"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 147}]};
get(10155) ->
    #buff_base{id = 10155, name = lang:get("防御雕文6"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 178}]};
get(10156) ->
    #buff_base{id = 10156, name = lang:get("防御雕文7"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 209}]};
get(10157) ->
    #buff_base{id = 10157, name = lang:get("防御雕文8"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 240}]};
get(10158) ->
    #buff_base{id = 10158, name = lang:get("防御雕文9"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 271}]};
get(10159) ->
    #buff_base{id = 10159, name = lang:get("防御雕文10"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 294}]};
get(11159) ->
    #buff_base{id = 11159, name = lang:get("防御雕文11"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 317}]};
get(10160) ->
    #buff_base{id = 10160, name = lang:get("暴击雕文1"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 6}]};
get(10161) ->
    #buff_base{id = 10161, name = lang:get("暴击雕文2"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 16}]};
get(10162) ->
    #buff_base{id = 10162, name = lang:get("暴击雕文3"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 30}]};
get(10163) ->
    #buff_base{id = 10163, name = lang:get("暴击雕文4"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 57}]};
get(10164) ->
    #buff_base{id = 10164, name = lang:get("暴击雕文5"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 85}]};
get(10165) ->
    #buff_base{id = 10165, name = lang:get("暴击雕文6"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 117}]};
get(10166) ->
    #buff_base{id = 10166, name = lang:get("暴击雕文7"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 150}]};
get(10167) ->
    #buff_base{id = 10167, name = lang:get("暴击雕文8"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 186}]};
get(10168) ->
    #buff_base{id = 10168, name = lang:get("暴击雕文9"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 224}]};
get(10169) ->
    #buff_base{id = 10169, name = lang:get("暴击雕文10"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 264}]};
get(11169) ->
    #buff_base{id = 11169, name = lang:get("暴击雕文11"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 264}]};
get(10170) ->
    #buff_base{id = 10170, name = lang:get("魔攻雕文1"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 39}, {2, 192}]};
get(10171) ->
    #buff_base{id = 10171, name = lang:get("魔攻雕文2"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 91}, {2, 240}]};
get(10172) ->
    #buff_base{id = 10172, name = lang:get("魔攻雕文3"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 145}, {2, 288}]};
get(10173) ->
    #buff_base{id = 10173, name = lang:get("魔攻雕文4"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 196}, {2, 336}]};
get(10174) ->
    #buff_base{id = 10174, name = lang:get("魔攻雕文5"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 248}, {2, 384}]};
get(10175) ->
    #buff_base{id = 10175, name = lang:get("魔攻雕文6"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 301}, {2, 432}]};
get(10176) ->
    #buff_base{id = 10176, name = lang:get("魔攻雕文7"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 353}, {2, 480}]};
get(10177) ->
    #buff_base{id = 10177, name = lang:get("魔攻雕文8"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 405}, {2, 528}]};
get(10178) ->
    #buff_base{id = 10178, name = lang:get("魔攻雕文9"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 458}, {2, 576}]};
get(10179) ->
    #buff_base{id = 10179, name = lang:get("魔攻雕文10"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 497}, {2, 624}]};
get(11179) ->
    #buff_base{id = 11179, name = lang:get("魔攻雕文11"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 536}, {2, 672}]};
get(10180) ->
    #buff_base{id = 10180, name = lang:get("魔抗雕文1"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 20}]};
get(10181) ->
    #buff_base{id = 10181, name = lang:get("魔抗雕文2"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 47}]};
get(10182) ->
    #buff_base{id = 10182, name = lang:get("魔抗雕文3"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 74}]};
get(10183) ->
    #buff_base{id = 10183, name = lang:get("魔抗雕文4"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 102}]};
get(10184) ->
    #buff_base{id = 10184, name = lang:get("魔抗雕文5"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 129}]};
get(10185) ->
    #buff_base{id = 10185, name = lang:get("魔抗雕文6"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 156}]};
get(10186) ->
    #buff_base{id = 10186, name = lang:get("魔抗雕文7"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 183}]};
get(10187) ->
    #buff_base{id = 10187, name = lang:get("魔抗雕文8"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 211}]};
get(10188) ->
    #buff_base{id = 10188, name = lang:get("魔抗雕文9"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 238}]};
get(10189) ->
    #buff_base{id = 10189, name = lang:get("魔抗雕文10"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 258}]};
get(11189) ->
    #buff_base{id = 11189, name = lang:get("魔抗雕文11"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 279}]};
get(10190) ->
    #buff_base{id = 10190, name = lang:get("魔力雕文1"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 19}]};
get(10191) ->
    #buff_base{id = 10191, name = lang:get("魔力雕文2"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 43}]};
get(10192) ->
    #buff_base{id = 10192, name = lang:get("魔力雕文3"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 68}]};
get(10193) ->
    #buff_base{id = 10193, name = lang:get("魔力雕文4"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 93}]};
get(10194) ->
    #buff_base{id = 10194, name = lang:get("魔力雕文5"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 118}]};
get(10195) ->
    #buff_base{id = 10195, name = lang:get("魔力雕文6"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 142}]};
get(10196) ->
    #buff_base{id = 10196, name = lang:get("魔力雕文7"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 167}]};
get(10197) ->
    #buff_base{id = 10197, name = lang:get("魔力雕文8"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 192}]};
get(10198) ->
    #buff_base{id = 10198, name = lang:get("魔力雕文9"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 217}]};
get(10199) ->
    #buff_base{id = 10199, name = lang:get("魔力雕文10"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 235}]};
get(11199) ->
    #buff_base{id = 11199, name = lang:get("魔力雕文11"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 254}]};
get(11201) ->
    #buff_base{id = 11201, name = lang:get("坚韧雕文1"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 3}, {47, 7}]};
get(11202) ->
    #buff_base{id = 11202, name = lang:get("坚韧雕文2"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 8}, {47, 16}]};
get(11203) ->
    #buff_base{id = 11203, name = lang:get("坚韧雕文3"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 12}, {47, 24}]};
get(11204) ->
    #buff_base{id = 11204, name = lang:get("坚韧雕文4"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 17}, {47, 33}]};
get(11205) ->
    #buff_base{id = 11205, name = lang:get("坚韧雕文5"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 21}, {47, 42}]};
get(11206) ->
    #buff_base{id = 11206, name = lang:get("坚韧雕文6"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 26}, {47, 51}]};
get(11207) ->
    #buff_base{id = 11207, name = lang:get("坚韧雕文7"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 30}, {47, 60}]};
get(11208) ->
    #buff_base{id = 11208, name = lang:get("坚韧雕文8"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 34}, {47, 69}]};
get(11209) ->
    #buff_base{id = 11209, name = lang:get("坚韧雕文9"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 39}, {47, 78}]};
get(11210) ->
    #buff_base{id = 11210, name = lang:get("坚韧雕文10"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 42}, {47, 84}]};
get(11211) ->
    #buff_base{id = 11211, name = lang:get("坚韧雕文11"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 46}, {47, 91}]};
get(11212) ->
    #buff_base{id = 11212, name = lang:get("生命雕文12"),
               class = 10100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 2200}]};
get(11213) ->
    #buff_base{id = 11213, name = lang:get("攻击雕文12"),
               class = 10101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 655}]};
get(11214) ->
    #buff_base{id = 11214, name = lang:get("魔力雕文12"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 524}]};
get(11215) ->
    #buff_base{id = 11215, name = lang:get("速度雕文12"),
               class = 10103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 65}]};
get(11216) ->
    #buff_base{id = 11216, name = lang:get("防御雕文12"),
               class = 10104, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 340}]};
get(11217) ->
    #buff_base{id = 11217, name = lang:get("魔攻雕文12"),
               class = 10102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               dynamic_attr = [{5, 576}, {2, 792}]};
get(11218) ->
    #buff_base{id = 11218, name = lang:get("魔抗雕文12"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 299}]};
get(11219) ->
    #buff_base{id = 11219, name = lang:get("魔力雕文12"),
               class = 10106, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 272}]};
get(11220) ->
    #buff_base{id = 11220, name = lang:get("坚韧雕文12"),
               class = 10107, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 3,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{9, 49}, {47, 98}]};
get(10200) ->
    #buff_base{id = 10200, name = lang:get("双子座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{61, 20}],
               desc = lang:get("双子座守护着你，闪避+2%")};
get(10201) ->
    #buff_base{id = 10201, name = lang:get("金牛座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{56, 30}],
               desc = lang:get("金牛座守护着你，物防+3%")};
get(10202) ->
    #buff_base{id = 10202, name = lang:get("射手座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{60, 50}],
               desc = lang:get("射手座守护着你，命中+5%")};
get(10203) ->
    #buff_base{id = 10203, name = lang:get("狮子座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{54, 20}],
               desc = lang:get("狮子座守护着你，物攻+2%")};
get(10204) ->
    #buff_base{id = 10204, name = lang:get("水瓶座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{24, 30}],
               desc = lang:get("水瓶座守护着你，伤害减免+3%")};
get(10205) ->
    #buff_base{id = 10205, name = lang:get("白羊座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{43, 50}],
               desc = lang:get("白羊座守护着你，治疗加强+3%")};
get(10206) ->
    #buff_base{id = 10206, name = lang:get("天蝎座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{58, 20}],
               desc = lang:get("天蝎座守护着你，暴击+2%")};
get(10207) ->
    #buff_base{id = 10207, name = lang:get("星座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1};
get(10208) ->
    #buff_base{id = 10208, name = lang:get("星座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1};
get(10209) ->
    #buff_base{id = 10209, name = lang:get("星座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1};
get(10210) ->
    #buff_base{id = 10210, name = lang:get("星座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1};
get(10211) ->
    #buff_base{id = 10211, name = lang:get("星座祝福"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1};
get(10301) ->
    #buff_base{id = 10301, name = lang:get("甘甜的苹果"),
               class = 10301, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{1, 200}]};
get(10302) ->
    #buff_base{id = 10302, name = lang:get("甜美的香瓜"),
               class = 10302, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{4, 50}]};
get(10303) ->
    #buff_base{id = 10303, name = lang:get("甜蜜的蜜桃"),
               class = 10303, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{5, 40}]};
get(10304) ->
    #buff_base{id = 10304, name = lang:get("可口的杨桃"),
               class = 10304, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{7, 24}]};
get(10305) ->
    #buff_base{id = 10305, name = lang:get("甜蜜的荔枝"),
               class = 10305, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{3, 10}]};
get(10306) ->
    #buff_base{id = 10306, name = lang:get("香甜的芒果"),
               class = 10306, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{6, 30}]};
get(10307) ->
    #buff_base{id = 10307, name = lang:get("清甜的香橙"),
               class = 10307, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 86400,
               max_effect_lev = 1, dynamic_attr = [{8, 10}]};
get(11000) ->
    #buff_base{id = 11000, name = lang:get("宠物情缘「云露」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30700}],
               desc =
                   lang:get("变身<color='#00ff00'>波波球</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11001) ->
    #buff_base{id = 11001, name = lang:get("宠物情缘「波波」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30701}],
               desc =
                   lang:get("变身为<color='#00ff00'>螳螂忍者</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11002) ->
    #buff_base{id = 11002, name = lang:get("宠物情缘「小浣熊」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30702}],
               desc =
                   lang:get("变身为<color='#00ff00'>飞刃忍者</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11003) ->
    #buff_base{id = 11003, name = lang:get("宠物情缘「花莹」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30703}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林巨人</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11004) ->
    #buff_base{id = 11004, name = lang:get("宠物情缘「螳螂忍者」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30704}],
               desc =
                   lang:get("变身为\n<color='#00ff00'>炎魔</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11005) ->
    #buff_base{id = 11005, name = lang:get("宠物情缘「龙龟」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30705}],
               desc =
                   lang:get("变身为<color='#00ff00'>小虎船长</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11006) ->
    #buff_base{id = 11006, name = lang:get("宠物情缘「小虎船长」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30706}],
               desc =
                   lang:get("变身为<color='#00ff00'>树人</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11007) ->
    #buff_base{id = 11007, name = lang:get("宠物情缘「树人」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30707}],
               desc =
                   lang:get("变身为<color='#00ff00'>雪狐</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11008) ->
    #buff_base{id = 11008, name = lang:get("宠物情缘「森林精灵」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30708}],
               desc =
                   lang:get("变身为<color='#00ff00'>人鱼精灵</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11009) ->
    #buff_base{id = 11009, name = lang:get("宠物情缘「飞刃忍者」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30709}],
               desc =
                   lang:get("变身为<color='#00ff00'>功夫熊</color>参加<color='#fff"
                            "f00'>宠物情缘</color>活动")};
get(11010) ->
    #buff_base{id = 11010, name = lang:get("宠物情缘「雪狐」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30710}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙龟</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11011) ->
    #buff_base{id = 11011, name = lang:get("宠物情缘「犀牛战士」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30711}],
               desc =
                   lang:get("变身为<color='#00ff00'>龙龟</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11012) ->
    #buff_base{id = 11012, name = lang:get("宠物情缘「森林巨人」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30712}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林精灵</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11013) ->
    #buff_base{id = 11013, name = lang:get("宠物情缘「人鱼精灵」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30713}],
               desc =
                   lang:get("变身为<color='#00ff00'>森林精灵</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11014) ->
    #buff_base{id = 11014, name = lang:get("宠物情缘「霜狼」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30714}],
               desc =
                   lang:get("变身为<color='#00ff00'>犀牛战士</color>参加<color='#ff"
                            "ff00'>宠物情缘</color>活动")};
get(11015) ->
    #buff_base{id = 11015, name = lang:get("宠物情缘「炎魔」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30715}],
               desc =
                   lang:get("变身为<color='#00ff00'>霜狼</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11016) ->
    #buff_base{id = 11016, name = lang:get("宠物情缘「功夫熊」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30716}],
               desc =
                   lang:get("变身为<color='#00ff00'>霜狼</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11017) ->
    #buff_base{id = 11017, name = lang:get("宠物情缘「剑齿虎」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30717}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(11018) ->
    #buff_base{id = 11018, name = lang:get("宠物情缘「剑灵」"),
               class = 10000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{1, 30722}],
               desc =
                   lang:get("变身为<color='#00ff00'>剑灵</color>参加<color='#ffff"
                            "00'>宠物情缘</color>活动")};
get(12000) ->
    #buff_base{id = 12000, name = lang:get("悬赏达人"),
               class = 12000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{3, 150, 1}],
               desc =
                   lang:get("<color='#ffff00'>悬赏任务</color>角色经验额外加成<color='"
                            "#ffff00'>15%</color>，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12001) ->
    #buff_base{id = 12001, name = lang:get("悬赏达人II"),
               class = 12000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{3, 300, 1}],
               desc =
                   lang:get("<color='#ffff00'>悬赏任务</color>角色经验额外加成<color='"
                            "#ffff00'>30%</color>，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12002) ->
    #buff_base{id = 12002, name = lang:get("悬赏达人Ⅲ"),
               class = 12000, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{3, 500, 1}],
               desc =
                   lang:get("<color='#ffff00'>悬赏任务</color>角色经验额外加成<color='"
                            "#ffff00'>50%</color>")};
get(12010) ->
    #buff_base{id = 12010, name = lang:get("职业达人"),
               class = 12010, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{20, 150, 1}],
               desc =
                   lang:get("<color='#ffff00'>职业任务</color>角色经验额外加成<color='"
                            "#ffff00'>15%</color>，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12011) ->
    #buff_base{id = 12011, name = lang:get("职业达人II"),
               class = 12010, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{20, 300, 1}],
               desc =
                   lang:get("<color='#ffff00'>职业任务</color>角色经验额外加成<color='"
                            "#ffff00'>30%</color>，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12012) ->
    #buff_base{id = 12012, name = lang:get("职业达人Ⅲ"),
               class = 12010, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{20, 500, 1}],
               desc =
                   lang:get("<color='#ffff00'>职业任务</color>角色经验额外加成<color='"
                            "#ffff00'>50%</color>")};
get(12020) ->
    #buff_base{id = 12020, name = lang:get("摸金校尉"),
               class = 12020, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{14, 150, 2}],
               desc =
                   lang:get("使用普通宝图，一定概率获得双倍奖励（最多可获得<color='#ffff00'>2</co"
                            "lor>次），持续<color='#ffff00'>120分钟</color>")};
get(12021) ->
    #buff_base{id = 12021, name = lang:get("摸金校尉II"),
               class = 12020, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{14, 200, 3}],
               desc =
                   lang:get("使用普通宝图，较大概率获得双倍奖励（最多可获得<color='#ffff00'>3</co"
                            "lor>次），持续<color='#ffff00'>120分钟</color>")};
get(12030) ->
    #buff_base{id = 12030, name = lang:get("生命增益"),
               class = 12030, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{51, 30}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>3%</color>，持续<color="
                            "'#ffff00'>120分钟</color>")};
get(12031) ->
    #buff_base{id = 12031, name = lang:get("生命增益II"),
               class = 12030, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{51, 50}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>5%</color>，持续<color="
                            "'#ffff00'>120分钟</color>")};
get(12040) ->
    #buff_base{id = 12040, name = lang:get("物防护盾"),
               class = 12040, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{56, 30}],
               desc =
                   lang:get("角色物防增加<color='#ffff00'>3%</color>，持续<color='#"
                            "ffff00'>120分钟</color>")};
get(12041) ->
    #buff_base{id = 12041, name = lang:get("物防护盾II"),
               class = 12040, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{56, 50}],
               desc =
                   lang:get("角色物防增加<color='#ffff00'>5%</color>，持续<color='#"
                            "ffff00'>120分钟</color>")};
get(12050) ->
    #buff_base{id = 12050, name = lang:get("魔法护盾"),
               class = 12050, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{57, 30}],
               desc =
                   lang:get("角色魔防增加<color='#ffff00'>3%</color>，持续<color='#"
                            "ffff00'>120分钟</color>")};
get(12051) ->
    #buff_base{id = 12051, name = lang:get("魔法护盾II"),
               class = 12050, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, attr = [{57, 50}],
               desc =
                   lang:get("角色魔防增加<color='#ffff00'>5%</color>，持续<color='#"
                            "ffff00'>120分钟</color>")};
get(12060) ->
    #buff_base{id = 12060, name = lang:get("公会栋梁"),
               class = 12060, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{13, 500, 1}],
               desc =
                   lang:get("<color='#ffff00'>公会任务</color>额外获得<color='#fff"
                            "f00'>50%</color>公会贡献加成，持续<color='#ffff00'>120"
                            "分钟</color>")};
get(12061) ->
    #buff_base{id = 12061, name = lang:get("公会栋梁II"),
               class = 12060, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{13, 1000, 1}],
               desc =
                   lang:get("<color='#ffff00'>公会任务</color>额外获得<color='#fff"
                            "f00'>100%</color>公会贡献加成，持续<color='#ffff00'>12"
                            "0分钟</color>")};
get(12070) ->
    #buff_base{id = 12070, name = lang:get("驯兽大师"),
               class = 12070, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1,
               desc =
                   lang:get("宠物洗髓有<color='#ffff00'>5%</color>几率额外增加一定资质，持续"
                            "<color='#ffff00'>120分钟</color>")};
get(12071) ->
    #buff_base{id = 12071, name = lang:get("驯兽大师II"),
               class = 12070, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1,
               desc =
                   lang:get("宠物洗髓有<color='#ffff00'>8%</color>几率额外增加一定资质，持续"
                            "<color='#ffff00'>120分钟</color>")};
get(12080) ->
    #buff_base{id = 12080, name = lang:get("赏金副本"),
               class = 12080, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{5, 700, 2}],
               desc =
                   lang:get("完成<color='#ffff00'>普通副本</color>有<color='#ffff"
                            "00'>70%</color>几率获得双倍道具结算奖励（最多可获得<color='#fff"
                            "f00'>2</color>次），持续<color='#ffff00'>120分钟</co"
                            "lor>")};
get(12090) ->
    #buff_base{id = 12090, name = lang:get("历练加成"),
               class = 12090, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{16, 80, 1}],
               desc =
                   lang:get("<color='#ffff00'>历练任务</color>额外获得<color='#fff"
                            "f00'>8%</color>经验加成，持续<color='#ffff00'>120分钟<"
                            "/color>")};
get(12091) ->
    #buff_base{id = 12091, name = lang:get("历练加成II"),
               class = 12090, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{16, 120, 1}],
               desc =
                   lang:get("<color='#ffff00'>历练任务</color>额外获得<color='#fff"
                            "f00'>12%</color>经验加成，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12100) ->
    #buff_base{id = 12100, name = lang:get("宝图幸运星"),
               class = 12100, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{17, 1000, 1}],
               desc =
                   lang:get("<color='#ffff00'>宝图任务</color>每环必出一张宝图，持续<colo"
                            "r='#ffff00'>120分钟</color>")};
get(12110) ->
    #buff_base{id = 12110, name = lang:get("封妖大师"),
               class = 12110, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{18, 100, 1}],
               desc =
                   lang:get("<color='#ffff00'>上古妖魔</color>额外获得<color='#fff"
                            "f00'>10%</color>经验加成，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12111) ->
    #buff_base{id = 12111, name = lang:get("封妖大师II"),
               class = 12110, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{18, 150, 1}],
               desc =
                   lang:get("<color='#ffff00'>上古妖魔</color>额外获得<color='#fff"
                            "f00'>15%</color>经验加成，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12112) ->
    #buff_base{id = 12112, name = lang:get("封妖大师III"),
               class = 12110, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{18, 200, 1}],
               desc =
                   lang:get("<color='#ffff00'>上古妖魔</color>额外获得<color='#fff"
                            "f00'>20%</color>经验加成，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12120) ->
    #buff_base{id = 12120, name = lang:get("远航恩赐"),
               class = 12120, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{19, 1, 1}],
               desc =
                   lang:get("<color='#ffff00'>远航商人</color>任务完成后额外获得<color="
                            "'#ffff00'>1</color>本冒险笔记，持续<color='#ffff00'>1"
                            "20分钟</color>")};
get(12130) ->
    #buff_base{id = 12130, name = lang:get("竞技高手"),
               class = 12130, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{4, 500, 3}],
               desc =
                   lang:get("前<color='#ffff00'>3</color>场竞技场额外获得<color='#f"
                            "fff00'>50%</color>积分，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12131) ->
    #buff_base{id = 12131, name = lang:get("竞技高手II"),
               class = 12130, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{4, 800, 3}],
               desc =
                   lang:get("前<color='#ffff00'>3</color>场竞技场额外获得<color='#f"
                            "fff00'>80%</color>积分，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12132) ->
    #buff_base{id = 12132, name = lang:get("竞技高手III"),
               class = 12130, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{4, 1000, 3}],
               desc =
                   lang:get("前<color='#ffff00'>3</color>场竞技场额外获得<color='#f"
                            "fff00'>100%</color>积分，持续<color='#ffff00'>120分"
                            "钟</color>")};
get(12140) ->
    #buff_base{id = 12140, name = lang:get("极寒王者"),
               class = 12140, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{8, 200, 1}],
               desc =
                   lang:get("<color='#ffff00'>极寒试炼</color>额外获得<color='#fff"
                            "f00'>20%</color>银币，持续<color='#ffff00'>120分钟</"
                            "color>")};
get(12141) ->
    #buff_base{id = 12141, name = lang:get("极寒王者II"),
               class = 12140, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{8, 300, 1}],
               desc =
                   lang:get("<color='#ffff00'>极寒试炼</color>额外获得<color='#fff"
                            "f00'>30%</color>银币，持续<color='#ffff00'>120分钟</"
                            "color>")};
get(12150) ->
    #buff_base{id = 12150, name = lang:get("炼金术师"),
               class = 12150, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{22, 400, 1}],
               desc =
                   lang:get("<color='#ffff00'>魔法炼化</color>消耗下降为原来的<color='"
                            "#ffff00'>60%</color>，持续<color='#ffff00'>120分钟"
                            "</color>")};
get(12160) ->
    #buff_base{id = 12160, name = lang:get("天空领主"),
               class = 12160, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{7, 1, 1}],
               desc =
                   lang:get("领取<color='#ffff00'>天空之塔</color>任意一层奖励时，额外获得<c"
                            "olor='#ffff00'>一袋金币*1</color>，持续<color='#ffff"
                            "00'>120分钟</color>")};
get(12171) ->
    #buff_base{id = 12171, name = lang:get("魔药精通"),
               class = 12170, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{12, 150, 10001}],
               desc =
                   lang:get("魔药研制有一定几率获得双份，效果持续<color='#ffff00'>120分钟</color>")};
get(12181) ->
    #buff_base{id = 12181, name = lang:get("栽培精通"),
               class = 12180, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{12, 150, 10000}],
               desc =
                   lang:get("栽培之术有一定几率获得双份，效果持续<color='#ffff00'>120分钟</color>")};
get(12191) ->
    #buff_base{id = 12191, name = lang:get("雕文精通"),
               class = 12190, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{12, 150, 10007}],
               desc =
                   lang:get("雕文制作有一定几率获得双份，效果持续<color='#ffff00'>120分钟</color>")};
get(12201) ->
    #buff_base{id = 12201, name = lang:get("缝纫精通"),
               class = 12200, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{12, 150, 10006}],
               desc =
                   lang:get("缝纫技巧有一定几率获得双份，效果持续<color='#ffff00'>120分钟</color>")};
get(12211) ->
    #buff_base{id = 12211, name = lang:get("打造精通"),
               class = 12210, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{12, 150, 10005}],
               desc =
                   lang:get("打造工艺有一定几率获得双份，效果持续<color='#ffff00'>120分钟</color>")};
get(12220) ->
    #buff_base{id = 12220, name = lang:get("天降情缘"),
               class = 12220, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{24, 1, 1}],
               desc =
                   lang:get("完成<color='#ffff00'>情缘任务</color>可额外获得<color='#"
                            "ffff00'>1</color>个同心宝藏，持续<color='#ffff00'>120"
                            "分钟</color>")};
get(12230) ->
    #buff_base{id = 12230, name = lang:get("新人导师"),
               class = 12230, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{25, 500, 1}],
               desc =
                   lang:get("带新人可额外获得<color='#ffff00'>50%</color>人品值，持续<co"
                            "lor='#ffff00'>120分钟</color>")};
get(12240) ->
    #buff_base{id = 12240, name = lang:get("每日运势buff9"),
               class = 12240, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{3, 50, 1}],
               desc = lang:get("每日运势buff9")};
get(12250) ->
    #buff_base{id = 12250, name = lang:get("童心未泯"),
               class = 12250, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n欢天喜地过六一！")};
get(12260) ->
    #buff_base{id = 12260, name = lang:get("天降宝图"),
               class = 12260, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{28, 1, 3}],
               desc =
                   lang:get("参加宝图任务可额外多获得<color='#ffff00'>1~3</color>张宝图")};
get(12261) ->
    #buff_base{id = 12261, name = lang:get("天降宝图Ⅱ"),
               class = 12260, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{28, 2, 5}],
               desc =
                   lang:get("参加宝图任务可额外多获得<color='#ffff00'>2~5</color>张宝图")};
get(12270) ->
    #buff_base{id = 12270, name = lang:get("爬塔勇士"),
               class = 12270, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{29, 1000, 4}],
               desc =
                   lang:get("前<color='#ffff00'>4</color>次参与天空之塔开宝箱后可额外随机获得"
                            "一个宝箱奖励")};
get(12280) ->
    #buff_base{id = 12280, name = lang:get("变异祝福"),
               class = 12280, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{30, 50, 0}],
               desc =
                   lang:get("宠物洗髓变异几率增加<color='#ffff00'>5</color>%")};
get(12281) ->
    #buff_base{id = 12281, name = lang:get("变异祝福Ⅱ"),
               class = 12280, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{30, 80, 0}],
               desc =
                   lang:get("宠物洗髓变异几率增加<color='#ffff00'>8</color>%")};
get(12290) ->
    #buff_base{id = 12290, name = lang:get("妖魔勇士"),
               class = 12290, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{31, 1000, 3}],
               desc =
                   lang:get("上古妖魔前<color='#ffff00'>3</color>次战斗结束后必出<color"
                            "='#ffff00'>1</color>个道具奖励")};
get(12291) ->
    #buff_base{id = 12291, name = lang:get("妖魔勇士Ⅱ"),
               class = 12290, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{31, 1000, 6}],
               desc =
                   lang:get("上古妖魔前<color='#ffff00'>6</color>次战斗结束后必出<color"
                            "='#ffff00'>1</color>个道具奖励")};
get(12300) ->
    #buff_base{id = 12300, name = lang:get("扬帆远航"),
               class = 12300, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{32, 1, 0}],
               desc =
                   lang:get("远航任务完成额外获得<color='#ffff00'>1</color>个冒险笔记")};
get(12310) ->
    #buff_base{id = 12310, name = lang:get("妙手回春"),
               class = 12310, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{33, 400, 10001}],
               desc =
                   lang:get("魔药研制活力消耗下降为原来的<color='#ffff00'>60</color>%")};
get(12311) ->
    #buff_base{id = 12311, name = lang:get("培育之父"),
               class = 12311, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{33, 400, 10000}],
               desc =
                   lang:get("栽培果实活力消耗下降为原来的<color='#ffff00'>60</color>%")};
get(12312) ->
    #buff_base{id = 12312, name = lang:get("雕文巨匠"),
               class = 12312, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{33, 400, 10007}],
               desc =
                   lang:get("雕文制作活力消耗下降为原来的<color='#ffff00'>60</color>%")};
get(12313) ->
    #buff_base{id = 12313, name = lang:get("缝纫达人"),
               class = 12313, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{33, 400, 10006}],
               desc =
                   lang:get("缝纫技巧活力消耗下降为原来的<color='#ffff00'>60</color>%")};
get(12314) ->
    #buff_base{id = 12314, name = lang:get("能工巧匠"),
               class = 12314, lev = 10, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1, effect = [{33, 400, 10005}],
               desc =
                   lang:get("打造工艺活力消耗下降为原来的<color='#ffff00'>60</color>%")};
get(20000) ->
    #buff_base{id = 20000, name = lang:get("神速"),
               class = 20000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 20,
               max_effect_lev = 1, attr = [{62, 500}],
               desc = lang:get("闪电通关，风一样的速度！")};
get(20010) ->
    #buff_base{id = 20010, name = lang:get("咀嚼中"),
               class = 20000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1,
               desc =
                   lang:get("大口咀嚼，一段时间内不能再吃东西。\n<color='666666'>游行经验获取速度+1"
                            "00%</color>")};
get(20020) ->
    #buff_base{id = 20020, name = lang:get("移速提升"),
               class = 20001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 30,
               max_effect_lev = 1, attr = [{62, 50}],
               desc = lang:get("移动速度提升5%")};
get(20021) ->
    #buff_base{id = 20021, name = lang:get("移速提升"),
               class = 20001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 30,
               max_effect_lev = 1, attr = [{62, 100}],
               desc = lang:get("移动速度提升10%")};
get(20030) ->
    #buff_base{id = 20030, name = lang:get("醒神卡"),
               class = 20030, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{44, 200}],
               desc = lang:get("5分钟经验加成效果")};
get(20031) ->
    #buff_base{id = 20031, name = lang:get("强壮卡"),
               class = 20031, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{57, 20}, {56, 20}],
               desc = lang:get("5分钟防御提升效果")};
get(20032) ->
    #buff_base{id = 20032, name = lang:get("加速卡"),
               class = 20032, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 60,
               max_effect_lev = 1, attr = [{62, 50}],
               desc = lang:get("队伍移动速度提升效果")};
get(20033) ->
    #buff_base{id = 20033, name = lang:get("辟邪卡"),
               class = 20033, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 120,
               max_effect_lev = 1, desc = lang:get("在2分钟时间内不会遇怪")};
get(20034) ->
    #buff_base{id = 20034, name = lang:get("钥匙卡"),
               class = 20034, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1,
               desc = lang:get("提升自己队伍接下来3场战斗获得金钥匙的概率")};
get(21001) ->
    #buff_base{id = 21001, name = lang:get("攻击加成"),
               class = 21001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{54, 50}, {55, 50}],
               desc = lang:get("战场祝福5%攻击加成")};
get(21002) ->
    #buff_base{id = 21002, name = lang:get("防御加成"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{56, 50}, {57, 50}],
               desc = lang:get("战场祝福5%防御加成")};
get(21003) ->
    #buff_base{id = 21003, name = lang:get("泰坦圣剑"),
               class = 21003, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{54, 50}, {55, 50}],
               looks = [{3, 21003}],
               desc =
                   lang:get("获得泰坦圣剑，每30秒获得功勋<color='#ffff00'>5</color>点，提升"
                            "<color='#ffff00'>5%</color>攻击加成，但受到伤害增加<color"
                            "='#ffff00'>10%</color>")};
get(21004) ->
    #buff_base{id = 21004, name = lang:get("宙斯神盾"),
               class = 21004, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{56, 200}, {57, 200}],
               looks = [{3, 21004}],
               desc = lang:get("已获得宙斯神盾20%防御加成，每30秒获得功勋5点")};
get(21005) ->
    #buff_base{id = 21005, name = lang:get("女神祝福"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 5, attr = [{54, 100}, {55, 100}],
               desc = lang:get("战斗失败时获得物攻和魔攻10%加成，最多叠加5次，战斗获胜后移除")};
get(21011) ->
    #buff_base{id = 21011, name = lang:get("攻击加成"),
               class = 21001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{54, 40}, {55, 40}],
               desc = lang:get("已获得攻击加成")};
get(21012) ->
    #buff_base{id = 21012, name = lang:get("攻击加成"),
               class = 21001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{54, 30}, {55, 30}],
               desc = lang:get("已获得攻击加成")};
get(21021) ->
    #buff_base{id = 21021, name = lang:get("防御加成"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{56, 40}, {57, 40}],
               desc = lang:get("已获得防御加成")};
get(21022) ->
    #buff_base{id = 21022, name = lang:get("防御加成"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, attr = [{56, 30}, {57, 30}],
               desc = lang:get("已获得防御加成")};
get(21100) ->
    #buff_base{id = 21100, name = lang:get("花雨祝福"),
               class = 21100, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 2, max_time_num = 12, duration = 3600,
               max_effect_lev = 1, attr = [{44, 200}],
               desc =
                   lang:get("赠送999玫瑰后所有在线玩家获得花雨祝福，在普通战斗中获得<color='#ffff00'"
                            ">20%的经验加成</color>，持续1小时，最高叠加12小时。")};
get(21101) ->
    #buff_base{id = 21101, name = lang:get("圣水祝福"),
               class = 21101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 2, max_time_num = 12, duration = 3600,
               max_effect_lev = 1,
               effect = [{36, 200, 0}, {37, 200, 0}],
               desc =
                   lang:get("获得圣水的祝福，在普通战斗中获得<color='#ffff00'>20%的经验及银币加成<"
                            "/color>，持续1小时，最高叠加12小时。")};
get(21102) ->
    #buff_base{id = 21102, name = lang:get("花语祝福"),
               class = 21102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 2, max_time_num = 12, duration = 3600,
               max_effect_lev = 1, attr = [{44, 50}],
               desc =
                   lang:get("获赠周年庆典鲜花后将获得花语祝福，在普通战斗中获得<color='#ffff00'>20%"
                            "的经验加成</color>，持续1小时，最高叠加12小时。")};
get(21103) ->
    #buff_base{id = 21103, name = lang:get("诸神祝福"),
               class = 21103, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 2, max_time_num = 12, duration = 43200,
               max_effect_lev = 1, attr = [{44, 50}],
               desc =
                   lang:get("获得诸神挑战的祝福，在普通战斗中获得<color='#ffff00'>20%的经验加成</"
                            "color>，持续12小时。")};
get(22000) ->
    #buff_base{id = 22000, name = lang:get("喜气洋洋"),
               class = 22000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n这一定是因为喜糖吃多了撑的！")};
get(22001) ->
    #buff_base{id = 22001, name = lang:get("奇异果变身"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 300,
               max_effect_lev = 1, looks = [{4, 10030}],
               desc = lang:get("生活就像奇异果，你永远不知道下一个是变大还是变小。")};
get(22002) ->
    #buff_base{id = 22002, name = lang:get("天下第一会"),
               class = 22002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 604800,
               max_effect_lev = 1, effect = [{26, 300, 1}],
               desc = lang:get("所有成员完成公会任务时获得奖励增加30%")};
get(22003) ->
    #buff_base{id = 22003, name = lang:get("返老还童"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{2, 10040}, {4, 10041}],
               desc =
                   lang:get("生活中不时来点童趣，思想里保留一些童真，六一儿童节，愿你拥有儿童般的快乐。")};
get(22004) ->
    #buff_base{id = 22004, name = lang:get("幸福甜蜜"),
               class = 22005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n恩爱幸福的滋味，让人心醉~")};
get(22005) ->
    #buff_base{id = 22005, name = lang:get("情深义重"),
               class = 22005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n这就是所谓的“友情饮水饱”吧！")};
get(22006) ->
    #buff_base{id = 22006, name = lang:get("顺风顺水"),
               class = 22005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n沾沾诸神之战新晋8强的好运吧！")};
get(22007) ->
    #buff_base{id = 22007, name = lang:get("暖心糖果"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{2, 10034}, {4, 10035}],
               desc =
                   lang:get("战斗胜利50%不消耗饱食度。\n在雪地上品尝糖果时摔了一跤，变成了大雪人^_^")};
get(22008) ->
    #buff_base{id = 22008, name = lang:get("新春祝福"),
               class = 22005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n春风得意，暖心祝福！")};
get(22009) ->
    #buff_base{id = 22009, name = lang:get("庆典祝福"),
               class = 22005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 0, max_time_num = 1, duration = 86400,
               max_effect_lev = 1,
               desc = lang:get("战斗胜利50%不消耗饱食度。\n感谢一路有你！")};
get(23001) ->
    #buff_base{id = 23001, name = lang:get("坚守阵地"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{56, 50}, {57, 50}],
               desc =
                   lang:get("我方剩余<color='#ffff00'>3</color>座水晶塔，守塔战斗获得<col"
                            "or='#ffff00'>5%</color>防御加成")};
get(23002) ->
    #buff_base{id = 23002, name = lang:get("众志成城"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{56, 100}, {57, 100}],
               desc =
                   lang:get("我方剩余<color='#ffff00'>2</color>座水晶塔，守塔战斗获得<col"
                            "or='#ffff00'>10%</color>防御加成")};
get(23003) ->
    #buff_base{id = 23003, name = lang:get("岌岌可危"),
               class = 21002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{56, 150}, {57, 150}],
               desc =
                   lang:get("我方剩余<color='#ffff00'>1</color>座水晶塔，守塔战斗获得<col"
                            "or='#ffff00'>15%</color>防御加成")};
get(23101) ->
    #buff_base{id = 23101, name = lang:get("好运连连"),
               class = 23101, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 24, duration = 5400,
               max_effect_lev = 1, looks = [{3, 23101}],
               effect = [{1, 83020, 1}],
               desc = lang:get("获赠999朵芳香四溢的玫瑰花，幸福因快乐而来，美好因吉祥而生^_^")};
get(23102) ->
    #buff_base{id = 23102, name = lang:get("好运连连"),
               class = 23102, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 24, duration = 5400,
               max_effect_lev = 1, looks = [{3, 23101}],
               effect = [{1, 83020, 1}],
               desc = lang:get("获赠周年庆典祝福花语，幸福因快乐而来，美好因吉祥而生^_^")};
get(23111) ->
    #buff_base{id = 23111, name = lang:get("恩爱孕育"),
               class = 23111, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, looks = [{3, 23111}],
               desc =
                   lang:get("通过夫妻浓情蜜意方式孕育的胎儿，将在孕育值达到<color='#ffff00'>1000<"
                            "/color>时出生")};
get(23112) ->
    #buff_base{id = 23112, name = lang:get("天地灵育"),
               class = 23112, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, looks = [{3, 23112}],
               desc =
                   lang:get("通过天地灵种方式孕育的胎儿，将在孕育值达到<color='#ffff00'>1000</c"
                            "olor>时出生")};
get(30000) ->
    #buff_base{id = 30000, name = lang:get("灵羽之速"),
               class = 30000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 600,
               max_effect_lev = 1, attr = [{62, 50}],
               desc =
                   lang:get("苍穹领主流传下来的翅膀灵羽授予你在天空飞翔的权利，无视地形移动并提高移动速度。")};
get(40000) ->
    #buff_base{id = 40000, name = lang:get("强力加持"),
               class = 10105, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 2,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, attr = [{54, 100}],
               desc = lang:get("金牛座守护着你，物防+3%")};
get(30001) ->
    #buff_base{id = 30001, name = lang:get("元素变形"),
               class = 30001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 3600,
               max_effect_lev = 1, looks = [{2, 10022}],
               desc = lang:get("变身为<color='#00ff00'>阴影近卫</color>的模样")};
get(30002) ->
    #buff_base{id = 30002, name = lang:get("树木伪装"),
               class = 30002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 60,
               max_effect_lev = 1, looks = [{1, 50000}],
               desc = lang:get("变身为<color='#00ff00'>普通树木</color>的模样")};
get(30003) ->
    #buff_base{id = 30003, name = lang:get("南瓜君"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{1, 30731}],
               desc =
                   lang:get("完成本次护送可获得丰厚奖励\n有几率可额外得到<color='#00ff00'>稀有物品<"
                            "/color>")};
get(30004) ->
    #buff_base{id = 30004, name = lang:get("天使飞猪"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, attr = [{62, 150}],
               looks = [{1, 30730}],
               desc =
                   lang:get("完成本次护送可获得丰厚奖励\n有几率可额外得到<color='#00ff00'>稀有物品<"
                            "/color>")};
get(30005) ->
    #buff_base{id = 30005, name = lang:get("波波"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{1, 30701}],
               desc = lang:get("变身<color='#00ff00'>波波球</color>")};
get(30006) ->
    #buff_base{id = 30006, name = lang:get("波波"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{1, 30704}],
               desc =
                   lang:get("变身<color='#00ff00'>螳螂忍者</color>，持续<color='#00"
                            "ff00'>30分钟+幻化之术等级*15</color>或<color='#00ff00'"
                            ">3</color>场PVP战斗。")};
get(30007) ->
    #buff_base{id = 30007, name = lang:get("小浣熊"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{1, 30702}],
               desc = lang:get("变身为<color='#00ff00'>小浣熊</color>")};
get(30008) ->
    #buff_base{id = 30008, name = lang:get("南瓜精"),
               class = 10000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, looks = [{1, 76880}],
               desc =
                   lang:get("找到调皮的小屁孩才能获得<color='#00ff00'>奖励</color>哦")};
get(31000) ->
    #buff_base{id = 31000, name = lang:get("公会祈福（角色）"),
               class = 31000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 259200,
               max_effect_lev = 1,
               desc = lang:get("来自公会元素祭坛的祝福，仅对角色生效")};
get(31001) ->
    #buff_base{id = 31001, name = lang:get("公会祈福（宠物）"),
               class = 31001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 259200,
               max_effect_lev = 1,
               desc = lang:get("来自公会元素祭坛的祝福，仅对宠物与子女生效")};
get(31002) ->
    #buff_base{id = 31002, name = lang:get("甜蜜小熊"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1,
               attr = [{56, 13}, {57, 14}, {51, 52}],
               looks = [{2, 10036}, {4, 10037}],
               desc =
                   lang:get("生命额外提升<color='#ffff00'>5.2</color>%，物防提升<colo"
                            "r='#ffff00'>1.3</color>%，魔防提升<color='#ffff00'"
                            ">1.4</color>%，持续<color='#ffff00'>2</color>小时\n"
                            "甜蜜小熊萌萌哒，喜欢你没道理。节日快乐")};
get(31003) ->
    #buff_base{id = 31003, name = lang:get("幸福小熊"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 2, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 7200,
               max_effect_lev = 1,
               attr = [{56, 13}, {57, 14}, {51, 52}],
               looks = [{2, 10038}, {4, 10039}],
               desc =
                   lang:get("生命额外提升<color='#ffff00'>5.2</color>%，物防提升<colo"
                            "r='#ffff00'>1.3</color>%，魔防提升<color='#ffff00'"
                            ">1.4</color>%，持续<color='#ffff00'>2</color>小时\n"
                            "婚礼小熊萌萌哒，喜欢你没道理。白色情人节快乐")};
get(31004) ->
    #buff_base{id = 31004, name = lang:get("我是笨猪"),
               class = 10000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 1,
               time_mode = 1, max_time_num = 1, duration = 600,
               max_effect_lev = 1, looks = [{1, 30601}, {4, 10039}],
               desc =
                   lang:get("你<color='#00ff00'>答错了题目</color>，被变成了<color='#"
                            "00ff00'>小猪</color>。")};
get(31005) ->
    #buff_base{id = 31005, name = lang:get("永不言弃"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, attr = [{51, 30}],
               desc = lang:get("角色生命上限增加<color='#ffff00'>3%</color>")};
get(31006) ->
    #buff_base{id = 31006, name = lang:get("永不言弃"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               attr = [{51, 30}, {56, 30}, {57, 30}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>3%</color>，角色防御增加<co"
                            "lor='#ffff00'>3%</color>")};
get(31007) ->
    #buff_base{id = 31007, name = lang:get("永不言弃"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               attr =
                   [{51, 30}, {56, 30}, {57, 30}, {54, 30}, {55, 30}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>3%</color>，防御增加<colo"
                            "r='#ffff00'>3%</color>，伤害增加<color='#ffff00'>3"
                            "%</color>")};
get(31008) ->
    #buff_base{id = 31008, name = lang:get("大力丸"),
               class = 21005, lev = 1, pvp_limit = 1, cancel = 0,
               same_buff_mode = 0, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, effect = [{27, 96105, 1}],
               desc = lang:get("受大力丸效果影响，攻击增加5%")};
get(31009) ->
    #buff_base{id = 31009, name = lang:get("幸运丸"),
               class = 21005, lev = 1, pvp_limit = 1, cancel = 0,
               same_buff_mode = 0, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1, effect = [{35, 96106, 2}],
               desc = lang:get("获得幸运丸效果，本场战斗拥有1次保命机会")};
get(31011) ->
    #buff_base{id = 31011, name = lang:get("永不言弃"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               attr =
                   [{51, 80}, {56, 30}, {57, 30}, {54, 30}, {55, 30}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>8%</color>，防御增加<colo"
                            "r='#ffff00'>3%</color>，伤害增加<color='#ffff00'>3"
                            "%</color>")};
get(31012) ->
    #buff_base{id = 31012, name = lang:get("永不言弃"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               attr =
                   [{51, 80}, {56, 80}, {57, 80}, {54, 30}, {55, 30}],
               desc =
                   lang:get("角色生命上限增加<color='#ffff00'>3%</color>，防御增加<colo"
                            "r='#ffff00'>8%</color>，伤害增加<color='#ffff00'>3"
                            "%</color>")};
get(31013) ->
    #buff_base{id = 31013, name = lang:get("众志成城"),
               class = 21005, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1,
               attr =
                   [{51, 100}, {56, 100}, {57, 100}, {54, 100}, {55, 100}],
               desc =
                   lang:get("全服玩家的努力下，挑战本层时全属性增加<color='#00ff00'>10%</color>！")};
get(31014) ->
    #buff_base{id = 31014, name = lang:get("历练妖精"),
               class = 31014, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, time_mode = 2,
               max_effect_lev = 1,
               desc =
                   lang:get("在历练妖精的帮助下，能够额外获得<color='#00ff00'>30%</color>的"
                            "历练值啦！")};
get(31015) ->
    #buff_base{id = 31015, name = lang:get("冲顶邀请函"),
               class = 31015, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 1, time_mode = 2,
               duration = 43200, max_effect_lev = 1,
               desc =
                   lang:get("好友邀请您参加<color='#00ff00'>冲顶答题</color>，获得一张<col"
                            "or='#00ff00'>入场券</color>，请及时参赛哟\n(在此期间，您再赠送他人"
                            "入场券，将不能获得复活卡)")};
get(32001) ->
    #buff_base{id = 32001, name = lang:get("赤炎幻化"),
               class = 32001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, effect = [{1, 97001, 1}],
               desc =
                   lang:get("获得神龙祝福，幻化为赤炎小龙，冒险技能得到增强：<color='#13fc60'>攻法指挥"
                            "+1</color>、<color='#13fc60'>防御指挥+1</color>、<c"
                            "olor='#13fc60'>魔抗指挥+1</color>，仅此只宠生效")};
get(32002) ->
    #buff_base{id = 32002, name = lang:get("冰霜幻化"),
               class = 32001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, effect = [{1, 97002, 1}],
               desc =
                   lang:get("获得神龙祝福，幻化为冰霜小龙，冒险技能得到增强：<color='#13fc60'>攻法指挥"
                            "+1</color>、<color='#13fc60'>防御指挥+1</color>、<c"
                            "olor='#13fc60'>魔抗指挥+1</color>，仅此只宠生效")};
get(32003) ->
    #buff_base{id = 32003, name = lang:get("天启黎明"),
               class = 32001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, effect = [{1, 97003, 1}],
               desc =
                   lang:get("幻化为天启之力·黎明，冒险技能得到增强：<color='#13fc60'>攻法指挥+1</"
                            "color>、<color='#13fc60'>防御指挥+2</color>、<color"
                            "='#13fc60'>魔抗指挥+1</color>，仅此只宠生效")};
get(32004) ->
    #buff_base{id = 32004, name = lang:get("天启暗夜"),
               class = 32001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, effect = [{1, 97004, 1}],
               desc =
                   lang:get("幻化为天启之力·光明，冒险技能得到增强：<color='#13fc60'>攻法指挥+1</"
                            "color>、<color='#13fc60'>防御指挥+2</color>、<color"
                            "='#13fc60'>魔抗指挥+1</color>，仅此只宠生效")};
get(99999) ->
    #buff_base{id = 99999, name = lang:get("饱食度"),
               class = 30000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1,
               desc =
                   lang:get("每场战斗消耗<color='#ffff00'>1</color>点，自动回复生命与魔法值\n"
                            "<color='#ffff00'>野外挂机</color>每场战斗消耗0.5点")};
get(99998) ->
    #buff_base{id = 99998, name = lang:get("双倍"),
               class = 30000, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 0, type = 1, sub_type = 0,
               time_mode = 1,
               desc =
                   lang:get("<color='#ffff00'>悬赏任务</color>和<color='#ffff00"
                            "'>挂机场景</color>战斗可获得双倍奖励，开启双倍后挂机场景遇到<color='#f"
                            "fff00'>宠物宝宝</color>的几率大幅提升")};
get(99997) ->
    #buff_base{id = 99997, name = lang:get("龙王试练资格"),
               class = 30001, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               desc =
                   lang:get("每位龙王门徒的<color='#00ff00'>最近8队</color>成功挑战者，获得<"
                            "color='#00ff00'>周五12点至周日24点</color>挑战星辰龙王的资格，"
                            "失去资格的玩家需<color='#00ff00'>要重新挑战</color>")};
get(99996) ->
    #buff_base{id = 99996, name = lang:get("雕文"),
               class = 30002, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1};
get(99995) ->
    #buff_base{id = 99995, name = lang:get("天启挑战资格"),
               class = 30003, lev = 1, pvp_limit = 0, cancel = 0,
               same_buff_mode = 1, type = 2, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 0,
               max_effect_lev = 1,
               desc =
                   lang:get("每位天启门徒的<color='#00ff00'>最近8队</color>成功挑战者，获得<"
                            "color='#00ff00'>周五12点至周日24点</color>挑战天启霸主的资格，"
                            "失去资格的玩家需<color='#00ff00'>要重新挑战</color>")};
get(13000) ->
    #buff_base{id = 13000, name = lang:get("幻化1级体质"),
               class = 13000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{102, 0}],
               desc = lang:get("1级幻化效果体质加成")};
get(13001) ->
    #buff_base{id = 13001, name = lang:get("幻化1级力量"),
               class = 13000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{101, 0}],
               desc = lang:get("1级幻化效果体质加成")};
get(13002) ->
    #buff_base{id = 13002, name = lang:get("幻化1级智力"),
               class = 13000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{103, 0}],
               desc = lang:get("1级幻化效果智力加成")};
get(13003) ->
    #buff_base{id = 13003, name = lang:get("幻化1级敏捷"),
               class = 13000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{104, 0}],
               desc = lang:get("1级幻化效果敏捷加成")};
get(13004) ->
    #buff_base{id = 13004, name = lang:get("幻化1级耐力"),
               class = 13000, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{105, 0}],
               desc = lang:get("1级幻化效果耐力加成")};
get(13005) ->
    #buff_base{id = 13005, name = lang:get("幻化2级体质"),
               class = 13005, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{102, 0}],
               desc = lang:get("2级幻化效果体质加成")};
get(13006) ->
    #buff_base{id = 13006, name = lang:get("幻化2级力量"),
               class = 13005, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{101, 0}],
               desc = lang:get("2级幻化效果体质加成")};
get(13007) ->
    #buff_base{id = 13007, name = lang:get("幻化2级智力"),
               class = 13005, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{103, 0}],
               desc = lang:get("2级幻化效果智力加成")};
get(13008) ->
    #buff_base{id = 13008, name = lang:get("幻化2级敏捷"),
               class = 13005, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{104, 0}],
               desc = lang:get("2级幻化效果敏捷加成")};
get(13009) ->
    #buff_base{id = 13009, name = lang:get("幻化2级耐力"),
               class = 13005, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{105, 0}],
               desc = lang:get("2级幻化效果耐力加成")};
get(13010) ->
    #buff_base{id = 13010, name = lang:get("幻化3级体质"),
               class = 13010, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{102, 0}],
               desc = lang:get("3级幻化效果体质加成")};
get(13011) ->
    #buff_base{id = 13011, name = lang:get("幻化3级力量"),
               class = 13010, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{101, 0}],
               desc = lang:get("3级幻化效果体质加成")};
get(13012) ->
    #buff_base{id = 13012, name = lang:get("幻化3级智力"),
               class = 13010, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{103, 0}],
               desc = lang:get("3级幻化效果智力加成")};
get(13013) ->
    #buff_base{id = 13013, name = lang:get("幻化3级敏捷"),
               class = 13010, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{104, 0}],
               desc = lang:get("3级幻化效果敏捷加成")};
get(13014) ->
    #buff_base{id = 13014, name = lang:get("幻化3级耐力"),
               class = 13010, lev = 1, pvp_limit = 3, cancel = 0,
               same_buff_mode = 1, type = 3, sub_type = 0,
               time_mode = 1, max_time_num = 1, duration = 1800,
               max_effect_lev = 1, dynamic_attr = [{105, 0}],
               desc = lang:get("3级幻化效果耐力加成")};
get(_) -> false.

get_class_conflict(_) -> [].

get_looks(10000) -> [{30701, 200}];
get_looks(10001) -> [{30706, 200}];
get_looks(10002) -> [{30709, 200}];
get_looks(10003) -> [{30712, 200}];
get_looks(10004) -> [{30715, 200}];
get_looks(10010) -> [{30704, 200}];
get_looks(10011) -> [{30707, 200}];
get_looks(10012) -> [{30710, 200}];
get_looks(10013) -> [{30713, 200}];
get_looks(10014) -> [{30716, 200}];
get_looks(10020) -> [{30705, 200}];
get_looks(10021) -> [{30708, 200}];
get_looks(10022) -> [{30711, 200}];
get_looks(10023) -> [{30714, 200}];
get_looks(10024) -> [{30717, 200}];
get_looks(10025) -> [{30722, 200}];
get_looks(10026) -> [{30719, 200}];
get_looks(10027) -> [{30721, 200}];
get_looks(10028) -> [{30723, 200}];
get_looks(10029) -> [{30724, 200}];
get_looks(10030) -> [{130, 50}, {80, 50}];
get_looks(10031) ->
    [{76010, 200},
     {76011, 200},
     {76012, 200},
     {76013, 200},
     {76014, 200}];
get_looks(10032) -> [{130, 100}];
get_looks(10033) -> [{50000, 1000}];
get_looks(10034) ->
    [{76721, 100}, {76722, 100}, {76723, 100}];
get_looks(10035) -> [{100, 100}];
get_looks(10036) -> [{76116, 100}];
get_looks(10037) -> [{150, 100}];
get_looks(10038) -> [{76117, 100}];
get_looks(10039) -> [{150, 100}];
get_looks(10040) -> [{76118, 50}, {76119, 50}];
get_looks(10041) -> [{150, 100}];
get_looks(_) -> [].

rand_ids(1) ->
    [{10000, 100}, {10010, 100}, {10020, 100}];
rand_ids(2) ->
    [{10001, 100}, {10011, 100}, {10021, 100}];
rand_ids(3) ->
    [{10002, 100}, {10012, 100}, {10022, 100}];
rand_ids(4) ->
    [{10003, 100}, {10013, 100}, {10023, 100}];
rand_ids(5) ->
    [{10004, 100}, {10014, 100}, {10024, 100}];
rand_ids(6) ->
    [{10048, 100, 1},
     {10049, 100, 1},
     {10048, 100, 3},
     {10049, 100, 3},
     {10048, 100, 2},
     {10051, 100, 2},
     {10048, 100, 4},
     {10052, 100, 4},
     {10048, 100, 5},
     {10052, 100, 5},
     {10048, 100, 6},
     {10051, 100, 6},
     {10048, 100, 7},
     {10049, 100, 7}];
rand_ids(_) -> [].

get_dynamic_attr({10110, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10111, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10112, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10113, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10114, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10115, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10116, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10117, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10118, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10119, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11119, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10120, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10121, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10122, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10123, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10124, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10125, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10126, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10127, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10128, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10129, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11129, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10130, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10130, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10131, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10131, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10132, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10132, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10133, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10133, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10134, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10134, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10135, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10135, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10136, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10136, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10137, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10137, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10138, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10138, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10139, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10139, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11139, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11139, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10140, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10141, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10142, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10143, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10144, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10145, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10146, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10147, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10148, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10149, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11149, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10150, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10151, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10152, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10153, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10154, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10155, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10156, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10157, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10158, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10159, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11159, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10160, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10161, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10162, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10163, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10164, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10165, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10166, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10167, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10168, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10169, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11169, 8}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10301, 1}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10302, 4}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10303, 5}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10304, 7}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10305, 3}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10306, 6}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10307, 8}) ->
    [{70, 100}, {80, 200}, {90, 200}, {100, 200}];
get_dynamic_attr({10170, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10171, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10172, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10173, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10174, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10175, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10176, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10177, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10178, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10179, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11179, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10170, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10171, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10172, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10173, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10174, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10175, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10176, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10177, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10178, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10179, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11179, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10180, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10181, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10182, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10183, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10184, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10185, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10186, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10187, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10188, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10189, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11189, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10190, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10191, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10192, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10193, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10194, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10195, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10196, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10197, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10198, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({10199, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11199, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11201, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11202, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11203, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11204, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11205, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11206, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11207, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11208, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11209, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11210, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11211, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11201, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11202, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11203, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11204, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11205, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11206, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11207, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11208, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11209, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11210, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11211, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11212, 1}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11213, 4}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11214, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11215, 3}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11216, 6}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11217, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11217, 2}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11218, 7}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11219, 5}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11220, 9}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr({11220, 47}) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_dynamic_attr(_) -> [].

transform_combat_type() ->
    [104, 105, 110, 111, 21, 40, 58].

pet_former_combat_type() -> [110, 111, 40, 58].

get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10110;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10111;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10112;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10113;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10114;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10115;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10116;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10117;
get_glyph({10100, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10118;
get_glyph({10100, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10119;
get_glyph({10100, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11119;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10120;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10121;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10122;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10123;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10124;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10125;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10126;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10127;
get_glyph({10101, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10128;
get_glyph({10101, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10129;
get_glyph({10101, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11129;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10140;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10141;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10142;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10143;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10144;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10145;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10146;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10147;
get_glyph({10103, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10148;
get_glyph({10103, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10149;
get_glyph({10103, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11149;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10150;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10151;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10152;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10153;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10154;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10155;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10156;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10157;
get_glyph({10104, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10158;
get_glyph({10104, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10159;
get_glyph({10104, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11159;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10170;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10171;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10172;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10173;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10174;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10175;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10176;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10177;
get_glyph({10102, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10178;
get_glyph({10102, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10179;
get_glyph({10102, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11179;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10180;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10181;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10182;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10183;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10184;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10185;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10186;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    10187;
get_glyph({10106, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10188;
get_glyph({10106, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    10189;
get_glyph({10106, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11189;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11201;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11202;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 30 =< Lev andalso Lev =< 39 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 30 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 39
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11203;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 40 =< Lev andalso Lev =< 49 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 40 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 49
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11204;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 50 =< Lev andalso Lev =< 59 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 50 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 59
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11205;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 60 =< Lev andalso Lev =< 69 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 60 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 69
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11206;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 70 =< Lev andalso Lev =< 79 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 70 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 79
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11207;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 0 andalso 80 =< Lev andalso Lev =< 89 orelse
             0 =/= 0 andalso 0 =:= BreakTimes andalso 80 =< Lev
                 orelse
                 0 =/= 0 andalso 0 =:= BreakTimes andalso Lev =< 89
                     orelse
                     0 =/= 0 andalso
                         0 =/= BreakTimes andalso 0 =/= BreakTimes ->
    11208;
get_glyph({10107, Lev, BreakTimes})
    when 0 =:= 1 andalso 90 =< Lev andalso Lev =< 99 orelse
             0 =/= 1 andalso 0 =:= BreakTimes andalso 90 =< Lev
                 orelse
                 0 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 99
                     orelse
                     0 =/= 1 andalso
                         0 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11209;
get_glyph({10107, Lev, BreakTimes})
    when 1 =:= 1 andalso 100 =< Lev andalso Lev =< 109
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 100 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 109
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11210;
get_glyph({10107, Lev, BreakTimes})
    when 1 =:= 1 andalso 110 =< Lev andalso Lev =< 119
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 110 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 119
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11211;
get_glyph({10100, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11212;
get_glyph({10101, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11213;
get_glyph({10103, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11215;
get_glyph({10104, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11216;
get_glyph({10102, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11217;
get_glyph({10106, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11218;
get_glyph({10107, Lev, BreakTimes})
    when 1 =:= 1 andalso 120 =< Lev andalso Lev =< 129
             orelse
             1 =/= 1 andalso 1 =:= BreakTimes andalso 120 =< Lev
                 orelse
                 1 =/= 1 andalso 1 =:= BreakTimes andalso Lev =< 129
                     orelse
                     1 =/= 1 andalso
                         1 =/= BreakTimes andalso 1 =/= BreakTimes ->
    11220;
get_glyph(_) -> false.

fruit_buff_ids() ->
    [10055,
     10056,
     10057,
     10058,
     10059,
     10060,
     10061,
     10062,
     10063,
     10064,
     10065,
     50036,
     50037,
     50038,
     50039,
     50040,
     50041,
     50042,
     50043,
     50044,
     50045,
     50046].

