-file("src/data/hook_data.erl", 1).

-module(hook_data).

-export([get_map/1]).

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

-file("src/data/hook_data.erl", 14).

get_map(50001) ->
    #{unit_list =>
          [{91100, 500}, {91101, 500}, {91102, 500}]};
get_map(50002) ->
    #{unit_list =>
          [{91103, 500}, {91104, 500}, {91105, 500}]};
get_map(50003) ->
    #{unit_list =>
          [{91106, 500}, {91107, 500}, {91108, 500}]};
get_map(50011) ->
    #{unit_list =>
          [{91109, 500}, {91110, 500}, {91111, 500}]};
get_map(50012) ->
    #{unit_list =>
          [{91112, 500}, {91113, 500}, {91114, 500}]};
get_map(50013) ->
    #{unit_list =>
          [{91115, 500}, {91116, 500}, {91117, 500}]};
get_map(50021) ->
    #{unit_list =>
          [{91118, 500}, {91119, 500}, {91120, 500}]};
get_map(50022) ->
    #{unit_list =>
          [{91121, 500}, {91122, 500}, {91123, 500}]};
get_map(50023) ->
    #{unit_list =>
          [{91124, 500}, {91125, 500}, {91126, 500}]};
get_map(50031) ->
    #{unit_list =>
          [{91127, 500}, {91128, 500}, {91129, 500}]};
get_map(50032) ->
    #{unit_list =>
          [{91129, 500}, {91128, 500}, {91127, 500}]};
get_map(50033) ->
    #{unit_list =>
          [{91130, 500}, {91131, 500}, {91132, 500}]};
get_map(10009) ->
    #{unit_list =>
          [{91133, 500},
           {91134, 500},
           {91135, 500},
           {91136, 500},
           {91137, 500}]};
get_map(_) -> false.

