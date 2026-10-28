-file("src/data/camp_bring_up_open_data.erl", 1).

-module(camp_bring_up_open_data).

-export([get_gift/1,
         list_all_type/0,
         get_recharge_gift/2,
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

-file("src/data/camp_bring_up_open_data.erl", 23).

get_gift({1, 0}) ->
    #{day => 1, type => 0, need_val => 80, times => 1,
      reward =>
          [{20031, 0, 1, 1, 200, 2, 0, 1},
           {20005, 0, 3, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({2, 0}) ->
    #{day => 2, type => 0, need_val => 80, times => 1,
      reward =>
          [{20000, 0, 1, 1, 200, 2, 0, 1},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({3, 0}) ->
    #{day => 3, type => 0, need_val => 80, times => 1,
      reward =>
          [{20000, 0, 1, 1, 200, 2, 0, 1},
           {21220, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({4, 0}) ->
    #{day => 4, type => 0, need_val => 80, times => 1,
      reward =>
          [{20005, 0, 3, 1, 200, 2, 0, 1},
           {20052, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({5, 0}) ->
    #{day => 5, type => 0, need_val => 80, times => 1,
      reward =>
          [{90026, 0, 50, 1, 200, 2, 0, 1},
           {20005, 0, 3, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({6, 0}) ->
    #{day => 6, type => 0, need_val => 80, times => 1,
      reward =>
          [{20025, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({7, 0}) ->
    #{day => 7, type => 0, need_val => 80, times => 1,
      reward =>
          [{20005, 0, 3, 1, 200, 2, 0, 1},
           {20052, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("温柔抚摸"),
      desc => lang:get("每日活跃度达80可领")};
get_gift({1, 1}) ->
    #{day => 1, type => 1, need_val => 30, times => 1,
      reward =>
          [{90026, 0, 50, 1, 200, 2, 0, 1},
           {21220, 0, 2, 1, 200, 2, 0, 0},
           {20034, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({2, 1}) ->
    #{day => 2, type => 1, need_val => 30, times => 1,
      reward =>
          [{20025, 0, 1, 1, 200, 2, 0, 1},
           {21220, 0, 3, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({3, 1}) ->
    #{day => 3, type => 1, need_val => 30, times => 1,
      reward =>
          [{20034, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({4, 1}) ->
    #{day => 4, type => 1, need_val => 30, times => 1,
      reward =>
          [{20025, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({5, 1}) ->
    #{day => 5, type => 1, need_val => 30, times => 1,
      reward =>
          [{20034, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({6, 1}) ->
    #{day => 6, type => 1, need_val => 30, times => 1,
      reward =>
          [{20034, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({7, 1}) ->
    #{day => 7, type => 1, need_val => 30, times => 1,
      reward =>
          [{20034, 0, 1, 1, 200, 2, 0, 1},
           {20000, 0, 1, 1, 200, 2, 0, 0},
           {20006, 0, 5, 1, 200, 2, 0, 0}],
      add_val => 10, title => lang:get("小鱼喂养"),
      desc => lang:get("每日惊喜好礼")};
get_gift({1, 2}) ->
    #{day => 1, type => 2, need_val => 80, times => 1,
      reward =>
          [{22249, 0, 1, 1, 200, 2, 0, 1},
           {20002, 0, 1, 1, 200, 2, 0, 0},
           {20025, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("秘银惊喜礼包")};
get_gift({2, 2}) ->
    #{day => 2, type => 2, need_val => 80, times => 1,
      reward =>
          [{20020, 0, 4, 1, 200, 2, 0, 1},
           {20021, 0, 3, 1, 200, 2, 0, 1},
           {20002, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("强化加成礼包")};
get_gift({3, 2}) ->
    #{day => 3, type => 2, need_val => 80, times => 1,
      reward =>
          [{20007, 0, 2, 1, 200, 2, 0, 1},
           {20021, 0, 1, 1, 200, 2, 0, 1},
           {20020, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("宠物培养礼包")};
get_gift({4, 2}) ->
    #{day => 4, type => 2, need_val => 80, times => 1,
      reward =>
          [{20087, 0, 1, 1, 200, 2, 0, 1},
           {20021, 0, 3, 1, 200, 2, 0, 1},
           {20002, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("强化加成礼包")};
get_gift({5, 2}) ->
    #{day => 5, type => 2, need_val => 80, times => 1,
      reward =>
          [{20087, 0, 1, 1, 200, 2, 0, 1},
           {20025, 0, 2, 1, 200, 2, 0, 1},
           {20052, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("冒险加成礼包")};
get_gift({6, 2}) ->
    #{day => 6, type => 2, need_val => 80, times => 1,
      reward =>
          [{20020, 0, 5, 1, 200, 2, 0, 1},
           {20025, 0, 2, 1, 200, 2, 0, 1},
           {20052, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("能力培养礼包")};
get_gift({7, 2}) ->
    #{day => 7, type => 2, need_val => 80, times => 1,
      reward =>
          [{20087, 0, 1, 1, 200, 2, 0, 1},
           {20025, 0, 2, 1, 200, 2, 0, 1},
           {20052, 0, 2, 1, 200, 2, 0, 0}],
      add_val => 30, title => lang:get("薄荷草喂养"),
      desc => lang:get("幸运挖宝礼包")};
get_gift({1, 3}) ->
    #{day => 1, type => 3, need_val => 280, times => 1,
      reward =>
          [{20053, 0, 1, 1, 200, 2, 0, 1},
           {70935, 0, 1, 1, 200, 2, 0, 1},
           {21100, 0, 1, 1, 200, 2, 0, 1},
           {20034, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("新手补给礼包")};
get_gift({2, 3}) ->
    #{day => 2, type => 3, need_val => 280, times => 1,
      reward =>
          [{21322, 0, 1, 1, 200, 2, 0, 1},
           {70935, 0, 1, 1, 200, 2, 0, 1},
           {20545, 0, 1, 1, 200, 2, 0, 1},
           {20034, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("幸运幻化礼包")};
get_gift({3, 3}) ->
    #{day => 3, type => 3, need_val => 280, times => 1,
      reward =>
          [{70935, 0, 1, 1, 200, 2, 0, 1},
           {20008, 0, 1, 1, 200, 2, 0, 1},
           {21100, 0, 1, 1, 200, 2, 0, 1},
           {20006, 0, 50, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("翅膀飞升礼包")};
get_gift({4, 3}) ->
    #{day => 4, type => 3, need_val => 280, times => 1,
      reward =>
          [{21322, 0, 1, 1, 200, 2, 0, 1},
           {70935, 0, 1, 1, 200, 2, 0, 1},
           {20545, 0, 1, 1, 200, 2, 0, 1},
           {20009, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("幸运幻化礼包")};
get_gift({5, 3}) ->
    #{day => 5, type => 3, need_val => 280, times => 1,
      reward =>
          [{70935, 0, 1, 1, 200, 2, 0, 1},
           {22249, 0, 1, 1, 200, 2, 0, 1},
           {20021, 0, 5, 1, 200, 2, 0, 1},
           {23752, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("秘银闪耀礼包")};
get_gift({6, 3}) ->
    #{day => 6, type => 3, need_val => 280, times => 1,
      reward =>
          [{21322, 0, 1, 1, 200, 2, 0, 1},
           {70935, 0, 1, 1, 200, 2, 0, 1},
           {20034, 0, 5, 1, 200, 2, 0, 1},
           {20545, 0, 1, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("幸运幻化礼包")};
get_gift({7, 3}) ->
    #{day => 7, type => 3, need_val => 280, times => 1,
      reward =>
          [{20053, 0, 1, 1, 200, 2, 0, 1},
           {70935, 0, 1, 1, 200, 2, 0, 1},
           {20022, 0, 1, 1, 200, 2, 0, 1},
           {20020, 0, 3, 1, 200, 2, 0, 0}],
      add_val => 100, title => lang:get("金铃铛玩具"),
      desc => lang:get("幸运挖宝礼包")};
get_gift({1, 4}) ->
    #{day => 1, type => 4, need_val => 980, times => 1,
      reward =>
          [{20616, 0, 1, 1, 200, 2, 0, 1},
           {22585, 0, 5, 1, 200, 2, 0, 1},
           {20075, 0, 2, 1, 200, 2, 0, 1},
           {20039, 0, 2, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("幸运护符礼包")};
get_gift({2, 4}) ->
    #{day => 2, type => 4, need_val => 980, times => 1,
      reward =>
          [{28607, 0, 1, 1, 200, 2, 0, 1},
           {22216, 0, 5, 1, 200, 2, 0, 1},
           {29314, 0, 1, 1, 200, 2, 0, 1},
           {20014, 0, 1, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("惊喜图鉴礼包")};
get_gift({3, 4}) ->
    #{day => 3, type => 4, need_val => 980, times => 1,
      reward =>
          [{22216, 0, 5, 1, 200, 2, 0, 1},
           {22585, 0, 5, 1, 200, 2, 0, 1},
           {29101, 0, 1, 1, 200, 2, 0, 1},
           {29102, 0, 3, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("冒险飞升礼包")};
get_gift({4, 4}) ->
    #{day => 4, type => 4, need_val => 980, times => 1,
      reward =>
          [{20076, 0, 1, 1, 200, 2, 0, 1},
           {20014, 0, 1, 1, 200, 2, 0, 1},
           {20040, 0, 1, 1, 200, 2, 0, 1},
           {22585, 0, 3, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("宠物培养礼包")};
get_gift({5, 4}) ->
    #{day => 5, type => 4, need_val => 980, times => 1,
      reward =>
          [{20755, 0, 2, 1, 200, 2, 0, 1},
           {21101, 0, 2, 1, 200, 2, 0, 1},
           {29101, 0, 1, 1, 200, 2, 0, 1},
           {29102, 0, 3, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("神宠提升礼包")};
get_gift({6, 4}) ->
    #{day => 6, type => 4, need_val => 980, times => 1,
      reward =>
          [{28607, 0, 1, 1, 200, 2, 0, 1},
           {21101, 0, 2, 1, 200, 2, 0, 1},
           {20014, 0, 1, 1, 200, 2, 0, 1},
           {22216, 0, 5, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("翅膀飞升礼包")};
get_gift({7, 4}) ->
    #{day => 7, type => 4, need_val => 980, times => 1,
      reward =>
          [{22301, 0, 1, 1, 200, 2, 0, 1},
           {22300, 0, 1, 1, 200, 2, 0, 1},
           {22219, 0, 5, 1, 200, 2, 0, 1},
           {20034, 0, 5, 1, 200, 2, 0, 1}],
      add_val => 330, title => lang:get("毛线球玩具"),
      desc => lang:get("能力提升礼包")};
get_gift(_) -> false.

list_all_type() -> [2, 3, 0, 4, 1].

get_recharge_gift(Day, Gold)
    when Day =:= 1 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 2 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 3 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 4 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 5 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 6 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 7 andalso Gold =:= 80 andalso 0 =/= 0 ->
    {0, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 1 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 2 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 3 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 4 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 5 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 6 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 7 andalso Gold =:= 30 andalso 1 =/= 0 ->
    {1, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 1 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 2 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 3 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 4 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 5 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 6 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 7 andalso Gold =:= 80 andalso 2 =/= 0 ->
    {2, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 1 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 2 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 3 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 4 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 5 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 6 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 7 andalso Gold =:= 280 andalso 3 =/= 0 ->
    {3, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 1 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 2 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 3 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 4 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 5 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 6 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(Day, Gold)
    when Day =:= 7 andalso Gold =:= 980 andalso 4 =/= 0 ->
    {4, 1};
get_recharge_gift(_, _) -> false.

get_bring_gift(1) -> {1, 500, 2, [{71063, 0, 1}]};
get_bring_gift(2) -> {2, 500, 2, [{71063, 0, 1}]};
get_bring_gift(3) -> {3, 500, 2, [{71063, 0, 1}]};
get_bring_gift(4) -> {4, 500, 2, [{71063, 0, 1}]};
get_bring_gift(5) -> {5, 500, 2, [{71063, 0, 1}]};
get_bring_gift(6) -> {6, 500, 2, [{71098, 0, 1}]};
get_bring_gift(7) -> {7, 500, 2, [{71098, 0, 1}]};
get_bring_gift(_) -> false.

list_bring_info() ->
    [{1, 125, 0},
     {1, 250, 1},
     {1, 450, 2},
     {2, 125, 3},
     {2, 250, 4},
     {2, 450, 5},
     {3, 125, 6},
     {3, 250, 7},
     {3, 450, 8},
     {4, 125, 9},
     {4, 250, 10},
     {4, 450, 11},
     {5, 125, 12},
     {5, 250, 13},
     {5, 450, 14},
     {6, 125, 15},
     {6, 250, 16},
     {6, 450, 17},
     {7, 125, 18},
     {7, 250, 19},
     {7, 450, 20}].

list_bring_lev() -> [1, 2, 3, 4, 5, 6, 7].

get_extra_cfg() ->
    [#{buy_mail_title => lang:get("萌萌喵喵"),
       buy_mail_content => lang:get("由于背包已满，奖励通过邮件发放，请查收"),
       bring_mail_title => lang:get("萌萌喵喵亲密宝箱"),
       bring_mail_content => lang:get("由于背包已满，奖励通过邮件发放，请查收")}].

