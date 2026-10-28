-file("src/data/guild_data.erl", 1).

-module(guild_data).

-export([get_auth/1,
         uplev/1,
         academy/1,
         exchequer/1,
         store/1,
         store_effect/1,
         store_item/1,
         get_boss/1,
         get_envelop/1,
         get_spring_exp/1,
         get_question_exp/1,
         get_robber_odds/1,
         get_robber_num/1,
         get_robber_box/1,
         get_box_reward/0,
         get_payoff/1,
         get_robber_exp/1,
         get_acceleration/1,
         get_donation_exchanging/1,
         get_assets_exchanging/1,
         get_treasure_box/1,
         get_week_reward/1,
         get_element/1,
         get_rand_element/1,
         get_element_attr_ratio/1,
         get_element_cost/1,
         get_element_cost_damp/1,
         get_build_speed_cost/1]).

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

-file("src/data/guild_data.erl", 40).

get_auth(appoint) -> 50;
get_auth(expel) -> 40;
get_auth(upbuild) -> 50;
get_auth(modify) -> 50;
get_auth(destory) -> 50;
get_auth(set_cond) -> 50;
get_auth(approve) -> 40;
get_auth(set_signature) -> 50;
get_auth(_Type) -> false.

uplev(1) ->
    #{lev => 1, cost => 1, need => 1, upkeep => 15000,
      assets_limit => 11016000, flag => 0, signable => 0,
      need_lev => 0, need_time => 1, medal_need => 25};
uplev(2) ->
    #{lev => 2, cost => 6800000, need => 10400000,
      upkeep => 25000, assets_limit => 16156800, flag => 0,
      signable => 0, need_lev => 6, need_time => 64800,
      medal_need => 46};
uplev(3) ->
    #{lev => 3, cost => 9000000, need => 14500000,
      upkeep => 40000, assets_limit => 20563200, flag => 0,
      signable => 0, need_lev => 12, need_time => 86400,
      medal_need => 56};
uplev(4) ->
    #{lev => 4, cost => 11300000, need => 17500000,
      upkeep => 50000, assets_limit => 25459200, flag => 0,
      signable => 0, need_lev => 18, need_time => 129600,
      medal_need => 72};
uplev(5) ->
    #{lev => 5, cost => 12200000, need => 21900000,
      upkeep => 60000, assets_limit => 30844800, flag => 0,
      signable => 0, need_lev => 24, need_time => 172800,
      medal_need => 86};
uplev(6) ->
    #{lev => 6, cost => 14500000, need => 25000000,
      upkeep => 70000, assets_limit => 36720000, flag => 0,
      signable => 0, need_lev => 30, need_time => 172800,
      medal_need => 100};
uplev(_Lev) -> false.

academy(1) ->
    #{lev => 1, need_lev => 1, task_rate => 100,
      enchant_rate => 0, cost => 2600000, upkeep => 6000,
      need => 6000000, daily_exp => 46, daily_coin => 40000,
      need_time => 28800};
academy(2) ->
    #{lev => 2, need_lev => 1, task_rate => 100,
      enchant_rate => 0, cost => 2600000, upkeep => 12000,
      need => 6000000, daily_exp => 54, daily_coin => 46000,
      need_time => 28800};
academy(3) ->
    #{lev => 3, need_lev => 1, task_rate => 100,
      enchant_rate => 0, cost => 3200000, upkeep => 18000,
      need => 9200000, daily_exp => 61, daily_coin => 52000,
      need_time => 28800};
academy(4) ->
    #{lev => 4, need_lev => 2, task_rate => 100,
      enchant_rate => 0, cost => 3200000, upkeep => 24000,
      need => 9200000, daily_exp => 68, daily_coin => 58000,
      need_time => 36000};
academy(5) ->
    #{lev => 5, need_lev => 2, task_rate => 100,
      enchant_rate => 0, cost => 3600000, upkeep => 30000,
      need => 13688000, daily_exp => 75, daily_coin => 64000,
      need_time => 36000};
academy(6) ->
    #{lev => 6, need_lev => 2, task_rate => 100,
      enchant_rate => 0, cost => 3600000, upkeep => 36000,
      need => 13688000, daily_exp => 82, daily_coin => 70000,
      need_time => 36000};
academy(7) ->
    #{lev => 7, need_lev => 3, task_rate => 100,
      enchant_rate => 0, cost => 4200000, upkeep => 42000,
      need => 15912000, daily_exp => 90, daily_coin => 76000,
      need_time => 43200};
academy(8) ->
    #{lev => 8, need_lev => 3, task_rate => 100,
      enchant_rate => 0, cost => 4200000, upkeep => 48000,
      need => 15912000, daily_exp => 97, daily_coin => 82000,
      need_time => 43200};
academy(9) ->
    #{lev => 9, need_lev => 3, task_rate => 100,
      enchant_rate => 0, cost => 4800000, upkeep => 54000,
      need => 19420800, daily_exp => 104, daily_coin => 88000,
      need_time => 43200};
academy(10) ->
    #{lev => 10, need_lev => 4, task_rate => 100,
      enchant_rate => 0, cost => 4800000, upkeep => 60000,
      need => 19420800, daily_exp => 111, daily_coin => 94000,
      need_time => 64800};
academy(11) ->
    #{lev => 11, need_lev => 4, task_rate => 100,
      enchant_rate => 0, cost => 4800000, upkeep => 66000,
      need => 23256000, daily_exp => 118,
      daily_coin => 100000, need_time => 64800};
academy(12) ->
    #{lev => 12, need_lev => 4, task_rate => 100,
      enchant_rate => 0, cost => 4800000, upkeep => 72000,
      need => 23256000, daily_exp => 126,
      daily_coin => 106000, need_time => 64800};
academy(13) ->
    #{lev => 13, need_lev => 5, task_rate => 100,
      enchant_rate => 0, cost => 5600000, upkeep => 78000,
      need => 27417600, daily_exp => 133,
      daily_coin => 112000, need_time => 86400};
academy(14) ->
    #{lev => 14, need_lev => 5, task_rate => 100,
      enchant_rate => 0, cost => 5600000, upkeep => 84000,
      need => 27417600, daily_exp => 140,
      daily_coin => 118000, need_time => 86400};
academy(15) ->
    #{lev => 15, need_lev => 5, task_rate => 100,
      enchant_rate => 0, cost => 5600000, upkeep => 90000,
      need => 27417600, daily_exp => 147,
      daily_coin => 124000, need_time => 86400};
academy(16) ->
    #{lev => 16, need_lev => 6, task_rate => 100,
      enchant_rate => 0, cost => 6400000, upkeep => 96000,
      need => 27417600, daily_exp => 154,
      daily_coin => 130000, need_time => 86400};
academy(17) ->
    #{lev => 17, need_lev => 6, task_rate => 100,
      enchant_rate => 0, cost => 6400000, upkeep => 102000,
      need => 27417600, daily_exp => 162,
      daily_coin => 136000, need_time => 86400};
academy(18) ->
    #{lev => 18, need_lev => 6, task_rate => 100,
      enchant_rate => 0, cost => 6400000, upkeep => 108000,
      need => 27417600, daily_exp => 169,
      daily_coin => 142000, need_time => 86400};
academy(_Lev) -> false.

exchequer(0) ->
    #{lev => 0, need_lev => 0, cost => 0, upkeep => 0,
      need => 0, mem => 80, fresh => 75, need_time => 0};
exchequer(1) ->
    #{lev => 1, need_lev => 1, cost => 2600000,
      upkeep => 6000, need => 6000000, mem => 84, fresh => 77,
      need_time => 28800};
exchequer(2) ->
    #{lev => 2, need_lev => 1, cost => 2600000,
      upkeep => 12000, need => 6000000, mem => 88,
      fresh => 79, need_time => 28800};
exchequer(3) ->
    #{lev => 3, need_lev => 1, cost => 3200000,
      upkeep => 18000, need => 9200000, mem => 92,
      fresh => 81, need_time => 28800};
exchequer(4) ->
    #{lev => 4, need_lev => 2, cost => 3200000,
      upkeep => 24000, need => 9200000, mem => 96,
      fresh => 83, need_time => 36000};
exchequer(5) ->
    #{lev => 5, need_lev => 2, cost => 3600000,
      upkeep => 30000, need => 13688000, mem => 100,
      fresh => 85, need_time => 36000};
exchequer(6) ->
    #{lev => 6, need_lev => 2, cost => 3600000,
      upkeep => 36000, need => 13688000, mem => 104,
      fresh => 85, need_time => 36000};
exchequer(7) ->
    #{lev => 7, need_lev => 3, cost => 4200000,
      upkeep => 42000, need => 15912000, mem => 108,
      fresh => 85, need_time => 43200};
exchequer(8) ->
    #{lev => 8, need_lev => 3, cost => 4200000,
      upkeep => 48000, need => 15912000, mem => 112,
      fresh => 85, need_time => 43200};
exchequer(9) ->
    #{lev => 9, need_lev => 3, cost => 4800000,
      upkeep => 54000, need => 19420800, mem => 116,
      fresh => 85, need_time => 43200};
exchequer(10) ->
    #{lev => 10, need_lev => 4, cost => 6400000,
      upkeep => 60000, need => 19420800, mem => 120,
      fresh => 85, need_time => 64800};
exchequer(11) ->
    #{lev => 11, need_lev => 4, cost => 6400000,
      upkeep => 66000, need => 23256000, mem => 125,
      fresh => 85, need_time => 64800};
exchequer(12) ->
    #{lev => 12, need_lev => 4, cost => 7200000,
      upkeep => 72000, need => 23256000, mem => 129,
      fresh => 85, need_time => 64800};
exchequer(13) ->
    #{lev => 13, need_lev => 5, cost => 7200000,
      upkeep => 78000, need => 27417600, mem => 134,
      fresh => 85, need_time => 86400};
exchequer(14) ->
    #{lev => 14, need_lev => 5, cost => 8000000,
      upkeep => 84000, need => 27417600, mem => 138,
      fresh => 85, need_time => 86400};
exchequer(15) ->
    #{lev => 15, need_lev => 5, cost => 8000000,
      upkeep => 90000, need => 27417600, mem => 143,
      fresh => 85, need_time => 86400};
exchequer(16) ->
    #{lev => 16, need_lev => 6, cost => 8800000,
      upkeep => 96000, need => 27417600, mem => 147,
      fresh => 85, need_time => 86400};
exchequer(17) ->
    #{lev => 17, need_lev => 6, cost => 8800000,
      upkeep => 102000, need => 27417600, mem => 151,
      fresh => 85, need_time => 86400};
exchequer(18) ->
    #{lev => 18, need_lev => 6, cost => 9600000,
      upkeep => 108000, need => 27417600, mem => 155,
      fresh => 85, need_time => 86400};
exchequer(_Lev) -> false.

store(1) ->
    #{lev => 1, need_lev => 1, cost => 2600000,
      need => 6000000, upkeep => 6000, need_time => 28800};
store(2) ->
    #{lev => 2, need_lev => 1, cost => 2600000,
      need => 6000000, upkeep => 12000, need_time => 28800};
store(3) ->
    #{lev => 3, need_lev => 1, cost => 3200000,
      need => 9200000, upkeep => 18000, need_time => 28800};
store(4) ->
    #{lev => 4, need_lev => 2, cost => 3200000,
      need => 9200000, upkeep => 24000, need_time => 36000};
store(5) ->
    #{lev => 5, need_lev => 2, cost => 3600000,
      need => 13688000, upkeep => 30000, need_time => 36000};
store(6) ->
    #{lev => 6, need_lev => 2, cost => 3600000,
      need => 13688000, upkeep => 36000, need_time => 36000};
store(7) ->
    #{lev => 7, need_lev => 3, cost => 4200000,
      need => 15912000, upkeep => 42000, need_time => 43200};
store(8) ->
    #{lev => 8, need_lev => 3, cost => 4200000,
      need => 15912000, upkeep => 48000, need_time => 43200};
store(9) ->
    #{lev => 9, need_lev => 3, cost => 4800000,
      need => 19420800, upkeep => 54000, need_time => 43200};
store(10) ->
    #{lev => 10, need_lev => 4, cost => 4800000,
      need => 19420800, upkeep => 60000, need_time => 64800};
store(11) ->
    #{lev => 11, need_lev => 4, cost => 4800000,
      need => 23256000, upkeep => 66000, need_time => 64800};
store(12) ->
    #{lev => 12, need_lev => 4, cost => 4800000,
      need => 23256000, upkeep => 72000, need_time => 64800};
store(13) ->
    #{lev => 13, need_lev => 5, cost => 5600000,
      need => 27417600, upkeep => 78000, need_time => 86400};
store(14) ->
    #{lev => 14, need_lev => 5, cost => 5600000,
      need => 27417600, upkeep => 84000, need_time => 86400};
store(15) ->
    #{lev => 15, need_lev => 5, cost => 5600000,
      need => 27417600, upkeep => 90000, need_time => 86400};
store(16) ->
    #{lev => 16, need_lev => 6, cost => 6400000,
      need => 27417600, upkeep => 96000, need_time => 86400};
store(17) ->
    #{lev => 17, need_lev => 6, cost => 6400000,
      need => 27417600, upkeep => 102000, need_time => 86400};
store(18) ->
    #{lev => 18, need_lev => 6, cost => 6400000,
      need => 27417600, upkeep => 108000, need_time => 86400};
store(_Lev) -> false.

store_effect(1) ->
    #{lev => 1, num => 0, normal_goods => [50]};
store_effect(2) ->
    #{lev => 2, num => 2,
      id_list => [{1, 100}, {2, 100}, {3, 0}],
      normal_goods => [50]};
store_effect(3) ->
    #{lev => 3, num => 3,
      id_list => [{1, 100}, {2, 100}, {3, 0}, {4, 100}],
      normal_goods => [50, 51]};
store_effect(4) ->
    #{lev => 4, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100}],
      normal_goods => [50, 51]};
store_effect(5) ->
    #{lev => 5, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100}],
      normal_goods => [50, 51]};
store_effect(6) ->
    #{lev => 6, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100}],
      normal_goods => [50, 51, 52]};
store_effect(7) ->
    #{lev => 7, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100}],
      normal_goods => [50, 51, 52]};
store_effect(8) ->
    #{lev => 8, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0}],
      normal_goods => [50, 51, 52, 53]};
store_effect(9) ->
    #{lev => 9, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {17, 100}],
      normal_goods => [50, 51, 52, 53]};
store_effect(10) ->
    #{lev => 10, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {17, 100}],
      normal_goods => [50, 51, 52, 53]};
store_effect(11) ->
    #{lev => 11, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {17, 100}],
      normal_goods => [50, 51, 52, 53]};
store_effect(12) ->
    #{lev => 12, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {17, 100},
           {19, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(13) ->
    #{lev => 13, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {17, 100},
           {19, 100},
           {20, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(14) ->
    #{lev => 14, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {17, 100},
           {19, 100},
           {20, 100},
           {21, 100},
           {22, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(15) ->
    #{lev => 15, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {15, 0},
           {17, 100},
           {19, 100},
           {20, 100},
           {21, 100},
           {22, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(16) ->
    #{lev => 16, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {15, 5},
           {17, 100},
           {19, 100},
           {20, 100},
           {21, 100},
           {22, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(17) ->
    #{lev => 17, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {15, 10},
           {17, 100},
           {19, 100},
           {20, 100},
           {21, 100},
           {22, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(18) ->
    #{lev => 18, num => 4,
      id_list =>
          [{1, 100},
           {2, 100},
           {3, 0},
           {4, 100},
           {5, 100},
           {6, 100},
           {7, 100},
           {8, 100},
           {9, 100},
           {10, 0},
           {11, 100},
           {12, 100},
           {13, 0},
           {14, 100},
           {15, 15},
           {16, 100},
           {17, 100},
           {19, 100},
           {20, 100},
           {21, 100},
           {22, 100}],
      normal_goods => [50, 51, 52, 53, 54]};
store_effect(_) -> false.

store_item(1) -> {1, 20034, 5, [{90011, 72}], 2};
store_item(2) -> {2, 20000, 5, [{90011, 132}], 2};
store_item(3) -> {3, 20545, 2, [{90011, 264}], 1};
store_item(4) -> {4, 20615, 1, [{90011, 220}], 0};
store_item(5) -> {5, 20021, 5, [{90011, 66}], 2};
store_item(6) -> {6, 21100, 1, [{90011, 264}], 0};
store_item(7) -> {7, 20031, 1, [{90011, 220}], 0};
store_item(8) -> {8, 20046, 1, [{90011, 352}], 0};
store_item(9) -> {9, 20022, 1, [{90011, 264}], 0};
store_item(10) -> {10, 20616, 1, [{90011, 880}], 0};
store_item(11) -> {11, 20009, 1, [{90011, 220}], 0};
store_item(12) -> {12, 21101, 1, [{90011, 616}], 0};
store_item(13) -> {13, 20010, 1, [{90011, 1100}], 0};
store_item(14) -> {14, 20038, 1, [{90011, 1056}], 0};
store_item(15) -> {15, 20617, 1, [{90011, 3300}], 0};
store_item(16) -> {16, 20095, 1, [{90011, 528}], 0};
store_item(17) -> {17, 22216, 1, [{90011, 440}], 0};
store_item(19) -> {19, 23556, 6, [{90011, 120}], 2};
store_item(20) -> {20, 21130, 1, [{90011, 352}], 0};
store_item(21) -> {21, 22306, 1, [{90011, 110}], 0};
store_item(22) -> {22, 22307, 1, [{90011, 330}], 0};
store_item(50) -> {50, 20006, 0, [{90011, 10}], 30};
store_item(51) -> {51, 20025, 0, [{90011, 80}], 4};
store_item(52) -> {52, 20020, 0, [{90011, 40}], 10};
store_item(53) -> {53, 20045, 0, [{90011, 48}], 1};
store_item(54) -> {54, 23555, 0, [{90011, 110}], 3};
store_item(_) -> false.

get_boss(1) ->
    #{lev => 1, step => 1, max_exp => 0, id => 70000,
      retinue_id => 90000, retinue_num => 5};
get_boss(2) ->
    #{lev => 2, step => 2, max_exp => 500, id => 70001,
      retinue_id => 90001, retinue_num => 5};
get_boss(3) ->
    #{lev => 3, step => 3, max_exp => 1000, id => 70002,
      retinue_id => 90002, retinue_num => 5};
get_boss(4) ->
    #{lev => 4, step => 4, max_exp => 1500, id => 70003,
      retinue_id => 90003, retinue_num => 5};
get_boss(5) ->
    #{lev => 5, step => 5, max_exp => 2000, id => 70004,
      retinue_id => 90004, retinue_num => 5};
get_boss(6) ->
    #{lev => 6, step => 6, max_exp => 2500, id => 70005,
      retinue_id => 90005, retinue_num => 5};
get_boss(7) ->
    #{lev => 7, step => 7, max_exp => 3000, id => 70006,
      retinue_id => 90003, retinue_num => 8};
get_boss(8) ->
    #{lev => 8, step => 8, max_exp => 3500, id => 70007,
      retinue_id => 90004, retinue_num => 8};
get_boss(9) ->
    #{lev => 9, step => 9, max_exp => 4000, id => 70008,
      retinue_id => 90005, retinue_num => 8};
get_boss(10) ->
    #{lev => 10, step => 10, max_exp => 4500, id => 70009,
      retinue_id => 90004, retinue_num => 8};
get_boss(_) -> false.

get_envelop(1) ->
    #{type => 1, loss_type => gold, loss_num => 68,
      amount => 300000, min => 5, max => 10};
get_envelop(2) ->
    #{type => 2, loss_type => gold, loss_num => 168,
      amount => 750000, min => 5, max => 12};
get_envelop(3) ->
    #{type => 3, loss_type => gold, loss_num => 288,
      amount => 1300000, min => 10, max => 18};
get_envelop(4) ->
    #{type => 4, loss_type => gold, loss_num => 588,
      amount => 2650000, min => 15, max => 20};
get_envelop(5) ->
    #{type => 5, loss_type => gold, loss_num => 888,
      amount => 3990000, min => 20, max => 30};
get_envelop(6) ->
    #{type => 6, loss_type => gold, loss_num => 1688,
      amount => 7600000, min => 25, max => 35};
get_envelop(_) -> false.

get_spring_exp(1) -> {0, 1388};
get_spring_exp(2) -> {0, 1420};
get_spring_exp(3) -> {0, 1461};
get_spring_exp(4) -> {0, 1502};
get_spring_exp(5) -> {0, 1534};
get_spring_exp(6) -> {0, 1575};
get_spring_exp(7) -> {0, 1616};
get_spring_exp(8) -> {0, 1648};
get_spring_exp(9) -> {0, 1689};
get_spring_exp(10) -> {0, 1730};
get_spring_exp(11) -> {0, 1772};
get_spring_exp(12) -> {0, 1813};
get_spring_exp(13) -> {0, 1844};
get_spring_exp(14) -> {0, 1886};
get_spring_exp(15) -> {0, 1927};
get_spring_exp(16) -> {0, 1969};
get_spring_exp(17) -> {0, 2010};
get_spring_exp(18) -> {0, 2052};
get_spring_exp(19) -> {0, 2093};
get_spring_exp(20) -> {0, 2135};
get_spring_exp(21) -> {0, 2176};
get_spring_exp(22) -> {0, 2217};
get_spring_exp(23) -> {0, 2259};
get_spring_exp(24) -> {0, 2300};
get_spring_exp(25) -> {0, 2342};
get_spring_exp(26) -> {0, 2383};
get_spring_exp(27) -> {0, 2425};
get_spring_exp(28) -> {2617, 2466};
get_spring_exp(29) -> {2657, 2508};
get_spring_exp(30) -> {2697, 2549};
get_spring_exp(31) -> {2739, 2575};
get_spring_exp(32) -> {2780, 2599};
get_spring_exp(33) -> {2822, 2624};
get_spring_exp(34) -> {2874, 2658};
get_spring_exp(35) -> {2915, 2682};
get_spring_exp(36) -> {2957, 2706};
get_spring_exp(37) -> {2999, 2729};
get_spring_exp(38) -> {3051, 2761};
get_spring_exp(39) -> {3092, 2783};
get_spring_exp(40) -> {3221, 2883};
get_spring_exp(41) -> {3273, 2913};
get_spring_exp(42) -> {3314, 2933};
get_spring_exp(43) -> {3366, 2962};
get_spring_exp(44) -> {3408, 2982};
get_spring_exp(45) -> {3449, 3001};
get_spring_exp(46) -> {3501, 3028};
get_spring_exp(47) -> {3543, 3047};
get_spring_exp(48) -> {3595, 3074};
get_spring_exp(49) -> {3637, 3091};
get_spring_exp(50) -> {3689, 3117};
get_spring_exp(51) -> {3730, 3133};
get_spring_exp(52) -> {3782, 3158};
get_spring_exp(53) -> {3834, 3182};
get_spring_exp(54) -> {3876, 3198};
get_spring_exp(55) -> {4014, 3291};
get_spring_exp(56) -> {4056, 3306};
get_spring_exp(57) -> {4108, 3327};
get_spring_exp(58) -> {4160, 3349};
get_spring_exp(59) -> {4202, 3362};
get_spring_exp(60) -> {4340, 3450};
get_spring_exp(61) -> {4392, 3470};
get_spring_exp(62) -> {4444, 3489};
get_spring_exp(63) -> {4486, 3499};
get_spring_exp(64) -> {4538, 3517};
get_spring_exp(65) -> {4590, 3534};
get_spring_exp(66) -> {4642, 3551};
get_spring_exp(67) -> {4694, 3567};
get_spring_exp(68) -> {4746, 3583};
get_spring_exp(69) -> {4787, 3590};
get_spring_exp(70) -> {4839, 3605};
get_spring_exp(71) -> {4891, 3619};
get_spring_exp(72) -> {4943, 3633};
get_spring_exp(73) -> {4995, 3646};
get_spring_exp(74) -> {5047, 3659};
get_spring_exp(75) -> {5099, 3671};
get_spring_exp(76) -> {5151, 3683};
get_spring_exp(77) -> {5203, 3694};
get_spring_exp(78) -> {5255, 3705};
get_spring_exp(79) -> {5307, 3715};
get_spring_exp(80) -> {5706, 3994};
get_spring_exp(81) -> {5769, 4038};
get_spring_exp(82) -> {5821, 4075};
get_spring_exp(83) -> {5873, 4111};
get_spring_exp(84) -> {5925, 4148};
get_spring_exp(85) -> {5977, 4184};
get_spring_exp(86) -> {6029, 4220};
get_spring_exp(87) -> {6091, 4264};
get_spring_exp(88) -> {6143, 4300};
get_spring_exp(89) -> {6195, 4337};
get_spring_exp(90) -> {6247, 4373};
get_spring_exp(91) -> {6309, 4416};
get_spring_exp(92) -> {6361, 4453};
get_spring_exp(93) -> {6413, 4489};
get_spring_exp(94) -> {6476, 4533};
get_spring_exp(95) -> {6528, 4570};
get_spring_exp(96) -> {6580, 4606};
get_spring_exp(97) -> {6642, 4649};
get_spring_exp(98) -> {6694, 4686};
get_spring_exp(99) -> {6746, 4722};
get_spring_exp(100) -> {6813, 4769};
get_spring_exp(101) -> {6881, 4816};
get_spring_exp(102) -> {6949, 4864};
get_spring_exp(103) -> {7018, 4912};
get_spring_exp(104) -> {7088, 4961};
get_spring_exp(105) -> {7158, 5010};
get_spring_exp(106) -> {7229, 5060};
get_spring_exp(107) -> {7301, 5110};
get_spring_exp(108) -> {7374, 5161};
get_spring_exp(109) -> {7447, 5212};
get_spring_exp(110) -> {7521, 5264};
get_spring_exp(111) -> {7596, 5316};
get_spring_exp(112) -> {7671, 5369};
get_spring_exp(113) -> {7747, 5422};
get_spring_exp(114) -> {7824, 5476};
get_spring_exp(115) -> {7902, 5530};
get_spring_exp(116) -> {7981, 5585};
get_spring_exp(117) -> {8060, 5640};
get_spring_exp(118) -> {8140, 5696};
get_spring_exp(119) -> {8221, 5752};
get_spring_exp(120) -> {8221, 5752};
get_spring_exp(121) -> {8221, 5752};
get_spring_exp(122) -> {8221, 5752};
get_spring_exp(123) -> {8221, 5752};
get_spring_exp(124) -> {8221, 5752};
get_spring_exp(125) -> {8221, 5752};
get_spring_exp(126) -> {8221, 5752};
get_spring_exp(127) -> {8221, 5752};
get_spring_exp(128) -> {8221, 5752};
get_spring_exp(129) -> {8221, 5752};
get_spring_exp(130) -> {8221, 5752};
get_spring_exp(131) -> {8221, 5752};
get_spring_exp(132) -> {8221, 5752};
get_spring_exp(133) -> {8221, 5752};
get_spring_exp(134) -> {8221, 5752};
get_spring_exp(135) -> {8221, 5752};
get_spring_exp(136) -> {8221, 5752};
get_spring_exp(137) -> {8221, 5752};
get_spring_exp(138) -> {8221, 5752};
get_spring_exp(139) -> {8221, 5752};
get_spring_exp(140) -> {8221, 5752};
get_spring_exp(141) -> {8221, 5752};
get_spring_exp(142) -> {8221, 5752};
get_spring_exp(143) -> {8221, 5752};
get_spring_exp(144) -> {8221, 5752};
get_spring_exp(145) -> {8221, 5752};
get_spring_exp(146) -> {8221, 5752};
get_spring_exp(147) -> {8221, 5752};
get_spring_exp(148) -> {8221, 5752};
get_spring_exp(149) -> {8221, 5752};
get_spring_exp(150) -> {8221, 5752};
get_spring_exp(151) -> {8221, 5752};
get_spring_exp(152) -> {8221, 5752};
get_spring_exp(153) -> {8221, 5752};
get_spring_exp(154) -> {8221, 5752};
get_spring_exp(155) -> {8221, 5752};
get_spring_exp(156) -> {8221, 5752};
get_spring_exp(_) -> 0.

get_question_exp(1) -> {0, 0, 1608};
get_question_exp(2) -> {0, 0, 1644};
get_question_exp(3) -> {0, 0, 1692};
get_question_exp(4) -> {0, 0, 1740};
get_question_exp(5) -> {0, 0, 1776};
get_question_exp(6) -> {0, 0, 1824};
get_question_exp(7) -> {0, 0, 1872};
get_question_exp(8) -> {0, 0, 1908};
get_question_exp(9) -> {0, 0, 1956};
get_question_exp(10) -> {0, 0, 2004};
get_question_exp(11) -> {0, 0, 2052};
get_question_exp(12) -> {0, 0, 2100};
get_question_exp(13) -> {0, 0, 2136};
get_question_exp(14) -> {0, 0, 2184};
get_question_exp(15) -> {0, 0, 2232};
get_question_exp(16) -> {0, 0, 2280};
get_question_exp(17) -> {0, 0, 2328};
get_question_exp(18) -> {0, 0, 2376};
get_question_exp(19) -> {0, 0, 2424};
get_question_exp(20) -> {2472, 1236, 2472};
get_question_exp(21) -> {2520, 1260, 2494};
get_question_exp(22) -> {2568, 1284, 2530};
get_question_exp(23) -> {2616, 1308, 2564};
get_question_exp(24) -> {2664, 1332, 2598};
get_question_exp(25) -> {2712, 1356, 2630};
get_question_exp(26) -> {2760, 1380, 2664};
get_question_exp(27) -> {2808, 1404, 2696};
get_question_exp(28) -> {2856, 1428, 2728};
get_question_exp(29) -> {2904, 1452, 2758};
get_question_exp(30) -> {2952, 1476, 2790};
get_question_exp(31) -> {3112, 1556, 2926};
get_question_exp(32) -> {3160, 1580, 2954};
get_question_exp(33) -> {3208, 1604, 2984};
get_question_exp(34) -> {3256, 1628, 3012};
get_question_exp(35) -> {3316, 1658, 3050};
get_question_exp(36) -> {3364, 1682, 3078};
get_question_exp(37) -> {3412, 1706, 3104};
get_question_exp(38) -> {3460, 1730, 3132};
get_question_exp(39) -> {3520, 1760, 3168};
get_question_exp(40) -> {3568, 1784, 3194};
get_question_exp(41) -> {3716, 1858, 3308};
get_question_exp(42) -> {3776, 1888, 3342};
get_question_exp(43) -> {3824, 1912, 3366};
get_question_exp(44) -> {3884, 1942, 3398};
get_question_exp(45) -> {3932, 1966, 3420};
get_question_exp(46) -> {3980, 1990, 3442};
get_question_exp(47) -> {4040, 2020, 3474};
get_question_exp(48) -> {4088, 2044, 3496};
get_question_exp(49) -> {4148, 2074, 3526};
get_question_exp(50) -> {4196, 2098, 3546};
get_question_exp(51) -> {4256, 2128, 3576};
get_question_exp(52) -> {4304, 2152, 3594};
get_question_exp(53) -> {4364, 2182, 3622};
get_question_exp(54) -> {4424, 2212, 3650};
get_question_exp(55) -> {4472, 2236, 3668};
get_question_exp(56) -> {4632, 2316, 3776};
get_question_exp(57) -> {4680, 2340, 3790};
get_question_exp(58) -> {4740, 2370, 3816};
get_question_exp(59) -> {4800, 2400, 3840};
get_question_exp(60) -> {4848, 2424, 3854};
get_question_exp(61) -> {5008, 2504, 3956};
get_question_exp(62) -> {5068, 2534, 3978};
get_question_exp(63) -> {5128, 2564, 4000};
get_question_exp(64) -> {5176, 2588, 4012};
get_question_exp(65) -> {5236, 2618, 4032};
get_question_exp(66) -> {5296, 2648, 4052};
get_question_exp(67) -> {5356, 2678, 4070};
get_question_exp(68) -> {5416, 2708, 4090};
get_question_exp(69) -> {5476, 2738, 4108};
get_question_exp(70) -> {5524, 2762, 4116};
get_question_exp(71) -> {5584, 2792, 4132};
get_question_exp(72) -> {5644, 2822, 4148};
get_question_exp(73) -> {5704, 2852, 4164};
get_question_exp(74) -> {5764, 2882, 4178};
get_question_exp(75) -> {5824, 2912, 4194};
get_question_exp(76) -> {5884, 2942, 4208};
get_question_exp(77) -> {5944, 2972, 4220};
get_question_exp(78) -> {6004, 3002, 4232};
get_question_exp(79) -> {6064, 3032, 4244};
get_question_exp(80) -> {6124, 3062, 4286};
get_question_exp(81) -> {6584, 3292, 4608};
get_question_exp(82) -> {6656, 3328, 4660};
get_question_exp(83) -> {6716, 3358, 4702};
get_question_exp(84) -> {6776, 3388, 4744};
get_question_exp(85) -> {6836, 3418, 4786};
get_question_exp(86) -> {6896, 3448, 4828};
get_question_exp(87) -> {6956, 3478, 4870};
get_question_exp(88) -> {7028, 3514, 4920};
get_question_exp(89) -> {7088, 3544, 4962};
get_question_exp(90) -> {7148, 3574, 5004};
get_question_exp(91) -> {7208, 3604, 5046};
get_question_exp(92) -> {7280, 3640, 5096};
get_question_exp(93) -> {7340, 3670, 5138};
get_question_exp(94) -> {7400, 3700, 5180};
get_question_exp(95) -> {7472, 3736, 5230};
get_question_exp(96) -> {7532, 3766, 5272};
get_question_exp(97) -> {7592, 3796, 5314};
get_question_exp(98) -> {7664, 3832, 5364};
get_question_exp(99) -> {7724, 3862, 5406};
get_question_exp(100) -> {7784, 3892, 5448};
get_question_exp(101) -> {7784, 3892, 5448};
get_question_exp(102) -> {7784, 3892, 5448};
get_question_exp(103) -> {7784, 3892, 5448};
get_question_exp(104) -> {7784, 3892, 5448};
get_question_exp(105) -> {7784, 3892, 5448};
get_question_exp(106) -> {7784, 3892, 5448};
get_question_exp(107) -> {7784, 3892, 5448};
get_question_exp(108) -> {7784, 3892, 5448};
get_question_exp(109) -> {7784, 3892, 5448};
get_question_exp(110) -> {7784, 3892, 5448};
get_question_exp(111) -> {7784, 3892, 5448};
get_question_exp(112) -> {7784, 3892, 5448};
get_question_exp(113) -> {7784, 3892, 5448};
get_question_exp(114) -> {7784, 3892, 5448};
get_question_exp(115) -> {7784, 3892, 5448};
get_question_exp(116) -> {7784, 3892, 5448};
get_question_exp(117) -> {7784, 3892, 5448};
get_question_exp(118) -> {7784, 3892, 5448};
get_question_exp(119) -> {7784, 3892, 5448};
get_question_exp(120) -> {7784, 3892, 5448};
get_question_exp(121) -> {7784, 3892, 5448};
get_question_exp(122) -> {7784, 3892, 5448};
get_question_exp(123) -> {7784, 3892, 5448};
get_question_exp(124) -> {7784, 3892, 5448};
get_question_exp(125) -> {7784, 3892, 5448};
get_question_exp(126) -> {7784, 3892, 5448};
get_question_exp(127) -> {7784, 3892, 5448};
get_question_exp(128) -> {7784, 3892, 5448};
get_question_exp(129) -> {7784, 3892, 5448};
get_question_exp(130) -> {7784, 3892, 5448};
get_question_exp(131) -> {7784, 3892, 5448};
get_question_exp(132) -> {7784, 3892, 5448};
get_question_exp(133) -> {7784, 3892, 5448};
get_question_exp(134) -> {7784, 3892, 5448};
get_question_exp(135) -> {7784, 3892, 5448};
get_question_exp(136) -> {7784, 3892, 5448};
get_question_exp(137) -> {7784, 3892, 5448};
get_question_exp(138) -> {7784, 3892, 5448};
get_question_exp(139) -> {7784, 3892, 5448};
get_question_exp(140) -> {7784, 3892, 5448};
get_question_exp(141) -> {7784, 3892, 5448};
get_question_exp(142) -> {7784, 3892, 5448};
get_question_exp(143) -> {7784, 3892, 5448};
get_question_exp(144) -> {7784, 3892, 5448};
get_question_exp(145) -> {7784, 3892, 5448};
get_question_exp(146) -> {7784, 3892, 5448};
get_question_exp(147) -> {7784, 3892, 5448};
get_question_exp(148) -> {7784, 3892, 5448};
get_question_exp(149) -> {7784, 3892, 5448};
get_question_exp(150) -> {7784, 3892, 5448};
get_question_exp(151) -> {7784, 3892, 5448};
get_question_exp(152) -> {7784, 3892, 5448};
get_question_exp(153) -> {7784, 3892, 5448};
get_question_exp(154) -> {7784, 3892, 5448};
get_question_exp(155) -> {7784, 3892, 5448};
get_question_exp(156) -> {7784, 3892, 5448};
get_question_exp(_) -> 0.

get_robber_odds(9) -> 8;
get_robber_odds(10) -> 8;
get_robber_odds(11) -> 10;
get_robber_odds(12) -> 100;
get_robber_odds(13) -> 8;
get_robber_odds(14) -> 8;
get_robber_odds(15) -> 10;
get_robber_odds(16) -> 8;
get_robber_odds(17) -> 10;
get_robber_odds(18) -> 100;
get_robber_odds(19) -> 8;
get_robber_odds(20) -> 0;
get_robber_odds(21) -> 10;
get_robber_odds(22) -> 10;
get_robber_odds(_) -> 0.

get_robber_num(Online) when Online =< 9 -> 10;
get_robber_num(Online) when Online =< 14 -> 10;
get_robber_num(Online) when Online =< 19 -> 10;
get_robber_num(Online) when Online =< 24 -> 10;
get_robber_num(Online) when Online =< 29 -> 10;
get_robber_num(Online) when Online =< 999 -> 10;
get_robber_num(_) -> 0.

get_robber_box(Join) when Join =< 5 -> 3;
get_robber_box(Join) when Join =< 9 -> 5;
get_robber_box(Join) when Join =< 14 -> 8;
get_robber_box(Join) when Join =< 19 -> 10;
get_robber_box(Join) when Join =< 999 -> 11;
get_robber_box(_) -> 0.

get_box_reward() ->
    [{[{90011, 10}, {90000, 30000}], 700},
     {[{90011, 10}, {90000, 30000}], 300}].

get_payoff(20) -> 1236;
get_payoff(21) -> 1260;
get_payoff(22) -> 1284;
get_payoff(23) -> 1308;
get_payoff(24) -> 1332;
get_payoff(25) -> 1356;
get_payoff(26) -> 1380;
get_payoff(27) -> 1404;
get_payoff(28) -> 1428;
get_payoff(29) -> 1452;
get_payoff(30) -> 1476;
get_payoff(31) -> 1556;
get_payoff(32) -> 1580;
get_payoff(33) -> 1604;
get_payoff(34) -> 1628;
get_payoff(35) -> 1658;
get_payoff(36) -> 1682;
get_payoff(37) -> 1706;
get_payoff(38) -> 1730;
get_payoff(39) -> 1760;
get_payoff(40) -> 1784;
get_payoff(41) -> 1858;
get_payoff(42) -> 1888;
get_payoff(43) -> 1912;
get_payoff(44) -> 1942;
get_payoff(45) -> 1966;
get_payoff(46) -> 1990;
get_payoff(47) -> 2020;
get_payoff(48) -> 2044;
get_payoff(49) -> 2074;
get_payoff(50) -> 2098;
get_payoff(51) -> 2128;
get_payoff(52) -> 2152;
get_payoff(53) -> 2182;
get_payoff(54) -> 2212;
get_payoff(55) -> 2236;
get_payoff(56) -> 2316;
get_payoff(57) -> 2340;
get_payoff(58) -> 2370;
get_payoff(59) -> 2400;
get_payoff(60) -> 2424;
get_payoff(61) -> 2504;
get_payoff(62) -> 2534;
get_payoff(63) -> 2564;
get_payoff(64) -> 2588;
get_payoff(65) -> 2618;
get_payoff(66) -> 2648;
get_payoff(67) -> 2678;
get_payoff(68) -> 2708;
get_payoff(69) -> 2738;
get_payoff(70) -> 2762;
get_payoff(71) -> 2792;
get_payoff(72) -> 2822;
get_payoff(73) -> 2852;
get_payoff(74) -> 2882;
get_payoff(75) -> 2912;
get_payoff(76) -> 2942;
get_payoff(77) -> 2972;
get_payoff(78) -> 3002;
get_payoff(79) -> 3032;
get_payoff(80) -> 3062;
get_payoff(81) -> 3292;
get_payoff(82) -> 3328;
get_payoff(83) -> 3358;
get_payoff(84) -> 3388;
get_payoff(85) -> 3418;
get_payoff(86) -> 3448;
get_payoff(87) -> 3478;
get_payoff(88) -> 3514;
get_payoff(89) -> 3544;
get_payoff(90) -> 3574;
get_payoff(91) -> 3604;
get_payoff(92) -> 3640;
get_payoff(93) -> 3670;
get_payoff(94) -> 3700;
get_payoff(95) -> 3736;
get_payoff(96) -> 3766;
get_payoff(97) -> 3796;
get_payoff(98) -> 3832;
get_payoff(99) -> 3862;
get_payoff(100) -> 3892;
get_payoff(101) -> 3922;
get_payoff(102) -> 3952;
get_payoff(103) -> 3982;
get_payoff(104) -> 4012;
get_payoff(105) -> 4042;
get_payoff(106) -> 4072;
get_payoff(107) -> 4102;
get_payoff(108) -> 4132;
get_payoff(109) -> 4162;
get_payoff(110) -> 4192;
get_payoff(111) -> 4222;
get_payoff(112) -> 4252;
get_payoff(113) -> 4282;
get_payoff(114) -> 4312;
get_payoff(115) -> 4342;
get_payoff(116) -> 4372;
get_payoff(117) -> 4402;
get_payoff(118) -> 4432;
get_payoff(119) -> 4462;
get_payoff(120) -> 4492;
get_payoff(121) -> 4522;
get_payoff(122) -> 4552;
get_payoff(123) -> 4582;
get_payoff(124) -> 4612;
get_payoff(125) -> 4642;
get_payoff(126) -> 4672;
get_payoff(127) -> 4702;
get_payoff(128) -> 4732;
get_payoff(129) -> 4762;
get_payoff(130) -> 4792;
get_payoff(131) -> 4822;
get_payoff(132) -> 4852;
get_payoff(133) -> 4882;
get_payoff(134) -> 4912;
get_payoff(135) -> 4942;
get_payoff(136) -> 4972;
get_payoff(137) -> 5002;
get_payoff(138) -> 5032;
get_payoff(139) -> 5062;
get_payoff(140) -> 5092;
get_payoff(141) -> 5122;
get_payoff(142) -> 5152;
get_payoff(143) -> 5182;
get_payoff(144) -> 5212;
get_payoff(145) -> 5242;
get_payoff(146) -> 5272;
get_payoff(147) -> 5302;
get_payoff(148) -> 5332;
get_payoff(149) -> 5362;
get_payoff(150) -> 5392;
get_payoff(151) -> 5422;
get_payoff(152) -> 5452;
get_payoff(153) -> 5482;
get_payoff(154) -> 5512;
get_payoff(155) -> 5542;
get_payoff(156) -> 5572;
get_payoff(_) -> 0.

get_robber_exp(1) -> {0, 310};
get_robber_exp(2) -> {0, 320};
get_robber_exp(3) -> {0, 330};
get_robber_exp(4) -> {0, 340};
get_robber_exp(5) -> {0, 350};
get_robber_exp(6) -> {0, 360};
get_robber_exp(7) -> {0, 370};
get_robber_exp(8) -> {0, 380};
get_robber_exp(9) -> {0, 390};
get_robber_exp(10) -> {0, 400};
get_robber_exp(11) -> {0, 410};
get_robber_exp(12) -> {0, 420};
get_robber_exp(13) -> {0, 430};
get_robber_exp(14) -> {0, 440};
get_robber_exp(15) -> {0, 450};
get_robber_exp(16) -> {0, 460};
get_robber_exp(17) -> {0, 470};
get_robber_exp(18) -> {0, 480};
get_robber_exp(19) -> {0, 490};
get_robber_exp(20) -> {1000, 500};
get_robber_exp(21) -> {1019, 510};
get_robber_exp(22) -> {1038, 519};
get_robber_exp(23) -> {1057, 529};
get_robber_exp(24) -> {1076, 538};
get_robber_exp(25) -> {1095, 548};
get_robber_exp(26) -> {1115, 558};
get_robber_exp(27) -> {1134, 567};
get_robber_exp(28) -> {1153, 577};
get_robber_exp(29) -> {1172, 586};
get_robber_exp(30) -> {1235, 618};
get_robber_exp(31) -> {1254, 627};
get_robber_exp(32) -> {1273, 637};
get_robber_exp(33) -> {1293, 647};
get_robber_exp(34) -> {1316, 658};
get_robber_exp(35) -> {1335, 668};
get_robber_exp(36) -> {1354, 677};
get_robber_exp(37) -> {1373, 687};
get_robber_exp(38) -> {1397, 699};
get_robber_exp(39) -> {1416, 708};
get_robber_exp(40) -> {1475, 738};
get_robber_exp(41) -> {1499, 750};
get_robber_exp(42) -> {1518, 759};
get_robber_exp(43) -> {1542, 771};
get_robber_exp(44) -> {1561, 781};
get_robber_exp(45) -> {1580, 790};
get_robber_exp(46) -> {1603, 802};
get_robber_exp(47) -> {1622, 811};
get_robber_exp(48) -> {1646, 823};
get_robber_exp(49) -> {1666, 833};
get_robber_exp(50) -> {1690, 845};
get_robber_exp(51) -> {1708, 854};
get_robber_exp(52) -> {1732, 866};
get_robber_exp(53) -> {1756, 878};
get_robber_exp(54) -> {1775, 888};
get_robber_exp(55) -> {1839, 920};
get_robber_exp(56) -> {1858, 929};
get_robber_exp(57) -> {1881, 941};
get_robber_exp(58) -> {1905, 953};
get_robber_exp(59) -> {1924, 962};
get_robber_exp(60) -> {1988, 994};
get_robber_exp(61) -> {2012, 1006};
get_robber_exp(62) -> {2035, 1018};
get_robber_exp(63) -> {2054, 1027};
get_robber_exp(64) -> {2078, 1039};
get_robber_exp(65) -> {2102, 1051};
get_robber_exp(66) -> {2126, 1063};
get_robber_exp(67) -> {2150, 1075};
get_robber_exp(68) -> {2173, 1087};
get_robber_exp(69) -> {2193, 1097};
get_robber_exp(70) -> {2217, 1109};
get_robber_exp(71) -> {2241, 1121};
get_robber_exp(72) -> {2264, 1132};
get_robber_exp(73) -> {2288, 1144};
get_robber_exp(74) -> {2312, 1156};
get_robber_exp(75) -> {2336, 1168};
get_robber_exp(76) -> {2360, 1180};
get_robber_exp(77) -> {2383, 1192};
get_robber_exp(78) -> {2407, 1204};
get_robber_exp(79) -> {2431, 1216};
get_robber_exp(80) -> {2614, 1307};
get_robber_exp(81) -> {2642, 1321};
get_robber_exp(82) -> {2666, 1333};
get_robber_exp(83) -> {2690, 1345};
get_robber_exp(84) -> {2713, 1357};
get_robber_exp(85) -> {2737, 1369};
get_robber_exp(86) -> {2761, 1381};
get_robber_exp(87) -> {2790, 1395};
get_robber_exp(88) -> {2813, 1407};
get_robber_exp(89) -> {2837, 1419};
get_robber_exp(90) -> {2861, 1431};
get_robber_exp(91) -> {2890, 1445};
get_robber_exp(92) -> {2914, 1457};
get_robber_exp(93) -> {2937, 1469};
get_robber_exp(94) -> {2966, 1483};
get_robber_exp(95) -> {2990, 1495};
get_robber_exp(96) -> {3014, 1507};
get_robber_exp(97) -> {3042, 1521};
get_robber_exp(98) -> {3066, 1533};
get_robber_exp(99) -> {3090, 1545};
get_robber_exp(100) -> {3090, 1545};
get_robber_exp(101) -> {3120, 1560};
get_robber_exp(102) -> {3151, 1575};
get_robber_exp(103) -> {3182, 1590};
get_robber_exp(104) -> {3213, 1605};
get_robber_exp(105) -> {3245, 1621};
get_robber_exp(106) -> {3277, 1637};
get_robber_exp(107) -> {3309, 1653};
get_robber_exp(108) -> {3342, 1669};
get_robber_exp(109) -> {3375, 1685};
get_robber_exp(110) -> {3408, 1701};
get_robber_exp(111) -> {3442, 1718};
get_robber_exp(112) -> {3476, 1735};
get_robber_exp(113) -> {3510, 1752};
get_robber_exp(114) -> {3545, 1769};
get_robber_exp(115) -> {3580, 1786};
get_robber_exp(116) -> {3615, 1803};
get_robber_exp(117) -> {3651, 1821};
get_robber_exp(118) -> {3687, 1839};
get_robber_exp(119) -> {3723, 1857};
get_robber_exp(120) -> {3760, 1875};
get_robber_exp(121) -> {3760, 1875};
get_robber_exp(122) -> {3760, 1875};
get_robber_exp(123) -> {3760, 1875};
get_robber_exp(124) -> {3760, 1875};
get_robber_exp(125) -> {3760, 1875};
get_robber_exp(126) -> {3760, 1875};
get_robber_exp(127) -> {3760, 1875};
get_robber_exp(128) -> {3760, 1875};
get_robber_exp(129) -> {3760, 1875};
get_robber_exp(130) -> {3760, 1875};
get_robber_exp(131) -> {3760, 1875};
get_robber_exp(132) -> {3760, 1875};
get_robber_exp(133) -> {3760, 1875};
get_robber_exp(134) -> {3760, 1875};
get_robber_exp(135) -> {3760, 1875};
get_robber_exp(136) -> {3760, 1875};
get_robber_exp(137) -> {3760, 1875};
get_robber_exp(138) -> {3760, 1875};
get_robber_exp(139) -> {3760, 1875};
get_robber_exp(140) -> {3760, 1875};
get_robber_exp(141) -> {3760, 1875};
get_robber_exp(142) -> {3760, 1875};
get_robber_exp(143) -> {3760, 1875};
get_robber_exp(144) -> {3760, 1875};
get_robber_exp(145) -> {3760, 1875};
get_robber_exp(146) -> {3760, 1875};
get_robber_exp(147) -> {3760, 1875};
get_robber_exp(148) -> {3760, 1875};
get_robber_exp(149) -> {3760, 1875};
get_robber_exp(150) -> {3760, 1875};
get_robber_exp(151) -> {3760, 1875};
get_robber_exp(152) -> {3760, 1875};
get_robber_exp(153) -> {3760, 1875};
get_robber_exp(154) -> {3760, 1875};
get_robber_exp(155) -> {3760, 1875};
get_robber_exp(156) -> {3760, 1875};
get_robber_exp(157) -> {3760, 1875};
get_robber_exp(_) -> false.

get_acceleration(1) ->
    #{mode => 1, reduce_time => 1800, gain_donation => 120,
      cost_coin => 250000};
get_acceleration(2) ->
    #{mode => 2, reduce_time => 3600, gain_donation => 240,
      cost_coin => 500000};
get_acceleration(3) ->
    #{mode => 3, reduce_time => 7200, gain_donation => 480,
      cost_coin => 1000000};
get_acceleration(_) -> false.

get_donation_exchanging(1) ->
    #{type => 1, loss_type => coin, loss_num => 250000,
      donation => 100};
get_donation_exchanging(2) ->
    #{type => 2, loss_type => coin, loss_num => 500000,
      donation => 200};
get_donation_exchanging(3) ->
    #{type => 3, loss_type => coin, loss_num => 1000000,
      donation => 400};
get_donation_exchanging(_) -> false.

get_assets_exchanging(1) ->
    #{type => 1, loss_type => gold, loss_num => 100,
      assets => 100000, donation => 20};
get_assets_exchanging(2) ->
    #{type => 2, loss_type => gold, loss_num => 300,
      assets => 300000, donation => 30};
get_assets_exchanging(3) ->
    #{type => 3, loss_type => gold, loss_num => 1000,
      assets => 1000000, donation => 200};
get_assets_exchanging(_) -> false.

get_treasure_box(79714) ->
    [#{box_id => 79714, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 55,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20014, item_num => 1,
       item_name => lang:get("高级魔兽要诀"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 88,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20076, item_num => 1,
       item_name => lang:get("太阳重置丹"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 21102, item_num => 1,
       item_name => lang:get("火凤之羽"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 28,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79714, item_id => 21312, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79714, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_treasure_box(79715) ->
    [#{box_id => 79715, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 88,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 146,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 28,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79715, item_id => 21312, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79715, item_id => 20006, item_num => 6,
       item_name => lang:get("星辰精华"), item_weight => 103,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_treasure_box(79723) ->
    [#{box_id => 79723, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 55,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 88,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79723, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79723, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 150,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79723, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 28,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79723, item_id => 21312, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79723, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 73,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_treasure_box(79724) ->
    [#{box_id => 79724, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 88,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79724, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79724, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 146,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79724, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 21312, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79724, item_id => 20006, item_num => 6,
       item_name => lang:get("星辰精华"), item_weight => 104,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_treasure_box(_) -> false.

get_week_reward({10, 0}) ->
    #{post => 10, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 0}]};
get_week_reward({10, 1}) ->
    #{post => 10, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 0}]};
get_week_reward({10, 2}) ->
    #{post => 10, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 1}]};
get_week_reward({10, 3}) ->
    #{post => 10, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 1}]};
get_week_reward({10, 4}) ->
    #{post => 10, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 1}]};
get_week_reward({10, 5}) ->
    #{post => 10, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 2}]};
get_week_reward({10, 6}) ->
    #{post => 10, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 2}]};
get_week_reward({10, 7}) ->
    #{post => 10, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 2}]};
get_week_reward({10, 8}) ->
    #{post => 10, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 3}]};
get_week_reward({10, 9}) ->
    #{post => 10, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 3}]};
get_week_reward({10, 10}) ->
    #{post => 10, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 3}]};
get_week_reward({10, 11}) ->
    #{post => 10, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 3}]};
get_week_reward({10, 12}) ->
    #{post => 10, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 4}]};
get_week_reward({10, 13}) ->
    #{post => 10, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 4}]};
get_week_reward({10, 14}) ->
    #{post => 10, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 4}]};
get_week_reward({10, 15}) ->
    #{post => 10, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 5}]};
get_week_reward({10, 16}) ->
    #{post => 10, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 5}]};
get_week_reward({10, 17}) ->
    #{post => 10, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 5}]};
get_week_reward({10, 18}) ->
    #{post => 10, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 12}], items_extra => [{23212, 6}]};
get_week_reward({20, 0}) ->
    #{post => 20, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 0}]};
get_week_reward({20, 1}) ->
    #{post => 20, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 0}]};
get_week_reward({20, 2}) ->
    #{post => 20, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 1}]};
get_week_reward({20, 3}) ->
    #{post => 20, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 1}]};
get_week_reward({20, 4}) ->
    #{post => 20, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 1}]};
get_week_reward({20, 5}) ->
    #{post => 20, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 2}]};
get_week_reward({20, 6}) ->
    #{post => 20, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 2}]};
get_week_reward({20, 7}) ->
    #{post => 20, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 2}]};
get_week_reward({20, 8}) ->
    #{post => 20, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 3}]};
get_week_reward({20, 9}) ->
    #{post => 20, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 3}]};
get_week_reward({20, 10}) ->
    #{post => 20, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 3}]};
get_week_reward({20, 11}) ->
    #{post => 20, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 3}]};
get_week_reward({20, 12}) ->
    #{post => 20, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 4}]};
get_week_reward({20, 13}) ->
    #{post => 20, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 4}]};
get_week_reward({20, 14}) ->
    #{post => 20, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 4}]};
get_week_reward({20, 15}) ->
    #{post => 20, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 5}]};
get_week_reward({20, 16}) ->
    #{post => 20, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 5}]};
get_week_reward({20, 17}) ->
    #{post => 20, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 5}]};
get_week_reward({20, 18}) ->
    #{post => 20, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 13}], items_extra => [{23212, 6}]};
get_week_reward({25, 0}) ->
    #{post => 25, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 0}]};
get_week_reward({25, 1}) ->
    #{post => 25, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 0}]};
get_week_reward({25, 2}) ->
    #{post => 25, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({25, 3}) ->
    #{post => 25, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({25, 4}) ->
    #{post => 25, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({25, 5}) ->
    #{post => 25, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({25, 6}) ->
    #{post => 25, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({25, 7}) ->
    #{post => 25, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({25, 8}) ->
    #{post => 25, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({25, 9}) ->
    #{post => 25, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({25, 10}) ->
    #{post => 25, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({25, 11}) ->
    #{post => 25, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({25, 12}) ->
    #{post => 25, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({25, 13}) ->
    #{post => 25, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({25, 14}) ->
    #{post => 25, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({25, 15}) ->
    #{post => 25, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({25, 16}) ->
    #{post => 25, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({25, 17}) ->
    #{post => 25, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({25, 18}) ->
    #{post => 25, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 6}]};
get_week_reward({30, 0}) ->
    #{post => 30, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 0}]};
get_week_reward({30, 1}) ->
    #{post => 30, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 0}]};
get_week_reward({30, 2}) ->
    #{post => 30, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({30, 3}) ->
    #{post => 30, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({30, 4}) ->
    #{post => 30, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 1}]};
get_week_reward({30, 5}) ->
    #{post => 30, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({30, 6}) ->
    #{post => 30, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({30, 7}) ->
    #{post => 30, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 2}]};
get_week_reward({30, 8}) ->
    #{post => 30, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({30, 9}) ->
    #{post => 30, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({30, 10}) ->
    #{post => 30, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({30, 11}) ->
    #{post => 30, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 3}]};
get_week_reward({30, 12}) ->
    #{post => 30, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({30, 13}) ->
    #{post => 30, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({30, 14}) ->
    #{post => 30, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 4}]};
get_week_reward({30, 15}) ->
    #{post => 30, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({30, 16}) ->
    #{post => 30, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({30, 17}) ->
    #{post => 30, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 5}]};
get_week_reward({30, 18}) ->
    #{post => 30, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 15}], items_extra => [{23212, 6}]};
get_week_reward({40, 0}) ->
    #{post => 40, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 0}]};
get_week_reward({40, 1}) ->
    #{post => 40, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 0}]};
get_week_reward({40, 2}) ->
    #{post => 40, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 1}]};
get_week_reward({40, 3}) ->
    #{post => 40, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 1}]};
get_week_reward({40, 4}) ->
    #{post => 40, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 1}]};
get_week_reward({40, 5}) ->
    #{post => 40, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 2}]};
get_week_reward({40, 6}) ->
    #{post => 40, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 2}]};
get_week_reward({40, 7}) ->
    #{post => 40, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 2}]};
get_week_reward({40, 8}) ->
    #{post => 40, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 3}]};
get_week_reward({40, 9}) ->
    #{post => 40, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 3}]};
get_week_reward({40, 10}) ->
    #{post => 40, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 3}]};
get_week_reward({40, 11}) ->
    #{post => 40, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 3}]};
get_week_reward({40, 12}) ->
    #{post => 40, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 4}]};
get_week_reward({40, 13}) ->
    #{post => 40, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 4}]};
get_week_reward({40, 14}) ->
    #{post => 40, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 4}]};
get_week_reward({40, 15}) ->
    #{post => 40, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 5}]};
get_week_reward({40, 16}) ->
    #{post => 40, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 5}]};
get_week_reward({40, 17}) ->
    #{post => 40, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 5}]};
get_week_reward({40, 18}) ->
    #{post => 40, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 18}], items_extra => [{23212, 6}]};
get_week_reward({50, 0}) ->
    #{post => 50, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 0}]};
get_week_reward({50, 1}) ->
    #{post => 50, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 0}]};
get_week_reward({50, 2}) ->
    #{post => 50, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 1}]};
get_week_reward({50, 3}) ->
    #{post => 50, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 1}]};
get_week_reward({50, 4}) ->
    #{post => 50, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 1}]};
get_week_reward({50, 5}) ->
    #{post => 50, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 2}]};
get_week_reward({50, 6}) ->
    #{post => 50, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 2}]};
get_week_reward({50, 7}) ->
    #{post => 50, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 2}]};
get_week_reward({50, 8}) ->
    #{post => 50, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 3}]};
get_week_reward({50, 9}) ->
    #{post => 50, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 3}]};
get_week_reward({50, 10}) ->
    #{post => 50, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 3}]};
get_week_reward({50, 11}) ->
    #{post => 50, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 3}]};
get_week_reward({50, 12}) ->
    #{post => 50, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 4}]};
get_week_reward({50, 13}) ->
    #{post => 50, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 4}]};
get_week_reward({50, 14}) ->
    #{post => 50, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 4}]};
get_week_reward({50, 15}) ->
    #{post => 50, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 5}]};
get_week_reward({50, 16}) ->
    #{post => 50, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 5}]};
get_week_reward({50, 17}) ->
    #{post => 50, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 5}]};
get_week_reward({50, 18}) ->
    #{post => 50, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 20}], items_extra => [{23212, 6}]};
get_week_reward({60, 0}) ->
    #{post => 60, academy_lev => 0,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 0}]};
get_week_reward({60, 1}) ->
    #{post => 60, academy_lev => 1,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 0}]};
get_week_reward({60, 2}) ->
    #{post => 60, academy_lev => 2,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 1}]};
get_week_reward({60, 3}) ->
    #{post => 60, academy_lev => 3,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 1}]};
get_week_reward({60, 4}) ->
    #{post => 60, academy_lev => 4,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 1}]};
get_week_reward({60, 5}) ->
    #{post => 60, academy_lev => 5,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 2}]};
get_week_reward({60, 6}) ->
    #{post => 60, academy_lev => 6,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 2}]};
get_week_reward({60, 7}) ->
    #{post => 60, academy_lev => 7,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 2}]};
get_week_reward({60, 8}) ->
    #{post => 60, academy_lev => 8,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 3}]};
get_week_reward({60, 9}) ->
    #{post => 60, academy_lev => 9,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 3}]};
get_week_reward({60, 10}) ->
    #{post => 60, academy_lev => 10,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 3}]};
get_week_reward({60, 11}) ->
    #{post => 60, academy_lev => 11,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 3}]};
get_week_reward({60, 12}) ->
    #{post => 60, academy_lev => 12,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 4}]};
get_week_reward({60, 13}) ->
    #{post => 60, academy_lev => 13,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 4}]};
get_week_reward({60, 14}) ->
    #{post => 60, academy_lev => 14,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 4}]};
get_week_reward({60, 15}) ->
    #{post => 60, academy_lev => 15,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 5}]};
get_week_reward({60, 16}) ->
    #{post => 60, academy_lev => 16,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 5}]};
get_week_reward({60, 17}) ->
    #{post => 60, academy_lev => 17,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 5}]};
get_week_reward({60, 18}) ->
    #{post => 60, academy_lev => 18,
      title => lang:get("公会周奖励"),
      content => lang:get("根据你在公会里担任的职位和研究院等级，发放本周的工资如下："),
      items => [{23212, 25}], items_extra => [{23212, 6}]};
get_week_reward(_) -> false.

get_element({1, 5}) ->
    #{lev => 1, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 24}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 21}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({2, 5}) ->
    #{lev => 2, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 25}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 22}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({3, 5}) ->
    #{lev => 3, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 26}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 23}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({4, 5}) ->
    #{lev => 4, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 28}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 25}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({5, 5}) ->
    #{lev => 5, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 29}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 26}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({6, 5}) ->
    #{lev => 6, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 31}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 27}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({7, 5}) ->
    #{lev => 7, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 32}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 28}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({8, 5}) ->
    #{lev => 8, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 34}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 30}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({9, 5}) ->
    #{lev => 9, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 35}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 31}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({10, 5}) ->
    #{lev => 10, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 37}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 32}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({11, 5}) ->
    #{lev => 11, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 38}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 34}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({12, 5}) ->
    #{lev => 12, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 39}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 35}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({13, 5}) ->
    #{lev => 13, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 41}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 36}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({14, 5}) ->
    #{lev => 14, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 42}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 37}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({15, 5}) ->
    #{lev => 15, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 44}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 39}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({16, 5}) ->
    #{lev => 16, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 45}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 40}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({17, 5}) ->
    #{lev => 17, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 47}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 41}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({18, 5}) ->
    #{lev => 18, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 48}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 42}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({19, 5}) ->
    #{lev => 19, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 50}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 44}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({20, 5}) ->
    #{lev => 20, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 51}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 45}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({21, 5}) ->
    #{lev => 21, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 52}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 46}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({22, 5}) ->
    #{lev => 22, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 53}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 47}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({23, 5}) ->
    #{lev => 23, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 54}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 47}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({24, 5}) ->
    #{lev => 24, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 55}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 48}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({25, 5}) ->
    #{lev => 25, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 55}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 49}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({26, 5}) ->
    #{lev => 26, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 56}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 50}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({27, 5}) ->
    #{lev => 27, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 57}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 50}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({28, 5}) ->
    #{lev => 28, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 58}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 51}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({29, 5}) ->
    #{lev => 29, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 59}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 52}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({30, 5}) ->
    #{lev => 30, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 60}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 53}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({31, 5}) ->
    #{lev => 31, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 61}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 54}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({32, 5}) ->
    #{lev => 32, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 62}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 54}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({33, 5}) ->
    #{lev => 33, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 63}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 55}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({34, 5}) ->
    #{lev => 34, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 63}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 56}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({35, 5}) ->
    #{lev => 35, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 64}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 57}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({36, 5}) ->
    #{lev => 36, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 65}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 58}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({37, 5}) ->
    #{lev => 37, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 66}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 58}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({38, 5}) ->
    #{lev => 38, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 67}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 59}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({39, 5}) ->
    #{lev => 39, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 68}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 60}],
      up_ratio => 0, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({40, 5}) ->
    #{lev => 40, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 69}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 61}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({41, 5}) ->
    #{lev => 41, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 70}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 61}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({42, 5}) ->
    #{lev => 42, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 71}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 62}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({43, 5}) ->
    #{lev => 43, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 71}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 63}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({44, 5}) ->
    #{lev => 44, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 72}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 64}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({45, 5}) ->
    #{lev => 45, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 73}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 65}],
      up_ratio => 20, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({46, 5}) ->
    #{lev => 46, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 74}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 65}],
      up_ratio => 25, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({47, 5}) ->
    #{lev => 47, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 75}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 66}],
      up_ratio => 25, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({48, 5}) ->
    #{lev => 48, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 76}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 67}],
      up_ratio => 25, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({49, 5}) ->
    #{lev => 49, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 77}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 68}],
      up_ratio => 25, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({50, 5}) ->
    #{lev => 50, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 78}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 68}],
      up_ratio => 25, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({51, 5}) ->
    #{lev => 51, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 78}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 69}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({52, 5}) ->
    #{lev => 52, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 79}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 70}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({53, 5}) ->
    #{lev => 53, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 80}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 70}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({54, 5}) ->
    #{lev => 54, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 80}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 71}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({55, 5}) ->
    #{lev => 55, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 81}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 71}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({56, 5}) ->
    #{lev => 56, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 82}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 72}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({57, 5}) ->
    #{lev => 57, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 82}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 73}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({58, 5}) ->
    #{lev => 58, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 83}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 73}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({59, 5}) ->
    #{lev => 59, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 84}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 74}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({60, 5}) ->
    #{lev => 60, element_type => 5,
      element_name => lang:get("疾风"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{3, 84}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{3, 74}],
      up_ratio => 30, skill_prac => [], up_attr => [{53, 10}],
      pet_up_attr => [{31, 3}]};
get_element({1, 6}) ->
    #{lev => 1, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 112}, {5, 89}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 108}, {5, 96}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({2, 6}) ->
    #{lev => 2, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 118}, {5, 95}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 114}, {5, 102}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({3, 6}) ->
    #{lev => 3, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 125}, {5, 100}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 121}, {5, 108}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({4, 6}) ->
    #{lev => 4, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 132}, {5, 106}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 128}, {5, 114}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({5, 6}) ->
    #{lev => 5, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 139}, {5, 111}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 134}, {5, 120}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({6, 6}) ->
    #{lev => 6, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 146}, {5, 117}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 141}, {5, 126}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({7, 6}) ->
    #{lev => 7, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 153}, {5, 122}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 147}, {5, 131}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({8, 6}) ->
    #{lev => 8, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 159}, {5, 127}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 154}, {5, 137}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({9, 6}) ->
    #{lev => 9, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 166}, {5, 133}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 160}, {5, 143}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({10, 6}) ->
    #{lev => 10, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 173}, {5, 138}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 167}, {5, 149}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({11, 6}) ->
    #{lev => 11, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 180}, {5, 144}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 174}, {5, 155}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({12, 6}) ->
    #{lev => 12, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 187}, {5, 149}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 180}, {5, 161}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({13, 6}) ->
    #{lev => 13, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 193}, {5, 155}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 187}, {5, 167}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({14, 6}) ->
    #{lev => 14, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 200}, {5, 160}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 193}, {5, 172}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({15, 6}) ->
    #{lev => 15, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 207}, {5, 166}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 200}, {5, 178}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({16, 6}) ->
    #{lev => 16, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 214}, {5, 171}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 206}, {5, 184}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({17, 6}) ->
    #{lev => 17, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 221}, {5, 176}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 213}, {5, 190}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({18, 6}) ->
    #{lev => 18, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 227}, {5, 182}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 220}, {5, 196}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({19, 6}) ->
    #{lev => 19, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 234}, {5, 187}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 226}, {5, 202}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({20, 6}) ->
    #{lev => 20, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 241}, {5, 193}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 233}, {5, 208}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({21, 6}) ->
    #{lev => 21, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 245}, {5, 196}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 237}, {5, 211}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({22, 6}) ->
    #{lev => 22, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 249}, {5, 200}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 241}, {5, 215}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({23, 6}) ->
    #{lev => 23, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 254}, {5, 203}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 245}, {5, 219}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({24, 6}) ->
    #{lev => 24, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 258}, {5, 206}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 249}, {5, 222}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({25, 6}) ->
    #{lev => 25, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 262}, {5, 210}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 253}, {5, 226}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({26, 6}) ->
    #{lev => 26, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 266}, {5, 213}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 257}, {5, 229}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({27, 6}) ->
    #{lev => 27, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 270}, {5, 216}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 261}, {5, 233}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({28, 6}) ->
    #{lev => 28, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 275}, {5, 220}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 265}, {5, 237}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({29, 6}) ->
    #{lev => 29, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 279}, {5, 223}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 269}, {5, 240}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({30, 6}) ->
    #{lev => 30, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 283}, {5, 226}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 273}, {5, 244}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({31, 6}) ->
    #{lev => 31, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 287}, {5, 230}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 277}, {5, 247}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({32, 6}) ->
    #{lev => 32, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 291}, {5, 233}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 281}, {5, 251}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({33, 6}) ->
    #{lev => 33, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 296}, {5, 236}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 285}, {5, 255}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({34, 6}) ->
    #{lev => 34, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 300}, {5, 240}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 289}, {5, 258}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({35, 6}) ->
    #{lev => 35, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 304}, {5, 243}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 293}, {5, 262}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({36, 6}) ->
    #{lev => 36, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 308}, {5, 246}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 298}, {5, 265}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({37, 6}) ->
    #{lev => 37, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 312}, {5, 250}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 302}, {5, 269}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({38, 6}) ->
    #{lev => 38, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 317}, {5, 253}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 306}, {5, 273}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({39, 6}) ->
    #{lev => 39, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 321}, {5, 257}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 310}, {5, 276}], up_ratio => 0,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({40, 6}) ->
    #{lev => 40, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 325}, {5, 260}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 314}, {5, 280}], up_ratio => 20,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({41, 6}) ->
    #{lev => 41, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 329}, {5, 263}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 318}, {5, 284}], up_ratio => 20,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({42, 6}) ->
    #{lev => 42, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 333}, {5, 267}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 322}, {5, 287}], up_ratio => 20,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({43, 6}) ->
    #{lev => 43, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 338}, {5, 270}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 326}, {5, 291}], up_ratio => 20,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({44, 6}) ->
    #{lev => 44, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 342}, {5, 273}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 330}, {5, 294}], up_ratio => 20,
      skill_prac => [{62000, 1}], up_attr => [],
      pet_up_attr => []};
get_element({45, 6}) ->
    #{lev => 45, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 346}, {5, 277}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 334}, {5, 298}], up_ratio => 20,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({46, 6}) ->
    #{lev => 46, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 350}, {5, 280}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 338}, {5, 302}], up_ratio => 25,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({47, 6}) ->
    #{lev => 47, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 354}, {5, 283}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 342}, {5, 305}], up_ratio => 25,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({48, 6}) ->
    #{lev => 48, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 358}, {5, 287}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 346}, {5, 309}], up_ratio => 25,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({49, 6}) ->
    #{lev => 49, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 363}, {5, 290}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 350}, {5, 312}], up_ratio => 25,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({50, 6}) ->
    #{lev => 50, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 367}, {5, 293}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 354}, {5, 316}], up_ratio => 25,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({51, 6}) ->
    #{lev => 51, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 370}, {5, 296}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 357}, {5, 319}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({52, 6}) ->
    #{lev => 52, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 373}, {5, 298}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 360}, {5, 321}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({53, 6}) ->
    #{lev => 53, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 376}, {5, 301}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 363}, {5, 324}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({54, 6}) ->
    #{lev => 54, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 379}, {5, 304}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 366}, {5, 327}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({55, 6}) ->
    #{lev => 55, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 383}, {5, 306}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 369}, {5, 330}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({56, 6}) ->
    #{lev => 56, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 386}, {5, 309}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 372}, {5, 332}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({57, 6}) ->
    #{lev => 57, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 389}, {5, 311}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 375}, {5, 335}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({58, 6}) ->
    #{lev => 58, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 392}, {5, 314}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 378}, {5, 338}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({59, 6}) ->
    #{lev => 59, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 395}, {5, 316}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 382}, {5, 340}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({60, 6}) ->
    #{lev => 60, element_type => 6,
      element_name => lang:get("奥火"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{4, 398}, {5, 319}], open_pet_lev => 20,
      pet_buff_id => 31001,
      pet_buff_attr => [{4, 385}, {5, 343}], up_ratio => 30,
      skill_prac => [{62300, 1}], up_attr => [],
      pet_up_attr => []};
get_element({1, 7}) ->
    #{lev => 1, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 58}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 55}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({2, 7}) ->
    #{lev => 2, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 62}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 59}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({3, 7}) ->
    #{lev => 3, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 65}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 62}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({4, 7}) ->
    #{lev => 4, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 69}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 65}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({5, 7}) ->
    #{lev => 5, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 72}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 69}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({6, 7}) ->
    #{lev => 6, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 76}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 72}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({7, 7}) ->
    #{lev => 7, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 79}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 75}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({8, 7}) ->
    #{lev => 8, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 83}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 79}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({9, 7}) ->
    #{lev => 9, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 86}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 82}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({10, 7}) ->
    #{lev => 10, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 90}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 85}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({11, 7}) ->
    #{lev => 11, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 93}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 89}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({12, 7}) ->
    #{lev => 12, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 97}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 92}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({13, 7}) ->
    #{lev => 13, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 101}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 96}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({14, 7}) ->
    #{lev => 14, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 104}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 99}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({15, 7}) ->
    #{lev => 15, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 108}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 102}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({16, 7}) ->
    #{lev => 16, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 111}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 106}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({17, 7}) ->
    #{lev => 17, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 115}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 109}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({18, 7}) ->
    #{lev => 18, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 118}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 112}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({19, 7}) ->
    #{lev => 19, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 122}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 116}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({20, 7}) ->
    #{lev => 20, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 125}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 119}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({21, 7}) ->
    #{lev => 21, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 128}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 121}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({22, 7}) ->
    #{lev => 22, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 130}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 123}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({23, 7}) ->
    #{lev => 23, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 132}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 125}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({24, 7}) ->
    #{lev => 24, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 134}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 127}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({25, 7}) ->
    #{lev => 25, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 136}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 129}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({26, 7}) ->
    #{lev => 26, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 138}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 132}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({27, 7}) ->
    #{lev => 27, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 141}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 134}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({28, 7}) ->
    #{lev => 28, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 143}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 136}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({29, 7}) ->
    #{lev => 29, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 145}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 138}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({30, 7}) ->
    #{lev => 30, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 147}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 140}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({31, 7}) ->
    #{lev => 31, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 149}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 142}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({32, 7}) ->
    #{lev => 32, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 151}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 144}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({33, 7}) ->
    #{lev => 33, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 154}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 146}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({34, 7}) ->
    #{lev => 34, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 156}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 148}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({35, 7}) ->
    #{lev => 35, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 158}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 150}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({36, 7}) ->
    #{lev => 36, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 160}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 152}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({37, 7}) ->
    #{lev => 37, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 162}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 154}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({38, 7}) ->
    #{lev => 38, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 165}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 156}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({39, 7}) ->
    #{lev => 39, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 167}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 158}],
      up_ratio => 0, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({40, 7}) ->
    #{lev => 40, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 169}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 161}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({41, 7}) ->
    #{lev => 41, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 171}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 163}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({42, 7}) ->
    #{lev => 42, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 173}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 165}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({43, 7}) ->
    #{lev => 43, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 175}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 167}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({44, 7}) ->
    #{lev => 44, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 178}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 169}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({45, 7}) ->
    #{lev => 45, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 180}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 171}],
      up_ratio => 20, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({46, 7}) ->
    #{lev => 46, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 182}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 173}],
      up_ratio => 25, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({47, 7}) ->
    #{lev => 47, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 184}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 175}],
      up_ratio => 25, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({48, 7}) ->
    #{lev => 48, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 186}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 177}],
      up_ratio => 25, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({49, 7}) ->
    #{lev => 49, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 189}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 179}],
      up_ratio => 25, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({50, 7}) ->
    #{lev => 50, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 191}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 181}],
      up_ratio => 25, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({51, 7}) ->
    #{lev => 51, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 192}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 183}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({52, 7}) ->
    #{lev => 52, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 194}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 184}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({53, 7}) ->
    #{lev => 53, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 196}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 186}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({54, 7}) ->
    #{lev => 54, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 197}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 187}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({55, 7}) ->
    #{lev => 55, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 199}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 189}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({56, 7}) ->
    #{lev => 56, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 201}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 191}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({57, 7}) ->
    #{lev => 57, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 202}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 192}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({58, 7}) ->
    #{lev => 58, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 204}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 194}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({59, 7}) ->
    #{lev => 59, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 205}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 195}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({60, 7}) ->
    #{lev => 60, element_type => 7,
      element_name => lang:get("大地"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{6, 207}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{6, 197}],
      up_ratio => 30, skill_prac => [{62100, 1}],
      up_attr => [], pet_up_attr => []};
get_element({1, 8}) ->
    #{lev => 1, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 46}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 46}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({2, 8}) ->
    #{lev => 2, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 49}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 49}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({3, 8}) ->
    #{lev => 3, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 52}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 52}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({4, 8}) ->
    #{lev => 4, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 55}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 55}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({5, 8}) ->
    #{lev => 5, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 58}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 58}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({6, 8}) ->
    #{lev => 6, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 61}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 61}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({7, 8}) ->
    #{lev => 7, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 63}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 63}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({8, 8}) ->
    #{lev => 8, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 66}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 66}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({9, 8}) ->
    #{lev => 9, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 69}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 69}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({10, 8}) ->
    #{lev => 10, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 72}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 72}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({11, 8}) ->
    #{lev => 11, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 75}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 75}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({12, 8}) ->
    #{lev => 12, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 78}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 78}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({13, 8}) ->
    #{lev => 13, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 80}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 80}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({14, 8}) ->
    #{lev => 14, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 83}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 83}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({15, 8}) ->
    #{lev => 15, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 86}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 86}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({16, 8}) ->
    #{lev => 16, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 89}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 89}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({17, 8}) ->
    #{lev => 17, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 92}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 92}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({18, 8}) ->
    #{lev => 18, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 95}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 95}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({19, 8}) ->
    #{lev => 19, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 97}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 97}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({20, 8}) ->
    #{lev => 20, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 100}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 100}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({21, 8}) ->
    #{lev => 21, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 102}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 102}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({22, 8}) ->
    #{lev => 22, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 104}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 104}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({23, 8}) ->
    #{lev => 23, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 105}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 106}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({24, 8}) ->
    #{lev => 24, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 107}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 107}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({25, 8}) ->
    #{lev => 25, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 109}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 109}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({26, 8}) ->
    #{lev => 26, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 111}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 111}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({27, 8}) ->
    #{lev => 27, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 112}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 112}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({28, 8}) ->
    #{lev => 28, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 114}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 114}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({29, 8}) ->
    #{lev => 29, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 116}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 116}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({30, 8}) ->
    #{lev => 30, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 118}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 118}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({31, 8}) ->
    #{lev => 31, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 119}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 119}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({32, 8}) ->
    #{lev => 32, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 121}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 121}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({33, 8}) ->
    #{lev => 33, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 123}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 123}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({34, 8}) ->
    #{lev => 34, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 125}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 125}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({35, 8}) ->
    #{lev => 35, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 126}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 126}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({36, 8}) ->
    #{lev => 36, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 128}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 128}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({37, 8}) ->
    #{lev => 37, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 130}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 130}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({38, 8}) ->
    #{lev => 38, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 132}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 132}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({39, 8}) ->
    #{lev => 39, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 133}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 133}],
      up_ratio => 0, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({40, 8}) ->
    #{lev => 40, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 135}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 135}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({41, 8}) ->
    #{lev => 41, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 137}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 137}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({42, 8}) ->
    #{lev => 42, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 139}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 139}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({43, 8}) ->
    #{lev => 43, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 140}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 140}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({44, 8}) ->
    #{lev => 44, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 142}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 142}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({45, 8}) ->
    #{lev => 45, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 144}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 144}],
      up_ratio => 20, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({46, 8}) ->
    #{lev => 46, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 146}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 146}],
      up_ratio => 25, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({47, 8}) ->
    #{lev => 47, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 147}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 147}],
      up_ratio => 25, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({48, 8}) ->
    #{lev => 48, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 149}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 149}],
      up_ratio => 25, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({49, 8}) ->
    #{lev => 49, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 151}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 151}],
      up_ratio => 25, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({50, 8}) ->
    #{lev => 50, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 153}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 153}],
      up_ratio => 25, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({51, 8}) ->
    #{lev => 51, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 154}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 154}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({52, 8}) ->
    #{lev => 52, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 155}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 155}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({53, 8}) ->
    #{lev => 53, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 156}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 157}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({54, 8}) ->
    #{lev => 54, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 158}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 158}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({55, 8}) ->
    #{lev => 55, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 159}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 159}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({56, 8}) ->
    #{lev => 56, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 160}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 160}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({57, 8}) ->
    #{lev => 57, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 162}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 162}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({58, 8}) ->
    #{lev => 58, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 163}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 163}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({59, 8}) ->
    #{lev => 59, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 164}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 164}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({60, 8}) ->
    #{lev => 60, element_type => 8,
      element_name => lang:get("真水"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{7, 166}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{7, 166}],
      up_ratio => 30, skill_prac => [{62200, 1}],
      up_attr => [], pet_up_attr => []};
get_element({1, 9}) ->
    #{lev => 1, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 375}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 263}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({2, 9}) ->
    #{lev => 2, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 398}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 279}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({3, 9}) ->
    #{lev => 3, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 421}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 295}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({4, 9}) ->
    #{lev => 4, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 444}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 311}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({5, 9}) ->
    #{lev => 5, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 467}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 327}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({6, 9}) ->
    #{lev => 6, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 490}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 343}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({7, 9}) ->
    #{lev => 7, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 512}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 359}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({8, 9}) ->
    #{lev => 8, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 535}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 375}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({9, 9}) ->
    #{lev => 9, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 558}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 391}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({10, 9}) ->
    #{lev => 10, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 581}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 407}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({11, 9}) ->
    #{lev => 11, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 604}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 423}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({12, 9}) ->
    #{lev => 12, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 627}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 439}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({13, 9}) ->
    #{lev => 13, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 650}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 455}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({14, 9}) ->
    #{lev => 14, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 673}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 471}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({15, 9}) ->
    #{lev => 15, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 696}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 487}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({16, 9}) ->
    #{lev => 16, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 718}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 503}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({17, 9}) ->
    #{lev => 17, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 741}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 519}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({18, 9}) ->
    #{lev => 18, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 764}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 535}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({19, 9}) ->
    #{lev => 19, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 787}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 551}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({20, 9}) ->
    #{lev => 20, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 810}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 567}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({21, 9}) ->
    #{lev => 21, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 824}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 577}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({22, 9}) ->
    #{lev => 22, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 838}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 587}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({23, 9}) ->
    #{lev => 23, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 852}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 597}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({24, 9}) ->
    #{lev => 24, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 866}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 606}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({25, 9}) ->
    #{lev => 25, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 880}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 616}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({26, 9}) ->
    #{lev => 26, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 895}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 626}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({27, 9}) ->
    #{lev => 27, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 909}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 636}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({28, 9}) ->
    #{lev => 28, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 923}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 646}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({29, 9}) ->
    #{lev => 29, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 937}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 656}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({30, 9}) ->
    #{lev => 30, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 951}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 666}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({31, 9}) ->
    #{lev => 31, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 965}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 675}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({32, 9}) ->
    #{lev => 32, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 979}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 685}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({33, 9}) ->
    #{lev => 33, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 993}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 695}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({34, 9}) ->
    #{lev => 34, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1007}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 705}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({35, 9}) ->
    #{lev => 35, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1021}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 715}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({36, 9}) ->
    #{lev => 36, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1035}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 725}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({37, 9}) ->
    #{lev => 37, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1049}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 735}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({38, 9}) ->
    #{lev => 38, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1064}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 744}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({39, 9}) ->
    #{lev => 39, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1078}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 754}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({40, 9}) ->
    #{lev => 40, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1092}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 764}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({41, 9}) ->
    #{lev => 41, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1106}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 774}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({42, 9}) ->
    #{lev => 42, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1120}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 784}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({43, 9}) ->
    #{lev => 43, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1134}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 794}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({44, 9}) ->
    #{lev => 44, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1148}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 804}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({45, 9}) ->
    #{lev => 45, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1162}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 814}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({46, 9}) ->
    #{lev => 46, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1176}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 823}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({47, 9}) ->
    #{lev => 47, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1190}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 833}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({48, 9}) ->
    #{lev => 48, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1204}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 843}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({49, 9}) ->
    #{lev => 49, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1219}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 853}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({50, 9}) ->
    #{lev => 50, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1233}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 863}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({51, 9}) ->
    #{lev => 51, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1243}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 870}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({52, 9}) ->
    #{lev => 52, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1254}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 878}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({53, 9}) ->
    #{lev => 53, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1264}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 885}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({54, 9}) ->
    #{lev => 54, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1275}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 892}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({55, 9}) ->
    #{lev => 55, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1285}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 900}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({56, 9}) ->
    #{lev => 56, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1296}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 907}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({57, 9}) ->
    #{lev => 57, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1307}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 915}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({58, 9}) ->
    #{lev => 58, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1317}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 922}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({59, 9}) ->
    #{lev => 59, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1328}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 929}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({60, 9}) ->
    #{lev => 60, element_type => 9,
      element_name => lang:get("秘林"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{1, 1338}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{1, 937}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{45, 30}, {46, 20}]};
get_element({1, 10}) ->
    #{lev => 1, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 1200000, need => 2000000,
      need_time => 28800, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 222}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 208}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({2, 10}) ->
    #{lev => 2, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 142000, need => 5142000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 236}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 221}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({3, 10}) ->
    #{lev => 3, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 158000, need => 5158000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 249}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 234}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({4, 10}) ->
    #{lev => 4, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 175000, need => 5175000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 263}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 247}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({5, 10}) ->
    #{lev => 5, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 192000, need => 5192000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 277}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 259}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({6, 10}) ->
    #{lev => 6, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 208000, need => 5208000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 290}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 272}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({7, 10}) ->
    #{lev => 7, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 225000, need => 5225000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 304}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 285}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({8, 10}) ->
    #{lev => 8, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 242000, need => 5242000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 317}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 297}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({9, 10}) ->
    #{lev => 9, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 258000, need => 5258000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 331}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 310}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({10, 10}) ->
    #{lev => 10, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 275000, need => 5275000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 344}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 323}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({11, 10}) ->
    #{lev => 11, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 292000, need => 5292000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 358}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 336}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({12, 10}) ->
    #{lev => 12, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 308000, need => 5308000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 371}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 348}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({13, 10}) ->
    #{lev => 13, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 325000, need => 5325000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 385}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 361}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({14, 10}) ->
    #{lev => 14, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 342000, need => 5342000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 399}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 374}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({15, 10}) ->
    #{lev => 15, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 358000, need => 5358000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 412}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 386}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({16, 10}) ->
    #{lev => 16, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 375000, need => 5375000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 426}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 399}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({17, 10}) ->
    #{lev => 17, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 392000, need => 5392000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 439}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 412}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({18, 10}) ->
    #{lev => 18, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 408000, need => 5408000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 453}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 425}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({19, 10}) ->
    #{lev => 19, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 425000, need => 5425000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 466}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 437}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({20, 10}) ->
    #{lev => 20, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 70, cost => 442000, need => 5442000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 480}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 450}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({21, 10}) ->
    #{lev => 21, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 75, cost => 500000, need => 5500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 488}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 458}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({22, 10}) ->
    #{lev => 22, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 75, cost => 583000, need => 5583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 497}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 466}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({23, 10}) ->
    #{lev => 23, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 75, cost => 667000, need => 5667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 505}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 473}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({24, 10}) ->
    #{lev => 24, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 75, cost => 750000, need => 5750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 513}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 481}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({25, 10}) ->
    #{lev => 25, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 75, cost => 833000, need => 5833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 522}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 489}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({26, 10}) ->
    #{lev => 26, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 80, cost => 833000, need => 5833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 530}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 497}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({27, 10}) ->
    #{lev => 27, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 80, cost => 917000, need => 5917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 538}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 505}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({28, 10}) ->
    #{lev => 28, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 80, cost => 1000000, need => 6000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 547}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 513}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({29, 10}) ->
    #{lev => 29, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 80, cost => 1083000, need => 6083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 555}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 520}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({30, 10}) ->
    #{lev => 30, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 80, cost => 1167000, need => 6167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 563}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 528}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({31, 10}) ->
    #{lev => 31, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 85, cost => 1167000, need => 6167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 572}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 536}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({32, 10}) ->
    #{lev => 32, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 85, cost => 1250000, need => 6250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 580}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 544}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({33, 10}) ->
    #{lev => 33, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 85, cost => 1333000, need => 6333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 589}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 552}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({34, 10}) ->
    #{lev => 34, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 85, cost => 1417000, need => 6417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 597}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 560}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({35, 10}) ->
    #{lev => 35, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 85, cost => 1500000, need => 6500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 605}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 567}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({36, 10}) ->
    #{lev => 36, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 90, cost => 1500000, need => 6500000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 614}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 575}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({37, 10}) ->
    #{lev => 37, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 90, cost => 1583000, need => 6583000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 622}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 583}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({38, 10}) ->
    #{lev => 38, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 90, cost => 1667000, need => 6667000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 630}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 591}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({39, 10}) ->
    #{lev => 39, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 90, cost => 1750000, need => 6750000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 639}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 599}],
      up_ratio => 0, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({40, 10}) ->
    #{lev => 40, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 90, cost => 1833000, need => 6833000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 647}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 607}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({41, 10}) ->
    #{lev => 41, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 95, cost => 1833000, need => 6833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 655}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 614}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({42, 10}) ->
    #{lev => 42, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 95, cost => 1917000, need => 6917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 664}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 622}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({43, 10}) ->
    #{lev => 43, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 95, cost => 2000000, need => 7000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 672}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 630}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({44, 10}) ->
    #{lev => 44, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 95, cost => 2083000, need => 7083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 680}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 638}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({45, 10}) ->
    #{lev => 45, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 95, cost => 2167000, need => 7167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 689}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 646}],
      up_ratio => 20, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({46, 10}) ->
    #{lev => 46, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 100, cost => 2167000, need => 7167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 697}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 653}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({47, 10}) ->
    #{lev => 47, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 100, cost => 2250000, need => 7250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 705}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 661}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({48, 10}) ->
    #{lev => 48, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 100, cost => 2333000, need => 7333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 714}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 669}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({49, 10}) ->
    #{lev => 49, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 100, cost => 2417000, need => 7417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 722}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 677}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({50, 10}) ->
    #{lev => 50, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 100, cost => 2500000, need => 7500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 730}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 685}],
      up_ratio => 25, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({51, 10}) ->
    #{lev => 51, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 105, cost => 3167000, need => 8167000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 737}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 691}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({52, 10}) ->
    #{lev => 52, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 105, cost => 3250000, need => 8250000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 743}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 697}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({53, 10}) ->
    #{lev => 53, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 105, cost => 3333000, need => 8333000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 749}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 702}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({54, 10}) ->
    #{lev => 54, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 105, cost => 3417000, need => 8417000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 755}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 708}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({55, 10}) ->
    #{lev => 55, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 105, cost => 3500000, need => 8500000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 762}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 714}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({56, 10}) ->
    #{lev => 56, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 110, cost => 3833000, need => 8833000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 768}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 720}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({57, 10}) ->
    #{lev => 57, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 110, cost => 3917000, need => 8917000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 774}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 726}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({58, 10}) ->
    #{lev => 58, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 110, cost => 4000000, need => 9000000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 781}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 732}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({59, 10}) ->
    #{lev => 59, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 110, cost => 4083000, need => 9083000,
      need_time => 0, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 787}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 738}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element({60, 10}) ->
    #{lev => 60, element_type => 10,
      element_name => lang:get("雷霆"), need_lev => 2,
      need_world_lev => 110, cost => 4167000, need => 9167000,
      need_time => 3600, pray_ratio => 100, buff_id => 31000,
      buff_attr => [{2, 793}], open_pet_lev => 20,
      pet_buff_id => 31001, pet_buff_attr => [{2, 743}],
      up_ratio => 30, skill_prac => [], up_attr => [],
      pet_up_attr => [{30, 3}]};
get_element(_) -> false.

get_rand_element(1) -> [{1, 0}, {2, 1000}];
get_rand_element(2) ->
    [{1, 0}, {2, 600}, {3, 250}, {4, 150}];
get_rand_element(_) -> [].

get_element_attr_ratio(1) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(2) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(3) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(4) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(5) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(6) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(7) ->
    [{60, 100},
     {70, 200},
     {80, 200},
     {90, 200},
     {100, 100},
     {110, 100},
     {120, 100}];
get_element_attr_ratio(_) -> false.

get_element_cost(6) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(7) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(8) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(9) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(10) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(11) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(12) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(13) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(14) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(15) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(16) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(17) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(18) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(19) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(20) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(21) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(22) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(23) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(24) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(25) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(26) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(27) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(28) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(29) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(30) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(31) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(32) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(33) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(34) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(35) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(36) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(37) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(38) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(39) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(40) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(41) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(42) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(43) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(44) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(45) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(46) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(47) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(48) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(49) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(50) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(51) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(52) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(53) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(54) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(55) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(56) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(57) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(58) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(59) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(60) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(61) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(62) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(63) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(64) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(65) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(66) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(67) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(68) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(69) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(70) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(71) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(72) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(73) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(74) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(75) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(76) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(77) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(78) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(79) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(80) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(81) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(82) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(83) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(84) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(85) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(86) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(87) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(88) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(89) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(90) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(91) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(92) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(93) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(94) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(95) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(96) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(97) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(98) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(99) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(100) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(101) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(102) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(103) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(104) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(105) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(106) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(107) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(108) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(109) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(110) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(111) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(112) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(113) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(114) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(115) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(116) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(117) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(118) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(119) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(120) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(121) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(122) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(123) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(124) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(125) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(126) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(127) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(128) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(129) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(130) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(131) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(132) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(133) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(134) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(135) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(136) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(137) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(138) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(139) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(140) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(141) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(142) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(143) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(144) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(145) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(146) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(147) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(148) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(149) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(150) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(151) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(152) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(153) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(154) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(155) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(156) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(157) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(158) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(159) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(160) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(161) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(162) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(163) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(164) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(165) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(166) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(167) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(168) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(169) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(170) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(171) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(172) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(173) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(174) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(175) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(176) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(177) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(178) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(179) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(180) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(181) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(182) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(183) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(184) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(185) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(186) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(187) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(188) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(189) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(190) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(191) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(192) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(193) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(194) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(195) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(196) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(197) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(198) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(199) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(200) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(201) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(202) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(203) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(204) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(205) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(206) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(207) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(208) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(209) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(210) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(211) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(212) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(213) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(214) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(215) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(216) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(217) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(218) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(219) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(220) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(221) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(222) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(223) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(224) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(225) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(226) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(227) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(228) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(229) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(230) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(231) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(232) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(233) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(234) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(235) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(236) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(237) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(238) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(239) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(240) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(241) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(242) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(243) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(244) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(245) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(246) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(247) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(248) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(249) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(250) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(251) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(252) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(253) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(254) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(255) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(256) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(257) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(258) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(259) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(260) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(261) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(262) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(263) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(264) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(265) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(266) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(267) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(268) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(269) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(270) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(271) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(272) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(273) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(274) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(275) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(276) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(277) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(278) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(279) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(280) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(281) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(282) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(283) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(284) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(285) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(286) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(287) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(288) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(289) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(290) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(291) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(292) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(293) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(294) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(295) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(296) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(297) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(298) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(299) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(300) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(301) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(302) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(303) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(304) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(305) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(306) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(307) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(308) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(309) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(310) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(311) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(312) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(313) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(314) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(315) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(316) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(317) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(318) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(319) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(320) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(321) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(322) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(323) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(324) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(325) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(326) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(327) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(328) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(329) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(330) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(331) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(332) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(333) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(334) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(335) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(336) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(337) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(338) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(339) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(340) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(341) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(342) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(343) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(344) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(345) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(346) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(347) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(348) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(349) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(350) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(351) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(352) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(353) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(354) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(355) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(356) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(357) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(358) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(359) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(360) ->
    {[{90000, 180000}], [{90000, 30000}, {90011, 50}]};
get_element_cost(_) -> false.

get_element_cost_damp(DampLev) when DampLev =< 35 ->
    1000;
get_element_cost_damp(DampLev) when DampLev =< 100 ->
    900;
get_element_cost_damp(DampLev) when DampLev =< 150 ->
    800;
get_element_cost_damp(DampLev) when DampLev =< 200 ->
    700;
get_element_cost_damp(DampLev) when DampLev =< 300 ->
    600;
get_element_cost_damp(DampLev) when DampLev =< 400 ->
    500;
get_element_cost_damp(DampLev) when DampLev =< 500 ->
    500;
get_element_cost_damp(DampLev) when DampLev =< 600 ->
    500;
get_element_cost_damp(DampLev) when DampLev =< 700 ->
    500;
get_element_cost_damp(DampLev) when DampLev =< 800 ->
    500;
get_element_cost_damp(_) -> 0.

get_build_speed_cost(0) -> 0;
get_build_speed_cost(1) -> 250000;
get_build_speed_cost(2) -> 500000;
get_build_speed_cost(3) -> 1000000;
get_build_speed_cost(_) -> false.

