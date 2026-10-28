-file("src/data/elf_data.erl", 1).

-module(elf_data).

-export([groups/0,
         orders/0,
         group_order/1,
         order_group/1,
         get_lev_group/1,
         get_group/1,
         maps/0,
         get_map/1,
         get_reward/1,
         get_honor/1,
         del_buffs/0,
         get_unit/1,
         get_first/1,
         max_score/0,
         get_win/1,
         cross_list/1,
         get_zone/1,
         get_cross/1]).

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

-file("src/data/elf_data.erl", 32).

-file("inc/elf.hrl", 1).

-record(elf_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         combat_protect_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         has_enter = 0,
         has_mail = 0,
         group = 0,
         seq_id = 0,
         fc = 0,
         m_time = 0,
         pos,
         rank = 0,
         grade_flag = 0,
         grade_first_flag = 0,
         unit_list = [],
         match = 0,
         exp = 0,
         group_key = 0,
         open_id = 0}).

-record(elf_role_map,
        {id = 0, map_id = 0, map_base_id = 0, num = 0}).

-record(elf_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         group_key = {0, 0},
         open_id = 0,
         group_id = 0 :: pos_integer(),
         members = [],
         num = 0}).

-record(elf_group_data,
        {min = 0, max = 0, group = 0, order = 0, name = ""}).

-record(elf_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         group = 0,
         group_key = {0, 0},
         open_id = 0,
         flag = 0}).

-record(elf_map,
        {id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         map_id = 0,
         map_base_id = 0,
         num = 0,
         max_num = 0}).

-record(elf_map_data,
        {id = 0 :: non_neg_integer(),
         map_base_id = 0,
         num = 0,
         unit_list = [],
         boss_list = [],
         super_list = [],
         box_list = [],
         next_score = 0,
         win_score = 0,
         fail_score = 0,
         end_score = 0,
         next_base_id = 0,
         buff_id = 0,
         grade_buff_id = 0,
         grade_msg = "",
         grade_cast_msg = "",
         grade_score = 0,
         grade_dec_score = 0,
         grade_dec_msg = "",
         fail_buff_id = 0,
         fail_msg = "",
         pos_list = [],
         msg = "",
         del_buff = [],
         max_score = 0,
         max_guard = 4}).

-record(elf_unit,
        {id = {0, 0} :: non_neg_integer(), base_id = 0, pos}).

-record(elf_unit_data,
        {id = 0,
         is_del = 1,
         pos = [],
         score = 0,
         kill_num = 0,
         create_msg = "",
         item_list = [],
         buff_id = 0,
         msg = "",
         cast_msg = ""}).

-record(elf_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         item_list = [],
         exp_mode = 0}).

-record(elf_first_data,
        {group = 0,
         map_base_id,
         min = 0,
         max = 0,
         item_list = [],
         cast = "",
         title = "",
         comment = ""}).

-record(elf_win_data,
        {group = 0,
         min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/data/elf_data.erl", 33).

groups() -> [1, 2, 3, 4].

orders() -> [1, 2, 3, 4].

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

get_lev_group(Lev) when Lev >= 90 andalso Lev =< 200 ->
    #elf_group_data{min = 90, max = 200, group = 1,
                    order = 1, name = lang:get("英雄组")};
get_lev_group(Lev) when Lev >= 70 andalso Lev =< 89 ->
    #elf_group_data{min = 70, max = 89, group = 2,
                    order = 2, name = lang:get("勇武组")};
get_lev_group(Lev) when Lev >= 50 andalso Lev =< 69 ->
    #elf_group_data{min = 50, max = 69, group = 3,
                    order = 3, name = lang:get("精锐组")};
get_lev_group(Lev) when Lev >= 40 andalso Lev =< 49 ->
    #elf_group_data{min = 40, max = 49, group = 4,
                    order = 4, name = lang:get("新秀组")};
get_lev_group(_) -> false.

get_group(1) ->
    #elf_group_data{min = 90, max = 200, group = 1,
                    order = 1, name = lang:get("英雄组")};
get_group(2) ->
    #elf_group_data{min = 70, max = 89, group = 2,
                    order = 2, name = lang:get("勇武组")};
get_group(3) ->
    #elf_group_data{min = 50, max = 69, group = 3,
                    order = 3, name = lang:get("精锐组")};
get_group(4) ->
    #elf_group_data{min = 40, max = 49, group = 4,
                    order = 4, name = lang:get("新秀组")};
get_group(_) -> false.

maps() -> [71000, 71001, 71002, 71003, 71004].

max_score() -> [0, 0, 0, 0, 2100].

get_map(71000) ->
    #elf_map_data{id = 1, map_base_id = 71000,
                  box_list =
                      [{62310, 300, 3, 15},
                       {62311, 600, 6, 24},
                       {62312, 100, 2, 8}],
                  next_score = 100, win_score = 100, fail_score = 20,
                  end_score = 0, next_base_id = 71001, buff_id = 10040,
                  msg =
                      lang:get("活动开始啦，你进入了<color='#00ff00'>第1层-幻境入口</color>，并"
                               "变身为<color='#00ff00'>幻境仙童</color>"),
                  grade_score = 0, fail_buff_id = 10040,
                  fail_msg =
                      lang:get("你战败了，<color='#00ff00'>祝福</color>效果获得进一步提升"),
                  pos_list =
                      [{2600, 2300},
                       {650, 2300},
                       {1800, 1400},
                       {700, 400},
                       {2230, 2830},
                       {2250, 400}],
                  del_buff = [0], max_score = 0, max_guard = 4};
get_map(71001) ->
    #elf_map_data{id = 2, map_base_id = 71001,
                  box_list =
                      [{62310, 300, 3, 15},
                       {62311, 600, 6, 24},
                       {62312, 100, 2, 8}],
                  next_score = 300, win_score = 100, fail_score = 20,
                  end_score = 0, next_base_id = 71002, buff_id = 10041,
                  msg =
                      lang:get("恭喜你收集足够的变身能量，即将进入<color='#00ff00'>第2层-水之幻境</c"
                               "olor>，并变身为<color='#00ff00'>幻境守护</color>"),
                  grade_score = 0,
                  pos_list =
                      [{2800, 1900}, {850, 1750}, {1000, 600}, {2800, 700}],
                  del_buff = [10040, 10046], max_score = 0,
                  max_guard = 3};
get_map(71002) ->
    #elf_map_data{id = 3, map_base_id = 71002,
                  box_list =
                      [{62310, 300, 3, 15},
                       {62311, 600, 6, 24},
                       {62312, 100, 2, 8}],
                  next_score = 500, win_score = 100, fail_score = 20,
                  end_score = 0, next_base_id = 71003, buff_id = 10042,
                  msg =
                      lang:get("恭喜你收集足够的变身能量，即将进入<color='#00ff00'>第3层-木之幻境</c"
                               "olor>，并变身为<color='#00ff00'>幻彩精灵</color>"),
                  grade_score = 0,
                  pos_list =
                      [{750, 1350}, {450, 550}, {1500, 600}, {1500, 1500}],
                  del_buff = [10041, 10046], max_score = 0,
                  max_guard = 2};
get_map(71003) ->
    #elf_map_data{id = 4, map_base_id = 71003,
                  box_list =
                      [{62310, 300, 3, 15},
                       {62311, 600, 6, 24},
                       {62312, 100, 2, 8}],
                  next_score = 800, win_score = 100, fail_score = 20,
                  end_score = 0, next_base_id = 71004, buff_id = 10043,
                  msg =
                      lang:get("恭喜你收集足够的变身能量，即将进入<color='#00ff00'>第4层-雪之幻境</c"
                               "olor>，并变身为<color='#00ff00'>幻境力士</color>"),
                  grade_score = 0,
                  pos_list =
                      [{1300, 1200}, {1200, 300}, {650, 2100}, {2200, 2100}],
                  del_buff = [10042, 10046], max_score = 0,
                  max_guard = 4};
get_map(71004) ->
    #elf_map_data{id = 5, map_base_id = 71004,
                  box_list =
                      [{62311, 600, 6, 16}, {62312, 100, 2, 6}, {62315, 1}],
                  next_score = 9999999999, win_score = 100,
                  fail_score = 20, end_score = 0, next_base_id = 0,
                  buff_id = 10044,
                  msg =
                      lang:get("恭喜你收集足够的变身能量，即将进入<color='#00ff00'>第5层-幻境争霸</c"
                               "olor>，并变身为<color='#00ff00'>幻影剑客</color>"),
                  grade_buff_id = 10045,
                  grade_msg =
                      lang:get("由于您击败越来越多的敌人，获得了幻境意识的认可，进阶为<color='#00ff00'>幻"
                               "境之神</color>"),
                  grade_cast_msg =
                      lang:get("#role#积累了足够的变身能量，进阶为<color='#00ff00'>幻境之神</co"
                               "lor>，其他小伙伴要加油咯"),
                  grade_score = 1100,
                  grade_dec_msg =
                      lang:get("你被击败了，再次变身回<color='#00ff00'>幻境剑客</color>"),
                  grade_dec_score = 60,
                  pos_list =
                      [{970, 850},
                       {950, 2000},
                       {3200, 2000},
                       {3200, 800},
                       {1500, 1500},
                       {2600, 1500}],
                  del_buff = [10043, 10046], max_score = 2100,
                  max_guard = 4};
get_map(_) -> false.

get_unit(62310) ->
    #elf_unit_data{id = 62310, is_del = 1, kill_num = 999,
                   buff_id = 10046,
                   msg =
                       lang:get("采集了<color='#00ff00'>加属性</color>，角色与守护<color='"
                                "#00ff00'>伤害+3%</color>，受到伤害<color='#00ff00'>减"
                                "免3%</color>")};
get_unit(62311) ->
    #elf_unit_data{id = 62311, is_del = 1, score = 10,
                   kill_num = 999,
                   create_msg =
                       lang:get("<color='#00ff00'>精灵幻境</color>中出现了大量<color='#0"
                                "0ff00'>能量水晶</color>，大家赶紧采集收获变身能量"),
                   msg =
                       lang:get("你采集了能量水晶，获得了<color='#00ff00'>#score#点变身能量</co"
                                "lor>")};
get_unit(62312) ->
    #elf_unit_data{id = 62312, is_del = 1, score = 30,
                   kill_num = 999,
                   msg =
                       lang:get("你采集了千年水晶，获得了<color='#00ff00'>#score#点变身能量</co"
                                "lor>")};
get_unit(62315) ->
    #elf_unit_data{id = 62315, is_del = 0,
                   pos = [{2044, 1511}], kill_num = 1,
                   item_list =
                       [{20006, 0, 6, 180, 0},
                        {21220, 0, 2, 180, 0},
                        {20046, 0, 1, 20, 1},
                        {20021, 0, 1, 60, 0},
                        {20022, 0, 1, 10, 1},
                        {20025, 0, 1, 140, 0},
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
                        {20038, 0, 1, 3, 1},
                        {20076, 0, 1, 2, 1},
                        {20616, 0, 1, 10, 1},
                        {22427, 0, 1, 20, 1}],
                   cast_msg =
                       lang:get("#role#打开幻境宝箱，高兴的拿走了里面的#item#{face_1, "
                                "31}")};
get_unit(_) -> false.

get_reward({Val, 1}) when Val >= 0 andalso Val =< 200 ->
    #elf_reward_data{group = 1, min = 0, max = 200,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 1})
    when Val >= 201 andalso Val =< 300 ->
    #elf_reward_data{group = 1, min = 201, max = 300,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 1})
    when Val >= 300 andalso Val =< 9999 ->
    #elf_reward_data{group = 1, min = 300, max = 9999,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 2}) when Val >= 0 andalso Val =< 200 ->
    #elf_reward_data{group = 2, min = 0, max = 200,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 2})
    when Val >= 201 andalso Val =< 300 ->
    #elf_reward_data{group = 2, min = 201, max = 300,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 2})
    when Val >= 300 andalso Val =< 9999 ->
    #elf_reward_data{group = 2, min = 300, max = 9999,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 3}) when Val >= 0 andalso Val =< 200 ->
    #elf_reward_data{group = 3, min = 0, max = 200,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 3})
    when Val >= 201 andalso Val =< 300 ->
    #elf_reward_data{group = 3, min = 201, max = 300,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 3})
    when Val >= 300 andalso Val =< 9999 ->
    #elf_reward_data{group = 3, min = 300, max = 9999,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 4}) when Val >= 0 andalso Val =< 200 ->
    #elf_reward_data{group = 4, min = 0, max = 200,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 4})
    when Val >= 201 andalso Val =< 300 ->
    #elf_reward_data{group = 4, min = 201, max = 300,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 4})
    when Val >= 300 andalso Val =< 9999 ->
    #elf_reward_data{group = 4, min = 300, max = 9999,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 5}) when Val >= 0 andalso Val =< 200 ->
    #elf_reward_data{group = 5, min = 0, max = 200,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 5})
    when Val >= 201 andalso Val =< 300 ->
    #elf_reward_data{group = 5, min = 201, max = 300,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward({Val, 5})
    when Val >= 300 andalso Val =< 9999 ->
    #elf_reward_data{group = 5, min = 300, max = 9999,
                     item_list =
                         [{20006, 0, 10, 180, 0},
                          {21220, 0, 2, 180, 0},
                          {20046, 0, 1, 20, 1},
                          {20021, 0, 1, 70, 0},
                          {20022, 0, 1, 10, 1},
                          {20025, 0, 1, 150, 1},
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
                     exp_mode = 3322};
get_reward(_) -> false.

get_honor({1, 1}) -> 30118;
get_honor({1, 2}) -> 30118;
get_honor({1, 3}) -> 30118;
get_honor({1, 4}) -> 30118;
get_honor({1, 5}) -> 30118;
get_honor({1, 6}) -> 30118;
get_honor({1, 7}) -> 30118;
get_honor({1, 8}) -> 30118;
get_honor({1, 9}) -> 30118;
get_honor({1, 10}) -> 30118;
get_honor({2, 1}) -> 30118;
get_honor({2, 2}) -> 30118;
get_honor({2, 3}) -> 30118;
get_honor({2, 4}) -> 30118;
get_honor({2, 5}) -> 30118;
get_honor({2, 6}) -> 30118;
get_honor({2, 7}) -> 30118;
get_honor({2, 8}) -> 30118;
get_honor({2, 9}) -> 30118;
get_honor({2, 10}) -> 30118;
get_honor({3, 1}) -> 30118;
get_honor({3, 2}) -> 30118;
get_honor({3, 3}) -> 30118;
get_honor({3, 4}) -> 30118;
get_honor({3, 5}) -> 30118;
get_honor({3, 6}) -> 30118;
get_honor({3, 7}) -> 30118;
get_honor({3, 8}) -> 30118;
get_honor({3, 9}) -> 30118;
get_honor({3, 10}) -> 30118;
get_honor({4, 1}) -> 30118;
get_honor({4, 2}) -> 30118;
get_honor({4, 3}) -> 30118;
get_honor({4, 4}) -> 30118;
get_honor({4, 5}) -> 30118;
get_honor({4, 6}) -> 30118;
get_honor({4, 7}) -> 30118;
get_honor({4, 8}) -> 30118;
get_honor({4, 9}) -> 30118;
get_honor({4, 10}) -> 30118;
get_honor(_) -> false.

del_buffs() ->
    [10040, 10041, 10042, 10043, 10044] ++
        [val_not_exist,
         val_not_exist,
         val_not_exist,
         val_not_exist,
         10045]
            ++
            [10040,
             val_not_exist,
             val_not_exist,
             val_not_exist,
             val_not_exist]
                ++ [10046, val_not_exist, val_not_exist, val_not_exist].

get_first({1, 71004, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 1, map_base_id = 71004, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#<color='#00ff00'>第一名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>4个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第一名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({1, 71004, Val})
    when Val >= 2 andalso Val =< 2 ->
    #elf_first_data{group = 1, map_base_id = 71004, min = 2,
                    max = 2,
                    cast =
                        lang:get("#role#<color='#00ff00'>第二名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>3个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第二名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({1, 71004, Val})
    when Val >= 3 andalso Val =< 3 ->
    #elf_first_data{group = 1, map_base_id = 71004, min = 3,
                    max = 3,
                    cast =
                        lang:get("#role#<color='#00ff00'>第三名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>2个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第三名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({1, 71004, Val})
    when Val >= 4 andalso Val =< 4 ->
    #elf_first_data{group = 1, map_base_id = 71004, min = 4,
                    max = 4,
                    cast =
                        lang:get("#role#<color='#00ff00'>第四名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>1个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第四名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({1, 71004, Val})
    when Val >= 5 andalso Val =< 5 ->
    #elf_first_data{group = 1, map_base_id = 71004, min = 5,
                    max = 5,
                    cast =
                        lang:get("#role#<color='#00ff00'>第五名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得最后一份冲刺奖励。{face_1, "
                                 "18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第五名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({1, 71001, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 1, map_base_id = 71001, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里飞速疾驰，<color='#00ff00'>第一名</color>抵达"
                                 "<color='#00ff00'>水之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({1, 71002, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 1, map_base_id = 71002, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#顺利通过水之幻境，以<color='#00ff00'>第一名</color>的"
                                 "姿态<color='#00ff00'>木之幻境</color>，其他小伙伴加油咯！{fac"
                                 "e_1, 7}")};
get_first({1, 71003, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 1, map_base_id = 71003, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里所向披靡，<color='#00ff00'>第一名</color>到达"
                                 "<color='#00ff00'>雪之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({2, 71004, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 2, map_base_id = 71004, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#<color='#00ff00'>第一名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>4个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第一名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({2, 71004, Val})
    when Val >= 2 andalso Val =< 2 ->
    #elf_first_data{group = 2, map_base_id = 71004, min = 2,
                    max = 2,
                    cast =
                        lang:get("#role#<color='#00ff00'>第二名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>3个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第二名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({2, 71004, Val})
    when Val >= 3 andalso Val =< 3 ->
    #elf_first_data{group = 2, map_base_id = 71004, min = 3,
                    max = 3,
                    cast =
                        lang:get("#role#<color='#00ff00'>第三名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>2个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第三名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({2, 71004, Val})
    when Val >= 4 andalso Val =< 4 ->
    #elf_first_data{group = 2, map_base_id = 71004, min = 4,
                    max = 4,
                    cast =
                        lang:get("#role#<color='#00ff00'>第四名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>1个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第四名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({2, 71004, Val})
    when Val >= 5 andalso Val =< 5 ->
    #elf_first_data{group = 2, map_base_id = 71004, min = 5,
                    max = 5,
                    cast =
                        lang:get("#role#<color='#00ff00'>第五名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得最后一份冲刺奖励。{face_1, "
                                 "18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第五名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({2, 71001, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 2, map_base_id = 71001, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里飞速疾驰，<color='#00ff00'>第一名</color>抵达"
                                 "<color='#00ff00'>水之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({2, 71002, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 2, map_base_id = 71002, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#顺利通过水之幻境，以<color='#00ff00'>第一名</color>的"
                                 "姿态<color='#00ff00'>木之幻境</color>，其他小伙伴加油咯！{fac"
                                 "e_1, 7}")};
get_first({2, 71003, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 2, map_base_id = 71003, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里所向披靡，<color='#00ff00'>第一名</color>到达"
                                 "<color='#00ff00'>雪之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({3, 71004, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 3, map_base_id = 71004, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#<color='#00ff00'>第一名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>4个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第一名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({3, 71004, Val})
    when Val >= 2 andalso Val =< 2 ->
    #elf_first_data{group = 3, map_base_id = 71004, min = 2,
                    max = 2,
                    cast =
                        lang:get("#role#<color='#00ff00'>第二名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>3个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第二名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({3, 71004, Val})
    when Val >= 3 andalso Val =< 3 ->
    #elf_first_data{group = 3, map_base_id = 71004, min = 3,
                    max = 3,
                    cast =
                        lang:get("#role#<color='#00ff00'>第三名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>2个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第三名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({3, 71004, Val})
    when Val >= 4 andalso Val =< 4 ->
    #elf_first_data{group = 3, map_base_id = 71004, min = 4,
                    max = 4,
                    cast =
                        lang:get("#role#<color='#00ff00'>第四名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>1个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第四名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({3, 71004, Val})
    when Val >= 5 andalso Val =< 5 ->
    #elf_first_data{group = 3, map_base_id = 71004, min = 5,
                    max = 5,
                    cast =
                        lang:get("#role#<color='#00ff00'>第五名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得最后一份冲刺奖励。{face_1, "
                                 "18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第五名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({3, 71001, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 3, map_base_id = 71001, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里飞速疾驰，<color='#00ff00'>第一名</color>抵达"
                                 "<color='#00ff00'>水之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({3, 71002, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 3, map_base_id = 71002, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#顺利通过水之幻境，以<color='#00ff00'>第一名</color>的"
                                 "姿态<color='#00ff00'>木之幻境</color>，其他小伙伴加油咯！{fac"
                                 "e_1, 7}")};
get_first({3, 71003, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 3, map_base_id = 71003, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里所向披靡，<color='#00ff00'>第一名</color>到达"
                                 "<color='#00ff00'>雪之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({4, 71004, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 4, map_base_id = 71004, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#<color='#00ff00'>第一名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>4个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第一名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({4, 71004, Val})
    when Val >= 2 andalso Val =< 2 ->
    #elf_first_data{group = 4, map_base_id = 71004, min = 2,
                    max = 2,
                    cast =
                        lang:get("#role#<color='#00ff00'>第二名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>3个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第二名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({4, 71004, Val})
    when Val >= 3 andalso Val =< 3 ->
    #elf_first_data{group = 4, map_base_id = 71004, min = 3,
                    max = 3,
                    cast =
                        lang:get("#role#<color='#00ff00'>第三名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>2个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第三名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({4, 71004, Val})
    when Val >= 4 andalso Val =< 4 ->
    #elf_first_data{group = 4, map_base_id = 71004, min = 4,
                    max = 4,
                    cast =
                        lang:get("#role#<color='#00ff00'>第四名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得冲刺奖励，目前还剩<color='#00"
                                 "ff00'>1个</color>名额，大家加油！{face_1, 18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第四名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({4, 71004, Val})
    when Val >= 5 andalso Val =< 5 ->
    #elf_first_data{group = 4, map_base_id = 71004, min = 5,
                    max = 5,
                    cast =
                        lang:get("#role#<color='#00ff00'>第五名</color>抵达<color='#"
                                 "00ff00'>精灵幻境5层</color>，获得最后一份冲刺奖励。{face_1, "
                                 "18}"),
                    item_list = [{23099, 0, 1}],
                    title = lang:get("精灵幻境冲刺奖励"),
                    comment =
                        lang:get("恭喜您在精灵幻境以<color='#00ff00'>第五名</color>的姿态抵达第5层"
                                 "<color='#00ff00'>幻境争霸</color>，表现优异，特赠送以下奖励：")};
get_first({4, 71001, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 4, map_base_id = 71001, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里飞速疾驰，<color='#00ff00'>第一名</color>抵达"
                                 "<color='#00ff00'>水之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first({4, 71002, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 4, map_base_id = 71002, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#顺利通过水之幻境，以<color='#00ff00'>第一名</color>的"
                                 "姿态<color='#00ff00'>木之幻境</color>，其他小伙伴加油咯！{fac"
                                 "e_1, 7}")};
get_first({4, 71003, Val})
    when Val >= 1 andalso Val =< 1 ->
    #elf_first_data{group = 4, map_base_id = 71003, min = 1,
                    max = 1,
                    cast =
                        lang:get("#role#在幻境里所向披靡，<color='#00ff00'>第一名</color>到达"
                                 "<color='#00ff00'>雪之幻境</color>，其他小伙伴加油咯！{face_"
                                 "1, 7}")};
get_first(_) -> false.

get_win({Val, 1}) when Val >= 1 andalso Val =< 8 ->
    #elf_win_data{min = 1, max = 8, flag = 1,
                  item_list =
                      [{20006, 0, 5, 220, 0},
                       {21220, 0, 1, 180, 0},
                       {20046, 0, 1, 25, 1},
                       {20020, 0, 1, 80, 0},
                       {20025, 0, 1, 130, 0},
                       {20087, 0, 1, 60, 1},
                       {21100, 0, 1, 20, 1},
                       {20095, 0, 1, 2, 1},
                       {20075, 0, 1, 2, 1},
                       {20616, 0, 1, 4, 1},
                       {20617, 0, 1, 1, 1},
                       {20021, 0, 1, 60, 0},
                       {20088, 0, 1, 40, 0},
                       {20034, 0, 1, 80, 0},
                       {20045, 0, 1, 96, 0},
                       {22450, 0, 1, 20, 0}],
                  exp = 0, pet_exp = 0};
get_win(_) -> false.

cross_list({"local_center", 9000}) ->
    [{{"local", 1}, 1},
     {{"local", 2}, 1},
     {{"local", 3}, 1},
     {{"local", 4}, 1}];
cross_list({"dev_center", 9000}) ->
    [{{"dev", 1}, 2}, {{"dev", 2}, 2}];
cross_list({"center", 9000}) ->
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
cross_list(_) -> [].

get_zone(1) ->
    [{"local", 1},
     {"local", 2},
     {"local", 3},
     {"local", 4}];
get_zone(2) -> [{"dev", 1}, {"dev", 2}];
get_zone(3) -> [{"beta", 17}, {"beta", 33}];
get_zone(30) -> [{"mix", 49}, {"mix", 1}];
get_zone(52) -> [{"unite", 1}, {"unite", 65}];
get_zone(53) -> [{"mix", 113}, {"mix", 177}];
get_zone(60) -> [{"mix", 241}, {"unite", 129}];
get_zone(44) -> [{"mix", 305}, {"unite", 225}];
get_zone(54) -> [{"mix", 337}, {"unite", 257}];
get_zone(45) -> [{"unite", 289}, {"unite", 305}];
get_zone(59) -> [{"unite", 321}, {"unite", 329}];
get_zone(41) -> [{"mix", 385}, {"unite", 337}];
get_zone(66) -> [{"mix", 393}, {"unite", 345}];
get_zone(56) -> [{"mix", 401}, {"unite", 357}];
get_zone(70) -> [{"unite", 359}, {"unite", 361}];
get_zone(71) -> [{"mix", 405}, {"unite", 363}];
get_zone(65) -> [{"mix", 409}, {"unite", 365}];
get_zone(67) -> [{"mix", 411}, {"unite", 367}];
get_zone(69) -> [{"mix", 413}, {"unite", 369}];
get_zone(72) -> [{"mix", 415}, {"unite", 371}];
get_zone(73) -> [{"mix", 416}, {"unite", 372}];
get_zone(74) -> [{"mix", 417}, {"unite", 373}];
get_zone(75) -> [{"mix", 418}, {"unite", 374}];
get_zone(_) -> [].

get_cross({"local", 1}) -> 1;
get_cross({"local", 2}) -> 1;
get_cross({"local", 3}) -> 1;
get_cross({"local", 4}) -> 1;
get_cross({"dev", 1}) -> 2;
get_cross({"dev", 2}) -> 2;
get_cross({"beta", 17}) -> 3;
get_cross({"beta", 33}) -> 3;
get_cross({"mix", 49}) -> 30;
get_cross({"mix", 1}) -> 30;
get_cross({"unite", 1}) -> 52;
get_cross({"unite", 65}) -> 52;
get_cross({"mix", 113}) -> 53;
get_cross({"mix", 177}) -> 53;
get_cross({"mix", 241}) -> 60;
get_cross({"unite", 129}) -> 60;
get_cross({"mix", 305}) -> 44;
get_cross({"unite", 225}) -> 44;
get_cross({"mix", 337}) -> 54;
get_cross({"unite", 257}) -> 54;
get_cross({"unite", 289}) -> 45;
get_cross({"unite", 305}) -> 45;
get_cross({"unite", 321}) -> 59;
get_cross({"unite", 329}) -> 59;
get_cross({"mix", 385}) -> 41;
get_cross({"unite", 337}) -> 41;
get_cross({"mix", 393}) -> 66;
get_cross({"unite", 345}) -> 66;
get_cross({"mix", 401}) -> 56;
get_cross({"unite", 357}) -> 56;
get_cross({"unite", 359}) -> 70;
get_cross({"unite", 361}) -> 70;
get_cross({"mix", 405}) -> 71;
get_cross({"unite", 363}) -> 71;
get_cross({"mix", 409}) -> 65;
get_cross({"unite", 365}) -> 65;
get_cross({"mix", 411}) -> 67;
get_cross({"unite", 367}) -> 67;
get_cross({"mix", 413}) -> 69;
get_cross({"unite", 369}) -> 69;
get_cross({"mix", 415}) -> 72;
get_cross({"unite", 371}) -> 72;
get_cross({"mix", 416}) -> 73;
get_cross({"unite", 372}) -> 73;
get_cross({"mix", 417}) -> 74;
get_cross({"unite", 373}) -> 74;
get_cross({"mix", 418}) -> 75;
get_cross({"unite", 374}) -> 75;
get_cross(_) -> false.

