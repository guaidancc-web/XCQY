-file("src/data/gold_league_data.erl", 1).

-module(gold_league_data).

-export([ready_reward/0,
         get_group/1,
         group_name/1,
         rank_type/1,
         group_order/1,
         order_group/1,
         orders/0,
         get_cross_list/1,
         get_all_cross_list/0,
         get_all_cross_id/1,
         get_cross_id/1,
         get_cross_zone/1,
         get_guess/1,
         get_reward/1,
         get_drug/1,
         get_honor/1]).

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

-file("src/data/gold_league_data.erl", 32).

-file("inc/gold_league.hrl", 1).

-record(gold_league_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 0,
         init_combat_mode = 0}).

-record(gold_league_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(gold_league_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         phase = 0,
         end_time = 0,
         combat_mode = 0,
         now_round = 0,
         max_round = 0}).

-record(gold_league_state,
        {key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         state_name,
         phase = 0,
         end_time = 0,
         now_round = 0,
         max_round = 0,
         ids = []}).

-record(gold_league_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         group_id = 0 :: pos_integer(),
         field_id = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         rival_id = undefined,
         rival_pid = undefined,
         rival_name = "",
         ref = undefined,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0,
         match = 0,
         pos = 0,
         match_num = 0,
         match_group_id = 0,
         is_lose = 0,
         lose_round = 0,
         rank = 0,
         is_out = 0,
         is_result = 0}).

-record(gold_league,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         group_id = 0 :: pos_integer(),
         match = 0 :: pos_integer(),
         combat_count = 0 :: pos_integer(),
         win = 0,
         lose = 0,
         rival_id = {0, "", 0} :: tuple(),
         multi_kill = 0 :: non_neg_integer(),
         win_count = 0,
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         reward = [] :: list(),
         status = 0,
         cross_id = 0,
         ref = undefined,
         match_time = 0,
         combat_time = 0,
         camp = 0,
         is_combat = 0,
         combat_mode = 0,
         is_rise = 0,
         pos = 0,
         is_lose = 0,
         lose_round = 0}).

-record(gold_league_group_data,
        {id = 0, name = "", order = 0, members = [], ids = []}).

-record(gold_league_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(gold_league_combat,
        {pid,
         field_id = 0,
         field_key,
         type = 1,
         ref,
         first_id = {0, "", 0},
         first_name = "",
         first_classes = 0,
         first_sex = 0,
         first_lev = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_classes = 0,
         second_lev = 0,
         second_sex = 0,
         cross_id = 0,
         group_id = 0,
         ids = []}).

-record(gold_league_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(gold_league_combat_result,
        {field_pid, round = 0}).

-record(gold_league_combat_win,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_combat_lose,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-record(gold_league_16,
        {cross_id = 0,
         group_id = 0,
         key = {0, 0},
         members = []}).

-record(gold_league_guess,
        {id = 0, name = "", num = 0, amount = 0, members = []}).

-record(gold_league_guess_role,
        {id = 0, members = [], group_id = 0, cross_id = 0}).

-record(gold_league_combat_record,
        {id = 0,
         first_id = {0, "", 0},
         second_id = {0, "", 0}}).

-file("src/data/gold_league_data.erl", 33).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/gold_league_data.erl", 34).

ready_reward() -> {3350, 200, 200, 0}.

get_group({Lev, Times})
    when Lev >= 95 andalso
             Lev =< 130 andalso Times >= 1 andalso Times =< 1 ->
    #gold_league_group_data{id = 1, name = lang:get("英雄组"),
                            order = 1};
get_group({Lev, Times})
    when Lev >= 90 andalso
             Lev =< 100 andalso Times >= 0 andalso Times =< 0 ->
    #gold_league_group_data{id = 2, name = lang:get("勇武组"),
                            order = 2};
get_group({Lev, Times})
    when Lev >= 70 andalso
             Lev =< 89 andalso Times >= 0 andalso Times =< 0 ->
    #gold_league_group_data{id = 3, name = lang:get("精锐组"),
                            order = 3};
get_group({Lev, Times})
    when Lev >= 50 andalso
             Lev =< 69 andalso Times >= 0 andalso Times =< 0 ->
    #gold_league_group_data{id = 4, name = lang:get("新秀组"),
                            order = 4};
get_group(_) -> false.

group_name(1) -> lang:get("英雄组");
group_name(2) -> lang:get("勇武组");
group_name(3) -> lang:get("精锐组");
group_name(4) -> lang:get("新秀组");
group_name(_GroupId) -> "".

rank_type(1) -> {59, 1};
rank_type(2) -> {58, 1};
rank_type(3) -> {57, 1};
rank_type(4) -> {56, 1};
rank_type(_) -> false.

group_order(1) -> 1;
group_order(2) -> 2;
group_order(3) -> 3;
group_order(4) -> 4;
group_order(_) -> 0.

order_group(1) -> 1;
order_group(2) -> 2;
order_group(3) -> 3;
order_group(4) -> 4;
order_group(_) -> 0.

orders() -> [1, 2, 3, 4].

get_cross_list({"local_center", 9000}) ->
    [{{"local", 1}, 1},
     {{"local", 2}, 1},
     {{"local", 3}, 1},
     {{"local", 4}, 1}];
get_cross_list({"dev_center", 9000}) ->
    [{{"dev", 1}, 2}, {{"dev", 2}, 2}];
get_cross_list({"center", 9000}) ->
    [{{"beta", 17}, 3},
     {{"beta", 33}, 3},
     {{"mix", 49}, 30},
     {{"mix", 1}, 30},
     {{"unite", 1}, 52},
     {{"unite", 65}, 52},
     {{"mix", 113}, 53},
     {{"mix", 177}, 53},
     {{"mix", 241}, 60},
     {{"unite", 129}, 60},
     {{"mix", 305}, 44},
     {{"unite", 225}, 44},
     {{"mix", 337}, 54},
     {{"unite", 257}, 54},
     {{"unite", 289}, 45},
     {{"unite", 305}, 45},
     {{"unite", 321}, 59},
     {{"unite", 329}, 59},
     {{"mix", 385}, 41},
     {{"unite", 337}, 41},
     {{"mix", 393}, 66},
     {{"unite", 345}, 66},
     {{"mix", 401}, 56},
     {{"unite", 357}, 56},
     {{"unite", 359}, 70},
     {{"unite", 361}, 70},
     {{"mix", 405}, 71},
     {{"unite", 363}, 71},
     {{"mix", 409}, 65},
     {{"unite", 365}, 65},
     {{"mix", 411}, 67},
     {{"unite", 367}, 67},
     {{"mix", 413}, 69},
     {{"unite", 369}, 69},
     {{"mix", 415}, 72},
     {{"unite", 371}, 72},
     {{"mix", 416}, 73},
     {{"unite", 372}, 73},
     {{"mix", 417}, 74},
     {{"unite", 373}, 74},
     {{"mix", 418}, 75},
     {{"unite", 374}, 75}];
get_cross_list(_) -> [].

get_all_cross_list() ->
    [{{"local", 1}, 1},
     {{"local", 2}, 1},
     {{"local", 3}, 1},
     {{"local", 4}, 1},
     {{"dev", 1}, 2},
     {{"dev", 2}, 2},
     {{"beta", 17}, 3},
     {{"beta", 33}, 3},
     {{"mix", 49}, 30},
     {{"mix", 1}, 30},
     {{"unite", 1}, 52},
     {{"unite", 65}, 52},
     {{"mix", 113}, 53},
     {{"mix", 177}, 53},
     {{"mix", 241}, 60},
     {{"unite", 129}, 60},
     {{"mix", 305}, 44},
     {{"unite", 225}, 44},
     {{"mix", 337}, 54},
     {{"unite", 257}, 54},
     {{"unite", 289}, 45},
     {{"unite", 305}, 45},
     {{"unite", 321}, 59},
     {{"unite", 329}, 59},
     {{"mix", 385}, 41},
     {{"unite", 337}, 41},
     {{"mix", 393}, 66},
     {{"unite", 345}, 66},
     {{"mix", 401}, 56},
     {{"unite", 357}, 56},
     {{"unite", 359}, 70},
     {{"unite", 361}, 70},
     {{"mix", 405}, 71},
     {{"unite", 363}, 71},
     {{"mix", 409}, 65},
     {{"unite", 365}, 65},
     {{"mix", 411}, 67},
     {{"unite", 367}, 67},
     {{"mix", 413}, 69},
     {{"unite", 369}, 69},
     {{"mix", 415}, 72},
     {{"unite", 371}, 72},
     {{"mix", 416}, 73},
     {{"unite", 372}, 73},
     {{"mix", 417}, 74},
     {{"unite", 373}, 74},
     {{"mix", 418}, 75},
     {{"unite", 374}, 75}].

get_all_cross_id({"local_center", 9000}) -> [1];
get_all_cross_id({"dev_center", 9000}) -> [2];
get_all_cross_id({"center", 9000}) ->
    [3,
     30,
     52,
     53,
     60,
     44,
     54,
     45,
     59,
     41,
     66,
     56,
     70,
     71,
     65,
     67,
     69,
     72,
     73,
     74,
     75];
get_all_cross_id(_) -> [0].

get_cross_zone(1) ->
    [{"local", 1},
     {"local", 2},
     {"local", 3},
     {"local", 4}];
get_cross_zone(2) -> [{"dev", 1}, {"dev", 2}];
get_cross_zone(3) -> [{"beta", 17}, {"beta", 33}];
get_cross_zone(30) -> [{"mix", 49}, {"mix", 1}];
get_cross_zone(52) -> [{"unite", 1}, {"unite", 65}];
get_cross_zone(53) -> [{"mix", 113}, {"mix", 177}];
get_cross_zone(60) -> [{"mix", 241}, {"unite", 129}];
get_cross_zone(44) -> [{"mix", 305}, {"unite", 225}];
get_cross_zone(54) -> [{"mix", 337}, {"unite", 257}];
get_cross_zone(45) -> [{"unite", 289}, {"unite", 305}];
get_cross_zone(59) -> [{"unite", 321}, {"unite", 329}];
get_cross_zone(41) -> [{"mix", 385}, {"unite", 337}];
get_cross_zone(66) -> [{"mix", 393}, {"unite", 345}];
get_cross_zone(56) -> [{"mix", 401}, {"unite", 357}];
get_cross_zone(70) -> [{"unite", 359}, {"unite", 361}];
get_cross_zone(71) -> [{"mix", 405}, {"unite", 363}];
get_cross_zone(65) -> [{"mix", 409}, {"unite", 365}];
get_cross_zone(67) -> [{"mix", 411}, {"unite", 367}];
get_cross_zone(69) -> [{"mix", 413}, {"unite", 369}];
get_cross_zone(72) -> [{"mix", 415}, {"unite", 371}];
get_cross_zone(73) -> [{"mix", 416}, {"unite", 372}];
get_cross_zone(74) -> [{"mix", 417}, {"unite", 373}];
get_cross_zone(75) -> [{"mix", 418}, {"unite", 374}];
get_cross_zone(_) -> [].

get_cross_id({"local", 1}) -> 1;
get_cross_id({"local", 2}) -> 1;
get_cross_id({"local", 3}) -> 1;
get_cross_id({"local", 4}) -> 1;
get_cross_id({"dev", 1}) -> 2;
get_cross_id({"dev", 2}) -> 2;
get_cross_id({"beta", 17}) -> 3;
get_cross_id({"beta", 33}) -> 3;
get_cross_id({"mix", 49}) -> 30;
get_cross_id({"mix", 1}) -> 30;
get_cross_id({"unite", 1}) -> 52;
get_cross_id({"unite", 65}) -> 52;
get_cross_id({"mix", 113}) -> 53;
get_cross_id({"mix", 177}) -> 53;
get_cross_id({"mix", 241}) -> 60;
get_cross_id({"unite", 129}) -> 60;
get_cross_id({"mix", 305}) -> 44;
get_cross_id({"unite", 225}) -> 44;
get_cross_id({"mix", 337}) -> 54;
get_cross_id({"unite", 257}) -> 54;
get_cross_id({"unite", 289}) -> 45;
get_cross_id({"unite", 305}) -> 45;
get_cross_id({"unite", 321}) -> 59;
get_cross_id({"unite", 329}) -> 59;
get_cross_id({"mix", 385}) -> 41;
get_cross_id({"unite", 337}) -> 41;
get_cross_id({"mix", 393}) -> 66;
get_cross_id({"unite", 345}) -> 66;
get_cross_id({"mix", 401}) -> 56;
get_cross_id({"unite", 357}) -> 56;
get_cross_id({"unite", 359}) -> 70;
get_cross_id({"unite", 361}) -> 70;
get_cross_id({"mix", 405}) -> 71;
get_cross_id({"unite", 363}) -> 71;
get_cross_id({"mix", 409}) -> 65;
get_cross_id({"unite", 365}) -> 65;
get_cross_id({"mix", 411}) -> 67;
get_cross_id({"unite", 367}) -> 67;
get_cross_id({"mix", 413}) -> 69;
get_cross_id({"unite", 369}) -> 69;
get_cross_id({"mix", 415}) -> 72;
get_cross_id({"unite", 371}) -> 72;
get_cross_id({"mix", 416}) -> 73;
get_cross_id({"unite", 372}) -> 73;
get_cross_id({"mix", 417}) -> 74;
get_cross_id({"unite", 373}) -> 74;
get_cross_id({"mix", 418}) -> 75;
get_cross_id({"unite", 374}) -> 75;
get_cross_id(_) -> 0.

get_guess(1) ->
    #{grade => 1, gold => 10, type => 90026,
      cacl_type => 90026, max_gold => 30};
get_guess(2) ->
    #{grade => 2, gold => 20, type => 90026,
      cacl_type => 90026, max_gold => 50};
get_guess(3) ->
    #{grade => 3, gold => 30, type => 90026,
      cacl_type => 90026, max_gold => 60};
get_guess(_) -> false.

get_reward({1, 1}) ->
    #{type => 1, result => 1, base_id => 90026, num => 800,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({1, 0}) ->
    #{type => 1, result => 0, base_id => 90026, num => 500,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({2, 1}) ->
    #{type => 2, result => 1, base_id => 90026, num => 400,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({2, 0}) ->
    #{type => 2, result => 0, base_id => 90026, num => 200,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({3, 1}) ->
    #{type => 3, result => 1, base_id => 90026, num => 300,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({3, 0}) ->
    #{type => 3, result => 0, base_id => 90026, num => 150,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({4, 1}) ->
    #{type => 4, result => 1, base_id => 90026, num => 200,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({4, 0}) ->
    #{type => 4, result => 0, base_id => 90026, num => 100,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({5, 1}) ->
    #{type => 5, result => 1, base_id => 90026, num => 150,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({5, 0}) ->
    #{type => 5, result => 0, base_id => 90026, num => 75,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({6, 1}) ->
    #{type => 6, result => 1, base_id => 90026, num => 100,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({6, 0}) ->
    #{type => 6, result => 0, base_id => 90026, num => 65,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({7, 1}) ->
    #{type => 7, result => 1, base_id => 90026, num => 80,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({7, 0}) ->
    #{type => 7, result => 0, base_id => 90026, num => 60,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({8, 1}) ->
    #{type => 8, result => 1, base_id => 90026, num => 60,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({8, 0}) ->
    #{type => 8, result => 0, base_id => 90026, num => 50,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward({9, 1}) ->
    #{type => 9, result => 1, base_id => 90026, num => 50,
      mod_id => 3350, exp_ratio => 2000,
      pet_exp_ratio => 2000, coin_ratio => 0};
get_reward({9, 0}) ->
    #{type => 9, result => 0, base_id => 90026, num => 45,
      mod_id => 3350, exp_ratio => 1000,
      pet_exp_ratio => 1000, coin_ratio => 0};
get_reward(_) -> false.

get_drug({96105, Times})
    when Times >= 1 andalso Times =< 1 ->
    [{90003, 2500}];
get_drug({96105, Times})
    when Times >= 2 andalso Times =< 2 ->
    [{90003, 5000}];
get_drug({96105, Times})
    when Times >= 3 andalso Times =< 3 ->
    [{90002, 20}];
get_drug({96105, Times})
    when Times >= 4 andalso Times =< 4 ->
    [{90002, 30}];
get_drug({96105, Times})
    when Times >= 5 andalso Times =< 99999 ->
    [{90002, 50}];
get_drug({96110, Times})
    when Times >= 1 andalso Times =< 1 ->
    [{90003, 2500}];
get_drug({96110, Times})
    when Times >= 2 andalso Times =< 2 ->
    [{90003, 5000}];
get_drug({96110, Times})
    when Times >= 3 andalso Times =< 3 ->
    [{90002, 20}];
get_drug({96110, Times})
    when Times >= 4 andalso Times =< 4 ->
    [{90002, 30}];
get_drug({96110, Times})
    when Times >= 5 andalso Times =< 99999 ->
    [{90002, 50}];
get_drug(_) -> false.

get_honor({59, 1}) ->
    #{rank_type => 59, rank => 1, honor_id => 11401};
get_honor({59, 2}) ->
    #{rank_type => 59, rank => 2, honor_id => 11402};
get_honor({59, 3}) ->
    #{rank_type => 59, rank => 3, honor_id => 11403};
get_honor({59, 4}) ->
    #{rank_type => 59, rank => 4, honor_id => 11404};
get_honor({59, 5}) ->
    #{rank_type => 59, rank => 5, honor_id => 11405};
get_honor({58, 1}) ->
    #{rank_type => 58, rank => 1, honor_id => 11406};
get_honor({58, 2}) ->
    #{rank_type => 58, rank => 2, honor_id => 11407};
get_honor({58, 3}) ->
    #{rank_type => 58, rank => 3, honor_id => 11408};
get_honor({58, 4}) ->
    #{rank_type => 58, rank => 4, honor_id => 11409};
get_honor({58, 5}) ->
    #{rank_type => 58, rank => 5, honor_id => 11410};
get_honor({57, 1}) ->
    #{rank_type => 57, rank => 1, honor_id => 11411};
get_honor({57, 2}) ->
    #{rank_type => 57, rank => 2, honor_id => 11412};
get_honor({57, 3}) ->
    #{rank_type => 57, rank => 3, honor_id => 11413};
get_honor({57, 4}) ->
    #{rank_type => 57, rank => 4, honor_id => 11414};
get_honor({57, 5}) ->
    #{rank_type => 57, rank => 5, honor_id => 11415};
get_honor({56, 1}) ->
    #{rank_type => 56, rank => 1, honor_id => 11416};
get_honor({56, 2}) ->
    #{rank_type => 56, rank => 2, honor_id => 11417};
get_honor({56, 3}) ->
    #{rank_type => 56, rank => 3, honor_id => 11418};
get_honor({56, 4}) ->
    #{rank_type => 56, rank => 4, honor_id => 11419};
get_honor({56, 5}) ->
    #{rank_type => 56, rank => 5, honor_id => 11420};
get_honor(_) -> false.

