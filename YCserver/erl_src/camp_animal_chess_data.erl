-file("src/data/camp_animal_chess_data.erl", 1).

-module(camp_animal_chess_data).

-export([get_score/1, get_special_list/1, get_exp/1]).

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

-file("src/data/camp_animal_chess_data.erl", 18).

-file("inc/camp_misc.hrl", 1).

-record(camp_doll,
        {ver = 3,
         camp_id = 0,
         free_times = 0,
         lucky = 0,
         dolls = [],
         open_times = 0,
         logs = [],
         type1_times = 0,
         type2_times = 0,
         guarantee = []}).

-record(camp_doll_data,
        {pos = 0, open = 0, type = 0, reward = []}).

-record(camp_doll_item_data,
        {id = 1,
         type = 0,
         item_id = 20306,
         bind = 0,
         num = 1,
         odds = 100,
         is_cast = 1,
         lev_min = 1,
         lev_max = 100,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         min_times = 0,
         max_times = 0,
         ring_times = 0}).

-file("src/data/camp_animal_chess_data.erl", 19).

get_score(1) ->
    #{grade => 1, name => lang:get("一星波波"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(2) ->
    #{grade => 2, name => lang:get("二星波波"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(3) ->
    #{grade => 3, name => lang:get("三星波波"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(4) ->
    #{grade => 4, name => lang:get("一星龙猫"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(5) ->
    #{grade => 5, name => lang:get("二星龙猫"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(6) ->
    #{grade => 6, name => lang:get("三星龙猫"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(7) ->
    #{grade => 7, name => lang:get("一星雪狐"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(8) ->
    #{grade => 8, name => lang:get("二星雪狐"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(9) ->
    #{grade => 9, name => lang:get("三星雪狐"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(10) ->
    #{grade => 10, name => lang:get("一星霜狼"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(11) ->
    #{grade => 11, name => lang:get("二星霜狼"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(12) ->
    #{grade => 12, name => lang:get("三星霜狼"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(13) ->
    #{grade => 13, name => lang:get("一星老虎"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(14) ->
    #{grade => 14, name => lang:get("二星老虎"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(15) ->
    #{grade => 15, name => lang:get("三星老虎"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(16) ->
    #{grade => 16, name => lang:get("一星剑灵"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(17) ->
    #{grade => 17, name => lang:get("二星剑灵"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(18) ->
    #{grade => 18, name => lang:get("三星剑灵"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(19) ->
    #{grade => 19, name => lang:get("一星伯爵"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(20) ->
    #{grade => 20, name => lang:get("二星伯爵"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(21) ->
    #{grade => 21, name => lang:get("三星伯爵"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(22) ->
    #{grade => 22, name => lang:get("一星骑士"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(23) ->
    #{grade => 23, name => lang:get("二星骑士"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(24) ->
    #{grade => 24, name => lang:get("三星骑士"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(25) ->
    #{grade => 25, name => lang:get("一星龙魂"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(26) ->
    #{grade => 26, name => lang:get("二星龙魂"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(27) ->
    #{grade => 27, name => lang:get("三星龙魂"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(28) ->
    #{grade => 28, name => lang:get("一星剑心"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(29) ->
    #{grade => 29, name => lang:get("二星剑心"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(30) ->
    #{grade => 30, name => lang:get("三星剑心"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(_) -> false.

get_special_list(1) ->
    {{1},
     [#{item_id => 20006, bind => 0, all_num => 1, num => 2,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 124, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, all_num => 1, num => 3,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22425, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 6, is_cast => 1, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(2) ->
    {{2},
     [#{item_id => 20006, bind => 0, all_num => 1, num => 2,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, all_num => 1, num => 3,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(3) ->
    {{3},
     [#{item_id => 20006, bind => 0, all_num => 1, num => 2,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, all_num => 1, num => 3,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, all_num => 1, num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(_) -> false.

get_exp(1) -> #{model => 3350, ratio => 5000};
get_exp(2) -> #{model => 3350, ratio => 2500};
get_exp(3) -> #{model => 3350, ratio => 3500};
get_exp(4) -> #{model => 3350, ratio => 300};
get_exp(_) -> false.

