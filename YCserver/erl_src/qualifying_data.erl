-file("src/data/qualifying_data.erl", 1).

-module(qualifying_data).

-export([get/1,
         get_reward/1,
         point_to_lev/1,
         get_exp/1,
         get_win/1,
         get_final_reward/1,
         list_by_group/1,
         get_cross_group/1]).

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

-file("src/data/qualifying_data.erl", 20).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/data/qualifying_data.erl", 21).

point_to_lev(Point) ->
    case qualifying_data:get(0) of
        #qualifying_rank_data{max_lev = MaxLev} ->
            point_to_lev(Point, 0, MaxLev);
        _ -> 0
    end.

point_to_lev(_Point, Max, Max) -> Max;
point_to_lev(Point, Now, Max) when Now < Max ->
    case qualifying_data:get(Now) of
        #qualifying_rank_data{point = P, lev = Lev}
            when P =:= Point ->
            Lev;
        #qualifying_rank_data{point = P} when Point > P ->
            point_to_lev(Point, Now + 1, Max);
        #qualifying_rank_data{lev = Lev} -> max(Lev - 1, 0);
        _ -> 0
    end.

get(0) ->
    #qualifying_rank_data{lev = 0, max_lev = 25,
                          rank_type = 0, rank_type_name = lang:get("风色新兵"),
                          point = 0, lev_name = lang:get("风色新兵"),
                          need_point = 1050, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(1) ->
    #qualifying_rank_data{lev = 1, max_lev = 25,
                          rank_type = 1, rank_type_name = lang:get("英勇黄铜"),
                          point = 1050, lev_name = lang:get("英勇黄铜V"),
                          need_point = 50, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(2) ->
    #qualifying_rank_data{lev = 2, max_lev = 25,
                          rank_type = 1, rank_type_name = lang:get("英勇黄铜"),
                          point = 1100, lev_name = lang:get("英勇黄铜IV"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(3) ->
    #qualifying_rank_data{lev = 3, max_lev = 25,
                          rank_type = 1, rank_type_name = lang:get("英勇黄铜"),
                          point = 1200, lev_name = lang:get("英勇黄铜III"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(4) ->
    #qualifying_rank_data{lev = 4, max_lev = 25,
                          rank_type = 1, rank_type_name = lang:get("英勇黄铜"),
                          point = 1300, lev_name = lang:get("英勇黄铜II"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(5) ->
    #qualifying_rank_data{lev = 5, max_lev = 25,
                          rank_type = 1, rank_type_name = lang:get("英勇黄铜"),
                          point = 1400, lev_name = lang:get("英勇黄铜I"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(6) ->
    #qualifying_rank_data{lev = 6, max_lev = 25,
                          rank_type = 2, rank_type_name = lang:get("不屈白银"),
                          point = 1500, lev_name = lang:get("不屈白银V"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}], uplev_reward = 22312};
get(7) ->
    #qualifying_rank_data{lev = 7, max_lev = 25,
                          rank_type = 2, rank_type_name = lang:get("不屈白银"),
                          point = 1600, lev_name = lang:get("不屈白银IV"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(8) ->
    #qualifying_rank_data{lev = 8, max_lev = 25,
                          rank_type = 2, rank_type_name = lang:get("不屈白银"),
                          point = 1700, lev_name = lang:get("不屈白银III"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(9) ->
    #qualifying_rank_data{lev = 9, max_lev = 25,
                          rank_type = 2, rank_type_name = lang:get("不屈白银"),
                          point = 1800, lev_name = lang:get("不屈白银II"),
                          need_point = 100, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(10) ->
    #qualifying_rank_data{lev = 10, max_lev = 25,
                          rank_type = 2, rank_type_name = lang:get("不屈白银"),
                          point = 1900, lev_name = lang:get("不屈白银I"),
                          need_point = 200, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(11) ->
    #qualifying_rank_data{lev = 11, max_lev = 25,
                          rank_type = 3, rank_type_name = lang:get("荣耀黄金"),
                          point = 2100, lev_name = lang:get("荣耀黄金V"),
                          need_point = 200, gain = [{20000, 1}],
                          five_gain = [{20006, 10}], uplev_reward = 22313};
get(12) ->
    #qualifying_rank_data{lev = 12, max_lev = 25,
                          rank_type = 3, rank_type_name = lang:get("荣耀黄金"),
                          point = 2300, lev_name = lang:get("荣耀黄金IV"),
                          need_point = 200, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(13) ->
    #qualifying_rank_data{lev = 13, max_lev = 25,
                          rank_type = 3, rank_type_name = lang:get("荣耀黄金"),
                          point = 2500, lev_name = lang:get("荣耀黄金III"),
                          need_point = 200, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(14) ->
    #qualifying_rank_data{lev = 14, max_lev = 25,
                          rank_type = 3, rank_type_name = lang:get("荣耀黄金"),
                          point = 2700, lev_name = lang:get("荣耀黄金II"),
                          need_point = 200, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(15) ->
    #qualifying_rank_data{lev = 15, max_lev = 25,
                          rank_type = 3, rank_type_name = lang:get("荣耀黄金"),
                          point = 2900, lev_name = lang:get("荣耀黄金I"),
                          need_point = 300, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(16) ->
    #qualifying_rank_data{lev = 16, max_lev = 25,
                          rank_type = 4, rank_type_name = lang:get("璀璨钻石"),
                          point = 3200, lev_name = lang:get("璀璨钻石V"),
                          need_point = 300, gain = [{20000, 1}],
                          five_gain = [{20006, 10}], uplev_reward = 22314};
get(17) ->
    #qualifying_rank_data{lev = 17, max_lev = 25,
                          rank_type = 4, rank_type_name = lang:get("璀璨钻石"),
                          point = 3500, lev_name = lang:get("璀璨钻石IV"),
                          need_point = 300, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(18) ->
    #qualifying_rank_data{lev = 18, max_lev = 25,
                          rank_type = 4, rank_type_name = lang:get("璀璨钻石"),
                          point = 3800, lev_name = lang:get("璀璨钻石III"),
                          need_point = 300, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(19) ->
    #qualifying_rank_data{lev = 19, max_lev = 25,
                          rank_type = 4, rank_type_name = lang:get("璀璨钻石"),
                          point = 4100, lev_name = lang:get("璀璨钻石II"),
                          need_point = 300, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(20) ->
    #qualifying_rank_data{lev = 20, max_lev = 25,
                          rank_type = 4, rank_type_name = lang:get("璀璨钻石"),
                          point = 4400, lev_name = lang:get("璀璨钻石I"),
                          need_point = 400, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(21) ->
    #qualifying_rank_data{lev = 21, max_lev = 25,
                          rank_type = 5, rank_type_name = lang:get("顶级王者"),
                          point = 4800, lev_name = lang:get("顶级王者V"),
                          need_point = 400, gain = [{20000, 1}],
                          five_gain = [{20006, 10}], uplev_reward = 22315};
get(22) ->
    #qualifying_rank_data{lev = 22, max_lev = 25,
                          rank_type = 5, rank_type_name = lang:get("顶级王者"),
                          point = 5200, lev_name = lang:get("顶级王者IV"),
                          need_point = 400, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(23) ->
    #qualifying_rank_data{lev = 23, max_lev = 25,
                          rank_type = 5, rank_type_name = lang:get("顶级王者"),
                          point = 5600, lev_name = lang:get("顶级王者III"),
                          need_point = 400, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(24) ->
    #qualifying_rank_data{lev = 24, max_lev = 25,
                          rank_type = 5, rank_type_name = lang:get("顶级王者"),
                          point = 6000, lev_name = lang:get("顶级王者II"),
                          need_point = 400, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(25) ->
    #qualifying_rank_data{lev = 25, max_lev = 25,
                          rank_type = 5, rank_type_name = lang:get("顶级王者"),
                          point = 7000, lev_name = lang:get("顶级王者I"),
                          need_point = 1000, gain = [{20000, 1}],
                          five_gain = [{20006, 10}]};
get(_) -> false.

get_reward({1, 1}) -> {0, 2448};
get_reward({2, 1}) -> {0, 2501};
get_reward({3, 1}) -> {0, 2575};
get_reward({4, 1}) -> {0, 2648};
get_reward({5, 1}) -> {0, 2703};
get_reward({6, 1}) -> {0, 2776};
get_reward({7, 1}) -> {0, 2849};
get_reward({8, 1}) -> {0, 2904};
get_reward({9, 1}) -> {0, 2976};
get_reward({10, 1}) -> {0, 3050};
get_reward({11, 1}) -> {0, 3123};
get_reward({12, 1}) -> {0, 3196};
get_reward({13, 1}) -> {0, 3250};
get_reward({14, 1}) -> {0, 3324};
get_reward({15, 1}) -> {0, 3396};
get_reward({16, 1}) -> {0, 3470};
get_reward({17, 1}) -> {0, 3543};
get_reward({18, 1}) -> {0, 3616};
get_reward({19, 1}) -> {0, 3689};
get_reward({20, 1}) -> {0, 3761};
get_reward({21, 1}) -> {0, 3835};
get_reward({22, 1}) -> {0, 3908};
get_reward({23, 1}) -> {0, 3981};
get_reward({24, 1}) -> {0, 4054};
get_reward({25, 1}) -> {0, 4128};
get_reward({26, 1}) -> {0, 4200};
get_reward({27, 1}) -> {0, 4274};
get_reward({28, 1}) -> {0, 4346};
get_reward({29, 1}) -> {0, 4419};
get_reward({30, 1}) -> {0, 4493};
get_reward({31, 1}) -> {0, 4736};
get_reward({32, 1}) -> {0, 4809};
get_reward({33, 1}) -> {0, 4883};
get_reward({34, 1}) -> {0, 4955};
get_reward({35, 1}) -> {10093, 5046};
get_reward({36, 1}) -> {10236, 5119};
get_reward({37, 1}) -> {10380, 5190};
get_reward({38, 1}) -> {10560, 5280};
get_reward({39, 1}) -> {10704, 5353};
get_reward({40, 1}) -> {11148, 5574};
get_reward({41, 1}) -> {11328, 5664};
get_reward({42, 1}) -> {11473, 5736};
get_reward({43, 1}) -> {11653, 5826};
get_reward({44, 1}) -> {11796, 5899};
get_reward({45, 1}) -> {11940, 5970};
get_reward({46, 1}) -> {12120, 6060};
get_reward({47, 1}) -> {12264, 6133};
get_reward({48, 1}) -> {12444, 6223};
get_reward({49, 1}) -> {12588, 6294};
get_reward({50, 1}) -> {12768, 6384};
get_reward({51, 1}) -> {12913, 6456};
get_reward({52, 1}) -> {13093, 6546};
get_reward({53, 1}) -> {13273, 6636};
get_reward({54, 1}) -> {13416, 6709};
get_reward({55, 1}) -> {13896, 6949};
get_reward({56, 1}) -> {14040, 7020};
get_reward({57, 1}) -> {14220, 7110};
get_reward({58, 1}) -> {14400, 7200};
get_reward({59, 1}) -> {14544, 7273};
get_reward({60, 1}) -> {15024, 7513};
get_reward({61, 1}) -> {15204, 7603};
get_reward({62, 1}) -> {15384, 7693};
get_reward({63, 1}) -> {14441, 7764};
get_reward({64, 1}) -> {14608, 7854};
get_reward({65, 1}) -> {14775, 7944};
get_reward({66, 1}) -> {14943, 8034};
get_reward({67, 1}) -> {15110, 8124};
get_reward({68, 1}) -> {15606, 8214};
get_reward({69, 1}) -> {15744, 8286};
get_reward({70, 1}) -> {15915, 8376};
get_reward({71, 1}) -> {16086, 8466};
get_reward({72, 1}) -> {16257, 8556};
get_reward({73, 1}) -> {17293, 8646};
get_reward({74, 1}) -> {17473, 8736};
get_reward({75, 1}) -> {17653, 8826};
get_reward({76, 1}) -> {17833, 8916};
get_reward({77, 1}) -> {18013, 9006};
get_reward({78, 1}) -> {17283, 9096};
get_reward({79, 1}) -> {17454, 9186};
get_reward({80, 1}) -> {18765, 9876};
get_reward({81, 1}) -> {18969, 9984};
get_reward({82, 1}) -> {19140, 10074};
get_reward({83, 1}) -> {19921, 10164};
get_reward({84, 1}) -> {20097, 10254};
get_reward({85, 1}) -> {20274, 10344};
get_reward({86, 1}) -> {20450, 10434};
get_reward({87, 1}) -> {20662, 10543};
get_reward({88, 1}) -> {21264, 10633};
get_reward({89, 1}) -> {21444, 10723};
get_reward({90, 1}) -> {21624, 10813};
get_reward({91, 1}) -> {21840, 10920};
get_reward({92, 1}) -> {22020, 11010};
get_reward({93, 1}) -> {21534, 11100};
get_reward({94, 1}) -> {21743, 11209};
get_reward({95, 1}) -> {21918, 11299};
get_reward({96, 1}) -> {22092, 11389};
get_reward({97, 1}) -> {22303, 11496};
get_reward({98, 1}) -> {23173, 11586};
get_reward({99, 1}) -> {23353, 11676};
get_reward({100, 1}) -> {23353, 11676};
get_reward({101, 1}) -> {23353, 11676};
get_reward({102, 1}) -> {23353, 11676};
get_reward({103, 1}) -> {23353, 11676};
get_reward({104, 1}) -> {23353, 11676};
get_reward({105, 1}) -> {23353, 11676};
get_reward({106, 1}) -> {23353, 11676};
get_reward({107, 1}) -> {23353, 11676};
get_reward({108, 1}) -> {23353, 11676};
get_reward({109, 1}) -> {23353, 11676};
get_reward({110, 1}) -> {23353, 11676};
get_reward({111, 1}) -> {23353, 11676};
get_reward({112, 1}) -> {23353, 11676};
get_reward({113, 1}) -> {23353, 11676};
get_reward({114, 1}) -> {23353, 11676};
get_reward({115, 1}) -> {23353, 11676};
get_reward({116, 1}) -> {23353, 11676};
get_reward({117, 1}) -> {23353, 11676};
get_reward({118, 1}) -> {23353, 11676};
get_reward({119, 1}) -> {23353, 11676};
get_reward({120, 1}) -> {23353, 11676};
get_reward({121, 1}) -> {23353, 11676};
get_reward({122, 1}) -> {23353, 11676};
get_reward({123, 1}) -> {23353, 11676};
get_reward({124, 1}) -> {23353, 11676};
get_reward({125, 1}) -> {23353, 11676};
get_reward({126, 1}) -> {23353, 11676};
get_reward({127, 1}) -> {23353, 11676};
get_reward({128, 1}) -> {23353, 11676};
get_reward({129, 1}) -> {23353, 11676};
get_reward({130, 1}) -> {23353, 11676};
get_reward({1, 2}) -> {0, 2448};
get_reward({2, 2}) -> {0, 2501};
get_reward({3, 2}) -> {0, 2575};
get_reward({4, 2}) -> {0, 2648};
get_reward({5, 2}) -> {0, 2703};
get_reward({6, 2}) -> {0, 2776};
get_reward({7, 2}) -> {0, 2849};
get_reward({8, 2}) -> {0, 2904};
get_reward({9, 2}) -> {0, 2976};
get_reward({10, 2}) -> {0, 3050};
get_reward({11, 2}) -> {0, 3123};
get_reward({12, 2}) -> {0, 3196};
get_reward({13, 2}) -> {0, 3250};
get_reward({14, 2}) -> {0, 3324};
get_reward({15, 2}) -> {0, 3396};
get_reward({16, 2}) -> {0, 3470};
get_reward({17, 2}) -> {0, 3543};
get_reward({18, 2}) -> {0, 3616};
get_reward({19, 2}) -> {0, 3689};
get_reward({20, 2}) -> {0, 3761};
get_reward({21, 2}) -> {0, 3835};
get_reward({22, 2}) -> {0, 3908};
get_reward({23, 2}) -> {0, 3981};
get_reward({24, 2}) -> {0, 4054};
get_reward({25, 2}) -> {0, 4128};
get_reward({26, 2}) -> {0, 4200};
get_reward({27, 2}) -> {0, 4274};
get_reward({28, 2}) -> {0, 4346};
get_reward({29, 2}) -> {0, 4419};
get_reward({30, 2}) -> {0, 4493};
get_reward({31, 2}) -> {0, 4736};
get_reward({32, 2}) -> {0, 4809};
get_reward({33, 2}) -> {0, 4883};
get_reward({34, 2}) -> {0, 4955};
get_reward({35, 2}) -> {7065, 5046};
get_reward({36, 2}) -> {7165, 5119};
get_reward({37, 2}) -> {7266, 5190};
get_reward({38, 2}) -> {7393, 5280};
get_reward({39, 2}) -> {7493, 5353};
get_reward({40, 2}) -> {7804, 5574};
get_reward({41, 2}) -> {7930, 5664};
get_reward({42, 2}) -> {8030, 5736};
get_reward({43, 2}) -> {8156, 5826};
get_reward({44, 2}) -> {8258, 5899};
get_reward({45, 2}) -> {8358, 5970};
get_reward({46, 2}) -> {8484, 6060};
get_reward({47, 2}) -> {8585, 6133};
get_reward({48, 2}) -> {8711, 6223};
get_reward({49, 2}) -> {8811, 6294};
get_reward({50, 2}) -> {8938, 6384};
get_reward({51, 2}) -> {9039, 6456};
get_reward({52, 2}) -> {9165, 6546};
get_reward({53, 2}) -> {9290, 6636};
get_reward({54, 2}) -> {9391, 6709};
get_reward({55, 2}) -> {9728, 6949};
get_reward({56, 2}) -> {9828, 7020};
get_reward({57, 2}) -> {9954, 7110};
get_reward({58, 2}) -> {10080, 7200};
get_reward({59, 2}) -> {10181, 7273};
get_reward({60, 2}) -> {10516, 7513};
get_reward({61, 2}) -> {10643, 7603};
get_reward({62, 2}) -> {10769, 7693};
get_reward({63, 2}) -> {10109, 7764};
get_reward({64, 2}) -> {10225, 7854};
get_reward({65, 2}) -> {10342, 7944};
get_reward({66, 2}) -> {10460, 8034};
get_reward({67, 2}) -> {10577, 8124};
get_reward({68, 2}) -> {10925, 8214};
get_reward({69, 2}) -> {11020, 8286};
get_reward({70, 2}) -> {11139, 8376};
get_reward({71, 2}) -> {11260, 8466};
get_reward({72, 2}) -> {11380, 8556};
get_reward({73, 2}) -> {12105, 8646};
get_reward({74, 2}) -> {12230, 8736};
get_reward({75, 2}) -> {12356, 8826};
get_reward({76, 2}) -> {12483, 8916};
get_reward({77, 2}) -> {12609, 9006};
get_reward({78, 2}) -> {12098, 9096};
get_reward({79, 2}) -> {12217, 9186};
get_reward({80, 2}) -> {13134, 9876};
get_reward({81, 2}) -> {13279, 9984};
get_reward({82, 2}) -> {13398, 10074};
get_reward({83, 2}) -> {13945, 10164};
get_reward({84, 2}) -> {14067, 10254};
get_reward({85, 2}) -> {14191, 10344};
get_reward({86, 2}) -> {14315, 10434};
get_reward({87, 2}) -> {14463, 10543};
get_reward({88, 2}) -> {14885, 10633};
get_reward({89, 2}) -> {15011, 10723};
get_reward({90, 2}) -> {15136, 10813};
get_reward({91, 2}) -> {15288, 10920};
get_reward({92, 2}) -> {15414, 11010};
get_reward({93, 2}) -> {15073, 11100};
get_reward({94, 2}) -> {15220, 11209};
get_reward({95, 2}) -> {15343, 11299};
get_reward({96, 2}) -> {15465, 11389};
get_reward({97, 2}) -> {15612, 11496};
get_reward({98, 2}) -> {16220, 11586};
get_reward({99, 2}) -> {16346, 11676};
get_reward({100, 2}) -> {16346, 11676};
get_reward({101, 2}) -> {16346, 11676};
get_reward({102, 2}) -> {16346, 11676};
get_reward({103, 2}) -> {16346, 11676};
get_reward({104, 2}) -> {16346, 11676};
get_reward({105, 2}) -> {16346, 11676};
get_reward({106, 2}) -> {16346, 11676};
get_reward({107, 2}) -> {16346, 11676};
get_reward({108, 2}) -> {16346, 11676};
get_reward({109, 2}) -> {16346, 11676};
get_reward({110, 2}) -> {16346, 11676};
get_reward({111, 2}) -> {16346, 11676};
get_reward({112, 2}) -> {16346, 11676};
get_reward({113, 2}) -> {16346, 11676};
get_reward({114, 2}) -> {16346, 11676};
get_reward({115, 2}) -> {16346, 11676};
get_reward({116, 2}) -> {16346, 11676};
get_reward({117, 2}) -> {16346, 11676};
get_reward({118, 2}) -> {16346, 11676};
get_reward({119, 2}) -> {16346, 11676};
get_reward({120, 2}) -> {16346, 11676};
get_reward({121, 2}) -> {16346, 11676};
get_reward({122, 2}) -> {16346, 11676};
get_reward({123, 2}) -> {16346, 11676};
get_reward({124, 2}) -> {16346, 11676};
get_reward({125, 2}) -> {16346, 11676};
get_reward({126, 2}) -> {16346, 11676};
get_reward({127, 2}) -> {16346, 11676};
get_reward({128, 2}) -> {16346, 11676};
get_reward({129, 2}) -> {16346, 11676};
get_reward({130, 2}) -> {16346, 11676};
get_reward(_) -> false.

get_exp(1) -> {0, 537};
get_exp(2) -> {0, 549};
get_exp(3) -> {0, 565};
get_exp(4) -> {0, 581};
get_exp(5) -> {0, 594};
get_exp(6) -> {0, 610};
get_exp(7) -> {0, 626};
get_exp(8) -> {0, 638};
get_exp(9) -> {0, 654};
get_exp(10) -> {0, 670};
get_exp(11) -> {0, 686};
get_exp(12) -> {0, 702};
get_exp(13) -> {0, 714};
get_exp(14) -> {0, 730};
get_exp(15) -> {0, 746};
get_exp(16) -> {0, 762};
get_exp(17) -> {0, 778};
get_exp(18) -> {0, 794};
get_exp(19) -> {0, 810};
get_exp(20) -> {0, 826};
get_exp(21) -> {0, 842};
get_exp(22) -> {0, 858};
get_exp(23) -> {0, 874};
get_exp(24) -> {0, 891};
get_exp(25) -> {0, 907};
get_exp(26) -> {0, 923};
get_exp(27) -> {0, 939};
get_exp(28) -> {0, 955};
get_exp(29) -> {0, 971};
get_exp(30) -> {1974, 987};
get_exp(31) -> {2093, 1046};
get_exp(32) -> {2151, 1075};
get_exp(33) -> {2159, 1079};
get_exp(34) -> {2234, 1117};
get_exp(35) -> {2281, 1140};
get_exp(36) -> {2278, 1139};
get_exp(37) -> {2304, 1152};
get_exp(38) -> {2363, 1181};
get_exp(39) -> {2401, 1200};
get_exp(40) -> {2441, 1220};
get_exp(41) -> {2533, 1266};
get_exp(42) -> {2581, 1290};
get_exp(43) -> {2617, 1308};
get_exp(44) -> {2647, 1323};
get_exp(45) -> {2690, 1345};
get_exp(46) -> {2717, 1358};
get_exp(47) -> {2759, 1379};
get_exp(48) -> {2784, 1392};
get_exp(49) -> {2830, 1415};
get_exp(50) -> {2869, 1434};
get_exp(51) -> {2902, 1451};
get_exp(52) -> {2937, 1468};
get_exp(53) -> {2982, 1491};
get_exp(54) -> {3022, 1511};
get_exp(55) -> {3056, 1528};
get_exp(56) -> {3160, 1580};
get_exp(57) -> {3195, 1597};
get_exp(58) -> {3241, 1620};
get_exp(59) -> {3277, 1638};
get_exp(60) -> {3313, 1656};
get_exp(61) -> {3423, 1711};
get_exp(62) -> {3463, 1731};
get_exp(63) -> {3502, 1751};
get_exp(64) -> {3537, 1768};
get_exp(65) -> {3577, 1788};
get_exp(66) -> {3616, 1808};
get_exp(67) -> {3658, 1829};
get_exp(68) -> {3700, 1850};
get_exp(69) -> {3739, 1869};
get_exp(70) -> {3773, 1886};
get_exp(71) -> {3814, 1907};
get_exp(72) -> {3855, 1927};
get_exp(73) -> {3896, 1948};
get_exp(74) -> {3936, 1968};
get_exp(75) -> {3977, 1988};
get_exp(76) -> {4019, 2009};
get_exp(77) -> {4060, 2030};
get_exp(78) -> {4101, 2050};
get_exp(79) -> {4142, 2071};
get_exp(80) -> {4182, 2091};
get_exp(81) -> {4497, 2248};
get_exp(82) -> {4546, 2273};
get_exp(83) -> {4587, 2293};
get_exp(84) -> {4628, 2314};
get_exp(85) -> {4670, 2335};
get_exp(86) -> {4710, 2355};
get_exp(87) -> {4751, 2375};
get_exp(88) -> {4800, 2400};
get_exp(89) -> {4841, 2420};
get_exp(90) -> {4882, 2441};
get_exp(91) -> {4923, 2461};
get_exp(92) -> {4972, 2486};
get_exp(93) -> {5013, 2506};
get_exp(94) -> {5054, 2527};
get_exp(95) -> {5104, 2552};
get_exp(96) -> {5144, 2572};
get_exp(97) -> {5185, 2592};
get_exp(98) -> {5235, 2617};
get_exp(99) -> {5276, 2638};
get_exp(100) -> {5328, 2664};
get_exp(101) -> {5381, 2690};
get_exp(102) -> {5434, 2716};
get_exp(103) -> {5488, 2743};
get_exp(104) -> {5542, 2770};
get_exp(105) -> {5597, 2797};
get_exp(106) -> {5652, 2824};
get_exp(107) -> {5708, 2852};
get_exp(108) -> {5765, 2880};
get_exp(109) -> {5822, 2908};
get_exp(110) -> {5880, 2937};
get_exp(111) -> {5938, 2966};
get_exp(112) -> {5997, 2995};
get_exp(113) -> {6056, 3024};
get_exp(114) -> {6116, 3054};
get_exp(115) -> {6177, 3084};
get_exp(116) -> {6238, 3114};
get_exp(117) -> {6300, 3145};
get_exp(118) -> {6363, 3176};
get_exp(119) -> {6426, 3207};
get_exp(120) -> {6489, 3238};
get_exp(121) -> {6552, 3269};
get_exp(122) -> {6615, 3300};
get_exp(123) -> {6678, 3331};
get_exp(124) -> {6741, 3362};
get_exp(125) -> {6804, 3393};
get_exp(126) -> {6867, 3424};
get_exp(127) -> {6930, 3455};
get_exp(128) -> {6993, 3486};
get_exp(129) -> {7056, 3517};
get_exp(130) -> {7119, 3548};
get_exp(_) -> false.

get_win({0, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({1, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({2, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({3, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({4, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({5, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({6, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({7, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({8, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({9, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({10, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({11, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({12, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({13, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({14, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({15, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({16, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({17, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({18, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({19, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({20, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({21, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({22, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({23, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({24, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({25, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({26, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({27, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({28, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({29, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({30, RoleLev})
    when RoleLev >= 1 andalso RoleLev =< 59 ->
    {[{20000, 1}], [{20006, 10}]};
get_win({0, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({1, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({2, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({3, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({4, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({5, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({6, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({7, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({8, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({9, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({10, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({11, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({12, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({13, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({14, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({15, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({16, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({17, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({18, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({19, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({20, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({21, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({22, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({23, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({24, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({25, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({26, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({27, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({28, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({29, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win({30, RoleLev})
    when RoleLev >= 60 andalso RoleLev =< 200 ->
    {[{20006, 5}], [{20025, 1}]};
get_win(_) -> false.

get_final_reward(1) ->
    #{rank_type_name => lang:get("英勇黄铜V"),
      gain => [{90000, 300000}], new_point => 1000};
get_final_reward(2) ->
    #{rank_type_name => lang:get("英勇黄铜IV"),
      gain => [{90000, 300000}], new_point => 1000};
get_final_reward(3) ->
    #{rank_type_name => lang:get("英勇黄铜III"),
      gain => [{90000, 300000}], new_point => 1000};
get_final_reward(4) ->
    #{rank_type_name => lang:get("英勇黄铜II"),
      gain => [{90000, 300000}], new_point => 1000};
get_final_reward(5) ->
    #{rank_type_name => lang:get("英勇黄铜I"),
      gain => [{90000, 300000}], new_point => 1000};
get_final_reward(6) ->
    #{rank_type_name => lang:get("不屈白银V"),
      gain => [{90000, 500000}, {90012, 30}],
      new_point => 1050};
get_final_reward(7) ->
    #{rank_type_name => lang:get("不屈白银IV"),
      gain => [{90000, 500000}, {90012, 30}],
      new_point => 1050};
get_final_reward(8) ->
    #{rank_type_name => lang:get("不屈白银III"),
      gain => [{90000, 500000}, {90012, 30}],
      new_point => 1050};
get_final_reward(9) ->
    #{rank_type_name => lang:get("不屈白银II"),
      gain => [{90000, 500000}, {90012, 30}],
      new_point => 1050};
get_final_reward(10) ->
    #{rank_type_name => lang:get("不屈白银I"),
      gain => [{90000, 500000}, {90012, 30}],
      new_point => 1050};
get_final_reward(11) ->
    #{rank_type_name => lang:get("荣耀黄金V"),
      gain =>
          [{23045, 1}, {22212, 1}, {90000, 800000}, {90012, 50}],
      new_point => 1400};
get_final_reward(12) ->
    #{rank_type_name => lang:get("荣耀黄金IV"),
      gain =>
          [{23045, 1}, {22212, 1}, {90000, 800000}, {90012, 50}],
      new_point => 1400};
get_final_reward(13) ->
    #{rank_type_name => lang:get("荣耀黄金III"),
      gain =>
          [{23045, 1}, {22212, 1}, {90000, 800000}, {90012, 50}],
      new_point => 1400};
get_final_reward(14) ->
    #{rank_type_name => lang:get("荣耀黄金II"),
      gain =>
          [{23045, 1}, {22212, 1}, {90000, 800000}, {90012, 50}],
      new_point => 1400};
get_final_reward(15) ->
    #{rank_type_name => lang:get("荣耀黄金I"),
      gain =>
          [{23045, 1}, {22212, 1}, {90000, 800000}, {90012, 50}],
      new_point => 1400};
get_final_reward(16) ->
    #{rank_type_name => lang:get("璀璨钻石V"),
      gain =>
          [{23047, 1}, {22212, 3}, {90000, 1200000}, {90012, 80}],
      new_point => 1800};
get_final_reward(17) ->
    #{rank_type_name => lang:get("璀璨钻石IV"),
      gain =>
          [{23047, 1}, {22212, 3}, {90000, 1200000}, {90012, 80}],
      new_point => 1800};
get_final_reward(18) ->
    #{rank_type_name => lang:get("璀璨钻石III"),
      gain =>
          [{23047, 1}, {22212, 3}, {90000, 1200000}, {90012, 80}],
      new_point => 1800};
get_final_reward(19) ->
    #{rank_type_name => lang:get("璀璨钻石II"),
      gain =>
          [{23047, 1}, {22212, 3}, {90000, 1200000}, {90012, 80}],
      new_point => 1800};
get_final_reward(20) ->
    #{rank_type_name => lang:get("璀璨钻石I"),
      gain =>
          [{23047, 1}, {22212, 3}, {90000, 1200000}, {90012, 80}],
      new_point => 1800};
get_final_reward(21) ->
    #{rank_type_name => lang:get("顶级王者V"),
      gain =>
          [{23048, 1},
           {22212, 5},
           {90000, 1500000},
           {90012, 100}],
      new_point => 1800};
get_final_reward(22) ->
    #{rank_type_name => lang:get("顶级王者IV"),
      gain =>
          [{23048, 1},
           {22212, 5},
           {90000, 1500000},
           {90012, 100}],
      new_point => 1800};
get_final_reward(23) ->
    #{rank_type_name => lang:get("顶级王者III"),
      gain =>
          [{23048, 1},
           {22212, 5},
           {90000, 1500000},
           {90012, 100}],
      new_point => 1800};
get_final_reward(24) ->
    #{rank_type_name => lang:get("顶级王者II"),
      gain =>
          [{23048, 1},
           {22212, 5},
           {90000, 1500000},
           {90012, 100}],
      new_point => 1800};
get_final_reward(25) ->
    #{rank_type_name => lang:get("顶级王者I"),
      gain =>
          [{23048, 1},
           {22212, 5},
           {90000, 1500000},
           {90012, 100}],
      new_point => 1800};
get_final_reward(_) -> get_final_reward(1).

list_by_group(1) ->
    [{"local", 1}, {"local", 2}, {"local", 3}];
list_by_group(2) -> [{"dev", 1}, {"dev", 2}];
list_by_group(3) -> [{"beta", 17}, {"beta", 33}];
list_by_group(30) -> [{"mix", 49}, {"mix", 1}];
list_by_group(52) -> [{"unite", 1}, {"unite", 65}];
list_by_group(53) -> [{"mix", 113}, {"mix", 177}];
list_by_group(60) -> [{"mix", 241}, {"unite", 129}];
list_by_group(44) -> [{"mix", 305}, {"unite", 225}];
list_by_group(54) -> [{"mix", 337}, {"unite", 257}];
list_by_group(45) -> [{"unite", 289}, {"unite", 305}];
list_by_group(59) -> [{"unite", 321}, {"unite", 329}];
list_by_group(41) -> [{"mix", 385}, {"unite", 337}];
list_by_group(66) -> [{"mix", 393}, {"unite", 345}];
list_by_group(56) -> [{"mix", 401}, {"unite", 357}];
list_by_group(70) -> [{"unite", 359}, {"unite", 361}];
list_by_group(71) -> [{"mix", 405}, {"unite", 363}];
list_by_group(65) -> [{"mix", 409}, {"unite", 365}];
list_by_group(67) -> [{"mix", 411}, {"unite", 367}];
list_by_group(69) -> [{"mix", 413}, {"unite", 369}];
list_by_group(72) -> [{"mix", 415}, {"unite", 371}];
list_by_group(73) -> [{"mix", 416}, {"unite", 372}];
list_by_group(74) -> [{"mix", 417}, {"unite", 373}];
list_by_group(75) -> [{"mix", 418}, {"unite", 374}];
list_by_group(_) -> [].

get_cross_group({"local", 1}) -> 1;
get_cross_group({"local", 2}) -> 1;
get_cross_group({"local", 3}) -> 1;
get_cross_group({"dev", 1}) -> 2;
get_cross_group({"dev", 2}) -> 2;
get_cross_group({"beta", 17}) -> 3;
get_cross_group({"beta", 33}) -> 3;
get_cross_group({"mix", 49}) -> 30;
get_cross_group({"mix", 1}) -> 30;
get_cross_group({"unite", 1}) -> 52;
get_cross_group({"unite", 65}) -> 52;
get_cross_group({"mix", 113}) -> 53;
get_cross_group({"mix", 177}) -> 53;
get_cross_group({"mix", 241}) -> 60;
get_cross_group({"unite", 129}) -> 60;
get_cross_group({"mix", 305}) -> 44;
get_cross_group({"unite", 225}) -> 44;
get_cross_group({"mix", 337}) -> 54;
get_cross_group({"unite", 257}) -> 54;
get_cross_group({"unite", 289}) -> 45;
get_cross_group({"unite", 305}) -> 45;
get_cross_group({"unite", 321}) -> 59;
get_cross_group({"unite", 329}) -> 59;
get_cross_group({"mix", 385}) -> 41;
get_cross_group({"unite", 337}) -> 41;
get_cross_group({"mix", 393}) -> 66;
get_cross_group({"unite", 345}) -> 66;
get_cross_group({"mix", 401}) -> 56;
get_cross_group({"unite", 357}) -> 56;
get_cross_group({"unite", 359}) -> 70;
get_cross_group({"unite", 361}) -> 70;
get_cross_group({"mix", 405}) -> 71;
get_cross_group({"unite", 363}) -> 71;
get_cross_group({"mix", 409}) -> 65;
get_cross_group({"unite", 365}) -> 65;
get_cross_group({"mix", 411}) -> 67;
get_cross_group({"unite", 367}) -> 67;
get_cross_group({"mix", 413}) -> 69;
get_cross_group({"unite", 369}) -> 69;
get_cross_group({"mix", 415}) -> 72;
get_cross_group({"unite", 371}) -> 72;
get_cross_group({"mix", 416}) -> 73;
get_cross_group({"unite", 372}) -> 73;
get_cross_group({"mix", 417}) -> 74;
get_cross_group({"unite", 373}) -> 74;
get_cross_group({"mix", 418}) -> 75;
get_cross_group({"unite", 374}) -> 75;
get_cross_group(_) -> false.

