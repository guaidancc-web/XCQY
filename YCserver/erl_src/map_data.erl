-file("src/data/map_data.erl", 1).

-module(map_data).

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

-file("src/data/map_data.erl", 9).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/data/map_data.erl", 10).

-export([startup/0, get/1, all/0, get_mod/1]).

startup() ->
    [10001,
     10002,
     10003,
     10004,
     10007,
     10008,
     10009,
     20001,
     20002,
     20003,
     30015,
     41001,
     41002,
     41003,
     42000,
     42100,
     50001,
     50002,
     50003,
     50011,
     50012,
     50013,
     50021,
     50022,
     50023,
     50031,
     50032,
     50033,
     53006,
     60001].

all() ->
    [10001,
     10002,
     10003,
     10004,
     10007,
     10008,
     10009,
     20001,
     20002,
     20003,
     20004,
     20005,
     20006,
     20007,
     20008,
     21004,
     22004,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     40000,
     41001,
     41002,
     41003,
     42000,
     42001,
     42002,
     42003,
     42004,
     42005,
     42006,
     42007,
     42008,
     42009,
     42010,
     42100,
     50001,
     50002,
     50003,
     50011,
     50012,
     50013,
     50021,
     50022,
     50023,
     50031,
     50032,
     50033,
     51000,
     51001,
     51010,
     51020,
     51021,
     52000,
     52001,
     52002,
     53001,
     53002,
     53003,
     53004,
     53005,
     53006,
     53007,
     53008,
     53009,
     53010,
     53011,
     53012,
     53013,
     53014,
     53015,
     60001,
     70001,
     70002,
     70003,
     70004,
     70005,
     70006,
     70007,
     70008,
     70009,
     70010,
     70011,
     70012,
     70013,
     70014,
     71000,
     71001,
     71002,
     71003,
     71004,
     71005].

-spec get_mod(BaseId :: pos_integer()) -> Mod :: atom().

get_mod(60001) -> map_single;
get_mod(_BaseId) -> map_grid.

-spec get(BaseId :: pos_integer()) -> {ok,
                                       #map_data{}} |
                                      {error,
                                       {map_data_not_exists,
                                        BaseId :: pos_integer()}}.

get(10001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("圣心城"),
               condition = [], width = 5461, height = 4096,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1630, 1580}]}};
get(10002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("月痕海岸"),
               condition = [], width = 3889, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{2898, 1402}]}};
get(10003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("飞瀑村"),
               condition = [], width = 3328, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1642, 1612}]}};
get(10004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("精灵之森"),
               condition = [], width = 3413, height = 2730,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1818, 1236}]}};
get(10007 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("极北之域"),
               condition = [], width = 2048, height = 3300,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1421, 1744}]}};
get(10008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("穹顶通道"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{387, 1715}]}};
get(10009 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("失落神殿"),
               condition = [], width = 3584, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1843, 1382}]}};
get(20001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("魔法研究室"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{387, 1715}]}};
get(20002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("位面中转站"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1688, 1723}]}};
get(20003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("中土花果山"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{754, 1366}]}};
get(20004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("熔岩地狱"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1290, 1830}]}};
get(20005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("精灵遗迹"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1688, 1723}]}};
get(20006 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("水帘洞天"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{754, 1366}]}};
get(20007 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("水帘洞天"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{754, 1366}]}};
get(20008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("遗忘洞穴"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1617, 1834}]}};
get(21004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("熔岩爆裂"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{736, 1090}]}};
get(22004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("熔岩之怒"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1429, 442}]}};
get(30001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("公会领地"),
               condition = [], width = 3992, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{2219, 1014}]}};
get(30002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("婚礼"),
               condition = [], width = 2048, height = 1707,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{818, 1352}]}};
get(30003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("时空段位赛"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("巅峰战场"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("巅峰战场准备厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30006 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("备战大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("公会战"),
               condition = [], width = 3992, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 999,
               startup = 0, is_single = 0, revive = [{2219, 1014}]}};
get(30009 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("部落大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30010 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("联盟大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30011 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("荣耀战场"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(30012 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("家园"),
               condition = [], width = 2304, height = 1536,
               grid_x = 20, grid_y = 20, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1615, 1064}]}};
get(30013 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("家园"),
               condition = [], width = 3220, height = 2048,
               grid_x = 20, grid_y = 20, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{2376, 1384}]}};
get(30014 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("淘气南瓜"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{1543, 1148}]}};
get(30015 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("淘气南瓜"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 1, is_single = 0, revive = [{1543, 1148}]}};
get(30016 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("诸神战场"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(40000 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("雪球大战"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1450, 1051}]}};
get(41001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("天空之塔一"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1450, 1051}]}};
get(41002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("天空之塔二"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1450, 1051}]}};
get(41003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("天空之塔三"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1450, 1051}]}};
get(42000 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("夺宝招募厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1450, 1051}]}};
get(42001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海1层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海2层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海3层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海4层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海5层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42006 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海6层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42007 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海7层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海8层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42009 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海9层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42010 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深海10层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1587, 1624}]}};
get(42100 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("挑战者大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1450, 1051}]}};
get(50001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深蓝之洲一"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{423, 560}]}};
get(50002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深蓝之洲二"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{423, 560}]}};
get(50003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("深蓝之洲三"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1315, 512}]}};
get(50011 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("迷梦树界一"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1177, 1539}]}};
get(50012 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("迷梦树界二"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1177, 1539}]}};
get(50013 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("迷梦树界三"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 0, revive = [{1177, 1539}]}};
get(50021 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("冰霜遗迹一"),
               condition = [], width = 2731, height = 2731,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{983, 902}]}};
get(50022 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("冰霜遗迹二"),
               condition = [], width = 2731, height = 2731,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{983, 902}]}};
get(50023 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("冰霜遗迹三"),
               condition = [], width = 2731, height = 2731,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{983, 902}]}};
get(50031 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("精灵遗迹一"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{754, 1366}]}};
get(50032 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("精灵遗迹二"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{754, 1366}]}};
get(50033 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("精灵遗迹三"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{754, 1366}]}};
get(51000 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("战场准备区"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(51001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("勇士战场"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{2039, 1520}]}};
get(51010 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("冒险秘境"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1679, 582}]}};
get(51020 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("孔明灯会"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1986, 1191}]}};
get(51021 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("飞瀑村赏月"),
               condition = [], width = 3328, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1642, 1612}]}};
get(52000 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("决赛赛场"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{387, 1715}]}};
get(52001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("峡谷之巅"),
               condition = [], width = 4608, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 200,
               startup = 0, is_single = 0, revive = [{2312, 1463}]}};
get(52002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("峡谷准备区"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(53001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("答题对决"),
               condition = [], width = 2389, height = 1024,
               grid_x = 30, grid_y = 30, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1903, 584}]}};
get(53002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("准备大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(53003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("钻石联赛"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(53004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("钻石联赛"),
               condition = [], width = 3413, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{454, 1625}]}};
get(53005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("元素之域"),
               condition = [], width = 2731, height = 1365,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1167, 723}]}};
get(53006 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("宝阁入口"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 1, is_single = 0, revive = [{1786, 1501}]}};
get(53007 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("玲珑宝阁外阁"),
               condition = [], width = 3072, height = 1365,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1191, 692}]}};
get(53008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("玲珑宝阁内阁"),
               condition = [], width = 3072, height = 1365,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{401, 949}]}};
get(53009 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("魔龙巢穴"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{328, 1730}]}};
get(53010 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("峡谷入口"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1786, 1501}]}};
get(53011 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("诸神殿堂"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1786, 1501}]}};
get(53012 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("准备大厅"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(53013 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("冲顶答题"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{2038, 1520}]}};
get(53014 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("跨服擂台"),
               condition = [], width = 3072, height = 1707,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1495, 703}]}};
get(53015 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("天启试炼"),
               condition = [], width = 2731, height = 1707,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1167, 723}]}};
get(60001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("极寒试炼"),
               condition = [], width = 2048, height = 3300,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 1, is_single = 1, revive = [{1561, 2965}]}};
get(70001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第5层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1383, 1675}]}};
get(70002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第2层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{371, 480}]}};
get(70003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第3层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{595, 1643}]}};
get(70004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第4层"),
               condition = [], width = 2731, height = 2731,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1337, 1249}]}};
get(70005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第1层"),
               condition = [], width = 3992, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{2219, 1014}]}};
get(70006 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第6层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{931, 1123}]}};
get(70007 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第7层"),
               condition = [], width = 2048, height = 3300,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1421, 1744}]}};
get(70008 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第8层"),
               condition = [], width = 3413, height = 2730,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1818, 1236}]}};
get(70009 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第9层"),
               condition = [], width = 3328, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{1717, 1545}]}};
get(70010 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第10层"),
               condition = [], width = 3889, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{2898, 1402}]}};
get(70011 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第12层"),
               condition = [], width = 5461, height = 4096,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1932, 1780}]}};
get(70012 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹准备区"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1986, 1191}]}};
get(70013 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("幻境准备室2"),
               condition = [], width = 3328, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 120,
               startup = 0, is_single = 0, revive = [{1717, 1545}]}};
get(70014 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("彩虹第11层"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{946, 1138}]}};
get(71000 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("幻境入口"),
               condition = [], width = 3328, height = 3072,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1642, 1612}]}};
get(71001 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("水之幻境"),
               condition = [], width = 3413, height = 2730,
               grid_x = 40, grid_y = 40, max_pre_layer = 60,
               startup = 0, is_single = 0, revive = [{1818, 1236}]}};
get(71002 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("木之幻境"),
               condition = [], width = 2048, height = 2048,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{754, 1366}]}};
get(71003 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("雪之幻境"),
               condition = [], width = 2731, height = 2731,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{983, 902}]}};
get(71004 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("幻境争霸"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1986, 1191}]}};
get(71005 = Id) ->
    {ok,
     #map_data{id = Id, name = lang:get("幻境准备区"),
               condition = [], width = 4096, height = 2560,
               grid_x = 40, grid_y = 40, max_pre_layer = 90,
               startup = 0, is_single = 0, revive = [{1986, 1191}]}};
get(_ = Id) -> {error, {map_data_not_exists, Id}}.

