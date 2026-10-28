-file("src/data/achieve_shop_data.erl", 1).

-module(achieve_shop_data).

-export([get/1, get_shop/1, default_id/1]).

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

-file("src/data/achieve_shop_data.erl", 16).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/data/achieve_shop_data.erl", 17).

get(101) ->
    #{id => 101, sort_id => 1, name => lang:get("风和日丽"),
      goods_type => 1, assets_type => achieve_score,
      price => 200, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(102) ->
    #{id => 102, sort_id => 2, name => lang:get("情意绵绵"),
      goods_type => 1, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(103) ->
    #{id => 103, sort_id => 3, name => lang:get("梦幻彩虹"),
      goods_type => 1, assets_type => achieve_score,
      price => 200, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(104) ->
    #{id => 104, sort_id => 4, name => lang:get("月牙星空"),
      goods_type => 1, assets_type => achieve_score,
      price => 200, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(105) ->
    #{id => 105, sort_id => 5, name => lang:get("夺宝奇兵"),
      goods_type => 1, assets_type => achieve_score,
      price => 200, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(122) ->
    #{id => 122, sort_id => 8, name => lang:get("呆萌青蛙"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(123) ->
    #{id => 123, sort_id => 9, name => lang:get("顽皮小猴"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(124) ->
    #{id => 124, sort_id => 10, name => lang:get("慵懒喵喵"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(126) ->
    #{id => 126, sort_id => 12, name => lang:get("粉红小猫"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(128) ->
    #{id => 128, sort_id => 14, name => lang:get("星光点点"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(130) ->
    #{id => 130, sort_id => 16, name => lang:get("爱心迷蒙"),
      goods_type => 2, assets_type => achieve_score,
      price => 150, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(201) ->
    #{id => 201, sort_id => 17, name => lang:get("霜狼:1星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(202) ->
    #{id => 202, sort_id => 18, name => lang:get("霜狼:2星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(203) ->
    #{id => 203, sort_id => 19, name => lang:get("雄狮:1星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(204) ->
    #{id => 204, sort_id => 20, name => lang:get("雄狮:2星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(205) ->
    #{id => 205, sort_id => 21, name => lang:get("天马:1星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(206) ->
    #{id => 206, sort_id => 22, name => lang:get("天马:2星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(207) ->
    #{id => 207, sort_id => 23, name => lang:get("红龙:1星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(208) ->
    #{id => 208, sort_id => 24, name => lang:get("红龙:2星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(229) ->
    #{id => 229, sort_id => 25, name => lang:get("红龙:3星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(230) ->
    #{id => 230, sort_id => 26, name => lang:get("火凤:1星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(231) ->
    #{id => 231, sort_id => 27, name => lang:get("火凤:2星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(232) ->
    #{id => 232, sort_id => 28, name => lang:get("火凤:3星"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(211) ->
    #{id => 211, sort_id => 29, name => lang:get("永结同心"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(212) ->
    #{id => 212, sort_id => 30, name => lang:get("富可敌国"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(213) ->
    #{id => 213, sort_id => 31, name => lang:get("脑力达人"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(214) ->
    #{id => 214, sort_id => 32, name => lang:get("宠物达人"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(215) ->
    #{id => 215, sort_id => 33, name => lang:get("宠物大师"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(216) ->
    #{id => 216, sort_id => 34, name => lang:get("宠物宗师"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(217) ->
    #{id => 217, sort_id => 35, name => lang:get("装备达人"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(218) ->
    #{id => 218, sort_id => 36, name => lang:get("装备大师"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(219) ->
    #{id => 219, sort_id => 37, name => lang:get("装备宗师"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(220) ->
    #{id => 220, sort_id => 38, name => lang:get("星座爱好者"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(221) ->
    #{id => 221, sort_id => 39, name => lang:get("星座达人"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(222) ->
    #{id => 222, sort_id => 40, name => lang:get("星座大师"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(223) ->
    #{id => 223, sort_id => 41, name => lang:get("英勇黄铜"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(224) ->
    #{id => 224, sort_id => 42, name => lang:get("不屈白银"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(225) ->
    #{id => 225, sort_id => 43, name => lang:get("荣耀黄金"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(226) ->
    #{id => 226, sort_id => 44, name => lang:get("华贵铂金"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(227) ->
    #{id => 227, sort_id => 45, name => lang:get("璀璨钻石"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(228) ->
    #{id => 228, sort_id => 46, name => lang:get("顶级王者"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(233) ->
    #{id => 233, sort_id => 47, name => lang:get("一往无前"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(234) ->
    #{id => 234, sort_id => 48, name => lang:get("刚正不阿"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(235) ->
    #{id => 235, sort_id => 49, name => lang:get("谋定后动"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(236) ->
    #{id => 236, sort_id => 50, name => lang:get("英勇无畏"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(237) ->
    #{id => 237, sort_id => 51, name => lang:get("忠贞不渝"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(238) ->
    #{id => 238, sort_id => 52, name => lang:get("纯洁善良"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(239) ->
    #{id => 239, sort_id => 53, name => lang:get("牺牲奉献"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(240) ->
    #{id => 240, sort_id => 54, name => lang:get("机巧灵动"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(241) ->
    #{id => 241, sort_id => 55, name => lang:get("自由不羁"),
      goods_type => 3, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(301) ->
    #{id => 301, sort_id => 45, name => lang:get("默认气泡"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(302) ->
    #{id => 302, sort_id => 46, name => lang:get("呆萌青蛙"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(303) ->
    #{id => 303, sort_id => 47, name => lang:get("少女心情"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(304) ->
    #{id => 304, sort_id => 48, name => lang:get("月牙星空"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(305) ->
    #{id => 305, sort_id => 49, name => lang:get("顽皮小猴"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(307) ->
    #{id => 307, sort_id => 51, name => lang:get("七彩气球"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(310) ->
    #{id => 310, sort_id => 54, name => lang:get("西部牛仔"),
      goods_type => 4, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(311) ->
    #{id => 311, sort_id => 55, name => lang:get("唱响星辰"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(312) ->
    #{id => 312, sort_id => 56, name => lang:get("大眼萌喵"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(313) ->
    #{id => 313, sort_id => 57, name => lang:get("吉祥如意"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(314) ->
    #{id => 314, sort_id => 58, name => lang:get("团团圆圆"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(315) ->
    #{id => 315, sort_id => 59, name => lang:get("情真意切"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(316) ->
    #{id => 316, sort_id => 75, name => lang:get("魅力阳光"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(317) ->
    #{id => 317, sort_id => 69, name => lang:get("冰雪奇缘"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(318) ->
    #{id => 318, sort_id => 70, name => lang:get("福星高照"),
      goods_type => 4, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(401) ->
    #{id => 401, sort_id => 55, name => lang:get("默认队标"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(402) ->
    #{id => 402, sort_id => 56, name => lang:get("爱心领队"),
      goods_type => 5, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(403) ->
    #{id => 403, sort_id => 57, name => lang:get("圣光正义"),
      goods_type => 5, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(405) ->
    #{id => 405, sort_id => 59, name => lang:get("森林守护"),
      goods_type => 5, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(406) ->
    #{id => 406, sort_id => 60, name => lang:get("太阳后裔"),
      goods_type => 5, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(407) ->
    #{id => 407, sort_id => 61, name => lang:get("极寒勇者"),
      goods_type => 5, assets_type => achieve_score,
      price => 300, selling => 1,
      destination => lang:get("[成就-兑换商店]")};
get(408) ->
    #{id => 408, sort_id => 62, name => lang:get("跳跃音符"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(409) ->
    #{id => 409, sort_id => 63, name => lang:get("星辰之羽"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(410) ->
    #{id => 410, sort_id => 64, name => lang:get("联赛总冠军"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(411) ->
    #{id => 411, sort_id => 65, name => lang:get("鸿运高照"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(412) ->
    #{id => 412, sort_id => 66, name => lang:get("新春送福"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(413) ->
    #{id => 413, sort_id => 67, name => lang:get("缤纷世界"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(414) ->
    #{id => 414, sort_id => 68, name => lang:get("富贵吉祥"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(416) ->
    #{id => 416, sort_id => 70,
      name => lang:get("精灵之森（2阶）"), goods_type => 5,
      assets_type => achieve_score, price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(417) ->
    #{id => 417, sort_id => 71,
      name => lang:get("月痕海岸（3阶）"), goods_type => 5,
      assets_type => achieve_score, price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(418) ->
    #{id => 418, sort_id => 72,
      name => lang:get("极北之域（4阶）"), goods_type => 5,
      assets_type => achieve_score, price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(419) ->
    #{id => 419, sort_id => 73, name => lang:get("圣心城（5阶）"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(420) ->
    #{id => 420, sort_id => 74,
      name => lang:get("失落神殿（6阶）"), goods_type => 5,
      assets_type => achieve_score, price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(421) ->
    #{id => 421, sort_id => 76, name => lang:get("雅比小熊"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(424) ->
    #{id => 424, sort_id => 79, name => lang:get("端午龙舟"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(426) ->
    #{id => 426, sort_id => 81, name => lang:get("圣夜南瓜"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(427) ->
    #{id => 427, sort_id => 82, name => lang:get("欢乐雪娃"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(428) ->
    #{id => 428, sort_id => 83, name => lang:get("新春大吉"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(422) ->
    #{id => 422, sort_id => 77, name => lang:get("鸿福齐天"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(423) ->
    #{id => 423, sort_id => 78, name => lang:get("秘银之光"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(425) ->
    #{id => 425, sort_id => 80, name => lang:get("幸运星"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(429) ->
    #{id => 429, sort_id => 84, name => lang:get("蓝鲸灵"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(430) ->
    #{id => 430, sort_id => 85, name => lang:get("清甜西瓜"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(431) ->
    #{id => 431, sort_id => 86, name => lang:get("心心相印"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(432) ->
    #{id => 432, sort_id => 87, name => lang:get("超级飞船"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(433) ->
    #{id => 433, sort_id => 88, name => lang:get("红桃桃"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(434) ->
    #{id => 434, sort_id => 89, name => lang:get("小红花"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(435) ->
    #{id => 435, sort_id => 90, name => lang:get("快乐薯条"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(436) ->
    #{id => 436, sort_id => 91, name => lang:get("桃花花"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(437) ->
    #{id => 437, sort_id => 92, name => lang:get("小小地球"),
      goods_type => 5, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(501) ->
    #{id => 501, sort_id => 1000, name => lang:get("好声音"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(502) ->
    #{id => 502, sort_id => 1001, name => lang:get("诸神之巅"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(503) ->
    #{id => 503, sort_id => 1002, name => lang:get("萌萌哒"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(505) ->
    #{id => 505, sort_id => 1004, name => lang:get("宗师"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(506) ->
    #{id => 506, sort_id => 1005, name => lang:get("战神"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(507) ->
    #{id => 507, sort_id => 1006, name => lang:get("倾心"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(508) ->
    #{id => 508, sort_id => 1007, name => lang:get("星空"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(509) ->
    #{id => 509, sort_id => 1008, name => lang:get("大神"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(510) ->
    #{id => 510, sort_id => 1009, name => lang:get("暖春"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(511) ->
    #{id => 511, sort_id => 1010, name => lang:get("人气"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(512) ->
    #{id => 512, sort_id => 1011, name => lang:get("火热"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(700) ->
    #{id => 700, sort_id => 2000, name => lang:get("诸神冠军"),
      goods_type => 7, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[我的空间-装扮]")};
get(701) ->
    #{id => 701, sort_id => 2001, name => lang:get("诸神冠军"),
      goods_type => 7, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[我的空间-装扮]")};
get(702) ->
    #{id => 702, sort_id => 2002, name => lang:get("诸神冠军"),
      goods_type => 7, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[我的空间-装扮]")};
get(703) ->
    #{id => 703, sort_id => 2003, name => lang:get("公会小花"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(704) ->
    #{id => 704, sort_id => 2004, name => lang:get("蛋碎一地"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(705) ->
    #{id => 705, sort_id => 2005, name => lang:get("吃瓜群众"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(706) ->
    #{id => 706, sort_id => 2006, name => lang:get("金猪宝宝"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(707) ->
    #{id => 707, sort_id => 2007, name => lang:get("人见人爱"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(708) ->
    #{id => 708, sort_id => 2008, name => lang:get("红星闪耀"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(709) ->
    #{id => 709, sort_id => 2009, name => lang:get("百毒不侵"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(710) ->
    #{id => 710, sort_id => 2010, name => lang:get("小捣蛋鬼"),
      goods_type => 6, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(800) ->
    #{id => 800, sort_id => 3000, name => lang:get("繁花似锦"),
      goods_type => 8, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(801) ->
    #{id => 801, sort_id => 3001, name => lang:get("怦然心动"),
      goods_type => 8, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(802) ->
    #{id => 802, sort_id => 3002, name => lang:get("蝴蝶纷飞"),
      goods_type => 8, assets_type => achieve_score,
      price => 0, selling => 0,
      destination => lang:get("[成就-兑换商店]")};
get(_Id) -> false.

get_shop(1) ->
    [#{id => 101, sort_id => 1, name => lang:get("风和日丽"),
       goods_type => 1, assets_type => achieve_score,
       price => 200, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 102, sort_id => 2, name => lang:get("情意绵绵"),
       goods_type => 1, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 103, sort_id => 3, name => lang:get("梦幻彩虹"),
       goods_type => 1, assets_type => achieve_score,
       price => 200, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 104, sort_id => 4, name => lang:get("月牙星空"),
       goods_type => 1, assets_type => achieve_score,
       price => 200, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 105, sort_id => 5, name => lang:get("夺宝奇兵"),
       goods_type => 1, assets_type => achieve_score,
       price => 200, selling => 1,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(2) ->
    [#{id => 122, sort_id => 8, name => lang:get("呆萌青蛙"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 123, sort_id => 9, name => lang:get("顽皮小猴"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 124, sort_id => 10, name => lang:get("慵懒喵喵"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 126, sort_id => 12, name => lang:get("粉红小猫"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 128, sort_id => 14, name => lang:get("星光点点"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 130, sort_id => 16, name => lang:get("爱心迷蒙"),
       goods_type => 2, assets_type => achieve_score,
       price => 150, selling => 1,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(3) ->
    [#{id => 201, sort_id => 17, name => lang:get("霜狼:1星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 202, sort_id => 18, name => lang:get("霜狼:2星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 203, sort_id => 19, name => lang:get("雄狮:1星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 204, sort_id => 20, name => lang:get("雄狮:2星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 205, sort_id => 21, name => lang:get("天马:1星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 206, sort_id => 22, name => lang:get("天马:2星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 207, sort_id => 23, name => lang:get("红龙:1星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 208, sort_id => 24, name => lang:get("红龙:2星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 229, sort_id => 25, name => lang:get("红龙:3星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 230, sort_id => 26, name => lang:get("火凤:1星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 231, sort_id => 27, name => lang:get("火凤:2星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 232, sort_id => 28, name => lang:get("火凤:3星"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 211, sort_id => 29, name => lang:get("永结同心"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 212, sort_id => 30, name => lang:get("富可敌国"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 213, sort_id => 31, name => lang:get("脑力达人"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 214, sort_id => 32, name => lang:get("宠物达人"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 215, sort_id => 33, name => lang:get("宠物大师"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 216, sort_id => 34, name => lang:get("宠物宗师"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 217, sort_id => 35, name => lang:get("装备达人"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 218, sort_id => 36, name => lang:get("装备大师"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 219, sort_id => 37, name => lang:get("装备宗师"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 220, sort_id => 38, name => lang:get("星座爱好者"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 221, sort_id => 39, name => lang:get("星座达人"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 222, sort_id => 40, name => lang:get("星座大师"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 223, sort_id => 41, name => lang:get("英勇黄铜"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 224, sort_id => 42, name => lang:get("不屈白银"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 225, sort_id => 43, name => lang:get("荣耀黄金"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 226, sort_id => 44, name => lang:get("华贵铂金"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 227, sort_id => 45, name => lang:get("璀璨钻石"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 228, sort_id => 46, name => lang:get("顶级王者"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 233, sort_id => 47, name => lang:get("一往无前"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 234, sort_id => 48, name => lang:get("刚正不阿"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 235, sort_id => 49, name => lang:get("谋定后动"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 236, sort_id => 50, name => lang:get("英勇无畏"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 237, sort_id => 51, name => lang:get("忠贞不渝"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 238, sort_id => 52, name => lang:get("纯洁善良"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 239, sort_id => 53, name => lang:get("牺牲奉献"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 240, sort_id => 54, name => lang:get("机巧灵动"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 241, sort_id => 55, name => lang:get("自由不羁"),
       goods_type => 3, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(4) ->
    [#{id => 301, sort_id => 45, name => lang:get("默认气泡"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 302, sort_id => 46, name => lang:get("呆萌青蛙"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 303, sort_id => 47, name => lang:get("少女心情"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 304, sort_id => 48, name => lang:get("月牙星空"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 305, sort_id => 49, name => lang:get("顽皮小猴"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 307, sort_id => 51, name => lang:get("七彩气球"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 310, sort_id => 54, name => lang:get("西部牛仔"),
       goods_type => 4, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 311, sort_id => 55, name => lang:get("唱响星辰"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 312, sort_id => 56, name => lang:get("大眼萌喵"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 313, sort_id => 57, name => lang:get("吉祥如意"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 314, sort_id => 58, name => lang:get("团团圆圆"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 315, sort_id => 59, name => lang:get("情真意切"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 316, sort_id => 75, name => lang:get("魅力阳光"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 317, sort_id => 69, name => lang:get("冰雪奇缘"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 318, sort_id => 70, name => lang:get("福星高照"),
       goods_type => 4, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(5) ->
    [#{id => 401, sort_id => 55, name => lang:get("默认队标"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 402, sort_id => 56, name => lang:get("爱心领队"),
       goods_type => 5, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 403, sort_id => 57, name => lang:get("圣光正义"),
       goods_type => 5, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 405, sort_id => 59, name => lang:get("森林守护"),
       goods_type => 5, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 406, sort_id => 60, name => lang:get("太阳后裔"),
       goods_type => 5, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 407, sort_id => 61, name => lang:get("极寒勇者"),
       goods_type => 5, assets_type => achieve_score,
       price => 300, selling => 1,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 408, sort_id => 62, name => lang:get("跳跃音符"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 409, sort_id => 63, name => lang:get("星辰之羽"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 410, sort_id => 64, name => lang:get("联赛总冠军"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 411, sort_id => 65, name => lang:get("鸿运高照"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 412, sort_id => 66, name => lang:get("新春送福"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 413, sort_id => 67, name => lang:get("缤纷世界"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 414, sort_id => 68, name => lang:get("富贵吉祥"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 416, sort_id => 70,
       name => lang:get("精灵之森（2阶）"), goods_type => 5,
       assets_type => achieve_score, price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 417, sort_id => 71,
       name => lang:get("月痕海岸（3阶）"), goods_type => 5,
       assets_type => achieve_score, price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 418, sort_id => 72,
       name => lang:get("极北之域（4阶）"), goods_type => 5,
       assets_type => achieve_score, price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 419, sort_id => 73, name => lang:get("圣心城（5阶）"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 420, sort_id => 74,
       name => lang:get("失落神殿（6阶）"), goods_type => 5,
       assets_type => achieve_score, price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 421, sort_id => 76, name => lang:get("雅比小熊"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 424, sort_id => 79, name => lang:get("端午龙舟"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 426, sort_id => 81, name => lang:get("圣夜南瓜"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 427, sort_id => 82, name => lang:get("欢乐雪娃"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 428, sort_id => 83, name => lang:get("新春大吉"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 422, sort_id => 77, name => lang:get("鸿福齐天"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 423, sort_id => 78, name => lang:get("秘银之光"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 425, sort_id => 80, name => lang:get("幸运星"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 429, sort_id => 84, name => lang:get("蓝鲸灵"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 430, sort_id => 85, name => lang:get("清甜西瓜"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 431, sort_id => 86, name => lang:get("心心相印"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 432, sort_id => 87, name => lang:get("超级飞船"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 433, sort_id => 88, name => lang:get("红桃桃"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 434, sort_id => 89, name => lang:get("小红花"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 435, sort_id => 90, name => lang:get("快乐薯条"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 436, sort_id => 91, name => lang:get("桃花花"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 437, sort_id => 92, name => lang:get("小小地球"),
       goods_type => 5, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(6) ->
    [#{id => 501, sort_id => 1000, name => lang:get("好声音"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 502, sort_id => 1001, name => lang:get("诸神之巅"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 503, sort_id => 1002, name => lang:get("萌萌哒"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 505, sort_id => 1004, name => lang:get("宗师"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 506, sort_id => 1005, name => lang:get("战神"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 507, sort_id => 1006, name => lang:get("倾心"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 508, sort_id => 1007, name => lang:get("星空"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 509, sort_id => 1008, name => lang:get("大神"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 510, sort_id => 1009, name => lang:get("暖春"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 511, sort_id => 1010, name => lang:get("人气"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 512, sort_id => 1011, name => lang:get("火热"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 703, sort_id => 2003, name => lang:get("公会小花"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 704, sort_id => 2004, name => lang:get("蛋碎一地"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 705, sort_id => 2005, name => lang:get("吃瓜群众"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 706, sort_id => 2006, name => lang:get("金猪宝宝"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 707, sort_id => 2007, name => lang:get("人见人爱"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 708, sort_id => 2008, name => lang:get("红星闪耀"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 709, sort_id => 2009, name => lang:get("百毒不侵"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 710, sort_id => 2010, name => lang:get("小捣蛋鬼"),
       goods_type => 6, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(7) ->
    [#{id => 700, sort_id => 2000, name => lang:get("诸神冠军"),
       goods_type => 7, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[我的空间-装扮]")},
     #{id => 701, sort_id => 2001, name => lang:get("诸神冠军"),
       goods_type => 7, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[我的空间-装扮]")},
     #{id => 702, sort_id => 2002, name => lang:get("诸神冠军"),
       goods_type => 7, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[我的空间-装扮]")}];
get_shop(8) ->
    [#{id => 800, sort_id => 3000, name => lang:get("繁花似锦"),
       goods_type => 8, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 801, sort_id => 3001, name => lang:get("怦然心动"),
       goods_type => 8, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")},
     #{id => 802, sort_id => 3002, name => lang:get("蝴蝶纷飞"),
       goods_type => 8, assets_type => achieve_score,
       price => 0, selling => 0,
       destination => lang:get("[成就-兑换商店]")}];
get_shop(_) -> false.

default_id(1) -> 0;
default_id(4) -> 301;
default_id(5) -> 401;
default_id(2) -> 0;
default_id(_) -> 0.

