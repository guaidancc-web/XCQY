-file("src/data/pray_data.erl", 1).

-module(pray_data).

-export([get/1,
         get_cost/1,
         get_item_reward/1,
         list_buff/0,
         get_pray_buff/1,
         get_item_info/1]).

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

-file("src/data/pray_data.erl", 19).

get(1) ->
    #{id => 1, name => lang:get("疾风"), upratio => 0,
      ratio => 1000, buff_lv => 1, min_cnt => 0,
      max_cnt => 0};
get(2) ->
    #{id => 2, name => lang:get("秘林"), upratio => 1000,
      ratio => 1000, buff_lv => 2, min_cnt => 0,
      max_cnt => 0};
get(3) ->
    #{id => 3, name => lang:get("天火"), upratio => 400,
      ratio => 1000, buff_lv => 3, min_cnt => 1,
      max_cnt => 1};
get(4) ->
    #{id => 4, name => lang:get("山岳"), upratio => 180,
      ratio => 1000, buff_lv => 4, min_cnt => 1,
      max_cnt => 1};
get(5) ->
    #{id => 5, name => lang:get("星魂"), upratio => 120,
      ratio => 1000, buff_lv => 5, min_cnt => 1,
      max_cnt => 1};
get(Id) -> {none, Id}.

get_cost(Count) when Count >= 1 andalso Count =< 1 ->
    {coin, 20000};
get_cost(Count) when Count >= 2 andalso Count =< 2 ->
    {coin, 30000};
get_cost(Count) when Count >= 3 andalso Count =< 3 ->
    {gold_bind, 500};
get_cost(Count) when Count >= 4 andalso Count =< 4 ->
    {gold_bind, 600};
get_cost(Count) when Count >= 5 andalso Count =< 5 ->
    {gold, 20};
get_cost(Count) when Count >= 6 andalso Count =< 6 ->
    {gold, 40};
get_cost(Count)
    when Count >= 7 andalso Count =< 100000 ->
    {gold, 80};
get_cost(_) -> false.

get_item_reward(3) ->
    [#{item_id => 21220, is_bind => 0, count => 1,
       ratio => 500, classes => 0, level_limit => 1,
       is_hearsay => 0},
     #{item_id => 20005, is_bind => 0, count => 1,
       ratio => 200, classes => 0, level_limit => 1,
       is_hearsay => 0},
     #{item_id => 29143, is_bind => 0, count => 1,
       ratio => 100, classes => 0, level_limit => 1,
       is_hearsay => 0},
     #{item_id => 20025, is_bind => 0, count => 1,
       ratio => 100, classes => 0, level_limit => 1,
       is_hearsay => 0},
     #{item_id => 20020, is_bind => 0, count => 1,
       ratio => 100, classes => 0, level_limit => 1,
       is_hearsay => 0}];
get_item_reward(4) ->
    [#{item_id => 20054, is_bind => 0, count => 1,
       ratio => 245, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20055, is_bind => 0, count => 1,
       ratio => 245, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20056, is_bind => 0, count => 1,
       ratio => 245, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20057, is_bind => 0, count => 1,
       ratio => 245, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20616, is_bind => 0, count => 1,
       ratio => 20, classes => 0, level_limit => 1,
       is_hearsay => 1}];
get_item_reward(5) ->
    [#{item_id => 20616, is_bind => 0, count => 1,
       ratio => 350, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20617, is_bind => 0, count => 1,
       ratio => 60, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20095, is_bind => 0, count => 1,
       ratio => 290, classes => 0, level_limit => 1,
       is_hearsay => 1},
     #{item_id => 20053, is_bind => 0, count => 1,
       ratio => 300, classes => 0, level_limit => 1,
       is_hearsay => 1}];
get_item_reward(_) -> [].

list_buff() ->
    [12000,
     12001,
     12010,
     12011,
     12020,
     12021,
     12030,
     12031,
     12040,
     12041,
     12050,
     12051,
     12060,
     12061,
     12070,
     12071,
     12080,
     12090,
     12091,
     12110,
     12111,
     12112,
     12120,
     12130,
     12131,
     12132,
     12140,
     12141,
     12150,
     12171,
     12181,
     12191,
     12201,
     12211,
     12220,
     12230].

get_pray_buff(12000) ->
    #{buff_id => 12000, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12010) ->
    #{buff_id => 12010, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12030) ->
    #{buff_id => 12030, buff_lv => 2, ratio => 10,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12040) ->
    #{buff_id => 12040, buff_lv => 2, ratio => 10,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12050) ->
    #{buff_id => 12050, buff_lv => 2, ratio => 10,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12060) ->
    #{buff_id => 12060, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12070) ->
    #{buff_id => 12070, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12201) ->
    #{buff_id => 12201, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12211) ->
    #{buff_id => 12211, buff_lv => 2, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12020) ->
    #{buff_id => 12020, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12031) ->
    #{buff_id => 12031, buff_lv => 3, ratio => 15,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12041) ->
    #{buff_id => 12041, buff_lv => 3, ratio => 15,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12051) ->
    #{buff_id => 12051, buff_lv => 3, ratio => 15,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12061) ->
    #{buff_id => 12061, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12080) ->
    #{buff_id => 12080, buff_lv => 3, ratio => 0,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12090) ->
    #{buff_id => 12090, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12110) ->
    #{buff_id => 12110, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12130) ->
    #{buff_id => 12130, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12140) ->
    #{buff_id => 12140, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12150) ->
    #{buff_id => 12150, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12171) ->
    #{buff_id => 12171, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12181) ->
    #{buff_id => 12181, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12191) ->
    #{buff_id => 12191, buff_lv => 3, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12001) ->
    #{buff_id => 12001, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12011) ->
    #{buff_id => 12011, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12071) ->
    #{buff_id => 12071, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12111) ->
    #{buff_id => 12111, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12120) ->
    #{buff_id => 12120, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12131) ->
    #{buff_id => 12131, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12230) ->
    #{buff_id => 12230, buff_lv => 4, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12021) ->
    #{buff_id => 12021, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12091) ->
    #{buff_id => 12091, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12112) ->
    #{buff_id => 12112, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12132) ->
    #{buff_id => 12132, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12141) ->
    #{buff_id => 12141, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(12220) ->
    #{buff_id => 12220, buff_lv => 5, ratio => 50,
      lasttime => 7200, is_hearsay => 0};
get_pray_buff(Id) -> {none, Id}.

get_item_info({3, 21220}) ->
    #{count => 1, is_bind => 0, is_hearsay => 0};
get_item_info({3, 20005}) ->
    #{count => 1, is_bind => 0, is_hearsay => 0};
get_item_info({3, 29143}) ->
    #{count => 1, is_bind => 0, is_hearsay => 0};
get_item_info({3, 20025}) ->
    #{count => 1, is_bind => 0, is_hearsay => 0};
get_item_info({3, 20020}) ->
    #{count => 1, is_bind => 0, is_hearsay => 0};
get_item_info({4, 20054}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({4, 20055}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({4, 20056}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({4, 20057}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({4, 20616}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({5, 20616}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({5, 20617}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({5, 20095}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info({5, 20053}) ->
    #{count => 1, is_bind => 0, is_hearsay => 1};
get_item_info(_) -> false.

