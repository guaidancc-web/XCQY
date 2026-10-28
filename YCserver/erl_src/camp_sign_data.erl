-file("src/data/camp_sign_data.erl", 1).

-module(camp_sign_data).

-export([get/1]).

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

-file("src/data/camp_sign_data.erl", 15).

-file("inc/camp_sign.hrl", 1).

-record(camp_sign,
        {date = {0, 0, 0}, num = 0, camp_id = 0}).

-record(camp_sign_data,
        {num = 0, item_list = [], cost = []}).

-file("src/data/camp_sign_data.erl", 16).

get(1) ->
    #camp_sign_data{num = 1,
                    item_list = [{21220, 0, 3, 2}]};
get(2) ->
    #camp_sign_data{num = 2,
                    item_list = [{25001, 0, 2, 2}]};
get(3) ->
    #camp_sign_data{num = 3,
                    item_list = [{25002, 0, 2, 2}]};
get(4) ->
    #camp_sign_data{num = 4,
                    item_list = [{90026, 0, 100, 2}]};
get(5) ->
    #camp_sign_data{num = 5,
                    item_list = [{25013, 0, 1, 2}]};
get(6) ->
    #camp_sign_data{num = 6,
                    item_list = [{20034, 0, 2, 2}]};
get(7) ->
    #camp_sign_data{num = 7,
                    item_list = [{29049, 0, 1, 2}]};
get(_) -> false.

