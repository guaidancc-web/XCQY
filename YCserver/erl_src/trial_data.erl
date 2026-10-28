-file("src/data/trial_data.erl", 1).

-module(trial_data).

-export([get/1, jump/1, get_coin_ratio/1]).

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

-file("src/data/trial_data.erl", 17).

get(1) ->
    #{type => 1, base_id => 72000, name => lang:get("试炼官"),
      lev_low => -6, lev_high => -5,
      fc_list =>
          [{-300, -150},
           {-400, -301},
           {-500, -401},
           {-700, -501}],
      easy_attr_ratio => 550, hard_attr_ratio => 750,
      dir => 7, pos => {60001, 1024, 2900},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(2) ->
    #{type => 2, base_id => 72001, name => lang:get("白银宝箱"),
      dir => 7, pos => {60001, 900, 2900}};
get(3) ->
    #{type => 1, base_id => 72004, name => lang:get("试炼官"),
      lev_low => -5, lev_high => -3,
      fc_list =>
          [{-300, -150},
           {-400, -301},
           {-500, -401},
           {-700, -501}],
      easy_attr_ratio => 600, hard_attr_ratio => 750,
      dir => 7, pos => {60001, 1208, 1953},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(4) ->
    #{type => 2, base_id => 72005, name => lang:get("白银宝箱"),
      dir => 7, pos => {60001, 1410, 1738}};
get(5) ->
    #{type => 1, base_id => 72008, name => lang:get("试炼官"),
      lev_low => -4, lev_high => -1,
      fc_list =>
          [{-180, -100},
           {-250, -181},
           {-400, -251},
           {-600, -401}],
      easy_attr_ratio => 630, hard_attr_ratio => 800,
      dir => 1, pos => {60001, 915, 1620},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(6) ->
    #{type => 2, base_id => 72009, name => lang:get("白银宝箱"),
      dir => 1, pos => {60001, 724, 1590}};
get(7) ->
    #{type => 1, base_id => 72012, name => lang:get("试炼官"),
      lev_low => -4, lev_high => 0,
      fc_list =>
          [{-150, -50}, {-200, -151}, {-300, -201}, {-500, -301}],
      easy_attr_ratio => 650, hard_attr_ratio => 850,
      dir => 0, pos => {60001, 953, 1123},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(8) ->
    #{type => 2, base_id => 72013, name => lang:get("白银宝箱"),
      dir => 0, pos => {60001, 1064, 1097}};
get(9) ->
    #{type => 1, base_id => 72016, name => lang:get("试炼官"),
      lev_low => -3, lev_high => 0,
      fc_list =>
          [{-80, 10}, {-120, -81}, {-200, -121}, {-300, -201}],
      easy_attr_ratio => 700, hard_attr_ratio => 900,
      dir => 2, pos => {60001, 1566, 337},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(10) ->
    #{type => 2, base_id => 72017, name => lang:get("白银宝箱"),
      dir => 2, pos => {60001, 1341, 349}};
get(11) ->
    #{type => 1, base_id => 72018, name => lang:get("试炼官"),
      lev_low => -3, lev_high => 0,
      fc_list =>
          [{-80, 10}, {-120, -81}, {-200, -121}, {-300, -201}],
      easy_attr_ratio => 700, hard_attr_ratio => 920,
      dir => 6, pos => {60001, 495, 443},
      gain =>
          [{20006, 5, 300}, {20004, 1, 300}, {21220, 1, 300}]};
get(12) ->
    #{type => 2, base_id => 72019, name => lang:get("黄金宝箱"),
      dir => 7, pos => {60001, 406, 274},
      gain => [{22590, 1, 10000}]};
get(_) -> false.

jump(1) -> {5, 5, lang:get("恭喜，5回合内完成了挑战，获得跳关奖励！")};
jump(3) -> {5, 7, lang:get("恭喜，5回合内完成了挑战，获得跳关奖励！")};
jump(5) -> {5, 9, lang:get("恭喜，5回合内完成了挑战，获得跳关奖励！")};
jump(_) -> false.

get_coin_ratio(2) -> 1310;
get_coin_ratio(4) -> 1669;
get_coin_ratio(6) -> 1762;
get_coin_ratio(8) -> 2030;
get_coin_ratio(10) -> 2120;
get_coin_ratio(12) -> 2564;
get_coin_ratio(_) -> 1000.

