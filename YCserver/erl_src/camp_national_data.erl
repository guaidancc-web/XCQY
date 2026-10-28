-file("src/data/camp_national_data.erl", 1).

-module(camp_national_data).

-file("inc/camp_rainbow_lottery.hrl", 1).

-record(m_rainbow_lottery,
        {ver = 1 :: pos_integer(),
         prizes = [] :: list(),
         lottery_times = 0,
         buffer_reward = []}).

-record(rainbow_prize,
        {ver = 1,
         id = 0,
         assets = 0,
         val = 0,
         is_hit = 0,
         show_rate = 0,
         rand_rate = 0,
         is_only = 0,
         times_min = 0,
         times_max = 0,
         is_hearsay = 0}).

-file("src/data/camp_national_data.erl", 10).

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

-file("src/data/camp_national_data.erl", 11).

-export([get_wisdom_reward/1,
         get_group_ratio/0,
         get_base_group_count/0,
         get_group_count_max/1,
         get_grounp_item/1,
         get_rainbow_lottory_cost/1,
         get_time/1]).

get_wisdom_reward(1) ->
    #{id => 1, exp_mod => 3347, drop => 74134};
get_wisdom_reward(2) ->
    #{id => 2, exp_mod => 0, drop => 74135};
get_wisdom_reward(_) -> false.

get_base_group_count() ->
    [{1, 1}, {2, 1}, {3, 2}, {4, 2}, {5, 4}, {6, 6}].

get_group_ratio() ->
    [{1, 500},
     {2, 1000},
     {3, 1000},
     {4, 500},
     {5, 1000},
     {6, 500}].

get_group_count_max(1) -> 1;
get_group_count_max(2) -> 1;
get_group_count_max(3) -> 2;
get_group_count_max(4) -> 2;
get_group_count_max(5) -> 4;
get_group_count_max(6) -> 6;
get_group_count_max(_) -> 0.

get_grounp_item(1) ->
    [#rainbow_prize{id = 1001, assets = 23585, val = 1,
                    show_rate = 150, rand_rate = 15, is_only = 1,
                    times_min = 200, times_max = 3000, is_hearsay = 1},
     #rainbow_prize{id = 1002, assets = 22205, val = 1,
                    show_rate = 350, rand_rate = 20, is_only = 1,
                    times_min = 60, times_max = 400, is_hearsay = 1},
     #rainbow_prize{id = 1003, assets = 29384, val = 1,
                    show_rate = 250, rand_rate = 15, is_only = 1,
                    times_min = 50, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 1004, assets = 29383, val = 1,
                    show_rate = 250, rand_rate = 15, is_only = 1,
                    times_min = 50, times_max = 0, is_hearsay = 1}];
get_grounp_item(2) ->
    [#rainbow_prize{id = 1005, assets = 20617, val = 1,
                    show_rate = 58, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 1006, assets = 21426, val = 1,
                    show_rate = 58, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 1007, assets = 22617, val = 1,
                    show_rate = 58, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2001, assets = 29390, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 2002, assets = 29387, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 2003, assets = 20076, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2004, assets = 23660, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2005, assets = 29101, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2006, assets = 29100, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2007, assets = 20036, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2008, assets = 20038, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2009, assets = 20014, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2010, assets = 29389, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 2011, assets = 29386, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 2012, assets = 20616, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2013, assets = 21432, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 2014, assets = 21425, val = 1,
                    show_rate = 59, rand_rate = 30, is_only = 1,
                    times_min = 0, times_max = 0, is_hearsay = 1}];
get_grounp_item(3) ->
    [#rainbow_prize{id = 3001, assets = 20053, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3002, assets = 23550, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3003, assets = 20040, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3004, assets = 21424, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3005, assets = 20075, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3006, assets = 29388, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 3007, assets = 29385, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 3008, assets = 20095, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3009, assets = 21431, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3010, assets = 23160, val = 1,
                    show_rate = 40, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3011, assets = 22216, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3012, assets = 21423, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3013, assets = 21430, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3014, assets = 22585, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3015, assets = 20061, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3016, assets = 20046, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3017, assets = 21422, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3018, assets = 20062, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3019, assets = 20063, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3020, assets = 20064, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3021, assets = 20065, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 3022, assets = 20066, val = 1,
                    show_rate = 50, rand_rate = 40, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1}];
get_grounp_item(4) ->
    [#rainbow_prize{id = 4001, assets = 22595, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4002, assets = 20656, val = 1,
                    show_rate = 13, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4003, assets = 20657, val = 1,
                    show_rate = 50, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4004, assets = 20658, val = 1,
                    show_rate = 37, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4005, assets = 20022, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4006, assets = 23554, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4007, assets = 29102, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4008, assets = 21100, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4009, assets = 21421, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4010, assets = 20039, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4011, assets = 20087, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 1},
     #rainbow_prize{id = 4012, assets = 29103, val = 1,
                    show_rate = 100, rand_rate = 60, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0}];
get_grounp_item(5) ->
    [#rainbow_prize{id = 5001, assets = 20000, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5002, assets = 20002, val = 1,
                    show_rate = 76, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5003, assets = 20007, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5004, assets = 20074, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5005, assets = 20013, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5006, assets = 23555, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5007, assets = 23556, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5008, assets = 20653, val = 1,
                    show_rate = 9, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5009, assets = 20654, val = 1,
                    show_rate = 41, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5010, assets = 20655, val = 1,
                    show_rate = 27, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5011, assets = 21420, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5012, assets = 20025, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5013, assets = 21098, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5014, assets = 20034, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 5015, assets = 20021, val = 1,
                    show_rate = 77, rand_rate = 260, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0}];
get_grounp_item(6) ->
    [#rainbow_prize{id = 6001, assets = 20006, val = 3,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6002, assets = 20020, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6003, assets = 20052, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6004, assets = 20060, val = 1,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6005, assets = 20005, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6006, assets = 20004, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6007, assets = 20006, val = 3,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6008, assets = 20020, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6009, assets = 20052, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6010, assets = 20060, val = 1,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6011, assets = 20005, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6012, assets = 20004, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6013, assets = 20006, val = 3,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6014, assets = 20020, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6015, assets = 20052, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6016, assets = 20060, val = 1,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6017, assets = 20005, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6018, assets = 20004, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6019, assets = 20006, val = 3,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6020, assets = 20020, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6021, assets = 20052, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6022, assets = 20060, val = 1,
                    show_rate = 41, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6023, assets = 20005, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0},
     #rainbow_prize{id = 6024, assets = 20004, val = 1,
                    show_rate = 42, rand_rate = 200, is_only = 0,
                    times_min = 0, times_max = 0, is_hearsay = 0}];
get_grounp_item(_) -> [].

get_rainbow_lottory_cost(1) -> [{23718, 1}];
get_rainbow_lottory_cost(2) -> [{23718, 1}];
get_rainbow_lottory_cost(_) -> false.

get_time({10, 0, 0}) -> 450;
get_time({10, 20, 0}) -> 150;
get_time({10, 40, 0}) -> 150;
get_time({11, 0, 0}) -> 450;
get_time({11, 20, 0}) -> 150;
get_time({11, 40, 0}) -> 150;
get_time({12, 0, 0}) -> 1000;
get_time({12, 20, 0}) -> 150;
get_time({12, 40, 0}) -> 150;
get_time({13, 0, 0}) -> 450;
get_time({13, 20, 0}) -> 150;
get_time({13, 40, 0}) -> 150;
get_time({14, 0, 0}) -> 1000;
get_time({14, 20, 0}) -> 150;
get_time({14, 40, 0}) -> 150;
get_time({15, 0, 0}) -> 450;
get_time({15, 20, 0}) -> 150;
get_time({15, 40, 0}) -> 150;
get_time({16, 0, 0}) -> 450;
get_time({16, 20, 0}) -> 150;
get_time({16, 40, 0}) -> 150;
get_time({17, 0, 0}) -> 450;
get_time({17, 20, 0}) -> 150;
get_time({17, 40, 0}) -> 150;
get_time({18, 0, 0}) -> 1000;
get_time({18, 20, 0}) -> 150;
get_time({18, 40, 0}) -> 150;
get_time({19, 0, 0}) -> 1000;
get_time(_) -> false.

