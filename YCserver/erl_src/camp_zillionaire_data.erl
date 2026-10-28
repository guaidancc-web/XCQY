-file("src/data/camp_zillionaire_data.erl", 1).

-module(camp_zillionaire_data).

-export([get_key_val/1,
         get_grid/1,
         get_event/1,
         get_ring_reward/1]).

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

-file("src/data/camp_zillionaire_data.erl", 16).

get_key_val(1) -> [{70885, 1}];
get_key_val(2) -> {15, 1, 2};
get_key_val(3) -> 36;
get_key_val(4) -> 1000;
get_key_val(_) -> false.

get_grid(0) ->
    #{index => 0, event => [{1, 100}], ratio => 450,
      is_guarantee => 0};
get_grid(1) ->
    #{index => 1, event => [{2, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(2) ->
    #{index => 2, event => [{3, 100}], ratio => 150,
      is_guarantee => 1};
get_grid(3) ->
    #{index => 3, event => [{4, 100}], ratio => 20,
      is_guarantee => 0};
get_grid(4) ->
    #{index => 4, event => [{5, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(5) ->
    #{index => 5, event => [{6, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(6) ->
    #{index => 6, event => [{7, 100}], ratio => 450,
      is_guarantee => 0};
get_grid(7) ->
    #{index => 7, event => [{8, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(8) ->
    #{index => 8, event => [{9, 100}], ratio => 150,
      is_guarantee => 0};
get_grid(9) ->
    #{index => 9, event => [{10, 100}], ratio => 20,
      is_guarantee => 0};
get_grid(10) ->
    #{index => 10, event => [{11, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(11) ->
    #{index => 11, event => [{12, 100}], ratio => 30,
      is_guarantee => 0};
get_grid(12) ->
    #{index => 12, event => [{13, 100}], ratio => 450,
      is_guarantee => 0};
get_grid(13) ->
    #{index => 13, event => [{14, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(14) ->
    #{index => 14, event => [{15, 100}], ratio => 150,
      is_guarantee => 0};
get_grid(15) ->
    #{index => 15, event => [{16, 100}], ratio => 20,
      is_guarantee => 0};
get_grid(16) ->
    #{index => 16, event => [{17, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(17) ->
    #{index => 17, event => [{18, 100}], ratio => 30,
      is_guarantee => 0};
get_grid(18) ->
    #{index => 18, event => [{19, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(19) ->
    #{index => 19, event => [{20, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(20) ->
    #{index => 20, event => [{21, 100}], ratio => 150,
      is_guarantee => 0};
get_grid(21) ->
    #{index => 21, event => [{22, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(22) ->
    #{index => 22, event => [{23, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(23) ->
    #{index => 23, event => [{24, 100}], ratio => 30,
      is_guarantee => 0};
get_grid(24) ->
    #{index => 24, event => [{25, 100}], ratio => 450,
      is_guarantee => 0};
get_grid(25) ->
    #{index => 25, event => [{26, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(26) ->
    #{index => 26, event => [{27, 100}], ratio => 150,
      is_guarantee => 0};
get_grid(27) ->
    #{index => 27, event => [{28, 100}], ratio => 20,
      is_guarantee => 0};
get_grid(28) ->
    #{index => 28, event => [{29, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(29) ->
    #{index => 29, event => [{30, 100}], ratio => 30,
      is_guarantee => 1};
get_grid(30) ->
    #{index => 30, event => [{31, 100}], ratio => 450,
      is_guarantee => 0};
get_grid(31) ->
    #{index => 31, event => [{32, 100}], ratio => 300,
      is_guarantee => 0};
get_grid(32) ->
    #{index => 32, event => [{33, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(33) ->
    #{index => 33, event => [{34, 100}], ratio => 20,
      is_guarantee => 0};
get_grid(34) ->
    #{index => 34, event => [{35, 100}], ratio => 50,
      is_guarantee => 0};
get_grid(35) ->
    #{index => 35, event => [{36, 100}], ratio => 30,
      is_guarantee => 1};
get_grid(_) -> false.

get_event(1) ->
    #{event => 1, event_type => item,
      args => [{90026, 0, 88}], is_hearsay => 0,
      rewards => [{90026, 88}]};
get_event(2) ->
    #{event => 2, event_type => item,
      args => [{20000, 0, 1}], is_hearsay => 0,
      rewards => [{20000, 1}]};
get_event(3) ->
    #{event => 3, event_type => item,
      args => [{20046, 0, 1}], is_hearsay => 0,
      rewards => [{20046, 1}]};
get_event(4) ->
    #{event => 4, event_type => lucky_dice, args => [1],
      is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts")};
get_event(5) ->
    #{event => 5, event_type => quest, args => [83698],
      is_hearsay => 1,
      hearsay_msg => lang:get("~ts在赞美公会会长的时候，竟获得了~ts")};
get_event(6) ->
    #{event => 6, event_type => item,
      args => [{23740, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{23740, 1}]};
get_event(7) ->
    #{event => 7, event_type => item,
      args => [{20002, 0, 1}], is_hearsay => 0,
      rewards => [{20002, 1}]};
get_event(8) ->
    #{event => 8, event_type => item,
      args => [{90003, 0, 6666}], is_hearsay => 0,
      rewards => [{90003, 6666}]};
get_event(9) ->
    #{event => 9, event_type => item,
      args => [{22585, 0, 1}], is_hearsay => 0,
      rewards => [{22585, 1}]};
get_event(10) ->
    #{event => 10, event_type => item,
      args => [{29041, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{29041, 1}]};
get_event(11) ->
    #{event => 11, event_type => backwards, args => [1],
      is_hearsay => 0};
get_event(12) ->
    #{event => 12, event_type => item,
      args => [{20032, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{20032, 1}]};
get_event(13) ->
    #{event => 13, event_type => item,
      args => [{20087, 0, 1}], is_hearsay => 0,
      rewards => [{20087, 1}]};
get_event(14) ->
    #{event => 14, event_type => item,
      args => [{22216, 0, 1}], is_hearsay => 0,
      rewards => [{22216, 1}]};
get_event(15) ->
    #{event => 15, event_type => item,
      args => [{20075, 0, 1}], is_hearsay => 0,
      rewards => [{20075, 1}]};
get_event(16) ->
    #{event => 16, event_type => item,
      args => [{21177, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{21177, 1}]};
get_event(17) ->
    #{event => 17, event_type => item,
      args => [{20616, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{20616, 1}]};
get_event(18) ->
    #{event => 18, event_type => quest, args => [83745],
      is_hearsay => 1,
      hearsay_msg =>
          lang:get("~ts在欢乐寻宝中遇到神奇又神秘的事件，探险过程中竟获得了~ts")};
get_event(19) ->
    #{event => 19, event_type => item,
      args => [{20034, 0, 2}], is_hearsay => 0,
      rewards => [{20034, 2}]};
get_event(20) ->
    #{event => 20, event_type => item,
      args => [{90026, 0, 150}], is_hearsay => 0,
      rewards => [{90026, 150}]};
get_event(21) ->
    #{event => 21, event_type => quest, args => [83746],
      is_hearsay => 1,
      hearsay_msg =>
          lang:get("~ts在欢乐寻宝中遇到神奇又神秘的事件，探险过程中竟获得了~ts")};
get_event(22) ->
    #{event => 22, event_type => lucky_dice, args => [1],
      is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts")};
get_event(23) ->
    #{event => 23, event_type => item,
      args => [{20014, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{20014, 1}]};
get_event(24) ->
    #{event => 24, event_type => item,
      args => [{22445, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{22445, 1}]};
get_event(25) ->
    #{event => 25, event_type => item,
      args => [{20025, 0, 2}], is_hearsay => 0,
      rewards => [{20025, 2}]};
get_event(26) ->
    #{event => 26, event_type => ahead, args => [1],
      is_hearsay => 0};
get_event(27) ->
    #{event => 27, event_type => item,
      args => [{21322, 0, 1}], is_hearsay => 0,
      rewards => [{21322, 1}]};
get_event(28) ->
    #{event => 28, event_type => item,
      args => [{20617, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{20617, 1}]};
get_event(29) ->
    #{event => 29, event_type => item,
      args => [{29101, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{29101, 1}]};
get_event(30) ->
    #{event => 30, event_type => item,
      args => [{29314, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{29314, 1}]};
get_event(31) ->
    #{event => 31, event_type => item,
      args => [{20006, 0, 10}], is_hearsay => 0,
      rewards => [{20006, 10}]};
get_event(32) ->
    #{event => 32, event_type => quest, args => [83748],
      is_hearsay => 0};
get_event(33) ->
    #{event => 33, event_type => item,
      args => [{23752, 0, 1}], is_hearsay => 0,
      rewards => [{23752, 1}]};
get_event(34) ->
    #{event => 34, event_type => npc_talk,
      args =>
          [91368,
           [{90026, 0, 1888}],
           "我在这路口等待许久，终于等到你啦！为了让大家在今天都能开心大笑，我准备了好多礼物要派给大家"
           "哟，你是第一份，也是最特别的，送给最特别的你~{face_1,3}"],
      is_hearsay => 1,
      hearsay_msg => lang:get("~ts在欢乐寻宝中获得了姬的祝福，且获得了~ts"),
      rewards => [{90026, 1888}], npc => 91368,
      npc_msg =>
          lang:get("我在这路口等待许久，终于等到你啦！为了让大家在今天都能开心大笑，我准备了好多礼物要派给大家"
                   "哟，你是第一份，也是最特别的，送给最特别的你~{face_1,3}")};
get_event(35) ->
    #{event => 35, event_type => item,
      args => [{23740, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{23740, 1}]};
get_event(36) ->
    #{event => 36, event_type => item,
      args => [{20076, 0, 1}], is_hearsay => 1,
      hearsay_msg => lang:get("哇塞，~ts在欢乐寻宝中一脚踩下去，发现竟获得了~ts"),
      rewards => [{20076, 1}]};
get_event(_) -> false.

get_ring_reward(1) ->
    #{times => 1,
      rewards => [{20616, 0, 1, 1}, {20075, 1, 1, 1}],
      is_hearsay => 0};
get_ring_reward(3) ->
    #{times => 3,
      rewards => [{23740, 0, 1, 1}, {20014, 0, 1, 1}],
      is_hearsay => 0};
get_ring_reward(6) ->
    #{times => 6,
      rewards => [{22445, 0, 2, 1}, {29101, 0, 2, 1}],
      is_hearsay => 1,
      hearsay_msg => lang:get("可喜可贺，~ts在欢乐寻宝中获得了轮回奖励~ts")};
get_ring_reward(10) ->
    #{times => 10,
      rewards => [{20617, 0, 1, 1}, {20076, 1, 2, 1}],
      is_hearsay => 1,
      hearsay_msg => lang:get("可喜可贺，~ts在欢乐寻宝中获得了轮回奖励~ts")};
get_ring_reward(_) -> false.

