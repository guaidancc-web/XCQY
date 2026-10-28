-file("src/data/camp_cut_price_data.erl", 1).

-module(camp_cut_price_data).

-export([get_gift_info/1,
         get_cut_price_list/0,
         get_all_gift/0]).

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

-file("src/data/camp_cut_price_data.erl", 17).

get_gift_info(71532) ->
    {1,
     1,
     13500,
     2880,
     1,
     [20638,
      71534,
      22617,
      29041,
      22449,
      70605,
      22212,
      29314,
      28607,
      22307],
     5000};
get_gift_info(71533) ->
    {1,
     1,
     13500,
     2880,
     1,
     [20704,
      71535,
      23594,
      20635,
      20076,
      29915,
      22216,
      22396,
      21098,
      22450],
     4500};
get_gift_info(70148) ->
    {1, 2, 228, 228, 3, [29693], 999999};
get_gift_info(29647) ->
    {1, 2, 450, 450, 3, [29694], 999999};
get_gift_info(71271) ->
    {1, 2, 450, 450, 3, [29695, 20053], 999999};
get_gift_info(71272) ->
    {1, 2, 550, 550, 3, [22212, 29102], 999999};
get_gift_info(_) -> undefined.

get_cut_price_list() ->
    [{500, 350},
     {600, 300},
     {800, 250},
     {1000, 80},
     {2000, 20}].

get_all_gift() ->
    [{1, 1, 200, 2, [71532, 70148]},
     {2, 1, 200, 2, [71532, 29647]},
     {3, 1, 200, 2, [71533, 71271]},
     {4, 1, 200, 2, [71533, 71272]}].

