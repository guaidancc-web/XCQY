-file("src/data/camp_sign_draw_data.erl", 1).

-module(camp_sign_draw_data).

-export([get_config/0,
         get_draw_reward/0,
         get_quest_list/0,
         get_quest_info/1,
         get_draw_num/0,
         get_quality_list/0,
         get_guarantee_info/1]).

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

-file("src/data/camp_sign_draw_data.erl", 20).

-file("inc/camp_sign_draw.hrl", 1).

-author("Suhan").

-record(camp_sign_draw_config,
        {camp_id = 0,
         cost = [],
         sign_reward = [],
         title,
         content,
         guarantee_round = 10}).

-record(m_camp_sign_draw,
        {ver = 1,
         camp_id = 0,
         sign_flag = 0,
         sign_time = 0,
         draw_times = 0,
         quality_times = [],
         history_quality_times = []}).

-record(camp_sign_draw_reward,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         ratio = 0,
         num_weight = [],
         draw_icon = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-record(camp_sign_draw_reward_base,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         num = 0,
         weight = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-file("src/data/camp_sign_draw_data.erl", 21).

get_config() ->
    [#camp_sign_draw_config{camp_id = 3169,
                            cost = [{71529, 1}], sign_reward = [{71529, 1}],
                            title = lang:get("签到抽奖"),
                            content = lang:get("由于抽奖时您背包已满，奖励通过邮件发放给您，请查收"),
                            guarantee_round = 12}].

get_draw_reward() ->
    [#camp_sign_draw_reward{base_id = 21220, bind = 0,
                            base_num = 2, ratio = 300,
                            num_weight =
                                [{1, 500}, {2, 350}, {3, 100}, {5, 50}],
                            draw_icon = "21220", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 0, quality = 1},
     #camp_sign_draw_reward{base_id = 20000, bind = 0,
                            base_num = 1, ratio = 250,
                            num_weight =
                                [{1, 500}, {2, 350}, {3, 100}, {5, 50}],
                            draw_icon = "20000", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 0, quality = 1},
     #camp_sign_draw_reward{base_id = 20087, bind = 0,
                            base_num = 1, ratio = 200,
                            num_weight =
                                [{1, 500}, {2, 350}, {3, 100}, {5, 50}],
                            draw_icon = "20087", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 0, quality = 1},
     #camp_sign_draw_reward{base_id = 22585, bind = 0,
                            base_num = 1, ratio = 200,
                            num_weight =
                                [{1, 500}, {2, 350}, {3, 100}, {5, 50}],
                            draw_icon = "22585", min_lev = 1, max_lev = 79,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 0, quality = 1},
     #camp_sign_draw_reward{base_id = 21098, bind = 0,
                            base_num = 5, ratio = 100,
                            num_weight =
                                [{1, 500}, {2, 350}, {3, 100}, {5, 50}],
                            draw_icon = "21098", min_lev = 80, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 0, quality = 1},
     #camp_sign_draw_reward{base_id = 90026, bind = 0,
                            base_num = 288, ratio = 80,
                            num_weight = [{1, 800}, {2, 150}, {3, 50}],
                            draw_icon = "70219", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 1, quality = 2},
     #camp_sign_draw_reward{base_id = 20616, bind = 0,
                            base_num = 1, ratio = 40,
                            num_weight = [{1, 800}, {2, 150}, {3, 50}],
                            draw_icon = "20616", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 0,
                            is_zone_cast = 1, quality = 2},
     #camp_sign_draw_reward{base_id = 22449, bind = 0,
                            base_num = 1, ratio = 35,
                            num_weight = [{1, 950}, {2, 50}],
                            draw_icon = "22447", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 1,
                            is_zone_cast = 1, quality = 3},
     #camp_sign_draw_reward{base_id = 20617, bind = 0,
                            base_num = 1, ratio = 15,
                            num_weight = [{1, 950}, {2, 50}],
                            draw_icon = "20617", min_lev = 1, max_lev = 200,
                            sex = 2, classes = 0, is_effect = 1,
                            is_zone_cast = 1, quality = 3}].

get_quest_list() ->
    [83708,
     83709,
     83710,
     83711,
     83712,
     83713,
     83714,
     83715].

get_quest_info(83709) ->
    {83709, [{71529, 1}], "1026", 1};
get_quest_info(83710) ->
    {83710, [{71529, 1}], "1000", 2};
get_quest_info(83711) ->
    {83711, [{71529, 1}], "1014", 3};
get_quest_info(83712) ->
    {83712, [{71529, 1}], "1002", 4};
get_quest_info(83713) ->
    {83713, [{71529, 1}], "1027", 5};
get_quest_info(83714) ->
    {83714, [{71529, 1}], "2001", 6};
get_quest_info(83715) ->
    {83715, [{71529, 2}], "20053", 7};
get_quest_info(83708) ->
    {83708, [{71529, 4}], "90002", 8};
get_quest_info(_) -> 0.

get_draw_num() -> [1, 2, 3, 5, 1, 2, 3, 5].

get_quality_list() -> [1, 2, 3].

get_guarantee_info(1) -> {1, 1, 999999999};
get_guarantee_info(2) -> {2, 1, 2};
get_guarantee_info(3) -> {3, 1, 1};
get_guarantee_info(_) -> 0.

