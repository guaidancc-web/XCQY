-file("src/data/combat_util_data.erl", 1).

-module(combat_util_data).

-export([def_pos/1,
         get_system_attack/1,
         get_add_fighter/1]).

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

-file("src/data/combat_util_data.erl", 15).

def_pos(52061) -> 12;
def_pos(65000) -> 8;
def_pos(32004) -> 8;
def_pos(91376) -> 8;
def_pos(91377) -> 8;
def_pos(91378) -> 8;
def_pos(91379) -> 8;
def_pos(91380) -> 8;
def_pos(91381) -> 8;
def_pos(91382) -> 8;
def_pos(91383) -> 8;
def_pos(99966) -> 13;
def_pos(_BaseId) -> false.

get_system_attack({103, 1, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 2, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 3, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 4, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 5, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 6, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 7, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 8, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 9, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 10, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 11, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 12, 2}) -> {83030, 200, 100, 0};
get_system_attack({103, 13, 2}) -> {83030, 200, 100, 0};
get_system_attack({60, 10, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 11, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 12, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 13, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 14, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 15, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 16, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 17, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 18, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 19, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 20, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 21, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 22, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 23, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 24, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 25, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 26, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 27, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 28, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 29, 0}) -> {83030, 0, 200, 0};
get_system_attack({60, 30, 0}) -> {83030, 0, 200, 0};
get_system_attack(_) -> false.

get_add_fighter({51, 1}) ->
    #{group => 1, num => 9,
      unit_ids =>
          [{76681, 30}, {76694, 20}, {76682, 40}, {76693, 10}]};
get_add_fighter({51, 2}) ->
    #{group => 1, num => 9,
      unit_ids =>
          [{76681, 30}, {76694, 20}, {76682, 40}, {76693, 10}]};
get_add_fighter({51, 3}) ->
    #{group => 1, num => 9,
      unit_ids =>
          [{76681, 30}, {76694, 20}, {76682, 40}, {76693, 10}]};
get_add_fighter(_) -> false.

