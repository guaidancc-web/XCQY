-file("src/data/campaign_bags_data.erl", 1).

-module(campaign_bags_data).

-export([list/0, get/1, get_box/1]).

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

-file("src/data/campaign_bags_data.erl", 16).

list() ->
    [{27000, 150},
     {27001, 150},
     {27002, 100},
     {27003, 150},
     {27004, 150},
     {27005, 150},
     {27006, 100},
     {27007, 50}].

get(27000) ->
    #{id => 27000, need => 3, name => lang:get("罗宾的认可"),
      weight => 150, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 300};
get(27001) ->
    #{id => 27001, need => 3, name => lang:get("小月的认可"),
      weight => 150, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 300};
get(27002) ->
    #{id => 27002, need => 1, name => lang:get("风之旅人的认可"),
      weight => 100, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 750};
get(27003) ->
    #{id => 27003, need => 3, name => lang:get("菲菲的认可"),
      weight => 150, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 300};
get(27004) ->
    #{id => 27004, need => 3, name => lang:get("波芘的认可"),
      weight => 150, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 300};
get(27005) ->
    #{id => 27005, need => 3, name => lang:get("德林的认可"),
      weight => 150, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 300};
get(27006) ->
    #{id => 27006, need => 1, name => lang:get("飞镰的认可"),
      weight => 100, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 750};
get(27007) ->
    #{id => 27007, need => 1, name => lang:get("精灵长老的认可"),
      weight => 50, reward_fill => [],
      reward_full => [{27008, 1}], fill_exp_rate => 1500};
get(_) -> false.

get_box(27000) ->
    [#{item_id => 20006, num => 5, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 20004, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 1000,
       show_ratio => 1000, is_cast => 0}];
get_box(27001) ->
    [#{item_id => 20006, num => 5, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 180,
       show_ratio => 180, is_cast => 1},
     #{item_id => 20087, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 0},
     #{item_id => 20004, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 1000,
       show_ratio => 1000, is_cast => 0}];
get_box(27002) ->
    [#{item_id => 20006, num => 8, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 150,
       show_ratio => 150, is_cast => 0},
     #{item_id => 20005, num => 2, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 2, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 60,
       show_ratio => 60, is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 10,
       show_ratio => 10, is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20091, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 250,
       show_ratio => 250, is_cast => 0}];
get_box(27003) ->
    [#{item_id => 20006, num => 5, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 20004, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 1000,
       show_ratio => 1000, is_cast => 0}];
get_box(27004) ->
    [#{item_id => 20006, num => 5, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 20004, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 1000,
       show_ratio => 1000, is_cast => 0}];
get_box(27005) ->
    [#{item_id => 20006, num => 5, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 20004, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 1000,
       show_ratio => 1000, is_cast => 0}];
get_box(27006) ->
    [#{item_id => 20006, num => 8, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 150,
       show_ratio => 150, is_cast => 0},
     #{item_id => 20005, num => 2, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 2, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 60,
       show_ratio => 60, is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 10,
       show_ratio => 10, is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20091, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 0, num => 0, ratio => 250,
       show_ratio => 250, is_cast => 0}];
get_box(27007) ->
    [#{item_id => 20006, num => 10, ratio => 200,
       show_ratio => 200, is_cast => 0},
     #{item_id => 20000, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20005, num => 3, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 90,
       show_ratio => 90, is_cast => 0},
     #{item_id => 20025, num => 2, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 21220, num => 3, ratio => 180,
       show_ratio => 180, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 20038, num => 1, ratio => 10,
       show_ratio => 10, is_cast => 1},
     #{item_id => 20020, num => 2, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 20021, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0}];
get_box(_) -> [].

