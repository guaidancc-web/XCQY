-file("src/data/camp_cake_data.erl", 1).

-module(camp_cake_data).

-export([get_base/1,
         time_list/0,
         get_time/1,
         quests/1,
         get/1,
         questions/0,
         get_answer/1,
         get_box/1,
         buffs/0,
         get_reward/1]).

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

-file("src/data/camp_cake_data.erl", 24).

-file("inc/camp_cake.hrl", 1).

-record(m_camp_cake,
        {round = 0,
         quest_id = 0,
         pre_quest_id = 0,
         quest_flag = 0,
         step_finish = 0,
         step = 0,
         step_flag = 0,
         step_info = [],
         sub_quest_flag = 0,
         reward = []}).

-record(camp_cake_step,
        {key = {0, 0}, type = 0, id = 0, statues = 0}).

-record(camp_cake_role,
        {id = {0, "", 0},
         lev = 0,
         start_time = 0,
         end_time = 0}).

-record(camp_cake_data,
        {round = 0,
         quest = 0,
         next_quest = 0,
         step = [],
         step_info = [],
         sub_quest_info = [],
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         extra_reward = [],
         extra_exp_mod = 0,
         extra_exp_radio = 0,
         extra_reward_fail = [],
         extra_exp_mod_fail = 0,
         extra_exp_radio_fail = 0,
         buff = []}).

-record(camp_cake_reward_data,
        {key = 0,
         id = 0,
         is_add = 0,
         is_succ = 0,
         ratio = 0,
         reward = [],
         reward2 = [],
         exp_mode = 0,
         exp_radio = 0}).

-file("src/data/camp_cake_data.erl", 25).

get_base(1) -> [1000];
get_base(2) -> [10001];
get_base(3) -> [500];
get_base(4) -> [{23730, 1}];
get_base(5) -> [30004];
get_base(6) -> [{1, 100}, {0, 900}];
get_base(_) -> false.

time_list() -> [1, 2, 3, 4].

get_time(1) -> {1475283600, 1475335800};
get_time(2) -> {1475456400, 1475508600};
get_time(3) -> {1475629200, 1475681400};
get_time(4) -> {1475802000, 1475854200};
get_time(_) -> false.

quests(1) -> [82050];
quests(2) -> [82051];
quests(3) -> [82052];
quests(_) -> [].

buffs() -> [[{30004, 1000, 1}], [], []].

get({1, 82050}) ->
    #camp_cake_data{round = 1, quest = 82050,
                    next_quest = 82051,
                    step = [{10, 300}, {30, 300}, {20, 300}],
                    step_info =
                        [{1, 76850, 100}, {1, 76860, 100}, {2, 3, 800}],
                    sub_quest_info =
                        [{0, 550},
                         {82000, 50},
                         {82001, 50},
                         {82002, 50},
                         {82003, 50},
                         {82004, 50},
                         {82005, 50},
                         {82006, 50},
                         {82007, 50},
                         {82008, 50}],
                    buff = [{30004, 1000, 1}]};
get({2, 82051}) ->
    #camp_cake_data{round = 2, quest = 82051,
                    next_quest = 82052,
                    step = [{10, 300}, {20, 300}, {15, 300}],
                    step_info =
                        [{1, 76850, 100}, {1, 76860, 100}, {1, 76870, 100}],
                    sub_quest_info =
                        [{0, 550},
                         {82010, 50},
                         {82011, 50},
                         {82012, 50},
                         {82013, 50},
                         {82014, 50},
                         {82015, 50},
                         {82016, 50},
                         {82017, 50},
                         {82018, 50}],
                    buff = []};
get({3, 82052}) ->
    #camp_cake_data{round = 3, quest = 82052,
                    step = [{20, 300}, {30, 300}, {10, 300}],
                    step_info = [{1, 76870, 300}, {2, 3, 700}], buff = []};
get(_) -> false.

questions() ->
    [10001,
     10002,
     10003,
     10004,
     10005,
     10006,
     10007,
     10008,
     10009,
     10010,
     10011,
     10012,
     10013,
     10014,
     10015,
     10016,
     10017,
     10018,
     10019,
     10020,
     10021,
     10022,
     10023,
     10024,
     10025,
     10026,
     10027,
     10028,
     10029,
     10030,
     10031,
     10032,
     10033,
     10034,
     10035,
     10036].

get_answer(10001) -> 1;
get_answer(10002) -> 2;
get_answer(10003) -> 1;
get_answer(10004) -> 2;
get_answer(10005) -> 2;
get_answer(10006) -> 3;
get_answer(10007) -> 3;
get_answer(10008) -> 4;
get_answer(10009) -> 1;
get_answer(10010) -> 3;
get_answer(10011) -> 2;
get_answer(10012) -> 2;
get_answer(10013) -> 3;
get_answer(10014) -> 3;
get_answer(10015) -> 2;
get_answer(10016) -> 2;
get_answer(10017) -> 1;
get_answer(10018) -> 3;
get_answer(10019) -> 2;
get_answer(10020) -> 2;
get_answer(10021) -> 2;
get_answer(10022) -> 1;
get_answer(10023) -> 3;
get_answer(10024) -> 4;
get_answer(10025) -> 4;
get_answer(10026) -> 3;
get_answer(10027) -> 2;
get_answer(10028) -> 1;
get_answer(10029) -> 3;
get_answer(10030) -> 1;
get_answer(10031) -> 1;
get_answer(10032) -> 2;
get_answer(10033) -> 3;
get_answer(10034) -> 3;
get_answer(10035) -> 4;
get_answer(10036) -> 1;
get_answer(_) -> 0.

get_box(76890) ->
    [#{item_id => 20006, num => 4, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20013, num => 1, ratio => 60,
       show_ratio => 60, is_cast => 0},
     #{item_id => 20045, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20046, num => 1, ratio => 10,
       show_ratio => 10, is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 21101, num => 1, ratio => 10,
       show_ratio => 10, is_cast => 1},
     #{item_id => 20052, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 80,
       show_ratio => 80, is_cast => 1},
     #{item_id => 20616, num => 1, ratio => 5,
       show_ratio => 5, is_cast => 1},
     #{item_id => 20617, num => 1, ratio => 1,
       show_ratio => 1, is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 2,
       show_ratio => 2, is_cast => 1},
     #{item_id => 20075, num => 1, ratio => 3,
       show_ratio => 3, is_cast => 1},
     #{item_id => 20021, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 29104, num => 1, ratio => 30,
       show_ratio => 30, is_cast => 0},
     #{item_id => 20020, num => 2, ratio => 30,
       show_ratio => 30, is_cast => 0},
     #{item_id => 29120, num => 1, ratio => 120,
       show_ratio => 120, is_cast => 0},
     #{item_id => 29052, num => 1, ratio => 100,
       show_ratio => 100, is_cast => 0},
     #{item_id => 20014, num => 1, ratio => 1,
       show_ratio => 1, is_cast => 1},
     #{item_id => 20007, num => 1, ratio => 51,
       show_ratio => 51, is_cast => 0},
     #{item_id => 23556, num => 1, ratio => 50,
       show_ratio => 50, is_cast => 0},
     #{item_id => 22216, num => 1, ratio => 30,
       show_ratio => 30, is_cast => 1},
     #{item_id => 21422, num => 1, ratio => 20,
       show_ratio => 20, is_cast => 1},
     #{item_id => 21421, num => 1, ratio => 37,
       show_ratio => 37, is_cast => 0}];
get_box(_) -> [].

get_reward({1, 1, 1}) ->
    #camp_cake_reward_data{key = 1, id = 1, is_succ = 1,
                           is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({1, 0, 1}) ->
    #camp_cake_reward_data{key = 2, id = 1, is_succ = 0,
                           is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 400};
get_reward({1, 1, 0}) ->
    #camp_cake_reward_data{key = 3, id = 1, is_succ = 1,
                           is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({1, 0, 0}) ->
    #camp_cake_reward_data{key = 4, id = 1, is_succ = 0,
                           is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 275};
get_reward({2, 1, 1}) ->
    #camp_cake_reward_data{key = 5, id = 2, is_succ = 1,
                           is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({2, 0, 1}) ->
    #camp_cake_reward_data{key = 6, id = 2, is_succ = 0,
                           is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 400};
get_reward({2, 1, 0}) ->
    #camp_cake_reward_data{key = 7, id = 2, is_succ = 1,
                           is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({2, 0, 0}) ->
    #camp_cake_reward_data{key = 8, id = 2, is_succ = 0,
                           is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 275};
get_reward({82000, 1, 1}) ->
    #camp_cake_reward_data{key = 9, id = 82000, is_succ = 1,
                           is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82001, 1, 1}) ->
    #camp_cake_reward_data{key = 10, id = 82001,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82002, 1, 1}) ->
    #camp_cake_reward_data{key = 11, id = 82002,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82003, 1, 1}) ->
    #camp_cake_reward_data{key = 12, id = 82003,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82004, 1, 1}) ->
    #camp_cake_reward_data{key = 13, id = 82004,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82005, 1, 1}) ->
    #camp_cake_reward_data{key = 14, id = 82005,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82006, 1, 1}) ->
    #camp_cake_reward_data{key = 15, id = 82006,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82007, 1, 1}) ->
    #camp_cake_reward_data{key = 16, id = 82007,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82008, 1, 1}) ->
    #camp_cake_reward_data{key = 17, id = 82008,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82010, 1, 1}) ->
    #camp_cake_reward_data{key = 18, id = 82010,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82011, 1, 1}) ->
    #camp_cake_reward_data{key = 19, id = 82011,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82012, 1, 1}) ->
    #camp_cake_reward_data{key = 20, id = 82012,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82013, 1, 1}) ->
    #camp_cake_reward_data{key = 21, id = 82013,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82014, 1, 1}) ->
    #camp_cake_reward_data{key = 22, id = 82014,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82015, 1, 1}) ->
    #camp_cake_reward_data{key = 23, id = 82015,
                           is_succ = 1, is_add = 1, ratio = 700,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82016, 1, 1}) ->
    #camp_cake_reward_data{key = 24, id = 82016,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82017, 1, 1}) ->
    #camp_cake_reward_data{key = 25, id = 82017,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82018, 1, 1}) ->
    #camp_cake_reward_data{key = 26, id = 82018,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 800};
get_reward({82052, 1, 1}) ->
    #camp_cake_reward_data{key = 27, id = 82052,
                           is_succ = 1, is_add = 1, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           reward2 =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 5000};
get_reward({82000, 1, 0}) ->
    #camp_cake_reward_data{key = 28, id = 82000,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82001, 1, 0}) ->
    #camp_cake_reward_data{key = 29, id = 82001,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82002, 1, 0}) ->
    #camp_cake_reward_data{key = 30, id = 82002,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82003, 1, 0}) ->
    #camp_cake_reward_data{key = 31, id = 82003,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82004, 1, 0}) ->
    #camp_cake_reward_data{key = 32, id = 82004,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82005, 1, 0}) ->
    #camp_cake_reward_data{key = 33, id = 82005,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82006, 1, 0}) ->
    #camp_cake_reward_data{key = 34, id = 82006,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82007, 1, 0}) ->
    #camp_cake_reward_data{key = 35, id = 82007,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82008, 1, 0}) ->
    #camp_cake_reward_data{key = 36, id = 82008,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82010, 1, 0}) ->
    #camp_cake_reward_data{key = 37, id = 82010,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82011, 1, 0}) ->
    #camp_cake_reward_data{key = 38, id = 82011,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82012, 1, 0}) ->
    #camp_cake_reward_data{key = 39, id = 82012,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82013, 1, 0}) ->
    #camp_cake_reward_data{key = 40, id = 82013,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82014, 1, 0}) ->
    #camp_cake_reward_data{key = 41, id = 82014,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82015, 1, 0}) ->
    #camp_cake_reward_data{key = 42, id = 82015,
                           is_succ = 1, is_add = 0, ratio = 500,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82016, 1, 0}) ->
    #camp_cake_reward_data{key = 43, id = 82016,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82017, 1, 0}) ->
    #camp_cake_reward_data{key = 44, id = 82017,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82018, 1, 0}) ->
    #camp_cake_reward_data{key = 45, id = 82018,
                           is_succ = 1, is_add = 0, ratio = 800,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 550};
get_reward({82052, 1, 0}) ->
    #camp_cake_reward_data{key = 46, id = 82052,
                           is_succ = 1, is_add = 0, ratio = 1000,
                           reward =
                               [{23720, 1, 96},
                                {23721, 1, 96},
                                {23722, 1, 96},
                                {23723, 1, 96},
                                {23724, 1, 96},
                                {23725, 1, 45},
                                {23726, 1, 45},
                                {23727, 1, 30},
                                {23718, 1, 400}],
                           exp_mode = 3348, exp_radio = 2500};
get_reward(_) -> false.

