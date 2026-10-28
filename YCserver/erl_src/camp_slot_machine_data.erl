-file("src/data/camp_slot_machine_data.erl", 1).

-module(camp_slot_machine_data).

-export([get_reward_list/1,
         get_guarantee/1,
         get_group_reward/1,
         get_count_ratio/0,
         get_group_item/0,
         get_cost/1]).

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

-file("src/data/camp_slot_machine_data.erl", 18).

get_reward_list(1) ->
    [#{index => 1, item_id => 22442, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 22205, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 23771, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 20638, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 70210, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 70202, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, guarantee_ring => 250, min_times => 1,
       max_times => 2},
     #{index => 1, item_id => 70196, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, guarantee_ring => 250, min_times => 1,
       max_times => 2},
     #{index => 1, item_id => 20617, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 29041, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 22443, num => 1, ratio => 72,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 23740, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 70212, num => 1, ratio => 50,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 20755, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 29101, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 70213, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 20014, num => 1, ratio => 5,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1},
     #{index => 1, item_id => 20616, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20075, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20046, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 90026, num => 500, ratio => 24,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20089, num => 1, ratio => 24,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 22216, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 22396, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0},
     #{index => 1, item_id => 21098, num => 5, ratio => 80,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20006, num => 15, ratio => 100,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20087, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20002, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 20022, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0},
     #{index => 1, item_id => 22307, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 29102, num => 1, ratio => 60,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 22595, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 29046, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 29989, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 29990, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0},
     #{index => 1, item_id => 29991, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0}];
get_reward_list(2) ->
    [#{index => 2, item_id => 22442, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 2, item_id => 22205, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, guarantee_ring => 100, min_times => 1,
       max_times => 1, ratio_ch => 0},
     #{index => 2, item_id => 23771, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 20638, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 70210, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 2, item_id => 70202, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 2, item_id => 70196, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 2, item_id => 20617, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 29041, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 22443, num => 1, ratio => 72,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 23740, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 70212, num => 1, ratio => 50,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 20755, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 29101, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 70213, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 2, item_id => 20014, num => 1, ratio => 5,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 2, item_id => 20616, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20075, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20046, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 90026, num => 500, ratio => 24,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20089, num => 1, ratio => 24,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 22216, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 22396, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 21098, num => 5, ratio => 80,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20006, num => 15, ratio => 100,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 0},
     #{index => 2, item_id => 20087, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20002, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 20022, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 22307, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 29102, num => 1, ratio => 60,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 22595, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 29046, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 29989, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 29990, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 2, item_id => 29991, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000}];
get_reward_list(3) ->
    [#{index => 3, item_id => 22442, num => 1, ratio => 8,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, guarantee_ring => 125, min_times => 1,
       max_times => 1, ratio_ch => 0},
     #{index => 3, item_id => 22205, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 3, item_id => 23771, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 20638, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 70210, num => 1, ratio => 2,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 3, item_id => 70202, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 3, item_id => 70196, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 3, item_id => 20617, num => 1, ratio => 3,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 29041, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 22443, num => 1, ratio => 72,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 23740, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 70212, num => 1, ratio => 50,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 20755, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 29101, num => 1, ratio => 10,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 70213, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 1000},
     #{index => 3, item_id => 20014, num => 1, ratio => 5,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 1, ratio_ch => 0},
     #{index => 3, item_id => 20616, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20075, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20046, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 90026, num => 500, ratio => 26,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20089, num => 1, ratio => 24,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 22216, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 22396, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 21098, num => 5, ratio => 80,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20006, num => 15, ratio => 100,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 0},
     #{index => 3, item_id => 20087, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20002, num => 1, ratio => 80,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 20022, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 1, max_lev => 79,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 22307, num => 1, ratio => 30,
       sex => 2, classes => 0, min_lev => 80, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 29102, num => 1, ratio => 60,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 22595, num => 1, ratio => 70,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 29046, num => 1, ratio => 20,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 29989, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 29990, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000},
     #{index => 3, item_id => 29991, num => 1, ratio => 0,
       sex => 2, classes => 0, min_lev => 1, max_lev => 200,
       is_hearsay => 0, ratio_ch => 1000}];
get_reward_list(_) -> [].

get_guarantee({1, 22442}) ->
    #{index => 1, item_id => 22442, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 22205}) ->
    #{index => 1, item_id => 22205, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 23771}) ->
    #{index => 1, item_id => 23771, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 20638}) ->
    #{index => 1, item_id => 20638, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 70210}) ->
    #{index => 1, item_id => 70210, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 70202}) ->
    #{index => 1, item_id => 70202, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, guarantee_ring => 250, min_times => 1,
      max_times => 2};
get_guarantee({1, 70196}) ->
    #{index => 1, item_id => 70196, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, guarantee_ring => 250, min_times => 1,
      max_times => 2};
get_guarantee({1, 20617}) ->
    #{index => 1, item_id => 20617, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 29041}) ->
    #{index => 1, item_id => 29041, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 22443}) ->
    #{index => 1, item_id => 22443, num => 1, ratio => 72,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 23740}) ->
    #{index => 1, item_id => 23740, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 70212}) ->
    #{index => 1, item_id => 70212, num => 1, ratio => 50,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 20755}) ->
    #{index => 1, item_id => 20755, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 29101}) ->
    #{index => 1, item_id => 29101, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 70213}) ->
    #{index => 1, item_id => 70213, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 20014}) ->
    #{index => 1, item_id => 20014, num => 1, ratio => 5,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1};
get_guarantee({1, 20616}) ->
    #{index => 1, item_id => 20616, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20075}) ->
    #{index => 1, item_id => 20075, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20046}) ->
    #{index => 1, item_id => 20046, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 90026}) ->
    #{index => 1, item_id => 90026, num => 500, ratio => 24,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20089}) ->
    #{index => 1, item_id => 20089, num => 1, ratio => 24,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 22216}) ->
    #{index => 1, item_id => 22216, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 22396}) ->
    #{index => 1, item_id => 22396, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0};
get_guarantee({1, 21098}) ->
    #{index => 1, item_id => 21098, num => 5, ratio => 80,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20006}) ->
    #{index => 1, item_id => 20006, num => 15, ratio => 100,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20087}) ->
    #{index => 1, item_id => 20087, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20002}) ->
    #{index => 1, item_id => 20002, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 20022}) ->
    #{index => 1, item_id => 20022, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0};
get_guarantee({1, 22307}) ->
    #{index => 1, item_id => 22307, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 29102}) ->
    #{index => 1, item_id => 29102, num => 1, ratio => 60,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 22595}) ->
    #{index => 1, item_id => 22595, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 29046}) ->
    #{index => 1, item_id => 29046, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 29989}) ->
    #{index => 1, item_id => 29989, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 29990}) ->
    #{index => 1, item_id => 29990, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({1, 29991}) ->
    #{index => 1, item_id => 29991, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0};
get_guarantee({2, 22442}) ->
    #{index => 2, item_id => 22442, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({2, 22205}) ->
    #{index => 2, item_id => 22205, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, guarantee_ring => 100, min_times => 1,
      max_times => 1, ratio_ch => 0};
get_guarantee({2, 23771}) ->
    #{index => 2, item_id => 23771, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 20638}) ->
    #{index => 2, item_id => 20638, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 70210}) ->
    #{index => 2, item_id => 70210, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({2, 70202}) ->
    #{index => 2, item_id => 70202, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({2, 70196}) ->
    #{index => 2, item_id => 70196, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({2, 20617}) ->
    #{index => 2, item_id => 20617, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 29041}) ->
    #{index => 2, item_id => 29041, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 22443}) ->
    #{index => 2, item_id => 22443, num => 1, ratio => 72,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 23740}) ->
    #{index => 2, item_id => 23740, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 70212}) ->
    #{index => 2, item_id => 70212, num => 1, ratio => 50,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 20755}) ->
    #{index => 2, item_id => 20755, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 29101}) ->
    #{index => 2, item_id => 29101, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 70213}) ->
    #{index => 2, item_id => 70213, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({2, 20014}) ->
    #{index => 2, item_id => 20014, num => 1, ratio => 5,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({2, 20616}) ->
    #{index => 2, item_id => 20616, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20075}) ->
    #{index => 2, item_id => 20075, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20046}) ->
    #{index => 2, item_id => 20046, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 90026}) ->
    #{index => 2, item_id => 90026, num => 500, ratio => 24,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20089}) ->
    #{index => 2, item_id => 20089, num => 1, ratio => 24,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 22216}) ->
    #{index => 2, item_id => 22216, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 22396}) ->
    #{index => 2, item_id => 22396, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 21098}) ->
    #{index => 2, item_id => 21098, num => 5, ratio => 80,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20006}) ->
    #{index => 2, item_id => 20006, num => 15, ratio => 100,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 0};
get_guarantee({2, 20087}) ->
    #{index => 2, item_id => 20087, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20002}) ->
    #{index => 2, item_id => 20002, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 20022}) ->
    #{index => 2, item_id => 20022, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 22307}) ->
    #{index => 2, item_id => 22307, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 29102}) ->
    #{index => 2, item_id => 29102, num => 1, ratio => 60,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 22595}) ->
    #{index => 2, item_id => 22595, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 29046}) ->
    #{index => 2, item_id => 29046, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 29989}) ->
    #{index => 2, item_id => 29989, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 29990}) ->
    #{index => 2, item_id => 29990, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({2, 29991}) ->
    #{index => 2, item_id => 29991, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 22442}) ->
    #{index => 3, item_id => 22442, num => 1, ratio => 8,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, guarantee_ring => 125, min_times => 1,
      max_times => 1, ratio_ch => 0};
get_guarantee({3, 22205}) ->
    #{index => 3, item_id => 22205, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({3, 23771}) ->
    #{index => 3, item_id => 23771, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 20638}) ->
    #{index => 3, item_id => 20638, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 70210}) ->
    #{index => 3, item_id => 70210, num => 1, ratio => 2,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({3, 70202}) ->
    #{index => 3, item_id => 70202, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({3, 70196}) ->
    #{index => 3, item_id => 70196, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({3, 20617}) ->
    #{index => 3, item_id => 20617, num => 1, ratio => 3,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 29041}) ->
    #{index => 3, item_id => 29041, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 22443}) ->
    #{index => 3, item_id => 22443, num => 1, ratio => 72,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 23740}) ->
    #{index => 3, item_id => 23740, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 70212}) ->
    #{index => 3, item_id => 70212, num => 1, ratio => 50,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 20755}) ->
    #{index => 3, item_id => 20755, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 29101}) ->
    #{index => 3, item_id => 29101, num => 1, ratio => 10,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 70213}) ->
    #{index => 3, item_id => 70213, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 1000};
get_guarantee({3, 20014}) ->
    #{index => 3, item_id => 20014, num => 1, ratio => 5,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 1, ratio_ch => 0};
get_guarantee({3, 20616}) ->
    #{index => 3, item_id => 20616, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20075}) ->
    #{index => 3, item_id => 20075, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20046}) ->
    #{index => 3, item_id => 20046, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 90026}) ->
    #{index => 3, item_id => 90026, num => 500, ratio => 26,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20089}) ->
    #{index => 3, item_id => 20089, num => 1, ratio => 24,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 22216}) ->
    #{index => 3, item_id => 22216, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 22396}) ->
    #{index => 3, item_id => 22396, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 21098}) ->
    #{index => 3, item_id => 21098, num => 5, ratio => 80,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20006}) ->
    #{index => 3, item_id => 20006, num => 15, ratio => 100,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 0};
get_guarantee({3, 20087}) ->
    #{index => 3, item_id => 20087, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20002}) ->
    #{index => 3, item_id => 20002, num => 1, ratio => 80,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 20022}) ->
    #{index => 3, item_id => 20022, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 1, max_lev => 79,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 22307}) ->
    #{index => 3, item_id => 22307, num => 1, ratio => 30,
      sex => 2, classes => 0, min_lev => 80, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 29102}) ->
    #{index => 3, item_id => 29102, num => 1, ratio => 60,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 22595}) ->
    #{index => 3, item_id => 22595, num => 1, ratio => 70,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 29046}) ->
    #{index => 3, item_id => 29046, num => 1, ratio => 20,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 29989}) ->
    #{index => 3, item_id => 29989, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 29990}) ->
    #{index => 3, item_id => 29990, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee({3, 29991}) ->
    #{index => 3, item_id => 29991, num => 1, ratio => 0,
      sex => 2, classes => 0, min_lev => 1, max_lev => 200,
      is_hearsay => 0, ratio_ch => 1000};
get_guarantee(_) -> false.

get_group_reward({29991, 29991, 29991}) ->
    {[{22442, 1}], 1};
get_group_reward({29990, 29990, 29990}) ->
    {[{22205, 1}], 1};
get_group_reward({29989, 29989, 29989}) ->
    {[{20617, 1}], 1};
get_group_reward({29991, 29991, 29990}) ->
    {[{70213, 1}], 1};
get_group_reward({29991, 29991, 29989}) ->
    {[{23740, 1}], 1};
get_group_reward({29990, 29990, 29991}) ->
    {[{22443, 1}], 1};
get_group_reward({29990, 29990, 29989}) ->
    {[{70212, 1}], 0};
get_group_reward({29989, 29989, 29991}) ->
    {[{70214, 1}], 0};
get_group_reward({29989, 29989, 29990}) ->
    {[{70215, 1}], 0};
get_group_reward({29991, 29990, 29991}) ->
    {[{70213, 1}], 1};
get_group_reward({29991, 29989, 29991}) ->
    {[{23740, 1}], 1};
get_group_reward({29990, 29991, 29990}) ->
    {[{22443, 1}], 1};
get_group_reward({29990, 29989, 29990}) ->
    {[{70212, 1}], 1};
get_group_reward({29989, 29991, 29989}) ->
    {[{70214, 1}], 1};
get_group_reward({29989, 29990, 29989}) ->
    {[{70215, 1}], 1};
get_group_reward({29990, 29991, 29991}) ->
    {[{70213, 1}], 1};
get_group_reward({29989, 29991, 29991}) ->
    {[{23740, 1}], 1};
get_group_reward({29991, 29990, 29990}) ->
    {[{22443, 1}], 1};
get_group_reward({29989, 29990, 29990}) ->
    {[{70212, 1}], 1};
get_group_reward({29991, 29989, 29989}) ->
    {[{70214, 1}], 1};
get_group_reward({29990, 29989, 29989}) ->
    {[{70215, 1}], 1};
get_group_reward(_) -> {[], false}.

get_count_ratio() ->
    [{0, 20}, {1, 60}, {2, 820}, {3, 100}].

get_group_item() ->
    [#{item_id => 29989, num => 1, ratio => 400},
     #{item_id => 29990, num => 1, ratio => 300},
     #{item_id => 29991, num => 1, ratio => 300}].

get_cost(1129) -> {1129, 70192, 1};
get_cost(_) -> false.

