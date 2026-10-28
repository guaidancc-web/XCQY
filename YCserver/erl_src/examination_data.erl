-file("src/data/examination_data.erl", 1).

-module(examination_data).

-export([list/0,
         get_examiner/1,
         get_reward/1,
         reward_item/1,
         get_rank_reward/1,
         get_ending_reward/1]).

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

-file("src/data/examination_data.erl", 19).

list() -> [1, 2, 3, 4, 5, 6, 7].

get_examiner(1) ->
    #{week => 1, location => [{79843, 10001, 3320, 2235}],
      subject => 2};
get_examiner(2) ->
    #{week => 2, location => [{79843, 10001, 3320, 2235}],
      subject => 4};
get_examiner(3) ->
    #{week => 3, location => [{79843, 10001, 3320, 2235}],
      subject => 3};
get_examiner(4) ->
    #{week => 4, location => [{79843, 10001, 3320, 2235}],
      subject => 1};
get_examiner(5) ->
    #{week => 5, location => [{79843, 10001, 3320, 2235}],
      subject => 5};
get_examiner(6) ->
    #{week => 6,
      location =>
          [{79840, 10001, 3320, 2235},
           {79821, 10001, 4655, 3100},
           {79822, 10002, 1600, 1700},
           {79823, 10002, 2200, 1100},
           {79824, 10002, 1200, 530},
           {79825, 10003, 2185, 2038},
           {79826, 10003, 888, 1600},
           {79827, 10003, 1000, 300},
           {79828, 10007, 900, 2950},
           {79829, 10007, 350, 1150},
           {79830, 10007, 900, 400}],
      subject => 0};
get_examiner(7) ->
    #{week => 7,
      location =>
          [{79841, 10001, 3320, 2235},
           {79842, 52000, 1400, 300},
           {79801, 52000, 1370, 1700},
           {79803, 52000, 580, 740},
           {79804, 52000, 940, 380},
           {79805, 52000, 1450, 640}],
      subject => 0};
get_examiner(_) -> 0.

get_reward({1, 1}) ->
    #{lev => 1, type => 1, right_exp => 0,
      right_pet_exp => 2330, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1166, wrong_coin => 0};
get_reward({2, 1}) ->
    #{lev => 2, type => 1, right_exp => 0,
      right_pet_exp => 2382, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1192, wrong_coin => 0};
get_reward({3, 1}) ->
    #{lev => 3, type => 1, right_exp => 0,
      right_pet_exp => 2452, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1226, wrong_coin => 0};
get_reward({4, 1}) ->
    #{lev => 4, type => 1, right_exp => 0,
      right_pet_exp => 2522, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1262, wrong_coin => 0};
get_reward({5, 1}) ->
    #{lev => 5, type => 1, right_exp => 0,
      right_pet_exp => 2574, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1288, wrong_coin => 0};
get_reward({6, 1}) ->
    #{lev => 6, type => 1, right_exp => 0,
      right_pet_exp => 2644, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1322, wrong_coin => 0};
get_reward({7, 1}) ->
    #{lev => 7, type => 1, right_exp => 0,
      right_pet_exp => 2714, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1358, wrong_coin => 0};
get_reward({8, 1}) ->
    #{lev => 8, type => 1, right_exp => 0,
      right_pet_exp => 2766, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1384, wrong_coin => 0};
get_reward({9, 1}) ->
    #{lev => 9, type => 1, right_exp => 0,
      right_pet_exp => 2834, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1418, wrong_coin => 0};
get_reward({10, 1}) ->
    #{lev => 10, type => 1, right_exp => 0,
      right_pet_exp => 2904, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1452, wrong_coin => 0};
get_reward({11, 1}) ->
    #{lev => 11, type => 1, right_exp => 0,
      right_pet_exp => 2974, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1488, wrong_coin => 0};
get_reward({12, 1}) ->
    #{lev => 12, type => 1, right_exp => 0,
      right_pet_exp => 3044, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1522, wrong_coin => 0};
get_reward({13, 1}) ->
    #{lev => 13, type => 1, right_exp => 0,
      right_pet_exp => 3096, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1548, wrong_coin => 0};
get_reward({14, 1}) ->
    #{lev => 14, type => 1, right_exp => 0,
      right_pet_exp => 3166, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1584, wrong_coin => 0};
get_reward({15, 1}) ->
    #{lev => 15, type => 1, right_exp => 0,
      right_pet_exp => 3234, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1618, wrong_coin => 0};
get_reward({16, 1}) ->
    #{lev => 16, type => 1, right_exp => 0,
      right_pet_exp => 3304, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1652, wrong_coin => 0};
get_reward({17, 1}) ->
    #{lev => 17, type => 1, right_exp => 0,
      right_pet_exp => 3374, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1688, wrong_coin => 0};
get_reward({18, 1}) ->
    #{lev => 18, type => 1, right_exp => 0,
      right_pet_exp => 3444, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1722, wrong_coin => 0};
get_reward({19, 1}) ->
    #{lev => 19, type => 1, right_exp => 0,
      right_pet_exp => 3514, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1758, wrong_coin => 0};
get_reward({20, 1}) ->
    #{lev => 20, type => 1, right_exp => 0,
      right_pet_exp => 3582, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1792, wrong_coin => 0};
get_reward({21, 1}) ->
    #{lev => 21, type => 1, right_exp => 0,
      right_pet_exp => 3652, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1826, wrong_coin => 0};
get_reward({22, 1}) ->
    #{lev => 22, type => 1, right_exp => 0,
      right_pet_exp => 3722, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1862, wrong_coin => 0};
get_reward({23, 1}) ->
    #{lev => 23, type => 1, right_exp => 0,
      right_pet_exp => 3792, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1896, wrong_coin => 0};
get_reward({24, 1}) ->
    #{lev => 24, type => 1, right_exp => 0,
      right_pet_exp => 3862, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1932, wrong_coin => 0};
get_reward({25, 1}) ->
    #{lev => 25, type => 1, right_exp => 0,
      right_pet_exp => 3930, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1966, wrong_coin => 0};
get_reward({26, 1}) ->
    #{lev => 26, type => 1, right_exp => 0,
      right_pet_exp => 4000, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 2000, wrong_coin => 0};
get_reward({27, 1}) ->
    #{lev => 27, type => 1, right_exp => 0,
      right_pet_exp => 4070, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 2036, wrong_coin => 0};
get_reward({28, 1}) ->
    #{lev => 28, type => 1, right_exp => 0,
      right_pet_exp => 4140, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 2070, wrong_coin => 0};
get_reward({29, 1}) ->
    #{lev => 29, type => 1, right_exp => 0,
      right_pet_exp => 4208, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 2104, wrong_coin => 0};
get_reward({30, 1}) ->
    #{lev => 30, type => 1, right_exp => 8556,
      right_pet_exp => 4278, right_coin => 0,
      wrong_exp => 4278, wrong_pet_exp => 2140,
      wrong_coin => 0};
get_reward({31, 1}) ->
    #{lev => 31, type => 1, right_exp => 9070,
      right_pet_exp => 4534, right_coin => 0,
      wrong_exp => 4536, wrong_pet_exp => 2268,
      wrong_coin => 0};
get_reward({32, 1}) ->
    #{lev => 32, type => 1, right_exp => 9322,
      right_pet_exp => 4660, right_coin => 0,
      wrong_exp => 4662, wrong_pet_exp => 2330,
      wrong_coin => 0};
get_reward({33, 1}) ->
    #{lev => 33, type => 1, right_exp => 9358,
      right_pet_exp => 4680, right_coin => 0,
      wrong_exp => 4680, wrong_pet_exp => 2340,
      wrong_coin => 0};
get_reward({34, 1}) ->
    #{lev => 34, type => 1, right_exp => 9684,
      right_pet_exp => 4842, right_coin => 0,
      wrong_exp => 4842, wrong_pet_exp => 2422,
      wrong_coin => 0};
get_reward({35, 1}) ->
    #{lev => 35, type => 1, right_exp => 9888,
      right_pet_exp => 4944, right_coin => 0,
      wrong_exp => 4944, wrong_pet_exp => 2472,
      wrong_coin => 0};
get_reward({36, 1}) ->
    #{lev => 36, type => 1, right_exp => 9874,
      right_pet_exp => 4936, right_coin => 0,
      wrong_exp => 4938, wrong_pet_exp => 2468,
      wrong_coin => 0};
get_reward({37, 1}) ->
    #{lev => 37, type => 1, right_exp => 9986,
      right_pet_exp => 4992, right_coin => 0,
      wrong_exp => 4994, wrong_pet_exp => 2496,
      wrong_coin => 0};
get_reward({38, 1}) ->
    #{lev => 38, type => 1, right_exp => 10242,
      right_pet_exp => 5120, right_coin => 0,
      wrong_exp => 5122, wrong_pet_exp => 2560,
      wrong_coin => 0};
get_reward({39, 1}) ->
    #{lev => 39, type => 1, right_exp => 10408,
      right_pet_exp => 5204, right_coin => 0,
      wrong_exp => 5204, wrong_pet_exp => 2602,
      wrong_coin => 0};
get_reward({40, 1}) ->
    #{lev => 40, type => 1, right_exp => 10580,
      right_pet_exp => 5290, right_coin => 0,
      wrong_exp => 5290, wrong_pet_exp => 2646,
      wrong_coin => 0};
get_reward({41, 1}) ->
    #{lev => 41, type => 1, right_exp => 10980,
      right_pet_exp => 5490, right_coin => 0,
      wrong_exp => 5490, wrong_pet_exp => 2746,
      wrong_coin => 0};
get_reward({42, 1}) ->
    #{lev => 42, type => 1, right_exp => 11186,
      right_pet_exp => 5592, right_coin => 0,
      wrong_exp => 5594, wrong_pet_exp => 2796,
      wrong_coin => 0};
get_reward({43, 1}) ->
    #{lev => 43, type => 1, right_exp => 11342,
      right_pet_exp => 5670, right_coin => 0,
      wrong_exp => 5672, wrong_pet_exp => 2836,
      wrong_coin => 0};
get_reward({44, 1}) ->
    #{lev => 44, type => 1, right_exp => 11474,
      right_pet_exp => 5736, right_coin => 0,
      wrong_exp => 5738, wrong_pet_exp => 2868,
      wrong_coin => 0};
get_reward({45, 1}) ->
    #{lev => 45, type => 1, right_exp => 11658,
      right_pet_exp => 5830, right_coin => 0,
      wrong_exp => 5830, wrong_pet_exp => 2916,
      wrong_coin => 0};
get_reward({46, 1}) ->
    #{lev => 46, type => 1, right_exp => 11776,
      right_pet_exp => 5888, right_coin => 0,
      wrong_exp => 5888, wrong_pet_exp => 2944,
      wrong_coin => 0};
get_reward({47, 1}) ->
    #{lev => 47, type => 1, right_exp => 11956,
      right_pet_exp => 5978, right_coin => 0,
      wrong_exp => 5978, wrong_pet_exp => 2990,
      wrong_coin => 0};
get_reward({48, 1}) ->
    #{lev => 48, type => 1, right_exp => 12068,
      right_pet_exp => 6034, right_coin => 0,
      wrong_exp => 6034, wrong_pet_exp => 3018,
      wrong_coin => 0};
get_reward({49, 1}) ->
    #{lev => 49, type => 1, right_exp => 12268,
      right_pet_exp => 6134, right_coin => 0,
      wrong_exp => 6134, wrong_pet_exp => 3068,
      wrong_coin => 0};
get_reward({50, 1}) ->
    #{lev => 50, type => 1, right_exp => 12432,
      right_pet_exp => 6216, right_coin => 0,
      wrong_exp => 6216, wrong_pet_exp => 3108,
      wrong_coin => 0};
get_reward({51, 1}) ->
    #{lev => 51, type => 1, right_exp => 12580,
      right_pet_exp => 6290, right_coin => 0,
      wrong_exp => 6290, wrong_pet_exp => 3146,
      wrong_coin => 0};
get_reward({52, 1}) ->
    #{lev => 52, type => 1, right_exp => 12730,
      right_pet_exp => 6366, right_coin => 0,
      wrong_exp => 6366, wrong_pet_exp => 3184,
      wrong_coin => 0};
get_reward({53, 1}) ->
    #{lev => 53, type => 1, right_exp => 12926,
      right_pet_exp => 6462, right_coin => 0,
      wrong_exp => 6464, wrong_pet_exp => 3232,
      wrong_coin => 0};
get_reward({54, 1}) ->
    #{lev => 54, type => 1, right_exp => 13096,
      right_pet_exp => 6548, right_coin => 0,
      wrong_exp => 6548, wrong_pet_exp => 3274,
      wrong_coin => 0};
get_reward({55, 1}) ->
    #{lev => 55, type => 1, right_exp => 13246,
      right_pet_exp => 6622, right_coin => 0,
      wrong_exp => 6624, wrong_pet_exp => 3312,
      wrong_coin => 0};
get_reward({56, 1}) ->
    #{lev => 56, type => 1, right_exp => 13694,
      right_pet_exp => 6848, right_coin => 0,
      wrong_exp => 6848, wrong_pet_exp => 3424,
      wrong_coin => 0};
get_reward({57, 1}) ->
    #{lev => 57, type => 1, right_exp => 13848,
      right_pet_exp => 6924, right_coin => 0,
      wrong_exp => 6924, wrong_pet_exp => 3462,
      wrong_coin => 0};
get_reward({58, 1}) ->
    #{lev => 58, type => 1, right_exp => 14048,
      right_pet_exp => 7024, right_coin => 0,
      wrong_exp => 7024, wrong_pet_exp => 3512,
      wrong_coin => 0};
get_reward({59, 1}) ->
    #{lev => 59, type => 1, right_exp => 14204,
      right_pet_exp => 7102, right_coin => 0,
      wrong_exp => 7102, wrong_pet_exp => 3552,
      wrong_coin => 0};
get_reward({60, 1}) ->
    #{lev => 60, type => 1, right_exp => 14358,
      right_pet_exp => 7178, right_coin => 0,
      wrong_exp => 7180, wrong_pet_exp => 3590,
      wrong_coin => 0};
get_reward({61, 1}) ->
    #{lev => 61, type => 1, right_exp => 14834,
      right_pet_exp => 7418, right_coin => 0,
      wrong_exp => 7418, wrong_pet_exp => 3710,
      wrong_coin => 0};
get_reward({62, 1}) ->
    #{lev => 62, type => 1, right_exp => 15008,
      right_pet_exp => 7504, right_coin => 0,
      wrong_exp => 7504, wrong_pet_exp => 3752,
      wrong_coin => 0};
get_reward({63, 1}) ->
    #{lev => 63, type => 1, right_exp => 15178,
      right_pet_exp => 7588, right_coin => 0,
      wrong_exp => 7590, wrong_pet_exp => 3794,
      wrong_coin => 0};
get_reward({64, 1}) ->
    #{lev => 64, type => 1, right_exp => 15330,
      right_pet_exp => 7664, right_coin => 0,
      wrong_exp => 7666, wrong_pet_exp => 3832,
      wrong_coin => 0};
get_reward({65, 1}) ->
    #{lev => 65, type => 1, right_exp => 15502,
      right_pet_exp => 7750, right_coin => 0,
      wrong_exp => 7752, wrong_pet_exp => 3876,
      wrong_coin => 0};
get_reward({66, 1}) ->
    #{lev => 66, type => 1, right_exp => 15672,
      right_pet_exp => 7836, right_coin => 0,
      wrong_exp => 7836, wrong_pet_exp => 3918,
      wrong_coin => 0};
get_reward({67, 1}) ->
    #{lev => 67, type => 1, right_exp => 15852,
      right_pet_exp => 7926, right_coin => 0,
      wrong_exp => 7926, wrong_pet_exp => 3964,
      wrong_coin => 0};
get_reward({68, 1}) ->
    #{lev => 68, type => 1, right_exp => 16034,
      right_pet_exp => 8018, right_coin => 0,
      wrong_exp => 8018, wrong_pet_exp => 4010,
      wrong_coin => 0};
get_reward({69, 1}) ->
    #{lev => 69, type => 1, right_exp => 16206,
      right_pet_exp => 8104, right_coin => 0,
      wrong_exp => 8104, wrong_pet_exp => 4052,
      wrong_coin => 0};
get_reward({70, 1}) ->
    #{lev => 70, type => 1, right_exp => 16354,
      right_pet_exp => 8176, right_coin => 0,
      wrong_exp => 8178, wrong_pet_exp => 4088,
      wrong_coin => 0};
get_reward({71, 1}) ->
    #{lev => 71, type => 1, right_exp => 16530,
      right_pet_exp => 8266, right_coin => 0,
      wrong_exp => 8266, wrong_pet_exp => 4134,
      wrong_coin => 0};
get_reward({72, 1}) ->
    #{lev => 72, type => 1, right_exp => 16706,
      right_pet_exp => 8354, right_coin => 0,
      wrong_exp => 8354, wrong_pet_exp => 4178,
      wrong_coin => 0};
get_reward({73, 1}) ->
    #{lev => 73, type => 1, right_exp => 16882,
      right_pet_exp => 8442, right_coin => 0,
      wrong_exp => 8442, wrong_pet_exp => 4222,
      wrong_coin => 0};
get_reward({74, 1}) ->
    #{lev => 74, type => 1, right_exp => 17060,
      right_pet_exp => 8530, right_coin => 0,
      wrong_exp => 8530, wrong_pet_exp => 4266,
      wrong_coin => 0};
get_reward({75, 1}) ->
    #{lev => 75, type => 1, right_exp => 17238,
      right_pet_exp => 8618, right_coin => 0,
      wrong_exp => 8620, wrong_pet_exp => 4310,
      wrong_coin => 0};
get_reward({76, 1}) ->
    #{lev => 76, type => 1, right_exp => 17418,
      right_pet_exp => 8708, right_coin => 0,
      wrong_exp => 8710, wrong_pet_exp => 4354,
      wrong_coin => 0};
get_reward({77, 1}) ->
    #{lev => 77, type => 1, right_exp => 17598,
      right_pet_exp => 8798, right_coin => 0,
      wrong_exp => 8800, wrong_pet_exp => 4400,
      wrong_coin => 0};
get_reward({78, 1}) ->
    #{lev => 78, type => 1, right_exp => 17774,
      right_pet_exp => 8888, right_coin => 0,
      wrong_exp => 8888, wrong_pet_exp => 4444,
      wrong_coin => 0};
get_reward({79, 1}) ->
    #{lev => 79, type => 1, right_exp => 17952,
      right_pet_exp => 8976, right_coin => 0,
      wrong_exp => 8976, wrong_pet_exp => 4488,
      wrong_coin => 0};
get_reward({80, 1}) ->
    #{lev => 80, type => 1, right_exp => 18126,
      right_pet_exp => 9062, right_coin => 0,
      wrong_exp => 9064, wrong_pet_exp => 4532,
      wrong_coin => 0};
get_reward({81, 1}) ->
    #{lev => 81, type => 1, right_exp => 19488,
      right_pet_exp => 9744, right_coin => 0,
      wrong_exp => 9744, wrong_pet_exp => 4872,
      wrong_coin => 0};
get_reward({82, 1}) ->
    #{lev => 82, type => 1, right_exp => 19700,
      right_pet_exp => 9850, right_coin => 0,
      wrong_exp => 9850, wrong_pet_exp => 4926,
      wrong_coin => 0};
get_reward({83, 1}) ->
    #{lev => 83, type => 1, right_exp => 19880,
      right_pet_exp => 9940, right_coin => 0,
      wrong_exp => 9940, wrong_pet_exp => 4970,
      wrong_coin => 0};
get_reward({84, 1}) ->
    #{lev => 84, type => 1, right_exp => 20058,
      right_pet_exp => 10028, right_coin => 0,
      wrong_exp => 10030, wrong_pet_exp => 5014,
      wrong_coin => 0};
get_reward({85, 1}) ->
    #{lev => 85, type => 1, right_exp => 20238,
      right_pet_exp => 10118, right_coin => 0,
      wrong_exp => 10120, wrong_pet_exp => 5060,
      wrong_coin => 0};
get_reward({86, 1}) ->
    #{lev => 86, type => 1, right_exp => 20412,
      right_pet_exp => 10206, right_coin => 0,
      wrong_exp => 10206, wrong_pet_exp => 5104,
      wrong_coin => 0};
get_reward({87, 1}) ->
    #{lev => 87, type => 1, right_exp => 20590,
      right_pet_exp => 10294, right_coin => 0,
      wrong_exp => 10296, wrong_pet_exp => 5148,
      wrong_coin => 0};
get_reward({88, 1}) ->
    #{lev => 88, type => 1, right_exp => 20804,
      right_pet_exp => 10402, right_coin => 0,
      wrong_exp => 10402, wrong_pet_exp => 5202,
      wrong_coin => 0};
get_reward({89, 1}) ->
    #{lev => 89, type => 1, right_exp => 20982,
      right_pet_exp => 10490, right_coin => 0,
      wrong_exp => 10492, wrong_pet_exp => 5246,
      wrong_coin => 0};
get_reward({90, 1}) ->
    #{lev => 90, type => 1, right_exp => 21158,
      right_pet_exp => 10578, right_coin => 0,
      wrong_exp => 10580, wrong_pet_exp => 5290,
      wrong_coin => 0};
get_reward({91, 1}) ->
    #{lev => 91, type => 1, right_exp => 21334,
      right_pet_exp => 10668, right_coin => 0,
      wrong_exp => 10668, wrong_pet_exp => 5334,
      wrong_coin => 0};
get_reward({92, 1}) ->
    #{lev => 92, type => 1, right_exp => 21550,
      right_pet_exp => 10774, right_coin => 0,
      wrong_exp => 10776, wrong_pet_exp => 5388,
      wrong_coin => 0};
get_reward({93, 1}) ->
    #{lev => 93, type => 1, right_exp => 21728,
      right_pet_exp => 10864, right_coin => 0,
      wrong_exp => 10864, wrong_pet_exp => 5432,
      wrong_coin => 0};
get_reward({94, 1}) ->
    #{lev => 94, type => 1, right_exp => 21904,
      right_pet_exp => 10952, right_coin => 0,
      wrong_exp => 10952, wrong_pet_exp => 5476,
      wrong_coin => 0};
get_reward({95, 1}) ->
    #{lev => 95, type => 1, right_exp => 22118,
      right_pet_exp => 11058, right_coin => 0,
      wrong_exp => 11060, wrong_pet_exp => 5530,
      wrong_coin => 0};
get_reward({96, 1}) ->
    #{lev => 96, type => 1, right_exp => 22294,
      right_pet_exp => 11146, right_coin => 0,
      wrong_exp => 11148, wrong_pet_exp => 5574,
      wrong_coin => 0};
get_reward({97, 1}) ->
    #{lev => 97, type => 1, right_exp => 22472,
      right_pet_exp => 11236, right_coin => 0,
      wrong_exp => 11236, wrong_pet_exp => 5618,
      wrong_coin => 0};
get_reward({98, 1}) ->
    #{lev => 98, type => 1, right_exp => 22686,
      right_pet_exp => 11342, right_coin => 0,
      wrong_exp => 11344, wrong_pet_exp => 5672,
      wrong_coin => 0};
get_reward({99, 1}) ->
    #{lev => 99, type => 1, right_exp => 22864,
      right_pet_exp => 11432, right_coin => 0,
      wrong_exp => 11432, wrong_pet_exp => 5716,
      wrong_coin => 0};
get_reward({100, 1}) ->
    #{lev => 100, type => 1, right_exp => 23092,
      right_pet_exp => 11546, right_coin => 0,
      wrong_exp => 11546, wrong_pet_exp => 5772,
      wrong_coin => 0};
get_reward({101, 1}) ->
    #{lev => 101, type => 1, right_exp => 23322,
      right_pet_exp => 11660, right_coin => 0,
      wrong_exp => 11660, wrong_pet_exp => 5828,
      wrong_coin => 0};
get_reward({102, 1}) ->
    #{lev => 102, type => 1, right_exp => 23554,
      right_pet_exp => 11776, right_coin => 0,
      wrong_exp => 11776, wrong_pet_exp => 5886,
      wrong_coin => 0};
get_reward({103, 1}) ->
    #{lev => 103, type => 1, right_exp => 23788,
      right_pet_exp => 11892, right_coin => 0,
      wrong_exp => 11892, wrong_pet_exp => 5944,
      wrong_coin => 0};
get_reward({104, 1}) ->
    #{lev => 104, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({105, 1}) ->
    #{lev => 105, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({106, 1}) ->
    #{lev => 106, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({107, 1}) ->
    #{lev => 107, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({108, 1}) ->
    #{lev => 108, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({109, 1}) ->
    #{lev => 109, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({110, 1}) ->
    #{lev => 110, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({111, 1}) ->
    #{lev => 111, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({112, 1}) ->
    #{lev => 112, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({113, 1}) ->
    #{lev => 113, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({114, 1}) ->
    #{lev => 114, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({115, 1}) ->
    #{lev => 115, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({116, 1}) ->
    #{lev => 116, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({117, 1}) ->
    #{lev => 117, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({118, 1}) ->
    #{lev => 118, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({119, 1}) ->
    #{lev => 119, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({120, 1}) ->
    #{lev => 120, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({121, 1}) ->
    #{lev => 121, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({122, 1}) ->
    #{lev => 122, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({123, 1}) ->
    #{lev => 123, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({124, 1}) ->
    #{lev => 124, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({125, 1}) ->
    #{lev => 125, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({126, 1}) ->
    #{lev => 126, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({127, 1}) ->
    #{lev => 127, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({128, 1}) ->
    #{lev => 128, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({129, 1}) ->
    #{lev => 129, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({130, 1}) ->
    #{lev => 130, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({131, 1}) ->
    #{lev => 131, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({132, 1}) ->
    #{lev => 132, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({133, 1}) ->
    #{lev => 133, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({134, 1}) ->
    #{lev => 134, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({135, 1}) ->
    #{lev => 135, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({136, 1}) ->
    #{lev => 136, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({137, 1}) ->
    #{lev => 137, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({138, 1}) ->
    #{lev => 138, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({139, 1}) ->
    #{lev => 139, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({140, 1}) ->
    #{lev => 140, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({141, 1}) ->
    #{lev => 141, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({142, 1}) ->
    #{lev => 142, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({143, 1}) ->
    #{lev => 143, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({144, 1}) ->
    #{lev => 144, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({145, 1}) ->
    #{lev => 145, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({146, 1}) ->
    #{lev => 146, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({147, 1}) ->
    #{lev => 147, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({148, 1}) ->
    #{lev => 148, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({149, 1}) ->
    #{lev => 149, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({150, 1}) ->
    #{lev => 150, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({151, 1}) ->
    #{lev => 151, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({152, 1}) ->
    #{lev => 152, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({153, 1}) ->
    #{lev => 153, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({154, 1}) ->
    #{lev => 154, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({155, 1}) ->
    #{lev => 155, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({156, 1}) ->
    #{lev => 156, type => 1, right_exp => 24024,
      right_pet_exp => 12010, right_coin => 0,
      wrong_exp => 12010, wrong_pet_exp => 6002,
      wrong_coin => 0};
get_reward({1, 2}) ->
    #{lev => 1, type => 2, right_exp => 0,
      right_pet_exp => 1165, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 583, wrong_coin => 0};
get_reward({2, 2}) ->
    #{lev => 2, type => 2, right_exp => 0,
      right_pet_exp => 1191, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 596, wrong_coin => 0};
get_reward({3, 2}) ->
    #{lev => 3, type => 2, right_exp => 0,
      right_pet_exp => 1226, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 613, wrong_coin => 0};
get_reward({4, 2}) ->
    #{lev => 4, type => 2, right_exp => 0,
      right_pet_exp => 1261, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 631, wrong_coin => 0};
get_reward({5, 2}) ->
    #{lev => 5, type => 2, right_exp => 0,
      right_pet_exp => 1287, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 644, wrong_coin => 0};
get_reward({6, 2}) ->
    #{lev => 6, type => 2, right_exp => 0,
      right_pet_exp => 1322, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 661, wrong_coin => 0};
get_reward({7, 2}) ->
    #{lev => 7, type => 2, right_exp => 0,
      right_pet_exp => 1357, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 679, wrong_coin => 0};
get_reward({8, 2}) ->
    #{lev => 8, type => 2, right_exp => 0,
      right_pet_exp => 1383, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 692, wrong_coin => 0};
get_reward({9, 2}) ->
    #{lev => 9, type => 2, right_exp => 0,
      right_pet_exp => 1417, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 709, wrong_coin => 0};
get_reward({10, 2}) ->
    #{lev => 10, type => 2, right_exp => 0,
      right_pet_exp => 1452, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 726, wrong_coin => 0};
get_reward({11, 2}) ->
    #{lev => 11, type => 2, right_exp => 0,
      right_pet_exp => 1487, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 744, wrong_coin => 0};
get_reward({12, 2}) ->
    #{lev => 12, type => 2, right_exp => 0,
      right_pet_exp => 1522, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 761, wrong_coin => 0};
get_reward({13, 2}) ->
    #{lev => 13, type => 2, right_exp => 0,
      right_pet_exp => 1548, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 774, wrong_coin => 0};
get_reward({14, 2}) ->
    #{lev => 14, type => 2, right_exp => 0,
      right_pet_exp => 1583, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 792, wrong_coin => 0};
get_reward({15, 2}) ->
    #{lev => 15, type => 2, right_exp => 0,
      right_pet_exp => 1617, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 809, wrong_coin => 0};
get_reward({16, 2}) ->
    #{lev => 16, type => 2, right_exp => 0,
      right_pet_exp => 1652, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 826, wrong_coin => 0};
get_reward({17, 2}) ->
    #{lev => 17, type => 2, right_exp => 0,
      right_pet_exp => 1687, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 844, wrong_coin => 0};
get_reward({18, 2}) ->
    #{lev => 18, type => 2, right_exp => 0,
      right_pet_exp => 1722, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 861, wrong_coin => 0};
get_reward({19, 2}) ->
    #{lev => 19, type => 2, right_exp => 0,
      right_pet_exp => 1757, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 879, wrong_coin => 0};
get_reward({20, 2}) ->
    #{lev => 20, type => 2, right_exp => 0,
      right_pet_exp => 1791, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 896, wrong_coin => 0};
get_reward({21, 2}) ->
    #{lev => 21, type => 2, right_exp => 0,
      right_pet_exp => 1826, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 913, wrong_coin => 0};
get_reward({22, 2}) ->
    #{lev => 22, type => 2, right_exp => 0,
      right_pet_exp => 1861, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 931, wrong_coin => 0};
get_reward({23, 2}) ->
    #{lev => 23, type => 2, right_exp => 0,
      right_pet_exp => 1896, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 948, wrong_coin => 0};
get_reward({24, 2}) ->
    #{lev => 24, type => 2, right_exp => 0,
      right_pet_exp => 1931, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 966, wrong_coin => 0};
get_reward({25, 2}) ->
    #{lev => 25, type => 2, right_exp => 0,
      right_pet_exp => 1965, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 983, wrong_coin => 0};
get_reward({26, 2}) ->
    #{lev => 26, type => 2, right_exp => 0,
      right_pet_exp => 2000, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1000, wrong_coin => 0};
get_reward({27, 2}) ->
    #{lev => 27, type => 2, right_exp => 0,
      right_pet_exp => 2035, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1018, wrong_coin => 0};
get_reward({28, 2}) ->
    #{lev => 28, type => 2, right_exp => 0,
      right_pet_exp => 2070, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1035, wrong_coin => 0};
get_reward({29, 2}) ->
    #{lev => 29, type => 2, right_exp => 0,
      right_pet_exp => 2104, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1052, wrong_coin => 0};
get_reward({30, 2}) ->
    #{lev => 30, type => 2, right_exp => 4278,
      right_pet_exp => 2139, right_coin => 0,
      wrong_exp => 2139, wrong_pet_exp => 1070,
      wrong_coin => 0};
get_reward({31, 2}) ->
    #{lev => 31, type => 2, right_exp => 4535,
      right_pet_exp => 2267, right_coin => 0,
      wrong_exp => 2268, wrong_pet_exp => 1134,
      wrong_coin => 0};
get_reward({32, 2}) ->
    #{lev => 32, type => 2, right_exp => 4661,
      right_pet_exp => 2330, right_coin => 0,
      wrong_exp => 2331, wrong_pet_exp => 1165,
      wrong_coin => 0};
get_reward({33, 2}) ->
    #{lev => 33, type => 2, right_exp => 4679,
      right_pet_exp => 2340, right_coin => 0,
      wrong_exp => 2340, wrong_pet_exp => 1170,
      wrong_coin => 0};
get_reward({34, 2}) ->
    #{lev => 34, type => 2, right_exp => 4842,
      right_pet_exp => 2421, right_coin => 0,
      wrong_exp => 2421, wrong_pet_exp => 1211,
      wrong_coin => 0};
get_reward({35, 2}) ->
    #{lev => 35, type => 2, right_exp => 4944,
      right_pet_exp => 2472, right_coin => 0,
      wrong_exp => 2472, wrong_pet_exp => 1236,
      wrong_coin => 0};
get_reward({36, 2}) ->
    #{lev => 36, type => 2, right_exp => 4937,
      right_pet_exp => 2468, right_coin => 0,
      wrong_exp => 2469, wrong_pet_exp => 1234,
      wrong_coin => 0};
get_reward({37, 2}) ->
    #{lev => 37, type => 2, right_exp => 4993,
      right_pet_exp => 2496, right_coin => 0,
      wrong_exp => 2497, wrong_pet_exp => 1248,
      wrong_coin => 0};
get_reward({38, 2}) ->
    #{lev => 38, type => 2, right_exp => 5121,
      right_pet_exp => 2560, right_coin => 0,
      wrong_exp => 2561, wrong_pet_exp => 1280,
      wrong_coin => 0};
get_reward({39, 2}) ->
    #{lev => 39, type => 2, right_exp => 5204,
      right_pet_exp => 2602, right_coin => 0,
      wrong_exp => 2602, wrong_pet_exp => 1301,
      wrong_coin => 0};
get_reward({40, 2}) ->
    #{lev => 40, type => 2, right_exp => 5290,
      right_pet_exp => 2645, right_coin => 0,
      wrong_exp => 2645, wrong_pet_exp => 1323,
      wrong_coin => 0};
get_reward({41, 2}) ->
    #{lev => 41, type => 2, right_exp => 5490,
      right_pet_exp => 2745, right_coin => 0,
      wrong_exp => 2745, wrong_pet_exp => 1373,
      wrong_coin => 0};
get_reward({42, 2}) ->
    #{lev => 42, type => 2, right_exp => 5593,
      right_pet_exp => 2796, right_coin => 0,
      wrong_exp => 2797, wrong_pet_exp => 1398,
      wrong_coin => 0};
get_reward({43, 2}) ->
    #{lev => 43, type => 2, right_exp => 5671,
      right_pet_exp => 2835, right_coin => 0,
      wrong_exp => 2836, wrong_pet_exp => 1418,
      wrong_coin => 0};
get_reward({44, 2}) ->
    #{lev => 44, type => 2, right_exp => 5737,
      right_pet_exp => 2868, right_coin => 0,
      wrong_exp => 2869, wrong_pet_exp => 1434,
      wrong_coin => 0};
get_reward({45, 2}) ->
    #{lev => 45, type => 2, right_exp => 5829,
      right_pet_exp => 2915, right_coin => 0,
      wrong_exp => 2915, wrong_pet_exp => 1458,
      wrong_coin => 0};
get_reward({46, 2}) ->
    #{lev => 46, type => 2, right_exp => 5888,
      right_pet_exp => 2944, right_coin => 0,
      wrong_exp => 2944, wrong_pet_exp => 1472,
      wrong_coin => 0};
get_reward({47, 2}) ->
    #{lev => 47, type => 2, right_exp => 5978,
      right_pet_exp => 2989, right_coin => 0,
      wrong_exp => 2989, wrong_pet_exp => 1495,
      wrong_coin => 0};
get_reward({48, 2}) ->
    #{lev => 48, type => 2, right_exp => 6034,
      right_pet_exp => 3017, right_coin => 0,
      wrong_exp => 3017, wrong_pet_exp => 1509,
      wrong_coin => 0};
get_reward({49, 2}) ->
    #{lev => 49, type => 2, right_exp => 6134,
      right_pet_exp => 3067, right_coin => 0,
      wrong_exp => 3067, wrong_pet_exp => 1534,
      wrong_coin => 0};
get_reward({50, 2}) ->
    #{lev => 50, type => 2, right_exp => 6216,
      right_pet_exp => 3108, right_coin => 0,
      wrong_exp => 3108, wrong_pet_exp => 1554,
      wrong_coin => 0};
get_reward({51, 2}) ->
    #{lev => 51, type => 2, right_exp => 6290,
      right_pet_exp => 3145, right_coin => 0,
      wrong_exp => 3145, wrong_pet_exp => 1573,
      wrong_coin => 0};
get_reward({52, 2}) ->
    #{lev => 52, type => 2, right_exp => 6365,
      right_pet_exp => 3183, right_coin => 0,
      wrong_exp => 3183, wrong_pet_exp => 1592,
      wrong_coin => 0};
get_reward({53, 2}) ->
    #{lev => 53, type => 2, right_exp => 6463,
      right_pet_exp => 3231, right_coin => 0,
      wrong_exp => 3232, wrong_pet_exp => 1616,
      wrong_coin => 0};
get_reward({54, 2}) ->
    #{lev => 54, type => 2, right_exp => 6548,
      right_pet_exp => 3274, right_coin => 0,
      wrong_exp => 3274, wrong_pet_exp => 1637,
      wrong_coin => 0};
get_reward({55, 2}) ->
    #{lev => 55, type => 2, right_exp => 6623,
      right_pet_exp => 3311, right_coin => 0,
      wrong_exp => 3312, wrong_pet_exp => 1656,
      wrong_coin => 0};
get_reward({56, 2}) ->
    #{lev => 56, type => 2, right_exp => 6847,
      right_pet_exp => 3424, right_coin => 0,
      wrong_exp => 3424, wrong_pet_exp => 1712,
      wrong_coin => 0};
get_reward({57, 2}) ->
    #{lev => 57, type => 2, right_exp => 6924,
      right_pet_exp => 3462, right_coin => 0,
      wrong_exp => 3462, wrong_pet_exp => 1731,
      wrong_coin => 0};
get_reward({58, 2}) ->
    #{lev => 58, type => 2, right_exp => 7024,
      right_pet_exp => 3512, right_coin => 0,
      wrong_exp => 3512, wrong_pet_exp => 1756,
      wrong_coin => 0};
get_reward({59, 2}) ->
    #{lev => 59, type => 2, right_exp => 7102,
      right_pet_exp => 3551, right_coin => 0,
      wrong_exp => 3551, wrong_pet_exp => 1776,
      wrong_coin => 0};
get_reward({60, 2}) ->
    #{lev => 60, type => 2, right_exp => 7179,
      right_pet_exp => 3589, right_coin => 0,
      wrong_exp => 3590, wrong_pet_exp => 1795,
      wrong_coin => 0};
get_reward({61, 2}) ->
    #{lev => 61, type => 2, right_exp => 7417,
      right_pet_exp => 3709, right_coin => 0,
      wrong_exp => 3709, wrong_pet_exp => 1855,
      wrong_coin => 0};
get_reward({62, 2}) ->
    #{lev => 62, type => 2, right_exp => 7504,
      right_pet_exp => 3752, right_coin => 0,
      wrong_exp => 3752, wrong_pet_exp => 1876,
      wrong_coin => 0};
get_reward({63, 2}) ->
    #{lev => 63, type => 2, right_exp => 7589,
      right_pet_exp => 3794, right_coin => 0,
      wrong_exp => 3795, wrong_pet_exp => 1897,
      wrong_coin => 0};
get_reward({64, 2}) ->
    #{lev => 64, type => 2, right_exp => 7665,
      right_pet_exp => 3832, right_coin => 0,
      wrong_exp => 3833, wrong_pet_exp => 1916,
      wrong_coin => 0};
get_reward({65, 2}) ->
    #{lev => 65, type => 2, right_exp => 7751,
      right_pet_exp => 3875, right_coin => 0,
      wrong_exp => 3876, wrong_pet_exp => 1938,
      wrong_coin => 0};
get_reward({66, 2}) ->
    #{lev => 66, type => 2, right_exp => 7836,
      right_pet_exp => 3918, right_coin => 0,
      wrong_exp => 3918, wrong_pet_exp => 1959,
      wrong_coin => 0};
get_reward({67, 2}) ->
    #{lev => 67, type => 2, right_exp => 7926,
      right_pet_exp => 3963, right_coin => 0,
      wrong_exp => 3963, wrong_pet_exp => 1982,
      wrong_coin => 0};
get_reward({68, 2}) ->
    #{lev => 68, type => 2, right_exp => 8017,
      right_pet_exp => 4009, right_coin => 0,
      wrong_exp => 4009, wrong_pet_exp => 2005,
      wrong_coin => 0};
get_reward({69, 2}) ->
    #{lev => 69, type => 2, right_exp => 8103,
      right_pet_exp => 4052, right_coin => 0,
      wrong_exp => 4052, wrong_pet_exp => 2026,
      wrong_coin => 0};
get_reward({70, 2}) ->
    #{lev => 70, type => 2, right_exp => 8177,
      right_pet_exp => 4088, right_coin => 0,
      wrong_exp => 4089, wrong_pet_exp => 2044,
      wrong_coin => 0};
get_reward({71, 2}) ->
    #{lev => 71, type => 2, right_exp => 8265,
      right_pet_exp => 4133, right_coin => 0,
      wrong_exp => 4133, wrong_pet_exp => 2067,
      wrong_coin => 0};
get_reward({72, 2}) ->
    #{lev => 72, type => 2, right_exp => 8353,
      right_pet_exp => 4177, right_coin => 0,
      wrong_exp => 4177, wrong_pet_exp => 2089,
      wrong_coin => 0};
get_reward({73, 2}) ->
    #{lev => 73, type => 2, right_exp => 8441,
      right_pet_exp => 4221, right_coin => 0,
      wrong_exp => 4221, wrong_pet_exp => 2111,
      wrong_coin => 0};
get_reward({74, 2}) ->
    #{lev => 74, type => 2, right_exp => 8530,
      right_pet_exp => 4265, right_coin => 0,
      wrong_exp => 4265, wrong_pet_exp => 2133,
      wrong_coin => 0};
get_reward({75, 2}) ->
    #{lev => 75, type => 2, right_exp => 8619,
      right_pet_exp => 4309, right_coin => 0,
      wrong_exp => 4310, wrong_pet_exp => 2155,
      wrong_coin => 0};
get_reward({76, 2}) ->
    #{lev => 76, type => 2, right_exp => 8709,
      right_pet_exp => 4354, right_coin => 0,
      wrong_exp => 4355, wrong_pet_exp => 2177,
      wrong_coin => 0};
get_reward({77, 2}) ->
    #{lev => 77, type => 2, right_exp => 8799,
      right_pet_exp => 4399, right_coin => 0,
      wrong_exp => 4400, wrong_pet_exp => 2200,
      wrong_coin => 0};
get_reward({78, 2}) ->
    #{lev => 78, type => 2, right_exp => 8887,
      right_pet_exp => 4444, right_coin => 0,
      wrong_exp => 4444, wrong_pet_exp => 2222,
      wrong_coin => 0};
get_reward({79, 2}) ->
    #{lev => 79, type => 2, right_exp => 8976,
      right_pet_exp => 4488, right_coin => 0,
      wrong_exp => 4488, wrong_pet_exp => 2244,
      wrong_coin => 0};
get_reward({80, 2}) ->
    #{lev => 80, type => 2, right_exp => 9063,
      right_pet_exp => 4531, right_coin => 0,
      wrong_exp => 4532, wrong_pet_exp => 2266,
      wrong_coin => 0};
get_reward({81, 2}) ->
    #{lev => 81, type => 2, right_exp => 9744,
      right_pet_exp => 4872, right_coin => 0,
      wrong_exp => 4872, wrong_pet_exp => 2436,
      wrong_coin => 0};
get_reward({82, 2}) ->
    #{lev => 82, type => 2, right_exp => 9850,
      right_pet_exp => 4925, right_coin => 0,
      wrong_exp => 4925, wrong_pet_exp => 2463,
      wrong_coin => 0};
get_reward({83, 2}) ->
    #{lev => 83, type => 2, right_exp => 9940,
      right_pet_exp => 4970, right_coin => 0,
      wrong_exp => 4970, wrong_pet_exp => 2485,
      wrong_coin => 0};
get_reward({84, 2}) ->
    #{lev => 84, type => 2, right_exp => 10029,
      right_pet_exp => 5014, right_coin => 0,
      wrong_exp => 5015, wrong_pet_exp => 2507,
      wrong_coin => 0};
get_reward({85, 2}) ->
    #{lev => 85, type => 2, right_exp => 10119,
      right_pet_exp => 5059, right_coin => 0,
      wrong_exp => 5060, wrong_pet_exp => 2530,
      wrong_coin => 0};
get_reward({86, 2}) ->
    #{lev => 86, type => 2, right_exp => 10206,
      right_pet_exp => 5103, right_coin => 0,
      wrong_exp => 5103, wrong_pet_exp => 2552,
      wrong_coin => 0};
get_reward({87, 2}) ->
    #{lev => 87, type => 2, right_exp => 10295,
      right_pet_exp => 5147, right_coin => 0,
      wrong_exp => 5148, wrong_pet_exp => 2574,
      wrong_coin => 0};
get_reward({88, 2}) ->
    #{lev => 88, type => 2, right_exp => 10402,
      right_pet_exp => 5201, right_coin => 0,
      wrong_exp => 5201, wrong_pet_exp => 2601,
      wrong_coin => 0};
get_reward({89, 2}) ->
    #{lev => 89, type => 2, right_exp => 10491,
      right_pet_exp => 5245, right_coin => 0,
      wrong_exp => 5246, wrong_pet_exp => 2623,
      wrong_coin => 0};
get_reward({90, 2}) ->
    #{lev => 90, type => 2, right_exp => 10579,
      right_pet_exp => 5289, right_coin => 0,
      wrong_exp => 5290, wrong_pet_exp => 2645,
      wrong_coin => 0};
get_reward({91, 2}) ->
    #{lev => 91, type => 2, right_exp => 10667,
      right_pet_exp => 5334, right_coin => 0,
      wrong_exp => 5334, wrong_pet_exp => 2667,
      wrong_coin => 0};
get_reward({92, 2}) ->
    #{lev => 92, type => 2, right_exp => 10775,
      right_pet_exp => 5387, right_coin => 0,
      wrong_exp => 5388, wrong_pet_exp => 2694,
      wrong_coin => 0};
get_reward({93, 2}) ->
    #{lev => 93, type => 2, right_exp => 10864,
      right_pet_exp => 5432, right_coin => 0,
      wrong_exp => 5432, wrong_pet_exp => 2716,
      wrong_coin => 0};
get_reward({94, 2}) ->
    #{lev => 94, type => 2, right_exp => 10952,
      right_pet_exp => 5476, right_coin => 0,
      wrong_exp => 5476, wrong_pet_exp => 2738,
      wrong_coin => 0};
get_reward({95, 2}) ->
    #{lev => 95, type => 2, right_exp => 11059,
      right_pet_exp => 5529, right_coin => 0,
      wrong_exp => 5530, wrong_pet_exp => 2765,
      wrong_coin => 0};
get_reward({96, 2}) ->
    #{lev => 96, type => 2, right_exp => 11147,
      right_pet_exp => 5573, right_coin => 0,
      wrong_exp => 5574, wrong_pet_exp => 2787,
      wrong_coin => 0};
get_reward({97, 2}) ->
    #{lev => 97, type => 2, right_exp => 11236,
      right_pet_exp => 5618, right_coin => 0,
      wrong_exp => 5618, wrong_pet_exp => 2809,
      wrong_coin => 0};
get_reward({98, 2}) ->
    #{lev => 98, type => 2, right_exp => 11343,
      right_pet_exp => 5671, right_coin => 0,
      wrong_exp => 5672, wrong_pet_exp => 2836,
      wrong_coin => 0};
get_reward({99, 2}) ->
    #{lev => 99, type => 2, right_exp => 11432,
      right_pet_exp => 5716, right_coin => 0,
      wrong_exp => 5716, wrong_pet_exp => 2858,
      wrong_coin => 0};
get_reward({100, 2}) ->
    #{lev => 100, type => 2, right_exp => 11546,
      right_pet_exp => 5773, right_coin => 0,
      wrong_exp => 5773, wrong_pet_exp => 2886,
      wrong_coin => 0};
get_reward({101, 2}) ->
    #{lev => 101, type => 2, right_exp => 11661,
      right_pet_exp => 5830, right_coin => 0,
      wrong_exp => 5830, wrong_pet_exp => 2914,
      wrong_coin => 0};
get_reward({102, 2}) ->
    #{lev => 102, type => 2, right_exp => 11777,
      right_pet_exp => 5888, right_coin => 0,
      wrong_exp => 5888, wrong_pet_exp => 2943,
      wrong_coin => 0};
get_reward({103, 2}) ->
    #{lev => 103, type => 2, right_exp => 11894,
      right_pet_exp => 5946, right_coin => 0,
      wrong_exp => 5946, wrong_pet_exp => 2972,
      wrong_coin => 0};
get_reward({104, 2}) ->
    #{lev => 104, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({105, 2}) ->
    #{lev => 105, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({106, 2}) ->
    #{lev => 106, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({107, 2}) ->
    #{lev => 107, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({108, 2}) ->
    #{lev => 108, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({109, 2}) ->
    #{lev => 109, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({110, 2}) ->
    #{lev => 110, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({111, 2}) ->
    #{lev => 111, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({112, 2}) ->
    #{lev => 112, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({113, 2}) ->
    #{lev => 113, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({114, 2}) ->
    #{lev => 114, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({115, 2}) ->
    #{lev => 115, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({116, 2}) ->
    #{lev => 116, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({117, 2}) ->
    #{lev => 117, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({118, 2}) ->
    #{lev => 118, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({119, 2}) ->
    #{lev => 119, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({120, 2}) ->
    #{lev => 120, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({121, 2}) ->
    #{lev => 121, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({122, 2}) ->
    #{lev => 122, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({123, 2}) ->
    #{lev => 123, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({124, 2}) ->
    #{lev => 124, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({125, 2}) ->
    #{lev => 125, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({126, 2}) ->
    #{lev => 126, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({127, 2}) ->
    #{lev => 127, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({128, 2}) ->
    #{lev => 128, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({129, 2}) ->
    #{lev => 129, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({130, 2}) ->
    #{lev => 130, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({131, 2}) ->
    #{lev => 131, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({132, 2}) ->
    #{lev => 132, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({133, 2}) ->
    #{lev => 133, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({134, 2}) ->
    #{lev => 134, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({135, 2}) ->
    #{lev => 135, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({136, 2}) ->
    #{lev => 136, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({137, 2}) ->
    #{lev => 137, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({138, 2}) ->
    #{lev => 138, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({139, 2}) ->
    #{lev => 139, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({140, 2}) ->
    #{lev => 140, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({141, 2}) ->
    #{lev => 141, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({142, 2}) ->
    #{lev => 142, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({143, 2}) ->
    #{lev => 143, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({144, 2}) ->
    #{lev => 144, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({145, 2}) ->
    #{lev => 145, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({146, 2}) ->
    #{lev => 146, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({147, 2}) ->
    #{lev => 147, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({148, 2}) ->
    #{lev => 148, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({149, 2}) ->
    #{lev => 149, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({150, 2}) ->
    #{lev => 150, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({151, 2}) ->
    #{lev => 151, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({152, 2}) ->
    #{lev => 152, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({153, 2}) ->
    #{lev => 153, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({154, 2}) ->
    #{lev => 154, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({155, 2}) ->
    #{lev => 155, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({156, 2}) ->
    #{lev => 156, type => 2, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({1, 3}) ->
    #{lev => 1, type => 3, right_exp => 0,
      right_pet_exp => 1165, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 583, wrong_coin => 0};
get_reward({2, 3}) ->
    #{lev => 2, type => 3, right_exp => 0,
      right_pet_exp => 1191, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 596, wrong_coin => 0};
get_reward({3, 3}) ->
    #{lev => 3, type => 3, right_exp => 0,
      right_pet_exp => 1226, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 613, wrong_coin => 0};
get_reward({4, 3}) ->
    #{lev => 4, type => 3, right_exp => 0,
      right_pet_exp => 1261, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 631, wrong_coin => 0};
get_reward({5, 3}) ->
    #{lev => 5, type => 3, right_exp => 0,
      right_pet_exp => 1287, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 644, wrong_coin => 0};
get_reward({6, 3}) ->
    #{lev => 6, type => 3, right_exp => 0,
      right_pet_exp => 1322, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 661, wrong_coin => 0};
get_reward({7, 3}) ->
    #{lev => 7, type => 3, right_exp => 0,
      right_pet_exp => 1357, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 679, wrong_coin => 0};
get_reward({8, 3}) ->
    #{lev => 8, type => 3, right_exp => 0,
      right_pet_exp => 1383, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 692, wrong_coin => 0};
get_reward({9, 3}) ->
    #{lev => 9, type => 3, right_exp => 0,
      right_pet_exp => 1417, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 709, wrong_coin => 0};
get_reward({10, 3}) ->
    #{lev => 10, type => 3, right_exp => 0,
      right_pet_exp => 1452, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 726, wrong_coin => 0};
get_reward({11, 3}) ->
    #{lev => 11, type => 3, right_exp => 0,
      right_pet_exp => 1487, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 744, wrong_coin => 0};
get_reward({12, 3}) ->
    #{lev => 12, type => 3, right_exp => 0,
      right_pet_exp => 1522, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 761, wrong_coin => 0};
get_reward({13, 3}) ->
    #{lev => 13, type => 3, right_exp => 0,
      right_pet_exp => 1548, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 774, wrong_coin => 0};
get_reward({14, 3}) ->
    #{lev => 14, type => 3, right_exp => 0,
      right_pet_exp => 1583, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 792, wrong_coin => 0};
get_reward({15, 3}) ->
    #{lev => 15, type => 3, right_exp => 0,
      right_pet_exp => 1617, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 809, wrong_coin => 0};
get_reward({16, 3}) ->
    #{lev => 16, type => 3, right_exp => 0,
      right_pet_exp => 1652, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 826, wrong_coin => 0};
get_reward({17, 3}) ->
    #{lev => 17, type => 3, right_exp => 0,
      right_pet_exp => 1687, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 844, wrong_coin => 0};
get_reward({18, 3}) ->
    #{lev => 18, type => 3, right_exp => 0,
      right_pet_exp => 1722, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 861, wrong_coin => 0};
get_reward({19, 3}) ->
    #{lev => 19, type => 3, right_exp => 0,
      right_pet_exp => 1757, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 879, wrong_coin => 0};
get_reward({20, 3}) ->
    #{lev => 20, type => 3, right_exp => 0,
      right_pet_exp => 1791, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 896, wrong_coin => 0};
get_reward({21, 3}) ->
    #{lev => 21, type => 3, right_exp => 0,
      right_pet_exp => 1826, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 913, wrong_coin => 0};
get_reward({22, 3}) ->
    #{lev => 22, type => 3, right_exp => 0,
      right_pet_exp => 1861, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 931, wrong_coin => 0};
get_reward({23, 3}) ->
    #{lev => 23, type => 3, right_exp => 0,
      right_pet_exp => 1896, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 948, wrong_coin => 0};
get_reward({24, 3}) ->
    #{lev => 24, type => 3, right_exp => 0,
      right_pet_exp => 1931, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 966, wrong_coin => 0};
get_reward({25, 3}) ->
    #{lev => 25, type => 3, right_exp => 0,
      right_pet_exp => 1965, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 983, wrong_coin => 0};
get_reward({26, 3}) ->
    #{lev => 26, type => 3, right_exp => 0,
      right_pet_exp => 2000, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1000, wrong_coin => 0};
get_reward({27, 3}) ->
    #{lev => 27, type => 3, right_exp => 0,
      right_pet_exp => 2035, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1018, wrong_coin => 0};
get_reward({28, 3}) ->
    #{lev => 28, type => 3, right_exp => 0,
      right_pet_exp => 2070, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1035, wrong_coin => 0};
get_reward({29, 3}) ->
    #{lev => 29, type => 3, right_exp => 0,
      right_pet_exp => 2104, right_coin => 0, wrong_exp => 0,
      wrong_pet_exp => 1052, wrong_coin => 0};
get_reward({30, 3}) ->
    #{lev => 30, type => 3, right_exp => 4278,
      right_pet_exp => 2139, right_coin => 0,
      wrong_exp => 2139, wrong_pet_exp => 1070,
      wrong_coin => 0};
get_reward({31, 3}) ->
    #{lev => 31, type => 3, right_exp => 4535,
      right_pet_exp => 2267, right_coin => 0,
      wrong_exp => 2268, wrong_pet_exp => 1134,
      wrong_coin => 0};
get_reward({32, 3}) ->
    #{lev => 32, type => 3, right_exp => 4661,
      right_pet_exp => 2330, right_coin => 0,
      wrong_exp => 2331, wrong_pet_exp => 1165,
      wrong_coin => 0};
get_reward({33, 3}) ->
    #{lev => 33, type => 3, right_exp => 4679,
      right_pet_exp => 2340, right_coin => 0,
      wrong_exp => 2340, wrong_pet_exp => 1170,
      wrong_coin => 0};
get_reward({34, 3}) ->
    #{lev => 34, type => 3, right_exp => 4842,
      right_pet_exp => 2421, right_coin => 0,
      wrong_exp => 2421, wrong_pet_exp => 1211,
      wrong_coin => 0};
get_reward({35, 3}) ->
    #{lev => 35, type => 3, right_exp => 4944,
      right_pet_exp => 2472, right_coin => 0,
      wrong_exp => 2472, wrong_pet_exp => 1236,
      wrong_coin => 0};
get_reward({36, 3}) ->
    #{lev => 36, type => 3, right_exp => 4937,
      right_pet_exp => 2468, right_coin => 0,
      wrong_exp => 2469, wrong_pet_exp => 1234,
      wrong_coin => 0};
get_reward({37, 3}) ->
    #{lev => 37, type => 3, right_exp => 4993,
      right_pet_exp => 2496, right_coin => 0,
      wrong_exp => 2497, wrong_pet_exp => 1248,
      wrong_coin => 0};
get_reward({38, 3}) ->
    #{lev => 38, type => 3, right_exp => 5121,
      right_pet_exp => 2560, right_coin => 0,
      wrong_exp => 2561, wrong_pet_exp => 1280,
      wrong_coin => 0};
get_reward({39, 3}) ->
    #{lev => 39, type => 3, right_exp => 5204,
      right_pet_exp => 2602, right_coin => 0,
      wrong_exp => 2602, wrong_pet_exp => 1301,
      wrong_coin => 0};
get_reward({40, 3}) ->
    #{lev => 40, type => 3, right_exp => 5290,
      right_pet_exp => 2645, right_coin => 0,
      wrong_exp => 2645, wrong_pet_exp => 1323,
      wrong_coin => 0};
get_reward({41, 3}) ->
    #{lev => 41, type => 3, right_exp => 5490,
      right_pet_exp => 2745, right_coin => 0,
      wrong_exp => 2745, wrong_pet_exp => 1373,
      wrong_coin => 0};
get_reward({42, 3}) ->
    #{lev => 42, type => 3, right_exp => 5593,
      right_pet_exp => 2796, right_coin => 0,
      wrong_exp => 2797, wrong_pet_exp => 1398,
      wrong_coin => 0};
get_reward({43, 3}) ->
    #{lev => 43, type => 3, right_exp => 5671,
      right_pet_exp => 2835, right_coin => 0,
      wrong_exp => 2836, wrong_pet_exp => 1418,
      wrong_coin => 0};
get_reward({44, 3}) ->
    #{lev => 44, type => 3, right_exp => 5737,
      right_pet_exp => 2868, right_coin => 0,
      wrong_exp => 2869, wrong_pet_exp => 1434,
      wrong_coin => 0};
get_reward({45, 3}) ->
    #{lev => 45, type => 3, right_exp => 5829,
      right_pet_exp => 2915, right_coin => 0,
      wrong_exp => 2915, wrong_pet_exp => 1458,
      wrong_coin => 0};
get_reward({46, 3}) ->
    #{lev => 46, type => 3, right_exp => 5888,
      right_pet_exp => 2944, right_coin => 0,
      wrong_exp => 2944, wrong_pet_exp => 1472,
      wrong_coin => 0};
get_reward({47, 3}) ->
    #{lev => 47, type => 3, right_exp => 5978,
      right_pet_exp => 2989, right_coin => 0,
      wrong_exp => 2989, wrong_pet_exp => 1495,
      wrong_coin => 0};
get_reward({48, 3}) ->
    #{lev => 48, type => 3, right_exp => 6034,
      right_pet_exp => 3017, right_coin => 0,
      wrong_exp => 3017, wrong_pet_exp => 1509,
      wrong_coin => 0};
get_reward({49, 3}) ->
    #{lev => 49, type => 3, right_exp => 6134,
      right_pet_exp => 3067, right_coin => 0,
      wrong_exp => 3067, wrong_pet_exp => 1534,
      wrong_coin => 0};
get_reward({50, 3}) ->
    #{lev => 50, type => 3, right_exp => 6216,
      right_pet_exp => 3108, right_coin => 0,
      wrong_exp => 3108, wrong_pet_exp => 1554,
      wrong_coin => 0};
get_reward({51, 3}) ->
    #{lev => 51, type => 3, right_exp => 6290,
      right_pet_exp => 3145, right_coin => 0,
      wrong_exp => 3145, wrong_pet_exp => 1573,
      wrong_coin => 0};
get_reward({52, 3}) ->
    #{lev => 52, type => 3, right_exp => 6365,
      right_pet_exp => 3183, right_coin => 0,
      wrong_exp => 3183, wrong_pet_exp => 1592,
      wrong_coin => 0};
get_reward({53, 3}) ->
    #{lev => 53, type => 3, right_exp => 6463,
      right_pet_exp => 3231, right_coin => 0,
      wrong_exp => 3232, wrong_pet_exp => 1616,
      wrong_coin => 0};
get_reward({54, 3}) ->
    #{lev => 54, type => 3, right_exp => 6548,
      right_pet_exp => 3274, right_coin => 0,
      wrong_exp => 3274, wrong_pet_exp => 1637,
      wrong_coin => 0};
get_reward({55, 3}) ->
    #{lev => 55, type => 3, right_exp => 6623,
      right_pet_exp => 3311, right_coin => 0,
      wrong_exp => 3312, wrong_pet_exp => 1656,
      wrong_coin => 0};
get_reward({56, 3}) ->
    #{lev => 56, type => 3, right_exp => 6847,
      right_pet_exp => 3424, right_coin => 0,
      wrong_exp => 3424, wrong_pet_exp => 1712,
      wrong_coin => 0};
get_reward({57, 3}) ->
    #{lev => 57, type => 3, right_exp => 6924,
      right_pet_exp => 3462, right_coin => 0,
      wrong_exp => 3462, wrong_pet_exp => 1731,
      wrong_coin => 0};
get_reward({58, 3}) ->
    #{lev => 58, type => 3, right_exp => 7024,
      right_pet_exp => 3512, right_coin => 0,
      wrong_exp => 3512, wrong_pet_exp => 1756,
      wrong_coin => 0};
get_reward({59, 3}) ->
    #{lev => 59, type => 3, right_exp => 7102,
      right_pet_exp => 3551, right_coin => 0,
      wrong_exp => 3551, wrong_pet_exp => 1776,
      wrong_coin => 0};
get_reward({60, 3}) ->
    #{lev => 60, type => 3, right_exp => 7179,
      right_pet_exp => 3589, right_coin => 0,
      wrong_exp => 3590, wrong_pet_exp => 1795,
      wrong_coin => 0};
get_reward({61, 3}) ->
    #{lev => 61, type => 3, right_exp => 7417,
      right_pet_exp => 3709, right_coin => 0,
      wrong_exp => 3709, wrong_pet_exp => 1855,
      wrong_coin => 0};
get_reward({62, 3}) ->
    #{lev => 62, type => 3, right_exp => 7504,
      right_pet_exp => 3752, right_coin => 0,
      wrong_exp => 3752, wrong_pet_exp => 1876,
      wrong_coin => 0};
get_reward({63, 3}) ->
    #{lev => 63, type => 3, right_exp => 7589,
      right_pet_exp => 3794, right_coin => 0,
      wrong_exp => 3795, wrong_pet_exp => 1897,
      wrong_coin => 0};
get_reward({64, 3}) ->
    #{lev => 64, type => 3, right_exp => 7665,
      right_pet_exp => 3832, right_coin => 0,
      wrong_exp => 3833, wrong_pet_exp => 1916,
      wrong_coin => 0};
get_reward({65, 3}) ->
    #{lev => 65, type => 3, right_exp => 7751,
      right_pet_exp => 3875, right_coin => 0,
      wrong_exp => 3876, wrong_pet_exp => 1938,
      wrong_coin => 0};
get_reward({66, 3}) ->
    #{lev => 66, type => 3, right_exp => 7836,
      right_pet_exp => 3918, right_coin => 0,
      wrong_exp => 3918, wrong_pet_exp => 1959,
      wrong_coin => 0};
get_reward({67, 3}) ->
    #{lev => 67, type => 3, right_exp => 7926,
      right_pet_exp => 3963, right_coin => 0,
      wrong_exp => 3963, wrong_pet_exp => 1982,
      wrong_coin => 0};
get_reward({68, 3}) ->
    #{lev => 68, type => 3, right_exp => 8017,
      right_pet_exp => 4009, right_coin => 0,
      wrong_exp => 4009, wrong_pet_exp => 2005,
      wrong_coin => 0};
get_reward({69, 3}) ->
    #{lev => 69, type => 3, right_exp => 8103,
      right_pet_exp => 4052, right_coin => 0,
      wrong_exp => 4052, wrong_pet_exp => 2026,
      wrong_coin => 0};
get_reward({70, 3}) ->
    #{lev => 70, type => 3, right_exp => 8177,
      right_pet_exp => 4088, right_coin => 0,
      wrong_exp => 4089, wrong_pet_exp => 2044,
      wrong_coin => 0};
get_reward({71, 3}) ->
    #{lev => 71, type => 3, right_exp => 8265,
      right_pet_exp => 4133, right_coin => 0,
      wrong_exp => 4133, wrong_pet_exp => 2067,
      wrong_coin => 0};
get_reward({72, 3}) ->
    #{lev => 72, type => 3, right_exp => 8353,
      right_pet_exp => 4177, right_coin => 0,
      wrong_exp => 4177, wrong_pet_exp => 2089,
      wrong_coin => 0};
get_reward({73, 3}) ->
    #{lev => 73, type => 3, right_exp => 8441,
      right_pet_exp => 4221, right_coin => 0,
      wrong_exp => 4221, wrong_pet_exp => 2111,
      wrong_coin => 0};
get_reward({74, 3}) ->
    #{lev => 74, type => 3, right_exp => 8530,
      right_pet_exp => 4265, right_coin => 0,
      wrong_exp => 4265, wrong_pet_exp => 2133,
      wrong_coin => 0};
get_reward({75, 3}) ->
    #{lev => 75, type => 3, right_exp => 8619,
      right_pet_exp => 4309, right_coin => 0,
      wrong_exp => 4310, wrong_pet_exp => 2155,
      wrong_coin => 0};
get_reward({76, 3}) ->
    #{lev => 76, type => 3, right_exp => 8709,
      right_pet_exp => 4354, right_coin => 0,
      wrong_exp => 4355, wrong_pet_exp => 2177,
      wrong_coin => 0};
get_reward({77, 3}) ->
    #{lev => 77, type => 3, right_exp => 8799,
      right_pet_exp => 4399, right_coin => 0,
      wrong_exp => 4400, wrong_pet_exp => 2200,
      wrong_coin => 0};
get_reward({78, 3}) ->
    #{lev => 78, type => 3, right_exp => 8887,
      right_pet_exp => 4444, right_coin => 0,
      wrong_exp => 4444, wrong_pet_exp => 2222,
      wrong_coin => 0};
get_reward({79, 3}) ->
    #{lev => 79, type => 3, right_exp => 8976,
      right_pet_exp => 4488, right_coin => 0,
      wrong_exp => 4488, wrong_pet_exp => 2244,
      wrong_coin => 0};
get_reward({80, 3}) ->
    #{lev => 80, type => 3, right_exp => 9063,
      right_pet_exp => 4531, right_coin => 0,
      wrong_exp => 4532, wrong_pet_exp => 2266,
      wrong_coin => 0};
get_reward({81, 3}) ->
    #{lev => 81, type => 3, right_exp => 9744,
      right_pet_exp => 4872, right_coin => 0,
      wrong_exp => 4872, wrong_pet_exp => 2436,
      wrong_coin => 0};
get_reward({82, 3}) ->
    #{lev => 82, type => 3, right_exp => 9850,
      right_pet_exp => 4925, right_coin => 0,
      wrong_exp => 4925, wrong_pet_exp => 2463,
      wrong_coin => 0};
get_reward({83, 3}) ->
    #{lev => 83, type => 3, right_exp => 9940,
      right_pet_exp => 4970, right_coin => 0,
      wrong_exp => 4970, wrong_pet_exp => 2485,
      wrong_coin => 0};
get_reward({84, 3}) ->
    #{lev => 84, type => 3, right_exp => 10029,
      right_pet_exp => 5014, right_coin => 0,
      wrong_exp => 5015, wrong_pet_exp => 2507,
      wrong_coin => 0};
get_reward({85, 3}) ->
    #{lev => 85, type => 3, right_exp => 10119,
      right_pet_exp => 5059, right_coin => 0,
      wrong_exp => 5060, wrong_pet_exp => 2530,
      wrong_coin => 0};
get_reward({86, 3}) ->
    #{lev => 86, type => 3, right_exp => 10206,
      right_pet_exp => 5103, right_coin => 0,
      wrong_exp => 5103, wrong_pet_exp => 2552,
      wrong_coin => 0};
get_reward({87, 3}) ->
    #{lev => 87, type => 3, right_exp => 10295,
      right_pet_exp => 5147, right_coin => 0,
      wrong_exp => 5148, wrong_pet_exp => 2574,
      wrong_coin => 0};
get_reward({88, 3}) ->
    #{lev => 88, type => 3, right_exp => 10402,
      right_pet_exp => 5201, right_coin => 0,
      wrong_exp => 5201, wrong_pet_exp => 2601,
      wrong_coin => 0};
get_reward({89, 3}) ->
    #{lev => 89, type => 3, right_exp => 10491,
      right_pet_exp => 5245, right_coin => 0,
      wrong_exp => 5246, wrong_pet_exp => 2623,
      wrong_coin => 0};
get_reward({90, 3}) ->
    #{lev => 90, type => 3, right_exp => 10579,
      right_pet_exp => 5289, right_coin => 0,
      wrong_exp => 5290, wrong_pet_exp => 2645,
      wrong_coin => 0};
get_reward({91, 3}) ->
    #{lev => 91, type => 3, right_exp => 10667,
      right_pet_exp => 5334, right_coin => 0,
      wrong_exp => 5334, wrong_pet_exp => 2667,
      wrong_coin => 0};
get_reward({92, 3}) ->
    #{lev => 92, type => 3, right_exp => 10775,
      right_pet_exp => 5387, right_coin => 0,
      wrong_exp => 5388, wrong_pet_exp => 2694,
      wrong_coin => 0};
get_reward({93, 3}) ->
    #{lev => 93, type => 3, right_exp => 10864,
      right_pet_exp => 5432, right_coin => 0,
      wrong_exp => 5432, wrong_pet_exp => 2716,
      wrong_coin => 0};
get_reward({94, 3}) ->
    #{lev => 94, type => 3, right_exp => 10952,
      right_pet_exp => 5476, right_coin => 0,
      wrong_exp => 5476, wrong_pet_exp => 2738,
      wrong_coin => 0};
get_reward({95, 3}) ->
    #{lev => 95, type => 3, right_exp => 11059,
      right_pet_exp => 5529, right_coin => 0,
      wrong_exp => 5530, wrong_pet_exp => 2765,
      wrong_coin => 0};
get_reward({96, 3}) ->
    #{lev => 96, type => 3, right_exp => 11147,
      right_pet_exp => 5573, right_coin => 0,
      wrong_exp => 5574, wrong_pet_exp => 2787,
      wrong_coin => 0};
get_reward({97, 3}) ->
    #{lev => 97, type => 3, right_exp => 11236,
      right_pet_exp => 5618, right_coin => 0,
      wrong_exp => 5618, wrong_pet_exp => 2809,
      wrong_coin => 0};
get_reward({98, 3}) ->
    #{lev => 98, type => 3, right_exp => 11343,
      right_pet_exp => 5671, right_coin => 0,
      wrong_exp => 5672, wrong_pet_exp => 2836,
      wrong_coin => 0};
get_reward({99, 3}) ->
    #{lev => 99, type => 3, right_exp => 11432,
      right_pet_exp => 5716, right_coin => 0,
      wrong_exp => 5716, wrong_pet_exp => 2858,
      wrong_coin => 0};
get_reward({100, 3}) ->
    #{lev => 100, type => 3, right_exp => 11546,
      right_pet_exp => 5773, right_coin => 0,
      wrong_exp => 5773, wrong_pet_exp => 2886,
      wrong_coin => 0};
get_reward({101, 3}) ->
    #{lev => 101, type => 3, right_exp => 11661,
      right_pet_exp => 5830, right_coin => 0,
      wrong_exp => 5830, wrong_pet_exp => 2914,
      wrong_coin => 0};
get_reward({102, 3}) ->
    #{lev => 102, type => 3, right_exp => 11777,
      right_pet_exp => 5888, right_coin => 0,
      wrong_exp => 5888, wrong_pet_exp => 2943,
      wrong_coin => 0};
get_reward({103, 3}) ->
    #{lev => 103, type => 3, right_exp => 11894,
      right_pet_exp => 5946, right_coin => 0,
      wrong_exp => 5946, wrong_pet_exp => 2972,
      wrong_coin => 0};
get_reward({104, 3}) ->
    #{lev => 104, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({105, 3}) ->
    #{lev => 105, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({106, 3}) ->
    #{lev => 106, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({107, 3}) ->
    #{lev => 107, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({108, 3}) ->
    #{lev => 108, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({109, 3}) ->
    #{lev => 109, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({110, 3}) ->
    #{lev => 110, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({111, 3}) ->
    #{lev => 111, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({112, 3}) ->
    #{lev => 112, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({113, 3}) ->
    #{lev => 113, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({114, 3}) ->
    #{lev => 114, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({115, 3}) ->
    #{lev => 115, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({116, 3}) ->
    #{lev => 116, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({117, 3}) ->
    #{lev => 117, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({118, 3}) ->
    #{lev => 118, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({119, 3}) ->
    #{lev => 119, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({120, 3}) ->
    #{lev => 120, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({121, 3}) ->
    #{lev => 121, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({122, 3}) ->
    #{lev => 122, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({123, 3}) ->
    #{lev => 123, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({124, 3}) ->
    #{lev => 124, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({125, 3}) ->
    #{lev => 125, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({126, 3}) ->
    #{lev => 126, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({127, 3}) ->
    #{lev => 127, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({128, 3}) ->
    #{lev => 128, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({129, 3}) ->
    #{lev => 129, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({130, 3}) ->
    #{lev => 130, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({131, 3}) ->
    #{lev => 131, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({132, 3}) ->
    #{lev => 132, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({133, 3}) ->
    #{lev => 133, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({134, 3}) ->
    #{lev => 134, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({135, 3}) ->
    #{lev => 135, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({136, 3}) ->
    #{lev => 136, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({137, 3}) ->
    #{lev => 137, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({138, 3}) ->
    #{lev => 138, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({139, 3}) ->
    #{lev => 139, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({140, 3}) ->
    #{lev => 140, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({141, 3}) ->
    #{lev => 141, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({142, 3}) ->
    #{lev => 142, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({143, 3}) ->
    #{lev => 143, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({144, 3}) ->
    #{lev => 144, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({145, 3}) ->
    #{lev => 145, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({146, 3}) ->
    #{lev => 146, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({147, 3}) ->
    #{lev => 147, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({148, 3}) ->
    #{lev => 148, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({149, 3}) ->
    #{lev => 149, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({150, 3}) ->
    #{lev => 150, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({151, 3}) ->
    #{lev => 151, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({152, 3}) ->
    #{lev => 152, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({153, 3}) ->
    #{lev => 153, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({154, 3}) ->
    #{lev => 154, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({155, 3}) ->
    #{lev => 155, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward({156, 3}) ->
    #{lev => 156, type => 3, right_exp => 12012,
      right_pet_exp => 6005, right_coin => 0,
      wrong_exp => 6005, wrong_pet_exp => 3001,
      wrong_coin => 0};
get_reward(_) -> false.

reward_item(1) ->
    [#{item_id => 0, item_num => 1,
       item_name => lang:get("无"), item_weight => 9000,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 60,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验心得"), item_weight => 200,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 200,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 40,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 160,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20060, item_num => 1,
       item_name => lang:get("阵法残卷"), item_weight => 160,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 60,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1},
     #{item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 20,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 1},
     #{item_id => 22210, item_num => 1,
       item_name => lang:get("优秀能量石"), item_weight => 100,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 1}];
reward_item(2) ->
    [#{item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 50,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验心得"), item_weight => 78,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 510,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 50,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20060, item_num => 1,
       item_name => lang:get("阵法残卷"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20091, item_num => 1,
       item_name => lang:get("一级宝石"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 40,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2},
     #{item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 6,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20054, item_num => 1,
       item_name => lang:get("凤羽"), item_weight => 6, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20055, item_num => 1,
       item_name => lang:get("龙骨"), item_weight => 6, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20056, item_num => 1,
       item_name => lang:get("虎爪"), item_weight => 6, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20057, item_num => 1,
       item_name => lang:get("蛇牙"), item_weight => 6, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 1,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 2},
     #{item_id => 0, item_num => 1,
       item_name => lang:get("无"), item_weight => 9000,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 2}];
reward_item(3) ->
    [#{item_id => 20000, item_num => 1,
       item_name => lang:get("一袋银币"), item_weight => 50,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20004, item_num => 1,
       item_name => lang:get("宠物经验心得"), item_weight => 90,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 400,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 80,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 21220, item_num => 1,
       item_name => lang:get("秘宝锤"), item_weight => 100,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20060, item_num => 1,
       item_name => lang:get("阵法残卷"), item_weight => 90,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20091, item_num => 1,
       item_name => lang:get("一级宝石"), item_weight => 100,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20615, item_num => 1,
       item_name => lang:get("星辰护符"), item_weight => 50,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3},
     #{item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 10,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20054, item_num => 1,
       item_name => lang:get("凤羽"), item_weight => 7, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20055, item_num => 1,
       item_name => lang:get("龙骨"), item_weight => 7, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20056, item_num => 1,
       item_name => lang:get("虎爪"), item_weight => 7, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20057, item_num => 1,
       item_name => lang:get("蛇牙"), item_weight => 7, sex => 2,
       classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 1,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 1, type => 3},
     #{item_id => 0, item_num => 1,
       item_name => lang:get("空白"), item_weight => 9000,
       sex => 2, classes => 0, lev_min => 20, lev_max => 200,
       announce => 0, type => 3}];
reward_item(_) -> [].

get_rank_reward(Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    #{rank_min => 1, rank_max => 1, items => [{23110, 1}],
      honor_id => 11046};
get_rank_reward(Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    #{rank_min => 2, rank_max => 2, items => [{23111, 1}],
      honor_id => 11056};
get_rank_reward(Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    #{rank_min => 3, rank_max => 3, items => [{23112, 1}],
      honor_id => 11078};
get_rank_reward(Rank)
    when Rank >= 4 andalso Rank =< 10 ->
    #{rank_min => 4, rank_max => 10, honor_id => 11055};
get_rank_reward(_) -> false.

get_ending_reward(Score)
    when Score >= 0 andalso Score =< 100 ->
    #{min => 0, max => 100,
      item_list => [{20006, 0, 5, 1000, 0}], exp_rate => 5};
get_ending_reward(Score)
    when Score >= 101 andalso Score =< 150 ->
    #{min => 101, max => 150,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 6};
get_ending_reward(Score)
    when Score >= 151 andalso Score =< 200 ->
    #{min => 151, max => 200,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 7};
get_ending_reward(Score)
    when Score >= 201 andalso Score =< 250 ->
    #{min => 201, max => 250,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 8};
get_ending_reward(Score)
    when Score >= 251 andalso Score =< 300 ->
    #{min => 251, max => 300,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 9};
get_ending_reward(Score)
    when Score >= 301 andalso Score =< 350 ->
    #{min => 301, max => 350,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 10};
get_ending_reward(Score)
    when Score >= 351 andalso Score =< 400 ->
    #{min => 351, max => 400,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 11};
get_ending_reward(Score)
    when Score >= 401 andalso Score =< 450 ->
    #{min => 401, max => 450,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 12};
get_ending_reward(Score)
    when Score >= 451 andalso Score =< 500 ->
    #{min => 451, max => 500,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 13};
get_ending_reward(Score)
    when Score >= 501 andalso Score =< 550 ->
    #{min => 501, max => 550,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 14};
get_ending_reward(Score)
    when Score >= 551 andalso Score =< 600 ->
    #{min => 551, max => 600,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 15};
get_ending_reward(Score)
    when Score >= 601 andalso Score =< 650 ->
    #{min => 601, max => 650,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 16};
get_ending_reward(Score)
    when Score >= 651 andalso Score =< 999999 ->
    #{min => 651, max => 999999,
      item_list =>
          [{20006, 0, 10, 180, 0},
           {21220, 0, 2, 180, 0},
           {20046, 0, 1, 20, 1},
           {20021, 0, 1, 70, 0},
           {20022, 0, 1, 10, 1},
           {20025, 0, 1, 150, 0},
           {20000, 0, 1, 160, 0},
           {20087, 0, 1, 124, 1},
           {20074, 0, 1, 35, 0},
           {21100, 0, 1, 26, 1},
           {20095, 0, 1, 5, 1},
           {20075, 0, 1, 3, 1},
           {20008, 0, 1, 15, 0},
           {20009, 0, 1, 3, 1},
           {20010, 0, 1, 1, 1},
           {20014, 0, 1, 3, 1},
           {20076, 0, 1, 2, 1},
           {20616, 0, 1, 10, 1}],
      exp_rate => 18};
get_ending_reward(_) -> false.

