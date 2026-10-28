-file("src/data/campaign_rank_data.erl", 1).

-module(campaign_rank_data).

-export([ids/0, get/1, get_rank/1, get_reward/1]).

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

-file("src/data/campaign_rank_data.erl", 18).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/data/campaign_rank_data.erl", 19).

ids() -> [1, 10, 11, 12, 13, 14, 2, 3, 5, 6, 7, 8, 9].

get(1) ->
    #campaign_rank_data{id = 1, sec_type = 60019, num = 100,
                        min_val = 699, title = lang:get("亲密排行公示"),
                        content =
                            lang:get("亲密排行活动已圆满结束，在大家的见证下，以下玩家获得了<color='#ffff00'>爱"
                                     "神的恩典</color>，同时也祝福游戏里的所有眷侣永结同心，相伴百年#name#\n"),
                        desc = lang:get("亲密度"),
                        cast =
                            lang:get("爱，不用承包整个池塘，但要大声说出来！情深与意重，请话与君知！#name#勇敢的表达了他们"
                                     "的爱情，勇夺亲密排行前三甲，让我们为他们的爱情鼓掌，愿他们得一人之心，白首永不相离。"),
                        cast_rank = 3};
get(2) ->
    #campaign_rank_data{id = 2, sec_type = 60020, num = 100,
                        min_val = 2, title = lang:get("英雄擂台排行公示"),
                        content =
                            lang:get("英雄擂台排行活动已圆满结束，以下玩家奋勇拼搏，获得了<color='#ffff00'>星辰"
                                     "擂主</color>的称号#name#\n"),
                        desc = lang:get("段位"),
                        cast =
                            lang:get("英雄擂台排行活动圆满结束。#name#祝贺他们夺得了星辰擂主的称号！愿他们成为星辰世界最英"
                                     "勇的守护者！"),
                        cast_rank = 3, merge_flag = 1};
get(3) ->
    #campaign_rank_data{id = 3, sec_type = 60021, num = 100,
                        min_val = 4000, title = lang:get("70级装备评分排行公示"),
                        content =
                            lang:get("70级装备评分排行活动已圆满结束，以下玩家千锤百炼，锻造出评分世界排名前三的神装，获得了<"
                                     "color='#ffff00'>极品装备</color>，祝福所有勇士身披铠甲，所向披靡#"
                                     "name#\n"),
                        desc = lang:get("评分"),
                        cast =
                            lang:get("装备评分排行活动圆满结束#name#恭喜他们勇夺70级装备排行前三甲，并获得了极品装备的奖励！"),
                        cast_rank = 3, merge_flag = 1};
get(5) ->
    #campaign_rank_data{id = 5, sec_type = 60023, num = 100,
                        min_val = 3, title = lang:get("武道大会排行公示"),
                        content =
                            lang:get("武道大会排行活动已圆满结束，以下玩家奋勇拼搏，取得段位前3的好成绩，获得了<color='"
                                     "#ffff00'>大神</color>的称号#name#\n"),
                        desc = lang:get("段位"),
                        cast =
                            lang:get("武道大会排行活动圆满结束。#name#恭喜他们勇夺武道会排行前三甲，成为一代大神。"),
                        cast_rank = 3, merge_flag = 1};
get(6) ->
    #campaign_rank_data{id = 6, sec_type = 60024, num = 100,
                        min_val = 4000, title = lang:get("75级宠物排行公示"),
                        content =
                            lang:get("75级宠物排行活动已圆满结束，以下玩家的萌宠脱颖而出，获得了<color='#ffff00"
                                     "'>萌宠的恩赐</color>，同时也祝福游戏里的所有勇士与爱宠永远不离不弃，相伴左右#n"
                                     "ame#\n"),
                        desc = lang:get("评分"),
                        cast =
                            lang:get("宠物排行活动圆满结束#name#恭喜他们勇夺75级宠物排行前三甲，愿他与爱宠继续携手作战，"
                                     "相伴永远。"),
                        cast_rank = 3, merge_flag = 1};
get(7) ->
    #campaign_rank_data{id = 7, sec_type = 60025, num = 100,
                        min_val = 700, title = lang:get("翅膀排行公示"),
                        content =
                            lang:get("翅膀排行活动已圆满结束，以下玩家苦心修炼，获得了<color='#ffff00'>圣天使<"
                                     "/color>的称号#name#\n"),
                        desc = lang:get("评分"),
                        cast =
                            lang:get("翅膀排行活动圆满结束#name#恭喜他们勇夺翅膀排行前三甲，未来还有更广阔的天空等待着他去"
                                     "自由翱翔。"),
                        cast_rank = 3, merge_flag = 1};
get(8) ->
    #campaign_rank_data{id = 8, sec_type = 60026, num = 100,
                        min_val = 1000, title = lang:get("坐骑排行公示"),
                        content =
                            lang:get("坐骑排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("评分"),
                        cast = lang:get("坐骑排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(9) ->
    #campaign_rank_data{id = 9, sec_type = 60027, num = 100,
                        min_val = 100, title = lang:get("家园排行公示"),
                        content =
                            lang:get("家园排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("评分"),
                        cast = lang:get("家园排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(10) ->
    #campaign_rank_data{id = 10, sec_type = 60028,
                        num = 100, min_val = 2400, title = lang:get("竞技场排行公示"),
                        content =
                            lang:get("竞技场排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("评分"),
                        cast = lang:get("竞技场排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(11) ->
    #campaign_rank_data{id = 11, sec_type = 60029,
                        num = 100, min_val = 1350, title = lang:get("宝石排行公示"),
                        content =
                            lang:get("宝石排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("评分"),
                        cast = lang:get("宝石排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(12) ->
    #campaign_rank_data{id = 12, sec_type = 60030,
                        num = 100, min_val = 4700, title = lang:get("装备排行公示"),
                        content =
                            lang:get("装备排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("评分"),
                        cast = lang:get("装备排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(13) ->
    #campaign_rank_data{id = 13, sec_type = 60032,
                        num = 100, min_val = 50, title = lang:get("寻宝排行公示"),
                        content =
                            lang:get("寻宝排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("寻宝积分"),
                        cast = lang:get("寻宝排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(14) ->
    #campaign_rank_data{id = 14, sec_type = 60052,
                        num = 100, min_val = 1000, title = lang:get("累消排行公示"),
                        content =
                            lang:get("累消排行活动已圆满结束，以下玩家获得了前三甲的奖励！#name#\n"),
                        desc = lang:get("消费钻石"),
                        cast = lang:get("累消排行活动圆满结束#name#恭喜他们勇夺排行前三甲！"),
                        cast_rank = 3, merge_flag = 1};
get(_) -> false.

get_rank({60019, Val}) when Val >= 1 andalso Val =< 1 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 1,
                           sec_type = 60019,
                           item_list =
                               [{23401, 0, 1}, {70324, 0, 2}, {90026, 0, 999}],
                           title = lang:get("亲密排行奖励"),
                           content = lang:get("以下是您参与亲密排行活动获得的奖励，祝你们恩爱百年，永不分离"),
                           limit = 699};
get_rank({60019, Val}) when Val >= 2 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 2, max_rank = 3,
                           sec_type = 60019,
                           item_list =
                               [{23403, 0, 1}, {70324, 0, 1}, {90026, 0, 520}],
                           title = lang:get("亲密排行奖励"),
                           content = lang:get("以下是您参与亲密排行活动获得的奖励，祝你们恩爱百年，永不分离"),
                           limit = 699};
get_rank({60019, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60019,
                           item_list = [{90026, 0, 99}, {70324, 0, 1}],
                           title = lang:get("亲密排行奖励"),
                           content = lang:get("以下是您参与亲密排行活动获得的奖励，祝你们恩爱百年，永不分离"),
                           limit = 699};
get_rank({60020, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60020,
                           item_list =
                               [{22770, 0, 1}, {90020, 0, 50}, {20014, 0, 1}],
                           title = lang:get("星辰擂台排行奖励"),
                           content = lang:get("您参与英雄擂台排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2};
get_rank({60020, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60020,
                           item_list = [{90020, 0, 25}, {20053, 0, 1}],
                           title = lang:get("星辰擂台排行奖励"),
                           content = lang:get("您参与英雄擂台排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2};
get_rank({60020, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60020,
                           item_list = [{90020, 0, 15}, {20075, 0, 1}],
                           title = lang:get("星辰擂台排行奖励"),
                           content = lang:get("您参与英雄擂台排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2};
get_rank({60020, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60020,
                           item_list = [{90020, 0, 10}, {20087, 0, 1}],
                           title = lang:get("星辰擂台排行奖励"),
                           content = lang:get("您参与英雄擂台排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2};
get_rank({60021, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60021,
                           item_list =
                               [{90026, 0, 888}, {24148, 0, 1}, {20022, 0, 12}],
                           title = lang:get("70级装备排行奖励"),
                           content = lang:get("您参与70级装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60021, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60021,
                           item_list =
                               [{90026, 0, 500}, {22372, 0, 1}, {20022, 0, 9}],
                           title = lang:get("70级装备排行奖励"),
                           content = lang:get("您参与70级装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60021, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60021,
                           item_list = [{90026, 0, 288}, {20022, 0, 6}],
                           title = lang:get("70级装备排行奖励"),
                           content = lang:get("您参与70级装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60021, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60021,
                           item_list = [{90026, 0, 188}, {20022, 0, 3}],
                           title = lang:get("70级装备排行奖励"),
                           content = lang:get("您参与70级装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60023, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60023,
                           item_list =
                               [{23405, 0, 1}, {90020, 0, 50}, {20014, 0, 1}],
                           title = lang:get("武道大会排行奖励"),
                           content = lang:get("您参与武道大会排行活动获得第~ts名，以下是您的奖励"),
                           limit = 3};
get_rank({60023, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60023,
                           item_list = [{90020, 0, 25}, {20053, 0, 1}],
                           title = lang:get("武道大会排行奖励"),
                           content = lang:get("您参与武道大会排行活动获得第~ts名，以下是您的奖励"),
                           limit = 3};
get_rank({60023, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60023,
                           item_list = [{90020, 0, 15}, {20075, 0, 1}],
                           title = lang:get("武道大会排行奖励"),
                           content = lang:get("您参与武道大会排行活动获得第~ts名，以下是您的奖励"),
                           limit = 3};
get_rank({60023, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60023,
                           item_list = [{90020, 0, 10}, {20087, 0, 1}],
                           title = lang:get("武道大会排行奖励"),
                           content = lang:get("您参与武道大会排行活动获得第~ts名，以下是您的奖励"),
                           limit = 3};
get_rank({60024, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60024,
                           item_list =
                               [{90026, 0, 888}, {29101, 0, 3}, {20617, 0, 1}],
                           title = lang:get("75级宠物排行奖励"),
                           content = lang:get("您参与75级宠物排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60024, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60024,
                           item_list =
                               [{90026, 0, 500}, {29101, 0, 2}, {20076, 0, 1}],
                           title = lang:get("75级宠物排行奖励"),
                           content = lang:get("您参与75级宠物排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60024, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60024,
                           item_list =
                               [{90026, 0, 288}, {20616, 0, 1}, {20006, 0, 50}],
                           title = lang:get("75级宠物排行奖励"),
                           content = lang:get("您参与75级宠物排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60024, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60024,
                           item_list =
                               [{90026, 0, 188}, {20545, 0, 3}, {20006, 0, 20}],
                           title = lang:get("75级宠物排行奖励"),
                           content = lang:get("您参与75级宠物排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4000};
get_rank({60025, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60025,
                           item_list =
                               [{22771, 0, 1}, {21102, 0, 3}, {21130, 0, 5}],
                           title = lang:get("翅膀排行奖励"),
                           content = lang:get("您参与翅膀排行活动获得第~ts名，以下是您的奖励"),
                           limit = 700};
get_rank({60025, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60025,
                           item_list = [{21102, 0, 2}, {21130, 0, 3}],
                           title = lang:get("翅膀排行奖励"),
                           content = lang:get("您参与翅膀排行活动获得第~ts名，以下是您的奖励"),
                           limit = 700};
get_rank({60025, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60025,
                           item_list = [{21102, 0, 1}, {21130, 0, 2}],
                           title = lang:get("翅膀排行奖励"),
                           content = lang:get("您参与翅膀排行活动获得第~ts名，以下是您的奖励"),
                           limit = 700};
get_rank({60025, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60025,
                           item_list = [{21101, 0, 1}, {21130, 0, 1}],
                           title = lang:get("翅膀排行奖励"),
                           content = lang:get("您参与翅膀排行活动获得第~ts名，以下是您的奖励"),
                           limit = 700};
get_rank({60026, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60026,
                           item_list =
                               [{22772, 0, 1}, {23660, 0, 3}, {23556, 0, 20}],
                           title = lang:get("坐骑排行奖励"),
                           content = lang:get("您参与坐骑排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1000};
get_rank({60026, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60026,
                           item_list = [{23660, 0, 2}, {23556, 0, 15}],
                           title = lang:get("坐骑排行奖励"),
                           content = lang:get("您参与坐骑排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1000};
get_rank({60026, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60026,
                           item_list = [{23554, 0, 5}, {23556, 0, 10}],
                           title = lang:get("坐骑排行奖励"),
                           content = lang:get("您参与坐骑排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1000};
get_rank({60026, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60026,
                           item_list = [{23554, 0, 3}, {23556, 0, 8}],
                           title = lang:get("坐骑排行奖励"),
                           content = lang:get("您参与坐骑排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1000};
get_rank({60027, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60027,
                           item_list =
                               [{28079, 0, 1},
                                {90026, 0, 388},
                                {90000, 0, 1000000}],
                           title = lang:get("家园排行奖励"),
                           content = lang:get("您参与家园排行活动获得第~ts名，以下是您的奖励"),
                           limit = 100};
get_rank({60027, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60027,
                           item_list =
                               [{28029, 0, 1},
                                {90026, 0, 188},
                                {90000, 0, 800000}],
                           title = lang:get("家园排行奖励"),
                           content = lang:get("您参与家园排行活动获得第~ts名，以下是您的奖励"),
                           limit = 100};
get_rank({60027, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60027,
                           item_list =
                               [{28062, 0, 1},
                                {90026, 0, 88},
                                {90000, 0, 500000}],
                           title = lang:get("家园排行奖励"),
                           content = lang:get("您参与家园排行活动获得第~ts名，以下是您的奖励"),
                           limit = 100};
get_rank({60027, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60027,
                           item_list = [{28059, 0, 1}, {90000, 0, 300000}],
                           title = lang:get("家园排行奖励"),
                           content = lang:get("您参与家园排行活动获得第~ts名，以下是您的奖励"),
                           limit = 100};
get_rank({60028, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60028,
                           item_list =
                               [{90026, 0, 500}, {22300, 0, 1}, {22253, 0, 15}],
                           title = lang:get("竞技场排行奖励"),
                           content = lang:get("您参与竞技场排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2400};
get_rank({60028, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60028,
                           item_list = [{20053, 0, 1}, {22253, 0, 10}],
                           title = lang:get("竞技场排行奖励"),
                           content = lang:get("您参与竞技场排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2400};
get_rank({60028, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60028,
                           item_list = [{22400, 0, 30}, {20075, 0, 1}],
                           title = lang:get("竞技场排行奖励"),
                           content = lang:get("您参与竞技场排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2400};
get_rank({60028, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60028,
                           item_list = [{22400, 0, 20}, {20087, 0, 1}],
                           title = lang:get("竞技场排行奖励"),
                           content = lang:get("您参与竞技场排行活动获得第~ts名，以下是您的奖励"),
                           limit = 2400};
get_rank({60029, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60029,
                           item_list =
                               [{90026, 0, 888}, {22585, 0, 5}, {21098, 0, 20}],
                           title = lang:get("宝石排行奖励"),
                           content = lang:get("您参与宝石排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1350};
get_rank({60029, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60029,
                           item_list =
                               [{90026, 0, 300}, {22585, 0, 3}, {21098, 0, 20}],
                           title = lang:get("宝石排行奖励"),
                           content = lang:get("您参与宝石排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1350};
get_rank({60029, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60029,
                           item_list =
                               [{90026, 0, 188}, {22585, 0, 1}, {21098, 0, 10}],
                           title = lang:get("宝石排行奖励"),
                           content = lang:get("您参与宝石排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1350};
get_rank({60029, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60029,
                           item_list = [{20034, 0, 3}, {21098, 0, 5}],
                           title = lang:get("宝石排行奖励"),
                           content = lang:get("您参与宝石排行活动获得第~ts名，以下是您的奖励"),
                           limit = 1350};
get_rank({60030, Val}) when Val >= 1 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 3,
                           sec_type = 60030,
                           item_list =
                               [{90026, 0, 888}, {22375, 0, 1}, {20022, 0, 3}],
                           title = lang:get("装备排行奖励"),
                           content = lang:get("您参与装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4700};
get_rank({60030, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60030,
                           item_list =
                               [{90026, 0, 300}, {22376, 0, 1}, {20021, 0, 6}],
                           title = lang:get("装备排行奖励"),
                           content = lang:get("您参与装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4700};
get_rank({60030, Val})
    when Val >= 11 andalso Val =< 20 ->
    #camp_rank_reward_data{min_rank = 11, max_rank = 20,
                           sec_type = 60030,
                           item_list = [{90026, 0, 288}, {20021, 0, 3}],
                           title = lang:get("装备排行奖励"),
                           content = lang:get("您参与装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4700};
get_rank({60030, Val})
    when Val >= 21 andalso Val =< 30 ->
    #camp_rank_reward_data{min_rank = 21, max_rank = 30,
                           sec_type = 60030,
                           item_list = [{90026, 0, 188}, {20020, 0, 10}],
                           title = lang:get("装备排行奖励"),
                           content = lang:get("您参与装备排行活动获得第~ts名，以下是您的奖励"),
                           limit = 4700};
get_rank({60032, Val}) when Val >= 1 andalso Val =< 1 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 1,
                           sec_type = 60032,
                           item_list =
                               [{22782, 0, 1}, {90026, 0, 888}, {22248, 0, 3}],
                           title = lang:get("寻宝排行奖励"),
                           content = lang:get("您参与寻宝排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank({60032, Val}) when Val >= 2 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 2, max_rank = 3,
                           sec_type = 60032,
                           item_list =
                               [{22783, 0, 1}, {90026, 0, 588}, {22248, 0, 2}],
                           title = lang:get("寻宝排行奖励"),
                           content = lang:get("您参与寻宝排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank({60032, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60032,
                           item_list = [{90026, 0, 288}, {22248, 0, 1}],
                           title = lang:get("寻宝排行奖励"),
                           content = lang:get("您参与寻宝排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank({60052, Val}) when Val >= 1 andalso Val =< 1 ->
    #camp_rank_reward_data{min_rank = 1, max_rank = 1,
                           sec_type = 60052,
                           item_list =
                               [{70486, 0, 1, 1},
                                {23632, 0, 3, 1},
                                {90026, 0, 1888, 0}],
                           title = lang:get("累消排行奖励"),
                           content =
                               lang:get("恭喜您豪气冲天，在初冬活动参与累计消费排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank({60052, Val}) when Val >= 2 andalso Val =< 3 ->
    #camp_rank_reward_data{min_rank = 2, max_rank = 3,
                           sec_type = 60052,
                           item_list =
                               [{70486, 0, 1, 1},
                                {23632, 0, 2, 1},
                                {90026, 0, 888, 0}],
                           title = lang:get("累消排行奖励"),
                           content =
                               lang:get("恭喜您豪气冲天，在初冬活动参与累计消费排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank({60052, Val})
    when Val >= 4 andalso Val =< 10 ->
    #camp_rank_reward_data{min_rank = 4, max_rank = 10,
                           sec_type = 60052,
                           item_list = [{23632, 0, 1, 1}, {90026, 0, 288, 0}],
                           title = lang:get("累消排行奖励"),
                           content =
                               lang:get("恭喜您豪气冲天，在初冬活动参与累计消费排行活动获得第~ts名，以下是您的奖励"),
                           limit = 50};
get_rank(_) -> false.

get_reward({60019, 99}) ->
    #camp_rank_self_reward_data{sec_type = 60019, num = 99,
                                item_list = [{20006, 0, 10}, {90018, 0, 99}]};
get_reward({60019, 699}) ->
    #camp_rank_self_reward_data{sec_type = 60019, num = 699,
                                item_list =
                                    [{29143, 0, 1},
                                     {29058, 0, 2},
                                     {90018, 0, 365}]};
get_reward({60019, 3999}) ->
    #camp_rank_self_reward_data{sec_type = 60019,
                                num = 3999,
                                item_list =
                                    [{23216, 0, 1},
                                     {22216, 0, 1},
                                     {90018, 0, 520}]};
get_reward({60019, 9999}) ->
    #camp_rank_self_reward_data{sec_type = 60019,
                                num = 9999,
                                item_list =
                                    [{29314, 0, 1},
                                     {71413, 0, 1},
                                     {90018, 0, 999}]};
get_reward({60020, 3}) ->
    #camp_rank_self_reward_data{sec_type = 60020, num = 3,
                                item_list = [{90020, 0, 3}, {20025, 0, 1}]};
get_reward({60020, 4}) ->
    #camp_rank_self_reward_data{sec_type = 60020, num = 4,
                                item_list = [{90020, 0, 5}, {20025, 0, 1}]};
get_reward({60020, 5}) ->
    #camp_rank_self_reward_data{sec_type = 60020, num = 5,
                                item_list = [{90020, 0, 10}, {22216, 0, 1}]};
get_reward({60021, 3700}) ->
    #camp_rank_self_reward_data{sec_type = 60021,
                                num = 3700,
                                item_list = [{20020, 0, 2}, {20034, 0, 1}]};
get_reward({60021, 4000}) ->
    #camp_rank_self_reward_data{sec_type = 60021,
                                num = 4000,
                                item_list = [{20021, 0, 3}, {20034, 0, 3}]};
get_reward({60021, 4300}) ->
    #camp_rank_self_reward_data{sec_type = 60021,
                                num = 4300,
                                item_list = [{20022, 0, 3}, {22585, 0, 1}]};
get_reward({60023, 2}) ->
    #camp_rank_self_reward_data{sec_type = 60023, num = 2,
                                item_list = [{90020, 0, 3}, {20025, 0, 1}]};
get_reward({60023, 4}) ->
    #camp_rank_self_reward_data{sec_type = 60023, num = 4,
                                item_list = [{90020, 0, 5}, {20025, 0, 3}]};
get_reward({60023, 6}) ->
    #camp_rank_self_reward_data{sec_type = 60023, num = 6,
                                item_list = [{90020, 0, 10}, {22216, 0, 1}]};
get_reward({60024, 3800}) ->
    #camp_rank_self_reward_data{sec_type = 60024,
                                num = 3800,
                                item_list = [{20618, 0, 2}, {20006, 0, 10}]};
get_reward({60024, 4000}) ->
    #camp_rank_self_reward_data{sec_type = 60024,
                                num = 4000,
                                item_list = [{29101, 0, 1}, {20006, 0, 20}]};
get_reward({60024, 4250}) ->
    #camp_rank_self_reward_data{sec_type = 60024,
                                num = 4250,
                                item_list = [{29100, 0, 1}, {20006, 0, 30}]};
get_reward({60025, 690}) ->
    #camp_rank_self_reward_data{sec_type = 60025, num = 690,
                                item_list = [{21100, 0, 1}, {20000, 0, 1}]};
get_reward({60025, 710}) ->
    #camp_rank_self_reward_data{sec_type = 60025, num = 710,
                                item_list = [{21101, 0, 1}, {20000, 0, 3}]};
get_reward({60025, 730}) ->
    #camp_rank_self_reward_data{sec_type = 60025, num = 730,
                                item_list = [{21102, 0, 1}, {20000, 0, 5}]};
get_reward({60026, 1000}) ->
    #camp_rank_self_reward_data{sec_type = 60026,
                                num = 1000,
                                item_list = [{23556, 0, 1}, {23555, 0, 3}]};
get_reward({60026, 1500}) ->
    #camp_rank_self_reward_data{sec_type = 60026,
                                num = 1500,
                                item_list = [{23550, 0, 1}, {23556, 0, 3}]};
get_reward({60026, 2000}) ->
    #camp_rank_self_reward_data{sec_type = 60026,
                                num = 2000,
                                item_list = [{23554, 0, 1}, {23556, 0, 5}]};
get_reward({60027, 100}) ->
    #camp_rank_self_reward_data{sec_type = 60027, num = 100,
                                item_list =
                                    [{28007, 0, 1}, {90000, 0, 100000}]};
get_reward({60027, 200}) ->
    #camp_rank_self_reward_data{sec_type = 60027, num = 200,
                                item_list =
                                    [{28039, 0, 1}, {90000, 0, 200000}]};
get_reward({60027, 300}) ->
    #camp_rank_self_reward_data{sec_type = 60027, num = 300,
                                item_list =
                                    [{28002, 0, 1}, {90000, 0, 300000}]};
get_reward({60028, 2400}) ->
    #camp_rank_self_reward_data{sec_type = 60028,
                                num = 2400,
                                item_list = [{90012, 0, 10}, {29104, 0, 1}]};
get_reward({60028, 2500}) ->
    #camp_rank_self_reward_data{sec_type = 60028,
                                num = 2500,
                                item_list = [{90012, 0, 30}, {29104, 0, 2}]};
get_reward({60028, 2550}) ->
    #camp_rank_self_reward_data{sec_type = 60028,
                                num = 2550,
                                item_list = [{90012, 0, 50}, {29104, 0, 3}]};
get_reward({60029, 1000}) ->
    #camp_rank_self_reward_data{sec_type = 60029,
                                num = 1000,
                                item_list = [{20034, 0, 1}, {21098, 0, 1}]};
get_reward({60029, 1100}) ->
    #camp_rank_self_reward_data{sec_type = 60029,
                                num = 1100,
                                item_list = [{20034, 0, 3}, {21098, 0, 3}]};
get_reward({60029, 1200}) ->
    #camp_rank_self_reward_data{sec_type = 60029,
                                num = 1200,
                                item_list = [{22585, 0, 1}, {21098, 0, 5}]};
get_reward({60030, 4700}) ->
    #camp_rank_self_reward_data{sec_type = 60030,
                                num = 4700,
                                item_list = [{20020, 0, 2}, {20021, 0, 1}]};
get_reward({60030, 4900}) ->
    #camp_rank_self_reward_data{sec_type = 60030,
                                num = 4900,
                                item_list = [{20021, 0, 3}, {20020, 0, 5}]};
get_reward({60030, 5100}) ->
    #camp_rank_self_reward_data{sec_type = 60030,
                                num = 5100,
                                item_list = [{20021, 0, 5}, {20020, 0, 8}]};
get_reward({60032, 20}) ->
    #camp_rank_self_reward_data{sec_type = 60032, num = 20,
                                item_list = [{21220, 0, 3}, {20006, 0, 10}]};
get_reward({60032, 50}) ->
    #camp_rank_self_reward_data{sec_type = 60032, num = 50,
                                item_list = [{29143, 0, 3}, {20025, 0, 1}]};
get_reward({60032, 200}) ->
    #camp_rank_self_reward_data{sec_type = 60032, num = 200,
                                item_list = [{22249, 0, 1}, {22216, 0, 1}]};
get_reward({60032, 600}) ->
    #camp_rank_self_reward_data{sec_type = 60032, num = 600,
                                item_list = [{22248, 0, 1}, {29314, 0, 1}]};
get_reward({60052, 300}) ->
    #camp_rank_self_reward_data{sec_type = 60052, num = 300,
                                item_list =
                                    [{20774, 0, 1, 1, 1, 200},
                                     {20000, 0, 3, 0, 1, 200},
                                     {20006, 0, 20, 0, 1, 200}]};
get_reward({60052, 1000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 1000,
                                item_list =
                                    [{20053, 0, 1, 1, 1, 200},
                                     {22585, 0, 2, 0, 1, 200},
                                     {20005, 0, 5, 0, 1, 200}]};
get_reward({60052, 2500}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 2500,
                                item_list =
                                    [{20616, 0, 1, 0, 1, 200},
                                     {20075, 0, 1, 0, 1, 200},
                                     {20774, 0, 1, 1, 1, 200}]};
get_reward({60052, 5000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 5000,
                                item_list =
                                    [{22300, 0, 1, 1, 1, 200},
                                     {20545, 0, 3, 0, 1, 79},
                                     {23556, 0, 10, 0, 80, 200},
                                     {23752, 0, 3, 0, 1, 200}]};
get_reward({60052, 8000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 8000,
                                item_list =
                                    [{23740, 0, 2, 1, 1, 200},
                                     {22585, 0, 5, 0, 1, 79},
                                     {21098, 0, 20, 0, 80, 200},
                                     {22212, 0, 5, 1, 1, 200},
                                     {20774, 0, 1, 1, 1, 200}]};
get_reward({60052, 12000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 12000,
                                item_list =
                                    [{22443, 0, 2, 1, 1, 200},
                                     {20032, 0, 1, 1, 1, 200},
                                     {20023, 0, 1, 1, 1, 74},
                                     {21244, 0, 1, 0, 75, 89},
                                     {21256, 0, 1, 1, 90, 200},
                                     {22216, 0, 2, 0, 1, 200},
                                     {20006, 0, 50, 0, 1, 200}]};
get_reward({60052, 25000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 25000,
                                item_list =
                                    [{20774, 0, 3, 1, 1, 200},
                                     {20617, 0, 1, 1, 1, 200},
                                     {20076, 0, 1, 0, 1, 200},
                                     {29314, 0, 3, 0, 1, 200},
                                     {22617, 0, 1, 1, 1, 200}]};
get_reward({60052, 50000}) ->
    #camp_rank_self_reward_data{sec_type = 60052,
                                num = 50000,
                                item_list =
                                    [{20638, 0, 1, 1, 1, 200},
                                     {70077, 0, 1, 1, 1, 200},
                                     {29041, 0, 1, 1, 1, 84},
                                     {21245, 0, 1, 0, 85, 200},
                                     {20022, 0, 10, 0, 1, 79},
                                     {22306, 0, 10, 0, 80, 200},
                                     {20006, 0, 100, 0, 1, 200}]};
get_reward(_) -> false.

