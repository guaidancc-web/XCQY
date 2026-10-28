-file("src/data/endless_challenge_data.erl", 1).

-module(endless_challenge_data).

-export([get_combat_unit/1,
         get_wave_info/1,
         get_reward_info/1,
         get_skill_data/1,
         get_rank_reward/1,
         get_card_info/1,
         get_buff/1]).

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

-file("src/data/endless_challenge_data.erl", 20).

-file("inc/endless_challenge.hrl", 1).

-record(m_endless_challenge,
        {ver = 3 :: pos_integer(),
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = [],
         reward_list = [],
         best_wave = 0 :: non_neg_integer(),
         skill_list = [] :: list(),
         turn_count = 0,
         free_count = 0,
         fighter_times = 0}).

-record(mate_data,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         best_wave = 0,
         max_wave = 0,
         is_prepare = 0 :: non_neg_integer(),
         choose_skills = []}).

-record(endless_challenge_rank,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         wave = 0 :: non_neg_integer(),
         use_time = 0 :: non_neg_integer(),
         mate_datas = []}).

-file("src/data/endless_challenge_data.erl", 21).

get_combat_unit(1) -> 74200;
get_combat_unit(2) -> 74210;
get_combat_unit(3) -> 74220;
get_combat_unit(4) -> 74230;
get_combat_unit(5) -> 74240;
get_combat_unit(6) -> 74250;
get_combat_unit(7) -> 74260;
get_combat_unit(8) -> 74270;
get_combat_unit(9) -> 74280;
get_combat_unit(10) -> 74290;
get_combat_unit(11) -> 74300;
get_combat_unit(12) -> 74310;
get_combat_unit(13) -> 74320;
get_combat_unit(14) -> 74330;
get_combat_unit(15) -> 74340;
get_combat_unit(16) -> 74350;
get_combat_unit(17) -> 74360;
get_combat_unit(18) -> 74370;
get_combat_unit(19) -> 74380;
get_combat_unit(20) -> 74390;
get_combat_unit(21) -> 74400;
get_combat_unit(22) -> 74410;
get_combat_unit(23) -> 74420;
get_combat_unit(24) -> 74430;
get_combat_unit(25) -> 74440;
get_combat_unit(26) -> 74450;
get_combat_unit(27) -> 74460;
get_combat_unit(28) -> 74480;
get_combat_unit(29) -> 74490;
get_combat_unit(30) -> 74500;
get_combat_unit(31) -> 74510;
get_combat_unit(32) -> 74520;
get_combat_unit(_) -> false.

get_wave_info(1) ->
    #{wave => 1, unit_id => 74200, reward_id => 1001,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(2) ->
    #{wave => 2, unit_id => 74210, reward_id => 1002,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(3) ->
    #{wave => 3, unit_id => 74220, reward_id => 1003,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(4) ->
    #{wave => 4, unit_id => 74230, reward_id => 1004,
      is_jump => 1, round_limit => 3, jump_to => 8,
      isboss => 1, is_card => 0};
get_wave_info(5) ->
    #{wave => 5, unit_id => 74240, reward_id => 1005,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(6) ->
    #{wave => 6, unit_id => 74250, reward_id => 1006,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(7) ->
    #{wave => 7, unit_id => 74260, reward_id => 1007,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(8) ->
    #{wave => 8, unit_id => 74270, reward_id => 1008,
      is_jump => 1, round_limit => 3, jump_to => 12,
      isboss => 1, is_card => 0};
get_wave_info(9) ->
    #{wave => 9, unit_id => 74280, reward_id => 1009,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(10) ->
    #{wave => 10, unit_id => 74290, reward_id => 1010,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(11) ->
    #{wave => 11, unit_id => 74300, reward_id => 1011,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(12) ->
    #{wave => 12, unit_id => 74310, reward_id => 1012,
      is_jump => 1, round_limit => 4, jump_to => 16,
      isboss => 1, is_card => 1};
get_wave_info(13) ->
    #{wave => 13, unit_id => 74320, reward_id => 1013,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(14) ->
    #{wave => 14, unit_id => 74330, reward_id => 1014,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(15) ->
    #{wave => 15, unit_id => 74340, reward_id => 1015,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(16) ->
    #{wave => 16, unit_id => 74350, reward_id => 1016,
      is_jump => 1, round_limit => 4, jump_to => 19,
      isboss => 1, is_card => 0};
get_wave_info(17) ->
    #{wave => 17, unit_id => 74360, reward_id => 1017,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(18) ->
    #{wave => 18, unit_id => 74370, reward_id => 1018,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(19) ->
    #{wave => 19, unit_id => 74380, reward_id => 1019,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(20) ->
    #{wave => 20, unit_id => 74390, reward_id => 1020,
      is_jump => 0, isboss => 1, is_card => 0};
get_wave_info(21) ->
    #{wave => 21, unit_id => 74400, reward_id => 1021,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(22) ->
    #{wave => 22, unit_id => 74410, reward_id => 1022,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(23) ->
    #{wave => 23, unit_id => 74420, reward_id => 1023,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(24) ->
    #{wave => 24, unit_id => 74430, reward_id => 1024,
      is_jump => 0, isboss => 1, is_card => 0};
get_wave_info(25) ->
    #{wave => 25, unit_id => 74440, reward_id => 1025,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(26) ->
    #{wave => 26, unit_id => 74450, reward_id => 1026,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(27) ->
    #{wave => 27, unit_id => 74460, reward_id => 1027,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(28) ->
    #{wave => 28, unit_id => 74480, reward_id => 1028,
      is_jump => 0, isboss => 1, is_card => 0};
get_wave_info(29) ->
    #{wave => 29, unit_id => 74490, reward_id => 1029,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(30) ->
    #{wave => 30, unit_id => 74500, reward_id => 1030,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(31) ->
    #{wave => 31, unit_id => 74510, reward_id => 1031,
      is_jump => 0, isboss => 0, is_card => 0};
get_wave_info(32) ->
    #{wave => 32, unit_id => 74520, reward_id => 1032,
      is_jump => 0, isboss => 1, is_card => 0};
get_wave_info(_) -> false.

wave_reward(1) -> 1001;
wave_reward(2) -> 1002;
wave_reward(3) -> 1003;
wave_reward(4) -> 1004;
wave_reward(5) -> 1005;
wave_reward(6) -> 1006;
wave_reward(7) -> 1007;
wave_reward(8) -> 1008;
wave_reward(9) -> 1009;
wave_reward(10) -> 1010;
wave_reward(11) -> 1011;
wave_reward(12) -> 1012;
wave_reward(13) -> 1013;
wave_reward(14) -> 1014;
wave_reward(15) -> 1015;
wave_reward(16) -> 1016;
wave_reward(17) -> 1017;
wave_reward(18) -> 1018;
wave_reward(19) -> 1019;
wave_reward(20) -> 1020;
wave_reward(21) -> 1021;
wave_reward(22) -> 1022;
wave_reward(23) -> 1023;
wave_reward(24) -> 1024;
wave_reward(25) -> 1025;
wave_reward(26) -> 1026;
wave_reward(27) -> 1027;
wave_reward(28) -> 1028;
wave_reward(29) -> 1029;
wave_reward(30) -> 1030;
wave_reward(31) -> 1031;
wave_reward(32) -> 1032;
wave_reward(_) -> 0.

reward_info({1001, Glory}) when Glory =< 0 ->
    {[{90010, 2103}, {90005, 4948}, {90023, 1}], 74200};
reward_info({1002, Glory}) when Glory =< 0 ->
    {[{90010, 2103}, {90005, 4948}, {90023, 1}], 74200};
reward_info({1003, Glory}) when Glory =< 0 ->
    {[{90010, 2126}, {90005, 5000}, {90023, 1}], 74200};
reward_info({1004, Glory}) when Glory =< 0 ->
    {[{90010, 5426}, {90005, 12764}, {90023, 5}], 74210};
reward_info({1005, Glory}) when Glory =< 0 ->
    {[{90010, 2216}, {90005, 5213}, {90023, 1}], 74200};
reward_info({1006, Glory}) when Glory =< 0 ->
    {[{90010, 2216}, {90005, 5213}, {90023, 1}], 74200};
reward_info({1007, Glory}) when Glory =< 0 ->
    {[{90010, 2238}, {90005, 5267}, {90023, 1}], 74200};
reward_info({1008, Glory}) when Glory =< 0 ->
    {[{90010, 5708}, {90005, 13434}, {90023, 5}], 74210};
reward_info({1009, Glory}) when Glory =< 0 ->
    {[{90010, 2480}, {90005, 5833}, {90023, 1}], 74200};
reward_info({1010, Glory}) when Glory =< 0 ->
    {[{90010, 2480}, {90005, 5833}, {90023, 1}], 74200};
reward_info({1011, Glory}) when Glory =< 0 ->
    {[{90010, 2506}, {90005, 5897}, {90023, 1}], 74200};
reward_info({1012, Glory}) when Glory =< 0 ->
    {[{90010, 6379}, {90005, 15005}, {90023, 5}], 74210};
reward_info({1013, Glory}) when Glory =< 0 ->
    {[{90010, 2597}, {90005, 6109}, {90023, 1}], 74200};
reward_info({1014, Glory}) when Glory =< 0 ->
    {[{90010, 2597}, {90005, 6109}, {90023, 1}], 74200};
reward_info({1015, Glory}) when Glory =< 0 ->
    {[{90010, 2619}, {90005, 6163}, {90023, 1}], 74200};
reward_info({1016, Glory}) when Glory =< 0 ->
    {[{90010, 6672}, {90005, 15698}, {90023, 5}], 74220};
reward_info({1017, Glory}) when Glory =< 0 ->
    {[{90010, 2714}, {90005, 6386}, {90023, 1}], 74200};
reward_info({1018, Glory}) when Glory =< 0 ->
    {[{90010, 2714}, {90005, 6386}, {90023, 1}], 74200};
reward_info({1019, Glory}) when Glory =< 0 ->
    {[{90010, 2741}, {90005, 6450}, {90023, 1}], 74200};
reward_info({1020, Glory}) when Glory =< 0 ->
    {[{90010, 6966}, {90005, 16392}, {90023, 5}], 74220};
reward_info({1021, Glory}) when Glory =< 0 ->
    {[{90010, 2836}, {90005, 6673}, {90023, 1}], 74200};
reward_info({1022, Glory}) when Glory =< 0 ->
    {[{90010, 2836}, {90005, 6673}, {90023, 1}], 74200};
reward_info({1023, Glory}) when Glory =< 0 ->
    {[{90010, 2858}, {90005, 6725}, {90023, 1}], 74200};
reward_info({1024, Glory}) when Glory =< 0 ->
    {[{90010, 7271}, {90005, 17109}, {90023, 5}], 74230};
reward_info({1025, Glory}) when Glory =< 0 ->
    {[{90010, 2993}, {90005, 6964}, {90023, 1}], 74200};
reward_info({1026, Glory}) when Glory =< 0 ->
    {[{90010, 2993}, {90005, 6964}, {90023, 1}], 74200};
reward_info({1027, Glory}) when Glory =< 0 ->
    {[{90010, 3006}, {90005, 7033}, {90023, 1}], 74200};
reward_info({1028, Glory}) when Glory =< 0 ->
    {[{90010, 7582}, {90005, 17930}, {90023, 5}], 74230};
reward_info({1029, Glory}) when Glory =< 0 ->
    {[{90010, 3145}, {90005, 7314}, {90023, 1}], 74200};
reward_info({1030, Glory}) when Glory =< 0 ->
    {[{90010, 3145}, {90005, 7314}, {90023, 1}], 74200};
reward_info({1031, Glory}) when Glory =< 0 ->
    {[{90010, 3158}, {90005, 7388}, {90023, 1}], 74200};
reward_info({1032, Glory}) when Glory =< 0 ->
    {[{90010, 7966}, {90005, 18834}, {90023, 5}], 74230};
reward_info({1001, Glory}) when Glory =< 200 ->
    {[{90010, 2103}, {90005, 4948}, {90023, 1}], 74200};
reward_info({1002, Glory}) when Glory =< 200 ->
    {[{90010, 2103}, {90005, 4948}, {90023, 1}], 74200};
reward_info({1003, Glory}) when Glory =< 200 ->
    {[{90010, 2126}, {90005, 5000}, {90023, 1}], 74200};
reward_info({1004, Glory}) when Glory =< 200 ->
    {[{90010, 5426}, {90005, 12764}, {90023, 5}], 74210};
reward_info({1005, Glory}) when Glory =< 200 ->
    {[{90010, 2216}, {90005, 5213}, {90023, 1}], 74200};
reward_info({1006, Glory}) when Glory =< 200 ->
    {[{90010, 2216}, {90005, 5213}, {90023, 1}], 74200};
reward_info({1007, Glory}) when Glory =< 200 ->
    {[{90010, 2238}, {90005, 5267}, {90023, 1}], 74200};
reward_info({1008, Glory}) when Glory =< 200 ->
    {[{90010, 5708}, {90005, 13434}, {90023, 5}], 74210};
reward_info({1009, Glory}) when Glory =< 200 ->
    {[{90010, 2480}, {90005, 5833}, {90023, 1}], 74200};
reward_info({1010, Glory}) when Glory =< 200 ->
    {[{90010, 2480}, {90005, 5833}, {90023, 1}], 74200};
reward_info({1011, Glory}) when Glory =< 200 ->
    {[{90010, 2506}, {90005, 5897}, {90023, 1}], 74200};
reward_info({1012, Glory}) when Glory =< 200 ->
    {[{90010, 6379}, {90005, 15005}, {90023, 5}], 74210};
reward_info({1013, Glory}) when Glory =< 200 ->
    {[{90010, 2597}, {90005, 6109}, {90023, 1}], 74200};
reward_info({1014, Glory}) when Glory =< 200 ->
    {[{90010, 2597}, {90005, 6109}, {90023, 1}], 74200};
reward_info({1015, Glory}) when Glory =< 200 ->
    {[{90010, 2619}, {90005, 6163}, {90023, 1}], 74200};
reward_info({1016, Glory}) when Glory =< 200 ->
    {[{90010, 6672}, {90005, 15698}, {90023, 5}], 74220};
reward_info({1017, Glory}) when Glory =< 200 ->
    {[{90010, 2714}, {90005, 6386}, {90023, 1}], 74200};
reward_info({1018, Glory}) when Glory =< 200 ->
    {[{90010, 2714}, {90005, 6386}, {90023, 1}], 74200};
reward_info({1019, Glory}) when Glory =< 200 ->
    {[{90010, 2741}, {90005, 6450}, {90023, 1}], 74200};
reward_info({1020, Glory}) when Glory =< 200 ->
    {[{90010, 6966}, {90005, 16392}, {90023, 5}], 74220};
reward_info({1021, Glory}) when Glory =< 200 ->
    {[{90010, 2836}, {90005, 6673}, {90023, 1}], 74200};
reward_info({1022, Glory}) when Glory =< 200 ->
    {[{90010, 2836}, {90005, 6673}, {90023, 1}], 74200};
reward_info({1023, Glory}) when Glory =< 200 ->
    {[{90010, 2858}, {90005, 6725}, {90023, 1}], 74200};
reward_info({1024, Glory}) when Glory =< 200 ->
    {[{90010, 7271}, {90005, 17109}, {90023, 5}], 74230};
reward_info({1025, Glory}) when Glory =< 200 ->
    {[{90010, 2993}, {90005, 6964}, {90023, 1}], 74200};
reward_info({1026, Glory}) when Glory =< 200 ->
    {[{90010, 2993}, {90005, 6964}, {90023, 1}], 74200};
reward_info({1027, Glory}) when Glory =< 200 ->
    {[{90010, 3006}, {90005, 7033}, {90023, 1}], 74200};
reward_info({1028, Glory}) when Glory =< 200 ->
    {[{90010, 7582}, {90005, 17930}, {90023, 5}], 74230};
reward_info({1029, Glory}) when Glory =< 200 ->
    {[{90010, 3145}, {90005, 7314}, {90023, 1}], 74200};
reward_info({1030, Glory}) when Glory =< 200 ->
    {[{90010, 3145}, {90005, 7314}, {90023, 1}], 74200};
reward_info({1031, Glory}) when Glory =< 200 ->
    {[{90010, 3158}, {90005, 7388}, {90023, 1}], 74200};
reward_info({1032, Glory}) when Glory =< 200 ->
    {[{90010, 7966}, {90005, 18834}, {90023, 5}], 74230};
reward_info(_) -> false.

get_reward_info({Wave, Glory}) ->
    RewarId = wave_reward(Wave),
    reward_info({RewarId, Glory}).

get_skill_data(82120) ->
    #{skill_id => 82120, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82121) ->
    #{skill_id => 82121, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82124) ->
    #{skill_id => 82124, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82123) ->
    #{skill_id => 82123, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82125) ->
    #{skill_id => 82125, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82127) ->
    #{skill_id => 82127, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(82128) ->
    #{skill_id => 82128, lev => 70, glory => 0,
      cost => [{90023, 10}]};
get_skill_data(_) -> false.

get_rank_reward(Rank) when Rank =< 1 ->
    [{21098, 5}, {21433, 1}];
get_rank_reward(Rank) when Rank =< 10 ->
    [{21098, 5}, {21433, 1}];
get_rank_reward(Rank) when Rank =< 30 ->
    [{21098, 4}, {21433, 1}];
get_rank_reward(Rank) when Rank =< 60 -> [{21098, 3}];
get_rank_reward(Rank) when Rank =< 100 -> [{21098, 2}];
get_rank_reward(_) -> [].

get_card_info(1) ->
    #{times => 1, cost => [{90000, 200000}],
      drop_id => 74241};
get_card_info(2) ->
    #{times => 2, cost => [{90003, 3000}],
      drop_id => 74242};
get_card_info(3) ->
    #{times => 3, cost => [{90002, 60}], drop_id => 74243};
get_card_info(4) ->
    #{times => 4, cost => [{90002, 100}], drop_id => 74244};
get_card_info(5) ->
    #{times => 5, cost => [{90002, 160}], drop_id => 74245};
get_card_info(_) -> false.

get_buff(33) -> {[{90230, 1000, 0, 0, [300]}], 23};
get_buff(32) -> {[{90230, 1000, 0, 0, [300]}], 23};
get_buff(31) -> {[{90230, 1000, 0, 0, [300]}], 23};
get_buff(30) -> {[{90230, 1000, 0, 0, [300]}], 23};
get_buff(29) -> {[{90230, 1000, 0, 0, [300]}], 23};
get_buff(28) -> {[{90230, 1000, 0, 0, [300]}], 22};
get_buff(27) -> {[{90230, 1000, 0, 0, [300]}], 21};
get_buff(26) -> {[{90230, 1000, 0, 0, [300]}], 20};
get_buff(25) -> {[{90230, 1000, 0, 0, [300]}], 19};
get_buff(24) -> {[{90230, 1000, 0, 0, [300]}], 18};
get_buff(23) -> {[{90230, 1000, 0, 0, [300]}], 17};
get_buff(22) -> {[{90230, 1000, 0, 0, [300]}], 16};
get_buff(21) -> {[{90230, 1000, 0, 0, [300]}], 15};
get_buff(20) -> {[{90230, 1000, 0, 0, [300]}], 14};
get_buff(19) -> {[{90230, 1000, 0, 0, [300]}], 13};
get_buff(18) -> {[{90230, 1000, 0, 0, [300]}], 12};
get_buff(17) -> {[{90230, 1000, 0, 0, [300]}], 11};
get_buff(16) -> {[{90230, 1000, 0, 0, [300]}], 10};
get_buff(15) -> {[{90230, 1000, 0, 0, [300]}], 9};
get_buff(14) -> {[{90230, 1000, 0, 0, [300]}], 8};
get_buff(13) -> {[{90230, 1000, 0, 0, [300]}], 7};
get_buff(12) -> {[{90230, 1000, 0, 0, [300]}], 6};
get_buff(11) -> {[{90230, 1000, 0, 0, [300]}], 5};
get_buff(10) -> {[{90230, 1000, 0, 0, [300]}], 4};
get_buff(9) -> {[{90230, 1000, 0, 0, [300]}], 3};
get_buff(_) -> false.

