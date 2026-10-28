-file("src/data/camp_black_white_chess_data.erl", 1).

-module(camp_black_white_chess_data).

-export([get_score/1,
         get_special_list/1,
         get_exp/1,
         get_msg/1,
         get_match_score_range/1]).

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

-file("src/data/camp_black_white_chess_data.erl", 17).

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

-file("src/data/camp_black_white_chess_data.erl", 19).

get_score(1) ->
    #{grade => 1, name => lang:get("一星龙蛋"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(2) ->
    #{grade => 2, name => lang:get("二星龙蛋"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(3) ->
    #{grade => 3, name => lang:get("三星龙蛋"),
      next_grade => 100, win => 50, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(4) ->
    #{grade => 4, name => lang:get("一星雏龙"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(5) ->
    #{grade => 5, name => lang:get("二星雏龙"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(6) ->
    #{grade => 6, name => lang:get("三星雏龙"),
      next_grade => 100, win => 40, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(7) ->
    #{grade => 7, name => lang:get("一星幼龙"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(8) ->
    #{grade => 8, name => lang:get("二星幼龙"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(9) ->
    #{grade => 9, name => lang:get("三星幼龙"),
      next_grade => 100, win => 45, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(10) ->
    #{grade => 10, name => lang:get("一星速龙"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(11) ->
    #{grade => 11, name => lang:get("二星速龙"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(12) ->
    #{grade => 12, name => lang:get("三星速龙"),
      next_grade => 100, win => 30, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(13) ->
    #{grade => 13, name => lang:get("一星雷龙"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(14) ->
    #{grade => 14, name => lang:get("二星雷龙"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(15) ->
    #{grade => 15, name => lang:get("三星雷龙"),
      next_grade => 100, win => 25, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(16) ->
    #{grade => 16, name => lang:get("一星剑龙"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(17) ->
    #{grade => 17, name => lang:get("二星剑龙"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(18) ->
    #{grade => 18, name => lang:get("三星剑龙"),
      next_grade => 100, win => 20, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(19) ->
    #{grade => 19, name => lang:get("一星蛟龙"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(20) ->
    #{grade => 20, name => lang:get("二星蛟龙"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(21) ->
    #{grade => 21, name => lang:get("三星蛟龙"),
      next_grade => 100, win => 15, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(22) ->
    #{grade => 22, name => lang:get("一星青龙"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(23) ->
    #{grade => 23, name => lang:get("二星青龙"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(24) ->
    #{grade => 24, name => lang:get("三星青龙"),
      next_grade => 100, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(25) ->
    #{grade => 25, name => lang:get("一星烛龙"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(26) ->
    #{grade => 26, name => lang:get("二星烛龙"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(27) ->
    #{grade => 27, name => lang:get("三星烛龙"),
      next_grade => 200, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(28) ->
    #{grade => 28, name => lang:get("星辰应龙"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(29) ->
    #{grade => 29, name => lang:get("星辰神龙"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(30) ->
    #{grade => 30, name => lang:get("星辰天龙"),
      next_grade => 300, win => 10, loss => 5, draw => 0,
      win_flower => 30, loss_flower => 15, draw_flower => 20};
get_score(_) -> false.

get_special_list(1) ->
    {{1},
     [#{item_id => 20006, bind => 0, num => 2, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 124, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, num => 3, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22425, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 6, is_cast => 1, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(2) ->
    {{2},
     [#{item_id => 20006, bind => 0, num => 2, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, num => 3, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(3) ->
    {{3},
     [#{item_id => 20006, bind => 0, num => 2, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20006, bind => 0, num => 3, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 125, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20005, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 121, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20004, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20013, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20025, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 100, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20052, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 130, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 22450, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 60, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20087, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 10, is_cast => 1, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20020, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20021, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 50, is_cast => 0, break_times_min => 0,
        break_times_max => 1},
      #{item_id => 20034, bind => 0, num => 1, all_num => 1,
        sex => 2, classes => 0, lev_low => 1, lev_high => 200,
        ratio => 34, is_cast => 0, break_times_min => 0,
        break_times_max => 1}]};
get_special_list(_) -> false.

get_exp(1) -> #{model => 3350, ratio => 5000};
get_exp(2) -> #{model => 3350, ratio => 2500};
get_exp(3) -> #{model => 3350, ratio => 3500};
get_exp(_) -> false.

get_msg(1) ->
    {{1},
     [#{message => lang:get("兄弟快点，赶着回家吃饭{face_1,7}"),
        weight => 100},
      #{message => lang:get("朋友，你去拯救世界了吗{face_1,44}"),
        weight => 100},
      #{message => lang:get("等你等到沧海变桑田{face_1,41}"),
        weight => 100}]};
get_msg(2) ->
    {{2},
     [#{message => lang:get("抱歉，假发掉了刚捡回来{face_1,21}"),
        weight => 100},
      #{message => lang:get("Sorry，刚冲奶粉去了{face_1,5}"),
        weight => 100},
      #{message => lang:get("抱歉，手机掉马桶了{face_1,26}"),
        weight => 100}]};
get_msg(3) ->
    {{3},
     [#{message => lang:get("哇，这波厉害{face_1,4}"),
        weight => 100},
      #{message => lang:get("秀，这是真的秀{face_1,42}"),
        weight => 100},
      #{message => lang:get("和你一起玩很开心{face_1,9}"),
        weight => 100}]};
get_msg(4) ->
    {{4},
     [#{message => lang:get("惊了，还有这种操作?{face_1,48}"),
        weight => 100},
      #{message => lang:get("满满的都是套路啊{face_1,43}"),
        weight => 100},
      #{message => lang:get("哎呀妈呀，这都行？{face_1,48}"),
        weight => 100}]};
get_msg(5) ->
    {{5},
     [#{message => lang:get("哎呀妈呀，手下留情{face_1,21}"),
        weight => 100},
      #{message => lang:get("打不过打不过{face_1,11}"),
        weight => 100},
      #{message => lang:get("大佬，轻点虐啊{face_1,11}"),
        weight => 100}]};
get_msg(6) ->
    {{6},
     [#{message => lang:get("怎样，我这操作还行吧？{face_1,25}"),
        weight => 100},
      #{message => lang:get("小小地露一手而已{face_1,59}"),
        weight => 100},
      #{message => lang:get("想不到吧，还能这样{face_1,15}"),
        weight => 100},
      #{message => lang:get("就问你我犀利不犀利{face_1,20}"),
        weight => 100}]};
get_msg(_) -> false.

get_match_score_range(0) -> 0;
get_match_score_range(1) -> 50;
get_match_score_range(2) -> 50;
get_match_score_range(3) -> 50;
get_match_score_range(4) -> 50;
get_match_score_range(5) -> 75;
get_match_score_range(6) -> 75;
get_match_score_range(7) -> 75;
get_match_score_range(8) -> 75;
get_match_score_range(9) -> 75;
get_match_score_range(10) -> 100;
get_match_score_range(11) -> 100;
get_match_score_range(12) -> 100;
get_match_score_range(13) -> 100;
get_match_score_range(14) -> 120;
get_match_score_range(15) -> 120;
get_match_score_range(16) -> 140;
get_match_score_range(17) -> 140;
get_match_score_range(18) -> 150;
get_match_score_range(19) -> 150;
get_match_score_range(20) -> 160;
get_match_score_range(21) -> 160;
get_match_score_range(22) -> 160;
get_match_score_range(23) -> 170;
get_match_score_range(24) -> 170;
get_match_score_range(25) -> 170;
get_match_score_range(26) -> 180;
get_match_score_range(27) -> 180;
get_match_score_range(28) -> 180;
get_match_score_range(29) -> 190;
get_match_score_range(30) -> 200;
get_match_score_range(31) -> 200;
get_match_score_range(32) -> 200;
get_match_score_range(33) -> 210;
get_match_score_range(34) -> 220;
get_match_score_range(35) -> 230;
get_match_score_range(36) -> 240;
get_match_score_range(37) -> 250;
get_match_score_range(38) -> 260;
get_match_score_range(39) -> 280;
get_match_score_range(40) -> 300;
get_match_score_range(41) -> 310;
get_match_score_range(42) -> 310;
get_match_score_range(43) -> 310;
get_match_score_range(44) -> 320;
get_match_score_range(45) -> 320;
get_match_score_range(46) -> 320;
get_match_score_range(47) -> 330;
get_match_score_range(48) -> 330;
get_match_score_range(49) -> 330;
get_match_score_range(50) -> 330;
get_match_score_range(51) -> 330;
get_match_score_range(52) -> 340;
get_match_score_range(53) -> 340;
get_match_score_range(54) -> 340;
get_match_score_range(55) -> 340;
get_match_score_range(56) -> 340;
get_match_score_range(57) -> 350;
get_match_score_range(58) -> 350;
get_match_score_range(59) -> 350;
get_match_score_range(60) -> 350;
get_match_score_range(61) -> 355;
get_match_score_range(62) -> 355;
get_match_score_range(63) -> 360;
get_match_score_range(64) -> 360;
get_match_score_range(65) -> 365;
get_match_score_range(66) -> 365;
get_match_score_range(67) -> 370;
get_match_score_range(68) -> 370;
get_match_score_range(69) -> 375;
get_match_score_range(70) -> 375;
get_match_score_range(71) -> 380;
get_match_score_range(72) -> 380;
get_match_score_range(73) -> 385;
get_match_score_range(74) -> 385;
get_match_score_range(75) -> 390;
get_match_score_range(76) -> 390;
get_match_score_range(77) -> 395;
get_match_score_range(78) -> 395;
get_match_score_range(79) -> 400;
get_match_score_range(80) -> 400;
get_match_score_range(81) -> 405;
get_match_score_range(82) -> 410;
get_match_score_range(83) -> 415;
get_match_score_range(84) -> 420;
get_match_score_range(85) -> 425;
get_match_score_range(86) -> 430;
get_match_score_range(87) -> 435;
get_match_score_range(88) -> 440;
get_match_score_range(89) -> 445;
get_match_score_range(90) -> 450;
get_match_score_range(91) -> 455;
get_match_score_range(92) -> 460;
get_match_score_range(93) -> 465;
get_match_score_range(94) -> 470;
get_match_score_range(95) -> 475;
get_match_score_range(96) -> 480;
get_match_score_range(97) -> 485;
get_match_score_range(98) -> 490;
get_match_score_range(99) -> 495;
get_match_score_range(100) -> 500;
get_match_score_range(_) -> false.

