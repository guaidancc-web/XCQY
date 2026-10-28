-file("src/data/camp_inquiry_data.erl", 1).

-module(camp_inquiry_data).

-export([get_camp_list/0,
         get_clue_list/1,
         get_clue_info/1,
         get_reward/1]).

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

-file("src/data/camp_inquiry_data.erl", 17).

get_camp_list() -> [860].

get_clue_list(860) -> [4, 5, 6];
get_clue_list(_CampId) -> [].

get_clue_info(4) ->
    #{id => 4, question_id => 50007, quest_id => 83681,
      is_first => 1, next_clue => 5,
      right_reward => [{20002, 0, 1}]};
get_clue_info(5) ->
    #{id => 5, question_id => 50008, quest_id => 83682,
      is_first => 0, next_clue => 6,
      right_reward => [{20087, 0, 1}]};
get_clue_info(6) ->
    #{id => 6, question_id => 50009, quest_id => 83683,
      is_first => 0, next_clue => 0,
      right_reward => [{22585, 0, 1}]};
get_clue_info(_ClueId) -> false.

get_reward(4) ->
    [{[{20545, 0, 1}, {90000, 0, 200000}], 1, 200, 2}];
get_reward(5) ->
    [{[{21322, 0, 1}, {90000, 0, 200000}], 1, 200, 2}];
get_reward(6) ->
    [{[{22249, 0, 1}, {90000, 0, 200000}], 1, 200, 2}];
get_reward(_) -> [].

