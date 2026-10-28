-file("src/data/agenda_data.erl", 1).

-module(agenda_data).

-export([list/0,
         get/1,
         get_activity/1,
         get_energy_max/1,
         get_max_reserve_exp/1,
         get_reserve_type/1,
         get_ext_double/1,
         get_lev_gift/1,
         list_lev_gift/0,
         list_activity/0,
         get_satiety/1,
         get_agenda_mail/1]).

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

-file("src/data/agenda_data.erl", 25).

list() ->
    [1000,
     1001,
     1002,
     1004,
     1006,
     1007,
     1008,
     1009,
     1010,
     1013,
     1014,
     1017,
     1018,
     1020,
     1021,
     1022,
     1023,
     1024,
     1025,
     1026,
     1027,
     1028,
     1029,
     1030,
     1031,
     2002,
     2003,
     2004,
     2005,
     2006,
     2007,
     2008,
     2009,
     2010,
     2011,
     2012,
     2013,
     2014,
     2015,
     2016,
     2017,
     2018,
     2019,
     2020,
     2021,
     2022,
     2023,
     2024,
     2025,
     2026,
     2027,
     2028,
     2029,
     2030,
     2031,
     2032,
     2033,
     2034,
     2035,
     2036,
     2038,
     2039,
     2040,
     2041,
     2042,
     2043,
     2044,
     2045,
     2046,
     2047,
     2048,
     2049,
     2050,
     2051,
     2052,
     2053,
     2054,
     2055,
     2056,
     2057,
     2058,
     2059,
     2060,
     2061,
     2062,
     2063,
     2064,
     2065,
     2066,
     2067,
     2068,
     2069,
     2070,
     2071,
     2072,
     2073,
     2074,
     2075,
     2076,
     2077,
     2078,
     2079,
     2080,
     2081,
     2082,
     2083,
     2084,
     2085,
     2086,
     2087,
     2088,
     2089,
     2090,
     2091,
     2092,
     2093,
     2094,
     2095,
     2096,
     2097,
     2098,
     2099,
     2100,
     2101,
     2102,
     2103,
     2104,
     2105,
     2106,
     2107,
     2108,
     2109,
     2110,
     2111,
     2112,
     99].

get(1001) ->
    #{id => 1001, icon => 1001, type => 1,
      name => lang:get("职业任务<color='#b031d5'>[荐]</color>"),
      rank => 20, max_try => 10, open_leve => 15,
      max_leve => 0, starttime => 0, endtime => 0,
      panelargs => [], activity => 2, max_activity => 20,
      energy => 0, max_energy => 0, achieve_energy => 0,
      reset_time => 1, args => [], recommend => 1,
      statistic => 1};
get(1002) ->
    #{id => 1002, icon => 1002, type => 1,
      name => lang:get("竞技场"), rank => 40, max_try => 5,
      open_leve => 28, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 4,
      max_activity => 20, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 1, statistic => 1};
get(1009) ->
    #{id => 1009, icon => 1009, type => 1,
      name => lang:get("远航商人"), rank => 65, max_try => 1,
      open_leve => 32, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 10,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 1, statistic => 1};
get(1000) ->
    #{id => 1000, icon => 1000, type => 1,
      name => lang:get("悬赏任务<color='#b031d5'>[荐]</color>"),
      rank => 30, max_try => 30, open_leve => 20,
      max_leve => 0, starttime => 0, endtime => 0,
      panelargs => [], activity => 1, max_activity => 20,
      energy => 0, max_energy => 0, achieve_energy => 0,
      reset_time => 1, args => [], recommend => 1,
      statistic => 1};
get(1006) ->
    #{id => 1006, icon => 1006, type => 1,
      name => lang:get("极寒试炼"), rank => 60, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 3,
      max_activity => 15, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 1, statistic => 1};
get(1004) ->
    #{id => 1004, icon => 1004, type => 1,
      name => lang:get("天空之塔"), rank => 90, max_try => 8,
      open_leve => 40, max_leve => 64, starttime => 0,
      endtime => 0, panelargs => [], activity => 2,
      max_activity => 16, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1007) ->
    #{id => 1007, icon => 1007, type => 1,
      name => lang:get("挑战BOSS"), rank => 110, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1024) ->
    #{id => 1024, icon => 1024, type => 1,
      name => lang:get("爵位闯关"), rank => 50, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1026) ->
    #{id => 1026, icon => 1026, type => 1,
      name => lang:get("挑战副本"), rank => 2, max_try => 3,
      open_leve => 35, max_leve => 49, starttime => 0,
      endtime => 0, panelargs => [], activity => 5,
      max_activity => 20, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1027) ->
    #{id => 1027, icon => 1027, type => 1,
      name => lang:get("宝藏迷城"), rank => 3, max_try => 10,
      open_leve => 35, max_leve => 200, starttime => 0,
      endtime => 0, panelargs => [], activity => 1,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1028) ->
    #{id => 1028, icon => 1026, type => 1,
      name => lang:get("挑战副本"), rank => 2, max_try => 5,
      open_leve => 50, max_leve => 200, starttime => 0,
      endtime => 0, panelargs => [], activity => 5,
      max_activity => 20, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1008) ->
    #{id => 1008, icon => 1008, type => 1,
      name => lang:get("吃货巡游"), rank => 600, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 45000,
      endtime => 46800, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1010) ->
    #{id => 1010, icon => 1010, type => 1,
      name => lang:get("历练环任务"), rank => 250, max_try => 200,
      open_leve => 50, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 3, args => [],
      recommend => 0, statistic => 1};
get(2002) ->
    #{id => 2002, icon => 2002, type => 1,
      name => lang:get("时空段位赛"), rank => 1300, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 77400,
      endtime => 81000, panelargs => [], activity => 1,
      max_activity => 8, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4, 6],
      recommend => 0, statistic => 1};
get(1013) ->
    #{id => 1013, icon => 1013, type => 1,
      name => lang:get("公会任务"), rank => 80, max_try => 6,
      open_leve => 30, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 1,
      max_activity => 6, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1014) ->
    #{id => 1014, icon => 1014, type => 1,
      name => lang:get("上古妖魔"), rank => 170, max_try => 10,
      open_leve => 25, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 2,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1017) ->
    #{id => 1017, icon => 1017, type => 1,
      name => lang:get("魔法炼化"), rank => 100, max_try => 0,
      open_leve => 35, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1018) ->
    #{id => 1018, icon => 1018, type => 1,
      name => lang:get("情缘任务"), rank => 260, max_try => 10,
      open_leve => 40, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1020) ->
    #{id => 1020, icon => 1020, type => 1,
      name => lang:get("师徒任务"), rank => 270, max_try => 5,
      open_leve => 40, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1021) ->
    #{id => 1021, icon => 1021, type => 1,
      name => lang:get("夺宝奇兵"), rank => 90, max_try => 9,
      open_leve => 80, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 1,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4, 6],
      recommend => 0, statistic => 1};
get(1022) ->
    #{id => 1022, icon => 1004, type => 1,
      name => lang:get("天空之塔"), rank => 90, max_try => 8,
      open_leve => 65, max_leve => 79, starttime => 0,
      endtime => 0, panelargs => [], activity => 2,
      max_activity => 16, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4, 6],
      recommend => 0, statistic => 1};
get(1023) ->
    #{id => 1023, icon => 1023, type => 1,
      name => lang:get("游侠历练"), rank => 280, max_try => 1,
      open_leve => 66, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(1025) ->
    #{id => 1025, icon => 2044, type => 1,
      name => lang:get("诸神之战"), rank => 1, max_try => 0,
      open_leve => 70, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [1], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(1029) ->
    #{id => 1029, icon => 1029, type => 1,
      name => lang:get("英雄擂台"), rank => 4, max_try => 4,
      open_leve => 65, max_leve => 0, starttime => 61200,
      endtime => 63000, panelargs => [], activity => 2,
      max_activity => 8, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4, 6],
      recommend => 0, statistic => 1};
get(1030) ->
    #{id => 1030, icon => 3003, type => 1,
      name => lang:get("英雄副本"), rank => 70, max_try => 2,
      open_leve => 65, max_leve => 0, starttime => 39600,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6], recommend => 0,
      statistic => 1};
get(1031) ->
    #{id => 1031, icon => 3003, type => 1,
      name => lang:get("公会拍卖"), rank => 71, max_try => 0,
      open_leve => 65, max_leve => 0, starttime => 72000,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2003) ->
    #{id => 2003, icon => 2003, type => 1,
      name => lang:get("公会泉"), rank => 1200, max_try => 0,
      open_leve => 20, max_leve => 0, starttime => 72000,
      endtime => 73200, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 0};
get(2004) ->
    #{id => 2004, icon => 2004, type => 1,
      name => lang:get("公会强盗"), rank => 500, max_try => 0,
      open_leve => 20, max_leve => 0, starttime => 43200,
      endtime => 45000, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(2005) ->
    #{id => 2005, icon => 2005, type => 1,
      name => lang:get("职业挑战"), rank => 1311, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 77400,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [3],
      recommend => 0, statistic => 1};
get(2006) ->
    #{id => 2006, icon => 2006, type => 1,
      name => lang:get("彩虹冒险"), rank => 1307, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 72000,
      endtime => 75600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [7],
      recommend => 0, statistic => 1};
get(2007) ->
    #{id => 2007, icon => 2007, type => 1,
      name => lang:get("智慧闯关"), rank => 1305, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 61200,
      endtime => 86400, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4],
      recommend => 0, statistic => 1};
get(2008) ->
    #{id => 2008, icon => 2007, type => 1,
      name => lang:get("闯关半决赛"), rank => 1303, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 54000,
      endtime => 72000, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [6],
      recommend => 0, statistic => 1};
get(2009) ->
    #{id => 2009, icon => 2009, type => 1,
      name => lang:get("智慧对决"), rank => 1304, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 57600,
      endtime => 58175, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [7],
      recommend => 0, statistic => 1};
get(2010) ->
    #{id => 2010, icon => 2010, type => 1,
      name => lang:get("勇士战场"), rank => 1308, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 72000,
      endtime => 75600, panelargs => [], activity => 2,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1],
      recommend => 0, statistic => 1};
get(2011) ->
    #{id => 2011, icon => 2011, type => 1,
      name => lang:get("捉迷藏"), rank => 310, max_try => 6,
      open_leve => 30, max_leve => 0, starttime => 34800,
      endtime => 85200, panelargs => [], activity => 1,
      max_activity => 3, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2012) ->
    #{id => 2012, icon => 2012, type => 1,
      name => lang:get("挑战猴王"), rank => 300, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 2,
      max_activity => 4, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2013) ->
    #{id => 2013, icon => 2013, type => 1,
      name => lang:get("十二星座"), rank => 301, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 86280, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2014) ->
    #{id => 2014, icon => 2014, type => 1,
      name => lang:get("巅峰对决"), rank => 1312, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 77400,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [7],
      recommend => 0, statistic => 1};
get(2015) ->
    #{id => 2015, icon => 2015, type => 1,
      name => lang:get("公会战"), rank => 1306, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 72000,
      endtime => 75600, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4],
      recommend => 0, statistic => 1};
get(2017) ->
    #{id => 2017, icon => 2017, type => 1,
      name => lang:get("糖果蛋糕"), rank => 100, max_try => 1,
      open_leve => 40, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2016) ->
    #{id => 2016, icon => 2016, type => 1,
      name => lang:get("踏青赏诗"), rank => 302, max_try => 6,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2018) ->
    #{id => 2018, icon => 2018, type => 1,
      name => lang:get("草木妖王"), rank => 303, max_try => 3,
      open_leve => 50, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2019) ->
    #{id => 2019, icon => 2019, type => 1,
      name => lang:get("荣耀战场"), rank => 1309, max_try => 1,
      open_leve => 40, max_leve => 69, starttime => 72000,
      endtime => 76500, panelargs => [], activity => 10,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [3],
      recommend => 0, statistic => 1};
get(2020) ->
    #{id => 2020, icon => 2020, type => 1,
      name => lang:get("公会英雄战"), rank => 1313, max_try => 1,
      open_leve => 40, max_leve => 0, starttime => 77400,
      endtime => 81900, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [5],
      recommend => 0, statistic => 1};
get(2021) ->
    #{id => 2021, icon => 2021, type => 1,
      name => lang:get("点石成金"), rank => 304, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2022) ->
    #{id => 2022, icon => 2018, type => 1,
      name => lang:get("四季挑战"), rank => 200, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2023) ->
    #{id => 2023, icon => 2019, type => 1,
      name => lang:get("荣耀战场"), rank => 1302, max_try => 1,
      open_leve => 40, max_leve => 0, starttime => 52200,
      endtime => 56700, panelargs => [], activity => 10,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [6],
      recommend => 0, statistic => 1};
get(2024) ->
    #{id => 2024, icon => 2024, type => 1,
      name => lang:get("清河妖王"), rank => 305, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2025) ->
    #{id => 2025, icon => 2025, type => 1,
      name => lang:get("极速滑雪"), rank => 306, max_try => 1,
      open_leve => 40, max_leve => 0, starttime => 32400,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2026) ->
    #{id => 2026, icon => 2018, type => 1,
      name => lang:get("河妖"), rank => 307, max_try => 5,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2027) ->
    #{id => 2027, icon => 2027, type => 1,
      name => lang:get("精灵幻境"), rank => 1310, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 72000,
      endtime => 75600, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [5],
      recommend => 0, statistic => 1};
get(2028) ->
    #{id => 2028, icon => 2028, type => 1,
      name => lang:get("武道大会"), rank => 1301, max_try => 3,
      open_leve => 70, max_leve => 0, starttime => 45000,
      endtime => 48600, panelargs => [], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2029) ->
    #{id => 2029, icon => 2029, type => 1,
      name => lang:get("清凉一夏"), rank => 101, max_try => 2,
      open_leve => 30, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [716], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2030) ->
    #{id => 2030, icon => 2030, type => 1,
      name => lang:get("水果种植"), rank => 102, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [3], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2031) ->
    #{id => 2031, icon => 2031, type => 1,
      name => lang:get("捉迷藏"), rank => 308, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 86399, panelargs => [1874], activity => 1,
      max_activity => 3, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2032) ->
    #{id => 2032, icon => 2032, type => 1,
      name => lang:get("一元夺宝"), rank => 1300, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 68400, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [6, 7],
      recommend => 0, statistic => 1};
get(2033) ->
    #{id => 2033, icon => 2033, type => 1,
      name => lang:get("元宵灯会"), rank => 400, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 64800, panelargs => [919], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [],
      recommend => 0, statistic => 0};
get(2034) ->
    #{id => 2034, icon => 2034, type => 1,
      name => lang:get("中秋赏月夜"), rank => 1100, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 68400,
      endtime => 69600, panelargs => [], activity => 2,
      max_activity => 2, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [],
      recommend => 0, statistic => 0};
get(2035) ->
    #{id => 2035, icon => 2035, type => 1,
      name => lang:get("五彩遍山河"), rank => 201, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 84600, panelargs => [2], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [2, 4, 5, 7], recommend => 0, statistic => 0};
get(2036) ->
    #{id => 2036, icon => 2048, type => 1,
      name => lang:get("公会攻城战"), rank => 1314, max_try => 1,
      open_leve => 65, max_leve => 0, starttime => 57600,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [1, 5],
      recommend => 0, statistic => 1};
get(2038) ->
    #{id => 2038, icon => 2038, type => 1,
      name => lang:get("超级智多星"), rank => 401, max_try => 6,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 68400, panelargs => [3], activity => 1,
      max_activity => 6, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2039) ->
    #{id => 2039, icon => 2039, type => 1,
      name => lang:get("蛋糕欢乐送"), rank => 202, max_try => 2,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 84600, panelargs => [1], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 3, 5, 6], recommend => 0, statistic => 0};
get(2040) ->
    #{id => 2040, icon => 2040, type => 1,
      name => lang:get("庆典贺华诞"), rank => 203, max_try => 4,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 86399, panelargs => [4], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2041) ->
    #{id => 2041, icon => 2041, type => 1,
      name => lang:get("驱除邪灵"), rank => 204, max_try => 5,
      open_leve => 40, max_leve => 0, starttime => 32400,
      endtime => 82800, panelargs => [777], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2042) ->
    #{id => 2042, icon => 2042, type => 1,
      name => lang:get("淘气南瓜"), rank => 901, max_try => 2,
      open_leve => 30, max_leve => 0, starttime => 57600,
      endtime => 64800, panelargs => [1], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2043) ->
    #{id => 2043, icon => 2043, type => 1,
      name => lang:get("邪灵之主"), rank => 205, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 32400,
      endtime => 86340, panelargs => [777], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2044) ->
    #{id => 2044, icon => 2044, type => 1,
      name => lang:get("诸神之战"), rank => 989, max_try => 0,
      open_leve => 70, max_leve => 0, starttime => 99998,
      endtime => 99999, panelargs => [1], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 0};
get(2045) ->
    #{id => 2045, icon => 2045, type => 1,
      name => lang:get("元宵灯会"), rank => 402, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 64800, panelargs => [1], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2046) ->
    #{id => 2046, icon => 2046, type => 1,
      name => lang:get("堆雪人"), rank => 206, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 82800, panelargs => [907], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2047) ->
    #{id => 2047, icon => 2047, type => 1,
      name => lang:get("雪球大战"), rank => 801, max_try => 0,
      open_leve => 30, max_leve => 0, starttime => 54000,
      endtime => 64800, panelargs => [], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2048) ->
    #{id => 2048, icon => 3006, type => 1,
      name => lang:get("无尽挑战"), rank => 1350, max_try => 0,
      open_leve => 70, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      recommend => 0, statistic => 1};
get(2049) ->
    #{id => 2049, icon => 2028, type => 1,
      name => lang:get("武道大会"), rank => 1301, max_try => 3,
      open_leve => 70, max_leve => 0, starttime => 45000,
      endtime => 48600, panelargs => [], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1, args => [2],
      recommend => 0, statistic => 1};
get(2050) ->
    #{id => 2050, icon => 2050, type => 1,
      name => lang:get("净化家园"), rank => 207, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2051) ->
    #{id => 2051, icon => 2051, type => 1,
      name => lang:get("狐王·剑心"), rank => 208, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(99) ->
    #{id => 99, icon => 99, type => 1,
      name => lang:get("更多活动"), rank => 1400, max_try => 0,
      open_leve => 10, max_leve => 0, starttime => 86400,
      endtime => 0, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [],
      statistic => 0};
get(2052) ->
    #{id => 2052, icon => 2052, type => 1,
      name => lang:get("星语星愿"), rank => 1001, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [567], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2053) ->
    #{id => 2053, icon => 2053, type => 1,
      name => lang:get("端午龙舟"), rank => 209, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 50400,
      endtime => 67800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2054) ->
    #{id => 2054, icon => 2054, type => 1,
      name => lang:get("小猪快跳"), rank => 1305, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 59400,
      endtime => 60120, panelargs => [], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1, 3, 5],
      recommend => 0, statistic => 1};
get(2055) ->
    #{id => 2055, icon => 2055, type => 1,
      name => lang:get("好声音助威"), rank => 1306, max_try => 1,
      open_leve => 50, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [1], activity => 5,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 0};
get(2056) ->
    #{id => 2056, icon => 2056, type => 1,
      name => lang:get("钻石联赛"), rank => 1309, max_try => 2,
      open_leve => 50, max_leve => 0, starttime => 72300,
      endtime => 75600, panelargs => [], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [6],
      recommend => 0, statistic => 1};
get(2057) ->
    #{id => 2057, icon => 2057, type => 1,
      name => lang:get("龙王资格"), rank => 260, max_try => 0,
      open_leve => 65, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 3, 4],
      recommend => 0};
get(2058) ->
    #{id => 2058, icon => 2057, type => 1,
      name => lang:get("龙王试练"), rank => 260, max_try => 0,
      open_leve => 65, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [6, 7],
      recommend => 0};
get(2059) ->
    #{id => 2059, icon => 2057, type => 1,
      name => lang:get("龙王试练"), rank => 260, max_try => 0,
      open_leve => 65, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [5],
      recommend => 0};
get(2060) ->
    #{id => 2060, icon => 2057, type => 1,
      name => lang:get("龙王资格"), rank => 260, max_try => 0,
      open_leve => 65, max_leve => 0, starttime => 36000,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1],
      recommend => 0};
get(2061) ->
    #{id => 2061, icon => 2061, type => 1,
      name => lang:get("玲珑宝阁"), rank => 90, max_try => 7,
      open_leve => 65, max_leve => 79, starttime => 0,
      endtime => 86399, panelargs => [], activity => 2,
      max_activity => 14, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 3, 5, 7], recommend => 0, statistic => 1};
get(2062) ->
    #{id => 2062, icon => 2061, type => 1,
      name => lang:get("玲珑宝阁"), rank => 90, max_try => 7,
      open_leve => 80, max_leve => 200, starttime => 0,
      endtime => 86399, panelargs => [], activity => 2,
      max_activity => 14, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 3, 5, 7], recommend => 0, statistic => 1};
get(2063) ->
    #{id => 2063, icon => 2033, type => 1,
      name => lang:get("元宵灯会"), rank => 402, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 64800, panelargs => [919], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2064) ->
    #{id => 2064, icon => 2064, type => 1,
      name => lang:get("腊八赏歌"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [876], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2065) ->
    #{id => 2065, icon => 2065, type => 1,
      name => lang:get("巨龙宝藏"), rank => 70, max_try => 1,
      open_leve => 65, max_leve => 0, starttime => 77400,
      endtime => 79200, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1],
      recommend => 0, statistic => 1};
get(2066) ->
    #{id => 2066, icon => 2025, type => 1,
      name => lang:get("极速滑雪"), rank => 209, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 50400,
      endtime => 67800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2067) ->
    #{id => 2067, icon => 2067, type => 1,
      name => lang:get("五彩贺小年"), rank => 201, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 32400,
      endtime => 84600, panelargs => [0], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2068) ->
    #{id => 2068, icon => 2068, type => 1,
      name => lang:get("封神殿堂"), rank => 70, max_try => 1,
      open_leve => 50, max_leve => 0, starttime => 75900,
      endtime => 77400, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [7],
      recommend => 0, statistic => 1};
get(2069) ->
    #{id => 2069, icon => 2069, type => 1,
      name => lang:get("冲顶答题"), rank => 402, max_try => 0,
      open_leve => 40, max_leve => 0, starttime => 70200,
      endtime => 72000, panelargs => [905], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2070) ->
    #{id => 2070, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [962], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2071) ->
    #{id => 2071, icon => 2050, type => 1,
      name => lang:get("净化家园"), rank => 207, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2072) ->
    #{id => 2072, icon => 2072, type => 1,
      name => lang:get("银月贤者"), rank => 999, max_try => 2,
      open_leve => 60, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2073) ->
    #{id => 2073, icon => 2073, type => 1,
      name => lang:get("天启试炼"), rank => 1000, max_try => 0,
      open_leve => 90, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [6, 7],
      recommend => 0, statistic => 1};
get(2074) ->
    #{id => 2074, icon => 2073, type => 1,
      name => lang:get("天启试炼"), rank => 1000, max_try => 0,
      open_leve => 90, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [5],
      recommend => 0, statistic => 1};
get(2075) ->
    #{id => 2075, icon => 2073, type => 1,
      name => lang:get("天启门徒"), rank => 1000, max_try => 0,
      open_leve => 90, max_leve => 0, starttime => 0,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 3, 4],
      recommend => 0, statistic => 1};
get(2076) ->
    #{id => 2076, icon => 2073, type => 1,
      name => lang:get("天启门徒"), rank => 1000, max_try => 0,
      open_leve => 90, max_leve => 0, starttime => 36000,
      endtime => 86399, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1],
      recommend => 0, statistic => 1};
get(2077) ->
    #{id => 2077, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [1064], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2078) ->
    #{id => 2078, icon => 2021, type => 1,
      name => lang:get("点石成金"), rank => 304, max_try => 3,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [1070], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2079) ->
    #{id => 2079, icon => 2053, type => 1,
      name => lang:get("赛龙舟"), rank => 209, max_try => 2,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2080) ->
    #{id => 2080, icon => 2029, type => 1,
      name => lang:get("清凉一夏"), rank => 101, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 60,
      endtime => 86399, panelargs => [1150], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2081) ->
    #{id => 2081, icon => 2074, type => 1,
      name => lang:get("假日赏歌"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1163], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2082) ->
    #{id => 2082, icon => 2082, type => 1,
      name => lang:get("幻月灵兽"), rank => 999, max_try => 2,
      open_leve => 80, max_leve => 0, starttime => 0,
      endtime => 0, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2083) ->
    #{id => 2083, icon => 2074, type => 1,
      name => lang:get("赏歌大会"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2084) ->
    #{id => 2084, icon => 2042, type => 1,
      name => lang:get("淘气南瓜"), rank => 901, max_try => 2,
      open_leve => 30, max_leve => 0, starttime => 57600,
      endtime => 64800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2085) ->
    #{id => 2085, icon => 2041, type => 1,
      name => lang:get("驱除邪灵"), rank => 204, max_try => 5,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1862], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2086) ->
    #{id => 2086, icon => 2043, type => 1,
      name => lang:get("邪灵之主"), rank => 205, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 86340, panelargs => [1862], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2087) ->
    #{id => 2087, icon => 2050, type => 1,
      name => lang:get("净化家园"), rank => 207, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2088) ->
    #{id => 2088, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1301], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2089) ->
    #{id => 2089, icon => 2074, type => 1,
      name => lang:get("赏歌大会"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1319], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2090) ->
    #{id => 2090, icon => 2046, type => 1,
      name => lang:get("堆雪人"), rank => 206, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1355], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2091) ->
    #{id => 2091, icon => 2050, type => 1,
      name => lang:get("净化家园"), rank => 207, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2092) ->
    #{id => 2092, icon => 2025, type => 1,
      name => lang:get("极速滑雪"), rank => 209, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 50400,
      endtime => 67800, panelargs => [3006], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2093) ->
    #{id => 2093, icon => 2021, type => 1,
      name => lang:get("点石成金"), rank => 304, max_try => 3,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1906], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2094) ->
    #{id => 2094, icon => 2067, type => 1,
      name => lang:get("五彩贺小年"), rank => 201, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [0], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2095) ->
    #{id => 2095, icon => 2046, type => 1,
      name => lang:get("堆雪人"), rank => 206, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3063], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2096) ->
    #{id => 2096, icon => 2033, type => 1,
      name => lang:get("元宵灯会"), rank => 402, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 64800, panelargs => [3068], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2097) ->
    #{id => 2097, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1469], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2098) ->
    #{id => 2098, icon => 2074, type => 1,
      name => lang:get("赏歌大会"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1507], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2099) ->
    #{id => 2099, icon => 2018, type => 1,
      name => lang:get("草木妖王"), rank => 303, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3190], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2100) ->
    #{id => 2100, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1741], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2102) ->
    #{id => 2102, icon => 2050, type => 1,
      name => lang:get("净化家园"), rank => 207, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 34200,
      endtime => 84600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2103) ->
    #{id => 2103, icon => 2074, type => 1,
      name => lang:get("赏歌大会"), rank => 302, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3153], activity => 3,
      max_activity => 9, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2107) ->
    #{id => 2107, icon => 2029, type => 1,
      name => lang:get("清凉一夏"), rank => 101, max_try => 2,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [1691], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2108) ->
    #{id => 2108, icon => 2070, type => 1,
      name => lang:get("顽皮萌娃"), rank => 101, max_try => 3,
      open_leve => 40, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3100], activity => 5,
      max_activity => 10, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2109) ->
    #{id => 2109, icon => 2033, type => 1,
      name => lang:get("孔明灯会"), rank => 402, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 64800, panelargs => [1779], activity => 1,
      max_activity => 5, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 1,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2111) ->
    #{id => 2111, icon => 2046, type => 1,
      name => lang:get("堆雪人"), rank => 206, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3065], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2112) ->
    #{id => 2112, icon => 2046, type => 1,
      name => lang:get("堆雪人"), rank => 206, max_try => 5,
      open_leve => 30, max_leve => 0, starttime => 36000,
      endtime => 82800, panelargs => [3067], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2,
      args => [1, 2, 3, 4, 5, 6, 7], recommend => 0,
      statistic => 1};
get(2101) ->
    #{id => 2101, icon => 2047, type => 1,
      name => lang:get("冰雪情缘"), rank => 801, max_try => 3,
      open_leve => 50, max_leve => 0, starttime => 61200,
      endtime => 66600, panelargs => [1], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [7],
      recommend => 0, statistic => 1};
get(2104) ->
    #{id => 2104, icon => 3007, type => 1,
      name => lang:get("斗兽棋"), rank => 1101, max_try => 2,
      open_leve => 50, max_leve => 0, starttime => 61200,
      endtime => 66600, panelargs => [3], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [1, 5],
      recommend => 0, statistic => 1};
get(2105) ->
    #{id => 2105, icon => 3008, type => 1,
      name => lang:get("龙凤棋"), rank => 1201, max_try => 2,
      open_leve => 50, max_leve => 0, starttime => 61200,
      endtime => 66600, panelargs => [2], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [3],
      recommend => 0, statistic => 1};
get(2106) ->
    #{id => 2106, icon => 2106, type => 1,
      name => lang:get("峡谷之巅"), rank => 1301, max_try => 1,
      open_leve => 70, max_leve => 0, starttime => 72000,
      endtime => 75600, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [3],
      recommend => 0, statistic => 1};
get(2110) ->
    #{id => 2110, icon => 2110, type => 1,
      name => lang:get("真心话大冒险"), rank => 1401, max_try => 1,
      open_leve => 30, max_leve => 0, starttime => 75600,
      endtime => 82800, panelargs => [], activity => 0,
      max_activity => 0, energy => 0, max_energy => 0,
      achieve_energy => 0, reset_time => 2, args => [2, 4, 7],
      recommend => 1, statistic => 1};
get(Id) -> {none, Id}.

get_activity(22536) ->
    {20, 1, [{20006, 5}, {90006, 400}]};
get_activity(22537) ->
    {40, 1, [{20060, 1}, {22215, 2}, {90006, 400}]};
get_activity(22538) ->
    {75, 1, [{20025, 1}, {90006, 300}]};
get_activity(22539) ->
    {120, 1, [{21220, 2}, {20006, 5}, {90006, 300}]};
get_activity(_Id) -> none.

get_energy_max(16) -> 600;
get_energy_max(17) -> 600;
get_energy_max(18) -> 600;
get_energy_max(19) -> 600;
get_energy_max(20) -> 600;
get_energy_max(21) -> 630;
get_energy_max(22) -> 660;
get_energy_max(23) -> 690;
get_energy_max(24) -> 720;
get_energy_max(25) -> 750;
get_energy_max(26) -> 780;
get_energy_max(27) -> 810;
get_energy_max(28) -> 840;
get_energy_max(29) -> 870;
get_energy_max(30) -> 900;
get_energy_max(31) -> 930;
get_energy_max(32) -> 960;
get_energy_max(33) -> 990;
get_energy_max(34) -> 1020;
get_energy_max(35) -> 1050;
get_energy_max(36) -> 1080;
get_energy_max(37) -> 1110;
get_energy_max(38) -> 1140;
get_energy_max(39) -> 1170;
get_energy_max(40) -> 1200;
get_energy_max(41) -> 1212;
get_energy_max(42) -> 1224;
get_energy_max(43) -> 1236;
get_energy_max(44) -> 1248;
get_energy_max(45) -> 1260;
get_energy_max(46) -> 1272;
get_energy_max(47) -> 1284;
get_energy_max(48) -> 1296;
get_energy_max(49) -> 1308;
get_energy_max(50) -> 1320;
get_energy_max(51) -> 1332;
get_energy_max(52) -> 1344;
get_energy_max(53) -> 1356;
get_energy_max(54) -> 1368;
get_energy_max(55) -> 1380;
get_energy_max(56) -> 1392;
get_energy_max(57) -> 1404;
get_energy_max(58) -> 1416;
get_energy_max(59) -> 1428;
get_energy_max(60) -> 1440;
get_energy_max(61) -> 1452;
get_energy_max(62) -> 1464;
get_energy_max(63) -> 1476;
get_energy_max(64) -> 1488;
get_energy_max(65) -> 1500;
get_energy_max(66) -> 1503;
get_energy_max(67) -> 1506;
get_energy_max(68) -> 1509;
get_energy_max(69) -> 1512;
get_energy_max(70) -> 1515;
get_energy_max(71) -> 1518;
get_energy_max(72) -> 1521;
get_energy_max(73) -> 1524;
get_energy_max(74) -> 1527;
get_energy_max(75) -> 1530;
get_energy_max(76) -> 1533;
get_energy_max(77) -> 1536;
get_energy_max(78) -> 1539;
get_energy_max(79) -> 1542;
get_energy_max(80) -> 1545;
get_energy_max(81) -> 1548;
get_energy_max(82) -> 1551;
get_energy_max(83) -> 1554;
get_energy_max(84) -> 1557;
get_energy_max(85) -> 1560;
get_energy_max(86) -> 1563;
get_energy_max(87) -> 1566;
get_energy_max(88) -> 1569;
get_energy_max(89) -> 1572;
get_energy_max(90) -> 1575;
get_energy_max(91) -> 1578;
get_energy_max(92) -> 1581;
get_energy_max(93) -> 1584;
get_energy_max(94) -> 1587;
get_energy_max(95) -> 1590;
get_energy_max(96) -> 1593;
get_energy_max(97) -> 1596;
get_energy_max(98) -> 1599;
get_energy_max(99) -> 1602;
get_energy_max(100) -> 1605;
get_energy_max(101) -> 1608;
get_energy_max(102) -> 1611;
get_energy_max(103) -> 1614;
get_energy_max(104) -> 1617;
get_energy_max(105) -> 1620;
get_energy_max(106) -> 1620;
get_energy_max(107) -> 1620;
get_energy_max(108) -> 1620;
get_energy_max(109) -> 1620;
get_energy_max(110) -> 1620;
get_energy_max(111) -> 1620;
get_energy_max(112) -> 1620;
get_energy_max(113) -> 1620;
get_energy_max(114) -> 1620;
get_energy_max(115) -> 1620;
get_energy_max(116) -> 1620;
get_energy_max(117) -> 1620;
get_energy_max(118) -> 1620;
get_energy_max(119) -> 1620;
get_energy_max(120) -> 1620;
get_energy_max(121) -> 1640;
get_energy_max(122) -> 1640;
get_energy_max(123) -> 1640;
get_energy_max(124) -> 1640;
get_energy_max(125) -> 1640;
get_energy_max(126) -> 1640;
get_energy_max(127) -> 1640;
get_energy_max(128) -> 1640;
get_energy_max(129) -> 1640;
get_energy_max(130) -> 1640;
get_energy_max(_Lev) -> 0.

get_max_reserve_exp(1) -> 50000;
get_max_reserve_exp(2) -> 50000;
get_max_reserve_exp(3) -> 50000;
get_max_reserve_exp(4) -> 50000;
get_max_reserve_exp(5) -> 50000;
get_max_reserve_exp(6) -> 50000;
get_max_reserve_exp(7) -> 50000;
get_max_reserve_exp(8) -> 50000;
get_max_reserve_exp(9) -> 50000;
get_max_reserve_exp(10) -> 50000;
get_max_reserve_exp(11) -> 50000;
get_max_reserve_exp(12) -> 50000;
get_max_reserve_exp(13) -> 50000;
get_max_reserve_exp(14) -> 50000;
get_max_reserve_exp(15) -> 50000;
get_max_reserve_exp(16) -> 50000;
get_max_reserve_exp(17) -> 50000;
get_max_reserve_exp(18) -> 50000;
get_max_reserve_exp(19) -> 50000;
get_max_reserve_exp(20) -> 50000;
get_max_reserve_exp(21) -> 50000;
get_max_reserve_exp(22) -> 50000;
get_max_reserve_exp(23) -> 50000;
get_max_reserve_exp(24) -> 50000;
get_max_reserve_exp(25) -> 50000;
get_max_reserve_exp(26) -> 50000;
get_max_reserve_exp(27) -> 50000;
get_max_reserve_exp(28) -> 50000;
get_max_reserve_exp(29) -> 50000;
get_max_reserve_exp(30) -> 50000;
get_max_reserve_exp(31) -> 50000;
get_max_reserve_exp(32) -> 72000;
get_max_reserve_exp(33) -> 86000;
get_max_reserve_exp(34) -> 100000;
get_max_reserve_exp(35) -> 106000;
get_max_reserve_exp(36) -> 120000;
get_max_reserve_exp(37) -> 129000;
get_max_reserve_exp(38) -> 140000;
get_max_reserve_exp(39) -> 158000;
get_max_reserve_exp(40) -> 183000;
get_max_reserve_exp(41) -> 199000;
get_max_reserve_exp(42) -> 265000;
get_max_reserve_exp(43) -> 286000;
get_max_reserve_exp(44) -> 317000;
get_max_reserve_exp(45) -> 339000;
get_max_reserve_exp(46) -> 390000;
get_max_reserve_exp(47) -> 434000;
get_max_reserve_exp(48) -> 495000;
get_max_reserve_exp(49) -> 565000;
get_max_reserve_exp(50) -> 629000;
get_max_reserve_exp(51) -> 711000;
get_max_reserve_exp(52) -> 806000;
get_max_reserve_exp(53) -> 904000;
get_max_reserve_exp(54) -> 1016000;
get_max_reserve_exp(55) -> 1041000;
get_max_reserve_exp(56) -> 1062000;
get_max_reserve_exp(57) -> 1090000;
get_max_reserve_exp(58) -> 1120000;
get_max_reserve_exp(59) -> 1141000;
get_max_reserve_exp(60) -> 1292000;
get_max_reserve_exp(61) -> 1472000;
get_max_reserve_exp(62) -> 1715000;
get_max_reserve_exp(63) -> 1991000;
get_max_reserve_exp(64) -> 2346000;
get_max_reserve_exp(65) -> 2655000;
get_max_reserve_exp(66) -> 3109000;
get_max_reserve_exp(67) -> 3608000;
get_max_reserve_exp(68) -> 4175000;
get_max_reserve_exp(69) -> 4339000;
get_max_reserve_exp(70) -> 4704000;
get_max_reserve_exp(71) -> 4878000;
get_max_reserve_exp(72) -> 5180000;
get_max_reserve_exp(73) -> 5423000;
get_max_reserve_exp(74) -> 6432000;
get_max_reserve_exp(75) -> 6893000;
get_max_reserve_exp(76) -> 7556000;
get_max_reserve_exp(77) -> 8239000;
get_max_reserve_exp(78) -> 8919000;
get_max_reserve_exp(79) -> 9630000;
get_max_reserve_exp(80) -> 11336000;
get_max_reserve_exp(81) -> 12157000;
get_max_reserve_exp(82) -> 12956000;
get_max_reserve_exp(83) -> 13767000;
get_max_reserve_exp(84) -> 14590000;
get_max_reserve_exp(85) -> 14971000;
get_max_reserve_exp(86) -> 15800000;
get_max_reserve_exp(87) -> 16663000;
get_max_reserve_exp(88) -> 17518000;
get_max_reserve_exp(89) -> 20031000;
get_max_reserve_exp(90) -> 22034000;
get_max_reserve_exp(91) -> 24271000;
get_max_reserve_exp(92) -> 26513000;
get_max_reserve_exp(93) -> 28772000;
get_max_reserve_exp(94) -> 31120000;
get_max_reserve_exp(95) -> 32452000;
get_max_reserve_exp(96) -> 34749000;
get_max_reserve_exp(97) -> 37145000;
get_max_reserve_exp(98) -> 39518000;
get_max_reserve_exp(99) -> 41916000;
get_max_reserve_exp(100) -> 41916000;
get_max_reserve_exp(101) -> 41916000;
get_max_reserve_exp(102) -> 41916000;
get_max_reserve_exp(103) -> 41916000;
get_max_reserve_exp(104) -> 41916000;
get_max_reserve_exp(105) -> 41916000;
get_max_reserve_exp(106) -> 41916000;
get_max_reserve_exp(107) -> 41916000;
get_max_reserve_exp(108) -> 41916000;
get_max_reserve_exp(109) -> 41916000;
get_max_reserve_exp(110) -> 41916000;
get_max_reserve_exp(111) -> 41916000;
get_max_reserve_exp(112) -> 41916000;
get_max_reserve_exp(113) -> 41916000;
get_max_reserve_exp(114) -> 41916000;
get_max_reserve_exp(115) -> 41916000;
get_max_reserve_exp(116) -> 41916000;
get_max_reserve_exp(117) -> 41916000;
get_max_reserve_exp(118) -> 41916000;
get_max_reserve_exp(119) -> 41916000;
get_max_reserve_exp(120) -> 41916000;
get_max_reserve_exp(121) -> 41916000;
get_max_reserve_exp(122) -> 41916000;
get_max_reserve_exp(123) -> 41916000;
get_max_reserve_exp(124) -> 41916000;
get_max_reserve_exp(125) -> 41916000;
get_max_reserve_exp(126) -> 41916000;
get_max_reserve_exp(127) -> 41916000;
get_max_reserve_exp(128) -> 41916000;
get_max_reserve_exp(129) -> 41916000;
get_max_reserve_exp(130) -> 41916000;
get_max_reserve_exp(_Lev) -> false.

get_reserve_type(2) ->
    [#{type => 2, args1 => 10035, args2 => 50021,
       max_time => 1, need_lev => 35, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10035, args2 => 50022,
       max_time => 1, need_lev => 35, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10035, args2 => 50023,
       max_time => 1, need_lev => 35, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10035, args2 => 50039,
       max_time => 1, need_lev => 35, type_exp => 2022,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10035, args2 => 0, max_time => 1,
       need_lev => 35, type_exp => 2020, type_exp_ratio => 0},
     #{type => 2, args1 => 10055, args2 => 50041,
       max_time => 1, need_lev => 55, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10055, args2 => 50042,
       max_time => 1, need_lev => 55, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10055, args2 => 50043,
       max_time => 1, need_lev => 55, type_exp => 2021,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10055, args2 => 50059,
       max_time => 1, need_lev => 55, type_exp => 2022,
       type_exp_ratio => 0},
     #{type => 2, args1 => 10055, args2 => 0, max_time => 1,
       need_lev => 55, type_exp => 2050, type_exp_ratio => 0},
     #{type => 1, max_time => 5, need_lev => 30,
       type_exp => 1003, type_exp_ratio => 0},
     #{type => 6, max_time => 10, need_lev => 30,
       type_exp => 1002, type_exp_ratio => 0}];
get_reserve_type(1) ->
    [#{type => 3, max_time => 50, need_lev => 20,
       type_exp => 1004, type_exp_ratio => 0},
     #{type => 5, max_time => 20, need_lev => 15,
       type_exp => 1005, type_exp_ratio => 0}];
get_reserve_type(_) -> [].

get_ext_double(35) -> 0;
get_ext_double(40) -> 0;
get_ext_double(45) -> 50;
get_ext_double(50) -> 75;
get_ext_double(55) -> 100;
get_ext_double(60) -> 125;
get_ext_double(65) -> 150;
get_ext_double(70) -> 175;
get_ext_double(75) -> 200;
get_ext_double(80) -> 225;
get_ext_double(85) -> 250;
get_ext_double(90) -> 275;
get_ext_double(95) -> 300;
get_ext_double(100) -> 300;
get_ext_double(105) -> 300;
get_ext_double(110) -> 300;
get_ext_double(115) -> 300;
get_ext_double(120) -> 300;
get_ext_double(125) -> 300;
get_ext_double(130) -> 300;
get_ext_double(_) -> 0.

get_lev_gift(1) ->
    [#{classes => 0, lev => 30, time => 86400,
       loss => [{90002, 330}],
       item_list => [{21100, 3}, {20046, 1}, {20006, 60}]}];
get_lev_gift(2) ->
    [#{classes => 0, lev => 40, time => 172800,
       loss => [{90002, 799}],
       item_list =>
           [{20028, 1}, {20616, 1}, {29008, 2}, {20006, 80}]}];
get_lev_gift(3) ->
    [#{classes => 0, lev => 50, time => 345600,
       loss => [{90002, 899}],
       item_list =>
           [{22617, 1},
            {21100, 5},
            {22553, 8},
            {20046, 3},
            {20020, 20}]}];
get_lev_gift(4) ->
    [#{classes => 0, lev => 60, time => 345600,
       loss => [{90002, 1499}],
       item_list =>
           [{20011, 1},
            {22554, 8},
            {20617, 1},
            {20006, 100},
            {21101, 4}]}];
get_lev_gift(5) ->
    [#{classes => 0, lev => 70, time => 345600,
       loss => [{90002, 1999}],
       item_list =>
           [{20617, 1}, {20011, 1}, {22308, 1}, {22555, 6}]}];
get_lev_gift(6) ->
    [#{classes => 0, lev => 80, time => 345600,
       loss => [{90002, 1999}],
       item_list =>
           [{20028, 1},
            {20022, 10},
            {22556, 5},
            {22306, 5},
            {20006, 200}]}];
get_lev_gift(7) ->
    [#{classes => 0, lev => 90, time => 345600,
       loss => [{90002, 2200}],
       item_list =>
           [{20401, 1},
            {20405, 2},
            {22311, 5},
            {22306, 8},
            {20022, 10}]}];
get_lev_gift(8) ->
    [#{classes => 0, lev => 100, time => 345600,
       loss => [{90002, 2200}],
       item_list =>
           [{20024, 1},
            {29101, 5},
            {23119, 2},
            {22307, 5},
            {20006, 300}]}];
get_lev_gift(_) -> [].

list_lev_gift() -> [1, 2, 3, 4, 5, 6, 7, 8].

list_activity() -> [22536, 22537, 22538, 22539].

get_satiety(1) -> 703;
get_satiety(2) -> 706;
get_satiety(3) -> 709;
get_satiety(4) -> 712;
get_satiety(5) -> 715;
get_satiety(6) -> 719;
get_satiety(7) -> 722;
get_satiety(8) -> 725;
get_satiety(9) -> 728;
get_satiety(10) -> 731;
get_satiety(11) -> 735;
get_satiety(12) -> 738;
get_satiety(13) -> 741;
get_satiety(14) -> 744;
get_satiety(15) -> 747;
get_satiety(16) -> 750;
get_satiety(17) -> 754;
get_satiety(18) -> 757;
get_satiety(19) -> 760;
get_satiety(20) -> 763;
get_satiety(21) -> 766;
get_satiety(22) -> 770;
get_satiety(23) -> 773;
get_satiety(24) -> 776;
get_satiety(25) -> 779;
get_satiety(26) -> 782;
get_satiety(27) -> 785;
get_satiety(28) -> 789;
get_satiety(29) -> 792;
get_satiety(30) -> 795;
get_satiety(31) -> 798;
get_satiety(32) -> 801;
get_satiety(33) -> 805;
get_satiety(34) -> 808;
get_satiety(35) -> 811;
get_satiety(36) -> 814;
get_satiety(37) -> 817;
get_satiety(38) -> 820;
get_satiety(39) -> 824;
get_satiety(40) -> 827;
get_satiety(41) -> 830;
get_satiety(42) -> 833;
get_satiety(43) -> 836;
get_satiety(44) -> 840;
get_satiety(45) -> 843;
get_satiety(46) -> 846;
get_satiety(47) -> 849;
get_satiety(48) -> 852;
get_satiety(49) -> 855;
get_satiety(50) -> 859;
get_satiety(51) -> 862;
get_satiety(52) -> 865;
get_satiety(53) -> 868;
get_satiety(54) -> 871;
get_satiety(55) -> 875;
get_satiety(56) -> 878;
get_satiety(57) -> 881;
get_satiety(58) -> 884;
get_satiety(59) -> 887;
get_satiety(60) -> 890;
get_satiety(61) -> 894;
get_satiety(62) -> 897;
get_satiety(63) -> 900;
get_satiety(64) -> 903;
get_satiety(65) -> 906;
get_satiety(66) -> 910;
get_satiety(67) -> 913;
get_satiety(68) -> 916;
get_satiety(69) -> 919;
get_satiety(70) -> 922;
get_satiety(71) -> 925;
get_satiety(72) -> 929;
get_satiety(73) -> 932;
get_satiety(74) -> 935;
get_satiety(75) -> 938;
get_satiety(76) -> 941;
get_satiety(77) -> 945;
get_satiety(78) -> 948;
get_satiety(79) -> 951;
get_satiety(80) -> 954;
get_satiety(81) -> 957;
get_satiety(82) -> 960;
get_satiety(83) -> 964;
get_satiety(84) -> 967;
get_satiety(85) -> 970;
get_satiety(86) -> 973;
get_satiety(87) -> 976;
get_satiety(88) -> 980;
get_satiety(89) -> 983;
get_satiety(90) -> 986;
get_satiety(91) -> 989;
get_satiety(92) -> 992;
get_satiety(93) -> 995;
get_satiety(94) -> 999;
get_satiety(95) -> 1002;
get_satiety(96) -> 1005;
get_satiety(97) -> 1008;
get_satiety(98) -> 1011;
get_satiety(99) -> 1015;
get_satiety(100) -> 1018;
get_satiety(101) -> 1021;
get_satiety(102) -> 1024;
get_satiety(103) -> 1027;
get_satiety(104) -> 1030;
get_satiety(105) -> 1034;
get_satiety(106) -> 1037;
get_satiety(107) -> 1040;
get_satiety(108) -> 1043;
get_satiety(109) -> 1046;
get_satiety(110) -> 1050;
get_satiety(111) -> 1053;
get_satiety(112) -> 1056;
get_satiety(113) -> 1059;
get_satiety(114) -> 1062;
get_satiety(115) -> 1065;
get_satiety(116) -> 1069;
get_satiety(117) -> 1072;
get_satiety(118) -> 1075;
get_satiety(119) -> 1078;
get_satiety(120) -> 1081;
get_satiety(121) -> 1084;
get_satiety(122) -> 1087;
get_satiety(123) -> 1090;
get_satiety(124) -> 1093;
get_satiety(125) -> 1096;
get_satiety(126) -> 1099;
get_satiety(127) -> 1102;
get_satiety(128) -> 1105;
get_satiety(129) -> 1108;
get_satiety(130) -> 1111;
get_satiety(_) -> 700.

get_agenda_mail(1) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 公会攻城战16:00-23:30开启}，公会单人PK，争夺公会"
                     "冠军联赛资格"),
            65,
            200,
            57600},
           {lang:get("{string_2, 9, 星光乐园-斗兽棋17:00-18:30开启}，童年回忆斗兽棋，"
                     "快快乐乐赢积分"),
            50,
            200,
            61200},
           {lang:get("{string_2, 9, 勇士战场20:00-21:00开启}，阵营对战，多种趣味模式等"
                     "你来挑战"),
            40,
            200,
            72000},
           {lang:get("{string_2, 9, 巨龙宝藏21:30-22:00开启}，讨伐巨龙，夺取大量宝物吧"),
            65,
            200,
            77400}]};
get_agenda_mail(2) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 英雄擂台17:00-17:30、19:00-19:30开启}，"
                     "夺称号，拿王者积分，看谁是单挑之王"),
            65,
            200,
            68400},
           {lang:get("{string_2, 9, 公会战19:40-21:00开启}，公会团体PK，争夺哪个才是"
                     "本服第一公会"),
            30,
            200,
            72000},
           {lang:get("{string_2, 9, 时空段位赛21:30-22:30开启}，3V3小队PK，夺星辰"
                     "积分奖励"),
            40,
            200,
            77400}]};
get_agenda_mail(3) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 星光乐园-龙凤棋17:00-18:30开启}，龙凤对决，孰与争"
                     "锋，来场谋略的对决吧"),
            50,
            200,
            61200},
           {lang:get("{string_2, 9, 荣耀战场20:00-21:15开启}，联盟部落5V5组队决战荣"
                     "耀之巅，赚星辰积分"),
            40,
            69,
            72000},
           {lang:get("{string_2, 9, 峡谷之巅20:00-21:00开启}，联盟部落阵营对抗，组队推"
                     "塔峡谷称王"),
            70,
            200,
            72000},
           {lang:get("{string_2, 9, 职业挑战21:30-23:00开启}，挑战各大职业首席，速度越"
                     "快，难度越高，奖励越丰厚"),
            30,
            200,
            77400}]};
get_agenda_mail(4) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 英雄擂台17:00-17:30、19:00-19:30开启}，"
                     "夺称号，拿王者积分，看谁是单挑之王"),
            65,
            200,
            68400},
           {lang:get("{string_2, 9, 公会战19:40-21:00开启}，公会团体PK，争夺哪个才是"
                     "本服第一公会"),
            30,
            200,
            72000},
           {lang:get("{string_2, 9, 时空段位赛21:30-22:30开启}，3V3小队PK，夺星辰"
                     "积分奖励"),
            40,
            200,
            77400}]};
get_agenda_mail(5) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 公会攻城战16:00-23:30开启}，公会单人PK，争夺公会"
                     "冠军联赛资格"),
            65,
            200,
            57600},
           {lang:get("{string_2, 9, 星光乐园-斗兽棋17:00-18:30开启}，童年回忆斗兽棋，"
                     "快快乐乐赢积分"),
            50,
            200,
            61200},
           {lang:get("{string_2, 9, 精灵幻境20:00-21:00开启}，幻境变身，1v1单人对决"
                     "，看谁最先冲到第五层"),
            40,
            200,
            72000}]};
get_agenda_mail(6) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 荣耀战场14:30-15:45开启}，联盟部落5V5组队决战荣"
                     "耀之巅，赚星辰积分"),
            40,
            200,
            52200},
           {lang:get("{string_2, 9, 英雄擂台17:00-17:30、19:00-19:30开启}，"
                     "夺称号，拿王者积分，看谁是单挑之王"),
            65,
            200,
            68400},
           {lang:get("{string_2, 9, 钻石联赛20:00-21:00开启}，1V1激烈对决，战斗、竞"
                     "猜钻石拿不停"),
            50,
            200,
            72000}]};
get_agenda_mail(7) ->
    #{title => lang:get("今日活动提示"),
      args =>
          [{lang:get("{string_2, 9, 星光乐园-冰雪情缘17:00-18:30开启}，搓雪球，打雪仗"
                     "，开开心心赚积分"),
            50,
            200,
            61200},
           {lang:get("{string_2, 9, 彩虹冒险20:00-21:00开启}，组队前往幻境寻找宝藏钥匙"
                     "，开宝箱拿宝物"),
            30,
            200,
            72000},
           {lang:get("{string_2, 9, 巅峰对决21:30-22:45开启}，5人自由组PK，争夺谁在"
                     "是该职业真正的王者"),
            40,
            200,
            77400}]};
get_agenda_mail(_) -> false.

