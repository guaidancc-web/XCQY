-file("src/data/camp_halloween_data.erl", 1).

-module(camp_halloween_data).

-export([lines/0,
         get_line/1,
         get_reward/1,
         get_rank/1,
         item_type/1,
         get_item/1,
         get_exp/1]).

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

-file("src/data/camp_halloween_data.erl", 21).

-file("inc/camp_halloween.hrl", 1).

-record(halloween_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         camp = 0,
         sex = 0,
         classes = 0,
         lev = 0,
         times = 0,
         times_cd = 0,
         die = 0,
         win = 0,
         score = 0,
         zone_id = 0,
         zone_pid,
         num = 0,
         pos,
         mtime = 0,
         escape_time = 0}).

-record(halloween_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         flag = 0}).

-record(halloween_rank_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         title = "",
         content = ""}).

-record(halloween_reward_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-record(halloween_item_reward_data,
        {id = 0,
         type = 0,
         min_lev = 0,
         max_lev = 0,
         item_id = 0,
         num = 0,
         bind = 0,
         is_cast = 0,
         weigth = 0}).

-record(halloween_exp_reward_data,
        {type = 0,
         min = 0,
         max = 0,
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-file("src/data/camp_halloween_data.erl", 22).

lines() -> [1].

get_line(1) ->
    [{1496, 1304},
     {1948, 1259},
     {2223, 1224},
     {2465, 1426},
     {2134, 1497},
     {2380, 1657},
     {2070, 1780},
     {1863, 1772},
     {1737, 1534},
     {1545, 1383},
     {1698, 1225}];
get_line(_) -> [].

get_reward({Val, 1}) when Val >= 0 andalso Val =< 999 ->
    #halloween_reward_data{win = 1, min = 0, max = 999,
                           reward = [{90052, 5}]};
get_reward({Val, 0}) when Val >= 0 andalso Val =< 999 ->
    #halloween_reward_data{win = 0, min = 0, max = 999,
                           reward = [{90052, 10}]};
get_reward(_) -> false.

get_rank({Val, 1}) when Val >= 1 andalso Val =< 1 ->
    #halloween_rank_data{win = 1, min = 1, max = 1,
                         reward = [{90052, 10}], title = lang:get("淘气南瓜MVP奖励"),
                         content =
                             lang:get("恭喜你：\n在<color='#ffff00'>淘气南瓜</color>活动中成为MVP选"
                                      "手，厉害了我的哥！{face_1,3}")};
get_rank(_) -> false.

item_type(1) ->
    [1001,
     1002,
     1003,
     1004,
     1005,
     1006,
     1007,
     1008,
     1009,
     1010,
     1011,
     1012,
     1013];
item_type(2) ->
    [1023,
     1024,
     1025,
     1026,
     1027,
     1028,
     1029,
     1030,
     1031,
     1032,
     1033,
     1034];
item_type(_) -> [].

get_item(1001) ->
    #halloween_item_reward_data{id = 1001, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 29426,
                                num = 1, bind = 0, is_cast = 1, weigth = 124};
get_item(1002) ->
    #halloween_item_reward_data{id = 1002, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 70407,
                                num = 2, bind = 0, is_cast = 1, weigth = 120};
get_item(1003) ->
    #halloween_item_reward_data{id = 1003, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20005,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1004) ->
    #halloween_item_reward_data{id = 1004, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20004,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1005) ->
    #halloween_item_reward_data{id = 1005, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20013,
                                num = 1, bind = 0, is_cast = 0, weigth = 60};
get_item(1006) ->
    #halloween_item_reward_data{id = 1006, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20025,
                                num = 1, bind = 0, is_cast = 0, weigth = 100};
get_item(1007) ->
    #halloween_item_reward_data{id = 1007, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20052,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1008) ->
    #halloween_item_reward_data{id = 1008, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 22450,
                                num = 1, bind = 0, is_cast = 1, weigth = 60};
get_item(1009) ->
    #halloween_item_reward_data{id = 1009, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20087,
                                num = 1, bind = 0, is_cast = 1, weigth = 10};
get_item(1010) ->
    #halloween_item_reward_data{id = 1010, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20020,
                                num = 1, bind = 0, is_cast = 0, weigth = 50};
get_item(1011) ->
    #halloween_item_reward_data{id = 1011, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20021,
                                num = 1, bind = 0, is_cast = 0, weigth = 50};
get_item(1012) ->
    #halloween_item_reward_data{id = 1012, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 20034,
                                num = 1, bind = 0, is_cast = 0, weigth = 34};
get_item(1013) ->
    #halloween_item_reward_data{id = 1013, type = 1,
                                min_lev = 1, max_lev = 200, item_id = 22425,
                                num = 1, bind = 0, is_cast = 1, weigth = 6};
get_item(1023) ->
    #halloween_item_reward_data{id = 1023, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20006,
                                num = 3, bind = 0, is_cast = 0, weigth = 130};
get_item(1024) ->
    #halloween_item_reward_data{id = 1024, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 70407,
                                num = 1, bind = 0, is_cast = 0, weigth = 120};
get_item(1025) ->
    #halloween_item_reward_data{id = 1025, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20005,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1026) ->
    #halloween_item_reward_data{id = 1026, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20004,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1027) ->
    #halloween_item_reward_data{id = 1027, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20013,
                                num = 1, bind = 0, is_cast = 0, weigth = 60};
get_item(1028) ->
    #halloween_item_reward_data{id = 1028, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20025,
                                num = 1, bind = 0, is_cast = 0, weigth = 100};
get_item(1029) ->
    #halloween_item_reward_data{id = 1029, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20052,
                                num = 1, bind = 0, is_cast = 0, weigth = 130};
get_item(1030) ->
    #halloween_item_reward_data{id = 1030, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 22450,
                                num = 1, bind = 0, is_cast = 1, weigth = 60};
get_item(1031) ->
    #halloween_item_reward_data{id = 1031, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20087,
                                num = 1, bind = 0, is_cast = 1, weigth = 10};
get_item(1032) ->
    #halloween_item_reward_data{id = 1032, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20020,
                                num = 1, bind = 0, is_cast = 0, weigth = 50};
get_item(1033) ->
    #halloween_item_reward_data{id = 1033, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20021,
                                num = 1, bind = 0, is_cast = 0, weigth = 50};
get_item(1034) ->
    #halloween_item_reward_data{id = 1034, type = 2,
                                min_lev = 1, max_lev = 200, item_id = 20034,
                                num = 1, bind = 0, is_cast = 0, weigth = 34};
get_item(_) -> false.

get_exp({Val, 1}) when Val >= 1 andalso Val =< 1 ->
    #halloween_exp_reward_data{type = 1, min = 1, max = 1,
                               exp_mode = 3350, exp_radio = 5000,
                               pet_exp_mode = 3350, pet_exp_radio = 10000};
get_exp({Val, 2}) when Val >= 1 andalso Val =< 1 ->
    #halloween_exp_reward_data{type = 2, min = 1, max = 1,
                               exp_mode = 3350, exp_radio = 3000,
                               pet_exp_mode = 3350, pet_exp_radio = 6000};
get_exp({Val, 3}) when Val >= 1 andalso Val =< 8 ->
    #halloween_exp_reward_data{type = 3, min = 1, max = 8,
                               exp_mode = 3350, exp_radio = 1000,
                               pet_exp_mode = 3350, pet_exp_radio = 1000};
get_exp({Val, 3}) when Val >= 9 andalso Val =< 15 ->
    #halloween_exp_reward_data{type = 3, min = 9, max = 15,
                               exp_mode = 3350, exp_radio = 500,
                               pet_exp_mode = 3350, pet_exp_radio = 500};
get_exp({Val, 3}) when Val >= 16 andalso Val =< 9999 ->
    #halloween_exp_reward_data{type = 3, min = 16,
                               max = 9999, exp_mode = 3350, exp_radio = 200,
                               pet_exp_mode = 3350, pet_exp_radio = 200};
get_exp(_) -> false.

