-file("src/data/camp_pass_flower_language_data.erl", 1).

-module(camp_pass_flower_language_data).

-export([get_cfg/0,
         get_flower_list/0,
         get_flower_info/1,
         get_final_reward/0,
         get_send_flower_list/0,
         get_send_flower_times/1,
         get_double_reward_info/0,
         get_text/1]).

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

-file("src/data/camp_pass_flower_language_data.erl",
      21).

get_cfg() -> [10].

get_flower_list() -> [1, 2, 3, 4, 5, 6, 7].

get_flower_info(1) ->
    #{id => 1, name => lang:get("玫瑰"), icon => 25030,
      meaning => lang:get("一帆风顺"), reward => 70111};
get_flower_info(2) ->
    #{id => 2, name => lang:get("梅花"), icon => 25032,
      meaning => lang:get("二龙腾飞"), reward => 70111};
get_flower_info(3) ->
    #{id => 3, name => lang:get("紫鸢"), icon => 25033,
      meaning => lang:get("三羊开泰"), reward => 70111};
get_flower_info(4) ->
    #{id => 4, name => lang:get("郁金香"), icon => 25034,
      meaning => lang:get("四季平安"), reward => 70111};
get_flower_info(5) ->
    #{id => 5, name => lang:get("百合"), icon => 25035,
      meaning => lang:get("五福临门"), reward => 70111};
get_flower_info(6) ->
    #{id => 6, name => lang:get("紫罗兰"), icon => 25037,
      meaning => lang:get("六六大顺"), reward => 70111};
get_flower_info(7) ->
    #{id => 7, name => lang:get("樱花"), icon => 25038,
      meaning => lang:get("七星高照"), reward => 70111};
get_flower_info(_) -> flase.

get_final_reward() -> [70130].

get_send_flower_list() ->
    [1,
     10,
     11,
     12,
     13,
     14,
     15,
     16,
     17,
     18,
     19,
     2,
     20,
     21,
     22,
     23,
     24,
     25,
     26,
     27,
     28,
     29,
     3,
     30,
     4,
     5,
     6,
     7,
     8,
     9].

get_send_flower_times(1) ->
    #{send_id => 1, day => 1, send_time => [{10, 0, 0}],
      flower => [{1, 1}, {2, 1}]};
get_send_flower_times(2) ->
    #{send_id => 2, day => 1, send_time => [{11, 45, 0}],
      flower => [{3, 2}, {4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(3) ->
    #{send_id => 3, day => 1, send_time => [{12, 0, 0}],
      flower => [{1, 3}, {2, 3}]};
get_send_flower_times(4) ->
    #{send_id => 4, day => 1, send_time => [{14, 0, 0}],
      flower => [{3, 2}, {4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(5) ->
    #{send_id => 5, day => 1, send_time => [{16, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(6) ->
    #{send_id => 6, day => 1, send_time => [{18, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(7) ->
    #{send_id => 7, day => 1, send_time => [{19, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(8) ->
    #{send_id => 8, day => 1, send_time => [{20, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(9) ->
    #{send_id => 9, day => 1, send_time => [{21, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(10) ->
    #{send_id => 10, day => 1, send_time => [{22, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(11) ->
    #{send_id => 11, day => 2, send_time => [{10, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(12) ->
    #{send_id => 12, day => 2, send_time => [{11, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(13) ->
    #{send_id => 13, day => 2, send_time => [{12, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(14) ->
    #{send_id => 14, day => 2, send_time => [{14, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(15) ->
    #{send_id => 15, day => 2, send_time => [{16, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(16) ->
    #{send_id => 16, day => 2, send_time => [{18, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(17) ->
    #{send_id => 17, day => 2, send_time => [{19, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(18) ->
    #{send_id => 18, day => 2, send_time => [{20, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(19) ->
    #{send_id => 19, day => 2, send_time => [{21, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(20) ->
    #{send_id => 20, day => 2, send_time => [{22, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(21) ->
    #{send_id => 21, day => 3, send_time => [{10, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(22) ->
    #{send_id => 22, day => 3, send_time => [{11, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(23) ->
    #{send_id => 23, day => 3, send_time => [{12, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(24) ->
    #{send_id => 24, day => 3, send_time => [{14, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(25) ->
    #{send_id => 25, day => 3, send_time => [{16, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(26) ->
    #{send_id => 26, day => 3, send_time => [{18, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(27) ->
    #{send_id => 27, day => 3, send_time => [{19, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(28) ->
    #{send_id => 28, day => 3, send_time => [{20, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(29) ->
    #{send_id => 29, day => 3, send_time => [{21, 0, 0}],
      flower => [{1, 2}, {2, 2}, {3, 2}]};
get_send_flower_times(30) ->
    #{send_id => 30, day => 3, send_time => [{22, 0, 0}],
      flower => [{4, 2}, {5, 2}, {6, 2}, {7, 2}]};
get_send_flower_times(_) -> false.

get_double_reward_info() ->
    [{1, 50, 10, 300},
     {51, 100, 5, 200},
     {100, 200, 3, 50},
     {201, 300, 2, 50}].

get_text(2) ->
    #{mail_type => 2, title => lang:get("传递花语"),
      content => lang:get("由于您领取奖励时背包已满，奖励将通过邮件发放，请查收")};
get_text(3) ->
    #{mail_type => 3, title => lang:get("传递花语"),
      content =>
          lang:get("由于花儿们休息时间到了，您的奖励尚未领取，将通过邮件发放，请查收")};
get_text(4) ->
    #{mail_type => 4, title => lang:get("花语幸运儿"),
      content =>
          lang:get("哇哦！恭喜您今天获得女神的青睐，首位将充满祝福的花朵送给您，快将祝福传递给好友吧！<col"
                   "or='#ffff00'>（若在10分钟内未传递，系统将自动把花朵送给下一位幸运儿哟）</"
                   "color>\n{panel_2, 14003, #3eff1e, 点击前往查看,0,10"
                   "62}")};
get_text(5) ->
    #{mail_type => 5, title => lang:get("收花提示"),
      content =>
          lang:get("有位神秘人来给你送花啦！可前往活动界面查看，请在10分钟内把充满祝福的花儿传递出去哟！\n"
                   "{panel_2, 14003, #3eff1e, 点击前往查看,0,1062}")};
get_text(_) -> false.

