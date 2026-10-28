-file("src/data/friend_data.erl", 1).

-module(friend_data).

-export([get_normal_prize/0,
         get_high_prize/0,
         get_present/1,
         get_popularity_reward/1,
         get_reward/2,
         get_reward_draw/1,
         list/0,
         get_recall_reward/1,
         get_recall_reward_list/0,
         get_recalled_reward/1,
         get_recalled_reward_list/0,
         get_activity_reward/1,
         get_growth_buff/1,
         get_platform_num/1,
         get_rand_list/1,
         get_reward_id/1]).

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

-file("src/data/friend_data.erl", 33).

get_normal_prize() ->
    [{90000, 1, 0},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist},
     {val_not_exist, val_not_exist, val_not_exist}].

get_high_prize() ->
    [{20004, 1, 30},
     {20005, 1, 20},
     {20006, 1, 250},
     {20019, 1, 250},
     {20020, 1, 20},
     {20025, 1, 10},
     {20052, 1, 20},
     {20060, 1, 70},
     {90000, 12000, 330}].

get_present(21900) ->
    #{item_id => 21900, name => lang:get("1级魔攻雕文"),
      type => 0, intimacy => 0, order => 1, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21901) ->
    #{item_id => 21901, name => lang:get("2级魔攻雕文"),
      type => 0, intimacy => 0, order => 2, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21902) ->
    #{item_id => 21902, name => lang:get("3级魔攻雕文"),
      type => 0, intimacy => 0, order => 3, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21903) ->
    #{item_id => 21903, name => lang:get("4级魔攻雕文"),
      type => 0, intimacy => 0, order => 4, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21904) ->
    #{item_id => 21904, name => lang:get("5级魔攻雕文"),
      type => 0, intimacy => 0, order => 5, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21905) ->
    #{item_id => 21905, name => lang:get("6级魔攻雕文"),
      type => 0, intimacy => 0, order => 6, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21906) ->
    #{item_id => 21906, name => lang:get("7级魔攻雕文"),
      type => 0, intimacy => 0, order => 7, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21907) ->
    #{item_id => 21907, name => lang:get("8级魔攻雕文"),
      type => 0, intimacy => 0, order => 8, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21908) ->
    #{item_id => 21908, name => lang:get("9级魔攻雕文"),
      type => 0, intimacy => 0, order => 9, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21909) ->
    #{item_id => 21909, name => lang:get("10级魔攻雕文"),
      type => 0, intimacy => 0, order => 10, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21910) ->
    #{item_id => 21910, name => lang:get("1级魔抗雕文"),
      type => 0, intimacy => 0, order => 11, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21911) ->
    #{item_id => 21911, name => lang:get("2级魔抗雕文"),
      type => 0, intimacy => 0, order => 12, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21912) ->
    #{item_id => 21912, name => lang:get("3级魔抗雕文"),
      type => 0, intimacy => 0, order => 13, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21913) ->
    #{item_id => 21913, name => lang:get("4级魔抗雕文"),
      type => 0, intimacy => 0, order => 14, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21914) ->
    #{item_id => 21914, name => lang:get("5级魔抗雕文"),
      type => 0, intimacy => 0, order => 15, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21915) ->
    #{item_id => 21915, name => lang:get("6级魔抗雕文"),
      type => 0, intimacy => 0, order => 16, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21916) ->
    #{item_id => 21916, name => lang:get("7级魔抗雕文"),
      type => 0, intimacy => 0, order => 17, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21917) ->
    #{item_id => 21917, name => lang:get("8级魔抗雕文"),
      type => 0, intimacy => 0, order => 18, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21918) ->
    #{item_id => 21918, name => lang:get("9级魔抗雕文"),
      type => 0, intimacy => 0, order => 19, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21919) ->
    #{item_id => 21919, name => lang:get("10级魔抗雕文"),
      type => 0, intimacy => 0, order => 20, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21500) ->
    #{item_id => 21500, name => lang:get("生命雕文"), type => 0,
      intimacy => 0, order => 21, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21502) ->
    #{item_id => 21502, name => lang:get("物攻雕文"), type => 0,
      intimacy => 0, order => 22, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21504) ->
    #{item_id => 21504, name => lang:get("魔攻雕文"), type => 0,
      intimacy => 0, order => 23, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21506) ->
    #{item_id => 21506, name => lang:get("攻速雕文"), type => 0,
      intimacy => 0, order => 24, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21508) ->
    #{item_id => 21508, name => lang:get("防御雕文"), type => 0,
      intimacy => 0, order => 25, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21509) ->
    #{item_id => 21509, name => lang:get("暴击雕文"), type => 0,
      intimacy => 0, order => 26, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21530) ->
    #{item_id => 21530, name => lang:get("生命雕文（二）"),
      type => 0, intimacy => 0, order => 27, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21531) ->
    #{item_id => 21531, name => lang:get("物攻雕文（二）"),
      type => 0, intimacy => 0, order => 28, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21532) ->
    #{item_id => 21532, name => lang:get("元素雕文（二）"),
      type => 0, intimacy => 0, order => 29, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21533) ->
    #{item_id => 21533, name => lang:get("攻速雕文（二）"),
      type => 0, intimacy => 0, order => 30, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21534) ->
    #{item_id => 21534, name => lang:get("防御雕文（二）"),
      type => 0, intimacy => 0, order => 31, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21535) ->
    #{item_id => 21535, name => lang:get("生命雕文（三）"),
      type => 0, intimacy => 0, order => 32, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21536) ->
    #{item_id => 21536, name => lang:get("物攻雕文（三）"),
      type => 0, intimacy => 0, order => 33, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21537) ->
    #{item_id => 21537, name => lang:get("元素雕文（三）"),
      type => 0, intimacy => 0, order => 34, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21538) ->
    #{item_id => 21538, name => lang:get("攻速雕文（三）"),
      type => 0, intimacy => 0, order => 35, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21539) ->
    #{item_id => 21539, name => lang:get("防御雕文（三）"),
      type => 0, intimacy => 0, order => 36, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21540) ->
    #{item_id => 21540, name => lang:get("生命雕文（四）"),
      type => 0, intimacy => 0, order => 37, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21541) ->
    #{item_id => 21541, name => lang:get("物攻雕文（四）"),
      type => 0, intimacy => 0, order => 38, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21542) ->
    #{item_id => 21542, name => lang:get("元素雕文（四）"),
      type => 0, intimacy => 0, order => 39, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21543) ->
    #{item_id => 21543, name => lang:get("攻速雕文（四）"),
      type => 0, intimacy => 0, order => 40, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21544) ->
    #{item_id => 21544, name => lang:get("防御雕文（四）"),
      type => 0, intimacy => 0, order => 41, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21545) ->
    #{item_id => 21545, name => lang:get("生命雕文（五）"),
      type => 0, intimacy => 0, order => 42, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21546) ->
    #{item_id => 21546, name => lang:get("物攻雕文（五）"),
      type => 0, intimacy => 0, order => 43, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21547) ->
    #{item_id => 21547, name => lang:get("元素雕文（五）"),
      type => 0, intimacy => 0, order => 44, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21548) ->
    #{item_id => 21548, name => lang:get("攻速雕文（五）"),
      type => 0, intimacy => 0, order => 45, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21549) ->
    #{item_id => 21549, name => lang:get("防御雕文（五）"),
      type => 0, intimacy => 0, order => 46, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21550) ->
    #{item_id => 21550, name => lang:get("生命雕文（六）"),
      type => 0, intimacy => 0, order => 47, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21551) ->
    #{item_id => 21551, name => lang:get("物攻雕文（六）"),
      type => 0, intimacy => 0, order => 48, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21552) ->
    #{item_id => 21552, name => lang:get("元素雕文（六）"),
      type => 0, intimacy => 0, order => 49, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21553) ->
    #{item_id => 21553, name => lang:get("攻速雕文（六）"),
      type => 0, intimacy => 0, order => 50, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21554) ->
    #{item_id => 21554, name => lang:get("防御雕文（六）"),
      type => 0, intimacy => 0, order => 51, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21555) ->
    #{item_id => 21555, name => lang:get("生命雕文（七）"),
      type => 0, intimacy => 0, order => 52, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21556) ->
    #{item_id => 21556, name => lang:get("物攻雕文（七）"),
      type => 0, intimacy => 0, order => 53, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21557) ->
    #{item_id => 21557, name => lang:get("元素雕文（七）"),
      type => 0, intimacy => 0, order => 54, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21558) ->
    #{item_id => 21558, name => lang:get("攻速雕文（七）"),
      type => 0, intimacy => 0, order => 55, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21559) ->
    #{item_id => 21559, name => lang:get("防御雕文（七）"),
      type => 0, intimacy => 0, order => 56, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21560) ->
    #{item_id => 21560, name => lang:get("生命雕文（八）"),
      type => 0, intimacy => 0, order => 57, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21561) ->
    #{item_id => 21561, name => lang:get("物攻雕文（八）"),
      type => 0, intimacy => 0, order => 58, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21562) ->
    #{item_id => 21562, name => lang:get("元素雕文（八）"),
      type => 0, intimacy => 0, order => 59, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21563) ->
    #{item_id => 21563, name => lang:get("攻速雕文（八）"),
      type => 0, intimacy => 0, order => 60, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21564) ->
    #{item_id => 21564, name => lang:get("防御雕文（八）"),
      type => 0, intimacy => 0, order => 61, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21565) ->
    #{item_id => 21565, name => lang:get("生命雕文（九）"),
      type => 0, intimacy => 0, order => 62, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21566) ->
    #{item_id => 21566, name => lang:get("物攻雕文（九）"),
      type => 0, intimacy => 0, order => 63, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21567) ->
    #{item_id => 21567, name => lang:get("元素雕文（九）"),
      type => 0, intimacy => 0, order => 64, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21568) ->
    #{item_id => 21568, name => lang:get("攻速雕文（九）"),
      type => 0, intimacy => 0, order => 65, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21569) ->
    #{item_id => 21569, name => lang:get("防御雕文（九）"),
      type => 0, intimacy => 0, order => 66, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21570) ->
    #{item_id => 21570, name => lang:get("生命雕文（十）"),
      type => 0, intimacy => 0, order => 67, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21571) ->
    #{item_id => 21571, name => lang:get("物攻雕文（十）"),
      type => 0, intimacy => 0, order => 68, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21572) ->
    #{item_id => 21572, name => lang:get("元素雕文（十）"),
      type => 0, intimacy => 0, order => 69, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21573) ->
    #{item_id => 21573, name => lang:get("攻速雕文（十）"),
      type => 0, intimacy => 0, order => 70, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21574) ->
    #{item_id => 21574, name => lang:get("防御雕文（十）"),
      type => 0, intimacy => 0, order => 71, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21575) ->
    #{item_id => 21575, name => lang:get("生命雕文（十一）"),
      type => 0, intimacy => 0, order => 72, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21576) ->
    #{item_id => 21576, name => lang:get("物攻雕文（十一）"),
      type => 0, intimacy => 0, order => 73, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21577) ->
    #{item_id => 21577, name => lang:get("元素雕文（十一）"),
      type => 0, intimacy => 0, order => 74, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21578) ->
    #{item_id => 21578, name => lang:get("攻速雕文（十一）"),
      type => 0, intimacy => 0, order => 75, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21579) ->
    #{item_id => 21579, name => lang:get("防御雕文（十一）"),
      type => 0, intimacy => 0, order => 76, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21930) ->
    #{item_id => 21930, name => lang:get("11级魔攻雕文"),
      type => 0, intimacy => 0, order => 77, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21920) ->
    #{item_id => 21920, name => lang:get("11级魔抗雕文"),
      type => 0, intimacy => 0, order => 78, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21580) ->
    #{item_id => 21580, name => lang:get("12级生命雕文"),
      type => 0, intimacy => 0, order => 79, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21581) ->
    #{item_id => 21581, name => lang:get("12级攻击雕文"),
      type => 0, intimacy => 0, order => 80, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21582) ->
    #{item_id => 21582, name => lang:get("12级速度雕文"),
      type => 0, intimacy => 0, order => 81, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21583) ->
    #{item_id => 21583, name => lang:get("12级防御雕文"),
      type => 0, intimacy => 0, order => 82, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21950) ->
    #{item_id => 21950, name => lang:get("12级魔攻雕文"),
      type => 0, intimacy => 0, order => 83, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21951) ->
    #{item_id => 21951, name => lang:get("12级魔抗雕文"),
      type => 0, intimacy => 0, order => 84, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21952) ->
    #{item_id => 21952, name => lang:get("12级坚韧雕文"),
      type => 0, intimacy => 0, order => 85, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(23824) ->
    #{item_id => 23824, name => lang:get("狂暴晶石"), type => 0,
      intimacy => 0, order => 86, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23825) ->
    #{item_id => 23825, name => lang:get("元素晶石"), type => 0,
      intimacy => 0, order => 87, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23826) ->
    #{item_id => 23826, name => lang:get("迅敏晶石"), type => 0,
      intimacy => 0, order => 88, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23827) ->
    #{item_id => 23827, name => lang:get("掌控晶石"), type => 0,
      intimacy => 0, order => 89, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23828) ->
    #{item_id => 23828, name => lang:get("治愈晶石"), type => 0,
      intimacy => 0, order => 90, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23829) ->
    #{item_id => 23829, name => lang:get("圣光晶石"), type => 0,
      intimacy => 0, order => 91, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23835) ->
    #{item_id => 23835, name => lang:get("月光晶石"), type => 0,
      intimacy => 0, order => 92, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(29287) ->
    #{item_id => 29287, name => lang:get("好运鸟"), type => 0,
      intimacy => 0, order => 93, charged => 2000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29350) ->
    #{item_id => 29350, name => lang:get("呆萌兔"), type => 0,
      intimacy => 0, order => 94, charged => 1000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29351) ->
    #{item_id => 29351, name => lang:get("洒脱狐·永久"),
      type => 0, intimacy => 0, order => 95, charged => 1000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29384) ->
    #{item_id => 29384, name => lang:get("牛仔帽·永久"),
      type => 0, intimacy => 0, order => 96, charged => 1000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29438) ->
    #{item_id => 29438, name => lang:get("火焰飞羽·180天"),
      type => 0, intimacy => 0, order => 97, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29318) ->
    #{item_id => 29318, name => lang:get("浅夏花锦（男）"),
      type => 0, intimacy => 0, order => 98, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29319) ->
    #{item_id => 29319, name => lang:get("浅夏花锦（女）"),
      type => 0, intimacy => 0, order => 99, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29361) ->
    #{item_id => 29361, name => lang:get("幻奇猫帽·永久"),
      type => 0, intimacy => 0, order => 100, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29359) ->
    #{item_id => 29359, name => lang:get("小呆牛·永久"),
      type => 0, intimacy => 0, order => 101, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29199) ->
    #{item_id => 29199, name => lang:get("憨厚熊·永久"),
      type => 0, intimacy => 0, order => 102, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29369) ->
    #{item_id => 29369, name => lang:get("抱月白猫·永久"),
      type => 0, intimacy => 0, order => 103, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29370) ->
    #{item_id => 29370, name => lang:get("抱月黑猫·永久"),
      type => 0, intimacy => 0, order => 104, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29371) ->
    #{item_id => 29371, name => lang:get("寒宫小兔·永久"),
      type => 0, intimacy => 0, order => 105, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29161) ->
    #{item_id => 29161, name => lang:get("良辰美景·永久"),
      type => 0, intimacy => 0, order => 106, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23096) ->
    #{item_id => 23096, name => lang:get("68元钻石袋"),
      type => 0, intimacy => 0, order => 107, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23097) ->
    #{item_id => 23097, name => lang:get("138元钻石袋"),
      type => 0, intimacy => 0, order => 108, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23098) ->
    #{item_id => 23098, name => lang:get("388元钻石袋"),
      type => 0, intimacy => 0, order => 109, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29141) ->
    #{item_id => 29141, name => lang:get("甜蜜之吻"), type => 0,
      intimacy => 0, order => 110, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29142) ->
    #{item_id => 29142, name => lang:get("新婚喜糖"), type => 0,
      intimacy => 0, order => 111, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(21720) ->
    #{item_id => 21720, name => lang:get("8强幸运签"),
      type => 0, intimacy => 0, order => 112, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29171) ->
    #{item_id => 29171, name => lang:get("结拜·情义果"),
      type => 0, intimacy => 0, order => 113, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29424) ->
    #{item_id => 29424, name => lang:get("小章鱼·180天"),
      type => 0, intimacy => 0, order => 114, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29271) ->
    #{item_id => 29271, name => lang:get("夏之花·永久"),
      type => 0, intimacy => 0, order => 115, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29272) ->
    #{item_id => 29272, name => lang:get("酷炫眼镜·永久"),
      type => 0, intimacy => 0, order => 116, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29273) ->
    #{item_id => 29273, name => lang:get("萌小喵·永久"),
      type => 0, intimacy => 0, order => 117, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29274) ->
    #{item_id => 29274, name => lang:get("小兔兔·永久"),
      type => 0, intimacy => 0, order => 118, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29275) ->
    #{item_id => 29275, name => lang:get("竹蜻蜓·永久"),
      type => 0, intimacy => 0, order => 119, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29279) ->
    #{item_id => 29279, name => lang:get("流氓兔·永久"),
      type => 0, intimacy => 0, order => 120, charged => 5000,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29405) ->
    #{item_id => 29405, name => lang:get("小章鱼·永久"),
      type => 0, intimacy => 0, order => 121, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(22593) ->
    #{item_id => 22593, name => lang:get("师徒情礼盒"),
      type => 0, intimacy => 0, order => 122, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 1, received_limit => 0};
get_present(29457) ->
    #{item_id => 29457, name => lang:get("少女心思·永久"),
      type => 0, intimacy => 0, order => 123, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29458) ->
    #{item_id => 29458, name => lang:get("神探披风·永久"),
      type => 0, intimacy => 0, order => 124, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29460) ->
    #{item_id => 29460, name => lang:get("星梦小羊·永久"),
      type => 0, intimacy => 0, order => 125, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29558) ->
    #{item_id => 29558, name => lang:get("碧水蓝心·永久"),
      type => 0, intimacy => 0, order => 126, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29559) ->
    #{item_id => 29559, name => lang:get("碧水蓝心·永久"),
      type => 0, intimacy => 0, order => 127, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(22594) ->
    #{item_id => 22594, name => lang:get("炫彩礼盒"), type => 0,
      intimacy => 0, order => 128, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29326) ->
    #{item_id => 29326, name => lang:get("月亮结晶"), type => 0,
      intimacy => 0, order => 129, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(21322) ->
    #{item_id => 21322, name => lang:get("神兽百幻果"),
      type => 0, intimacy => 0, order => 130, charged => 1000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21316) ->
    #{item_id => 21316, name => lang:get("剑灵幻化果"),
      type => 0, intimacy => 0, order => 131, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21317) ->
    #{item_id => 21317, name => lang:get("石头人幻化果"),
      type => 0, intimacy => 0, order => 132, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21318) ->
    #{item_id => 21318, name => lang:get("雷暴幻化果"),
      type => 0, intimacy => 0, order => 133, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21319) ->
    #{item_id => 21319, name => lang:get("血伯爵幻化果"),
      type => 0, intimacy => 0, order => 134, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21320) ->
    #{item_id => 21320, name => lang:get("雷霆战神幻化果"),
      type => 0, intimacy => 0, order => 135, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21321) ->
    #{item_id => 21321, name => lang:get("女神幻化果"),
      type => 0, intimacy => 0, order => 136, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21364) ->
    #{item_id => 21364, name => lang:get("南瓜精灵幻化"),
      type => 0, intimacy => 0, order => 137, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21365) ->
    #{item_id => 21365, name => lang:get("南瓜恶魔幻化"),
      type => 0, intimacy => 0, order => 138, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23711) ->
    #{item_id => 23711, name => lang:get("狂暴徽章"), type => 0,
      intimacy => 0, order => 139, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23712) ->
    #{item_id => 23712, name => lang:get("元素徽章"), type => 0,
      intimacy => 0, order => 140, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23713) ->
    #{item_id => 23713, name => lang:get("迅敏徽章"), type => 0,
      intimacy => 0, order => 141, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23714) ->
    #{item_id => 23714, name => lang:get("掌控徽章"), type => 0,
      intimacy => 0, order => 142, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23715) ->
    #{item_id => 23715, name => lang:get("治愈徽章"), type => 0,
      intimacy => 0, order => 143, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23731) ->
    #{item_id => 23731, name => lang:get("月光徽章"), type => 0,
      intimacy => 0, order => 144, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21133) ->
    #{item_id => 21133, name => lang:get("翼灵"), type => 0,
      intimacy => 0, order => 145, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21350) ->
    #{item_id => 21350, name => lang:get("云露幻化果"),
      type => 0, intimacy => 0, order => 146, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21351) ->
    #{item_id => 21351, name => lang:get("小浣熊幻化果"),
      type => 0, intimacy => 0, order => 147, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21352) ->
    #{item_id => 21352, name => lang:get("花莹幻化果"),
      type => 0, intimacy => 0, order => 148, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21353) ->
    #{item_id => 21353, name => lang:get("龙龟幻化果"),
      type => 0, intimacy => 0, order => 149, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21354) ->
    #{item_id => 21354, name => lang:get("小虎幻化果"),
      type => 0, intimacy => 0, order => 150, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21355) ->
    #{item_id => 21355, name => lang:get("树人幻化果"),
      type => 0, intimacy => 0, order => 151, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21356) ->
    #{item_id => 21356, name => lang:get("雪狐幻化果"),
      type => 0, intimacy => 0, order => 152, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21357) ->
    #{item_id => 21357, name => lang:get("犀牛幻化果"),
      type => 0, intimacy => 0, order => 153, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21358) ->
    #{item_id => 21358, name => lang:get("霜狼幻化果"),
      type => 0, intimacy => 0, order => 154, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21359) ->
    #{item_id => 21359, name => lang:get("巨人幻化果"),
      type => 0, intimacy => 0, order => 155, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21360) ->
    #{item_id => 21360, name => lang:get("炎魔幻化果"),
      type => 0, intimacy => 0, order => 156, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21361) ->
    #{item_id => 21361, name => lang:get("蝴蝶幻化果"),
      type => 0, intimacy => 0, order => 157, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21362) ->
    #{item_id => 21362, name => lang:get("死骑幻化果"),
      type => 0, intimacy => 0, order => 158, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21363) ->
    #{item_id => 21363, name => lang:get("剑客幻化果"),
      type => 0, intimacy => 0, order => 159, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21367) ->
    #{item_id => 21367, name => lang:get("龙魂猎人幻化果"),
      type => 0, intimacy => 0, order => 160, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21368) ->
    #{item_id => 21368, name => lang:get("石灵儿幻化果"),
      type => 0, intimacy => 0, order => 161, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21380) ->
    #{item_id => 21380, name => lang:get("菲雅幻化果"),
      type => 0, intimacy => 0, order => 162, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21381) ->
    #{item_id => 21381, name => lang:get("蓝雯幻化果"),
      type => 0, intimacy => 0, order => 163, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21382) ->
    #{item_id => 21382, name => lang:get("琴雅幻化果"),
      type => 0, intimacy => 0, order => 164, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21383) ->
    #{item_id => 21383, name => lang:get("凯恩幻化果"),
      type => 0, intimacy => 0, order => 165, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21384) ->
    #{item_id => 21384, name => lang:get("阿瑞斯幻化果"),
      type => 0, intimacy => 0, order => 166, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21385) ->
    #{item_id => 21385, name => lang:get("福波斯幻化果"),
      type => 0, intimacy => 0, order => 167, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21386) ->
    #{item_id => 21386, name => lang:get("露露幻化果"),
      type => 0, intimacy => 0, order => 168, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21387) ->
    #{item_id => 21387, name => lang:get("佛格瑞特幻化"),
      type => 0, intimacy => 0, order => 169, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21388) ->
    #{item_id => 21388, name => lang:get("姬幻化果"), type => 0,
      intimacy => 0, order => 170, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21389) ->
    #{item_id => 21389, name => lang:get("莉娜幻化果"),
      type => 0, intimacy => 0, order => 171, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21390) ->
    #{item_id => 21390, name => lang:get("无名幻化果"),
      type => 0, intimacy => 0, order => 172, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21391) ->
    #{item_id => 21391, name => lang:get("利贝尔幻化果"),
      type => 0, intimacy => 0, order => 173, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21392) ->
    #{item_id => 21392, name => lang:get("凯瑟琳幻化果"),
      type => 0, intimacy => 0, order => 174, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21366) ->
    #{item_id => 21366, name => lang:get("博学小猪幻化"),
      type => 0, intimacy => 0, order => 175, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(21400) ->
    #{item_id => 21400, name => lang:get("明月草"), type => 0,
      intimacy => 0, order => 176, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21401) ->
    #{item_id => 21401, name => lang:get("金月桂"), type => 0,
      intimacy => 0, order => 177, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21402) ->
    #{item_id => 21402, name => lang:get("幻光粉"), type => 0,
      intimacy => 0, order => 178, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21403) ->
    #{item_id => 21403, name => lang:get("珊瑚晨露"), type => 0,
      intimacy => 0, order => 179, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21404) ->
    #{item_id => 21404, name => lang:get("星辰露"), type => 0,
      intimacy => 0, order => 180, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21405) ->
    #{item_id => 21405, name => lang:get("月光泉"), type => 0,
      intimacy => 0, order => 181, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21406) ->
    #{item_id => 21406, name => lang:get("凤凰极光"), type => 0,
      intimacy => 0, order => 182, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21407) ->
    #{item_id => 21407, name => lang:get("神佑之泉"), type => 0,
      intimacy => 0, order => 183, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21408) ->
    #{item_id => 21408, name => lang:get("踏梦尘"), type => 0,
      intimacy => 0, order => 184, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20310) ->
    #{item_id => 20310, name => lang:get("40打造图"),
      type => 0, intimacy => 0, order => 185, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20311) ->
    #{item_id => 20311, name => lang:get("50打造图"),
      type => 0, intimacy => 0, order => 186, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20312) ->
    #{item_id => 20312, name => lang:get("60打造图"),
      type => 0, intimacy => 0, order => 187, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20313) ->
    #{item_id => 20313, name => lang:get("70打造图"),
      type => 0, intimacy => 0, order => 188, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20314) ->
    #{item_id => 20314, name => lang:get("80打造图"),
      type => 0, intimacy => 0, order => 189, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20320) ->
    #{item_id => 20320, name => lang:get("40裁缝图"),
      type => 0, intimacy => 0, order => 190, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20321) ->
    #{item_id => 20321, name => lang:get("50裁缝图"),
      type => 0, intimacy => 0, order => 191, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20322) ->
    #{item_id => 20322, name => lang:get("60裁缝图"),
      type => 0, intimacy => 0, order => 192, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20323) ->
    #{item_id => 20323, name => lang:get("70裁缝图"),
      type => 0, intimacy => 0, order => 193, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(20324) ->
    #{item_id => 20324, name => lang:get("80裁缝图"),
      type => 0, intimacy => 0, order => 194, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21521) ->
    #{item_id => 21521, name => lang:get("珊瑚饰盒"), type => 0,
      intimacy => 0, order => 195, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21522) ->
    #{item_id => 21522, name => lang:get("七彩织锦"), type => 0,
      intimacy => 0, order => 196, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21524) ->
    #{item_id => 21524, name => lang:get("精金怀表"), type => 0,
      intimacy => 0, order => 197, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21525) ->
    #{item_id => 21525, name => lang:get("水晶面具"), type => 0,
      intimacy => 0, order => 198, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21300) ->
    #{item_id => 21300, name => lang:get("樱桃果"), type => 0,
      intimacy => 0, order => 199, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21301) ->
    #{item_id => 21301, name => lang:get("开心果"), type => 0,
      intimacy => 0, order => 200, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21302) ->
    #{item_id => 21302, name => lang:get("海棠果"), type => 0,
      intimacy => 0, order => 201, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21303) ->
    #{item_id => 21303, name => lang:get("波波幻化果"),
      type => 0, intimacy => 0, order => 202, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21304) ->
    #{item_id => 21304, name => lang:get("百香圣果"), type => 0,
      intimacy => 0, order => 203, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21305) ->
    #{item_id => 21305, name => lang:get("精灵幻化果"),
      type => 0, intimacy => 0, order => 204, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21306) ->
    #{item_id => 21306, name => lang:get("水晶莲雾果"),
      type => 0, intimacy => 0, order => 205, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21307) ->
    #{item_id => 21307, name => lang:get("忍者幻化果"),
      type => 0, intimacy => 0, order => 206, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21308) ->
    #{item_id => 21308, name => lang:get("祝福果"), type => 0,
      intimacy => 0, order => 207, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21309) ->
    #{item_id => 21309, name => lang:get("人鱼幻化果"),
      type => 0, intimacy => 0, order => 208, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21311) ->
    #{item_id => 21311, name => lang:get("冰熊幻化果"),
      type => 0, intimacy => 0, order => 209, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21313) ->
    #{item_id => 21313, name => lang:get("螳螂幻化果"),
      type => 0, intimacy => 0, order => 210, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21314) ->
    #{item_id => 21314, name => lang:get("剑齿虎幻化果"),
      type => 0, intimacy => 0, order => 211, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21409) ->
    #{item_id => 21409, name => lang:get("精灵叶片"), type => 0,
      intimacy => 0, order => 212, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(70886) ->
    #{item_id => 70886, name => lang:get("奇异珍果"), type => 1,
      intimacy => 50, order => 213, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25030) ->
    #{item_id => 25030, name => lang:get("玫瑰花"), type => 1,
      intimacy => 0, order => 214, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25031) ->
    #{item_id => 25031, name => lang:get("蔷薇花"), type => 1,
      intimacy => 0, order => 215, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25032) ->
    #{item_id => 25032, name => lang:get("牡丹花"), type => 1,
      intimacy => 0, order => 216, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25033) ->
    #{item_id => 25033, name => lang:get("菊花"), type => 1,
      intimacy => 0, order => 217, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25034) ->
    #{item_id => 25034, name => lang:get("兰花"), type => 1,
      intimacy => 0, order => 218, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25035) ->
    #{item_id => 25035, name => lang:get("百合花"), type => 1,
      intimacy => 0, order => 219, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25036) ->
    #{item_id => 25036, name => lang:get("郁金香"), type => 1,
      intimacy => 0, order => 220, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25037) ->
    #{item_id => 25037, name => lang:get("康乃馨"), type => 1,
      intimacy => 0, order => 221, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(25038) ->
    #{item_id => 25038, name => lang:get("樱花"), type => 1,
      intimacy => 0, order => 222, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(20031) ->
    #{item_id => 20031, name => lang:get("一束玫瑰"), type => 1,
      intimacy => 99, order => 223, charged => 0,
      intimacy_limit => 0, rank_factor => 1, popularity => 99,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(20032) ->
    #{item_id => 20032, name => lang:get("999朵玫瑰"),
      type => 1, intimacy => 500, order => 224, charged => 0,
      intimacy_limit => 0, rank_factor => 3,
      popularity => 399, prac_exp => 300, relation => 0,
      received_limit => 0};
get_present(70933) ->
    #{item_id => 70933, name => lang:get("周年庆典福袋"),
      type => 1, intimacy => 200, order => 225, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23400) ->
    #{item_id => 23400, name => lang:get("幸福小熊"), type => 1,
      intimacy => 500, order => 226, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23225) ->
    #{item_id => 23225, name => lang:get("海誓山盟"), type => 1,
      intimacy => 500, order => 227, charged => 0,
      intimacy_limit => 0, rank_factor => 3,
      popularity => 399, prac_exp => 300, relation => 0,
      received_limit => 0};
get_present(23216) ->
    #{item_id => 23216, name => lang:get("浓情巧克力"),
      type => 1, intimacy => 500, order => 228, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29024) ->
    #{item_id => 29024, name => lang:get("雪人糖果"), type => 1,
      intimacy => 0, order => 229, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23021) ->
    #{item_id => 23021, name => lang:get("生辰蛋糕"), type => 1,
      intimacy => 500, order => 230, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(20042) ->
    #{item_id => 20042, name => lang:get("蝴蝶花"), type => 1,
      intimacy => 99, order => 231, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29051) ->
    #{item_id => 29051, name => lang:get("缤纷童年"), type => 1,
      intimacy => 500, order => 232, charged => 0,
      intimacy_limit => 0, rank_factor => 3,
      popularity => 399, prac_exp => 300, relation => 0,
      received_limit => 0};
get_present(29050) ->
    #{item_id => 29050, name => lang:get("变身糖果"), type => 1,
      intimacy => 0, order => 233, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29153) ->
    #{item_id => 29153, name => lang:get("柳绿桃红"), type => 1,
      intimacy => 500, order => 234, charged => 0,
      intimacy_limit => 0, rank_factor => 3,
      popularity => 399, prac_exp => 300, relation => 0,
      received_limit => 0};
get_present(29151) ->
    #{item_id => 29151, name => lang:get("奇异果实"), type => 1,
      intimacy => 0, order => 235, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(28699) ->
    #{item_id => 28699, name => lang:get("南瓜精灵碎片"),
      type => 0, intimacy => 0, order => 236, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(28700) ->
    #{item_id => 28700, name => lang:get("南瓜恶魔碎片"),
      type => 0, intimacy => 0, order => 237, charged => 0,
      intimacy_limit => 99, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(23220) ->
    #{item_id => 23220, name => lang:get("榛情礼盒"), type => 1,
      intimacy => 0, order => 238, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29527) ->
    #{item_id => 29527, name => lang:get("幸福仓鼠·永久"),
      type => 0, intimacy => 0, order => 239, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29459) ->
    #{item_id => 29459, name => lang:get("侦探鹿皮帽·永久"),
      type => 0, intimacy => 0, order => 240, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29560) ->
    #{item_id => 29560, name => lang:get("萌逗兔·永久"),
      type => 0, intimacy => 0, order => 241, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29561) ->
    #{item_id => 29561, name => lang:get("清灵兔坠"), type => 0,
      intimacy => 0, order => 242, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29562) ->
    #{item_id => 29562, name => lang:get("心灵伪装"), type => 0,
      intimacy => 0, order => 243, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29577) ->
    #{item_id => 29577, name => lang:get("森之精灵·永久"),
      type => 0, intimacy => 0, order => 244, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29578) ->
    #{item_id => 29578, name => lang:get("森之精灵·永久"),
      type => 0, intimacy => 0, order => 245, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29580) ->
    #{item_id => 29580, name => lang:get("暖春花蕊·永久"),
      type => 0, intimacy => 0, order => 246, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29581) ->
    #{item_id => 29581, name => lang:get("暖春绿叶·永久"),
      type => 0, intimacy => 0, order => 247, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29582) ->
    #{item_id => 29582, name => lang:get("暖春花蕊·7天"),
      type => 0, intimacy => 0, order => 248, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29583) ->
    #{item_id => 29583, name => lang:get("暖春绿叶·7天"),
      type => 0, intimacy => 0, order => 249, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29588) ->
    #{item_id => 29588, name => lang:get("爱心护士帽·永久"),
      type => 0, intimacy => 0, order => 250, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29589) ->
    #{item_id => 29589, name => lang:get("天鹅爵士帽·永久"),
      type => 0, intimacy => 0, order => 251, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29590) ->
    #{item_id => 29590, name => lang:get("天鹅之语·永久"),
      type => 0, intimacy => 0, order => 252, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29591) ->
    #{item_id => 29591, name => lang:get("天鹅之语·永久"),
      type => 0, intimacy => 0, order => 253, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29593) ->
    #{item_id => 29593, name => lang:get("小天鹅"), type => 0,
      intimacy => 0, order => 254, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29650) ->
    #{item_id => 29650, name => lang:get("小黄鸭"), type => 0,
      intimacy => 0, order => 255, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29651) ->
    #{item_id => 29651, name => lang:get("遮阳帽"), type => 0,
      intimacy => 0, order => 256, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29652) ->
    #{item_id => 29652, name => lang:get("沙滩风情·永久"),
      type => 0, intimacy => 0, order => 257, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29653) ->
    #{item_id => 29653, name => lang:get("沙滩风情·永久"),
      type => 0, intimacy => 0, order => 258, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23675) ->
    #{item_id => 23675, name => lang:get("七彩云朵"), type => 0,
      intimacy => 0, order => 259, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29668) ->
    #{item_id => 29668, name => lang:get("比翼鸟"), type => 0,
      intimacy => 0, order => 260, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29672) ->
    #{item_id => 29672, name => lang:get("云朵小呆"), type => 0,
      intimacy => 0, order => 261, charged => 2000,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(23661) ->
    #{item_id => 23661, name => lang:get("花语灵羊元神"),
      type => 0, intimacy => 0, order => 262, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23662) ->
    #{item_id => 23662, name => lang:get("逸仙灵羊元神"),
      type => 0, intimacy => 0, order => 263, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23663) ->
    #{item_id => 23663, name => lang:get("落日灵狐元神"),
      type => 0, intimacy => 0, order => 264, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23664) ->
    #{item_id => 23664, name => lang:get("紫勋战狐元神"),
      type => 0, intimacy => 0, order => 265, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23665) ->
    #{item_id => 23665, name => lang:get("黄金狮鹫元神"),
      type => 0, intimacy => 0, order => 266, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23666) ->
    #{item_id => 23666, name => lang:get("云踪狮鹫元神"),
      type => 0, intimacy => 0, order => 267, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23667) ->
    #{item_id => 23667, name => lang:get("游园灵象元神"),
      type => 0, intimacy => 0, order => 268, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23668) ->
    #{item_id => 23668, name => lang:get("赤莲巨象元神"),
      type => 0, intimacy => 0, order => 269, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23670) ->
    #{item_id => 23670, name => lang:get("金勾贝贝元神"),
      type => 0, intimacy => 0, order => 270, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23671) ->
    #{item_id => 23671, name => lang:get("清幽花语元神"),
      type => 0, intimacy => 0, order => 271, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23674) ->
    #{item_id => 23674, name => lang:get("冰清月牙元神"),
      type => 0, intimacy => 0, order => 272, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29698) ->
    #{item_id => 29698, name => lang:get("幻影帕莎·永久"),
      type => 0, intimacy => 0, order => 273, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29800) ->
    #{item_id => 29800, name => lang:get("幻影公爵·永久"),
      type => 0, intimacy => 0, order => 274, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29803) ->
    #{item_id => 29803, name => lang:get("假面舞会·永久"),
      type => 0, intimacy => 0, order => 275, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29806) ->
    #{item_id => 29806, name => lang:get("假面舞会·永久"),
      type => 0, intimacy => 0, order => 276, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29809) ->
    #{item_id => 29809, name => lang:get("梦幻贵族·永久"),
      type => 0, intimacy => 0, order => 277, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(21931) ->
    #{item_id => 21931, name => lang:get("1级坚韧雕文"),
      type => 0, intimacy => 0, order => 278, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21932) ->
    #{item_id => 21932, name => lang:get("2级坚韧雕文"),
      type => 0, intimacy => 0, order => 279, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21933) ->
    #{item_id => 21933, name => lang:get("3级坚韧雕文"),
      type => 0, intimacy => 0, order => 280, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21934) ->
    #{item_id => 21934, name => lang:get("4级坚韧雕文"),
      type => 0, intimacy => 0, order => 281, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21935) ->
    #{item_id => 21935, name => lang:get("5级坚韧雕文"),
      type => 0, intimacy => 0, order => 282, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21936) ->
    #{item_id => 21936, name => lang:get("6级坚韧雕文"),
      type => 0, intimacy => 0, order => 283, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21937) ->
    #{item_id => 21937, name => lang:get("7级坚韧雕文"),
      type => 0, intimacy => 0, order => 284, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21938) ->
    #{item_id => 21938, name => lang:get("8级坚韧雕文"),
      type => 0, intimacy => 0, order => 285, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21939) ->
    #{item_id => 21939, name => lang:get("9级坚韧雕文"),
      type => 0, intimacy => 0, order => 286, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21940) ->
    #{item_id => 21940, name => lang:get("10级坚韧雕文"),
      type => 0, intimacy => 0, order => 287, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(21941) ->
    #{item_id => 21941, name => lang:get("11级坚韧雕文"),
      type => 0, intimacy => 0, order => 288, charged => 0,
      intimacy_limit => 10, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 1};
get_present(29825) ->
    #{item_id => 29825, name => lang:get("冬日恋歌·永久"),
      type => 0, intimacy => 0, order => 289, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29828) ->
    #{item_id => 29828, name => lang:get("冬日恋歌·永久"),
      type => 0, intimacy => 0, order => 290, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29831) ->
    #{item_id => 29831, name => lang:get("高雅乐颂·永久"),
      type => 0, intimacy => 0, order => 291, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29834) ->
    #{item_id => 29834, name => lang:get("高雅乐颂·永久"),
      type => 0, intimacy => 0, order => 292, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29837) ->
    #{item_id => 29837, name => lang:get("王族之心·永久"),
      type => 0, intimacy => 0, order => 293, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29840) ->
    #{item_id => 29840, name => lang:get("文艺小旺·永久"),
      type => 0, intimacy => 0, order => 294, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29815) ->
    #{item_id => 29815, name => lang:get("卷纸"), type => 0,
      intimacy => 0, order => 295, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29816) ->
    #{item_id => 29816, name => lang:get("护手霜"), type => 0,
      intimacy => 0, order => 296, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29817) ->
    #{item_id => 29817, name => lang:get("防晒镜"), type => 0,
      intimacy => 0, order => 297, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29818) ->
    #{item_id => 29818, name => lang:get("美味小骨"), type => 0,
      intimacy => 0, order => 298, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70605) ->
    #{item_id => 70605, name => lang:get("金猪兜兜"), type => 0,
      intimacy => 0, order => 299, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(26003) ->
    #{item_id => 26003, name => lang:get("喜气盈门·永久"),
      type => 0, intimacy => 0, order => 300, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(26006) ->
    #{item_id => 26006, name => lang:get("喜气盈门·永久"),
      type => 0, intimacy => 0, order => 301, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(26009) ->
    #{item_id => 26009, name => lang:get("旺事顺心·永久"),
      type => 0, intimacy => 0, order => 302, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(26012) ->
    #{item_id => 26012, name => lang:get("声声贺岁·永久"),
      type => 0, intimacy => 0, order => 303, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29489) ->
    #{item_id => 29489, name => lang:get("粉色萌兔·永久"),
      type => 0, intimacy => 0, order => 304, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29490) ->
    #{item_id => 29490, name => lang:get("暖熊幻想·永久"),
      type => 0, intimacy => 0, order => 305, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29857) ->
    #{item_id => 29857, name => lang:get("暖绒熊宝·永久"),
      type => 0, intimacy => 0, order => 306, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29860) ->
    #{item_id => 29860, name => lang:get("暖绒熊宝·永久"),
      type => 0, intimacy => 0, order => 307, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29863) ->
    #{item_id => 29863, name => lang:get("呆萌小熊·永久"),
      type => 0, intimacy => 0, order => 308, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29866) ->
    #{item_id => 29866, name => lang:get("呆萌小熊·永久"),
      type => 0, intimacy => 0, order => 309, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29869) ->
    #{item_id => 29869, name => lang:get("小企鹅·永久"),
      type => 0, intimacy => 0, order => 310, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29878) ->
    #{item_id => 29878, name => lang:get("甜橘棒棒糖·永久"),
      type => 0, intimacy => 0, order => 311, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29872) ->
    #{item_id => 29872, name => lang:get("心心眼镜·永久"),
      type => 0, intimacy => 0, order => 312, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29875) ->
    #{item_id => 29875, name => lang:get("心心眼镜·永久"),
      type => 0, intimacy => 0, order => 313, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29902) ->
    #{item_id => 29902, name => lang:get("冰雪奇缘·永久"),
      type => 0, intimacy => 0, order => 314, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29905) ->
    #{item_id => 29905, name => lang:get("冰雪奇缘·永久"),
      type => 0, intimacy => 0, order => 315, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29908) ->
    #{item_id => 29908, name => lang:get("雪白贝蕾·永久"),
      type => 0, intimacy => 0, order => 316, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29914) ->
    #{item_id => 29914, name => lang:get("缤纷冬日·永久"),
      type => 0, intimacy => 0, order => 317, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29893) ->
    #{item_id => 29893, name => lang:get("圣诞酷帽·永久"),
      type => 0, intimacy => 0, order => 318, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29896) ->
    #{item_id => 29896, name => lang:get("圣诞酷帽·永久"),
      type => 0, intimacy => 0, order => 319, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29899) ->
    #{item_id => 29899, name => lang:get("麋鹿小宝·永久"),
      type => 0, intimacy => 0, order => 320, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29681) ->
    #{item_id => 29681, name => lang:get("黑白萌宝·永久"),
      type => 0, intimacy => 0, order => 321, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29684) ->
    #{item_id => 29684, name => lang:get("黑白萌宝·永久"),
      type => 0, intimacy => 0, order => 322, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29934) ->
    #{item_id => 29934, name => lang:get("乖巧小喵·永久"),
      type => 0, intimacy => 0, order => 323, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29937) ->
    #{item_id => 29937, name => lang:get("萌逗喵喵·永久"),
      type => 0, intimacy => 0, order => 324, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29544) ->
    #{item_id => 29544, name => lang:get("森灵公主·永久"),
      type => 0, intimacy => 0, order => 325, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29545) ->
    #{item_id => 29545, name => lang:get("森灵王子·永久"),
      type => 0, intimacy => 0, order => 326, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29399) ->
    #{item_id => 29399, name => lang:get("星空幻想·永久"),
      type => 0, intimacy => 0, order => 327, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29400) ->
    #{item_id => 29400, name => lang:get("星空幻想·永久"),
      type => 0, intimacy => 0, order => 328, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29433) ->
    #{item_id => 29433, name => lang:get("炽热蔷薇·永久"),
      type => 0, intimacy => 0, order => 329, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29449) ->
    #{item_id => 29449, name => lang:get("狼爵绅士·永久"),
      type => 0, intimacy => 0, order => 330, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29552) ->
    #{item_id => 29552, name => lang:get("青葱岁月·永久"),
      type => 0, intimacy => 0, order => 331, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29553) ->
    #{item_id => 29553, name => lang:get("青葱岁月·永久"),
      type => 0, intimacy => 0, order => 332, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29352) ->
    #{item_id => 29352, name => lang:get("潇洒青春·永久"),
      type => 0, intimacy => 0, order => 333, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29353) ->
    #{item_id => 29353, name => lang:get("潇洒青春·永久"),
      type => 0, intimacy => 0, order => 334, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29467) ->
    #{item_id => 29467, name => lang:get("苍蓝披风·永久"),
      type => 0, intimacy => 0, order => 335, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29357) ->
    #{item_id => 29357, name => lang:get("萌萌喵娘·永久"),
      type => 0, intimacy => 0, order => 336, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29358) ->
    #{item_id => 29358, name => lang:get("呆呆喵仔·永久"),
      type => 0, intimacy => 0, order => 337, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29280) ->
    #{item_id => 29280, name => lang:get("竹蜻蜓"), type => 0,
      intimacy => 0, order => 338, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29281) ->
    #{item_id => 29281, name => lang:get("粉色回忆"), type => 0,
      intimacy => 0, order => 339, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29282) ->
    #{item_id => 29282, name => lang:get("蓝色梦境"), type => 0,
      intimacy => 0, order => 340, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29284) ->
    #{item_id => 29284, name => lang:get("流氓兔"), type => 0,
      intimacy => 0, order => 341, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29286) ->
    #{item_id => 29286, name => lang:get("小恶魔·永久"),
      type => 0, intimacy => 0, order => 342, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29404) ->
    #{item_id => 29404, name => lang:get("球球猫·永久"),
      type => 0, intimacy => 0, order => 343, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29402) ->
    #{item_id => 29402, name => lang:get("幻梦蓝蝶·永久"),
      type => 0, intimacy => 0, order => 344, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29403) ->
    #{item_id => 29403, name => lang:get("时空兔耳帽·永久"),
      type => 0, intimacy => 0, order => 345, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29468) ->
    #{item_id => 29468, name => lang:get("星羽绒帽·永久"),
      type => 0, intimacy => 0, order => 346, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29554) ->
    #{item_id => 29554, name => lang:get("青春记忆·永久"),
      type => 0, intimacy => 0, order => 347, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29555) ->
    #{item_id => 29555, name => lang:get("朝气蓬勃·永久"),
      type => 0, intimacy => 0, order => 348, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29556) ->
    #{item_id => 29556, name => lang:get("美丽青春·永久"),
      type => 0, intimacy => 0, order => 349, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29557) ->
    #{item_id => 29557, name => lang:get("热血青春·永久"),
      type => 0, intimacy => 0, order => 350, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29575) ->
    #{item_id => 29575, name => lang:get("爱抱抱·永久"),
      type => 0, intimacy => 0, order => 351, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29585) ->
    #{item_id => 29585, name => lang:get("月光精灵"), type => 0,
      intimacy => 0, order => 352, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29598) ->
    #{item_id => 29598, name => lang:get("小螃蟹·永久"),
      type => 0, intimacy => 0, order => 353, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29599) ->
    #{item_id => 29599, name => lang:get("晴天娃娃"), type => 0,
      intimacy => 0, order => 354, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29946) ->
    #{item_id => 29946, name => lang:get("神犬小哈·永久"),
      type => 0, intimacy => 0, order => 355, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29949) ->
    #{item_id => 29949, name => lang:get("神犬奇兵·永久"),
      type => 0, intimacy => 0, order => 356, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29540) ->
    #{item_id => 29540, name => lang:get("春意暖暖·永久"),
      type => 0, intimacy => 0, order => 357, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29541) ->
    #{item_id => 29541, name => lang:get("绿意盎然·永久"),
      type => 0, intimacy => 0, order => 358, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29579) ->
    #{item_id => 29579, name => lang:get("暖春精灵·永久"),
      type => 0, intimacy => 0, order => 359, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29967) ->
    #{item_id => 29967, name => lang:get("春联"), type => 0,
      intimacy => 0, order => 360, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29968) ->
    #{item_id => 29968, name => lang:get("福字联"), type => 0,
      intimacy => 0, order => 361, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29969) ->
    #{item_id => 29969, name => lang:get("喜庆鞭炮"), type => 0,
      intimacy => 0, order => 362, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29971) ->
    #{item_id => 29971, name => lang:get("吉祥如意结"),
      type => 0, intimacy => 0, order => 363, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29994) ->
    #{item_id => 29994, name => lang:get("百花仙子·永久"),
      type => 0, intimacy => 0, order => 364, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29997) ->
    #{item_id => 29997, name => lang:get("阳光暖男·永久"),
      type => 0, intimacy => 0, order => 365, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70006) ->
    #{item_id => 70006, name => lang:get("春暖花开·永久"),
      type => 0, intimacy => 0, order => 366, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70009) ->
    #{item_id => 70009, name => lang:get("春暖鸟鸣·永久"),
      type => 0, intimacy => 0, order => 367, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70012) ->
    #{item_id => 70012, name => lang:get("小蜜蜂·永久"),
      type => 0, intimacy => 0, order => 368, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(23735) ->
    #{item_id => 23735, name => lang:get("圣光徽章"), type => 0,
      intimacy => 0, order => 369, charged => 0,
      intimacy_limit => 100, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 1};
get_present(23286) ->
    #{item_id => 23286, name => lang:get("星辰阅历"), type => 1,
      intimacy => 0, order => 370, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 1, received_limit => 0};
get_present(23288) ->
    #{item_id => 23288, name => lang:get("星辰见闻"), type => 1,
      intimacy => 0, order => 371, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 100, relation => 2, received_limit => 0};
get_present(29201) ->
    #{item_id => 29201, name => lang:get("夏之花"), type => 0,
      intimacy => 0, order => 372, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29202) ->
    #{item_id => 29202, name => lang:get("酷炫眼镜"), type => 0,
      intimacy => 0, order => 373, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29481) ->
    #{item_id => 29481, name => lang:get("花样年华·永久"),
      type => 0, intimacy => 0, order => 374, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29482) ->
    #{item_id => 29482, name => lang:get("花样年华·永久"),
      type => 0, intimacy => 0, order => 375, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70057) ->
    #{item_id => 70057, name => lang:get("粉樱风车"), type => 0,
      intimacy => 0, order => 376, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70064) ->
    #{item_id => 70064, name => lang:get("柳枝"), type => 0,
      intimacy => 0, order => 377, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70065) ->
    #{item_id => 70065, name => lang:get("桃花糕"), type => 0,
      intimacy => 0, order => 378, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29687) ->
    #{item_id => 29687, name => lang:get("熊喵小乖·永久"),
      type => 0, intimacy => 0, order => 379, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29381) ->
    #{item_id => 29381, name => lang:get("性感牛仔·永久"),
      type => 0, intimacy => 0, order => 380, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29382) ->
    #{item_id => 29382, name => lang:get("西部牛仔·永久"),
      type => 0, intimacy => 0, order => 381, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70095) ->
    #{item_id => 70095, name => lang:get("因你而在·永久"),
      type => 0, intimacy => 0, order => 382, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70098) ->
    #{item_id => 70098, name => lang:get("因你而在·永久"),
      type => 0, intimacy => 0, order => 383, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29309) ->
    #{item_id => 29309, name => lang:get("小水枪"), type => 0,
      intimacy => 0, order => 384, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29317) ->
    #{item_id => 29317, name => lang:get("盛夏光年"), type => 0,
      intimacy => 0, order => 385, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29487) ->
    #{item_id => 29487, name => lang:get("清凉夏日·永久"),
      type => 0, intimacy => 0, order => 386, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29488) ->
    #{item_id => 29488, name => lang:get("清凉夏日·永久"),
      type => 0, intimacy => 0, order => 387, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29479) ->
    #{item_id => 29479, name => lang:get("五月端阳·永久"),
      type => 0, intimacy => 0, order => 388, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29480) ->
    #{item_id => 29480, name => lang:get("五月端阳·永久"),
      type => 0, intimacy => 0, order => 389, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29483) ->
    #{item_id => 29483, name => lang:get("白色礼服·永久"),
      type => 0, intimacy => 0, order => 390, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29484) ->
    #{item_id => 29484, name => lang:get("白色礼服·永久"),
      type => 0, intimacy => 0, order => 391, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29485) ->
    #{item_id => 29485, name => lang:get("贵族礼服·永久"),
      type => 0, intimacy => 0, order => 392, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29486) ->
    #{item_id => 29486, name => lang:get("贵族礼服·永久"),
      type => 0, intimacy => 0, order => 393, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29443) ->
    #{item_id => 29443, name => lang:get("冰雪圣诞·永久"),
      type => 0, intimacy => 0, order => 394, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29444) ->
    #{item_id => 29444, name => lang:get("冰雪圣诞·永久"),
      type => 0, intimacy => 0, order => 395, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29434) ->
    #{item_id => 29434, name => lang:get("炽热蔷薇·永久"),
      type => 0, intimacy => 0, order => 396, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29367) ->
    #{item_id => 29367, name => lang:get("月白风清·永久"),
      type => 0, intimacy => 0, order => 397, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29368) ->
    #{item_id => 29368, name => lang:get("月白风清·永久"),
      type => 0, intimacy => 0, order => 398, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29518) ->
    #{item_id => 29518, name => lang:get("冥日魅影·永久"),
      type => 0, intimacy => 0, order => 399, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29519) ->
    #{item_id => 29519, name => lang:get("黑暗之裔·永久"),
      type => 0, intimacy => 0, order => 400, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29666) ->
    #{item_id => 29666, name => lang:get("机甲小宝"), type => 0,
      intimacy => 0, order => 401, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29469) ->
    #{item_id => 29469, name => lang:get("萌蛋儿·永久"),
      type => 0, intimacy => 0, order => 402, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70101) ->
    #{item_id => 70101, name => lang:get("红粉菲菲·永久"),
      type => 0, intimacy => 0, order => 403, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70104) ->
    #{item_id => 70104, name => lang:get("爵士礼帽·永久"),
      type => 0, intimacy => 0, order => 404, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70107) ->
    #{item_id => 70107, name => lang:get("萌新紫鲸·永久"),
      type => 0, intimacy => 0, order => 405, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70139) ->
    #{item_id => 70139, name => lang:get("海洋之星"), type => 0,
      intimacy => 0, order => 406, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29676) ->
    #{item_id => 29676, name => lang:get("悠扬乐章"), type => 0,
      intimacy => 0, order => 407, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29677) ->
    #{item_id => 29677, name => lang:get("悠扬乐章"), type => 0,
      intimacy => 0, order => 408, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29678) ->
    #{item_id => 29678, name => lang:get("小提琴"), type => 0,
      intimacy => 0, order => 409, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29679) ->
    #{item_id => 29679, name => lang:get("音符礼帽"), type => 0,
      intimacy => 0, order => 410, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29680) ->
    #{item_id => 29680, name => lang:get("音符礼帽"), type => 0,
      intimacy => 0, order => 411, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70196) ->
    #{item_id => 70196, name => lang:get("粉嫩兔兔·永久"),
      type => 0, intimacy => 0, order => 412, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70199) ->
    #{item_id => 70199, name => lang:get("呆萌小猴·永久"),
      type => 0, intimacy => 0, order => 413, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70202) ->
    #{item_id => 70202, name => lang:get("小可爱·永久"),
      type => 0, intimacy => 0, order => 414, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70205) ->
    #{item_id => 70205, name => lang:get("七星瓢虫·永久"),
      type => 0, intimacy => 0, order => 415, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70181) ->
    #{item_id => 70181, name => lang:get("西瓜种子"), type => 0,
      intimacy => 0, order => 416, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70182) ->
    #{item_id => 70182, name => lang:get("苹果种子"), type => 0,
      intimacy => 0, order => 417, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70183) ->
    #{item_id => 70183, name => lang:get("香瓜种子"), type => 0,
      intimacy => 0, order => 418, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70184) ->
    #{item_id => 70184, name => lang:get("蜜桃种子"), type => 0,
      intimacy => 0, order => 419, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70185) ->
    #{item_id => 70185, name => lang:get("杨桃种子"), type => 0,
      intimacy => 0, order => 420, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70186) ->
    #{item_id => 70186, name => lang:get("荔枝种子"), type => 0,
      intimacy => 0, order => 421, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70187) ->
    #{item_id => 70187, name => lang:get("芒果种子"), type => 0,
      intimacy => 0, order => 422, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70188) ->
    #{item_id => 70188, name => lang:get("香橙种子"), type => 0,
      intimacy => 0, order => 423, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70189) ->
    #{item_id => 70189, name => lang:get("夏日种子"), type => 0,
      intimacy => 0, order => 424, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(29915) ->
    #{item_id => 29915, name => lang:get("冰灵雪花"), type => 0,
      intimacy => 0, order => 425, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29448) ->
    #{item_id => 29448, name => lang:get("狐狸公主·永久"),
      type => 0, intimacy => 0, order => 426, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70248) ->
    #{item_id => 70248, name => lang:get("缤纷夏日·永久"),
      type => 0, intimacy => 0, order => 427, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70251) ->
    #{item_id => 70251, name => lang:get("缤纷夏日·永久"),
      type => 0, intimacy => 0, order => 428, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70257) ->
    #{item_id => 70257, name => lang:get("潜水镜·永久"),
      type => 0, intimacy => 0, order => 429, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70260) ->
    #{item_id => 70260, name => lang:get("甜蜜芭菲·永久"),
      type => 0, intimacy => 0, order => 430, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70238) ->
    #{item_id => 70238, name => lang:get("小太阳"), type => 0,
      intimacy => 0, order => 431, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70254) ->
    #{item_id => 70254, name => lang:get("沙滩帽·永久"),
      type => 0, intimacy => 0, order => 432, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70293) ->
    #{item_id => 70293, name => lang:get("浓情蜜意·永久"),
      type => 0, intimacy => 0, order => 433, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70297) ->
    #{item_id => 70297, name => lang:get("浓情蜜意·永久"),
      type => 0, intimacy => 0, order => 434, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70301) ->
    #{item_id => 70301, name => lang:get("幻梦粉蝶·永久"),
      type => 0, intimacy => 0, order => 435, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70309) ->
    #{item_id => 70309, name => lang:get("爱心小熊·永久"),
      type => 0, intimacy => 0, order => 436, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70305) ->
    #{item_id => 70305, name => lang:get("丘比之心·永久"),
      type => 0, intimacy => 0, order => 437, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70352) ->
    #{item_id => 70352, name => lang:get("幻月兔"), type => 0,
      intimacy => 0, order => 438, charged => 2000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29276) ->
    #{item_id => 29276, name => lang:get("粉色回忆·永久"),
      type => 0, intimacy => 0, order => 439, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29277) ->
    #{item_id => 29277, name => lang:get("蓝色梦境·永久"),
      type => 0, intimacy => 0, order => 440, charged => 2000,
      intimacy_limit => 1000, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70334) ->
    #{item_id => 70334, name => lang:get("和风物语·永久"),
      type => 0, intimacy => 0, order => 441, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70338) ->
    #{item_id => 70338, name => lang:get("和风物语·永久"),
      type => 0, intimacy => 0, order => 442, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70342) ->
    #{item_id => 70342, name => lang:get("美艳舞姬·永久"),
      type => 0, intimacy => 0, order => 443, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70346) ->
    #{item_id => 70346, name => lang:get("稻荷面具·永久"),
      type => 0, intimacy => 0, order => 444, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70350) ->
    #{item_id => 70350, name => lang:get("小梦娃娃·永久"),
      type => 0, intimacy => 0, order => 445, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70363) ->
    #{item_id => 70363, name => lang:get("冷傲警帽·永久"),
      type => 0, intimacy => 0, order => 446, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29523) ->
    #{item_id => 29523, name => lang:get("正义使者·永久"),
      type => 0, intimacy => 0, order => 447, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29547) ->
    #{item_id => 29547, name => lang:get("橙色猫头鹰·永久"),
      type => 0, intimacy => 0, order => 448, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70422) ->
    #{item_id => 70422, name => lang:get("精灵魔女·永久"),
      type => 0, intimacy => 0, order => 449, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70426) ->
    #{item_id => 70426, name => lang:get("捣蛋大王·永久"),
      type => 0, intimacy => 0, order => 450, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70430) ->
    #{item_id => 70430, name => lang:get("神奇魔法帽·永久"),
      type => 0, intimacy => 0, order => 451, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70434) ->
    #{item_id => 70434, name => lang:get("神奇魔法帽·永久"),
      type => 0, intimacy => 0, order => 452, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70438) ->
    #{item_id => 70438, name => lang:get("魔法扫帚·永久"),
      type => 0, intimacy => 0, order => 453, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70408) ->
    #{item_id => 70408, name => lang:get("铃铛叮铃"), type => 0,
      intimacy => 0, order => 454, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70409) ->
    #{item_id => 70409, name => lang:get("柳枝"), type => 0,
      intimacy => 0, order => 455, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70410) ->
    #{item_id => 70410, name => lang:get("桃花糕"), type => 0,
      intimacy => 0, order => 456, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70459) ->
    #{item_id => 70459, name => lang:get("企鹅萌宝·永久"),
      type => 0, intimacy => 0, order => 457, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70463) ->
    #{item_id => 70463, name => lang:get("企鹅萌宝·永久"),
      type => 0, intimacy => 0, order => 458, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70467) ->
    #{item_id => 70467, name => lang:get("企鹅头套·永久"),
      type => 0, intimacy => 0, order => 459, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70471) ->
    #{item_id => 70471, name => lang:get("企鹅头套·永久"),
      type => 0, intimacy => 0, order => 460, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70475) ->
    #{item_id => 70475, name => lang:get("玩偶灵钥·永久"),
      type => 0, intimacy => 0, order => 461, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70491) ->
    #{item_id => 70491, name => lang:get("肉馅"), type => 0,
      intimacy => 0, order => 462, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70492) ->
    #{item_id => 70492, name => lang:get("面粉"), type => 0,
      intimacy => 0, order => 463, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70516) ->
    #{item_id => 70516, name => lang:get("缤纷圣诞·永久"),
      type => 0, intimacy => 0, order => 464, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70520) ->
    #{item_id => 70520, name => lang:get("缤纷圣诞·永久"),
      type => 0, intimacy => 0, order => 465, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70524) ->
    #{item_id => 70524, name => lang:get("雪人发带·永久"),
      type => 0, intimacy => 0, order => 466, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70528) ->
    #{item_id => 70528, name => lang:get("可爱麋鹿·永久"),
      type => 0, intimacy => 0, order => 467, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70532) ->
    #{item_id => 70532, name => lang:get("圣诞小Q·永久"),
      type => 0, intimacy => 0, order => 468, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29452) ->
    #{item_id => 29452, name => lang:get("金鱼送福·永久"),
      type => 0, intimacy => 0, order => 469, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70609) ->
    #{item_id => 70609, name => lang:get("春联"), type => 0,
      intimacy => 0, order => 470, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70610) ->
    #{item_id => 70610, name => lang:get("福字联"), type => 0,
      intimacy => 0, order => 471, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70611) ->
    #{item_id => 70611, name => lang:get("喜庆鞭炮"), type => 0,
      intimacy => 0, order => 472, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(70588) ->
    #{item_id => 70588, name => lang:get("喜气洋洋·永久"),
      type => 0, intimacy => 0, order => 473, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70592) ->
    #{item_id => 70592, name => lang:get("喜气洋洋·永久"),
      type => 0, intimacy => 0, order => 474, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70596) ->
    #{item_id => 70596, name => lang:get("金猪送福·永久"),
      type => 0, intimacy => 0, order => 475, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70604) ->
    #{item_id => 70604, name => lang:get("萌猪兜兜·永久"),
      type => 0, intimacy => 0, order => 476, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70624) ->
    #{item_id => 70624, name => lang:get("金字"), type => 0,
      intimacy => 0, order => 477, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70625) ->
    #{item_id => 70625, name => lang:get("猪字"), type => 0,
      intimacy => 0, order => 478, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70626) ->
    #{item_id => 70626, name => lang:get("送字"), type => 0,
      intimacy => 0, order => 479, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70627) ->
    #{item_id => 70627, name => lang:get("福字"), type => 0,
      intimacy => 0, order => 480, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70628) ->
    #{item_id => 70628, name => lang:get("庆字"), type => 0,
      intimacy => 0, order => 481, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70629) ->
    #{item_id => 70629, name => lang:get("典字"), type => 0,
      intimacy => 0, order => 482, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29491) ->
    #{item_id => 29491, name => lang:get("萌兔发卡·永久"),
      type => 0, intimacy => 0, order => 483, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29586) ->
    #{item_id => 29586, name => lang:get("水月礼帽"), type => 0,
      intimacy => 0, order => 484, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29587) ->
    #{item_id => 29587, name => lang:get("水月灵冠"), type => 0,
      intimacy => 0, order => 485, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70656) ->
    #{item_id => 70656, name => lang:get("两小无猜·永久"),
      type => 0, intimacy => 0, order => 486, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70660) ->
    #{item_id => 70660, name => lang:get("两小无猜·永久"),
      type => 0, intimacy => 0, order => 487, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70664) ->
    #{item_id => 70664, name => lang:get("哈尼毛呢帽·永久"),
      type => 0, intimacy => 0, order => 488, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70668) ->
    #{item_id => 70668, name => lang:get("松鼠小宝·永久"),
      type => 0, intimacy => 0, order => 489, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70691) ->
    #{item_id => 70691, name => lang:get("柳枝"), type => 0,
      intimacy => 0, order => 490, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70692) ->
    #{item_id => 70692, name => lang:get("桃花糕"), type => 0,
      intimacy => 0, order => 491, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70718) ->
    #{item_id => 70718, name => lang:get("春暖花开·永久"),
      type => 0, intimacy => 0, order => 492, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70722) ->
    #{item_id => 70722, name => lang:get("春暖花开·永久"),
      type => 0, intimacy => 0, order => 493, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70726) ->
    #{item_id => 70726, name => lang:get("百合仙子·永久"),
      type => 0, intimacy => 0, order => 494, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70730) ->
    #{item_id => 70730, name => lang:get("春光烂漫·永久"),
      type => 0, intimacy => 0, order => 495, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70734) ->
    #{item_id => 70734, name => lang:get("森之乐章·永久"),
      type => 0, intimacy => 0, order => 496, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70739) ->
    #{item_id => 70739, name => lang:get("烂漫花蕊"), type => 0,
      intimacy => 0, order => 497, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29406) ->
    #{item_id => 29406, name => lang:get("阿拉蕾帽·永久"),
      type => 0, intimacy => 0, order => 498, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70758) ->
    #{item_id => 70758, name => lang:get("未来使者·永久"),
      type => 0, intimacy => 0, order => 499, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70762) ->
    #{item_id => 70762, name => lang:get("未来使者·永久"),
      type => 0, intimacy => 0, order => 500, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70766) ->
    #{item_id => 70766, name => lang:get("神奇眼镜·永久"),
      type => 0, intimacy => 0, order => 501, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70770) ->
    #{item_id => 70770, name => lang:get("神奇眼镜·永久"),
      type => 0, intimacy => 0, order => 502, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70774) ->
    #{item_id => 70774, name => lang:get("智能小宝·永久"),
      type => 0, intimacy => 0, order => 503, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29466) ->
    #{item_id => 29466, name => lang:get("冰雪公主·永久"),
      type => 0, intimacy => 0, order => 504, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70832) ->
    #{item_id => 70832, name => lang:get("俏皮兔女郎·永久"),
      type => 0, intimacy => 0, order => 505, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70836) ->
    #{item_id => 70836, name => lang:get("俊俏魔术师·永久"),
      type => 0, intimacy => 0, order => 506, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70840) ->
    #{item_id => 70840, name => lang:get("时空魔法帽·永久"),
      type => 0, intimacy => 0, order => 507, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70844) ->
    #{item_id => 70844, name => lang:get("时空魔法帽·永久"),
      type => 0, intimacy => 0, order => 508, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70848) ->
    #{item_id => 70848, name => lang:get("小鸽鸽·永久"),
      type => 0, intimacy => 0, order => 509, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70902) ->
    #{item_id => 70902, name => lang:get("红桃小兵·永久"),
      type => 0, intimacy => 0, order => 510, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70906) ->
    #{item_id => 70906, name => lang:get("红桃小兵·永久"),
      type => 0, intimacy => 0, order => 511, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70910) ->
    #{item_id => 70910, name => lang:get("红桃士兵帽·永久"),
      type => 0, intimacy => 0, order => 512, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70914) ->
    #{item_id => 70914, name => lang:get("红桃士兵帽·永久"),
      type => 0, intimacy => 0, order => 513, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70918) ->
    #{item_id => 70918, name => lang:get("白兔先生·永久"),
      type => 0, intimacy => 0, order => 514, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70889) ->
    #{item_id => 70889, name => lang:get("红桃之心"), type => 0,
      intimacy => 0, order => 515, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70949) ->
    #{item_id => 70949, name => lang:get("棒球精英·永久"),
      type => 0, intimacy => 0, order => 516, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70953) ->
    #{item_id => 70953, name => lang:get("棒球精英·永久"),
      type => 0, intimacy => 0, order => 517, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70958) ->
    #{item_id => 70958, name => lang:get("小黄蜂·永久"),
      type => 0, intimacy => 0, order => 518, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70963) ->
    #{item_id => 70963, name => lang:get("青涩学园·永久"),
      type => 0, intimacy => 0, order => 519, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70967) ->
    #{item_id => 70967, name => lang:get("青涩学园·永久"),
      type => 0, intimacy => 0, order => 520, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71013) ->
    #{item_id => 71013, name => lang:get("七字"), type => 0,
      intimacy => 0, order => 521, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71014) ->
    #{item_id => 71014, name => lang:get("夕字"), type => 0,
      intimacy => 0, order => 522, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71015) ->
    #{item_id => 71015, name => lang:get("鹊字"), type => 0,
      intimacy => 0, order => 523, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71016) ->
    #{item_id => 71016, name => lang:get("桥字"), type => 0,
      intimacy => 0, order => 524, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71017) ->
    #{item_id => 71017, name => lang:get("相字"), type => 0,
      intimacy => 0, order => 525, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71018) ->
    #{item_id => 71018, name => lang:get("会字"), type => 0,
      intimacy => 0, order => 526, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70998) ->
    #{item_id => 70998, name => lang:get("肥料"), type => 0,
      intimacy => 0, order => 527, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70999) ->
    #{item_id => 70999, name => lang:get("水壶"), type => 0,
      intimacy => 0, order => 528, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71027) ->
    #{item_id => 71027, name => lang:get("梦幻甜甜圈"),
      type => 0, intimacy => 0, order => 529, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71033) ->
    #{item_id => 71033, name => lang:get("摇滚乐队·永久"),
      type => 0, intimacy => 0, order => 530, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71037) ->
    #{item_id => 71037, name => lang:get("摇滚乐队·永久"),
      type => 0, intimacy => 0, order => 531, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71041) ->
    #{item_id => 71041, name => lang:get("叛逆贝蕾·永久"),
      type => 0, intimacy => 0, order => 532, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71045) ->
    #{item_id => 71045, name => lang:get("酷帅眼镜·永久"),
      type => 0, intimacy => 0, order => 533, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71049) ->
    #{item_id => 71049, name => lang:get("酷炫贝斯·永久"),
      type => 0, intimacy => 0, order => 534, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71087) ->
    #{item_id => 71087, name => lang:get("你是我的眼·永久"),
      type => 0, intimacy => 0, order => 535, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71091) ->
    #{item_id => 71091, name => lang:get("萌宠背包·永久"),
      type => 0, intimacy => 0, order => 536, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71095) ->
    #{item_id => 71095, name => lang:get("如鱼得水·永久"),
      type => 0, intimacy => 0, order => 537, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71105) ->
    #{item_id => 71105, name => lang:get("娇俏厨娘·永久"),
      type => 0, intimacy => 0, order => 538, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71109) ->
    #{item_id => 71109, name => lang:get("潇洒大厨·永久"),
      type => 0, intimacy => 0, order => 539, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71113) ->
    #{item_id => 71113, name => lang:get("洁白厨师帽·永久"),
      type => 0, intimacy => 0, order => 540, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71117) ->
    #{item_id => 71117, name => lang:get("洁白厨师帽·永久"),
      type => 0, intimacy => 0, order => 541, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71121) ->
    #{item_id => 71121, name => lang:get("营养早餐·永久"),
      type => 0, intimacy => 0, order => 542, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71171) ->
    #{item_id => 71171, name => lang:get("圣夜公主·永久"),
      type => 0, intimacy => 0, order => 543, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71175) ->
    #{item_id => 71175, name => lang:get("圣夜王子·永久"),
      type => 0, intimacy => 0, order => 544, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71179) ->
    #{item_id => 71179, name => lang:get("蝙蝠之翼·永久"),
      type => 0, intimacy => 0, order => 545, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71183) ->
    #{item_id => 71183, name => lang:get("小蝙蝠·永久"),
      type => 0, intimacy => 0, order => 546, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71190) ->
    #{item_id => 71190, name => lang:get("肉馅"), type => 0,
      intimacy => 0, order => 547, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71191) ->
    #{item_id => 71191, name => lang:get("面粉"), type => 0,
      intimacy => 0, order => 548, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71167) ->
    #{item_id => 71167, name => lang:get("圣夜魔法球"),
      type => 0, intimacy => 0, order => 549, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71209) ->
    #{item_id => 71209, name => lang:get("雪国青衣·永久"),
      type => 0, intimacy => 0, order => 550, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71213) ->
    #{item_id => 71213, name => lang:get("雪国青衣·永久"),
      type => 0, intimacy => 0, order => 551, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71217) ->
    #{item_id => 71217, name => lang:get("雪人冬帽·永久"),
      type => 0, intimacy => 0, order => 552, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71221) ->
    #{item_id => 71221, name => lang:get("雪人冬帽·永久"),
      type => 0, intimacy => 0, order => 553, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71225) ->
    #{item_id => 71225, name => lang:get("软绵绵·永久"),
      type => 0, intimacy => 0, order => 554, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71249) ->
    #{item_id => 71249, name => lang:get("萌萌小包·永久"),
      type => 0, intimacy => 0, order => 555, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71253) ->
    #{item_id => 71253, name => lang:get("铃铛猫猫·永久"),
      type => 0, intimacy => 0, order => 556, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(29383) ->
    #{item_id => 29383, name => lang:get("炫动吉他·永久"),
      type => 0, intimacy => 0, order => 557, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71259) ->
    #{item_id => 71259, name => lang:get("肉馅"), type => 0,
      intimacy => 0, order => 558, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71260) ->
    #{item_id => 71260, name => lang:get("面粉"), type => 0,
      intimacy => 0, order => 559, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71291) ->
    #{item_id => 71291, name => lang:get("圣诞天使·永久"),
      type => 0, intimacy => 0, order => 560, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71295) ->
    #{item_id => 71295, name => lang:get("圣诞天使·永久"),
      type => 0, intimacy => 0, order => 561, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71299) ->
    #{item_id => 71299, name => lang:get("小鹿帽·永久"),
      type => 0, intimacy => 0, order => 562, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71303) ->
    #{item_id => 71303, name => lang:get("姜饼小人·永久"),
      type => 0, intimacy => 0, order => 563, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71318) ->
    #{item_id => 71318, name => lang:get("冰糖"), type => 0,
      intimacy => 0, order => 564, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71319) ->
    #{item_id => 71319, name => lang:get("香米"), type => 0,
      intimacy => 0, order => 565, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71285) ->
    #{item_id => 71285, name => lang:get("梦幻花圈"), type => 0,
      intimacy => 0, order => 566, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71315) ->
    #{item_id => 71315, name => lang:get("鸿运结·永久"),
      type => 0, intimacy => 0, order => 567, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71311) ->
    #{item_id => 71311, name => lang:get("皎洁兔纸·永久"),
      type => 0, intimacy => 0, order => 568, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71337) ->
    #{item_id => 71337, name => lang:get("春联"), type => 0,
      intimacy => 0, order => 569, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71338) ->
    #{item_id => 71338, name => lang:get("福字联"), type => 0,
      intimacy => 0, order => 570, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71339) ->
    #{item_id => 71339, name => lang:get("喜庆鞭炮"), type => 0,
      intimacy => 0, order => 571, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71348) ->
    #{item_id => 71348, name => lang:get("金童玉女·永久"),
      type => 0, intimacy => 0, order => 572, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71352) ->
    #{item_id => 71352, name => lang:get("金童玉女·永久"),
      type => 0, intimacy => 0, order => 573, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71356) ->
    #{item_id => 71356, name => lang:get("机灵小鼠·永久"),
      type => 0, intimacy => 0, order => 574, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71360) ->
    #{item_id => 71360, name => lang:get("机灵小鼠·永久"),
      type => 0, intimacy => 0, order => 575, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71364) ->
    #{item_id => 71364, name => lang:get("鼠来宝·永久"),
      type => 0, intimacy => 0, order => 576, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71386) ->
    #{item_id => 71386, name => lang:get("金字"), type => 0,
      intimacy => 0, order => 577, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71387) ->
    #{item_id => 71387, name => lang:get("鼠字"), type => 0,
      intimacy => 0, order => 578, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71388) ->
    #{item_id => 71388, name => lang:get("送字"), type => 0,
      intimacy => 0, order => 579, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71389) ->
    #{item_id => 71389, name => lang:get("福字"), type => 0,
      intimacy => 0, order => 580, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71390) ->
    #{item_id => 71390, name => lang:get("庆字"), type => 0,
      intimacy => 0, order => 581, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71391) ->
    #{item_id => 71391, name => lang:get("典字"), type => 0,
      intimacy => 0, order => 582, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71396) ->
    #{item_id => 71396, name => lang:get("糯米"), type => 0,
      intimacy => 0, order => 583, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71397) ->
    #{item_id => 71397, name => lang:get("冰糖"), type => 0,
      intimacy => 0, order => 584, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(70617) ->
    #{item_id => 70617, name => lang:get("新春福袋"), type => 1,
      intimacy => 200, order => 585, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(71422) ->
    #{item_id => 71422, name => lang:get("锦瑟年华·永久"),
      type => 0, intimacy => 0, order => 586, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71426) ->
    #{item_id => 71426, name => lang:get("锦瑟年华·永久"),
      type => 0, intimacy => 0, order => 587, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71430) ->
    #{item_id => 71430, name => lang:get("长个蘑菇·永久"),
      type => 0, intimacy => 0, order => 588, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71438) ->
    #{item_id => 71438, name => lang:get("锦上添花·永久"),
      type => 0, intimacy => 0, order => 589, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71439) ->
    #{item_id => 71439, name => lang:get("缤纷气球"), type => 0,
      intimacy => 0, order => 590, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71459) ->
    #{item_id => 71459, name => lang:get("觅心一箭·永久"),
      type => 0, intimacy => 0, order => 591, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71463) ->
    #{item_id => 71463, name => lang:get("桃花娃娃·永久"),
      type => 0, intimacy => 0, order => 592, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71474) ->
    #{item_id => 71474, name => lang:get("人面桃花·永久"),
      type => 0, intimacy => 0, order => 593, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71478) ->
    #{item_id => 71478, name => lang:get("人面桃花·永久"),
      type => 0, intimacy => 0, order => 594, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71482) ->
    #{item_id => 71482, name => lang:get("桃之木·永久"),
      type => 0, intimacy => 0, order => 595, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71486) ->
    #{item_id => 71486, name => lang:get("桃之花·永久"),
      type => 0, intimacy => 0, order => 596, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71490) ->
    #{item_id => 71490, name => lang:get("萌兔书包··永久"),
      type => 0, intimacy => 0, order => 597, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71569) ->
    #{item_id => 71569, name => lang:get("劳工工具箱"),
      type => 1, intimacy => 200, order => 598, charged => 0,
      intimacy_limit => 0, rank_factor => 0, popularity => 0,
      prac_exp => 0, relation => 0, received_limit => 0};
get_present(71549) ->
    #{item_id => 71549, name => lang:get("天人合一·永久"),
      type => 0, intimacy => 0, order => 599, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71553) ->
    #{item_id => 71553, name => lang:get("天人合一·永久"),
      type => 0, intimacy => 0, order => 600, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71557) ->
    #{item_id => 71557, name => lang:get("人之冕·永久"),
      type => 0, intimacy => 0, order => 601, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71565) ->
    #{item_id => 71565, name => lang:get("天之晷·永久"),
      type => 0, intimacy => 0, order => 602, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(71566) ->
    #{item_id => 71566, name => lang:get("青云雀羽"), type => 0,
      intimacy => 0, order => 603, charged => 2000,
      intimacy_limit => 500, rank_factor => 0,
      popularity => 0, prac_exp => 0, relation => 0,
      received_limit => 0};
get_present(_) -> false.

get_popularity_reward(1) ->
    {{300},
     [#{id => 1, popularity => 300, item_id => 22550,
        item_num => 1, item_name => lang:get("300人气礼盒"),
        item_weight => 1000, announce => 0}]};
get_popularity_reward(2) ->
    {{1000},
     [#{id => 2, popularity => 1000, item_id => 22551,
        item_num => 1, item_name => lang:get("1000人气礼盒"),
        item_weight => 1000, announce => 0}]};
get_popularity_reward(_) -> false.

get_reward(1, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 1, min => 1, max => 79,
      reward =>
          [{0, 999, 24003, 1},
           {0, 999, 90000, 300000},
           {0, 999, 20006, 20},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 24003, 1},
           {0, 999, 90000, 300000},
           {0, 999, 20006, 20},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(2, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 2, min => 1, max => 79,
      reward =>
          [{0, 999, 22400, 10},
           {0, 999, 90000, 600000},
           {0, 999, 20025, 5},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22400, 10},
           {0, 999, 90000, 600000},
           {0, 999, 20025, 5},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(3, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 3, min => 1, max => 79,
      reward =>
          [{0, 999, 29012, 1},
           {0, 999, 20005, 8},
           {0, 999, 29103, 8},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 29012, 1},
           {0, 999, 20005, 8},
           {0, 999, 29103, 8},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      limit =>
          [{20505, 10}, {22586, 1}, {22572, 1}, {20006, 300}],
      pirce => [{90002, 680}]};
get_reward(4, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 4, min => 1, max => 79,
      reward =>
          [{0, 999, 22306, 3},
           {0, 999, 21433, 1},
           {0, 999, 21433, 1},
           {0, 999, 21433, 1},
           {0, 999, 20034, 3},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22306, 3},
           {0, 999, 21433, 3},
           {0, 999, 20034, 3},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(5, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 5, min => 1, max => 79,
      reward =>
          [{0, 999, 22401, 5},
           {0, 999, 29104, 9},
           {0, 999, 90000, 1000000},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22401, 5},
           {0, 999, 29104, 9},
           {0, 999, 90000, 1000000},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(6, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 6, min => 1, max => 79,
      reward =>
          [{0, 999, 20616, 1},
           {0, 999, 23556, 6},
           {0, 999, 20002, 2},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 20616, 1},
           {0, 999, 23556, 6},
           {0, 999, 20002, 2},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(7, Lev) when Lev >= 1 andalso Lev =< 79 ->
    #{day => 7, min => 1, max => 79,
      reward =>
          [{0, 999, 20505, 2},
           {0, 999, 20076, 1},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 20505, 2},
           {0, 999, 20076, 1},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      limit =>
          [{20505, 20},
           {20171, 1},
           {28607, 8},
           {29100, 5},
           {20006, 300}],
      pirce => [{90002, 1680}]};
get_reward(1, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 1, min => 80, max => 999,
      reward =>
          [{0, 999, 24003, 1},
           {0, 999, 90000, 300000},
           {0, 999, 20006, 20},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 24003, 1},
           {0, 999, 90000, 300000},
           {0, 999, 20006, 20},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(2, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 2, min => 80, max => 999,
      reward =>
          [{0, 999, 22400, 10},
           {0, 999, 90000, 600000},
           {0, 999, 20025, 5},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22400, 10},
           {0, 999, 90000, 600000},
           {0, 999, 20025, 5},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(3, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 3, min => 80, max => 999,
      reward =>
          [{0, 999, 29012, 1},
           {0, 999, 20005, 8},
           {0, 999, 29103, 8},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 29012, 1},
           {0, 999, 20005, 8},
           {0, 999, 29103, 8},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      limit =>
          [{20505, 10}, {22586, 1}, {21098, 50}, {23660, 10}],
      pirce => [{90002, 680}]};
get_reward(4, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 4, min => 80, max => 999,
      reward =>
          [{0, 999, 22306, 3},
           {0, 999, 21433, 1},
           {0, 999, 21433, 1},
           {0, 999, 21433, 1},
           {0, 999, 20034, 3},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22306, 3},
           {0, 999, 21433, 3},
           {0, 999, 20034, 3},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(5, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 5, min => 80, max => 999,
      reward =>
          [{0, 999, 22401, 5},
           {0, 999, 29104, 9},
           {0, 999, 90000, 1000000},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 22401, 5},
           {0, 999, 29104, 9},
           {0, 999, 90000, 1000000},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(6, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 6, min => 80, max => 999,
      reward =>
          [{0, 999, 20616, 1},
           {0, 999, 23556, 6},
           {0, 999, 20002, 2},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 20616, 1},
           {0, 999, 23556, 6},
           {0, 999, 20002, 2},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}]};
get_reward(7, Lev) when Lev >= 80 andalso Lev =< 999 ->
    #{day => 7, min => 80, max => 999,
      reward =>
          [{0, 999, 20505, 2},
           {0, 999, 20076, 1},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      reward_client =>
          [{0, 999, 20505, 2},
           {0, 999, 20076, 1},
           {50, 59, 22243, 1},
           {60, 69, 22244, 1},
           {70, 79, 22245, 1},
           {80, 89, 22246, 1},
           {90, 999, 22247, 1}],
      limit =>
          [{20505, 20},
           {20171, 1},
           {28607, 8},
           {29100, 5},
           {20006, 300}],
      pirce => [{90002, 1680}]};
get_reward(_, _) -> false.

get_reward_draw(1) ->
    #{id => 1, reward => [{20545, 3}],
      reward_client => [{20545, 3}], odds => 80, cast => 0};
get_reward_draw(2) ->
    #{id => 2, reward => [{22216, 3}],
      reward_client => [{22216, 3}], odds => 80, cast => 0};
get_reward_draw(3) ->
    #{id => 3, reward => [{20014, 1}],
      reward_client => [{20014, 1}], odds => 50, cast => 0};
get_reward_draw(4) ->
    #{id => 4, reward => [{22205, 1}],
      reward_client => [{22205, 1}], odds => 6, cast => 1};
get_reward_draw(5) ->
    #{id => 5, reward => [{20038, 1}],
      reward_client => [{20038, 1}], odds => 60, cast => 0};
get_reward_draw(6) ->
    #{id => 6, reward => [{20095, 1}],
      reward_client => [{20095, 1}], odds => 80, cast => 0};
get_reward_draw(7) ->
    #{id => 7, reward => [{20040, 1}],
      reward_client => [{20040, 1}], odds => 80, cast => 0};
get_reward_draw(8) ->
    #{id => 8, reward => [{20036, 1}],
      reward_client => [{20036, 1}], odds => 50, cast => 0};
get_reward_draw(9) ->
    #{id => 9, reward => [{29101, 1}],
      reward_client => [{29101, 1}], odds => 40, cast => 0};
get_reward_draw(10) ->
    #{id => 10, reward => [{29100, 1}],
      reward_client => [{29100, 1}], odds => 20, cast => 0};
get_reward_draw(11) ->
    #{id => 11, reward => [{22300, 1}],
      reward_client => [{22300, 1}], odds => 10, cast => 0};
get_reward_draw(12) ->
    #{id => 12, reward => [{22585, 3}],
      reward_client => [{22585, 3}], odds => 80, cast => 0};
get_reward_draw(13) ->
    #{id => 13, reward => [{20404, 1}],
      reward_client => [{20404, 1}], odds => 80, cast => 0};
get_reward_draw(14) ->
    #{id => 14, reward => [{23119, 1}],
      reward_client => [{23119, 1}], odds => 10, cast => 0};
get_reward_draw(15) ->
    #{id => 15, reward => [{23556, 10}],
      reward_client => [{23556, 10}], odds => 60, cast => 0};
get_reward_draw(16) ->
    #{id => 16, reward => [{21426, 1}],
      reward_client => [{21426, 1}], odds => 60, cast => 0};
get_reward_draw(17) ->
    #{id => 17, reward => [{22307, 3}],
      reward_client => [{22307, 3}], odds => 80, cast => 0};
get_reward_draw(18) ->
    #{id => 18, reward => [{21322, 1}],
      reward_client => [{21322, 1}], odds => 74, cast => 0};
get_reward_draw(_) -> false.

list() ->
    [{1, 80},
     {2, 80},
     {3, 50},
     {4, 6},
     {5, 60},
     {6, 80},
     {7, 80},
     {8, 50},
     {9, 40},
     {10, 20},
     {11, 10},
     {12, 80},
     {13, 80},
     {14, 10},
     {15, 60},
     {16, 60},
     {17, 80},
     {18, 74}].

get_recall_reward(1) ->
    #{id => 1,
      reward =>
          [{0, 999, 20000, 1},
           {0, 999, 20006, 20},
           {0, 999, 22585, 1}],
      reward_client =>
          [{0, 999, 20000, 1},
           {0, 999, 20006, 20},
           {0, 999, 22585, 1}],
      activity => 300};
get_recall_reward(2) ->
    #{id => 2,
      reward =>
          [{0, 999, 20002, 2},
           {0, 999, 20025, 3},
           {0, 999, 20052, 3}],
      reward_client =>
          [{0, 999, 20002, 2},
           {0, 999, 20025, 3},
           {0, 999, 20052, 3}],
      activity => 600};
get_recall_reward(3) ->
    #{id => 3,
      reward =>
          [{0, 999, 20053, 1},
           {0, 999, 22216, 1},
           {60, 79, 20020, 8},
           {60, 79, 20021, 3},
           {80, 999, 22306, 3},
           {80, 999, 21433, 1},
           {80, 999, 21433, 1}],
      reward_client =>
          [{0, 999, 20053, 1},
           {0, 999, 22216, 1},
           {60, 79, 20020, 8},
           {60, 79, 20021, 3},
           {80, 999, 22306, 3},
           {80, 999, 21433, 2}],
      activity => 1200};
get_recall_reward(4) ->
    #{id => 4,
      reward =>
          [{0, 999, 24004, 1},
           {0, 999, 22401, 6},
           {0, 999, 23556, 8},
           {0, 999, 20014, 1}],
      reward_client =>
          [{0, 999, 24004, 1},
           {0, 999, 22401, 6},
           {0, 999, 23556, 8},
           {0, 999, 20014, 1}],
      activity => 2500};
get_recall_reward(_) -> false.

get_recall_reward_list() -> [1, 2, 3, 4].

get_recalled_reward(1) ->
    #{id => 1,
      reward => [{20000, 3}, {20006, 50}, {22585, 3}],
      reward_client => [{20000, 3}, {20006, 50}, {22585, 3}],
      activity => 300};
get_recalled_reward(2) ->
    #{id => 2,
      reward => [{20002, 5}, {20025, 10}, {20052, 5}],
      reward_client => [{20002, 5}, {20025, 10}, {20052, 5}],
      activity => 600};
get_recalled_reward(3) ->
    #{id => 3,
      reward =>
          [{22216, 2},
           {22306, 5},
           {21433, 1},
           {21433, 1},
           {21433, 1},
           {21433, 1},
           {21433, 1},
           {20053, 1}],
      reward_client =>
          [{20053, 1}, {22306, 5}, {22216, 2}, {21433, 5}],
      activity => 1200};
get_recalled_reward(4) ->
    #{id => 4,
      reward =>
          [{23556, 10}, {22401, 8}, {20014, 1}, {24004, 1}],
      reward_client =>
          [{24004, 1}, {22401, 8}, {23556, 10}, {20014, 1}],
      activity => 3000};
get_recalled_reward(_) -> false.

get_recalled_reward_list() -> [1, 2, 3, 4].

get_activity_reward(1) ->
    #{id => 1, activity => 300,
      reward =>
          [{0, 999, 20000, 1},
           {0, 999, 20006, 20},
           {0, 999, 22585, 1}]};
get_activity_reward(2) ->
    #{id => 2, activity => 600,
      reward =>
          [{0, 999, 20002, 2},
           {0, 999, 20025, 3},
           {0, 999, 20052, 3}]};
get_activity_reward(3) ->
    #{id => 3, activity => 1200,
      reward =>
          [{60, 79, 22216, 1},
           {60, 79, 20020, 8},
           {60, 79, 20021, 3},
           {60, 79, 20053, 1},
           {80, 999, 22216, 1},
           {80, 999, 22306, 3},
           {80, 999, 21433, 1},
           {80, 999, 21433, 1},
           {80, 999, 20053, 1}]};
get_activity_reward(4) ->
    #{id => 4, activity => 2500,
      reward =>
          [{0, 999, 23556, 8},
           {0, 999, 22401, 6},
           {0, 999, 20014, 1},
           {0, 999, 24004, 1}]};
get_activity_reward(_) -> false.

get_growth_buff(1) -> [12300, 12290, 12280];
get_growth_buff(2) -> [12002, 12300, 12270];
get_growth_buff(3) -> [12012, 12300, 12291];
get_growth_buff(4) -> [12281, 12002, 12270];
get_growth_buff(5) -> [12300, 12291, 12012];
get_growth_buff(6) -> [12281, 12002, 12270];
get_growth_buff(7) -> [12300, 12291, 12012];
get_growth_buff(_) -> [].

get_platform_num("beta") ->
    #{platform => "beta", num => 1};
get_platform_num("ios") ->
    #{platform => "ios", num => 2};
get_platform_num("mix") ->
    #{platform => "mix", num => 3};
get_platform_num("unite") ->
    #{platform => "unite", num => 4};
get_platform_num("sp") -> #{platform => "sp", num => 5};
get_platform_num(_) -> false.

get_rand_list(70886) -> [{2, 100}, {3, 100}, {4, 100}];
get_rand_list(70815) -> [{1, 100}, {2, 100}, {3, 100}];
get_rand_list(70933) -> [{1, 100}, {2, 100}, {3, 100}];
get_rand_list(70617) -> [{1, 100}, {2, 100}, {3, 100}];
get_rand_list(71569) -> [{1, 100}, {2, 100}, {3, 100}];
get_rand_list(_) -> false.

get_reward_id(70886) -> 70885;
get_reward_id(70815) -> 70814;
get_reward_id(70933) -> 70895;
get_reward_id(70617) -> 70614;
get_reward_id(71569) -> 71568;
get_reward_id(_) -> false.

