-file("src/data/bring_up_data.erl", 1).

-module(bring_up_data).

-export([get_gift/1,
         list_all_type/0,
         get_recharge_gift/1,
         get_bring_gift/1,
         list_bring_info/0,
         list_bring_lev/0,
         get_extra_cfg/0]).

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

-file("src/data/bring_up_data.erl", 23).

get_gift(0) ->
    #{type => 0, need_val => 100, times => 1,
      reward =>
          [{20000, 0, 1, 1, 200, 2, 0, 1},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达100可领")};
get_gift(1) ->
    #{type => 1, need_val => 10, times => 1,
      reward =>
          [{90026, 0, 50, 1, 79, 2, 0, 1},
           {20034, 0, 2, 1, 79, 2, 0, 1},
           {20005, 0, 5, 1, 79, 2, 0, 0},
           {90026, 0, 50, 80, 200, 2, 0, 1},
           {20034, 0, 2, 80, 200, 2, 0, 1},
           {20025, 0, 1, 80, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift(2) ->
    #{type => 2, need_val => 60, times => 1,
      reward =>
          [{22249, 0, 1, 1, 79, 2, 0, 1},
           {20002, 0, 1, 1, 79, 2, 0, 0},
           {20025, 0, 1, 1, 79, 2, 0, 0},
           {20020, 0, 3, 80, 200, 2, 0, 1},
           {20021, 0, 3, 80, 200, 2, 0, 1},
           {20002, 0, 1, 80, 200, 2, 0, 0}],
      add_val => 60, title => lang:get("薄荷草喂养"),
      desc => lang:get("秘银惊喜礼包")};
get_gift(3) ->
    #{type => 3, need_val => 120, times => 1,
      reward =>
          [{21322, 0, 1, 1, 79, 2, 0, 1},
           {20087, 0, 2, 1, 79, 2, 0, 1},
           {20002, 0, 2, 1, 79, 2, 0, 0},
           {20004, 0, 3, 1, 79, 2, 0, 0},
           {20053, 0, 1, 80, 200, 2, 0, 1},
           {22585, 0, 1, 80, 200, 2, 0, 1},
           {20004, 0, 1, 80, 200, 2, 0, 0},
           {20006, 0, 5, 80, 200, 2, 0, 0}],
      add_val => 120, title => lang:get("金铃铛玩具"),
      desc => lang:get("幸运挖宝礼包")};
get_gift(_) -> false.

list_all_type() -> [2, 3, 0, 1].

get_recharge_gift(Gold)
    when Gold =:= 100 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Gold)
    when Gold =:= 10 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Gold)
    when Gold =:= 60 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Gold)
    when Gold =:= 120 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(_) -> false.

get_bring_gift(1) -> {1, 270, 2, [{71063, 0, 1}]};
get_bring_gift(_) -> false.

list_bring_info() ->
    [{1, 80, 0}, {1, 145, 1}, {1, 225, 2}].

list_bring_lev() -> [1].

get_extra_cfg() ->
    [#{buy_mail_title => lang:get("萌萌喵喵"),
       buy_mail_content => lang:get("由于背包已满，奖励通过邮件发放，请查收"),
       bring_mail_title => lang:get("萌萌喵喵亲密宝箱"),
       bring_mail_content => lang:get("由于背包已满，奖励通过邮件发放，请查收")}].

