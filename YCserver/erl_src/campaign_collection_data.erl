-file("src/data/campaign_collection_data.erl", 1).

-module(campaign_collection_data).

-export([random_list/0,
         get_recycle/1,
         get_login_reward/1,
         get_recharge_reward/0,
         get_random_cost/0,
         get_box_reward/0,
         get_flower_info/1,
         get_all_flowers/0,
         get_roll_end_gift/0]).

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

-file("src/data/campaign_collection_data.erl", 23).

-file("inc/camp_sign.hrl", 1).

-record(camp_sign,
        {date = {0, 0, 0}, num = 0, camp_id = 0}).

-record(camp_sign_data,
        {num = 0, item_list = [], cost = []}).

-file("src/data/campaign_collection_data.erl", 24).

random_list() ->
    [{25030, 1, 120},
     {25031, 1, 120},
     {25032, 1, 80},
     {25033, 1, 120},
     {25034, 1, 120},
     {25035, 1, 120},
     {25036, 1, 80},
     {25037, 1, 120},
     {25038, 1, 120},
     {25030, 2, 120},
     {25031, 2, 120},
     {25032, 2, 80},
     {25033, 2, 120},
     {25034, 2, 120},
     {25035, 2, 120},
     {25036, 2, 80},
     {25037, 2, 120},
     {25038, 2, 120},
     {25030, 3, 120},
     {25031, 3, 120},
     {25032, 3, 80},
     {25033, 3, 120},
     {25034, 3, 120},
     {25035, 3, 120},
     {25036, 3, 80},
     {25037, 3, 120},
     {25038, 3, 120},
     {25030, 4, 120},
     {25031, 4, 120},
     {25032, 4, 80},
     {25033, 4, 120},
     {25034, 4, 120},
     {25035, 4, 120},
     {25036, 4, 80},
     {25037, 4, 120},
     {25038, 4, 120},
     {25030, 5, 120},
     {25031, 5, 120},
     {25032, 5, 80},
     {25033, 5, 120},
     {25034, 5, 120},
     {25035, 5, 120},
     {25036, 5, 80},
     {25037, 5, 120},
     {25038, 5, 120},
     {25030, 6, 120},
     {25031, 6, 120},
     {25032, 6, 80},
     {25033, 6, 120},
     {25034, 6, 120},
     {25035, 6, 120},
     {25036, 6, 80},
     {25037, 6, 120},
     {25038, 6, 120},
     {25030, 7, 120},
     {25031, 7, 120},
     {25032, 7, 80},
     {25033, 7, 120},
     {25034, 7, 120},
     {25035, 7, 120},
     {25036, 7, 80},
     {25037, 7, 120},
     {25038, 7, 120}].

get_recycle(1) -> [{90000, 200000}];
get_recycle(2) -> [{90000, 400000}];
get_recycle(3) -> [{90000, 600000}];
get_recycle(4) -> [{90000, 800000}];
get_recycle(5) -> [{90000, 1000000}];
get_recycle(6) -> [{90000, 1200000}];
get_recycle(7) -> [{90000, 1400000}];
get_recycle(8) -> [{90000, 1600000}];
get_recycle(9) -> [{90000, 1800000}];
get_recycle(10) -> [{90000, 2000000}];
get_recycle(11) -> [{90000, 2200000}];
get_recycle(12) -> [{90000, 2400000}];
get_recycle(13) -> [{90000, 2600000}];
get_recycle(14) -> [{90000, 2800000}];
get_recycle(15) -> [{90000, 3000000}];
get_recycle(16) -> [{90000, 3200000}];
get_recycle(17) -> [{90000, 3400000}];
get_recycle(18) -> [{90000, 3600000}];
get_recycle(19) -> [{90000, 3800000}];
get_recycle(20) -> [{90000, 4000000}];
get_recycle(21) -> [{90000, 4200000}];
get_recycle(22) -> [{90000, 4400000}];
get_recycle(23) -> [{90000, 4600000}];
get_recycle(24) -> [{90000, 4800000}];
get_recycle(25) -> [{90000, 5000000}];
get_recycle(26) -> [{90000, 5200000}];
get_recycle(27) -> [{90000, 5400000}];
get_recycle(28) -> [{90000, 5600000}];
get_recycle(29) -> [{90000, 5800000}];
get_recycle(30) -> [{90000, 6000000}];
get_recycle(31) -> [{90000, 6200000}];
get_recycle(32) -> [{90000, 6400000}];
get_recycle(33) -> [{90000, 6600000}];
get_recycle(34) -> [{90000, 6800000}];
get_recycle(35) -> [{90000, 7000000}];
get_recycle(36) -> [{90000, 7200000}];
get_recycle(37) -> [{90000, 7400000}];
get_recycle(38) -> [{90000, 7600000}];
get_recycle(39) -> [{90000, 7800000}];
get_recycle(40) -> [{90000, 8000000}];
get_recycle(41) -> [{90000, 8200000}];
get_recycle(42) -> [{90000, 8400000}];
get_recycle(43) -> [{90000, 8600000}];
get_recycle(44) -> [{90000, 8800000}];
get_recycle(45) -> [{90000, 9000000}];
get_recycle(46) -> [{90000, 9200000}];
get_recycle(47) -> [{90000, 9400000}];
get_recycle(48) -> [{90000, 9600000}];
get_recycle(49) -> [{90000, 9800000}];
get_recycle(50) -> [{90000, 10000000}];
get_recycle(_) -> [].

get_login_reward(1) -> 30;
get_login_reward(2) -> 30;
get_login_reward(3) -> 30;
get_login_reward(4) -> 30;
get_login_reward(5) -> 30;
get_login_reward(6) -> 30;
get_login_reward(7) -> 30;
get_login_reward(8) -> 30;
get_login_reward(9) -> 30;
get_login_reward(10) -> 30;
get_login_reward(_) -> 0.

get_recharge_reward() -> [{80, 80}].

get_random_cost() -> [{90048, 100}].

get_box_reward() ->
    [{20617, 1, 1, 200, 0, 1, 2, 1500, 988, 100},
     {29101, 3, 1, 200, 0, 1, 2, 1500, 988, 100},
     {71148, 1, 1, 200, 0, 1, 2, 1800, 1088, 100},
     {22453, 1, 1, 200, 0, 1, 2, 1800, 1088, 100}].

get_flower_info(25030) ->
    {lang:get("玫瑰"), lang:get("祝你获得浪漫与爱情"), 1};
get_flower_info(25031) ->
    {lang:get("蔷薇"), lang:get("自尊和坚强与你相伴"), 2};
get_flower_info(25032) ->
    {lang:get("梅花"), lang:get("高雅的气质让你与众不同"), 3};
get_flower_info(25033) ->
    {lang:get("紫鸢"), lang:get("暗恋的对象也仰慕你哦"), 4};
get_flower_info(25034) ->
    {lang:get("郁金香"), lang:get("悠悠郁金香浓浓挚爱情"), 5};
get_flower_info(25035) ->
    {lang:get("百合"), lang:get("最美好祝福给最美好的你"), 6};
get_flower_info(25036) ->
    {lang:get("兰花"), lang:get("高洁和贤德与你为伍"), 7};
get_flower_info(25037) ->
    {lang:get("紫罗兰"), lang:get("永恒的美与爱相随"), 8};
get_flower_info(25038) ->
    {lang:get("樱花"), lang:get("希望的爱恋永不割舍"), 9};
get_flower_info(_) -> [].

get_all_flowers() ->
    [{25030, 1},
     {25031, 2},
     {25032, 3},
     {25033, 4},
     {25034, 5},
     {25035, 6},
     {25036, 7},
     {25037, 8},
     {25038, 9}].

get_roll_end_gift() -> [{23285, 1}].

