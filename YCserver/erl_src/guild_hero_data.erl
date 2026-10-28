-file("src/data/guild_hero_data.erl", 1).

-module(guild_hero_data).

-export([get_box_reward/1,
         list_by_group/1,
         get_cross_group/1]).

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

-file("src/data/guild_hero_data.erl", 16).

get_box_reward(79665) ->
    [#{box_id => 79665, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 21220, item_num => 2,
       item_name => lang:get("秘宝锤"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 160,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 128,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 33,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 26,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20008, item_num => 1,
       item_name => lang:get("+7强化保护卷"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79665, item_id => 20007, item_num => 1,
       item_name => lang:get("资质丸"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79665, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1}];
get_box_reward(79666) ->
    [#{box_id => 79666, item_id => 20006, item_num => 8,
       item_name => lang:get("星辰精华"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 21220, item_num => 2,
       item_name => lang:get("秘宝锤"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 160,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 124,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20074, item_num => 1,
       item_name => lang:get("星辰重置丹"), item_weight => 33,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 26,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20008, item_num => 1,
       item_name => lang:get("+7强化保护卷"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79666, item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20010, item_num => 1,
       item_name => lang:get("+9强化保护卷"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79666, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1}];
get_box_reward(_) -> false.

list_by_group(1) ->
    [{"local", 1}, {"local", 2}, {"local", 3}];
list_by_group(2) -> [{"dev", 1}, {"dev", 2}];
list_by_group(3) -> [{"beta", 17}, {"beta", 33}];
list_by_group(30) -> [{"mix", 49}, {"mix", 1}];
list_by_group(52) -> [{"unite", 1}, {"unite", 65}];
list_by_group(53) -> [{"mix", 113}, {"mix", 177}];
list_by_group(60) -> [{"mix", 241}, {"unite", 129}];
list_by_group(44) -> [{"mix", 305}, {"unite", 225}];
list_by_group(54) -> [{"mix", 337}, {"unite", 257}];
list_by_group(45) -> [{"unite", 289}, {"unite", 305}];
list_by_group(59) -> [{"unite", 321}, {"unite", 329}];
list_by_group(41) -> [{"mix", 385}, {"unite", 337}];
list_by_group(66) -> [{"mix", 393}, {"unite", 345}];
list_by_group(56) -> [{"mix", 401}, {"unite", 357}];
list_by_group(70) -> [{"unite", 359}, {"unite", 361}];
list_by_group(71) -> [{"mix", 405}, {"unite", 363}];
list_by_group(65) -> [{"mix", 409}, {"unite", 365}];
list_by_group(67) -> [{"mix", 411}, {"unite", 367}];
list_by_group(69) -> [{"mix", 413}, {"unite", 369}];
list_by_group(72) -> [{"mix", 415}, {"unite", 371}];
list_by_group(73) -> [{"mix", 416}, {"unite", 372}];
list_by_group(74) -> [{"mix", 417}, {"unite", 373}];
list_by_group(75) -> [{"mix", 418}, {"unite", 374}];
list_by_group(_) -> [].

get_cross_group({"local", 1}) -> 1;
get_cross_group({"local", 2}) -> 1;
get_cross_group({"local", 3}) -> 1;
get_cross_group({"dev", 1}) -> 2;
get_cross_group({"dev", 2}) -> 2;
get_cross_group({"beta", 17}) -> 3;
get_cross_group({"beta", 33}) -> 3;
get_cross_group({"mix", 49}) -> 30;
get_cross_group({"mix", 1}) -> 30;
get_cross_group({"unite", 1}) -> 52;
get_cross_group({"unite", 65}) -> 52;
get_cross_group({"mix", 113}) -> 53;
get_cross_group({"mix", 177}) -> 53;
get_cross_group({"mix", 241}) -> 60;
get_cross_group({"unite", 129}) -> 60;
get_cross_group({"mix", 305}) -> 44;
get_cross_group({"unite", 225}) -> 44;
get_cross_group({"mix", 337}) -> 54;
get_cross_group({"unite", 257}) -> 54;
get_cross_group({"unite", 289}) -> 45;
get_cross_group({"unite", 305}) -> 45;
get_cross_group({"unite", 321}) -> 59;
get_cross_group({"unite", 329}) -> 59;
get_cross_group({"mix", 385}) -> 41;
get_cross_group({"unite", 337}) -> 41;
get_cross_group({"mix", 393}) -> 66;
get_cross_group({"unite", 345}) -> 66;
get_cross_group({"mix", 401}) -> 56;
get_cross_group({"unite", 357}) -> 56;
get_cross_group({"unite", 359}) -> 70;
get_cross_group({"unite", 361}) -> 70;
get_cross_group({"mix", 405}) -> 71;
get_cross_group({"unite", 363}) -> 71;
get_cross_group({"mix", 409}) -> 65;
get_cross_group({"unite", 365}) -> 65;
get_cross_group({"mix", 411}) -> 67;
get_cross_group({"unite", 367}) -> 67;
get_cross_group({"mix", 413}) -> 69;
get_cross_group({"unite", 369}) -> 69;
get_cross_group({"mix", 415}) -> 72;
get_cross_group({"unite", 371}) -> 72;
get_cross_group({"mix", 416}) -> 73;
get_cross_group({"unite", 372}) -> 73;
get_cross_group({"mix", 417}) -> 74;
get_cross_group({"unite", 373}) -> 74;
get_cross_group({"mix", 418}) -> 75;
get_cross_group({"unite", 374}) -> 75;
get_cross_group(_) -> false.

