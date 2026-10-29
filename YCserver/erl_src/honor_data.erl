-file("src/data/honor_data.erl", 1).

-module(honor_data).

-export([list/0,
         get/1,
         to_classes/1,
         to_sex/1,
         to_classes_sex/1,
         get_pre/1,
         get_pre_reward/2,
         list_by_type/0]).

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

-file("src/data/honor_data.erl", 21).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/data/honor_data.erl", 22).

-spec list() -> list().

list() ->
    [101,
     102,
     103,
     104,
     11002,
     11003,
     11004,
     11005,
     11006,
     11007,
     11008,
     11009,
     11010,
     11011,
     11012,
     11013,
     11014,
     11015,
     11016,
     11017,
     11018,
     11019,
     11020,
     11021,
     11022,
     11023,
     11024,
     11025,
     11026,
     11027,
     11028,
     11029,
     11030,
     11031,
     11032,
     11033,
     11034,
     11035,
     11036,
     11037,
     11038,
     11039,
     11040,
     11041,
     11042,
     11043,
     11044,
     11045,
     11046,
     11047,
     11048,
     11049,
     11050,
     11051,
     11052,
     11053,
     11054,
     11055,
     11056,
     11057,
     11058,
     11059,
     11060,
     11061,
     11062,
     11063,
     11064,
     11065,
     11066,
     11067,
     11068,
     11069,
     11070,
     11071,
     11073,
     11074,
     11075,
     11076,
     11077,
     11078,
     11079,
     11080,
     11081,
     11082,
     11083,
     11084,
     11085,
     11086,
     11087,
     11090,
     11091,
     11092,
     11093,
     11094,
     11095,
     11096,
     11097,
     11098,
     11099,
     11100,
     11101,
     11102,
     11103,
     11104,
     11105,
     11106,
     11107,
     11108,
     11109,
     11110,
     11111,
     11112,
     11113,
     11114,
     11115,
     11116,
     11117,
     11118,
     11119,
     11120,
     11121,
     11122,
     11123,
     11124,
     11125,
     11126,
     11127,
     11128,
     11129,
     11130,
     11131,
     11200,
     11201,
     11202,
     11203,
     11204,
     11205,
     11206,
     11207,
     11208,
     11209,
     11210,
     11211,
     11212,
     11213,
     11214,
     11215,
     11216,
     11217,
     11218,
     11219,
     11220,
     11221,
     11222,
     11223,
     11224,
     11225,
     11300,
     11301,
     11302,
     11303,
     11304,
     11305,
     11401,
     11402,
     11403,
     11404,
     11405,
     11406,
     11407,
     11408,
     11409,
     11410,
     11411,
     11412,
     11413,
     11414,
     11415,
     11416,
     11417,
     11418,
     11419,
     11420,
     11501,
     11502,
     11503,
     11504,
     11505,
     11506,
     11507,
     11508,
     11509,
     11510,
     11511,
     11512,
     11513,
     11514,
     11515,
     11516,
     11517,
     11518,
     20000,
     20001,
     20002,
     20003,
     20004,
     20005,
     20105,
     21000,
     21001,
     21002,
     21003,
     21004,
     22000,
     22001,
     22002,
     22003,
     22004,
     22005,
     22006,
     22007,
     22008,
     22009,
     22010,
     22011,
     22012,
     22013,
     22014,
     22015,
     22016,
     22017,
     22018,
     22019,
     23000,
     23001,
     23002,
     23003,
     23004,
     23005,
     23006,
     23007,
     23008,
     23009,
     23010,
     23011,
     23012,
     23013,
     23014,
     23015,
     23016,
     23017,
     23018,
     23020,
     23021,
     23022,
     23023,
     23024,
     23025,
     23026,
     23027,
     23028,
     23029,
     23030,
     23031,
     23032,
     23033,
     23034,
     23035,
     23036,
     23037,
     23038,
     23039,
     23040,
     23041,
     23042,
     23043,
     23044,
     23045,
     23046,
     23047,
     23048,
     23049,
     23050,
     23051,
     23052,
     23053,
     23054,
     23055,
     23056,
     23057,
     23058,
     23059,
     23060,
     23061,
     23062,
     23063,
     23064,
     23065,
     23066,
     23067,
     23068,
     23069,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30007,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     30017,
     30030,
     30031,
     30032,
     30033,
     30034,
     30035,
     30036,
     30037,
     30038,
     30100,
     30101,
     30102,
     30103,
     30104,
     30105,
     30106,
     30107,
     30108,
     30109,
     30110,
     30111,
     30112,
     30113,
     30114,
     30115,
     30116,
     30117,
     30118,
     30119,
     30120,
     30121,
     30122,
     30140,
     30141,
     30142,
     30200,
     30201,
     30202,
     30203,
     30204,
     30205,
     30206,
     30207,
     30208,
     30209,
     30210,
     30211,
     30310,
     30320,
     30321,
     30322,
     30330,
     30331,
     30340,
     30341,
     30342,
     30350,
     30351,
     30352,
     30360,
     30361,
     30362,
     30363,
     31001,
     31002,
     31003,
     31004,
     31005,
     31006,
     31007,
     31008,
     31009,
     31010,
     31011,
     31012,
     31013,
     31014,
     31015,
     31016,
     31017,
     31018,
     31019,
     31020,
     31021,
     31022,
     31023,
     31024,
     31025,
     31026,
     31103,
     31105,
     31106,
     31107,
     31200,
     31201,
     31202,
     31203,
     31204,
     31205,
     31206,
     32000,
     32001,
     32002,
     32003,
     32004,
     32005,
     32006,
     32007,
     32008,
     32009,
     32010,
     32011,
     32020,
     32021,
     32022,
     32023,
     32024,
     32025,
     32026,
     32027,
     32028,
     32029,
     32030,
     32031,
     32040,
     32041,
     32042,
     32043,
     32044,
     32045,
     32046,
     32047,
     32048,
     32049,
     32050,
     32051,
     32060,
     32061,
     32062,
     32063,
     32064,
     32065,
     32066,
     32067,
     32068,
     32069,
     32070,
     32071,
     32080,
     32081,
     32082,
     32083,
     32084,
     32085,
     32086,
     32087,
     32088,
     32089,
     32090,
     32091,
     32100,
     32101,
     32102,
     32103,
     32104,
     32105,
     32106,
     32107,
     32108,
     32109,
     32110,
     32111,
     32120,
     32121,
     32122,
     32123,
     32124,
     32125,
     32126,
     32127,
     32128,
     32129,
     32130,
     32131,
     39000,
     39001,
     39002,
     39003,
     39004,
     39005,
     39006,
     39007,
     39008,
     39009,
     39010,
     39011,
     39012,
     39013,
     39014,
     39015,
     39016,
     39017,
     39018,
     39019,
     39020,
     39021,
     39022,
     39023,
     39024,
     39025,
     39026,
     39027,
     39028,
     39029,
     39030,
     39031,
     39032,
     39033,
     39034,
     40000].

-spec get(Id :: pos_integer()) -> #honor_base{} | false.

get(101) ->
    #honor_base{id = 101, name = lang:get("40级世界BOSS"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(102) ->
    #honor_base{id = 102, name = lang:get("50级世界BOSS"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(103) ->
    #honor_base{id = 103, name = lang:get("60级世界BOSS"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(104) ->
    #honor_base{id = 104, name = lang:get("70级世界BOSS"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11002) ->
    #honor_base{id = 11002, name = lang:get("盖世无双"),
                show_type = 2, type = 2, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11003) ->
    #honor_base{id = 11003, name = lang:get("风色新兵"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11004) ->
    #honor_base{id = 11004, name = lang:get("英勇黄铜"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11005) ->
    #honor_base{id = 11005, name = lang:get("不屈白银"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11006) ->
    #honor_base{id = 11006, name = lang:get("荣耀黄金"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11007) ->
    #honor_base{id = 11007, name = lang:get("华贵铂金"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11008) ->
    #honor_base{id = 11008, name = lang:get("璀璨钻石"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11009) ->
    #honor_base{id = 11009, name = lang:get("顶级王者"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11010) ->
    #honor_base{id = 11010, name = lang:get("会长"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11011) ->
    #honor_base{id = 11011, name = lang:get("副会长"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11012) ->
    #honor_base{id = 11012, name = lang:get("长老"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11013) ->
    #honor_base{id = 11013, name = lang:get("精英"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11014) ->
    #honor_base{id = 11014, name = lang:get("成员"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11015) ->
    #honor_base{id = 11015, name = lang:get("新秀"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11016) ->
    #honor_base{id = 11016, name = lang:get("兵长"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11017) ->
    #honor_base{id = 11017, name = lang:get("宝贝"),
                show_type = 2, type = 3, mode_type = 1, classes = 0,
                sex = 0, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(11018) ->
    #honor_base{id = 11018, name = lang:get("花语使者"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11019) ->
    #honor_base{id = 11019, name = lang:get("花语狂人"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11020) ->
    #honor_base{id = 11020, name = lang:get("花语领主"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11021) ->
    #honor_base{id = 11021, name = lang:get("花语大师"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11022) ->
    #honor_base{id = 11022, name = lang:get("魅力四射"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11023) ->
    #honor_base{id = 11023, name = lang:get("魅力无限"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11024) ->
    #honor_base{id = 11024, name = lang:get("魅力佳人"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11025) ->
    #honor_base{id = 11025, name = lang:get("魅力宝贝"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11026) ->
    #honor_base{id = 11026, name = lang:get("魅力女神"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11027) ->
    #honor_base{id = 11027, name = lang:get("极道强者"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11028) ->
    #honor_base{id = 11028, name = lang:get("新兵组小钢炮"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11029) ->
    #honor_base{id = 11029, name = lang:get("新兵组黑玫瑰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11030) ->
    #honor_base{id = 11030, name = lang:get("精锐组小钢炮"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11031) ->
    #honor_base{id = 11031, name = lang:get("精锐组黑玫瑰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11032) ->
    #honor_base{id = 11032, name = lang:get("大师组小钢炮"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11033) ->
    #honor_base{id = 11033, name = lang:get("大师组黑玫瑰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11034) ->
    #honor_base{id = 11034, name = lang:get("王者组小钢炮"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11035) ->
    #honor_base{id = 11035, name = lang:get("王者组黑玫瑰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11036) ->
    #honor_base{id = 11036, name = lang:get("战神组小钢炮"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11037) ->
    #honor_base{id = 11037, name = lang:get("战神组黑玫瑰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11038) ->
    #honor_base{id = 11038, name = lang:get("炉火纯青"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11039) ->
    #honor_base{id = 11039, name = lang:get("神宠奇兵"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11040) ->
    #honor_base{id = 11040, name = lang:get("最强守护"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11041) ->
    #honor_base{id = 11041, name = lang:get("绝世风华"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11042) ->
    #honor_base{id = 11042, name = lang:get("绝世风华"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11043) ->
    #honor_base{id = 11043, name = lang:get("第一会长"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11044) ->
    #honor_base{id = 11044, name = lang:get("魅力宝贝"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11045) ->
    #honor_base{id = 11045, name = lang:get("手留余香"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11046) ->
    #honor_base{id = 11046, name = lang:get("智慧对决冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{6, 15}],
                is_can_pre = 1, collect_val = 0};
get(11047) ->
    #honor_base{id = 11047, name = lang:get("大冒险家"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11048) ->
    #honor_base{id = 11048, name = lang:get("星辰英豪"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11049) ->
    #honor_base{id = 11049, name = lang:get("新秀战将"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}],
                is_can_pre = 1, collect_val = 0};
get(11050) ->
    #honor_base{id = 11050, name = lang:get("精锐勇士"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 30}],
                is_can_pre = 1, collect_val = 0};
get(11051) ->
    #honor_base{id = 11051, name = lang:get("勇武铁骑"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 40}],
                is_can_pre = 1, collect_val = 0};
get(11052) ->
    #honor_base{id = 11052, name = lang:get("英雄史诗"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 50}],
                is_can_pre = 1, collect_val = 0};
get(11053) ->
    #honor_base{id = 11053, name = lang:get("战场王者"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 60}],
                is_can_pre = 1, collect_val = 0};
get(11054) ->
    #honor_base{id = 11054, name = lang:get("出神入化"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11055) ->
    #honor_base{id = 11055, name = lang:get("智多星"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{6, 8}],
                is_can_pre = 1, collect_val = 0};
get(11056) ->
    #honor_base{id = 11056, name = lang:get("智慧对决亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{6, 12}],
                is_can_pre = 1, collect_val = 0};
get(11057) ->
    #honor_base{id = 11057, name = lang:get("功成名就"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11058) ->
    #honor_base{id = 11058, name = lang:get("未婚夫"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11059) ->
    #honor_base{id = 11059, name = lang:get("未婚妻"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11060) ->
    #honor_base{id = 11060, name = lang:get("丈夫"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11061) ->
    #honor_base{id = 11061, name = lang:get("妻子"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11062) ->
    #honor_base{id = 11062, name = lang:get("狂剑首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 1,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {4, 20}],
                is_can_pre = 1, collect_val = 0};
get(11063) ->
    #honor_base{id = 11063, name = lang:get("魔导首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 2,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {5, 20}],
                is_can_pre = 1, collect_val = 0};
get(11064) ->
    #honor_base{id = 11064, name = lang:get("战弓首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 3,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {4, 20}],
                is_can_pre = 1, collect_val = 0};
get(11065) ->
    #honor_base{id = 11065, name = lang:get("兽灵首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 4,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {3, 8}],
                is_can_pre = 1, collect_val = 0};
get(11066) ->
    #honor_base{id = 11066, name = lang:get("秘言首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 5,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {2, 50}],
                is_can_pre = 1, collect_val = 0};
get(11079) ->
    #honor_base{id = 11079, name = lang:get("月魂首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 6,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {5, 20}],
                is_can_pre = 1, collect_val = 0};
get(11067) ->
    #honor_base{id = 11067, name = lang:get("比翼双飞"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11068) ->
    #honor_base{id = 11068, name = lang:get("比翼双飞"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11069) ->
    #honor_base{id = 11069, name = lang:get("新晋男神"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11070) ->
    #honor_base{id = 11070, name = lang:get("新晋女神"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11071) ->
    #honor_base{id = 11071, name = lang:get("星辰宝贝"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11073) ->
    #honor_base{id = 11073, name = lang:get("为人师表"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11074) ->
    #honor_base{id = 11074, name = lang:get("桃李满天下"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11075) ->
    #honor_base{id = 11075, name = lang:get("一代宗师"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11076) ->
    #honor_base{id = 11076, name = lang:get("相濡以沫"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11077) ->
    #honor_base{id = 11077, name = lang:get("滑雪·踏雪无痕"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11078) ->
    #honor_base{id = 11078, name = lang:get("智慧对决季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11086) ->
    #honor_base{id = 11086, name = lang:get("名门望族"),
                show_type = 2, type = 2, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11087) ->
    #honor_base{id = 11087, name = lang:get("圣骑首席弟子"),
                show_type = 2, type = 2, mode_type = 3, classes = 7,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {4, 20}],
                is_can_pre = 1, collect_val = 0};
get(11080) ->
    #honor_base{id = 11080, name = lang:get("的徒弟"),
                show_type = 2, type = 7, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11081) ->
    #honor_base{id = 11081, name = lang:get("的大弟子"),
                show_type = 2, type = 7, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11082) ->
    #honor_base{id = 11082, name = lang:get("的二弟子"),
                show_type = 2, type = 7, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11083) ->
    #honor_base{id = 11083, name = lang:get("的三弟子"),
                show_type = 2, type = 7, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11084) ->
    #honor_base{id = 11084, name = lang:get("的弟子"),
                show_type = 2, type = 7, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11085) ->
    #honor_base{id = 11085, show_type = 2, type = 10,
                mode_type = 1, classes = 0, sex = 2, is_cast = 0,
                is_can_pre = 0, collect_val = 0};
get(11090) ->
    #honor_base{id = 11090, name = lang:get("余音袅袅·冠"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11091) ->
    #honor_base{id = 11091, name = lang:get("好声音·亚"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11092) ->
    #honor_base{id = 11092, name = lang:get("好声音·季"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11093) ->
    #honor_base{id = 11093, name = lang:get("星辰好声音"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11094) ->
    #honor_base{id = 11094, name = lang:get("仙音缭绕·总冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11095) ->
    #honor_base{id = 11095, name = lang:get("仙音缭绕·亚"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11096) ->
    #honor_base{id = 11096, name = lang:get("仙音缭绕·季"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11097) ->
    #honor_base{id = 11097, name = lang:get("仙音缭绕"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11098) ->
    #honor_base{id = 11098, name = lang:get("余音袅袅·冠"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 15}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11099) ->
    #honor_base{id = 11099, name = lang:get("好声音·亚"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11100) ->
    #honor_base{id = 11100, name = lang:get("好声音·季"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(11101) ->
    #honor_base{id = 11101, name = lang:get("星辰好声音"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 5}],
                is_can_pre = 0, collect_val = 0};
get(11102) ->
    #honor_base{id = 11102, name = lang:get("仙音缭绕·总冠军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11103) ->
    #honor_base{id = 11103, name = lang:get("仙音缭绕·亚"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11104) ->
    #honor_base{id = 11104, name = lang:get("仙音缭绕·季"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11105) ->
    #honor_base{id = 11105, name = lang:get("仙音缭绕"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11106) ->
    #honor_base{id = 11106, name = lang:get("星辰有你"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11107) ->
    #honor_base{id = 11107, name = lang:get("萌萌哒"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11108) ->
    #honor_base{id = 11108, name = lang:get("星辰传说"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11109) ->
    #honor_base{id = 11109, name = lang:get("金玉满堂"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11110) ->
    #honor_base{id = 11110, name = lang:get("灵犀一点通"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11111) ->
    #honor_base{id = 11111, name = lang:get("龙舟·乘风破浪"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11112) ->
    #honor_base{id = 11112, name = lang:get("星辰擂主"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11113) ->
    #honor_base{id = 11113, name = lang:get("圣天使"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11114) ->
    #honor_base{id = 11114, name = lang:get("御风"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11115) ->
    #honor_base{id = 11115, name = lang:get("跳跃吧！智者猪"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}, {6, 5}],
                is_can_pre = 0, collect_val = 0};
get(11116) ->
    #honor_base{id = 11116, name = lang:get("全民偶像·冠军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 15}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11117) ->
    #honor_base{id = 11117, name = lang:get("全民偶像·亚军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11118) ->
    #honor_base{id = 11118, name = lang:get("全民偶像·季军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(11119) ->
    #honor_base{id = 11119, name = lang:get("全民偶像·十强"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 5}],
                is_can_pre = 0, collect_val = 0};
get(11120) ->
    #honor_base{id = 11120, name = lang:get("实力唱将·冠军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 15}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11121) ->
    #honor_base{id = 11121, name = lang:get("实力唱将·亚军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}, {6, 4}],
                is_can_pre = 0, collect_val = 0};
get(11122) ->
    #honor_base{id = 11122, name = lang:get("实力唱将·季军"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(11123) ->
    #honor_base{id = 11123, name = lang:get("实力唱将·十强"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 5}],
                is_can_pre = 0, collect_val = 0};
get(11124) ->
    #honor_base{id = 11124, name = lang:get("宝藏猎人"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}, {7, 4}],
                is_can_pre = 1, collect_val = 0};
get(11125) ->
    #honor_base{id = 11125, name = lang:get("缤纷夏日"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {2, 30}],
                is_can_pre = 1, collect_val = 0};
get(11126) ->
    #honor_base{id = 11126, name = lang:get("七夕眷侣"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11127) ->
    #honor_base{id = 11127, name = lang:get("不给糖就捣蛋"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11128) ->
    #honor_base{id = 11128, name = lang:get("单身贵族"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11129) ->
    #honor_base{id = 11129, name = lang:get("屠龙者"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}, {6, 5}],
                is_can_pre = 1, collect_val = 0};
get(11130) ->
    #honor_base{id = 11130, name = lang:get("巨龙公会"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}, {6, 5}],
                is_can_pre = 0, collect_val = 0};
get(11131) ->
    #honor_base{id = 11131, name = lang:get("甜蜜恋人"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11200) ->
    #honor_base{id = 11200, name = lang:get("哈尼"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11201) ->
    #honor_base{id = 11201, name = lang:get("哈尼"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11202) ->
    #honor_base{id = 11202, name = lang:get("小心肝"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11203) ->
    #honor_base{id = 11203, name = lang:get("小宝贝"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11204) ->
    #honor_base{id = 11204, name = lang:get("夫君"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11205) ->
    #honor_base{id = 11205, name = lang:get("娘子"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11206) ->
    #honor_base{id = 11206, name = lang:get("哥哥"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11207) ->
    #honor_base{id = 11207, name = lang:get("妹妹"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11208) ->
    #honor_base{id = 11208, name = lang:get("呆瓜"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11209) ->
    #honor_base{id = 11209, name = lang:get("傻妞"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11210) ->
    #honor_base{id = 11210, name = lang:get("亲亲"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11211) ->
    #honor_base{id = 11211, name = lang:get("乖乖"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11212) ->
    #honor_base{id = 11212, name = lang:get("猪头"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11213) ->
    #honor_base{id = 11213, name = lang:get("笨蛋"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11214) ->
    #honor_base{id = 11214, name = lang:get("罗密欧"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11215) ->
    #honor_base{id = 11215, name = lang:get("朱丽叶"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11216) ->
    #honor_base{id = 11216, name = lang:get("杰克"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11217) ->
    #honor_base{id = 11217, name = lang:get("罗斯"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11218) ->
    #honor_base{id = 11218, name = lang:get("梁山伯"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11219) ->
    #honor_base{id = 11219, name = lang:get("祝英台"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11220) ->
    #honor_base{id = 11220, name = lang:get("王子"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11221) ->
    #honor_base{id = 11221, name = lang:get("公主"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11222) ->
    #honor_base{id = 11222, name = lang:get("有缘人"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11223) ->
    #honor_base{id = 11223, name = lang:get("有缘人"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11224) ->
    #honor_base{id = 11224, name = lang:get("爱人"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11225) ->
    #honor_base{id = 11225, name = lang:get("爱人"),
                show_type = 2, type = 6, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11300) ->
    #honor_base{id = 11300, name = lang:get("诸神·冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 80}, {2, 80}],
                is_can_pre = 0, collect_val = 0};
get(11301) ->
    #honor_base{id = 11301, name = lang:get("诸神·亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 60}, {2, 60}],
                is_can_pre = 0, collect_val = 0};
get(11302) ->
    #honor_base{id = 11302, name = lang:get("诸神·季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 50}, {2, 50}],
                is_can_pre = 0, collect_val = 0};
get(11303) ->
    #honor_base{id = 11303, name = lang:get("诸神传奇"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 40}, {2, 40}],
                is_can_pre = 0, collect_val = 0};
get(11304) ->
    #honor_base{id = 11304, name = lang:get("诸神英豪"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 30}, {2, 30}],
                is_can_pre = 0, collect_val = 0};
get(11305) ->
    #honor_base{id = 11305, name = lang:get("众神之神"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 100}, {2, 100}],
                is_can_pre = 0, collect_val = 0};
get(11401) ->
    #honor_base{id = 11401, name = lang:get("钻石王老大"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11402) ->
    #honor_base{id = 11402, name = lang:get("钻石王老二"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11403) ->
    #honor_base{id = 11403, name = lang:get("钻石王老三"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11404) ->
    #honor_base{id = 11404, name = lang:get("钻石王老四"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11405) ->
    #honor_base{id = 11405, name = lang:get("钻石王老五"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11406) ->
    #honor_base{id = 11406, name = lang:get("钻石王老大"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11407) ->
    #honor_base{id = 11407, name = lang:get("钻石王老二"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11408) ->
    #honor_base{id = 11408, name = lang:get("钻石王老三"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11409) ->
    #honor_base{id = 11409, name = lang:get("钻石王老四"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11410) ->
    #honor_base{id = 11410, name = lang:get("钻石王老五"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11411) ->
    #honor_base{id = 11411, name = lang:get("钻石王老大"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11412) ->
    #honor_base{id = 11412, name = lang:get("钻石王老二"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11413) ->
    #honor_base{id = 11413, name = lang:get("钻石王老三"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11414) ->
    #honor_base{id = 11414, name = lang:get("钻石王老四"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11415) ->
    #honor_base{id = 11415, name = lang:get("钻石王老五"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11416) ->
    #honor_base{id = 11416, name = lang:get("钻石王老大"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11417) ->
    #honor_base{id = 11417, name = lang:get("钻石王老二"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11418) ->
    #honor_base{id = 11418, name = lang:get("钻石王老三"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11419) ->
    #honor_base{id = 11419, name = lang:get("钻石王老四"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11420) ->
    #honor_base{id = 11420, name = lang:get("钻石王老五"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(11501) ->
    #honor_base{id = 11501, name = lang:get("龙王试练-不怕火焰"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11502) ->
    #honor_base{id = 11502, name = lang:get("龙王试练-操控疾风"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11503) ->
    #honor_base{id = 11503, name = lang:get("龙王试练-融化寒冰"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11504) ->
    #honor_base{id = 11504, name = lang:get("龙王试练-踏穿大地"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11505) ->
    #honor_base{id = 11505, name = lang:get("龙王试练-挑战者"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11506) ->
    #honor_base{id = 11506, name = lang:get("龙王试练-星辰勇士"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11507) ->
    #honor_base{id = 11507, name = lang:get("龙王试练-星辰战将"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11508) ->
    #honor_base{id = 11508, name = lang:get("龙王试练-星辰霸主"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11509) ->
    #honor_base{id = 11509, name = lang:get("龙王试练-真龙王者"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11510) ->
    #honor_base{id = 11510, name = lang:get("天启试炼-战争之轮"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11511) ->
    #honor_base{id = 11511, name = lang:get("天启试炼-贪婪之镰"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11512) ->
    #honor_base{id = 11512, name = lang:get("天启试炼-邪恶之刃"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11513) ->
    #honor_base{id = 11513, name = lang:get("天启试炼-破坏之锤"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11514) ->
    #honor_base{id = 11514, name = lang:get("天启试炼-挑战者"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11515) ->
    #honor_base{id = 11515, name = lang:get("天启试炼-决斗勇士"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11516) ->
    #honor_base{id = 11516, name = lang:get("天启试炼-枭勇战将"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11517) ->
    #honor_base{id = 11517, name = lang:get("天启试炼-斗战领主"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(11518) ->
    #honor_base{id = 11518, name = lang:get("天启试炼-永恒之光"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20000) ->
    #honor_base{id = 20000, name = lang:get("职业任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20001) ->
    #honor_base{id = 20001, name = lang:get("悬赏任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20002) ->
    #honor_base{id = 20002, name = lang:get("护送任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20003) ->
    #honor_base{id = 20003, name = lang:get("宝图任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20004) ->
    #honor_base{id = 20004, name = lang:get("吃货巡游"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20005) ->
    #honor_base{id = 20005, name = lang:get("天空之塔"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(21000) ->
    #honor_base{id = 21000, name = lang:get("宠物商店"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(21001) ->
    #honor_base{id = 21001, name = lang:get("10级商店"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(21002) ->
    #honor_base{id = 21002, name = lang:get("药品商店"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(21003) ->
    #honor_base{id = 21003, name = lang:get("交易市场"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(21004) ->
    #honor_base{id = 21004, name = lang:get("远航商人"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22000) ->
    #honor_base{id = 22000, name = lang:get("狂剑首席"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22001) ->
    #honor_base{id = 22001, name = lang:get("魔导首席"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22002) ->
    #honor_base{id = 22002, name = lang:get("战弓首席"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22003) ->
    #honor_base{id = 22003, name = lang:get("兽灵首席"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22004) ->
    #honor_base{id = 22004, name = lang:get("秘言首席"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22005) ->
    #honor_base{id = 22005, name = lang:get("多人副本"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22006) ->
    #honor_base{id = 22006, name = lang:get("20级商店"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22007) ->
    #honor_base{id = 22007, name = lang:get("30级商店"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22008) ->
    #honor_base{id = 22008, name = lang:get("仓库"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22009) ->
    #honor_base{id = 22009, name = lang:get("历练环任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22010) ->
    #honor_base{id = 22010, name = lang:get("夫妻任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22011) ->
    #honor_base{id = 22011, name = lang:get("宠物情缘"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22012) ->
    #honor_base{id = 22012, name = lang:get("每日惊喜"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22013) ->
    #honor_base{id = 22013, name = lang:get("拜师收徒"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22014) ->
    #honor_base{id = 22014, name = lang:get("师徒任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22015) ->
    #honor_base{id = 22015, name = lang:get("家园"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22016) ->
    #honor_base{id = 22016, name = lang:get("游侠历练"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22017) ->
    #honor_base{id = 22017, name = lang:get("职业转换"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22018) ->
    #honor_base{id = 22018, name = lang:get("十二星座"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(22019) ->
    #honor_base{id = 22019, name = lang:get("跨服约战"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23000) ->
    #honor_base{id = 23000, name = lang:get("职业挑战"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23001) ->
    #honor_base{id = 23001, name = lang:get("勇士战场"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23002) ->
    #honor_base{id = 23002, name = lang:get("智慧闯关"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23003) ->
    #honor_base{id = 23003, name = lang:get("彩虹冒险"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23004) ->
    #honor_base{id = 23004, name = lang:get("时空段位"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23005) ->
    #honor_base{id = 23005, name = lang:get("公会任务"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23006) ->
    #honor_base{id = 23006, name = lang:get("春节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23007) ->
    #honor_base{id = 23007, name = lang:get("巅峰战场"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23008) ->
    #honor_base{id = 23008, name = lang:get("公会战"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23009) ->
    #honor_base{id = 23009, name = lang:get("清明活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23010) ->
    #honor_base{id = 23010, name = lang:get("荣耀战场"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23011) ->
    #honor_base{id = 23011, name = lang:get("五一活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23012) ->
    #honor_base{id = 23012, name = lang:get("六一活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23013) ->
    #honor_base{id = 23013, name = lang:get("端午活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23014) ->
    #honor_base{id = 23014, name = lang:get("精灵幻境"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23015) ->
    #honor_base{id = 23015, name = lang:get("武道大会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23016) ->
    #honor_base{id = 23016, name = lang:get("捉迷藏"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23017) ->
    #honor_base{id = 23017, name = lang:get("清凉一夏"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23018) ->
    #honor_base{id = 23018, name = lang:get("六一活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23020) ->
    #honor_base{id = 23020, name = lang:get("好声音"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23021) ->
    #honor_base{id = 23021, name = lang:get("中秋活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23022) ->
    #honor_base{id = 23022, name = lang:get("孔明灯会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23023) ->
    #honor_base{id = 23023, name = lang:get("中秋赏月"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23024) ->
    #honor_base{id = 23024, name = lang:get("公会联赛"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23025) ->
    #honor_base{id = 23025, name = lang:get("国庆活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23026) ->
    #honor_base{id = 23026, name = lang:get("公会总管"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23027) ->
    #honor_base{id = 23027, name = lang:get("驱除邪灵"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23028) ->
    #honor_base{id = 23028, name = lang:get("诸神之战"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23029) ->
    #honor_base{id = 23029, name = lang:get("结拜"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23030) ->
    #honor_base{id = 23030, name = lang:get("祈福盛会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23031) ->
    #honor_base{id = 23031, name = lang:get("感恩活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23032) ->
    #honor_base{id = 23032, name = lang:get("雪人挑战"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23033) ->
    #honor_base{id = 23033, name = lang:get("圣诞活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23034) ->
    #honor_base{id = 23034, name = lang:get("上古妖魔"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23035) ->
    #honor_base{id = 23035, name = lang:get("春节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23036) ->
    #honor_base{id = 23036, name = lang:get("元宵灯会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23037) ->
    #honor_base{id = 23037, name = lang:get("星辰擂台"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(20105) ->
    #honor_base{id = 20105, name = lang:get("许愿大使"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23038) ->
    #honor_base{id = 23038, name = lang:get("端午活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23039) ->
    #honor_base{id = 23039, name = lang:get("父亲节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23040) ->
    #honor_base{id = 23040, name = lang:get("钻石联赛"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23041) ->
    #honor_base{id = 23041, name = lang:get("龙王试练"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23042) ->
    #honor_base{id = 23042, name = lang:get("开学季"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23043) ->
    #honor_base{id = 23043, name = lang:get("七夕活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23044) ->
    #honor_base{id = 23044, name = lang:get("国庆活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23045) ->
    #honor_base{id = 23045, name = lang:get("中秋灯会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23046) ->
    #honor_base{id = 23046, name = lang:get("光棍节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23047) ->
    #honor_base{id = 23047, name = lang:get("萌宝天使"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23048) ->
    #honor_base{id = 23048, name = lang:get("圣诞狂欢"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23049) ->
    #honor_base{id = 23049, name = lang:get("急速滑雪"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23050) ->
    #honor_base{id = 23050, name = lang:get("腊八赏歌"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23051) ->
    #honor_base{id = 23051, name = lang:get("五彩贺小年"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23052) ->
    #honor_base{id = 23052, name = lang:get("春节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23053) ->
    #honor_base{id = 23053, name = lang:get("植树节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23054) ->
    #honor_base{id = 23054, name = lang:get("五一活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23055) ->
    #honor_base{id = 23055, name = lang:get("周年庆活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23056) ->
    #honor_base{id = 23056, name = lang:get("天启霸主"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(23057) ->
    #honor_base{id = 23057, name = lang:get("海洋派对"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23058) ->
    #honor_base{id = 23058, name = lang:get("假日赏歌"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23059) ->
    #honor_base{id = 23059, name = lang:get("赏歌大会"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23060) ->
    #honor_base{id = 23060, name = lang:get("邪灵之主"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23061) ->
    #honor_base{id = 23061, name = lang:get("净化家园"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23062) ->
    #honor_base{id = 23062, name = lang:get("顽皮萌娃"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23063) ->
    #honor_base{id = 23063, name = lang:get("神宠来袭"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23064) ->
    #honor_base{id = 23064, name = lang:get("点石成金"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23065) ->
    #honor_base{id = 23065, name = lang:get("情人节活动"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23066) ->
    #honor_base{id = 23066, name = lang:get("草木妖王"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23067) ->
    #honor_base{id = 23067, name = lang:get("魔法少女"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23068) ->
    #honor_base{id = 23068, name = lang:get("周年庆典"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(23069) ->
    #honor_base{id = 23069, name = lang:get("爆烈少女"),
                show_type = 1, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30001) ->
    #honor_base{id = 30001, name = lang:get("初级游侠"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30002) ->
    #honor_base{id = 30002, name = lang:get("中级游侠"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30003) ->
    #honor_base{id = 30003, name = lang:get("高级游侠"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30004) ->
    #honor_base{id = 30004, name = lang:get("三等骑士"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30005) ->
    #honor_base{id = 30005, name = lang:get("二等骑士"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30006) ->
    #honor_base{id = 30006, name = lang:get("黄金骑士"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30007) ->
    #honor_base{id = 30007, name = lang:get("三等勋爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30008) ->
    #honor_base{id = 30008, name = lang:get("二等勋爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30009) ->
    #honor_base{id = 30009, name = lang:get("一等勋爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30010) ->
    #honor_base{id = 30010, name = lang:get("三等子爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30011) ->
    #honor_base{id = 30011, name = lang:get("二等子爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30012) ->
    #honor_base{id = 30012, name = lang:get("一等子爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30013) ->
    #honor_base{id = 30013, name = lang:get("三等伯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30014) ->
    #honor_base{id = 30014, name = lang:get("二等伯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30015) ->
    #honor_base{id = 30015, name = lang:get("一等伯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30016) ->
    #honor_base{id = 30016, name = lang:get("青龙阵营"),
                show_type = 2, type = 5, mode_type = 2, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30017) ->
    #honor_base{id = 30017, name = lang:get("白虎阵营"),
                show_type = 2, type = 5, mode_type = 2, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30030) ->
    #honor_base{id = 30030, name = lang:get("三等侯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30031) ->
    #honor_base{id = 30031, name = lang:get("二等侯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30032) ->
    #honor_base{id = 30032, name = lang:get("一等侯爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30033) ->
    #honor_base{id = 30033, name = lang:get("三等公爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30034) ->
    #honor_base{id = 30034, name = lang:get("二等公爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30035) ->
    #honor_base{id = 30035, name = lang:get("一等公爵"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30036) ->
    #honor_base{id = 30036, name = lang:get("三等大公"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30037) ->
    #honor_base{id = 30037, name = lang:get("二等大公"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30038) ->
    #honor_base{id = 30038, name = lang:get("一等大公"),
                show_type = 2, type = 4, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 1, collect_val = 0};
get(30100) ->
    #honor_base{id = 30100, name = lang:get("荣耀战场冠军"),
                show_type = 2, type = 8, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 50}],
                is_can_pre = 1, collect_val = 0};
get(30101) ->
    #honor_base{id = 30101, name = lang:get("荣耀战场亚军"),
                show_type = 2, type = 8, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 30}],
                is_can_pre = 1, collect_val = 0};
get(30102) ->
    #honor_base{id = 30102, name = lang:get("荣耀战场季军"),
                show_type = 2, type = 8, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}],
                is_can_pre = 1, collect_val = 0};
get(30103) ->
    #honor_base{id = 30103, name = lang:get("荣耀勇武组冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30104) ->
    #honor_base{id = 30104, name = lang:get("荣耀勇武组亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30105) ->
    #honor_base{id = 30105, name = lang:get("荣耀勇武组季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30106) ->
    #honor_base{id = 30106, name = lang:get("荣耀精锐组冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30107) ->
    #honor_base{id = 30107, name = lang:get("荣耀精锐组亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30108) ->
    #honor_base{id = 30108, name = lang:get("荣耀精锐组季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 0, is_can_pre = 0, collect_val = 0};
get(30109) ->
    #honor_base{id = 30109, name = lang:get("公会英雄"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(30110) ->
    #honor_base{id = 30110, name = lang:get("天下第一会"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{2, 5}],
                is_can_pre = 0, collect_val = 0};
get(30111) ->
    #honor_base{id = 30111, name = lang:get("段位之王"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{7, 8}],
                is_can_pre = 1, collect_val = 0};
get(30112) ->
    #honor_base{id = 30112, name = lang:get("幻境仙童"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30113) ->
    #honor_base{id = 30113, name = lang:get("幻境守卫"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30114) ->
    #honor_base{id = 30114, name = lang:get("幻彩精灵"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30115) ->
    #honor_base{id = 30115, name = lang:get("幻境力士"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30116) ->
    #honor_base{id = 30116, name = lang:get("幻影剑客"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30117) ->
    #honor_base{id = 30117, name = lang:get("幻境之神"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30118) ->
    #honor_base{id = 30118, name = lang:get("精灵王族"),
                show_type = 2, type = 9, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{7, 8}],
                is_can_pre = 1, collect_val = 0};
get(30119) ->
    #honor_base{id = 30119, name = lang:get("精灵王族"),
                show_type = 2, type = 9, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{7, 8}],
                is_can_pre = 1, collect_val = 0};
get(30120) ->
    #honor_base{id = 30120, name = lang:get("联赛全服冠军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30121) ->
    #honor_base{id = 30121, name = lang:get("联赛全服亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30122) ->
    #honor_base{id = 30122, name = lang:get("联赛全服季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(30140) ->
    #honor_base{id = 30140, name = lang:get("峡谷之王"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 50}],
                is_can_pre = 1, collect_val = 0};
get(30141) ->
    #honor_base{id = 30141, name = lang:get("峡谷之巅亚军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 30}],
                is_can_pre = 1, collect_val = 0};
get(30142) ->
    #honor_base{id = 30142, name = lang:get("峡谷之巅季军"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}],
                is_can_pre = 1, collect_val = 0};
get(30200) ->
    #honor_base{id = 30200, name = lang:get("勇敢的白羊"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{1, 10}],
                is_can_pre = 1, collect_val = 0};
get(30201) ->
    #honor_base{id = 30201, name = lang:get("沉稳的金牛"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{6, 5}],
                is_can_pre = 1, collect_val = 0};
get(30202) ->
    #honor_base{id = 30202, name = lang:get("灵敏的双子"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{7, 4}, {2, 10}],
                is_can_pre = 1, collect_val = 0};
get(30203) ->
    #honor_base{id = 30203, name = lang:get("友善的巨蟹"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{1, 10}],
                is_can_pre = 1, collect_val = 0};
get(30204) ->
    #honor_base{id = 30204, name = lang:get("高贵的狮子"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{6, 5}],
                is_can_pre = 1, collect_val = 0};
get(30205) ->
    #honor_base{id = 30205, name = lang:get("完美的处女"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{7, 4}, {2, 10}],
                is_can_pre = 1, collect_val = 0};
get(30206) ->
    #honor_base{id = 30206, name = lang:get("美丽的天秤"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{1, 10}],
                is_can_pre = 1, collect_val = 0};
get(30207) ->
    #honor_base{id = 30207, name = lang:get("神秘的天蝎"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{6, 5}],
                is_can_pre = 1, collect_val = 0};
get(30208) ->
    #honor_base{id = 30208, name = lang:get("自由的射手"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{7, 4}, {2, 10}],
                is_can_pre = 1, collect_val = 0};
get(30209) ->
    #honor_base{id = 30209, name = lang:get("聪慧的摩羯"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{1, 10}],
                is_can_pre = 1, collect_val = 0};
get(30210) ->
    #honor_base{id = 30210, name = lang:get("冷静的水瓶"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{6, 5}],
                is_can_pre = 1, collect_val = 0};
get(30211) ->
    #honor_base{id = 30211, name = lang:get("浪漫的双鱼"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 0, attr_list = [{7, 4}, {2, 10}],
                is_can_pre = 1, collect_val = 0};
get(30310) ->
    #honor_base{id = 30310, name = lang:get("初学乍练"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(30320) ->
    #honor_base{id = 30320, name = lang:get("明日之星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30321) ->
    #honor_base{id = 30321, name = lang:get("崭露头角"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30322) ->
    #honor_base{id = 30322, name = lang:get("驾轻就熟"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30330) ->
    #honor_base{id = 30330, name = lang:get("骁勇善战"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30331) ->
    #honor_base{id = 30331, name = lang:get("技惊四座"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30340) ->
    #honor_base{id = 30340, name = lang:get("名动八方"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30341) ->
    #honor_base{id = 30341, name = lang:get("傲视群雄"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30342) ->
    #honor_base{id = 30342, name = lang:get("无与伦比"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30350) ->
    #honor_base{id = 30350, name = lang:get("惊世骇俗"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30351) ->
    #honor_base{id = 30351, name = lang:get("超凡入圣"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30352) ->
    #honor_base{id = 30352, name = lang:get("撼世主神·2星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30360) ->
    #honor_base{id = 30360, name = lang:get("撼世主神·3星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30361) ->
    #honor_base{id = 30361, name = lang:get("不朽神王·1星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30362) ->
    #honor_base{id = 30362, name = lang:get("不朽神王·2星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(30363) ->
    #honor_base{id = 30363, name = lang:get("不朽神王·3星"),
                show_type = 2, type = 13, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 3};
get(31001) ->
    #honor_base{id = 31001, name = lang:get("大航海家"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31002) ->
    #honor_base{id = 31002, name = lang:get("你好再见"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31003) ->
    #honor_base{id = 31003, name = lang:get("乐善好施"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31004) ->
    #honor_base{id = 31004, name = lang:get("摸金校尉"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31005) ->
    #honor_base{id = 31005, name = lang:get("怪物猎人"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31006) ->
    #honor_base{id = 31006, name = lang:get("穿越时空"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31007) ->
    #honor_base{id = 31007, name = lang:get("功德无量"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31008) ->
    #honor_base{id = 31008, name = lang:get("时尚达人"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31009) ->
    #honor_base{id = 31009, name = lang:get("搭配大师"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31010) ->
    #honor_base{id = 31010, name = lang:get("脚踏星空"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31011) ->
    #honor_base{id = 31011, name = lang:get("夺宝奇兵"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31012) ->
    #honor_base{id = 31012, name = lang:get("夏日乐悠悠"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31013) ->
    #honor_base{id = 31013, name = lang:get("武道·神乎其技"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31014) ->
    #honor_base{id = 31014, name = lang:get("武道·登峰造极"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31015) ->
    #honor_base{id = 31015, name = lang:get("武道·星辰王者"),
                show_type = 2, type = 1, mode_type = 3, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31016) ->
    #honor_base{id = 31016, name = lang:get("武道·超神！"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31017) ->
    #honor_base{id = 31017, name = lang:get("武道·火力全开"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31018) ->
    #honor_base{id = 31018, name = lang:get("武道·杀人如麻"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31019) ->
    #honor_base{id = 31019, name = lang:get("武道·全场MVP"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31020) ->
    #honor_base{id = 31020, name = lang:get("武道·治愈之光"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31021) ->
    #honor_base{id = 31021, name = lang:get("武道·Hold住全场"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(31022) ->
    #honor_base{id = 31022, name = lang:get("花好月圆"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31023) ->
    #honor_base{id = 31023, name = lang:get("披星戴月"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31024) ->
    #honor_base{id = 31024, name = lang:get("无尽之境"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31025) ->
    #honor_base{id = 31025, name = lang:get("南瓜影帝"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31026) ->
    #honor_base{id = 31026, name = lang:get("好久不见"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31103) ->
    #honor_base{id = 31103, name = lang:get("万人追捧"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31105) ->
    #honor_base{id = 31105, name = lang:get("段子手"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31106) ->
    #honor_base{id = 31106, name = lang:get("星辰大海"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}, {2, 20}],
                is_can_pre = 1, collect_val = 0};
get(31107) ->
    #honor_base{id = 31107, name = lang:get("手可摘星辰"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{6, 5}, {7, 5}],
                is_can_pre = 1, collect_val = 0};
get(31200) ->
    #honor_base{id = 31200, name = lang:get("梦幻城堡"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31201) ->
    #honor_base{id = 31201, name = lang:get("造梦大师"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(31202) ->
    #honor_base{id = 31202, name = lang:get("成就·大师"),
                show_type = 2, type = 12, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1,
                attr_list = [{1, 10}, {6, 3}, {7, 3}, {2, 10}],
                is_can_pre = 0, collect_val = 0};
get(31203) ->
    #honor_base{id = 31203, name = lang:get("成就·无双"),
                show_type = 2, type = 12, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1,
                attr_list = [{1, 20}, {6, 5}, {7, 5}, {2, 20}],
                is_can_pre = 0, collect_val = 0};
get(31204) ->
    #honor_base{id = 31204, name = lang:get("角斗士"),
                show_type = 2, type = 12, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1,
                attr_list = [{1, 10}, {6, 3}, {7, 3}], is_can_pre = 0,
                collect_val = 0};
get(31205) ->
    #honor_base{id = 31205, name = lang:get("不服就战"),
                show_type = 2, type = 12, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1,
                attr_list = [{1, 10}, {6, 3}, {7, 3}], is_can_pre = 1,
                collect_val = 0};
get(31206) ->
    #honor_base{id = 31206, name = lang:get("威名远扬"),
                show_type = 2, type = 12, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(32000) ->
    #honor_base{id = 32000, name = lang:get("见习剑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32001) ->
    #honor_base{id = 32001, name = lang:get("初级剑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32002) ->
    #honor_base{id = 32002, name = lang:get("中级剑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32003) ->
    #honor_base{id = 32003, name = lang:get("高级剑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32004) ->
    #honor_base{id = 32004, name = lang:get("初级剑客"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32005) ->
    #honor_base{id = 32005, name = lang:get("中级剑客"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32006) ->
    #honor_base{id = 32006, name = lang:get("高级剑客"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32007) ->
    #honor_base{id = 32007, name = lang:get("大剑豪"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32008) ->
    #honor_base{id = 32008, name = lang:get("剑圣"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32009) ->
    #honor_base{id = 32009, name = lang:get("九霄剑主"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32010) ->
    #honor_base{id = 32010, name = lang:get("星河剑境"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32011) ->
    #honor_base{id = 32011, name = lang:get("幻影疾风"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32020) ->
    #honor_base{id = 32020, name = lang:get("见习魔法师"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32021) ->
    #honor_base{id = 32021, name = lang:get("初级魔法师"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32022) ->
    #honor_base{id = 32022, name = lang:get("中级魔法师"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32023) ->
    #honor_base{id = 32023, name = lang:get("高级魔法师"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32024) ->
    #honor_base{id = 32024, name = lang:get("初级魔导士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32025) ->
    #honor_base{id = 32025, name = lang:get("中级魔导士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32026) ->
    #honor_base{id = 32026, name = lang:get("高级魔导士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32027) ->
    #honor_base{id = 32027, name = lang:get("大魔导士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32028) ->
    #honor_base{id = 32028, name = lang:get("传奇魔导士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32029) ->
    #honor_base{id = 32029, name = lang:get("元素主宰"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32030) ->
    #honor_base{id = 32030, name = lang:get("魔皇降世"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32031) ->
    #honor_base{id = 32031, name = lang:get("湮灭之手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32040) ->
    #honor_base{id = 32040, name = lang:get("见习射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32041) ->
    #honor_base{id = 32041, name = lang:get("初级射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32042) ->
    #honor_base{id = 32042, name = lang:get("中级射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32043) ->
    #honor_base{id = 32043, name = lang:get("高级射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32044) ->
    #honor_base{id = 32044, name = lang:get("初级神射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32045) ->
    #honor_base{id = 32045, name = lang:get("中级神射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32046) ->
    #honor_base{id = 32046, name = lang:get("高级神射手"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32047) ->
    #honor_base{id = 32047, name = lang:get("弓弩骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32048) ->
    #honor_base{id = 32048, name = lang:get("巨龙猎人"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32049) ->
    #honor_base{id = 32049, name = lang:get("星界巡狩"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32050) ->
    #honor_base{id = 32050, name = lang:get("箭破苍穹"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32051) ->
    #honor_base{id = 32051, name = lang:get("永恒星光"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32060) ->
    #honor_base{id = 32060, name = lang:get("见习灵语者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32061) ->
    #honor_base{id = 32061, name = lang:get("初级灵语者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32062) ->
    #honor_base{id = 32062, name = lang:get("中级灵语者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32063) ->
    #honor_base{id = 32063, name = lang:get("高级灵语者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32064) ->
    #honor_base{id = 32064, name = lang:get("初级幻灵"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32065) ->
    #honor_base{id = 32065, name = lang:get("中级幻灵"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32066) ->
    #honor_base{id = 32066, name = lang:get("高级幻灵"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32067) ->
    #honor_base{id = 32067, name = lang:get("丛林之王"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32068) ->
    #honor_base{id = 32068, name = lang:get("大地蛮王"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32069) ->
    #honor_base{id = 32069, name = lang:get("万象灵尊"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32070) ->
    #honor_base{id = 32070, name = lang:get("大掌控者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32071) ->
    #honor_base{id = 32071, name = lang:get("幻灵怒雷"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32080) ->
    #honor_base{id = 32080, name = lang:get("见习祭司"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32081) ->
    #honor_base{id = 32081, name = lang:get("初级祭司"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32082) ->
    #honor_base{id = 32082, name = lang:get("中级祭司"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32083) ->
    #honor_base{id = 32083, name = lang:get("高级祭司"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32084) ->
    #honor_base{id = 32084, name = lang:get("初级圣言者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32085) ->
    #honor_base{id = 32085, name = lang:get("中级圣言者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32086) ->
    #honor_base{id = 32086, name = lang:get("高级圣言者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32087) ->
    #honor_base{id = 32087, name = lang:get("预言者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32088) ->
    #honor_base{id = 32088, name = lang:get("圣主教"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32089) ->
    #honor_base{id = 32089, name = lang:get("大先知"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32090) ->
    #honor_base{id = 32090, name = lang:get("神思者"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32091) ->
    #honor_base{id = 32091, name = lang:get("生命赞诗"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32100) ->
    #honor_base{id = 32100, name = lang:get("见习守夜人"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32101) ->
    #honor_base{id = 32101, name = lang:get("初级守夜人"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32102) ->
    #honor_base{id = 32102, name = lang:get("中级守夜人"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32103) ->
    #honor_base{id = 32103, name = lang:get("高级守夜人"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32104) ->
    #honor_base{id = 32104, name = lang:get("初级审判官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32105) ->
    #honor_base{id = 32105, name = lang:get("中级审判官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32106) ->
    #honor_base{id = 32106, name = lang:get("高级审判官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32107) ->
    #honor_base{id = 32107, name = lang:get("月之主祭"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32108) ->
    #honor_base{id = 32108, name = lang:get("夜幕领主"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32109) ->
    #honor_base{id = 32109, name = lang:get("皎月星君"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32110) ->
    #honor_base{id = 32110, name = lang:get("幻月神官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32111) ->
    #honor_base{id = 32111, name = lang:get("月影湮灭"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32120) ->
    #honor_base{id = 32120, name = lang:get("见习骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32121) ->
    #honor_base{id = 32121, name = lang:get("初级骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32122) ->
    #honor_base{id = 32122, name = lang:get("中级骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32123) ->
    #honor_base{id = 32123, name = lang:get("高级骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32124) ->
    #honor_base{id = 32124, name = lang:get("初级仲裁官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32125) ->
    #honor_base{id = 32125, name = lang:get("中级仲裁官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32126) ->
    #honor_base{id = 32126, name = lang:get("高级仲裁官"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32127) ->
    #honor_base{id = 32127, name = lang:get("光耀圣骑士"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32128) ->
    #honor_base{id = 32128, name = lang:get("守誓之心"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32129) ->
    #honor_base{id = 32129, name = lang:get("圣光守护"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32130) ->
    #honor_base{id = 32130, name = lang:get("黎明之光"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(32131) ->
    #honor_base{id = 32131, name = lang:get("神罚之枪"),
                show_type = 2, type = 11, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39000) ->
    #honor_base{id = 39000, name = lang:get("无双·独冠群芳"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39001) ->
    #honor_base{id = 39001, name = lang:get("绝代·众星揽月"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39002) ->
    #honor_base{id = 39002, name = lang:get("风华·超凡脱俗"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39003) ->
    #honor_base{id = 39003, name = lang:get("星辰幻想"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39004) ->
    #honor_base{id = 39004, name = lang:get("神雕大侠"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(40000) ->
    #honor_base{id = 40000, name = lang:get("行走的表情包"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(39005) ->
    #honor_base{id = 39005, name = lang:get("至尊女神"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39006) ->
    #honor_base{id = 39006, name = lang:get("青春女神"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39007) ->
    #honor_base{id = 39007, name = lang:get("星辰·欢乐时光"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39008) ->
    #honor_base{id = 39008, name = lang:get("美若天仙"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39009) ->
    #honor_base{id = 39009, name = lang:get("国色天香"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39010) ->
    #honor_base{id = 39010, name = lang:get("一把火"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 10}],
                is_can_pre = 0, collect_val = 0};
get(39011) ->
    #honor_base{id = 39011, name = lang:get("圣灵幻身"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, attr_list = [{1, 20}],
                is_can_pre = 0, collect_val = 0};
get(39012) ->
    #honor_base{id = 39012, name = lang:get("因你而在"),
                color = 5, show_type = 2, type = 1, mode_type = 1,
                classes = 0, sex = 2, is_cast = 1, is_can_pre = 1,
                collect_val = 0};
get(39013) ->
    #honor_base{id = 39013, name = lang:get("新年快乐"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39014) ->
    #honor_base{id = 39014, name = lang:get("情有独钟"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39015) ->
    #honor_base{id = 39015, name = lang:get("人生赢家"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39016) ->
    #honor_base{id = 39016, name = lang:get("整蛊专家"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39017) ->
    #honor_base{id = 39017, name = lang:get("糖果大王"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39018) ->
    #honor_base{id = 39018, name = lang:get("风一样的我"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39019) ->
    #honor_base{id = 39019, name = lang:get("天真烂漫"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39020) ->
    #honor_base{id = 39020, name = lang:get("太阳女神"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 0, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39021) ->
    #honor_base{id = 39021, name = lang:get("太阳男神"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 1, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39022) ->
    #honor_base{id = 39022, name = lang:get("飞驰人生"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39023) ->
    #honor_base{id = 39023, name = lang:get("伴我同行"),
                color = 5, show_type = 2, type = 1, mode_type = 1,
                classes = 0, sex = 2, is_cast = 1, is_can_pre = 1,
                collect_val = 0};
get(39024) ->
    #honor_base{id = 39024, name = lang:get("狂拽酷炫"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39025) ->
    #honor_base{id = 39025, name = lang:get("吃货本货"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39026) ->
    #honor_base{id = 39026, name = lang:get("我爱我家"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39027) ->
    #honor_base{id = 39027, name = lang:get("精灵淘气鬼"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39028) ->
    #honor_base{id = 39028, name = lang:get("铃儿响叮当"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39029) ->
    #honor_base{id = 39029, name = lang:get("风驰电掣"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39030) ->
    #honor_base{id = 39030, name = lang:get("非你莫属"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39031) ->
    #honor_base{id = 39031, name = lang:get("情投意合"),
                show_type = 2, type = 1, mode_type = 2, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 0, collect_val = 0};
get(39032) ->
    #honor_base{id = 39032, name = lang:get("春光明媚"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39033) ->
    #honor_base{id = 39033, name = lang:get("桃运当头"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39034) ->
    #honor_base{id = 39034, name = lang:get("器宇不凡"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39044) ->
    #honor_base{id = 39044, name = lang:get("一夜暴富"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39049) ->
    #honor_base{id = 39049, name = lang:get("腰缠万贯.富可敌国"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39063) ->
    #honor_base{id = 39063, name = lang:get("无敌小霸王"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39064) ->
    #honor_base{id = 39064, name = lang:get("统领三界"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39065) ->
    #honor_base{id = 39065, name = lang:get("真.最强王者"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39066) ->
    #honor_base{id = 39066, name = lang:get("圣.最强王者"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39112) ->
    #honor_base{id = 39112, name = lang:get("天选之子"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39156) ->
    #honor_base{id = 39156, name = lang:get("炼气·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39157) ->
    #honor_base{id = 39157, name = lang:get("炼气·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39158) ->
    #honor_base{id = 39158, name = lang:get("炼气·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39159) ->
    #honor_base{id = 39159, name = lang:get("炼气·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39160) ->
    #honor_base{id = 39160, name = lang:get("筑基·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39161) ->
    #honor_base{id = 39161, name = lang:get("筑基·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39162) ->
    #honor_base{id = 39162, name = lang:get("筑基·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39163) ->
    #honor_base{id = 39163, name = lang:get("筑基·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39164) ->
    #honor_base{id = 39164, name = lang:get("金丹·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39165) ->
    #honor_base{id = 39165, name = lang:get("金丹·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39166) ->
    #honor_base{id = 39166, name = lang:get("金丹·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39167) ->
    #honor_base{id = 39167, name = lang:get("金丹·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39168) ->
    #honor_base{id = 39168, name = lang:get("元婴·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39169) ->
    #honor_base{id = 39169, name = lang:get("元婴·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39170) ->
    #honor_base{id = 39170, name = lang:get("元婴·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39171) ->
    #honor_base{id = 39171, name = lang:get("元婴·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39172) ->
    #honor_base{id = 39172, name = lang:get("化神·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39173) ->
    #honor_base{id = 39173, name = lang:get("化神·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39174) ->
    #honor_base{id = 39174, name = lang:get("化神·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39175) ->
    #honor_base{id = 39175, name = lang:get("化神·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39176) ->
    #honor_base{id = 39176, name = lang:get("婴变·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39177) ->
    #honor_base{id = 39177, name = lang:get("婴变·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39178) ->
    #honor_base{id = 39178, name = lang:get("婴变·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39179) ->
    #honor_base{id = 39179, name = lang:get("婴变·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39180) ->
    #honor_base{id = 39180, name = lang:get("问鼎·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39181) ->
    #honor_base{id = 39181, name = lang:get("问鼎·中期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39182) ->
    #honor_base{id = 39182, name = lang:get("问鼎·后期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39183) ->
    #honor_base{id = 39183, name = lang:get("问鼎·大圆满"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(39184) ->
    #honor_base{id = 39184, name = lang:get("圣人·初期"),
                show_type = 2, type = 1, mode_type = 1, classes = 0,
                sex = 2, is_cast = 1, is_can_pre = 1, collect_val = 0};
get(_Id) -> false.

-spec to_classes({Id :: pos_integer(),
                  Classes :: non_neg_integer()}) -> NewId ::
                                                        pos_integer().

to_classes({11062, 2}) -> 11063;
to_classes({11062, 3}) -> 11064;
to_classes({11062, 4}) -> 11065;
to_classes({11062, 5}) -> 11066;
to_classes({11062, 6}) -> 11079;
to_classes({11062, 7}) -> 11087;
to_classes({11063, 1}) -> 11062;
to_classes({11063, 3}) -> 11064;
to_classes({11063, 4}) -> 11065;
to_classes({11063, 5}) -> 11066;
to_classes({11063, 6}) -> 11079;
to_classes({11063, 7}) -> 11087;
to_classes({11064, 1}) -> 11062;
to_classes({11064, 2}) -> 11063;
to_classes({11064, 4}) -> 11065;
to_classes({11064, 5}) -> 11066;
to_classes({11064, 6}) -> 11079;
to_classes({11064, 7}) -> 11087;
to_classes({11065, 1}) -> 11062;
to_classes({11065, 2}) -> 11063;
to_classes({11065, 3}) -> 11064;
to_classes({11065, 5}) -> 11066;
to_classes({11065, 6}) -> 11079;
to_classes({11065, 7}) -> 11087;
to_classes({11066, 1}) -> 11062;
to_classes({11066, 2}) -> 11063;
to_classes({11066, 3}) -> 11064;
to_classes({11066, 4}) -> 11065;
to_classes({11066, 6}) -> 11079;
to_classes({11066, 7}) -> 11087;
to_classes({11079, 1}) -> 11062;
to_classes({11079, 2}) -> 11063;
to_classes({11079, 3}) -> 11064;
to_classes({11079, 4}) -> 11065;
to_classes({11079, 5}) -> 11066;
to_classes({11079, 7}) -> 11087;
to_classes({11087, 1}) -> 11062;
to_classes({11087, 2}) -> 11063;
to_classes({11087, 3}) -> 11064;
to_classes({11087, 4}) -> 11065;
to_classes({11087, 5}) -> 11066;
to_classes({11087, 6}) -> 11079;
to_classes({Id, _Classes}) -> Id.

-spec to_sex({Id :: pos_integer(),
              Sex :: non_neg_integer()}) -> NewId :: pos_integer().

to_sex({11017, 2}) -> 11018;
to_sex({11018, 0}) -> 11017;
to_sex({11028, 0}) -> 11029;
to_sex({11029, 1}) -> 11028;
to_sex({11030, 0}) -> 11031;
to_sex({11031, 1}) -> 11030;
to_sex({11032, 0}) -> 11033;
to_sex({11033, 1}) -> 11032;
to_sex({11034, 0}) -> 11035;
to_sex({11035, 1}) -> 11034;
to_sex({11036, 0}) -> 11037;
to_sex({11037, 1}) -> 11036;
to_sex({11041, 0}) -> 11042;
to_sex({11042, 1}) -> 11041;
to_sex({11067, 0}) -> 11068;
to_sex({11068, 1}) -> 11067;
to_sex({11069, 0}) -> 11070;
to_sex({11070, 1}) -> 11069;
to_sex({Id, _Sex}) -> Id.

-spec to_classes_sex({Id :: pos_integer(),
                      Classes :: non_neg_integer(),
                      Sex :: non_neg_integer()}) -> NewId :: pos_integer().

to_classes_sex({Id, Classes, Sex}) ->
    Id1 = to_classes({Id, Classes}),
    to_sex({Id1, Sex}).

get_pre(1) ->
    #pre_honor_base{pre_id = 1, pre_name = lang:get("单身"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(2) ->
    #pre_honor_base{pre_id = 2, pre_name = lang:get("逗比"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(3) ->
    #pre_honor_base{pre_id = 3, pre_name = lang:get("薄情"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(4) ->
    #pre_honor_base{pre_id = 4, pre_name = lang:get("低调"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(5) ->
    #pre_honor_base{pre_id = 5, pre_name = lang:get("风骚"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(6) ->
    #pre_honor_base{pre_id = 6, pre_name = lang:get("迅影"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(7) ->
    #pre_honor_base{pre_id = 7, pre_name = lang:get("英雄"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(8) ->
    #pre_honor_base{pre_id = 8, pre_name = lang:get("玲珑"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(9) ->
    #pre_honor_base{pre_id = 9, pre_name = lang:get("大腿"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(10) ->
    #pre_honor_base{pre_id = 10, pre_name = lang:get("千里马"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(11) ->
    #pre_honor_base{pre_id = 11, pre_name = lang:get("大龙王"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(13) ->
    #pre_honor_base{pre_id = 13, pre_name = lang:get("老板"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(14) ->
    #pre_honor_base{pre_id = 14, pre_name = lang:get("棒槌"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(15) ->
    #pre_honor_base{pre_id = 15, pre_name = lang:get("喵星人"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(16) ->
    #pre_honor_base{pre_id = 16, pre_name = lang:get("赞"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(17) ->
    #pre_honor_base{pre_id = 17, pre_name = lang:get("废柴"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(18) ->
    #pre_honor_base{pre_id = 18, pre_name = lang:get("老司机"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(19) ->
    #pre_honor_base{pre_id = 19, pre_name = lang:get("污"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(20) ->
    #pre_honor_base{pre_id = 20, pre_name = lang:get("进击"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(21) ->
    #pre_honor_base{pre_id = 21, pre_name = lang:get("正义"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(22) ->
    #pre_honor_base{pre_id = 22, pre_name = lang:get("腹黑"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(23) ->
    #pre_honor_base{pre_id = 23, pre_name = lang:get("暴躁"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(24) ->
    #pre_honor_base{pre_id = 24, pre_name = lang:get("专一"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(25) ->
    #pre_honor_base{pre_id = 25, pre_name = lang:get("善良"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(26) ->
    #pre_honor_base{pre_id = 26, pre_name = lang:get("无私"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(27) ->
    #pre_honor_base{pre_id = 27, pre_name = lang:get("机灵"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(28) ->
    #pre_honor_base{pre_id = 28, pre_name = lang:get("不羁"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(29) ->
    #pre_honor_base{pre_id = 29, pre_name = lang:get("小弟"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(30) ->
    #pre_honor_base{pre_id = 30, pre_name = lang:get("菜鸟"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(31) ->
    #pre_honor_base{pre_id = 31, pre_name = lang:get("弱鸡"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(32) ->
    #pre_honor_base{pre_id = 32, pre_name = lang:get("冰霜"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(33) ->
    #pre_honor_base{pre_id = 33, pre_name = lang:get("火焰"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(34) ->
    #pre_honor_base{pre_id = 34, pre_name = lang:get("大地"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(35) ->
    #pre_honor_base{pre_id = 35, pre_name = lang:get("疾风"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(36) ->
    #pre_honor_base{pre_id = 36, pre_name = lang:get("幸运"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(37) ->
    #pre_honor_base{pre_id = 37, pre_name = lang:get("信仰"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(38) ->
    #pre_honor_base{pre_id = 38, pre_name = lang:get("奇葩"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(39) ->
    #pre_honor_base{pre_id = 39, pre_name = lang:get("咸鱼"),
                    is_cast = 1, items = [{22786, 1, 1}],
                    loss_items = [{22786, 3}]};
get_pre(40) ->
    #pre_honor_base{pre_id = 40, pre_name = lang:get("呆"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(41) ->
    #pre_honor_base{pre_id = 41, pre_name = lang:get("傻"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(42) ->
    #pre_honor_base{pre_id = 42, pre_name = lang:get("萌"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(43) ->
    #pre_honor_base{pre_id = 43, pre_name = lang:get("非酋"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(44) ->
    #pre_honor_base{pre_id = 44, pre_name = lang:get("欧皇"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(45) ->
    #pre_honor_base{pre_id = 45, pre_name = lang:get("温暖"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(46) ->
    #pre_honor_base{pre_id = 46, pre_name = lang:get("半神"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(47) ->
    #pre_honor_base{pre_id = 47, pre_name = lang:get("逍遥"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(48) ->
    #pre_honor_base{pre_id = 48, pre_name = lang:get("在下"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(49) ->
    #pre_honor_base{pre_id = 49, pre_name = lang:get("么么哒"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(50) ->
    #pre_honor_base{pre_id = 50, pre_name = lang:get("五小旺"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(51) ->
    #pre_honor_base{pre_id = 51, pre_name = lang:get("好吃的"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(52) ->
    #pre_honor_base{pre_id = 52, pre_name = lang:get("好玩的"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(53) ->
    #pre_honor_base{pre_id = 53, pre_name = lang:get("亲爱的"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(54) ->
    #pre_honor_base{pre_id = 54, pre_name = lang:get("佛系的"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(55) ->
    #pre_honor_base{pre_id = 55, pre_name = lang:get("不败"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(56) ->
    #pre_honor_base{pre_id = 56, pre_name = lang:get("热血"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(57) ->
    #pre_honor_base{pre_id = 57, pre_name = lang:get("搞怪"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(58) ->
    #pre_honor_base{pre_id = 58, pre_name = lang:get("可爱"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(59) ->
    #pre_honor_base{pre_id = 59, pre_name = lang:get("开朗的"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(60) ->
    #pre_honor_base{pre_id = 60, pre_name = lang:get("无敌"),
                    is_cast = 1, items = [{22786, 1, 1}]};
get_pre(_Id) -> false.

get_pre_reward(RewardID, Sex)
    when RewardID =:= 1 andalso
             (Sex =:= 2 orelse 2 =:= 2) ->
    {1,
     15,
     lang:get("前缀收集礼"),
     [{22808, 1, 1, 1}, {22786, 1, 1, 0}]};
get_pre_reward(_, _) -> false.

list_by_type() ->
    [{101, 1, 0},
     {102, 1, 0},
     {103, 1, 0},
     {104, 1, 0},
     {11002, 2, 0},
     {11003, 1, 0},
     {11004, 1, 0},
     {11005, 1, 0},
     {11006, 1, 0},
     {11007, 1, 0},
     {11008, 1, 0},
     {11009, 1, 0},
     {11010, 3, 0},
     {11011, 3, 0},
     {11012, 3, 0},
     {11013, 3, 0},
     {11014, 3, 0},
     {11015, 3, 0},
     {11016, 3, 0},
     {11017, 3, 0},
     {11018, 1, 0},
     {11019, 1, 0},
     {11020, 1, 0},
     {11021, 1, 0},
     {11022, 1, 0},
     {11023, 1, 0},
     {11024, 1, 0},
     {11025, 1, 0},
     {11026, 1, 0},
     {11027, 2, 0},
     {11028, 1, 0},
     {11029, 1, 0},
     {11030, 1, 0},
     {11031, 1, 0},
     {11032, 1, 0},
     {11033, 1, 0},
     {11034, 1, 0},
     {11035, 1, 0},
     {11036, 1, 0},
     {11037, 1, 0},
     {11038, 2, 0},
     {11039, 2, 0},
     {11040, 2, 0},
     {11041, 2, 0},
     {11042, 2, 0},
     {11043, 2, 0},
     {11044, 2, 0},
     {11045, 2, 0},
     {11046, 1, 0},
     {11047, 1, 0},
     {11048, 1, 0},
     {11049, 2, 0},
     {11050, 2, 0},
     {11051, 2, 0},
     {11052, 2, 0},
     {11053, 2, 0},
     {11054, 2, 0},
     {11055, 1, 0},
     {11056, 1, 0},
     {11057, 2, 0},
     {11058, 6, 0},
     {11059, 6, 0},
     {11060, 6, 0},
     {11061, 6, 0},
     {11062, 2, 0},
     {11063, 2, 0},
     {11064, 2, 0},
     {11065, 2, 0},
     {11066, 2, 0},
     {11079, 2, 0},
     {11067, 2, 0},
     {11068, 2, 0},
     {11069, 2, 0},
     {11070, 2, 0},
     {11071, 2, 0},
     {11073, 1, 0},
     {11074, 1, 0},
     {11075, 1, 0},
     {11076, 1, 0},
     {11077, 1, 0},
     {11078, 1, 0},
     {11086, 2, 0},
     {11087, 2, 0},
     {11080, 7, 0},
     {11081, 7, 0},
     {11082, 7, 0},
     {11083, 7, 0},
     {11084, 7, 0},
     {11085, 10, 0},
     {11090, 1, 0},
     {11091, 1, 0},
     {11092, 1, 0},
     {11093, 1, 0},
     {11094, 1, 0},
     {11095, 1, 0},
     {11096, 1, 0},
     {11097, 1, 0},
     {11098, 1, 0},
     {11099, 1, 0},
     {11100, 1, 0},
     {11101, 1, 0},
     {11102, 1, 0},
     {11103, 1, 0},
     {11104, 1, 0},
     {11105, 1, 0},
     {11106, 1, 0},
     {11107, 1, 0},
     {11108, 1, 0},
     {11109, 1, 0},
     {11110, 1, 0},
     {11111, 1, 0},
     {11112, 1, 0},
     {11113, 1, 0},
     {11114, 1, 0},
     {11115, 1, 0},
     {11116, 1, 0},
     {11117, 1, 0},
     {11118, 1, 0},
     {11119, 1, 0},
     {11120, 1, 0},
     {11121, 1, 0},
     {11122, 1, 0},
     {11123, 1, 0},
     {11124, 1, 0},
     {11125, 1, 0},
     {11126, 1, 0},
     {11127, 1, 0},
     {11128, 1, 0},
     {11129, 1, 0},
     {11130, 1, 0},
     {11131, 1, 0},
     {11200, 6, 0},
     {11201, 6, 0},
     {11202, 6, 0},
     {11203, 6, 0},
     {11204, 6, 0},
     {11205, 6, 0},
     {11206, 6, 0},
     {11207, 6, 0},
     {11208, 6, 0},
     {11209, 6, 0},
     {11210, 6, 0},
     {11211, 6, 0},
     {11212, 6, 0},
     {11213, 6, 0},
     {11214, 6, 0},
     {11215, 6, 0},
     {11216, 6, 0},
     {11217, 6, 0},
     {11218, 6, 0},
     {11219, 6, 0},
     {11220, 6, 0},
     {11221, 6, 0},
     {11222, 6, 0},
     {11223, 6, 0},
     {11224, 6, 0},
     {11225, 6, 0},
     {11300, 1, 0},
     {11301, 1, 0},
     {11302, 1, 0},
     {11303, 1, 0},
     {11304, 1, 0},
     {11305, 1, 0},
     {11401, 1, 0},
     {11402, 1, 0},
     {11403, 1, 0},
     {11404, 1, 0},
     {11405, 1, 0},
     {11406, 1, 0},
     {11407, 1, 0},
     {11408, 1, 0},
     {11409, 1, 0},
     {11410, 1, 0},
     {11411, 1, 0},
     {11412, 1, 0},
     {11413, 1, 0},
     {11414, 1, 0},
     {11415, 1, 0},
     {11416, 1, 0},
     {11417, 1, 0},
     {11418, 1, 0},
     {11419, 1, 0},
     {11420, 1, 0},
     {11501, 1, 0},
     {11502, 1, 0},
     {11503, 1, 0},
     {11504, 1, 0},
     {11505, 1, 0},
     {11506, 1, 0},
     {11507, 1, 0},
     {11508, 1, 0},
     {11509, 1, 0},
     {11510, 1, 0},
     {11511, 1, 0},
     {11512, 1, 0},
     {11513, 1, 0},
     {11514, 1, 0},
     {11515, 1, 0},
     {11516, 1, 0},
     {11517, 1, 0},
     {11518, 1, 0},
     {20000, 1, 0},
     {20001, 1, 0},
     {20002, 1, 0},
     {20003, 1, 0},
     {20004, 1, 0},
     {20005, 1, 0},
     {21000, 1, 0},
     {21001, 1, 0},
     {21002, 1, 0},
     {21003, 1, 0},
     {21004, 1, 0},
     {22000, 1, 0},
     {22001, 1, 0},
     {22002, 1, 0},
     {22003, 1, 0},
     {22004, 1, 0},
     {22005, 1, 0},
     {22006, 1, 0},
     {22007, 1, 0},
     {22008, 1, 0},
     {22009, 1, 0},
     {22010, 1, 0},
     {22011, 1, 0},
     {22012, 1, 0},
     {22013, 1, 0},
     {22014, 1, 0},
     {22015, 1, 0},
     {22016, 1, 0},
     {22017, 1, 0},
     {22018, 1, 0},
     {22019, 1, 0},
     {23000, 1, 0},
     {23001, 1, 0},
     {23002, 1, 0},
     {23003, 1, 0},
     {23004, 1, 0},
     {23005, 1, 0},
     {23006, 1, 0},
     {23007, 1, 0},
     {23008, 1, 0},
     {23009, 1, 0},
     {23010, 1, 0},
     {23011, 1, 0},
     {23012, 1, 0},
     {23013, 1, 0},
     {23014, 1, 0},
     {23015, 1, 0},
     {23016, 1, 0},
     {23017, 1, 0},
     {23018, 1, 0},
     {23020, 1, 0},
     {23021, 1, 0},
     {23022, 1, 0},
     {23023, 1, 0},
     {23024, 1, 0},
     {23025, 1, 0},
     {23026, 1, 0},
     {23027, 1, 0},
     {23028, 1, 0},
     {23029, 1, 0},
     {23030, 1, 0},
     {23031, 1, 0},
     {23032, 1, 0},
     {23033, 1, 0},
     {23034, 1, 0},
     {23035, 1, 0},
     {23036, 1, 0},
     {23037, 1, 0},
     {20105, 1, 0},
     {23038, 1, 0},
     {23039, 1, 0},
     {23040, 1, 0},
     {23041, 1, 0},
     {23042, 1, 0},
     {23043, 1, 0},
     {23044, 1, 0},
     {23045, 1, 0},
     {23046, 1, 0},
     {23047, 1, 0},
     {23048, 1, 0},
     {23049, 1, 0},
     {23050, 1, 0},
     {23051, 1, 0},
     {23052, 1, 0},
     {23053, 1, 0},
     {23054, 1, 0},
     {23055, 1, 0},
     {23056, 1, 0},
     {23057, 1, 0},
     {23058, 1, 0},
     {23059, 1, 0},
     {23060, 1, 0},
     {23061, 1, 0},
     {23062, 1, 0},
     {23063, 1, 0},
     {23064, 1, 0},
     {23065, 1, 0},
     {23066, 1, 0},
     {23067, 1, 0},
     {23068, 1, 0},
     {23069, 1, 0},
     {30001, 4, 0},
     {30002, 4, 0},
     {30003, 4, 0},
     {30004, 4, 0},
     {30005, 4, 0},
     {30006, 4, 0},
     {30007, 4, 0},
     {30008, 4, 0},
     {30009, 4, 0},
     {30010, 4, 0},
     {30011, 4, 0},
     {30012, 4, 0},
     {30013, 4, 0},
     {30014, 4, 0},
     {30015, 4, 0},
     {30016, 5, 0},
     {30017, 5, 0},
     {30030, 4, 0},
     {30031, 4, 0},
     {30032, 4, 0},
     {30033, 4, 0},
     {30034, 4, 0},
     {30035, 4, 0},
     {30036, 4, 0},
     {30037, 4, 0},
     {30038, 4, 0},
     {30100, 8, 0},
     {30101, 8, 0},
     {30102, 8, 0},
     {30103, 1, 0},
     {30104, 1, 0},
     {30105, 1, 0},
     {30106, 1, 0},
     {30107, 1, 0},
     {30108, 1, 0},
     {30109, 1, 0},
     {30110, 1, 0},
     {30111, 1, 0},
     {30112, 1, 0},
     {30113, 1, 0},
     {30114, 1, 0},
     {30115, 1, 0},
     {30116, 1, 0},
     {30117, 1, 0},
     {30118, 9, 0},
     {30119, 9, 0},
     {30120, 1, 0},
     {30121, 1, 0},
     {30122, 1, 0},
     {30140, 1, 0},
     {30141, 1, 0},
     {30142, 1, 0},
     {30200, 1, 0},
     {30201, 1, 0},
     {30202, 1, 0},
     {30203, 1, 0},
     {30204, 1, 0},
     {30205, 1, 0},
     {30206, 1, 0},
     {30207, 1, 0},
     {30208, 1, 0},
     {30209, 1, 0},
     {30210, 1, 0},
     {30211, 1, 0},
     {30310, 13, 0},
     {30320, 13, 3},
     {30321, 13, 3},
     {30322, 13, 3},
     {30330, 13, 3},
     {30331, 13, 3},
     {30340, 13, 3},
     {30341, 13, 3},
     {30342, 13, 3},
     {30350, 13, 3},
     {30351, 13, 3},
     {30352, 13, 3},
     {30360, 13, 3},
     {30361, 13, 3},
     {30362, 13, 3},
     {30363, 13, 3},
     {31001, 1, 0},
     {31002, 1, 0},
     {31003, 1, 0},
     {31004, 1, 0},
     {31005, 1, 0},
     {31006, 1, 0},
     {31007, 1, 0},
     {31008, 1, 0},
     {31009, 1, 0},
     {31010, 1, 0},
     {31011, 1, 0},
     {31012, 1, 0},
     {31013, 1, 0},
     {31014, 1, 0},
     {31015, 1, 0},
     {31016, 1, 0},
     {31017, 1, 0},
     {31018, 1, 0},
     {31019, 1, 0},
     {31020, 1, 0},
     {31021, 1, 0},
     {31022, 1, 0},
     {31023, 1, 0},
     {31024, 1, 0},
     {31025, 1, 0},
     {31026, 1, 0},
     {31103, 1, 0},
     {31105, 1, 0},
     {31106, 1, 0},
     {31107, 1, 0},
     {31200, 1, 0},
     {31201, 1, 0},
     {31202, 12, 0},
     {31203, 12, 0},
     {31204, 12, 0},
     {31205, 12, 0},
     {31206, 12, 0},
     {32000, 11, 0},
     {32001, 11, 0},
     {32002, 11, 0},
     {32003, 11, 0},
     {32004, 11, 0},
     {32005, 11, 0},
     {32006, 11, 0},
     {32007, 11, 0},
     {32008, 11, 0},
     {32009, 11, 0},
     {32010, 11, 0},
     {32011, 11, 0},
     {32020, 11, 0},
     {32021, 11, 0},
     {32022, 11, 0},
     {32023, 11, 0},
     {32024, 11, 0},
     {32025, 11, 0},
     {32026, 11, 0},
     {32027, 11, 0},
     {32028, 11, 0},
     {32029, 11, 0},
     {32030, 11, 0},
     {32031, 11, 0},
     {32040, 11, 0},
     {32041, 11, 0},
     {32042, 11, 0},
     {32043, 11, 0},
     {32044, 11, 0},
     {32045, 11, 0},
     {32046, 11, 0},
     {32047, 11, 0},
     {32048, 11, 0},
     {32049, 11, 0},
     {32050, 11, 0},
     {32051, 11, 0},
     {32060, 11, 0},
     {32061, 11, 0},
     {32062, 11, 0},
     {32063, 11, 0},
     {32064, 11, 0},
     {32065, 11, 0},
     {32066, 11, 0},
     {32067, 11, 0},
     {32068, 11, 0},
     {32069, 11, 0},
     {32070, 11, 0},
     {32071, 11, 0},
     {32080, 11, 0},
     {32081, 11, 0},
     {32082, 11, 0},
     {32083, 11, 0},
     {32084, 11, 0},
     {32085, 11, 0},
     {32086, 11, 0},
     {32087, 11, 0},
     {32088, 11, 0},
     {32089, 11, 0},
     {32090, 11, 0},
     {32091, 11, 0},
     {32100, 11, 0},
     {32101, 11, 0},
     {32102, 11, 0},
     {32103, 11, 0},
     {32104, 11, 0},
     {32105, 11, 0},
     {32106, 11, 0},
     {32107, 11, 0},
     {32108, 11, 0},
     {32109, 11, 0},
     {32110, 11, 0},
     {32111, 11, 0},
     {32120, 11, 0},
     {32121, 11, 0},
     {32122, 11, 0},
     {32123, 11, 0},
     {32124, 11, 0},
     {32125, 11, 0},
     {32126, 11, 0},
     {32127, 11, 0},
     {32128, 11, 0},
     {32129, 11, 0},
     {32130, 11, 0},
     {32131, 11, 0},
     {39000, 1, 0},
     {39001, 1, 0},
     {39002, 1, 0},
     {39003, 1, 0},
     {39004, 1, 0},
     {40000, 1, 0},
     {39005, 1, 0},
     {39006, 1, 0},
     {39007, 1, 0},
     {39008, 1, 0},
     {39009, 1, 0},
     {39010, 1, 0},
     {39011, 1, 0},
     {39012, 1, 0},
     {39013, 1, 0},
     {39014, 1, 0},
     {39015, 1, 0},
     {39016, 1, 0},
     {39017, 1, 0},
     {39018, 1, 0},
     {39019, 1, 0},
     {39020, 1, 0},
     {39021, 1, 0},
     {39022, 1, 0},
     {39023, 1, 0},
     {39024, 1, 0},
     {39025, 1, 0},
     {39026, 1, 0},
     {39027, 1, 0},
     {39028, 1, 0},
     {39029, 1, 0},
     {39030, 1, 0},
     {39031, 1, 0},
     {39032, 1, 0},
     {39033, 1, 0},
     {39034, 1, 0}].

