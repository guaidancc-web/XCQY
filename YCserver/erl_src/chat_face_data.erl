-file("src/data/chat_face_data.erl", 1).

-module(chat_face_data).

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

-file("src/data/chat_face_data.erl", 15).

-export([get_new_expression/1, get_cost/1]).

get_new_expression(1) ->
    [{100, 46, default},
     {101, 46, default},
     {102, 46, default},
     {103, 46, default},
     {104, 46, default},
     {105, 46, default},
     {106, 46, default},
     {107, 46, default},
     {108, 46, default},
     {109, 46, default},
     {110, 46, default},
     {111, 46, default},
     {112, 46, default},
     {113, 46, default},
     {114, 46, default},
     {115, 46, default},
     {116, 46, default},
     {117, 46, default},
     {118, 46, default},
     {119, 46, default},
     {120, 46, default},
     {121, 46, default},
     {122, 0, default},
     {123, 0, default},
     {124, 0, default},
     {125, 0, default}];
get_new_expression(4) ->
    [{126, 100, default},
     {127, 100, default},
     {128, 100, default},
     {129, 100, default},
     {130, 100, default},
     {131, 100, default},
     {132, 100, default},
     {133, 100, default},
     {134, 100, default},
     {135, 100, default}];
get_new_expression(2) ->
    [{200, 100, lang:get("要抱抱啊")},
     {201, 100, lang:get("求带")},
     {202, 100, lang:get("惊恐")},
     {203, 100, lang:get("委屈")},
     {204, 100, lang:get("人家超可爱")},
     {205, 100, lang:get("哦豁")},
     {206, 100, lang:get("费解")},
     {207, 100, lang:get("捏脸")},
     {208, 100, lang:get("摊手")},
     {209, 100, lang:get("掩面哭")}];
get_new_expression(_) -> [].

get_cost(200) -> [{22454, 3}];
get_cost(201) -> [{22454, 3}];
get_cost(202) -> [{22454, 3}];
get_cost(203) -> [{22454, 3}];
get_cost(204) -> [{22454, 3}];
get_cost(205) -> [{22454, 3}];
get_cost(206) -> [{22454, 3}];
get_cost(207) -> [{22454, 3}];
get_cost(208) -> [{22454, 3}];
get_cost(209) -> [{22454, 3}];
get_cost(_) -> [].

