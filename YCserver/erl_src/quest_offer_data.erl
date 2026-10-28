-file("src/data/quest_offer_data.erl", 1).

-module(quest_offer_data).

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

-file("src/data/quest_offer_data.erl", 14).

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

-file("src/data/quest_offer_data.erl", 15).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/data/quest_offer_data.erl", 16).

-file("inc/quest_offer.hrl", 1).

-type offer_notice() :: integer().

-record(quest_offer_ratio_data,
        {exp_ratio = 0, coin_ratio = 0, leader_ratio = 0}).

-record(quest_offer_calc_ratio,
        {count_exp = 0,
         count_coin = 0,
         count_leader = 0,
         lev_exp = 0,
         lev_coin = 0,
         pet_lev_exp = 0,
         name = ""}).

-record(quest_offer_reward_ratio,
        {exp = 0,
         coin = 0,
         pet_exp = 0,
         double_point = 1,
         ring_20_double = 1}).

-record(quest_offer_team_args,
        {round = 0,
         avg_lev = 1,
         member_num = 0,
         double_point = 0}).

-file("src/data/quest_offer_data.erl", 17).

-export([get_count_ratio/1,
         get_lev_ratio/1,
         get_leader_quests/0,
         get_quest_list/1,
         get_item_rewards/0,
         get_extra_rewards_list/0,
         get_stats_ratio/2,
         get_round_10_leader_item/0,
         get_base_dmg/1,
         get_medal_reward/1]).

get_count_ratio(1) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 500, leader_ratio = 200};
get_count_ratio(2) ->
    #quest_offer_ratio_data{exp_ratio = 1100,
                            coin_ratio = 550, leader_ratio = 200};
get_count_ratio(3) ->
    #quest_offer_ratio_data{exp_ratio = 1200,
                            coin_ratio = 600, leader_ratio = 200};
get_count_ratio(4) ->
    #quest_offer_ratio_data{exp_ratio = 1300,
                            coin_ratio = 650, leader_ratio = 200};
get_count_ratio(5) ->
    #quest_offer_ratio_data{exp_ratio = 1400,
                            coin_ratio = 700, leader_ratio = 200};
get_count_ratio(6) ->
    #quest_offer_ratio_data{exp_ratio = 1550,
                            coin_ratio = 770, leader_ratio = 200};
get_count_ratio(7) ->
    #quest_offer_ratio_data{exp_ratio = 1700,
                            coin_ratio = 850, leader_ratio = 200};
get_count_ratio(8) ->
    #quest_offer_ratio_data{exp_ratio = 1850,
                            coin_ratio = 920, leader_ratio = 200};
get_count_ratio(9) ->
    #quest_offer_ratio_data{exp_ratio = 2000,
                            coin_ratio = 1000, leader_ratio = 200};
get_count_ratio(10) ->
    #quest_offer_ratio_data{exp_ratio = 2200,
                            coin_ratio = 1100, leader_ratio = 200};
get_count_ratio(11) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 500, leader_ratio = 200};
get_count_ratio(12) ->
    #quest_offer_ratio_data{exp_ratio = 1100,
                            coin_ratio = 550, leader_ratio = 200};
get_count_ratio(13) ->
    #quest_offer_ratio_data{exp_ratio = 1200,
                            coin_ratio = 600, leader_ratio = 200};
get_count_ratio(14) ->
    #quest_offer_ratio_data{exp_ratio = 1300,
                            coin_ratio = 650, leader_ratio = 200};
get_count_ratio(15) ->
    #quest_offer_ratio_data{exp_ratio = 1400,
                            coin_ratio = 700, leader_ratio = 200};
get_count_ratio(16) ->
    #quest_offer_ratio_data{exp_ratio = 1550,
                            coin_ratio = 770, leader_ratio = 200};
get_count_ratio(17) ->
    #quest_offer_ratio_data{exp_ratio = 1700,
                            coin_ratio = 850, leader_ratio = 200};
get_count_ratio(18) ->
    #quest_offer_ratio_data{exp_ratio = 1850,
                            coin_ratio = 920, leader_ratio = 200};
get_count_ratio(19) ->
    #quest_offer_ratio_data{exp_ratio = 2000,
                            coin_ratio = 1000, leader_ratio = 200};
get_count_ratio(20) ->
    #quest_offer_ratio_data{exp_ratio = 2200,
                            coin_ratio = 1100, leader_ratio = 200};
get_count_ratio(_Count) -> none.

get_lev_ratio(1) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 884};
get_lev_ratio(2) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 888};
get_lev_ratio(3) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 892};
get_lev_ratio(4) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 896};
get_lev_ratio(5) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 900};
get_lev_ratio(6) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 904};
get_lev_ratio(7) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 908};
get_lev_ratio(8) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 912};
get_lev_ratio(9) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 916};
get_lev_ratio(10) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 920};
get_lev_ratio(11) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 924};
get_lev_ratio(12) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 928};
get_lev_ratio(13) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 932};
get_lev_ratio(14) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 936};
get_lev_ratio(15) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 940};
get_lev_ratio(16) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 944};
get_lev_ratio(17) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 948};
get_lev_ratio(18) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 952};
get_lev_ratio(19) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 956};
get_lev_ratio(20) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 960};
get_lev_ratio(21) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 964};
get_lev_ratio(22) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 968};
get_lev_ratio(23) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 972};
get_lev_ratio(24) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 976};
get_lev_ratio(25) ->
    #quest_offer_ratio_data{exp_ratio = 1000,
                            coin_ratio = 980};
get_lev_ratio(26) ->
    #quest_offer_ratio_data{exp_ratio = 1115,
                            coin_ratio = 984};
get_lev_ratio(27) ->
    #quest_offer_ratio_data{exp_ratio = 1134,
                            coin_ratio = 988};
get_lev_ratio(28) ->
    #quest_offer_ratio_data{exp_ratio = 1153,
                            coin_ratio = 992};
get_lev_ratio(29) ->
    #quest_offer_ratio_data{exp_ratio = 1172,
                            coin_ratio = 996};
get_lev_ratio(30) ->
    #quest_offer_ratio_data{exp_ratio = 1235,
                            coin_ratio = 1000};
get_lev_ratio(31) ->
    #quest_offer_ratio_data{exp_ratio = 1254,
                            coin_ratio = 1004};
get_lev_ratio(32) ->
    #quest_offer_ratio_data{exp_ratio = 1273,
                            coin_ratio = 1008};
get_lev_ratio(33) ->
    #quest_offer_ratio_data{exp_ratio = 1293,
                            coin_ratio = 1012};
get_lev_ratio(34) ->
    #quest_offer_ratio_data{exp_ratio = 1316,
                            coin_ratio = 1016};
get_lev_ratio(35) ->
    #quest_offer_ratio_data{exp_ratio = 1335,
                            coin_ratio = 1020};
get_lev_ratio(36) ->
    #quest_offer_ratio_data{exp_ratio = 1354,
                            coin_ratio = 1024};
get_lev_ratio(37) ->
    #quest_offer_ratio_data{exp_ratio = 1373,
                            coin_ratio = 1028};
get_lev_ratio(38) ->
    #quest_offer_ratio_data{exp_ratio = 1397,
                            coin_ratio = 1032};
get_lev_ratio(39) ->
    #quest_offer_ratio_data{exp_ratio = 1416,
                            coin_ratio = 1036};
get_lev_ratio(40) ->
    #quest_offer_ratio_data{exp_ratio = 1475,
                            coin_ratio = 1040};
get_lev_ratio(41) ->
    #quest_offer_ratio_data{exp_ratio = 1499,
                            coin_ratio = 1044};
get_lev_ratio(42) ->
    #quest_offer_ratio_data{exp_ratio = 1518,
                            coin_ratio = 1048};
get_lev_ratio(43) ->
    #quest_offer_ratio_data{exp_ratio = 1542,
                            coin_ratio = 1052};
get_lev_ratio(44) ->
    #quest_offer_ratio_data{exp_ratio = 1561,
                            coin_ratio = 1056};
get_lev_ratio(45) ->
    #quest_offer_ratio_data{exp_ratio = 1580,
                            coin_ratio = 1060};
get_lev_ratio(46) ->
    #quest_offer_ratio_data{exp_ratio = 1603,
                            coin_ratio = 1064};
get_lev_ratio(47) ->
    #quest_offer_ratio_data{exp_ratio = 1622,
                            coin_ratio = 1068};
get_lev_ratio(48) ->
    #quest_offer_ratio_data{exp_ratio = 1646,
                            coin_ratio = 1072};
get_lev_ratio(49) ->
    #quest_offer_ratio_data{exp_ratio = 1666,
                            coin_ratio = 1076};
get_lev_ratio(50) ->
    #quest_offer_ratio_data{exp_ratio = 1690,
                            coin_ratio = 1080};
get_lev_ratio(51) ->
    #quest_offer_ratio_data{exp_ratio = 1708,
                            coin_ratio = 1084};
get_lev_ratio(52) ->
    #quest_offer_ratio_data{exp_ratio = 1732,
                            coin_ratio = 1088};
get_lev_ratio(53) ->
    #quest_offer_ratio_data{exp_ratio = 1756,
                            coin_ratio = 1092};
get_lev_ratio(54) ->
    #quest_offer_ratio_data{exp_ratio = 1775,
                            coin_ratio = 1096};
get_lev_ratio(55) ->
    #quest_offer_ratio_data{exp_ratio = 1839,
                            coin_ratio = 1100};
get_lev_ratio(56) ->
    #quest_offer_ratio_data{exp_ratio = 1858,
                            coin_ratio = 1104};
get_lev_ratio(57) ->
    #quest_offer_ratio_data{exp_ratio = 1881,
                            coin_ratio = 1108};
get_lev_ratio(58) ->
    #quest_offer_ratio_data{exp_ratio = 1905,
                            coin_ratio = 1112};
get_lev_ratio(59) ->
    #quest_offer_ratio_data{exp_ratio = 1924,
                            coin_ratio = 1116};
get_lev_ratio(60) ->
    #quest_offer_ratio_data{exp_ratio = 1988,
                            coin_ratio = 1120};
get_lev_ratio(61) ->
    #quest_offer_ratio_data{exp_ratio = 2012,
                            coin_ratio = 1124};
get_lev_ratio(62) ->
    #quest_offer_ratio_data{exp_ratio = 2035,
                            coin_ratio = 1128};
get_lev_ratio(63) ->
    #quest_offer_ratio_data{exp_ratio = 1910,
                            coin_ratio = 1132};
get_lev_ratio(64) ->
    #quest_offer_ratio_data{exp_ratio = 1932,
                            coin_ratio = 1136};
get_lev_ratio(65) ->
    #quest_offer_ratio_data{exp_ratio = 1954,
                            coin_ratio = 1140};
get_lev_ratio(66) ->
    #quest_offer_ratio_data{exp_ratio = 1977,
                            coin_ratio = 1144};
get_lev_ratio(67) ->
    #quest_offer_ratio_data{exp_ratio = 1999,
                            coin_ratio = 1148};
get_lev_ratio(68) ->
    #quest_offer_ratio_data{exp_ratio = 2064,
                            coin_ratio = 1152};
get_lev_ratio(69) ->
    #quest_offer_ratio_data{exp_ratio = 2083,
                            coin_ratio = 1156};
get_lev_ratio(70) ->
    #quest_offer_ratio_data{exp_ratio = 2108,
                            coin_ratio = 1160};
get_lev_ratio(71) ->
    #quest_offer_ratio_data{exp_ratio = 2108,
                            coin_ratio = 1164};
get_lev_ratio(72) ->
    #quest_offer_ratio_data{exp_ratio = 2108,
                            coin_ratio = 1168};
get_lev_ratio(73) ->
    #quest_offer_ratio_data{exp_ratio = 2219,
                            coin_ratio = 1172};
get_lev_ratio(74) ->
    #quest_offer_ratio_data{exp_ratio = 2219,
                            coin_ratio = 1176};
get_lev_ratio(75) ->
    #quest_offer_ratio_data{exp_ratio = 2219,
                            coin_ratio = 1180};
get_lev_ratio(76) ->
    #quest_offer_ratio_data{exp_ratio = 2242,
                            coin_ratio = 1184};
get_lev_ratio(77) ->
    #quest_offer_ratio_data{exp_ratio = 2263,
                            coin_ratio = 1188};
get_lev_ratio(78) ->
    #quest_offer_ratio_data{exp_ratio = 2171,
                            coin_ratio = 1192};
get_lev_ratio(79) ->
    #quest_offer_ratio_data{exp_ratio = 2193,
                            coin_ratio = 1196};
get_lev_ratio(80) ->
    #quest_offer_ratio_data{exp_ratio = 2358,
                            coin_ratio = 1200};
get_lev_ratio(81) ->
    #quest_offer_ratio_data{exp_ratio = 2383,
                            coin_ratio = 1204};
get_lev_ratio(82) ->
    #quest_offer_ratio_data{exp_ratio = 2405,
                            coin_ratio = 1208};
get_lev_ratio(83) ->
    #quest_offer_ratio_data{exp_ratio = 2503,
                            coin_ratio = 1212};
get_lev_ratio(84) ->
    #quest_offer_ratio_data{exp_ratio = 2525,
                            coin_ratio = 1216};
get_lev_ratio(85) ->
    #quest_offer_ratio_data{exp_ratio = 2548,
                            coin_ratio = 1220};
get_lev_ratio(86) ->
    #quest_offer_ratio_data{exp_ratio = 2569,
                            coin_ratio = 1224};
get_lev_ratio(87) ->
    #quest_offer_ratio_data{exp_ratio = 2597,
                            coin_ratio = 1228};
get_lev_ratio(88) ->
    #quest_offer_ratio_data{exp_ratio = 2672,
                            coin_ratio = 1232};
get_lev_ratio(89) ->
    #quest_offer_ratio_data{exp_ratio = 2695,
                            coin_ratio = 1236};
get_lev_ratio(90) ->
    #quest_offer_ratio_data{exp_ratio = 2717,
                            coin_ratio = 1240};
get_lev_ratio(91) ->
    #quest_offer_ratio_data{exp_ratio = 2745,
                            coin_ratio = 1244};
get_lev_ratio(92) ->
    #quest_offer_ratio_data{exp_ratio = 2768,
                            coin_ratio = 1248};
get_lev_ratio(93) ->
    #quest_offer_ratio_data{exp_ratio = 2706,
                            coin_ratio = 1252};
get_lev_ratio(94) ->
    #quest_offer_ratio_data{exp_ratio = 2732,
                            coin_ratio = 1256};
get_lev_ratio(95) ->
    #quest_offer_ratio_data{exp_ratio = 2754,
                            coin_ratio = 1260};
get_lev_ratio(96) ->
    #quest_offer_ratio_data{exp_ratio = 2777,
                            coin_ratio = 1264};
get_lev_ratio(97) ->
    #quest_offer_ratio_data{exp_ratio = 2802,
                            coin_ratio = 1268};
get_lev_ratio(98) ->
    #quest_offer_ratio_data{exp_ratio = 2912,
                            coin_ratio = 1272};
get_lev_ratio(99) ->
    #quest_offer_ratio_data{exp_ratio = 2935,
                            coin_ratio = 1276};
get_lev_ratio(100) ->
    #quest_offer_ratio_data{exp_ratio = 3023,
                            coin_ratio = 1314};
get_lev_ratio(101) ->
    #quest_offer_ratio_data{exp_ratio = 3023,
                            coin_ratio = 1314};
get_lev_ratio(102) ->
    #quest_offer_ratio_data{exp_ratio = 3023,
                            coin_ratio = 1314};
get_lev_ratio(103) ->
    #quest_offer_ratio_data{exp_ratio = 3023,
                            coin_ratio = 1314};
get_lev_ratio(104) ->
    #quest_offer_ratio_data{exp_ratio = 3023,
                            coin_ratio = 1314};
get_lev_ratio(105) ->
    #quest_offer_ratio_data{exp_ratio = 3177,
                            coin_ratio = 1381};
get_lev_ratio(106) ->
    #quest_offer_ratio_data{exp_ratio = 3177,
                            coin_ratio = 1381};
get_lev_ratio(107) ->
    #quest_offer_ratio_data{exp_ratio = 3177,
                            coin_ratio = 1381};
get_lev_ratio(108) ->
    #quest_offer_ratio_data{exp_ratio = 3177,
                            coin_ratio = 1381};
get_lev_ratio(109) ->
    #quest_offer_ratio_data{exp_ratio = 3177,
                            coin_ratio = 1381};
get_lev_ratio(110) ->
    #quest_offer_ratio_data{exp_ratio = 3339,
                            coin_ratio = 1451};
get_lev_ratio(111) ->
    #quest_offer_ratio_data{exp_ratio = 3339,
                            coin_ratio = 1451};
get_lev_ratio(112) ->
    #quest_offer_ratio_data{exp_ratio = 3339,
                            coin_ratio = 1451};
get_lev_ratio(113) ->
    #quest_offer_ratio_data{exp_ratio = 3339,
                            coin_ratio = 1451};
get_lev_ratio(114) ->
    #quest_offer_ratio_data{exp_ratio = 3339,
                            coin_ratio = 1451};
get_lev_ratio(115) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(116) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(117) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(118) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(119) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(120) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(121) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(122) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(123) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(124) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(125) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(126) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(127) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(128) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(129) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(130) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(131) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(132) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(133) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(134) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(135) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(136) ->
    #quest_offer_ratio_data{exp_ratio = 3509,
                            coin_ratio = 1525};
get_lev_ratio(_Lev) -> none.

get_leader_quests() ->
    [31010, 31011, 31012, 31013, 31014, 31015].

get_extra_rewards_list() ->
    [{900, 20052, 0, 1},
     {50, 20058, 0, 1},
     {50, 20035, 0, 1}].

get_stats_ratio(1, Lev)
    when Lev =< 29 andalso Lev >= 20 ->
    [#gain{label = gold_bind, val = 1}];
get_stats_ratio(1, Lev)
    when Lev =< 39 andalso Lev >= 30 ->
    [#gain{label = gold_bind, val = 1}];
get_stats_ratio(1, Lev)
    when Lev =< 99 andalso Lev >= 40 ->
    [#gain{label = gold_bind, val = 1}];
get_stats_ratio(_Type, _Lev) -> none.

get_quest_list(2) ->
    [30000,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30007,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     30017,
     30018,
     30019,
     30020,
     30021,
     30022,
     30023,
     30024];
get_quest_list(3) ->
    [30000,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30007,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     30017,
     30018,
     30019,
     30020,
     30021,
     30022,
     30023,
     30024];
get_quest_list(4) ->
    [30000,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30007,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     30017,
     30018,
     30019,
     30020,
     30021,
     30022,
     30023,
     30024];
get_quest_list(5) ->
    [30000,
     30001,
     30002,
     30003,
     30004,
     30005,
     30006,
     30007,
     30008,
     30009,
     30010,
     30011,
     30012,
     30013,
     30014,
     30015,
     30016,
     30017,
     30018,
     30019,
     30020,
     30021,
     30022,
     30023,
     30024];
get_quest_list(_Teammates) -> [].

get_item_rewards() ->
    [{21521, 0},
     {21522, 0},
     {21524, 0},
     {21525, 0},
     {20042, 0},
     {0, 1000}].

get_round_10_leader_item() ->
    [{21220, 1, 150}, {90000, 20000, 850}].

get_base_dmg({1, 18}) -> 600;
get_base_dmg({1, 19}) -> 600;
get_base_dmg({1, 20}) -> 600;
get_base_dmg({1, 21}) -> 600;
get_base_dmg({1, 22}) -> 600;
get_base_dmg({1, 23}) -> 600;
get_base_dmg({1, 24}) -> 600;
get_base_dmg({1, 25}) -> 600;
get_base_dmg({1, 26}) -> 667;
get_base_dmg({1, 27}) -> 700;
get_base_dmg({1, 28}) -> 717;
get_base_dmg({1, 29}) -> 750;
get_base_dmg({1, 30}) -> 800;
get_base_dmg({1, 31}) -> 800;
get_base_dmg({1, 32}) -> 800;
get_base_dmg({1, 33}) -> 800;
get_base_dmg({1, 34}) -> 800;
get_base_dmg({1, 35}) -> 800;
get_base_dmg({1, 36}) -> 867;
get_base_dmg({1, 37}) -> 933;
get_base_dmg({1, 38}) -> 1000;
get_base_dmg({1, 39}) -> 1067;
get_base_dmg({1, 40}) -> 1200;
get_base_dmg({1, 41}) -> 1217;
get_base_dmg({1, 42}) -> 1233;
get_base_dmg({1, 43}) -> 1250;
get_base_dmg({1, 44}) -> 1267;
get_base_dmg({1, 45}) -> 1307;
get_base_dmg({1, 46}) -> 1333;
get_base_dmg({1, 47}) -> 1400;
get_base_dmg({1, 48}) -> 1467;
get_base_dmg({1, 49}) -> 1533;
get_base_dmg({1, 50}) -> 1600;
get_base_dmg({1, 51}) -> 1650;
get_base_dmg({1, 52}) -> 1700;
get_base_dmg({1, 53}) -> 1750;
get_base_dmg({1, 54}) -> 1800;
get_base_dmg({1, 55}) -> 1867;
get_base_dmg({1, 56}) -> 1933;
get_base_dmg({1, 57}) -> 2000;
get_base_dmg({1, 58}) -> 2067;
get_base_dmg({1, 59}) -> 2133;
get_base_dmg({1, 60}) -> 2267;
get_base_dmg({1, 61}) -> 2300;
get_base_dmg({1, 62}) -> 2333;
get_base_dmg({1, 63}) -> 2367;
get_base_dmg({1, 64}) -> 2417;
get_base_dmg({1, 65}) -> 2493;
get_base_dmg({1, 66}) -> 2550;
get_base_dmg({1, 67}) -> 2600;
get_base_dmg({1, 68}) -> 2650;
get_base_dmg({1, 69}) -> 2700;
get_base_dmg({1, 70}) -> 2800;
get_base_dmg({3, 18}) -> 360;
get_base_dmg({3, 19}) -> 360;
get_base_dmg({3, 20}) -> 360;
get_base_dmg({3, 21}) -> 360;
get_base_dmg({3, 22}) -> 360;
get_base_dmg({3, 23}) -> 360;
get_base_dmg({3, 24}) -> 360;
get_base_dmg({3, 25}) -> 360;
get_base_dmg({3, 26}) -> 400;
get_base_dmg({3, 27}) -> 420;
get_base_dmg({3, 28}) -> 430;
get_base_dmg({3, 29}) -> 450;
get_base_dmg({3, 30}) -> 480;
get_base_dmg({3, 31}) -> 480;
get_base_dmg({3, 32}) -> 480;
get_base_dmg({3, 33}) -> 480;
get_base_dmg({3, 34}) -> 480;
get_base_dmg({3, 35}) -> 480;
get_base_dmg({3, 36}) -> 520;
get_base_dmg({3, 37}) -> 560;
get_base_dmg({3, 38}) -> 600;
get_base_dmg({3, 39}) -> 640;
get_base_dmg({3, 40}) -> 720;
get_base_dmg({3, 41}) -> 730;
get_base_dmg({3, 42}) -> 740;
get_base_dmg({3, 43}) -> 750;
get_base_dmg({3, 44}) -> 760;
get_base_dmg({3, 45}) -> 783;
get_base_dmg({3, 46}) -> 800;
get_base_dmg({3, 47}) -> 840;
get_base_dmg({3, 48}) -> 880;
get_base_dmg({3, 49}) -> 920;
get_base_dmg({3, 50}) -> 960;
get_base_dmg({3, 51}) -> 990;
get_base_dmg({3, 52}) -> 1020;
get_base_dmg({3, 53}) -> 1050;
get_base_dmg({3, 54}) -> 1080;
get_base_dmg({3, 55}) -> 1120;
get_base_dmg({3, 56}) -> 1160;
get_base_dmg({3, 57}) -> 1200;
get_base_dmg({3, 58}) -> 1240;
get_base_dmg({3, 59}) -> 1280;
get_base_dmg({3, 60}) -> 1360;
get_base_dmg({3, 61}) -> 1380;
get_base_dmg({3, 62}) -> 1400;
get_base_dmg({3, 63}) -> 1420;
get_base_dmg({3, 64}) -> 1450;
get_base_dmg({3, 65}) -> 1495;
get_base_dmg({3, 66}) -> 1530;
get_base_dmg({3, 67}) -> 1560;
get_base_dmg({3, 68}) -> 1590;
get_base_dmg({3, 69}) -> 1620;
get_base_dmg({3, 70}) -> 1680;
get_base_dmg(_) -> false.

get_medal_reward(Times)
    when Times =< 4 andalso Times >= 1 ->
    [{24028, 1}, {90000, 50000}];
get_medal_reward(Times)
    when Times =< 999 andalso Times >= 5 ->
    [{90007, 5}];
get_medal_reward(_) -> [].

