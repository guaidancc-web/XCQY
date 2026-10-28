-file("src/data/fc_update_data.erl", 1).

-module(fc_update_data).

-export([get_reward/1]).

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

-file("src/data/fc_update_data.erl", 14).

get_reward({1, 1}) ->
    #{lev => 1, classes => 1, score => 3500,
      reward => [{1, 60}, {4, 20}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32000, cast => 0};
get_reward({2, 1}) ->
    #{lev => 2, classes => 1, score => 6000,
      reward => [{1, 120}, {4, 40}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32001, cast => 0};
get_reward({3, 1}) ->
    #{lev => 3, classes => 1, score => 8500,
      reward => [{1, 180}, {4, 60}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32002, cast => 0};
get_reward({4, 1}) ->
    #{lev => 4, classes => 1, score => 10500,
      reward => [{1, 240}, {4, 80}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32003, cast => 0};
get_reward({5, 1}) ->
    #{lev => 5, classes => 1, score => 13500,
      reward =>
          [{1, 300}, {4, 100}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32004, cast => 0};
get_reward({6, 1}) ->
    #{lev => 6, classes => 1, score => 16500,
      reward =>
          [{1, 360}, {4, 120}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32005, cast => 0};
get_reward({7, 1}) ->
    #{lev => 7, classes => 1, score => 19500,
      reward =>
          [{1, 420}, {4, 140}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32006, cast => 0};
get_reward({8, 1}) ->
    #{lev => 8, classes => 1, score => 23000,
      reward =>
          [{1, 480}, {4, 160}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32007, cast => 1};
get_reward({9, 1}) ->
    #{lev => 9, classes => 1, score => 27000,
      reward =>
          [{1, 540}, {4, 180}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32008, cast => 1};
get_reward({10, 1}) ->
    #{lev => 10, classes => 1, score => 30000,
      reward =>
          [{1, 600}, {4, 200}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32009, cast => 1};
get_reward({11, 1}) ->
    #{lev => 11, classes => 1, score => 33000,
      reward =>
          [{1, 660}, {4, 220}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32010, cast => 1};
get_reward({12, 1}) ->
    #{lev => 12, classes => 1, score => 36000,
      reward =>
          [{1, 720}, {4, 240}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32011, cast => 1};
get_reward({1, 2}) ->
    #{lev => 1, classes => 2, score => 3500,
      reward => [{1, 60}, {5, 16}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32020, cast => 0};
get_reward({2, 2}) ->
    #{lev => 2, classes => 2, score => 6000,
      reward => [{1, 120}, {5, 32}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32021, cast => 0};
get_reward({3, 2}) ->
    #{lev => 3, classes => 2, score => 8500,
      reward => [{1, 180}, {5, 48}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32022, cast => 0};
get_reward({4, 2}) ->
    #{lev => 4, classes => 2, score => 10500,
      reward => [{1, 240}, {5, 64}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32023, cast => 0};
get_reward({5, 2}) ->
    #{lev => 5, classes => 2, score => 13500,
      reward =>
          [{1, 300}, {5, 80}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32024, cast => 0};
get_reward({6, 2}) ->
    #{lev => 6, classes => 2, score => 16500,
      reward =>
          [{1, 360}, {5, 96}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32025, cast => 0};
get_reward({7, 2}) ->
    #{lev => 7, classes => 2, score => 19500,
      reward =>
          [{1, 420}, {5, 112}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32026, cast => 0};
get_reward({8, 2}) ->
    #{lev => 8, classes => 2, score => 23000,
      reward =>
          [{1, 480}, {5, 128}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32027, cast => 1};
get_reward({9, 2}) ->
    #{lev => 9, classes => 2, score => 27000,
      reward =>
          [{1, 540}, {5, 144}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32028, cast => 1};
get_reward({10, 2}) ->
    #{lev => 10, classes => 2, score => 30000,
      reward =>
          [{1, 600}, {5, 160}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32029, cast => 1};
get_reward({11, 2}) ->
    #{lev => 11, classes => 2, score => 33000,
      reward =>
          [{1, 660}, {5, 176}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32030, cast => 1};
get_reward({12, 2}) ->
    #{lev => 12, classes => 2, score => 36000,
      reward =>
          [{1, 720}, {5, 192}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32031, cast => 1};
get_reward({1, 3}) ->
    #{lev => 1, classes => 3, score => 3500,
      reward => [{1, 60}, {4, 20}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32040, cast => 0};
get_reward({2, 3}) ->
    #{lev => 2, classes => 3, score => 6000,
      reward => [{1, 120}, {4, 40}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32041, cast => 0};
get_reward({3, 3}) ->
    #{lev => 3, classes => 3, score => 8500,
      reward => [{1, 180}, {4, 60}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32042, cast => 0};
get_reward({4, 3}) ->
    #{lev => 4, classes => 3, score => 10500,
      reward => [{1, 240}, {4, 80}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32043, cast => 0};
get_reward({5, 3}) ->
    #{lev => 5, classes => 3, score => 13500,
      reward =>
          [{1, 300}, {4, 100}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32044, cast => 0};
get_reward({6, 3}) ->
    #{lev => 6, classes => 3, score => 16500,
      reward =>
          [{1, 360}, {4, 120}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32045, cast => 0};
get_reward({7, 3}) ->
    #{lev => 7, classes => 3, score => 19500,
      reward =>
          [{1, 420}, {4, 140}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32046, cast => 0};
get_reward({8, 3}) ->
    #{lev => 8, classes => 3, score => 23000,
      reward =>
          [{1, 480}, {4, 160}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32047, cast => 1};
get_reward({9, 3}) ->
    #{lev => 9, classes => 3, score => 27000,
      reward =>
          [{1, 540}, {4, 180}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32048, cast => 1};
get_reward({10, 3}) ->
    #{lev => 10, classes => 3, score => 30000,
      reward =>
          [{1, 600}, {4, 200}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32049, cast => 1};
get_reward({11, 3}) ->
    #{lev => 11, classes => 3, score => 33000,
      reward =>
          [{1, 660}, {4, 220}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32050, cast => 1};
get_reward({12, 3}) ->
    #{lev => 12, classes => 3, score => 36000,
      reward =>
          [{1, 720}, {4, 240}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32051, cast => 1};
get_reward({1, 4}) ->
    #{lev => 1, classes => 4, score => 3500,
      reward => [{1, 60}, {4, 20}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32060, cast => 0};
get_reward({2, 4}) ->
    #{lev => 2, classes => 4, score => 6000,
      reward => [{1, 120}, {4, 40}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32061, cast => 0};
get_reward({3, 4}) ->
    #{lev => 3, classes => 4, score => 8500,
      reward => [{1, 180}, {4, 60}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32062, cast => 0};
get_reward({4, 4}) ->
    #{lev => 4, classes => 4, score => 10500,
      reward => [{1, 240}, {4, 80}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32063, cast => 0};
get_reward({5, 4}) ->
    #{lev => 5, classes => 4, score => 13500,
      reward =>
          [{1, 300}, {4, 100}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32064, cast => 0};
get_reward({6, 4}) ->
    #{lev => 6, classes => 4, score => 16500,
      reward =>
          [{1, 360}, {4, 120}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32065, cast => 0};
get_reward({7, 4}) ->
    #{lev => 7, classes => 4, score => 19500,
      reward =>
          [{1, 420}, {4, 140}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32066, cast => 0};
get_reward({8, 4}) ->
    #{lev => 8, classes => 4, score => 23000,
      reward =>
          [{1, 480}, {4, 160}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32067, cast => 1};
get_reward({9, 4}) ->
    #{lev => 9, classes => 4, score => 27000,
      reward =>
          [{1, 540}, {4, 180}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32068, cast => 1};
get_reward({10, 4}) ->
    #{lev => 10, classes => 4, score => 30000,
      reward =>
          [{1, 600}, {4, 200}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32069, cast => 1};
get_reward({11, 4}) ->
    #{lev => 11, classes => 4, score => 33000,
      reward =>
          [{1, 660}, {4, 220}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32070, cast => 1};
get_reward({12, 4}) ->
    #{lev => 12, classes => 4, score => 36000,
      reward =>
          [{1, 720}, {4, 240}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32071, cast => 1};
get_reward({1, 5}) ->
    #{lev => 1, classes => 5, score => 3500,
      reward => [{1, 60}, {6, 10}, {7, 8}, {43, 20}, {3, 2}],
      honor => 32080, cast => 0};
get_reward({2, 5}) ->
    #{lev => 2, classes => 5, score => 6000,
      reward =>
          [{1, 120}, {6, 20}, {7, 16}, {43, 40}, {3, 4}],
      loss => [{20760, 1}], honor => 32081, cast => 0};
get_reward({3, 5}) ->
    #{lev => 3, classes => 5, score => 8500,
      reward =>
          [{1, 180}, {6, 30}, {7, 24}, {43, 60}, {3, 6}],
      loss => [{20760, 4}], honor => 32082, cast => 0};
get_reward({4, 5}) ->
    #{lev => 4, classes => 5, score => 10500,
      reward =>
          [{1, 240}, {6, 40}, {7, 32}, {43, 80}, {3, 8}],
      loss => [{20760, 10}], honor => 32083, cast => 0};
get_reward({5, 5}) ->
    #{lev => 5, classes => 5, score => 13500,
      reward =>
          [{1, 300}, {6, 50}, {7, 40}, {43, 100}, {3, 10}],
      loss => [{20760, 18}], honor => 32084, cast => 0};
get_reward({6, 5}) ->
    #{lev => 6, classes => 5, score => 16500,
      reward =>
          [{1, 360}, {6, 60}, {7, 48}, {43, 120}, {3, 12}],
      loss => [{20760, 25}], honor => 32085, cast => 0};
get_reward({7, 5}) ->
    #{lev => 7, classes => 5, score => 19500,
      reward =>
          [{1, 420}, {6, 70}, {7, 56}, {43, 140}, {3, 14}],
      loss => [{20761, 10}], honor => 32086, cast => 0};
get_reward({8, 5}) ->
    #{lev => 8, classes => 5, score => 23000,
      reward =>
          [{1, 480}, {6, 80}, {7, 64}, {43, 160}, {3, 16}],
      loss => [{20761, 20}], honor => 32087, cast => 1};
get_reward({9, 5}) ->
    #{lev => 9, classes => 5, score => 27000,
      reward =>
          [{1, 540}, {6, 90}, {7, 72}, {43, 180}, {3, 18}],
      loss => [{20761, 30}], honor => 32088, cast => 1};
get_reward({10, 5}) ->
    #{lev => 10, classes => 5, score => 30000,
      reward =>
          [{1, 600}, {6, 100}, {7, 80}, {43, 200}, {3, 20}],
      loss => [{20761, 30}], honor => 32089, cast => 1};
get_reward({11, 5}) ->
    #{lev => 11, classes => 5, score => 33000,
      reward =>
          [{1, 660}, {6, 110}, {7, 88}, {43, 220}, {3, 22}],
      loss => [{20761, 40}], honor => 32090, cast => 1};
get_reward({12, 5}) ->
    #{lev => 12, classes => 5, score => 36000,
      reward =>
          [{1, 720}, {6, 120}, {7, 96}, {43, 240}, {3, 24}],
      loss => [{20761, 50}], honor => 32091, cast => 1};
get_reward({1, 6}) ->
    #{lev => 1, classes => 6, score => 3500,
      reward => [{1, 60}, {5, 16}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32100, cast => 0};
get_reward({2, 6}) ->
    #{lev => 2, classes => 6, score => 6000,
      reward => [{1, 120}, {5, 32}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32101, cast => 0};
get_reward({3, 6}) ->
    #{lev => 3, classes => 6, score => 8500,
      reward => [{1, 180}, {5, 48}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32102, cast => 0};
get_reward({4, 6}) ->
    #{lev => 4, classes => 6, score => 10500,
      reward => [{1, 240}, {5, 64}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32103, cast => 0};
get_reward({5, 6}) ->
    #{lev => 5, classes => 6, score => 13500,
      reward =>
          [{1, 300}, {5, 80}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32104, cast => 0};
get_reward({6, 6}) ->
    #{lev => 6, classes => 6, score => 16500,
      reward =>
          [{1, 360}, {5, 96}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32105, cast => 0};
get_reward({7, 6}) ->
    #{lev => 7, classes => 6, score => 19500,
      reward =>
          [{1, 420}, {5, 112}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32106, cast => 0};
get_reward({8, 6}) ->
    #{lev => 8, classes => 6, score => 23000,
      reward =>
          [{1, 480}, {5, 128}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32107, cast => 1};
get_reward({9, 6}) ->
    #{lev => 9, classes => 6, score => 27000,
      reward =>
          [{1, 540}, {5, 144}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32108, cast => 1};
get_reward({10, 6}) ->
    #{lev => 10, classes => 6, score => 30000,
      reward =>
          [{1, 600}, {5, 160}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32109, cast => 1};
get_reward({11, 6}) ->
    #{lev => 11, classes => 6, score => 33000,
      reward =>
          [{1, 660}, {5, 176}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32110, cast => 1};
get_reward({12, 6}) ->
    #{lev => 12, classes => 6, score => 36000,
      reward =>
          [{1, 720}, {5, 192}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32111, cast => 1};
get_reward({1, 7}) ->
    #{lev => 1, classes => 7, score => 3500,
      reward => [{1, 60}, {4, 20}, {6, 10}, {7, 8}, {3, 2}],
      honor => 32120, cast => 0};
get_reward({2, 7}) ->
    #{lev => 2, classes => 7, score => 6000,
      reward => [{1, 120}, {4, 40}, {6, 20}, {7, 16}, {3, 4}],
      loss => [{20760, 1}], honor => 32121, cast => 0};
get_reward({3, 7}) ->
    #{lev => 3, classes => 7, score => 8500,
      reward => [{1, 180}, {4, 60}, {6, 30}, {7, 24}, {3, 6}],
      loss => [{20760, 4}], honor => 32122, cast => 0};
get_reward({4, 7}) ->
    #{lev => 4, classes => 7, score => 10500,
      reward => [{1, 240}, {4, 80}, {6, 40}, {7, 32}, {3, 8}],
      loss => [{20760, 10}], honor => 32123, cast => 0};
get_reward({5, 7}) ->
    #{lev => 5, classes => 7, score => 13500,
      reward =>
          [{1, 300}, {4, 100}, {6, 50}, {7, 40}, {3, 10}],
      loss => [{20760, 18}], honor => 32124, cast => 0};
get_reward({6, 7}) ->
    #{lev => 6, classes => 7, score => 16500,
      reward =>
          [{1, 360}, {4, 120}, {6, 60}, {7, 48}, {3, 12}],
      loss => [{20760, 25}], honor => 32125, cast => 0};
get_reward({7, 7}) ->
    #{lev => 7, classes => 7, score => 19500,
      reward =>
          [{1, 420}, {4, 140}, {6, 70}, {7, 56}, {3, 14}],
      loss => [{20761, 10}], honor => 32126, cast => 0};
get_reward({8, 7}) ->
    #{lev => 8, classes => 7, score => 23000,
      reward =>
          [{1, 480}, {4, 160}, {6, 80}, {7, 64}, {3, 16}],
      loss => [{20761, 20}], honor => 32127, cast => 1};
get_reward({9, 7}) ->
    #{lev => 9, classes => 7, score => 27000,
      reward =>
          [{1, 540}, {4, 180}, {6, 90}, {7, 72}, {3, 18}],
      loss => [{20761, 30}], honor => 32128, cast => 1};
get_reward({10, 7}) ->
    #{lev => 10, classes => 7, score => 30000,
      reward =>
          [{1, 600}, {4, 200}, {6, 100}, {7, 80}, {3, 20}],
      loss => [{20761, 30}], honor => 32129, cast => 1};
get_reward({11, 7}) ->
    #{lev => 11, classes => 7, score => 33000,
      reward =>
          [{1, 660}, {4, 220}, {6, 110}, {7, 88}, {3, 22}],
      loss => [{20761, 40}], honor => 32130, cast => 1};
get_reward({12, 7}) ->
    #{lev => 12, classes => 7, score => 36000,
      reward =>
          [{1, 720}, {4, 240}, {6, 120}, {7, 96}, {3, 24}],
      loss => [{20761, 50}], honor => 32131, cast => 1};
get_reward(_) -> [].

