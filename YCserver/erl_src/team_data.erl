-file("src/data/team_data.erl", 1).

-module(team_data).

-export([notice_recruit/0,
         get/1,
         recruit_type_list/1,
         get_type_name/1]).

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

-file("src/data/team_data.erl", 18).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/data/team_data.erl", 19).

notice_recruit() ->
    [11,
     12,
     13,
     14,
     15,
     16,
     17,
     21,
     31,
     32,
     33,
     34,
     35,
     36,
     37,
     38,
     39,
     41,
     43,
     45,
     46,
     47,
     51,
     61,
     62,
     63,
     64,
     65,
     66,
     71,
     72,
     73,
     81,
     91,
     100,
     101,
     92,
     93,
     94,
     113,
     115,
     116,
     117,
     118,
     120,
     121,
     122,
     123,
     124,
     125,
     126,
     127].

get(11) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => "40BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(12) ->
    #{open_lev => 50, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                   val2 = 130}],
      type_name => "50BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(13) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                   val2 = 130}],
      type_name => "60BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(14) ->
    #{open_lev => 70, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 70,
                                   val2 = 130}],
      type_name => "70BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(15) ->
    #{open_lev => 80, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                   val2 = 130}],
      type_name => "80BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(16) ->
    #{open_lev => 90, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                   val2 = 130}],
      type_name => "90BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(17) ->
    #{open_lev => 95, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                   val2 = 130}],
      type_name => "100BOSS", type => 1, cross_open_lev => 0,
      cross_timeout => 0, cross_lev_recruit => []};
get(21) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 20}],
      type_name => lang:get("野外挂机"), type => 2,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(31) ->
    #{open_lev => 20, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 20,
                                   val2 = 130}],
      type_name => lang:get("20封妖"), type => 3,
      cross_open_lev => 20, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 20,
                                   val2 = 130}]};
get(32) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 130}],
      type_name => lang:get("30封妖"), type => 3,
      cross_open_lev => 30, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 130}]};
get(33) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("40封妖"), type => 3,
      cross_open_lev => 40, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}]};
get(34) ->
    #{open_lev => 50, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                   val2 = 130}],
      type_name => lang:get("50封妖"), type => 3,
      cross_open_lev => 50, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                   val2 = 130}]};
get(35) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                   val2 = 130}],
      type_name => lang:get("60封妖"), type => 3,
      cross_open_lev => 60, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                   val2 = 130}]};
get(36) ->
    #{open_lev => 70, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 70,
                                   val2 = 130}],
      type_name => lang:get("70封妖"), type => 3,
      cross_open_lev => 70, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 70,
                                   val2 = 130}]};
get(37) ->
    #{open_lev => 80, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                   val2 = 130}],
      type_name => lang:get("80封妖"), type => 3,
      cross_open_lev => 80, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                   val2 = 130}]};
get(38) ->
    #{open_lev => 90, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                   val2 = 130}],
      type_name => lang:get("90封妖"), type => 3,
      cross_open_lev => 90, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                   val2 = 130}]};
get(39) ->
    #{open_lev => 101, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 101,
                                   val2 = 130}],
      type_name => lang:get("突破封妖"), type => 3,
      cross_open_lev => 101, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 101,
                                   val2 = 130}]};
get(41) ->
    #{open_lev => 35, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 35,
                                   val2 = 130}],
      type_name => lang:get("精灵公主Lv.35"), type => 28,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(43) ->
    #{open_lev => 50, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                   val2 = 130}],
      type_name => lang:get("熔火之心Lv.50"), type => 28,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(45) ->
    #{open_lev => 65, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 65,
                                   val2 = 130}],
      type_name => lang:get("水帘洞天Lv.65"), type => 28,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(46) ->
    #{open_lev => 80, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                   val2 = 130}],
      type_name => lang:get("遗忘洞穴Lv.80"), type => 28,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(47) ->
    #{open_lev => 80, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                   val2 = 130}],
      type_name => lang:get("夺宝奇兵"), type => 4,
      cross_open_lev => 80, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 5}]};
get(51) ->
    #{open_lev => 20, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -200,
                                   val2 = 130}],
      type_name => lang:get("悬赏任务"), type => 5,
      cross_open_lev => 20, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 20,
                                   val2 = 130}]};
get(61) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10},
           #team_recruit_lev_range{flag = 2, lev = 1, val1 = 30,
                                   val2 = 130}],
      type_name => lang:get("职业挑战"), type => 6,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(62) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10},
           #team_recruit_lev_range{flag = 2, lev = 1, val1 = 30,
                                   val2 = 130}],
      type_name => lang:get("彩虹冒险"), type => 7,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(63) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("段位赛"), type => 8,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(64) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("巅峰对决"), type => 10,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(65) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 10}],
      type_name => lang:get("十二星座"), type => 11,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(66) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 10}],
      type_name => lang:get("银月贤者"), type => 62,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(67) ->
    #{open_lev => 80, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 10}],
      type_name => lang:get("幻月灵兽"), type => 64,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(71) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("天空之塔一层"), type => 9,
      cross_open_lev => 40, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -20,
                                   val2 = 20}]};
get(72) ->
    #{open_lev => 50, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                   val2 = 130}],
      type_name => lang:get("天空之塔二层"), type => 9,
      cross_open_lev => 50, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -20,
                                   val2 = 20}]};
get(73) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                   val2 = 130}],
      type_name => lang:get("天空之塔三层"), type => 9,
      cross_open_lev => 60, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -20,
                                   val2 = 20}]};
get(81) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 3, val1 = 6,
                                   val2 = 99}],
      type_name => lang:get("剧情任务"), type => 12,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(91) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("情缘任务"), type => 14,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(100) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("荣耀-部落"), type => 16,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(101) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("荣耀-联盟"), type => 17,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(92) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 130}],
      type_name => lang:get("远航-天堂圣果"), type => 18,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(93) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 130}],
      type_name => lang:get("远航-冒险秘境"), type => 18,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(94) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 200}],
      type_name => lang:get("缘定星辰"), type => 60,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(113) ->
    #{open_lev => 40, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                   val2 = 130}],
      type_name => lang:get("草木妖王"), type => 21,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(114) ->
    #{open_lev => 100, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 20}],
      type_name => lang:get("突破任务"), type => 26,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(115) ->
    #{open_lev => 65, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 65,
                                   val2 = 89}],
      type_name => lang:get("普通玲珑宝阁"), type => 61,
      cross_open_lev => 65, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 5}]};
get(116) ->
    #{open_lev => 90, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                   val2 = 200}],
      type_name => lang:get("英雄玲珑宝阁"), type => 61,
      cross_open_lev => 90, cross_timeout => 300,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                   val2 = 5}]};
get(118) ->
    #{open_lev => 30, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                   val2 = 200}],
      type_name => lang:get("净化家园"), type => 25,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(200) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 29,
      cross_open_lev => 0, cross_timeout => 0,
      cross_lev_recruit => []};
get(201) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 30,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(202) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 31,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(203) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 32,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(204) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 33,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(205) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 34,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(206) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 35,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(207) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 36,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(208) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 37,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(209) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 38,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(210) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 39,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(211) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 40,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(212) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 41,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(213) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 42,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(214) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 43,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(215) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 44,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(216) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 45,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(217) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 46,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(218) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 47,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(219) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 48,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(220) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 49,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(221) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 50,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(222) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 51,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(223) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 52,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(224) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 53,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(225) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 54,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(226) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 55,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(227) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 56,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(228) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 57,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(229) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 58,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(230) ->
    #{open_lev => 60, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("龙王试炼"), type => 59,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(250) ->
    #{open_lev => 90, timeout => 300,
      lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}],
      type_name => lang:get("天启试炼"), type => 101,
      cross_open_lev => 65, cross_timeout => 0,
      cross_lev_recruit =>
          [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                   val2 = 10}]};
get(_) -> false.

recruit_type_list(1) ->
    [#{id => 11, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]},
     #{id => 12, open_lev => 50,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                    val2 = 130}]},
     #{id => 13, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                    val2 = 130}]},
     #{id => 14, open_lev => 70,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 70,
                                    val2 = 130}]},
     #{id => 15, open_lev => 80,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                    val2 = 130}]},
     #{id => 16, open_lev => 90,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                    val2 = 130}]},
     #{id => 17, open_lev => 95,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                    val2 = 130}]}];
recruit_type_list(2) ->
    [#{id => 21, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                    val2 = 20}]}];
recruit_type_list(3) ->
    [#{id => 31, open_lev => 20,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 20,
                                    val2 = 130}]},
     #{id => 32, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                    val2 = 130}]},
     #{id => 33, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]},
     #{id => 34, open_lev => 50,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                    val2 = 130}]},
     #{id => 35, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                    val2 = 130}]},
     #{id => 36, open_lev => 70,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 70,
                                    val2 = 130}]},
     #{id => 37, open_lev => 80,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                    val2 = 130}]},
     #{id => 38, open_lev => 90,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                    val2 = 130}]},
     #{id => 39, open_lev => 101,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 101,
                                    val2 = 130}]}];
recruit_type_list(28) ->
    [#{id => 41, open_lev => 35,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 35,
                                    val2 = 130}]},
     #{id => 43, open_lev => 50,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                    val2 = 130}]},
     #{id => 45, open_lev => 65,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 65,
                                    val2 = 130}]},
     #{id => 46, open_lev => 80,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                    val2 = 130}]}];
recruit_type_list(4) ->
    [#{id => 47, open_lev => 80,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 80,
                                    val2 = 130}]}];
recruit_type_list(5) ->
    [#{id => 51, open_lev => 20,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -200,
                                    val2 = 130}]}];
recruit_type_list(6) ->
    [#{id => 61, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10},
            #team_recruit_lev_range{flag = 2, lev = 1, val1 = 30,
                                    val2 = 130}]}];
recruit_type_list(7) ->
    [#{id => 62, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10},
            #team_recruit_lev_range{flag = 2, lev = 1, val1 = 30,
                                    val2 = 130}]}];
recruit_type_list(8) ->
    [#{id => 63, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(10) ->
    [#{id => 64, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(11) ->
    [#{id => 65, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                    val2 = 10}]}];
recruit_type_list(62) ->
    [#{id => 66, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                    val2 = 10}]}];
recruit_type_list(64) ->
    [#{id => 67, open_lev => 80,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -5,
                                    val2 = 10}]}];
recruit_type_list(9) ->
    [#{id => 71, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]},
     #{id => 72, open_lev => 50,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 50,
                                    val2 = 130}]},
     #{id => 73, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 60,
                                    val2 = 130}]}];
recruit_type_list(12) ->
    [#{id => 81, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 3, val1 = 6,
                                    val2 = 99}]}];
recruit_type_list(14) ->
    [#{id => 91, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]}];
recruit_type_list(16) ->
    [#{id => 100, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]}];
recruit_type_list(17) ->
    [#{id => 101, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]}];
recruit_type_list(18) ->
    [#{id => 92, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                    val2 = 130}]},
     #{id => 93, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                    val2 = 130}]}];
recruit_type_list(60) ->
    [#{id => 94, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                    val2 = 200}]}];
recruit_type_list(21) ->
    [#{id => 113, open_lev => 40,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 40,
                                    val2 = 130}]}];
recruit_type_list(26) ->
    [#{id => 114, open_lev => 100,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 20}]}];
recruit_type_list(61) ->
    [#{id => 115, open_lev => 65,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 65,
                                    val2 = 89}]},
     #{id => 116, open_lev => 90,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 90,
                                    val2 = 200}]}];
recruit_type_list(25) ->
    [#{id => 118, open_lev => 30,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 1, val1 = 30,
                                    val2 = 200}]}];
recruit_type_list(29) ->
    [#{id => 200, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(30) ->
    [#{id => 201, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(31) ->
    [#{id => 202, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(32) ->
    [#{id => 203, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(33) ->
    [#{id => 204, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(34) ->
    [#{id => 205, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(35) ->
    [#{id => 206, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(36) ->
    [#{id => 207, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(37) ->
    [#{id => 208, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(38) ->
    [#{id => 209, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(39) ->
    [#{id => 210, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(40) ->
    [#{id => 211, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(41) ->
    [#{id => 212, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(42) ->
    [#{id => 213, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(43) ->
    [#{id => 214, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(44) ->
    [#{id => 215, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(45) ->
    [#{id => 216, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(46) ->
    [#{id => 217, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(47) ->
    [#{id => 218, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(48) ->
    [#{id => 219, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(49) ->
    [#{id => 220, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(50) ->
    [#{id => 221, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(51) ->
    [#{id => 222, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(52) ->
    [#{id => 223, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(53) ->
    [#{id => 224, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(54) ->
    [#{id => 225, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(55) ->
    [#{id => 226, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(56) ->
    [#{id => 227, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(57) ->
    [#{id => 228, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(58) ->
    [#{id => 229, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(59) ->
    [#{id => 230, open_lev => 60,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(101) ->
    [#{id => 250, open_lev => 90,
       lev_recruit =>
           [#team_recruit_lev_range{flag = 1, lev = 2, val1 = -10,
                                    val2 = 10}]}];
recruit_type_list(_) -> [].

get_type_name(11) -> #{name => "40BOSS"};
get_type_name(12) -> #{name => "50BOSS"};
get_type_name(13) -> #{name => "60BOSS"};
get_type_name(14) -> #{name => "70BOSS"};
get_type_name(15) -> #{name => "80BOSS"};
get_type_name(16) -> #{name => "90BOSS"};
get_type_name(17) -> #{name => "100BOSS"};
get_type_name(21) -> #{name => lang:get("野外挂机")};
get_type_name(31) -> #{name => lang:get("25封妖")};
get_type_name(32) -> #{name => lang:get("35封妖")};
get_type_name(33) -> #{name => lang:get("45封妖")};
get_type_name(34) -> #{name => lang:get("55封妖")};
get_type_name(35) -> #{name => lang:get("65封妖")};
get_type_name(36) -> #{name => lang:get("75封妖")};
get_type_name(37) -> #{name => lang:get("85封妖")};
get_type_name(38) -> #{name => lang:get("95封妖")};
get_type_name(39) -> #{name => lang:get("突破封妖")};
get_type_name(41) -> #{name => lang:get("35副本精灵公主")};
get_type_name(43) -> #{name => lang:get("50副本熔火之心")};
get_type_name(45) -> #{name => lang:get("65副本水帘洞天")};
get_type_name(46) -> #{name => lang:get("80副本遗忘洞穴")};
get_type_name(47) -> #{name => lang:get("夺宝奇兵")};
get_type_name(51) -> #{name => lang:get("悬赏任务")};
get_type_name(61) -> #{name => lang:get("职业闯关")};
get_type_name(62) -> #{name => lang:get("彩虹冒险")};
get_type_name(63) -> #{name => lang:get("段位赛")};
get_type_name(64) -> #{name => lang:get("巅峰对决")};
get_type_name(65) -> #{name => lang:get("十二星座")};
get_type_name(66) -> #{name => lang:get("银月贤者")};
get_type_name(71) -> #{name => lang:get("天空之塔一层")};
get_type_name(72) -> #{name => lang:get("天空之塔二层")};
get_type_name(73) -> #{name => lang:get("天空之塔二层")};
get_type_name(81) -> #{name => lang:get("剧情任务")};
get_type_name(91) -> #{name => lang:get("情缘任务")};
get_type_name(100) -> #{name => lang:get("荣耀-部落")};
get_type_name(101) -> #{name => lang:get("荣耀-联盟")};
get_type_name(92) -> #{name => lang:get("远航-天堂圣果")};
get_type_name(93) -> #{name => lang:get("远航-冒险秘境")};
get_type_name(94) -> #{name => lang:get("缘定星辰")};
get_type_name(113) -> #{name => lang:get("草木妖王")};
get_type_name(115) -> #{name => lang:get("普通玲珑宝阁")};
get_type_name(116) -> #{name => lang:get("英雄玲珑宝阁")};
get_type_name(117) -> #{name => lang:get("史诗玲珑宝阁")};
get_type_name(118) -> #{name => lang:get("净化家园")};
get_type_name(120) -> #{name => lang:get("峡谷-新秀组")};
get_type_name(121) -> #{name => lang:get("峡谷-新秀组")};
get_type_name(122) -> #{name => lang:get("峡谷-新秀组")};
get_type_name(123) -> #{name => lang:get("峡谷-新秀组")};
get_type_name(124) -> #{name => lang:get("峡谷-精锐组")};
get_type_name(125) -> #{name => lang:get("峡谷-精锐组")};
get_type_name(126) -> #{name => lang:get("峡谷-勇武组")};
get_type_name(127) -> #{name => lang:get("峡谷-英雄组")};
get_type_name(_) -> false.

