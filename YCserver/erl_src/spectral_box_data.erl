-file("src/data/spectral_box_data.erl", 1).

-module(spectral_box_data).

-export([type_id/1,
         get_reward_info/1,
         get_acc_reward/1]).

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

-file("src/data/spectral_box_data.erl", 16).

type_id(62320) ->
    [#{id => 1, box_type => 62320, item_id => 23740,
       bind => 0, num => 1, weigth => 60, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23759},
     #{id => 2, box_type => 62320, item_id => 22449,
       bind => 0, num => 1, weigth => 60, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23759},
     #{id => 3, box_type => 62320, item_id => 29101,
       bind => 0, num => 1, weigth => 25, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23741},
     #{id => 4, box_type => 62320, item_id => 29100,
       bind => 0, num => 1, weigth => 10, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23741},
     #{id => 5, box_type => 62320, item_id => 20006,
       bind => 0, num => 40, weigth => 120, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23741},
     #{id => 6, box_type => 62320, item_id => 28607,
       bind => 0, num => 1, weigth => 10, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23755},
     #{id => 7, box_type => 62320, item_id => 21426,
       bind => 0, num => 1, weigth => 20, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23755},
     #{id => 8, box_type => 62320, item_id => 23742,
       bind => 0, num => 1, weigth => 40, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23755},
     #{id => 9, box_type => 62320, item_id => 21322,
       bind => 0, num => 1, weigth => 50, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 21322},
     #{id => 10, box_type => 62320, item_id => 22216,
       bind => 0, num => 1, weigth => 100, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 22216},
     #{id => 11, box_type => 62320, item_id => 20022,
       bind => 0, num => 1, weigth => 35, is_cast => 0,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 12, box_type => 62320, item_id => 20020,
       bind => 0, num => 20, weigth => 80, is_cast => 0,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 13, box_type => 62320, item_id => 20023,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 14, box_type => 62320, item_id => 20010,
       bind => 0, num => 1, weigth => 20, is_cast => 0,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 15, box_type => 62320, item_id => 20011,
       bind => 0, num => 1, weigth => 10, is_cast => 1,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 16, box_type => 62320, item_id => 20012,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 1, lev_max => 84, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23743},
     #{id => 17, box_type => 62320, item_id => 29153,
       bind => 0, num => 1, weigth => 30, is_cast => 0,
       lev_min => 1, lev_max => 79, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23744},
     #{id => 18, box_type => 62320, item_id => 90026,
       bind => 0, num => 300, weigth => 100, is_cast => 0,
       lev_min => 1, lev_max => 79, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23744},
     #{id => 19, box_type => 62320, item_id => 22307,
       bind => 0, num => 2, weigth => 155, is_cast => 0,
       lev_min => 85, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 22307},
     #{id => 20, box_type => 62320, item_id => 22398,
       bind => 0, num => 1, weigth => 20, is_cast => 1,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23756},
     #{id => 21, box_type => 62320, item_id => 23556,
       bind => 0, num => 10, weigth => 100, is_cast => 0,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23756},
     #{id => 22, box_type => 62320, item_id => 23660,
       bind => 0, num => 1, weigth => 10, is_cast => 1,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23756},
     #{id => 23, box_type => 62320, item_id => 20075,
       bind => 0, num => 1, weigth => 120, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23745},
     #{id => 24, box_type => 62320, item_id => 20076,
       bind => 0, num => 1, weigth => 40, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23745},
     #{id => 25, box_type => 62320, item_id => 20616,
       bind => 0, num => 1, weigth => 50, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23745},
     #{id => 26, box_type => 62320, item_id => 20617,
       bind => 0, num => 1, weigth => 10, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23745}];
type_id(62319) ->
    [#{id => 100, box_type => 62319, item_id => 23746,
       bind => 0, num => 1, weigth => 130, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23746},
     #{id => 101, box_type => 62319, item_id => 20075,
       bind => 0, num => 1, weigth => 20, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23747},
     #{id => 102, box_type => 62319, item_id => 20076,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23747},
     #{id => 103, box_type => 62319, item_id => 20616,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23747},
     #{id => 104, box_type => 62319, item_id => 23556,
       bind => 0, num => 3, weigth => 100, is_cast => 0,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23748},
     #{id => 105, box_type => 62319, item_id => 23554,
       bind => 0, num => 3, weigth => 15, is_cast => 1,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23748},
     #{id => 106, box_type => 62319, item_id => 23550,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 80, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23748},
     #{id => 107, box_type => 62319, item_id => 23749,
       bind => 0, num => 1, weigth => 125, is_cast => 0,
       lev_min => 1, lev_max => 79, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23749},
     #{id => 108, box_type => 62319, item_id => 20087,
       bind => 0, num => 1, weigth => 130, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23750},
     #{id => 109, box_type => 62319, item_id => 21100,
       bind => 0, num => 1, weigth => 100, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23750},
     #{id => 110, box_type => 62319, item_id => 21101,
       bind => 0, num => 1, weigth => 15, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23750},
     #{id => 111, box_type => 62319, item_id => 21102,
       bind => 0, num => 1, weigth => 8, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23750},
     #{id => 112, box_type => 62319, item_id => 23740,
       bind => 0, num => 1, weigth => 60, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23740},
     #{id => 114, box_type => 62319, item_id => 22248,
       bind => 0, num => 1, weigth => 80, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 22248},
     #{id => 117, box_type => 62319, item_id => 29101,
       bind => 0, num => 1, weigth => 5, is_cast => 1,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23753},
     #{id => 118, box_type => 62319, item_id => 20006,
       bind => 0, num => 20, weigth => 162, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23753},
     #{id => 119, box_type => 62319, item_id => 23752,
       bind => 0, num => 1, weigth => 80, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23754},
     #{id => 120, box_type => 62319, item_id => 22590,
       bind => 0, num => 1, weigth => 80, is_cast => 0,
       lev_min => 1, lev_max => 200, must_no => 0, must => 0,
       max_num => 0, type_item_id => 23754}];
type_id(_) -> [].

get_reward_info(1) ->
    #{id => 1, box_type => 62320, item_id => 23740,
      bind => 0, num => 1, weigth => 60, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23759};
get_reward_info(2) ->
    #{id => 2, box_type => 62320, item_id => 22449,
      bind => 0, num => 1, weigth => 60, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23759};
get_reward_info(3) ->
    #{id => 3, box_type => 62320, item_id => 29101,
      bind => 0, num => 1, weigth => 25, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23741};
get_reward_info(4) ->
    #{id => 4, box_type => 62320, item_id => 29100,
      bind => 0, num => 1, weigth => 10, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23741};
get_reward_info(5) ->
    #{id => 5, box_type => 62320, item_id => 20006,
      bind => 0, num => 40, weigth => 120, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23741};
get_reward_info(6) ->
    #{id => 6, box_type => 62320, item_id => 28607,
      bind => 0, num => 1, weigth => 10, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23755};
get_reward_info(7) ->
    #{id => 7, box_type => 62320, item_id => 21426,
      bind => 0, num => 1, weigth => 20, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23755};
get_reward_info(8) ->
    #{id => 8, box_type => 62320, item_id => 23742,
      bind => 0, num => 1, weigth => 40, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23755};
get_reward_info(9) ->
    #{id => 9, box_type => 62320, item_id => 21322,
      bind => 0, num => 1, weigth => 50, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 21322};
get_reward_info(10) ->
    #{id => 10, box_type => 62320, item_id => 22216,
      bind => 0, num => 1, weigth => 100, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 22216};
get_reward_info(11) ->
    #{id => 11, box_type => 62320, item_id => 20022,
      bind => 0, num => 1, weigth => 35, is_cast => 0,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(12) ->
    #{id => 12, box_type => 62320, item_id => 20020,
      bind => 0, num => 20, weigth => 80, is_cast => 0,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(13) ->
    #{id => 13, box_type => 62320, item_id => 20023,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(14) ->
    #{id => 14, box_type => 62320, item_id => 20010,
      bind => 0, num => 1, weigth => 20, is_cast => 0,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(15) ->
    #{id => 15, box_type => 62320, item_id => 20011,
      bind => 0, num => 1, weigth => 10, is_cast => 1,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(16) ->
    #{id => 16, box_type => 62320, item_id => 20012,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 1, lev_max => 84, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23743};
get_reward_info(17) ->
    #{id => 17, box_type => 62320, item_id => 29153,
      bind => 0, num => 1, weigth => 30, is_cast => 0,
      lev_min => 1, lev_max => 79, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23744};
get_reward_info(18) ->
    #{id => 18, box_type => 62320, item_id => 90026,
      bind => 0, num => 300, weigth => 100, is_cast => 0,
      lev_min => 1, lev_max => 79, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23744};
get_reward_info(19) ->
    #{id => 19, box_type => 62320, item_id => 22307,
      bind => 0, num => 2, weigth => 155, is_cast => 0,
      lev_min => 85, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 22307};
get_reward_info(20) ->
    #{id => 20, box_type => 62320, item_id => 22398,
      bind => 0, num => 1, weigth => 20, is_cast => 1,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23756};
get_reward_info(21) ->
    #{id => 21, box_type => 62320, item_id => 23556,
      bind => 0, num => 10, weigth => 100, is_cast => 0,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23756};
get_reward_info(22) ->
    #{id => 22, box_type => 62320, item_id => 23660,
      bind => 0, num => 1, weigth => 10, is_cast => 1,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23756};
get_reward_info(23) ->
    #{id => 23, box_type => 62320, item_id => 20075,
      bind => 0, num => 1, weigth => 120, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23745};
get_reward_info(24) ->
    #{id => 24, box_type => 62320, item_id => 20076,
      bind => 0, num => 1, weigth => 40, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23745};
get_reward_info(25) ->
    #{id => 25, box_type => 62320, item_id => 20616,
      bind => 0, num => 1, weigth => 50, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23745};
get_reward_info(26) ->
    #{id => 26, box_type => 62320, item_id => 20617,
      bind => 0, num => 1, weigth => 10, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23745};
get_reward_info(100) ->
    #{id => 100, box_type => 62319, item_id => 23746,
      bind => 0, num => 1, weigth => 130, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23746};
get_reward_info(101) ->
    #{id => 101, box_type => 62319, item_id => 20075,
      bind => 0, num => 1, weigth => 20, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23747};
get_reward_info(102) ->
    #{id => 102, box_type => 62319, item_id => 20076,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23747};
get_reward_info(103) ->
    #{id => 103, box_type => 62319, item_id => 20616,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23747};
get_reward_info(104) ->
    #{id => 104, box_type => 62319, item_id => 23556,
      bind => 0, num => 3, weigth => 100, is_cast => 0,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23748};
get_reward_info(105) ->
    #{id => 105, box_type => 62319, item_id => 23554,
      bind => 0, num => 3, weigth => 15, is_cast => 1,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23748};
get_reward_info(106) ->
    #{id => 106, box_type => 62319, item_id => 23550,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 80, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23748};
get_reward_info(107) ->
    #{id => 107, box_type => 62319, item_id => 23749,
      bind => 0, num => 1, weigth => 125, is_cast => 0,
      lev_min => 1, lev_max => 79, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23749};
get_reward_info(108) ->
    #{id => 108, box_type => 62319, item_id => 20087,
      bind => 0, num => 1, weigth => 130, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23750};
get_reward_info(109) ->
    #{id => 109, box_type => 62319, item_id => 21100,
      bind => 0, num => 1, weigth => 100, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23750};
get_reward_info(110) ->
    #{id => 110, box_type => 62319, item_id => 21101,
      bind => 0, num => 1, weigth => 15, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23750};
get_reward_info(111) ->
    #{id => 111, box_type => 62319, item_id => 21102,
      bind => 0, num => 1, weigth => 8, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23750};
get_reward_info(112) ->
    #{id => 112, box_type => 62319, item_id => 23740,
      bind => 0, num => 1, weigth => 60, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23740};
get_reward_info(114) ->
    #{id => 114, box_type => 62319, item_id => 22248,
      bind => 0, num => 1, weigth => 80, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 22248};
get_reward_info(117) ->
    #{id => 117, box_type => 62319, item_id => 29101,
      bind => 0, num => 1, weigth => 5, is_cast => 1,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23753};
get_reward_info(118) ->
    #{id => 118, box_type => 62319, item_id => 20006,
      bind => 0, num => 20, weigth => 162, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23753};
get_reward_info(119) ->
    #{id => 119, box_type => 62319, item_id => 23752,
      bind => 0, num => 1, weigth => 80, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23754};
get_reward_info(120) ->
    #{id => 120, box_type => 62319, item_id => 22590,
      bind => 0, num => 1, weigth => 80, is_cast => 0,
      lev_min => 1, lev_max => 200, must_no => 0, must => 0,
      max_num => 0, type_item_id => 23754};
get_reward_info(_) -> false.

get_acc_reward(62320) ->
    #{box_type => 62320, num => 8, max_num => 99999,
      item_list => [{22449, 0, 1}],
      title => lang:get("鸿福宝箱累计奖励"),
      content =>
          lang:get("你已经累计开启8次鸿福宝箱，积攒了充足的福运。福运凝聚成了礼品赠送给您:"),
      is_cast => 0};
get_acc_reward(62319) ->
    #{box_type => 62319, num => 5, max_num => 99999,
      item_list => [{23752, 0, 1}],
      title => lang:get("秘银宝箱累计奖励"),
      content =>
          lang:get("你已经累计开启5次秘银宝箱，积攒了充足的福运。福运凝聚成了礼品赠送给您:"),
      is_cast => 0};
get_acc_reward(_) -> false.

