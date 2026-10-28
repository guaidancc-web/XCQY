-file("src/data/question_match_data.erl", 1).

-module(question_match_data).

-export([get_reward/1, get_rank_reward/1]).

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

-file("src/data/question_match_data.erl", 17).

get_reward(1) -> {66019, 3357};
get_reward(0) -> {66019, 3358};
get_reward(_) -> false.

get_rank_reward(Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{item_list => [], honor => 11115,
      title => lang:get("智慧对决奖励"),
      content => lang:get("恭喜您在本日智慧对决中取得第一名，获得[星辰学霸]称号奖励")};
get_rank_reward(Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{item_list => [], honor => 11115,
      title => lang:get("智慧对决奖励"),
      content => lang:get("恭喜您在本日智慧对决中取得第二名，获得[星辰学霸]称号奖励")};
get_rank_reward(Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{item_list => [], honor => 11115,
      title => lang:get("智慧对决奖励"),
      content => lang:get("恭喜您在本日智慧对决中取得第三名，获得[星辰学霸]称号奖励")};
get_rank_reward(_) -> false.

