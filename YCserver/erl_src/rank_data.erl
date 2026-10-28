-file("src/data/rank_data.erl", 1).

-module(rank_data).

-export([get_reward/1, get_honor/1]).

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

-file("src/data/rank_data.erl", 17).

get_reward({1, 1}) ->
    {{[15]},
     [#{s_idx => 1, e_idx => 10, items => [{22580, 1}],
        title => lang:get("等级排名奖励"),
        content =>
            lang:get("恭喜你在等级排行榜中名次前10，获得开服活动-等级排行榜的奖励，再接再厉哦！")}]};
get_reward({30, 1}) ->
    {{[15]},
     [#{s_idx => 1, e_idx => 10, items => [{22581, 1}],
        title => lang:get("竞技排名奖励"),
        content =>
            lang:get("恭喜你在竞技场排行榜中名次前10，获得开服活动-竞技排行榜的奖励，再接再厉哦！")}]};
get_reward({2, 1}) ->
    {{[15]},
     [#{s_idx => 1, e_idx => 10, items => [{22582, 1}],
        title => lang:get("宠物排名奖励"),
        content =>
            lang:get("恭喜你在宠物排行榜中名次前10，获得开服活动-宠物排行榜的奖励，再接再厉哦！")}]};
get_reward({20, 1}) ->
    {{[15]},
     [#{s_idx => 1, e_idx => 10,
        items => [{22583, 1}, {29341, 1}],
        title => lang:get("综合实力排名奖励"),
        content =>
            lang:get("恭喜你在综合实力排行榜中名次前10，获得开服活动-综合实力排行榜的奖励，再接再厉哦！")}]};
get_reward({4, 1}) ->
    {{[14]},
     [#{s_idx => 1, e_idx => 10, items => [{22584, 1}],
        title => lang:get("人气排名奖励"),
        content =>
            lang:get("恭喜你在人气排行榜中名次前10，获得开服活动-人气排行榜的奖励，再接再厉哦！")}]};
get_reward(_) -> false.

get_honor({39, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11069, s_idx => 1, e_idx => 1}]};
get_honor({33, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11049, s_idx => 1, e_idx => 10}]};
get_honor({34, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11050, s_idx => 1, e_idx => 10}]};
get_honor({35, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11051, s_idx => 1, e_idx => 10}]};
get_honor({36, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11052, s_idx => 1, e_idx => 10}]};
get_honor({38, 2}) ->
    {{[1, 2, 3, 4, 5, 6, 7]},
     [#{honor_id => 11057, s_idx => 1, e_idx => 1}]};
get_honor({1, 1}) ->
    {{[15]},
     [#{honor_id => 11038, s_idx => 1, e_idx => 1}]};
get_honor({30, 1}) ->
    {{[15]},
     [#{honor_id => 11002, s_idx => 1, e_idx => 1}]};
get_honor({2, 1}) ->
    {{[15]},
     [#{honor_id => 11039, s_idx => 1, e_idx => 1}]};
get_honor({20, 1}) ->
    {{[15]},
     [#{honor_id => 11054, s_idx => 1, e_idx => 1}]};
get_honor({4, 1}) ->
    {{[14]},
     [#{honor_id => 11041, s_idx => 1, e_idx => 1}]};
get_honor(_) -> false.

