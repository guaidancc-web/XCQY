-file("src/data/fuse_data.erl", 1).

-module(fuse_data).

-export([get/1, get_fuse_by_base_id/1]).

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

-file("src/data/fuse_data.erl", 14).

get(57) ->
    #{id => 57, base_id => 20020, need_num => 4,
      base_name => lang:get("精良强化石"), next_base_id => 20400,
      next_name => lang:get("精良强化石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(3) ->
    #{id => 3, base_id => 20021, need_num => 4,
      base_name => lang:get("优秀幸运石"), next_base_id => 20022,
      next_name => lang:get("优秀幸运石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(58) ->
    #{id => 58, base_id => 20022, need_num => 4,
      base_name => lang:get("完美幸运石"), next_base_id => 20404,
      next_name => lang:get("完美幸运石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(4) ->
    #{id => 4, base_id => 20008, need_num => 4,
      base_name => lang:get("+8强化保护卷"), next_base_id => 20009,
      next_name => lang:get("+8强化保护卷"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(5) ->
    #{id => 5, base_id => 20009, need_num => 4,
      base_name => lang:get("+9强化保护卷"), next_base_id => 20010,
      next_name => lang:get("+9强化保护卷"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(7) ->
    #{id => 7, base_id => 20600, need_num => 4,
      base_name => lang:get("优秀力量符石"), next_base_id => 20601,
      next_name => lang:get("优秀力量符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(8) ->
    #{id => 8, base_id => 20601, need_num => 4,
      base_name => lang:get("完美力量符石"), next_base_id => 20602,
      next_name => lang:get("完美力量符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(9) ->
    #{id => 9, base_id => 20603, need_num => 4,
      base_name => lang:get("优秀智力符石"), next_base_id => 20604,
      next_name => lang:get("优秀智力符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(10) ->
    #{id => 10, base_id => 20604, need_num => 4,
      base_name => lang:get("完美智力符石"), next_base_id => 20605,
      next_name => lang:get("完美智力符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(11) ->
    #{id => 11, base_id => 20606, need_num => 4,
      base_name => lang:get("优秀生命符石"), next_base_id => 20607,
      next_name => lang:get("优秀生命符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(12) ->
    #{id => 12, base_id => 20607, need_num => 4,
      base_name => lang:get("完美生命符石"), next_base_id => 20608,
      next_name => lang:get("完美生命符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(13) ->
    #{id => 13, base_id => 20612, need_num => 4,
      base_name => lang:get("优秀敏捷符石"), next_base_id => 20613,
      next_name => lang:get("优秀敏捷符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(14) ->
    #{id => 14, base_id => 20613, need_num => 4,
      base_name => lang:get("完美敏捷符石"), next_base_id => 20614,
      next_name => lang:get("完美敏捷符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(15) ->
    #{id => 15, base_id => 20615, need_num => 2,
      base_name => lang:get("星辰护符"), next_base_id => 20615,
      next_name => lang:get("星辰护符"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(16) ->
    #{id => 16, base_id => 20616, need_num => 2,
      base_name => lang:get("月亮护符"), next_base_id => 20616,
      next_name => lang:get("月亮护符"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(17) ->
    #{id => 17, base_id => 20617, need_num => 2,
      base_name => lang:get("太阳护符"), next_base_id => 20617,
      next_name => lang:get("太阳护符"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(120) ->
    #{id => 120, base_id => 20638, need_num => 2,
      base_name => lang:get("彩虹护符"), next_base_id => 20638,
      next_name => lang:get("彩虹护符"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(18) ->
    #{id => 18, base_id => 20060, need_num => 4,
      base_name => lang:get("疾风阵"), next_base_id => 21200,
      next_name => lang:get("疾风阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(19) ->
    #{id => 19, base_id => 20060, need_num => 4,
      base_name => lang:get("秘林阵"), next_base_id => 21201,
      next_name => lang:get("秘林阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(20) ->
    #{id => 20, base_id => 20060, need_num => 4,
      base_name => lang:get("天火阵"), next_base_id => 21202,
      next_name => lang:get("天火阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(21) ->
    #{id => 21, base_id => 20060, need_num => 4,
      base_name => lang:get("山岳阵"), next_base_id => 21203,
      next_name => lang:get("山岳阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(22) ->
    #{id => 22, base_id => 20060, need_num => 4,
      base_name => lang:get("星魂阵"), next_base_id => 21204,
      next_name => lang:get("星魂阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(59) ->
    #{id => 59, base_id => 20060, need_num => 4,
      base_name => lang:get("苍穹阵"), next_base_id => 21205,
      next_name => lang:get("苍穹阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(60) ->
    #{id => 60, base_id => 20060, need_num => 4,
      base_name => lang:get("雷霆阵"), next_base_id => 21206,
      next_name => lang:get("雷霆阵"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 1,
      universal => 1, mail_items => []};
get(26) ->
    #{id => 26, base_id => 20653, need_num => 3,
      base_name => lang:get("优秀虹彩晶"), next_base_id => 20656,
      next_name => lang:get("优秀虹彩晶"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(27) ->
    #{id => 27, base_id => 20654, need_num => 3,
      base_name => lang:get("优秀月光石"), next_base_id => 20657,
      next_name => lang:get("优秀月光石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(28) ->
    #{id => 28, base_id => 20655, need_num => 3,
      base_name => lang:get("优秀幻影石"), next_base_id => 20658,
      next_name => lang:get("优秀幻影石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(29) ->
    #{id => 29, base_id => 20656, need_num => 3,
      base_name => lang:get("完美虹彩晶"), next_base_id => 20659,
      next_name => lang:get("完美虹彩晶"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(30) ->
    #{id => 30, base_id => 20657, need_num => 3,
      base_name => lang:get("完美月光石"), next_base_id => 20660,
      next_name => lang:get("完美月光石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(31) ->
    #{id => 31, base_id => 20658, need_num => 3,
      base_name => lang:get("完美幻影石"), next_base_id => 20661,
      next_name => lang:get("完美幻影石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(32) ->
    #{id => 32, base_id => 20659, need_num => 3,
      base_name => lang:get("传奇虹彩晶"), next_base_id => 20662,
      next_name => lang:get("传奇虹彩晶"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(33) ->
    #{id => 33, base_id => 20660, need_num => 3,
      base_name => lang:get("传奇月光石"), next_base_id => 20663,
      next_name => lang:get("传奇月光石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(34) ->
    #{id => 34, base_id => 20661, need_num => 3,
      base_name => lang:get("传奇幻影石"), next_base_id => 20664,
      next_name => lang:get("传奇幻影石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(35) ->
    #{id => 35, base_id => 29287, need_num => 6,
      base_name => lang:get("好运鸟·永久"), next_base_id => 29278,
      next_name => lang:get("好运鸟·永久"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(36) ->
    #{id => 36, base_id => 29220, need_num => 3,
      base_name => lang:get("真·棒棒糖"), next_base_id => 29225,
      next_name => lang:get("真·棒棒糖"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(37) ->
    #{id => 37, base_id => 29220, need_num => 2,
      base_name => lang:get("棒棒糖30天"), next_base_id => 29223,
      next_name => lang:get("棒棒糖30天"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(38) ->
    #{id => 38, base_id => 29220, need_num => 1,
      base_name => lang:get("棒棒糖10天"), next_base_id => 29226,
      next_name => lang:get("棒棒糖10天"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(39) ->
    #{id => 39, base_id => 70352, need_num => 6,
      base_name => lang:get("幻月兔"), next_base_id => 70351,
      next_name => lang:get("幻月兔·永久"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(45) ->
    #{id => 45, base_id => 22700, need_num => 5,
      base_name => lang:get("勇敢的白羊"), next_base_id => 22710,
      next_name => lang:get("勇敢的白羊"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(46) ->
    #{id => 46, base_id => 22700, need_num => 5,
      base_name => lang:get("沉稳的金牛"), next_base_id => 22711,
      next_name => lang:get("沉稳的金牛"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(47) ->
    #{id => 47, base_id => 22700, need_num => 5,
      base_name => lang:get("灵敏的双子"), next_base_id => 22712,
      next_name => lang:get("灵敏的双子"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(48) ->
    #{id => 48, base_id => 22700, need_num => 5,
      base_name => lang:get("友善的巨蟹"), next_base_id => 22713,
      next_name => lang:get("友善的巨蟹"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(49) ->
    #{id => 49, base_id => 22700, need_num => 5,
      base_name => lang:get("高贵的狮子"), next_base_id => 22714,
      next_name => lang:get("高贵的狮子"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(50) ->
    #{id => 50, base_id => 22700, need_num => 5,
      base_name => lang:get("完美的处女"), next_base_id => 22715,
      next_name => lang:get("完美的处女"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(51) ->
    #{id => 51, base_id => 22700, need_num => 5,
      base_name => lang:get("美丽的天秤"), next_base_id => 22716,
      next_name => lang:get("美丽的天秤"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(52) ->
    #{id => 52, base_id => 22700, need_num => 5,
      base_name => lang:get("神秘的天蝎"), next_base_id => 22717,
      next_name => lang:get("神秘的天蝎"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(53) ->
    #{id => 53, base_id => 22700, need_num => 5,
      base_name => lang:get("自由的射手"), next_base_id => 22718,
      next_name => lang:get("自由的射手"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(54) ->
    #{id => 54, base_id => 22700, need_num => 5,
      base_name => lang:get("聪慧的摩羯"), next_base_id => 22719,
      next_name => lang:get("聪慧的摩羯"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(55) ->
    #{id => 55, base_id => 22700, need_num => 5,
      base_name => lang:get("冷静的水瓶"), next_base_id => 22720,
      next_name => lang:get("冷静的水瓶"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(56) ->
    #{id => 56, base_id => 22700, need_num => 5,
      base_name => lang:get("浪漫的双鱼"), next_base_id => 22721,
      next_name => lang:get("浪漫的双鱼"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(100) ->
    #{id => 100, base_id => 23650, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(101) ->
    #{id => 101, base_id => 23651, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(102) ->
    #{id => 102, base_id => 23652, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(103) ->
    #{id => 103, base_id => 23653, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(104) ->
    #{id => 104, base_id => 23654, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(105) ->
    #{id => 105, base_id => 23655, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(106) ->
    #{id => 106, base_id => 23656, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(107) ->
    #{id => 107, base_id => 23657, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(108) ->
    #{id => 108, base_id => 23658, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(109) ->
    #{id => 109, base_id => 23659, need_num => 2,
      base_name => lang:get("万能元神"), next_base_id => 23660,
      next_name => lang:get("万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(61) ->
    #{id => 61, base_id => 22400, need_num => 2,
      base_name => lang:get("紫魂"), next_base_id => 22401,
      next_name => lang:get("紫魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(62) ->
    #{id => 62, base_id => 22401, need_num => 2,
      base_name => lang:get("橙魂"), next_base_id => 22402,
      next_name => lang:get("橙魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(63) ->
    #{id => 63, base_id => 22253, need_num => 2,
      base_name => lang:get("珍品特效符石"), next_base_id => 22254,
      next_name => lang:get("珍品特效符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(64) ->
    #{id => 64, base_id => 22401, need_num => 2,
      base_name => lang:get("特效符石"), next_base_id => 22253,
      next_name => lang:get("特效符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(65) ->
    #{id => 65, base_id => 22402, need_num => 2,
      base_name => lang:get("珍品特效符石"), next_base_id => 22254,
      next_name => lang:get("珍品特效符石"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(110) ->
    #{id => 110, base_id => 23856, need_num => 2,
      base_name => lang:get("星光项链"), next_base_id => 23856,
      next_name => lang:get("星光项链"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(111) ->
    #{id => 111, base_id => 23857, need_num => 2,
      base_name => lang:get("月牙项链"), next_base_id => 23857,
      next_name => lang:get("月牙项链"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(112) ->
    #{id => 112, base_id => 23858, need_num => 2,
      base_name => lang:get("太阳项链"), next_base_id => 23858,
      next_name => lang:get("太阳项链"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(113) ->
    #{id => 113, base_id => 23850, need_num => 2,
      base_name => lang:get("竹马"), next_base_id => 23850,
      next_name => lang:get("竹马"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(114) ->
    #{id => 114, base_id => 23851, need_num => 2,
      base_name => lang:get("桃木弹弓"), next_base_id => 23851,
      next_name => lang:get("桃木弹弓"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(115) ->
    #{id => 115, base_id => 23852, need_num => 2,
      base_name => lang:get("星光骑士剑"), next_base_id => 23852,
      next_name => lang:get("星光骑士剑"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(116) ->
    #{id => 116, base_id => 23853, need_num => 2,
      base_name => lang:get("青梅"), next_base_id => 23853,
      next_name => lang:get("青梅"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(117) ->
    #{id => 117, base_id => 23854, need_num => 2,
      base_name => lang:get("如意暖甲"), next_base_id => 23854,
      next_name => lang:get("如意暖甲"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(118) ->
    #{id => 118, base_id => 23855, need_num => 2,
      base_name => lang:get("圣光玄冰甲"), next_base_id => 23855,
      next_name => lang:get("圣光玄冰甲"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(151) ->
    #{id => 151, base_id => 22207, need_num => 1,
      base_name => lang:get("天马珍魂"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_title => lang:get("天马的祝福"),
      mail_content =>
          lang:get("这是天马的馈赠，天马神力永远庇佑着你！\n<color='#ffff00'>天马珍魂</c"
                   "olor>合成<color='#ffff00'>精灵珍魂</color>可获得如下奖励"),
      mail_items => [{29882, 0, 1}, {22248, 0, 1}]};
get(152) ->
    #{id => 152, base_id => 22208, need_num => 5,
      base_name => lang:get("天马之魂"), next_base_id => 22207,
      next_name => lang:get("天马珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(153) ->
    #{id => 153, base_id => 22441, need_num => 1,
      base_name => lang:get("熊猫珍魂"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_title => lang:get("熊猫的祝福"),
      mail_content =>
          lang:get("熊猫大侠的馈赠，元素之力永远护佑着你！\n<color='#ffff00'>熊猫仙竹</c"
                   "olor>合成<color='#ffff00'>精灵珍魂</color>可获得如下奖励"),
      mail_items => [{22443, 0, 1}, {23740, 0, 1}]};
get(154) ->
    #{id => 154, base_id => 22442, need_num => 1,
      base_name => lang:get("深海鲸灵"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_title => lang:get("鲸灵的祝福"),
      mail_content =>
          lang:get("鲸鱼公主的馈赠，海洋之力守护着你！\n<color='#ffff00'>深海鲸灵</col"
                   "or>合成<color='#ffff00'>精灵珍魂</color>可获得如下奖励"),
      mail_items => [{22445, 0, 1}, {23740, 0, 1}]};
get(155) ->
    #{id => 155, base_id => 22444, need_num => 1,
      base_name => lang:get("狮皇神魂"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_title => lang:get("狮皇的祝福"),
      mail_content =>
          lang:get("惩戒狮皇的馈赠，草原之力守护着你！\n<color='#ffff00'>狮皇神魂</col"
                   "or>合成<color='#ffff00'>精灵珍魂</color>可获得如下奖励"),
      mail_items => [{22447, 0, 1}, {23740, 0, 1}]};
get(156) ->
    #{id => 156, base_id => 22446, need_num => 1,
      base_name => lang:get("红桃魔灵"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_title => lang:get("爱丽丝的祝福"),
      mail_content =>
          lang:get("爱丽丝的馈赠，爱的魔力转圈圈！\n<color='#ffff00'>红桃魔灵</color"
                   ">合成<color='#ffff00'>精灵珍魂</color>可获得如下奖励"),
      mail_items => [{22449, 0, 1}, {23740, 0, 1}]};
get(157) ->
    #{id => 157, base_id => 22448, need_num => 1,
      base_name => lang:get("红桃魔灵"), next_base_id => 22205,
      next_name => lang:get("精灵珍魂"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(160) ->
    #{id => 160, base_id => 23665, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(161) ->
    #{id => 161, base_id => 23666, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(162) ->
    #{id => 162, base_id => 23667, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(163) ->
    #{id => 163, base_id => 23668, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(164) ->
    #{id => 164, base_id => 23670, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(165) ->
    #{id => 165, base_id => 23671, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(166) ->
    #{id => 166, base_id => 23674, need_num => 2,
      base_name => lang:get("稀有万能元神"), next_base_id => 23669,
      next_name => lang:get("稀有万能元神"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(167) ->
    #{id => 167, base_id => 29915, need_num => 2,
      base_name => lang:get("冰灵雪花"), next_base_id => 23669,
      next_name => lang:get("冰灵雪花"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(200) ->
    #{id => 200, base_id => 22450, need_num => 3,
      base_name => lang:get("表情箱子"), next_base_id => 22451,
      next_name => lang:get("表情箱子"), cost_assets => [],
      odds => 100, bind => 0, universal => 0,
      mail_items => []};
get(201) ->
    #{id => 201, base_id => 22452, need_num => 3,
      base_name => lang:get("大表情包子"), next_base_id => 22453,
      next_name => lang:get("大表情包子"), cost_assets => [],
      odds => 100, bind => 0, universal => 0,
      mail_items => []};
get(202) ->
    #{id => 202, base_id => 22456, need_num => 3,
      base_name => lang:get("新春箱子"), next_base_id => 22451,
      next_name => lang:get("新春箱子"), cost_assets => [],
      odds => 100, bind => 0, universal => 0,
      mail_items => []};
get(130) ->
    #{id => 130, base_id => 22790, need_num => 2,
      base_name => lang:get("王者之心"), next_base_id => 22785,
      next_name => lang:get("王者之心"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(131) ->
    #{id => 131, base_id => 22450, need_num => 2,
      base_name => lang:get("表情包子"), next_base_id => 22456,
      next_name => lang:get("新春包子"),
      cost_assets => [{90000, 10000}], odds => 100, bind => 0,
      universal => 1, mail_items => []};
get(_BaseId) -> false.

get_fuse_by_base_id(20400) ->
    [{57, 20020, 4, 20400, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20022) ->
    [{3, 20021, 4, 20022, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(20404) ->
    [{58, 20022, 4, 20404, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20009) ->
    [{4, 20008, 4, 20009, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(20010) ->
    [{5, 20009, 4, 20010, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(20601) ->
    [{7, 20600, 4, 20601, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20602) ->
    [{8, 20601, 4, 20602, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20604) ->
    [{9, 20603, 4, 20604, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20605) ->
    [{10, 20604, 4, 20605, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20607) ->
    [{11, 20606, 4, 20607, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20608) ->
    [{12, 20607, 4, 20608, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20613) ->
    [{13, 20612, 4, 20613, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20614) ->
    [{14, 20613, 4, 20614, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20615) ->
    [{15, 20615, 2, 20615, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20616) ->
    [{16, 20616, 2, 20616, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20617) ->
    [{17, 20617, 2, 20617, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20638) ->
    [{120, 20638, 2, 20638, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(21200) ->
    [{18, 20060, 4, 21200, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21201) ->
    [{19, 20060, 4, 21201, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21202) ->
    [{20, 20060, 4, 21202, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21203) ->
    [{21, 20060, 4, 21203, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21204) ->
    [{22, 20060, 4, 21204, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21205) ->
    [{59, 20060, 4, 21205, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(21206) ->
    [{60, 20060, 4, 21206, [{90000, 10000}], 100, 1}];
get_fuse_by_base_id(20656) ->
    [{26, 20653, 3, 20656, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20657) ->
    [{27, 20654, 3, 20657, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20658) ->
    [{28, 20655, 3, 20658, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20659) ->
    [{29, 20656, 3, 20659, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20660) ->
    [{30, 20657, 3, 20660, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20661) ->
    [{31, 20658, 3, 20661, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20662) ->
    [{32, 20659, 3, 20662, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20663) ->
    [{33, 20660, 3, 20663, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(20664) ->
    [{34, 20661, 3, 20664, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(29278) ->
    [{35, 29287, 6, 29278, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(29225) ->
    [{36, 29220, 3, 29225, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(29223) ->
    [{37, 29220, 2, 29223, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(29226) ->
    [{38, 29220, 1, 29226, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(70351) ->
    [{39, 70352, 6, 70351, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22710) ->
    [{45, 22700, 5, 22710, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22711) ->
    [{46, 22700, 5, 22711, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22712) ->
    [{47, 22700, 5, 22712, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22713) ->
    [{48, 22700, 5, 22713, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22714) ->
    [{49, 22700, 5, 22714, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22715) ->
    [{50, 22700, 5, 22715, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22716) ->
    [{51, 22700, 5, 22716, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22717) ->
    [{52, 22700, 5, 22717, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22718) ->
    [{53, 22700, 5, 22718, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22719) ->
    [{54, 22700, 5, 22719, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22720) ->
    [{55, 22700, 5, 22720, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22721) ->
    [{56, 22700, 5, 22721, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23660) ->
    [{100, 23650, 2, 23660, [{90000, 10000}], 100, 0},
     {101, 23651, 2, 23660, [{90000, 10000}], 100, 0},
     {102, 23652, 2, 23660, [{90000, 10000}], 100, 0},
     {103, 23653, 2, 23660, [{90000, 10000}], 100, 0},
     {104, 23654, 2, 23660, [{90000, 10000}], 100, 0},
     {105, 23655, 2, 23660, [{90000, 10000}], 100, 0},
     {106, 23656, 2, 23660, [{90000, 10000}], 100, 0},
     {107, 23657, 2, 23660, [{90000, 10000}], 100, 0},
     {108, 23658, 2, 23660, [{90000, 10000}], 100, 0},
     {109, 23659, 2, 23660, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22401) ->
    [{61, 22400, 2, 22401, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22402) ->
    [{62, 22401, 2, 22402, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22254) ->
    [{63, 22253, 2, 22254, [{90000, 10000}], 100, 0},
     {65, 22402, 2, 22254, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22253) ->
    [{64, 22401, 2, 22253, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23856) ->
    [{110, 23856, 2, 23856, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23857) ->
    [{111, 23857, 2, 23857, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23858) ->
    [{112, 23858, 2, 23858, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23850) ->
    [{113, 23850, 2, 23850, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23851) ->
    [{114, 23851, 2, 23851, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23852) ->
    [{115, 23852, 2, 23852, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23853) ->
    [{116, 23853, 2, 23853, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23854) ->
    [{117, 23854, 2, 23854, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23855) ->
    [{118, 23855, 2, 23855, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22205) ->
    [{151, 22207, 1, 22205, [{90000, 10000}], 100, 0},
     {153, 22441, 1, 22205, [{90000, 10000}], 100, 0},
     {154, 22442, 1, 22205, [{90000, 10000}], 100, 0},
     {155, 22444, 1, 22205, [{90000, 10000}], 100, 0},
     {156, 22446, 1, 22205, [{90000, 10000}], 100, 0},
     {157, 22448, 1, 22205, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22207) ->
    [{152, 22208, 5, 22207, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(23669) ->
    [{160, 23665, 2, 23669, [{90000, 10000}], 100, 0},
     {161, 23666, 2, 23669, [{90000, 10000}], 100, 0},
     {162, 23667, 2, 23669, [{90000, 10000}], 100, 0},
     {163, 23668, 2, 23669, [{90000, 10000}], 100, 0},
     {164, 23670, 2, 23669, [{90000, 10000}], 100, 0},
     {165, 23671, 2, 23669, [{90000, 10000}], 100, 0},
     {166, 23674, 2, 23669, [{90000, 10000}], 100, 0},
     {167, 29915, 2, 23669, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22451) ->
    [{200, 22450, 3, 22451, [], 100, 0},
     {202, 22456, 3, 22451, [], 100, 0}];
get_fuse_by_base_id(22453) ->
    [{201, 22452, 3, 22453, [], 100, 0}];
get_fuse_by_base_id(22785) ->
    [{130, 22790, 2, 22785, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(22456) ->
    [{131, 22450, 2, 22456, [{90000, 10000}], 100, 0}];
get_fuse_by_base_id(_) -> false.

