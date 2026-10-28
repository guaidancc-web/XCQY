-file("src/data/quest_prac_data.erl", 1).

-module(quest_prac_data).

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

-file("src/data/quest_prac_data.erl", 14).

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

-file("src/data/quest_prac_data.erl", 15).

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

-file("src/data/quest_prac_data.erl", 16).

-export([get_quest/1,
         get_catalg/1,
         get_total_chapters/1,
         get_total_sections/1,
         get_section_quests/1,
         get_help_reward/1]).

get_quest({1, 2, 1}) -> 10316;
get_quest({1, 2, 2}) -> 10320;
get_quest({1, 2, 3}) -> 10350;
get_quest({1, 2, 4}) -> 10360;
get_quest({1, 2, 5}) -> 10362;
get_quest({1, 2, 6}) -> 10364;
get_quest({1, 2, 7}) -> 10370;
get_quest({1, 2, 8}) -> 10374;
get_quest({1, 3, 1}) -> 10380;
get_quest({1, 3, 2}) -> 10384;
get_quest({1, 3, 3}) -> 10390;
get_quest({1, 3, 4}) -> 10394;
get_quest({1, 3, 5}) -> 10400;
get_quest({1, 3, 6}) -> 10402;
get_quest({1, 3, 7}) -> 10404;
get_quest({1, 3, 8}) -> 10410;
get_quest({1, 4, 1}) -> 10414;
get_quest({1, 4, 2}) -> 10420;
get_quest({1, 4, 3}) -> 10430;
get_quest({1, 4, 4}) -> 10432;
get_quest({1, 4, 5}) -> 10434;
get_quest({1, 4, 6}) -> 10436;
get_quest({1, 4, 7}) -> 10438;
get_quest({1, 4, 8}) -> 10440;
get_quest({1, 4, 9}) -> 10450;
get_quest({1, 4, 10}) -> 10455;
get_quest({1, 5, 1}) -> 10458;
get_quest({1, 5, 2}) -> 10460;
get_quest({1, 5, 3}) -> 10461;
get_quest({1, 5, 4}) -> 10462;
get_quest({1, 5, 5}) -> 10463;
get_quest({1, 5, 6}) -> 10464;
get_quest({2, 1, 1}) -> 10470;
get_quest({2, 1, 2}) -> 10475;
get_quest({2, 1, 3}) -> 10480;
get_quest({2, 1, 4}) -> 10484;
get_quest({2, 1, 5}) -> 10486;
get_quest({2, 1, 6}) -> 10490;
get_quest({2, 1, 7}) -> 10494;
get_quest({2, 1, 8}) -> 10500;
get_quest({2, 1, 9}) -> 10510;
get_quest({2, 2, 1}) -> 10514;
get_quest({2, 2, 2}) -> 10520;
get_quest({2, 2, 3}) -> 10521;
get_quest({2, 2, 4}) -> 10522;
get_quest({2, 2, 5}) -> 10523;
get_quest({2, 2, 6}) -> 10524;
get_quest({2, 2, 7}) -> 10525;
get_quest({2, 2, 8}) -> 10526;
get_quest({2, 2, 9}) -> 10527;
get_quest({2, 2, 10}) -> 10528;
get_quest({2, 3, 1}) -> 10530;
get_quest({2, 3, 2}) -> 10532;
get_quest({2, 3, 3}) -> 10534;
get_quest({2, 3, 4}) -> 10540;
get_quest({2, 3, 5}) -> 10544;
get_quest({2, 3, 6}) -> 10550;
get_quest({2, 3, 7}) -> 10560;
get_quest({2, 3, 8}) -> 10564;
get_quest({2, 4, 1}) -> 10568;
get_quest({2, 4, 2}) -> 10570;
get_quest({2, 4, 3}) -> 10580;
get_quest({2, 4, 4}) -> 10582;
get_quest({2, 4, 5}) -> 10590;
get_quest({2, 4, 6}) -> 10600;
get_quest({2, 4, 7}) -> 10610;
get_quest({2, 4, 8}) -> 10620;
get_quest({2, 4, 9}) -> 10630;
get_quest({2, 4, 10}) -> 10640;
get_quest({2, 5, 1}) -> 10650;
get_quest({2, 5, 2}) -> 10660;
get_quest({2, 5, 3}) -> 10670;
get_quest({2, 5, 4}) -> 10680;
get_quest({2, 5, 5}) -> 10690;
get_quest({2, 5, 6}) -> 10700;
get_quest({2, 5, 7}) -> 10710;
get_quest({2, 5, 8}) -> 10720;
get_quest({2, 5, 9}) -> 10730;
get_quest({3, 1, 1}) -> 10740;
get_quest({3, 1, 2}) -> 10750;
get_quest({3, 1, 3}) -> 10760;
get_quest({3, 1, 4}) -> 10770;
get_quest({3, 1, 5}) -> 10780;
get_quest({3, 1, 6}) -> 10790;
get_quest({3, 1, 7}) -> 10800;
get_quest({3, 1, 8}) -> 10810;
get_quest({3, 1, 9}) -> 10820;
get_quest({3, 1, 10}) -> 10830;
get_quest({3, 1, 11}) -> 10840;
get_quest({3, 2, 1}) -> 10850;
get_quest({3, 2, 2}) -> 10860;
get_quest({3, 2, 3}) -> 10870;
get_quest({3, 2, 4}) -> 10880;
get_quest({3, 2, 5}) -> 10890;
get_quest({3, 2, 6}) -> 10900;
get_quest({3, 2, 7}) -> 10910;
get_quest({3, 2, 8}) -> 10920;
get_quest({3, 2, 9}) -> 10930;
get_quest({3, 2, 10}) -> 10940;
get_quest({3, 2, 11}) -> 10950;
get_quest({3, 3, 1}) -> 10960;
get_quest({3, 3, 2}) -> 10970;
get_quest({3, 3, 3}) -> 10980;
get_quest({3, 3, 4}) -> 10990;
get_quest({3, 3, 5}) -> 11000;
get_quest({3, 3, 6}) -> 11010;
get_quest({3, 3, 7}) -> 11020;
get_quest({3, 3, 8}) -> 11030;
get_quest({3, 3, 9}) -> 11040;
get_quest({3, 3, 10}) -> 11050;
get_quest({3, 3, 11}) -> 11060;
get_quest({3, 4, 1}) -> 11070;
get_quest({3, 4, 2}) -> 11080;
get_quest({3, 4, 3}) -> 11090;
get_quest({3, 4, 4}) -> 11100;
get_quest({3, 4, 5}) -> 11110;
get_quest({3, 4, 6}) -> 11120;
get_quest({3, 4, 7}) -> 11130;
get_quest({3, 4, 8}) -> 11140;
get_quest({3, 4, 9}) -> 11150;
get_quest({3, 4, 10}) -> 11160;
get_quest({3, 4, 11}) -> 11170;
get_quest({3, 5, 1}) -> 11180;
get_quest({3, 5, 2}) -> 11190;
get_quest({3, 5, 3}) -> 11200;
get_quest({3, 5, 4}) -> 11210;
get_quest({3, 5, 5}) -> 11220;
get_quest({3, 5, 6}) -> 11240;
get_quest({3, 5, 7}) -> 11250;
get_quest({3, 5, 8}) -> 11260;
get_quest({3, 5, 9}) -> 11270;
get_quest({3, 5, 10}) -> 11276;
get_quest({3, 5, 11}) -> 11280;
get_quest({3, 5, 12}) -> 11290;
get_quest({4, 1, 1}) -> 11300;
get_quest({4, 1, 2}) -> 11310;
get_quest({4, 1, 3}) -> 11320;
get_quest({4, 1, 4}) -> 11330;
get_quest({4, 1, 5}) -> 11340;
get_quest({4, 1, 6}) -> 11350;
get_quest({4, 1, 7}) -> 11360;
get_quest({4, 1, 8}) -> 11370;
get_quest({4, 1, 9}) -> 11380;
get_quest({4, 1, 10}) -> 11390;
get_quest({4, 1, 11}) -> 11400;
get_quest({4, 2, 1}) -> 11410;
get_quest({4, 2, 2}) -> 11420;
get_quest({4, 2, 3}) -> 11430;
get_quest({4, 2, 4}) -> 11440;
get_quest({4, 2, 5}) -> 11450;
get_quest({4, 2, 6}) -> 11460;
get_quest({4, 2, 7}) -> 11470;
get_quest({4, 2, 8}) -> 11480;
get_quest({4, 2, 9}) -> 11490;
get_quest({4, 2, 10}) -> 11500;
get_quest({4, 2, 11}) -> 11510;
get_quest({4, 2, 12}) -> 11520;
get_quest({4, 3, 1}) -> 11530;
get_quest({4, 3, 2}) -> 11540;
get_quest({4, 3, 3}) -> 11550;
get_quest({4, 3, 4}) -> 11560;
get_quest({4, 3, 5}) -> 11570;
get_quest({4, 3, 6}) -> 11580;
get_quest({4, 3, 7}) -> 11590;
get_quest({4, 3, 8}) -> 11600;
get_quest({4, 3, 9}) -> 11610;
get_quest({4, 3, 10}) -> 11620;
get_quest({4, 3, 11}) -> 11630;
get_quest({4, 3, 12}) -> 11640;
get_quest({4, 4, 1}) -> 11650;
get_quest({4, 4, 2}) -> 11660;
get_quest({4, 4, 3}) -> 11670;
get_quest({4, 4, 4}) -> 11680;
get_quest({4, 4, 5}) -> 11690;
get_quest({4, 4, 6}) -> 11700;
get_quest({4, 4, 7}) -> 11710;
get_quest({4, 4, 8}) -> 11720;
get_quest({4, 4, 9}) -> 11730;
get_quest({4, 4, 10}) -> 11740;
get_quest({4, 4, 11}) -> 11750;
get_quest({4, 4, 12}) -> 11760;
get_quest({4, 5, 1}) -> 11770;
get_quest({4, 5, 2}) -> 11780;
get_quest({4, 5, 3}) -> 11790;
get_quest({4, 5, 4}) -> 11800;
get_quest({4, 5, 5}) -> 11810;
get_quest({4, 5, 6}) -> 11820;
get_quest({4, 5, 7}) -> 11830;
get_quest({4, 5, 8}) -> 11840;
get_quest({4, 5, 9}) -> 11850;
get_quest({4, 5, 10}) -> 11860;
get_quest({4, 5, 11}) -> 11890;
get_quest({4, 5, 12}) -> 11900;
get_quest({4, 5, 13}) -> 11910;
get_quest({5, 1, 1}) -> 11920;
get_quest({5, 1, 2}) -> 11930;
get_quest({5, 1, 3}) -> 11940;
get_quest({5, 1, 4}) -> 11950;
get_quest({5, 1, 5}) -> 11960;
get_quest({5, 1, 6}) -> 11970;
get_quest({5, 1, 7}) -> 11980;
get_quest({5, 1, 8}) -> 11990;
get_quest({5, 1, 9}) -> 12000;
get_quest({5, 1, 10}) -> 12010;
get_quest({5, 1, 11}) -> 12020;
get_quest({5, 1, 12}) -> 12030;
get_quest({5, 1, 13}) -> 12040;
get_quest({5, 2, 1}) -> 12050;
get_quest({5, 2, 2}) -> 12060;
get_quest({5, 2, 3}) -> 12070;
get_quest({5, 2, 4}) -> 12080;
get_quest({5, 2, 5}) -> 12090;
get_quest({5, 2, 6}) -> 12100;
get_quest({5, 2, 7}) -> 12110;
get_quest({5, 2, 8}) -> 12120;
get_quest({5, 2, 9}) -> 12130;
get_quest({5, 2, 10}) -> 12140;
get_quest({5, 2, 11}) -> 12150;
get_quest({5, 2, 12}) -> 12160;
get_quest({5, 3, 1}) -> 12170;
get_quest({5, 3, 2}) -> 12180;
get_quest({5, 3, 3}) -> 12190;
get_quest({5, 3, 4}) -> 12200;
get_quest({5, 3, 5}) -> 12210;
get_quest({5, 3, 6}) -> 12220;
get_quest({5, 3, 7}) -> 12230;
get_quest({5, 3, 8}) -> 12240;
get_quest({5, 3, 9}) -> 12250;
get_quest({5, 3, 10}) -> 12260;
get_quest({5, 3, 11}) -> 12270;
get_quest({5, 4, 1}) -> 12280;
get_quest({5, 4, 2}) -> 12290;
get_quest({5, 4, 3}) -> 12300;
get_quest({5, 4, 4}) -> 12310;
get_quest({5, 4, 5}) -> 12320;
get_quest({5, 4, 6}) -> 12330;
get_quest({5, 4, 7}) -> 12340;
get_quest({5, 4, 8}) -> 12350;
get_quest({5, 4, 9}) -> 12360;
get_quest({5, 4, 10}) -> 12370;
get_quest({5, 4, 11}) -> 12380;
get_quest({5, 4, 12}) -> 12390;
get_quest({5, 5, 1}) -> 12400;
get_quest({5, 5, 2}) -> 12410;
get_quest({5, 5, 3}) -> 12420;
get_quest({5, 5, 4}) -> 12430;
get_quest({5, 5, 5}) -> 12440;
get_quest({5, 5, 6}) -> 12450;
get_quest({5, 5, 7}) -> 12460;
get_quest({5, 5, 8}) -> 12470;
get_quest({5, 5, 9}) -> 12480;
get_quest({5, 5, 10}) -> 12490;
get_quest({5, 5, 11}) -> 12500;
get_quest({5, 5, 12}) -> 12510;
get_quest({6, 1, 1}) -> 12520;
get_quest({6, 1, 2}) -> 12530;
get_quest({6, 1, 3}) -> 12540;
get_quest({6, 1, 4}) -> 12550;
get_quest({6, 1, 5}) -> 12560;
get_quest({6, 1, 6}) -> 12570;
get_quest({6, 1, 7}) -> 12580;
get_quest({6, 1, 8}) -> 12590;
get_quest({6, 1, 9}) -> 12600;
get_quest({6, 1, 10}) -> 12610;
get_quest({6, 1, 11}) -> 12620;
get_quest({6, 1, 12}) -> 12630;
get_quest({6, 2, 1}) -> 12640;
get_quest({6, 2, 2}) -> 12650;
get_quest({6, 2, 3}) -> 12660;
get_quest({6, 2, 4}) -> 12670;
get_quest({6, 2, 5}) -> 12680;
get_quest({6, 2, 6}) -> 12690;
get_quest({6, 2, 7}) -> 12700;
get_quest({6, 2, 8}) -> 12710;
get_quest({6, 2, 9}) -> 12720;
get_quest({6, 2, 10}) -> 12730;
get_quest({6, 2, 11}) -> 12740;
get_quest({6, 2, 12}) -> 12750;
get_quest({6, 3, 1}) -> 12760;
get_quest({6, 3, 2}) -> 12770;
get_quest({6, 3, 3}) -> 12780;
get_quest({6, 3, 4}) -> 12790;
get_quest({6, 3, 5}) -> 12800;
get_quest({6, 3, 6}) -> 12810;
get_quest({6, 3, 7}) -> 12820;
get_quest({6, 3, 8}) -> 12830;
get_quest({6, 3, 9}) -> 12840;
get_quest({6, 3, 10}) -> 12850;
get_quest({6, 3, 11}) -> 12860;
get_quest({6, 3, 12}) -> 12870;
get_quest(_) -> none.

get_catalg(10316) -> {1, 2, 1};
get_catalg(10320) -> {1, 2, 2};
get_catalg(10350) -> {1, 2, 3};
get_catalg(10360) -> {1, 2, 4};
get_catalg(10362) -> {1, 2, 5};
get_catalg(10364) -> {1, 2, 6};
get_catalg(10370) -> {1, 2, 7};
get_catalg(10374) -> {1, 2, 8};
get_catalg(10380) -> {1, 3, 1};
get_catalg(10384) -> {1, 3, 2};
get_catalg(10390) -> {1, 3, 3};
get_catalg(10394) -> {1, 3, 4};
get_catalg(10400) -> {1, 3, 5};
get_catalg(10402) -> {1, 3, 6};
get_catalg(10404) -> {1, 3, 7};
get_catalg(10410) -> {1, 3, 8};
get_catalg(10414) -> {1, 4, 1};
get_catalg(10420) -> {1, 4, 2};
get_catalg(10430) -> {1, 4, 3};
get_catalg(10432) -> {1, 4, 4};
get_catalg(10434) -> {1, 4, 5};
get_catalg(10436) -> {1, 4, 6};
get_catalg(10438) -> {1, 4, 7};
get_catalg(10440) -> {1, 4, 8};
get_catalg(10450) -> {1, 4, 9};
get_catalg(10455) -> {1, 4, 10};
get_catalg(10458) -> {1, 5, 1};
get_catalg(10460) -> {1, 5, 2};
get_catalg(10461) -> {1, 5, 3};
get_catalg(10462) -> {1, 5, 4};
get_catalg(10463) -> {1, 5, 5};
get_catalg(10464) -> {1, 5, 6};
get_catalg(10470) -> {2, 1, 1};
get_catalg(10475) -> {2, 1, 2};
get_catalg(10480) -> {2, 1, 3};
get_catalg(10484) -> {2, 1, 4};
get_catalg(10486) -> {2, 1, 5};
get_catalg(10490) -> {2, 1, 6};
get_catalg(10494) -> {2, 1, 7};
get_catalg(10500) -> {2, 1, 8};
get_catalg(10510) -> {2, 1, 9};
get_catalg(10514) -> {2, 2, 1};
get_catalg(10520) -> {2, 2, 2};
get_catalg(10521) -> {2, 2, 3};
get_catalg(10522) -> {2, 2, 4};
get_catalg(10523) -> {2, 2, 5};
get_catalg(10524) -> {2, 2, 6};
get_catalg(10525) -> {2, 2, 7};
get_catalg(10526) -> {2, 2, 8};
get_catalg(10527) -> {2, 2, 9};
get_catalg(10528) -> {2, 2, 10};
get_catalg(10530) -> {2, 3, 1};
get_catalg(10532) -> {2, 3, 2};
get_catalg(10534) -> {2, 3, 3};
get_catalg(10540) -> {2, 3, 4};
get_catalg(10544) -> {2, 3, 5};
get_catalg(10550) -> {2, 3, 6};
get_catalg(10560) -> {2, 3, 7};
get_catalg(10564) -> {2, 3, 8};
get_catalg(10568) -> {2, 4, 1};
get_catalg(10570) -> {2, 4, 2};
get_catalg(10580) -> {2, 4, 3};
get_catalg(10582) -> {2, 4, 4};
get_catalg(10590) -> {2, 4, 5};
get_catalg(10600) -> {2, 4, 6};
get_catalg(10610) -> {2, 4, 7};
get_catalg(10620) -> {2, 4, 8};
get_catalg(10630) -> {2, 4, 9};
get_catalg(10640) -> {2, 4, 10};
get_catalg(10650) -> {2, 5, 1};
get_catalg(10660) -> {2, 5, 2};
get_catalg(10670) -> {2, 5, 3};
get_catalg(10680) -> {2, 5, 4};
get_catalg(10690) -> {2, 5, 5};
get_catalg(10700) -> {2, 5, 6};
get_catalg(10710) -> {2, 5, 7};
get_catalg(10720) -> {2, 5, 8};
get_catalg(10730) -> {2, 5, 9};
get_catalg(10740) -> {3, 1, 1};
get_catalg(10750) -> {3, 1, 2};
get_catalg(10760) -> {3, 1, 3};
get_catalg(10770) -> {3, 1, 4};
get_catalg(10780) -> {3, 1, 5};
get_catalg(10790) -> {3, 1, 6};
get_catalg(10800) -> {3, 1, 7};
get_catalg(10810) -> {3, 1, 8};
get_catalg(10820) -> {3, 1, 9};
get_catalg(10830) -> {3, 1, 10};
get_catalg(10840) -> {3, 1, 11};
get_catalg(10850) -> {3, 2, 1};
get_catalg(10860) -> {3, 2, 2};
get_catalg(10870) -> {3, 2, 3};
get_catalg(10880) -> {3, 2, 4};
get_catalg(10890) -> {3, 2, 5};
get_catalg(10900) -> {3, 2, 6};
get_catalg(10910) -> {3, 2, 7};
get_catalg(10920) -> {3, 2, 8};
get_catalg(10930) -> {3, 2, 9};
get_catalg(10940) -> {3, 2, 10};
get_catalg(10950) -> {3, 2, 11};
get_catalg(10960) -> {3, 3, 1};
get_catalg(10970) -> {3, 3, 2};
get_catalg(10980) -> {3, 3, 3};
get_catalg(10990) -> {3, 3, 4};
get_catalg(11000) -> {3, 3, 5};
get_catalg(11010) -> {3, 3, 6};
get_catalg(11020) -> {3, 3, 7};
get_catalg(11030) -> {3, 3, 8};
get_catalg(11040) -> {3, 3, 9};
get_catalg(11050) -> {3, 3, 10};
get_catalg(11060) -> {3, 3, 11};
get_catalg(11070) -> {3, 4, 1};
get_catalg(11080) -> {3, 4, 2};
get_catalg(11090) -> {3, 4, 3};
get_catalg(11100) -> {3, 4, 4};
get_catalg(11110) -> {3, 4, 5};
get_catalg(11120) -> {3, 4, 6};
get_catalg(11130) -> {3, 4, 7};
get_catalg(11140) -> {3, 4, 8};
get_catalg(11150) -> {3, 4, 9};
get_catalg(11160) -> {3, 4, 10};
get_catalg(11170) -> {3, 4, 11};
get_catalg(11180) -> {3, 5, 1};
get_catalg(11190) -> {3, 5, 2};
get_catalg(11200) -> {3, 5, 3};
get_catalg(11210) -> {3, 5, 4};
get_catalg(11220) -> {3, 5, 5};
get_catalg(11240) -> {3, 5, 6};
get_catalg(11250) -> {3, 5, 7};
get_catalg(11260) -> {3, 5, 8};
get_catalg(11270) -> {3, 5, 9};
get_catalg(11276) -> {3, 5, 10};
get_catalg(11280) -> {3, 5, 11};
get_catalg(11290) -> {3, 5, 12};
get_catalg(11300) -> {4, 1, 1};
get_catalg(11310) -> {4, 1, 2};
get_catalg(11320) -> {4, 1, 3};
get_catalg(11330) -> {4, 1, 4};
get_catalg(11340) -> {4, 1, 5};
get_catalg(11350) -> {4, 1, 6};
get_catalg(11360) -> {4, 1, 7};
get_catalg(11370) -> {4, 1, 8};
get_catalg(11380) -> {4, 1, 9};
get_catalg(11390) -> {4, 1, 10};
get_catalg(11400) -> {4, 1, 11};
get_catalg(11410) -> {4, 2, 1};
get_catalg(11420) -> {4, 2, 2};
get_catalg(11430) -> {4, 2, 3};
get_catalg(11440) -> {4, 2, 4};
get_catalg(11450) -> {4, 2, 5};
get_catalg(11460) -> {4, 2, 6};
get_catalg(11470) -> {4, 2, 7};
get_catalg(11480) -> {4, 2, 8};
get_catalg(11490) -> {4, 2, 9};
get_catalg(11500) -> {4, 2, 10};
get_catalg(11510) -> {4, 2, 11};
get_catalg(11520) -> {4, 2, 12};
get_catalg(11530) -> {4, 3, 1};
get_catalg(11540) -> {4, 3, 2};
get_catalg(11550) -> {4, 3, 3};
get_catalg(11560) -> {4, 3, 4};
get_catalg(11570) -> {4, 3, 5};
get_catalg(11580) -> {4, 3, 6};
get_catalg(11590) -> {4, 3, 7};
get_catalg(11600) -> {4, 3, 8};
get_catalg(11610) -> {4, 3, 9};
get_catalg(11620) -> {4, 3, 10};
get_catalg(11630) -> {4, 3, 11};
get_catalg(11640) -> {4, 3, 12};
get_catalg(11650) -> {4, 4, 1};
get_catalg(11660) -> {4, 4, 2};
get_catalg(11670) -> {4, 4, 3};
get_catalg(11680) -> {4, 4, 4};
get_catalg(11690) -> {4, 4, 5};
get_catalg(11700) -> {4, 4, 6};
get_catalg(11710) -> {4, 4, 7};
get_catalg(11720) -> {4, 4, 8};
get_catalg(11730) -> {4, 4, 9};
get_catalg(11740) -> {4, 4, 10};
get_catalg(11750) -> {4, 4, 11};
get_catalg(11760) -> {4, 4, 12};
get_catalg(11770) -> {4, 5, 1};
get_catalg(11780) -> {4, 5, 2};
get_catalg(11790) -> {4, 5, 3};
get_catalg(11800) -> {4, 5, 4};
get_catalg(11810) -> {4, 5, 5};
get_catalg(11820) -> {4, 5, 6};
get_catalg(11830) -> {4, 5, 7};
get_catalg(11840) -> {4, 5, 8};
get_catalg(11850) -> {4, 5, 9};
get_catalg(11860) -> {4, 5, 10};
get_catalg(11890) -> {4, 5, 11};
get_catalg(11900) -> {4, 5, 12};
get_catalg(11910) -> {4, 5, 13};
get_catalg(11920) -> {5, 1, 1};
get_catalg(11930) -> {5, 1, 2};
get_catalg(11940) -> {5, 1, 3};
get_catalg(11950) -> {5, 1, 4};
get_catalg(11960) -> {5, 1, 5};
get_catalg(11970) -> {5, 1, 6};
get_catalg(11980) -> {5, 1, 7};
get_catalg(11990) -> {5, 1, 8};
get_catalg(12000) -> {5, 1, 9};
get_catalg(12010) -> {5, 1, 10};
get_catalg(12020) -> {5, 1, 11};
get_catalg(12030) -> {5, 1, 12};
get_catalg(12040) -> {5, 1, 13};
get_catalg(12050) -> {5, 2, 1};
get_catalg(12060) -> {5, 2, 2};
get_catalg(12070) -> {5, 2, 3};
get_catalg(12080) -> {5, 2, 4};
get_catalg(12090) -> {5, 2, 5};
get_catalg(12100) -> {5, 2, 6};
get_catalg(12110) -> {5, 2, 7};
get_catalg(12120) -> {5, 2, 8};
get_catalg(12130) -> {5, 2, 9};
get_catalg(12140) -> {5, 2, 10};
get_catalg(12150) -> {5, 2, 11};
get_catalg(12160) -> {5, 2, 12};
get_catalg(12170) -> {5, 3, 1};
get_catalg(12180) -> {5, 3, 2};
get_catalg(12190) -> {5, 3, 3};
get_catalg(12200) -> {5, 3, 4};
get_catalg(12210) -> {5, 3, 5};
get_catalg(12220) -> {5, 3, 6};
get_catalg(12230) -> {5, 3, 7};
get_catalg(12240) -> {5, 3, 8};
get_catalg(12250) -> {5, 3, 9};
get_catalg(12260) -> {5, 3, 10};
get_catalg(12270) -> {5, 3, 11};
get_catalg(12280) -> {5, 4, 1};
get_catalg(12290) -> {5, 4, 2};
get_catalg(12300) -> {5, 4, 3};
get_catalg(12310) -> {5, 4, 4};
get_catalg(12320) -> {5, 4, 5};
get_catalg(12330) -> {5, 4, 6};
get_catalg(12340) -> {5, 4, 7};
get_catalg(12350) -> {5, 4, 8};
get_catalg(12360) -> {5, 4, 9};
get_catalg(12370) -> {5, 4, 10};
get_catalg(12380) -> {5, 4, 11};
get_catalg(12390) -> {5, 4, 12};
get_catalg(12400) -> {5, 5, 1};
get_catalg(12410) -> {5, 5, 2};
get_catalg(12420) -> {5, 5, 3};
get_catalg(12430) -> {5, 5, 4};
get_catalg(12440) -> {5, 5, 5};
get_catalg(12450) -> {5, 5, 6};
get_catalg(12460) -> {5, 5, 7};
get_catalg(12470) -> {5, 5, 8};
get_catalg(12480) -> {5, 5, 9};
get_catalg(12490) -> {5, 5, 10};
get_catalg(12500) -> {5, 5, 11};
get_catalg(12510) -> {5, 5, 12};
get_catalg(12520) -> {6, 1, 1};
get_catalg(12530) -> {6, 1, 2};
get_catalg(12540) -> {6, 1, 3};
get_catalg(12550) -> {6, 1, 4};
get_catalg(12560) -> {6, 1, 5};
get_catalg(12570) -> {6, 1, 6};
get_catalg(12580) -> {6, 1, 7};
get_catalg(12590) -> {6, 1, 8};
get_catalg(12600) -> {6, 1, 9};
get_catalg(12610) -> {6, 1, 10};
get_catalg(12620) -> {6, 1, 11};
get_catalg(12630) -> {6, 1, 12};
get_catalg(12640) -> {6, 2, 1};
get_catalg(12650) -> {6, 2, 2};
get_catalg(12660) -> {6, 2, 3};
get_catalg(12670) -> {6, 2, 4};
get_catalg(12680) -> {6, 2, 5};
get_catalg(12690) -> {6, 2, 6};
get_catalg(12700) -> {6, 2, 7};
get_catalg(12710) -> {6, 2, 8};
get_catalg(12720) -> {6, 2, 9};
get_catalg(12730) -> {6, 2, 10};
get_catalg(12740) -> {6, 2, 11};
get_catalg(12750) -> {6, 2, 12};
get_catalg(12760) -> {6, 3, 1};
get_catalg(12770) -> {6, 3, 2};
get_catalg(12780) -> {6, 3, 3};
get_catalg(12790) -> {6, 3, 4};
get_catalg(12800) -> {6, 3, 5};
get_catalg(12810) -> {6, 3, 6};
get_catalg(12820) -> {6, 3, 7};
get_catalg(12830) -> {6, 3, 8};
get_catalg(12840) -> {6, 3, 9};
get_catalg(12850) -> {6, 3, 10};
get_catalg(12860) -> {6, 3, 11};
get_catalg(12870) -> {6, 3, 12};
get_catalg(_QuestId) -> false.

get_total_chapters(1) -> 5;
get_total_chapters(2) -> 5;
get_total_chapters(3) -> 5;
get_total_chapters(4) -> 5;
get_total_chapters(5) -> 5;
get_total_chapters(6) -> 5;
get_total_chapters(_) -> none.

get_total_sections({1, 2}) -> 8;
get_total_sections({1, 3}) -> 8;
get_total_sections({1, 4}) -> 10;
get_total_sections({1, 5}) -> 6;
get_total_sections({2, 1}) -> 9;
get_total_sections({2, 2}) -> 10;
get_total_sections({2, 3}) -> 8;
get_total_sections({2, 4}) -> 10;
get_total_sections({2, 5}) -> 9;
get_total_sections({3, 1}) -> 11;
get_total_sections({3, 2}) -> 11;
get_total_sections({3, 3}) -> 11;
get_total_sections({3, 4}) -> 11;
get_total_sections({3, 5}) -> 12;
get_total_sections({4, 1}) -> 11;
get_total_sections({4, 2}) -> 12;
get_total_sections({4, 3}) -> 12;
get_total_sections({4, 4}) -> 12;
get_total_sections({4, 5}) -> 13;
get_total_sections({5, 1}) -> 13;
get_total_sections({5, 2}) -> 12;
get_total_sections({5, 3}) -> 11;
get_total_sections({5, 4}) -> 12;
get_total_sections({5, 5}) -> 12;
get_total_sections({6, 1}) -> 12;
get_total_sections({6, 2}) -> 12;
get_total_sections({6, 3}) -> 12;
get_total_sections(_) -> none.

get_section_quests({1, 2}) ->
    [{1, 10316},
     {2, 10320},
     {3, 10350},
     {4, 10360},
     {5, 10362},
     {6, 10364},
     {7, 10370},
     {8, 10374}];
get_section_quests({1, 3}) ->
    [{1, 10380},
     {2, 10384},
     {3, 10390},
     {4, 10394},
     {5, 10400},
     {6, 10402},
     {7, 10404},
     {8, 10410}];
get_section_quests({1, 4}) ->
    [{1, 10414},
     {2, 10420},
     {3, 10430},
     {4, 10432},
     {5, 10434},
     {6, 10436},
     {7, 10438},
     {8, 10440},
     {9, 10450},
     {10, 10455}];
get_section_quests({1, 5}) ->
    [{1, 10458},
     {2, 10460},
     {3, 10461},
     {4, 10462},
     {5, 10463},
     {6, 10464}];
get_section_quests({2, 1}) ->
    [{1, 10470},
     {2, 10475},
     {3, 10480},
     {4, 10484},
     {5, 10486},
     {6, 10490},
     {7, 10494},
     {8, 10500},
     {9, 10510}];
get_section_quests({2, 2}) ->
    [{1, 10514},
     {2, 10520},
     {3, 10521},
     {4, 10522},
     {5, 10523},
     {6, 10524},
     {7, 10525},
     {8, 10526},
     {9, 10527},
     {10, 10528}];
get_section_quests({2, 3}) ->
    [{1, 10530},
     {2, 10532},
     {3, 10534},
     {4, 10540},
     {5, 10544},
     {6, 10550},
     {7, 10560},
     {8, 10564}];
get_section_quests({2, 4}) ->
    [{1, 10568},
     {2, 10570},
     {3, 10580},
     {4, 10582},
     {5, 10590},
     {6, 10600},
     {7, 10610},
     {8, 10620},
     {9, 10630},
     {10, 10640}];
get_section_quests({2, 5}) ->
    [{1, 10650},
     {2, 10660},
     {3, 10670},
     {4, 10680},
     {5, 10690},
     {6, 10700},
     {7, 10710},
     {8, 10720},
     {9, 10730}];
get_section_quests({3, 1}) ->
    [{1, 10740},
     {2, 10750},
     {3, 10760},
     {4, 10770},
     {5, 10780},
     {6, 10790},
     {7, 10800},
     {8, 10810},
     {9, 10820},
     {10, 10830},
     {11, 10840}];
get_section_quests({3, 2}) ->
    [{1, 10850},
     {2, 10860},
     {3, 10870},
     {4, 10880},
     {5, 10890},
     {6, 10900},
     {7, 10910},
     {8, 10920},
     {9, 10930},
     {10, 10940},
     {11, 10950}];
get_section_quests({3, 3}) ->
    [{1, 10960},
     {2, 10970},
     {3, 10980},
     {4, 10990},
     {5, 11000},
     {6, 11010},
     {7, 11020},
     {8, 11030},
     {9, 11040},
     {10, 11050},
     {11, 11060}];
get_section_quests({3, 4}) ->
    [{1, 11070},
     {2, 11080},
     {3, 11090},
     {4, 11100},
     {5, 11110},
     {6, 11120},
     {7, 11130},
     {8, 11140},
     {9, 11150},
     {10, 11160},
     {11, 11170}];
get_section_quests({3, 5}) ->
    [{1, 11180},
     {2, 11190},
     {3, 11200},
     {4, 11210},
     {5, 11220},
     {6, 11240},
     {7, 11250},
     {8, 11260},
     {9, 11270},
     {10, 11276},
     {11, 11280},
     {12, 11290}];
get_section_quests({4, 1}) ->
    [{1, 11300},
     {2, 11310},
     {3, 11320},
     {4, 11330},
     {5, 11340},
     {6, 11350},
     {7, 11360},
     {8, 11370},
     {9, 11380},
     {10, 11390},
     {11, 11400}];
get_section_quests({4, 2}) ->
    [{1, 11410},
     {2, 11420},
     {3, 11430},
     {4, 11440},
     {5, 11450},
     {6, 11460},
     {7, 11470},
     {8, 11480},
     {9, 11490},
     {10, 11500},
     {11, 11510},
     {12, 11520}];
get_section_quests({4, 3}) ->
    [{1, 11530},
     {2, 11540},
     {3, 11550},
     {4, 11560},
     {5, 11570},
     {6, 11580},
     {7, 11590},
     {8, 11600},
     {9, 11610},
     {10, 11620},
     {11, 11630},
     {12, 11640}];
get_section_quests({4, 4}) ->
    [{1, 11650},
     {2, 11660},
     {3, 11670},
     {4, 11680},
     {5, 11690},
     {6, 11700},
     {7, 11710},
     {8, 11720},
     {9, 11730},
     {10, 11740},
     {11, 11750},
     {12, 11760}];
get_section_quests({4, 5}) ->
    [{1, 11770},
     {2, 11780},
     {3, 11790},
     {4, 11800},
     {5, 11810},
     {6, 11820},
     {7, 11830},
     {8, 11840},
     {9, 11850},
     {10, 11860},
     {11, 11890},
     {12, 11900},
     {13, 11910}];
get_section_quests({5, 1}) ->
    [{1, 11920},
     {2, 11930},
     {3, 11940},
     {4, 11950},
     {5, 11960},
     {6, 11970},
     {7, 11980},
     {8, 11990},
     {9, 12000},
     {10, 12010},
     {11, 12020},
     {12, 12030},
     {13, 12040}];
get_section_quests({5, 2}) ->
    [{1, 12050},
     {2, 12060},
     {3, 12070},
     {4, 12080},
     {5, 12090},
     {6, 12100},
     {7, 12110},
     {8, 12120},
     {9, 12130},
     {10, 12140},
     {11, 12150},
     {12, 12160}];
get_section_quests({5, 3}) ->
    [{1, 12170},
     {2, 12180},
     {3, 12190},
     {4, 12200},
     {5, 12210},
     {6, 12220},
     {7, 12230},
     {8, 12240},
     {9, 12250},
     {10, 12260},
     {11, 12270}];
get_section_quests({5, 4}) ->
    [{1, 12280},
     {2, 12290},
     {3, 12300},
     {4, 12310},
     {5, 12320},
     {6, 12330},
     {7, 12340},
     {8, 12350},
     {9, 12360},
     {10, 12370},
     {11, 12380},
     {12, 12390}];
get_section_quests({5, 5}) ->
    [{1, 12400},
     {2, 12410},
     {3, 12420},
     {4, 12430},
     {5, 12440},
     {6, 12450},
     {7, 12460},
     {8, 12470},
     {9, 12480},
     {10, 12490},
     {11, 12500},
     {12, 12510}];
get_section_quests({6, 1}) ->
    [{1, 12520},
     {2, 12530},
     {3, 12540},
     {4, 12550},
     {5, 12560},
     {6, 12570},
     {7, 12580},
     {8, 12590},
     {9, 12600},
     {10, 12610},
     {11, 12620},
     {12, 12630}];
get_section_quests({6, 2}) ->
    [{1, 12640},
     {2, 12650},
     {3, 12660},
     {4, 12670},
     {5, 12680},
     {6, 12690},
     {7, 12700},
     {8, 12710},
     {9, 12720},
     {10, 12730},
     {11, 12740},
     {12, 12750}];
get_section_quests({6, 3}) ->
    [{1, 12760},
     {2, 12770},
     {3, 12780},
     {4, 12790},
     {5, 12800},
     {6, 12810},
     {7, 12820},
     {8, 12830},
     {9, 12840},
     {10, 12850},
     {11, 12860},
     {12, 12870}];
get_section_quests(_) -> [].

get_help_reward(10560) ->
    [#gain{label = character, val = 15}];
get_help_reward(10630) ->
    [#gain{label = character, val = 15}];
get_help_reward(10690) ->
    [#gain{label = character, val = 15}];
get_help_reward(10730) ->
    [#gain{label = character, val = 25}];
get_help_reward(10800) ->
    [#gain{label = character, val = 15}];
get_help_reward(10830) ->
    [#gain{label = character, val = 25}];
get_help_reward(10920) ->
    [#gain{label = character, val = 15}];
get_help_reward(10940) ->
    [#gain{label = character, val = 25}];
get_help_reward(10970) ->
    [#gain{label = character, val = 15}];
get_help_reward(11030) ->
    [#gain{label = character, val = 25}];
get_help_reward(11050) ->
    [#gain{label = character, val = 25}];
get_help_reward(11120) ->
    [#gain{label = character, val = 25}];
get_help_reward(11170) ->
    [#gain{label = character, val = 25}];
get_help_reward(11250) ->
    [#gain{label = character, val = 25}];
get_help_reward(11280) ->
    [#gain{label = character, val = 25}];
get_help_reward(11340) ->
    [#gain{label = character, val = 25}];
get_help_reward(11400) ->
    [#gain{label = character, val = 25}];
get_help_reward(11450) ->
    [#gain{label = character, val = 25}];
get_help_reward(11510) ->
    [#gain{label = character, val = 25}];
get_help_reward(11590) ->
    [#gain{label = character, val = 25}];
get_help_reward(11640) ->
    [#gain{label = character, val = 25}];
get_help_reward(11690) ->
    [#gain{label = character, val = 25}];
get_help_reward(11750) ->
    [#gain{label = character, val = 25}];
get_help_reward(11830) ->
    [#gain{label = character, val = 25}];
get_help_reward(11910) ->
    [#gain{label = character, val = 25}];
get_help_reward(11990) ->
    [#gain{label = character, val = 25}];
get_help_reward(12040) ->
    [#gain{label = character, val = 25}];
get_help_reward(12160) ->
    [#gain{label = character, val = 25}];
get_help_reward(12220) ->
    [#gain{label = character, val = 25}];
get_help_reward(12260) ->
    [#gain{label = character, val = 25}];
get_help_reward(12360) ->
    [#gain{label = character, val = 25}];
get_help_reward(12390) ->
    [#gain{label = character, val = 25}];
get_help_reward(12450) ->
    [#gain{label = character, val = 25}];
get_help_reward(12510) ->
    [#gain{label = character, val = 25}];
get_help_reward(12600) ->
    [#gain{label = character, val = 25}];
get_help_reward(12630) ->
    [#gain{label = character, val = 25}];
get_help_reward(12660) ->
    [#gain{label = character, val = 25}];
get_help_reward(12740) ->
    [#gain{label = character, val = 25}];
get_help_reward(12800) ->
    [#gain{label = character, val = 25}];
get_help_reward(12860) ->
    [#gain{label = character, val = 25}];
get_help_reward(_QuestId) -> [].

