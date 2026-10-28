-file("src/data/glory_data.erl", 1).

-module(glory_data).

-export([get_level/1,
         get_title/1,
         get_rank/1,
         get_switch/1,
         buffs/0,
         get_buff/1,
         get_open_rank/1,
         get_fcpercent/1]).

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

-file("src/data/glory_data.erl", 21).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/data/glory_data.erl", 22).

get_level(1) ->
    #glory_lev_data{id = 1, name = lang:get("暗夜"),
                    title_id = 1, need_title_id = 0, need_lev = 40,
                    need_fc = 4000, fc_add = 100, fc_del = 90,
                    unit_id = 81000, all_point = 2, guard_num = 4,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward = [{90000, 0, 83520, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 275000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(2) ->
    #glory_lev_data{id = 2, name = lang:get("陨落战弓"),
                    title_id = 1, need_title_id = 0, need_lev = 40,
                    need_fc = 4250, fc_add = 100, fc_del = 90,
                    unit_id = 81010, all_point = 2, guard_num = 3,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 83840, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 277750}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(3) ->
    #glory_lev_data{id = 3, name = lang:get("战争古树"),
                    title_id = 1, need_title_id = 0, need_lev = 40,
                    need_fc = 4500, fc_add = 100, fc_del = 90,
                    unit_id = 81020, all_point = 2, guard_num = 3,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20025, 0, 1, 0, 2}, {90000, 0, 84160, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 283250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(4) ->
    #glory_lev_data{id = 4, name = lang:get("不死巨人"),
                    title_id = 2, need_title_id = 0, need_lev = 40,
                    need_fc = 4750, fc_add = 100, fc_del = 90,
                    unit_id = 81030, all_point = 2, guard_num = 4,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20007, 0, 1, 0, 2}, {90000, 0, 84480, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 291200}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(5) ->
    #glory_lev_data{id = 5, name = lang:get("杰森"),
                    title_id = 2, need_title_id = 0, need_lev = 40,
                    need_fc = 5000, fc_add = 100, fc_del = 90,
                    unit_id = 81040, all_point = 5, guard_num = 4,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward = [{90000, 0, 84800, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 294000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(6) ->
    #glory_lev_data{id = 6, name = lang:get("海公主"),
                    title_id = 2, need_title_id = 0, need_lev = 40,
                    need_fc = 5250, fc_add = 100, fc_del = 90,
                    unit_id = 81050, all_point = 5, guard_num = 2,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20034, 0, 1, 0, 2}, {90000, 0, 85120, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 296800}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(7) ->
    #glory_lev_data{id = 7, name = lang:get("冰甲战熊"),
                    title_id = 2, need_title_id = 0, need_lev = 40,
                    need_fc = 5500, fc_add = 100, fc_del = 90,
                    unit_id = 81060, all_point = 5, guard_num = 0,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20600, 0, 1, 0, 2}, {90000, 0, 85440, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 299600}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(8) ->
    #glory_lev_data{id = 8, name = lang:get("不灭焰魂"),
                    title_id = 3, need_title_id = 0, need_lev = 40,
                    need_fc = 5750, fc_add = 100, fc_del = 90,
                    unit_id = 81070, all_point = 5, guard_num = 4,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20013, 0, 1, 0, 2}, {90000, 0, 85760, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 310500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(9) ->
    #glory_lev_data{id = 9, name = lang:get("福波斯"),
                    title_id = 3, need_title_id = 0, need_lev = 41,
                    need_fc = 6000, fc_add = 100, fc_del = 90,
                    unit_id = 81080, all_point = 5, guard_num = 4,
                    skill_prac = [], skill_prac_lev = [],
                    first_reward =
                        [{20000, 0, 1, 0, 2}, {90000, 0, 86080, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 313375}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(10) ->
    #glory_lev_data{id = 10, name = lang:get("三剑传承"),
                    title_id = 3, need_title_id = 0, need_lev = 42,
                    need_fc = 6350, fc_add = 100, fc_del = 90,
                    unit_id = 81090, all_point = 5, guard_num = 3,
                    skill_prac = [{62000, 1}],
                    skill_prac_lev = [{22620, 1}],
                    first_reward = [{90000, 0, 86400, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 316250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(11) ->
    #glory_lev_data{id = 11, name = lang:get("飞廉"),
                    title_id = 4, need_title_id = 0, need_lev = 43,
                    need_fc = 6700, fc_add = 100, fc_del = 90,
                    unit_id = 81100, all_point = 5, guard_num = 4,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20046, 0, 1, 0, 2}, {90000, 0, 86720, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 327450}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(12) ->
    #glory_lev_data{id = 12, name = lang:get("荒古牛魔"),
                    title_id = 4, need_title_id = 0, need_lev = 44,
                    need_fc = 7050, fc_add = 100, fc_del = 90,
                    unit_id = 81110, all_point = 5, guard_num = 3,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20525, 0, 1, 1, 1},
                         {20526, 0, 1, 2, 1},
                         {20527, 0, 1, 3, 1},
                         {20528, 0, 1, 4, 1},
                         {20529, 0, 1, 5, 1},
                         {21852, 0, 1, 6, 1},
                         {21962, 0, 1, 7, 1},
                         {23525, 0, 1, 1, 0},
                         {23526, 0, 1, 2, 0},
                         {23527, 0, 1, 3, 0},
                         {23528, 0, 1, 4, 0},
                         {23529, 0, 1, 5, 0},
                         {21853, 0, 1, 6, 0},
                         {21963, 0, 1, 7, 0},
                         {90000, 0, 87040, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 330400}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(13) ->
    #glory_lev_data{id = 13, name = lang:get("熔岩之心"),
                    title_id = 4, need_title_id = 0, need_lev = 45,
                    need_fc = 7400, fc_add = 100, fc_del = 90,
                    unit_id = 81120, all_point = 5, guard_num = 2,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 87360, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 333350}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(14) ->
    #glory_lev_data{id = 14, name = lang:get("绯月剑心"),
                    title_id = 5, need_title_id = 0, need_lev = 46,
                    need_fc = 7750, fc_add = 100, fc_del = 90,
                    unit_id = 81130, all_point = 5, guard_num = 2,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20022, 0, 1, 0, 2}, {90000, 0, 87680, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 342000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(15) ->
    #glory_lev_data{id = 15, name = lang:get("杰森"),
                    title_id = 5, need_title_id = 0, need_lev = 47,
                    need_fc = 8200, fc_add = 100, fc_del = 90,
                    unit_id = 81140, all_point = 8, guard_num = 4,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward = [{90000, 0, 88000, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 345000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(16) ->
    #glory_lev_data{id = 16, name = lang:get("三剑传承"),
                    title_id = 5, need_title_id = 0, need_lev = 48,
                    need_fc = 8550, fc_add = 100, fc_del = 90,
                    unit_id = 81150, all_point = 8, guard_num = 2,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20054, 0, 1, 0, 2}, {90000, 0, 88320, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 348000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(17) ->
    #glory_lev_data{id = 17, name = lang:get("远古诅咒"),
                    title_id = 5, need_title_id = 0, need_lev = 49,
                    need_fc = 9000, fc_add = 100, fc_del = 90,
                    unit_id = 81160, all_point = 8, guard_num = 4,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20055, 0, 1, 0, 2}, {90000, 0, 88640, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 351000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(18) ->
    #glory_lev_data{id = 18, name = lang:get("战争古树"),
                    title_id = 6, need_title_id = 0, need_lev = 50,
                    need_fc = 9350, fc_add = 100, fc_del = 90,
                    unit_id = 81170, all_point = 8, guard_num = 3,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20056, 0, 1, 0, 2}, {90000, 0, 88960, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 359900}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(19) ->
    #glory_lev_data{id = 19, name = lang:get("绯月剑心"),
                    title_id = 6, need_title_id = 0, need_lev = 51,
                    need_fc = 9700, fc_add = 100, fc_del = 90,
                    unit_id = 81180, all_point = 8, guard_num = 2,
                    skill_prac = [{62000, 1}], skill_prac_lev = [],
                    first_reward =
                        [{20057, 0, 1, 0, 2}, {90000, 0, 89280, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 362950}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(20) ->
    #glory_lev_data{id = 20, name = lang:get("福波斯"),
                    title_id = 6, need_title_id = 0, need_lev = 52,
                    need_fc = 10050, fc_add = 100, fc_del = 90,
                    unit_id = 81190, all_point = 8, guard_num = 4,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [{22621, 1}, {22622, 1}],
                    first_reward = [{90000, 0, 89600, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 366000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(21) ->
    #glory_lev_data{id = 21, name = lang:get("荒古牛魔"),
                    title_id = 7, need_title_id = 0, need_lev = 53,
                    need_fc = 10300, fc_add = 100, fc_del = 90,
                    unit_id = 81200, all_point = 8, guard_num = 3,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20530, 0, 1, 1, 1},
                         {20531, 0, 1, 2, 1},
                         {20532, 0, 1, 3, 1},
                         {20533, 0, 1, 4, 1},
                         {20534, 0, 1, 5, 1},
                         {21854, 0, 1, 6, 1},
                         {21964, 0, 1, 7, 1},
                         {23530, 0, 1, 1, 0},
                         {23531, 0, 1, 2, 0},
                         {23532, 0, 1, 3, 0},
                         {23533, 0, 1, 4, 0},
                         {23534, 0, 1, 5, 0},
                         {21855, 0, 1, 6, 0},
                         {21965, 0, 1, 7, 0},
                         {90000, 0, 89920, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 378125}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(22) ->
    #glory_lev_data{id = 22, name = lang:get("飞廉"),
                    title_id = 7, need_title_id = 0, need_lev = 54,
                    need_fc = 10550, fc_add = 100, fc_del = 90,
                    unit_id = 81210, all_point = 8, guard_num = 4,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 90240, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 381250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(23) ->
    #glory_lev_data{id = 23, name = lang:get("不灭焰魂"),
                    title_id = 7, need_title_id = 0, need_lev = 55,
                    need_fc = 10800, fc_add = 100, fc_del = 90,
                    unit_id = 81220, all_point = 8, guard_num = 4,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20025, 0, 1, 0, 2}, {90000, 0, 90560, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 384375}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(24) ->
    #glory_lev_data{id = 24, name = lang:get("绯月剑心"),
                    title_id = 8, need_title_id = 0, need_lev = 56,
                    need_fc = 11050, fc_add = 100, fc_del = 90,
                    unit_id = 81230, all_point = 8, guard_num = 2,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20062, 0, 1, 0, 2}, {90000, 0, 90880, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 396800}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(25) ->
    #glory_lev_data{id = 25, name = lang:get("杰森"),
                    title_id = 8, need_title_id = 0, need_lev = 57,
                    need_fc = 11300, fc_add = 100, fc_del = 90,
                    unit_id = 81240, all_point = 11, guard_num = 4,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward = [{90000, 0, 91200, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 400000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(26) ->
    #glory_lev_data{id = 26, name = lang:get("海公主"),
                    title_id = 8, need_title_id = 0, need_lev = 59,
                    need_fc = 11550, fc_add = 100, fc_del = 90,
                    unit_id = 81250, all_point = 11, guard_num = 2,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20063, 0, 1, 0, 2}, {90000, 0, 91520, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 403200}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(27) ->
    #glory_lev_data{id = 27, name = lang:get("冰甲战熊"),
                    title_id = 8, need_title_id = 0, need_lev = 60,
                    need_fc = 11800, fc_add = 100, fc_del = 90,
                    unit_id = 81260, all_point = 11, guard_num = 0,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20064, 0, 1, 0, 2}, {90000, 0, 91840, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 406400}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(28) ->
    #glory_lev_data{id = 28, name = lang:get("熔岩之心"),
                    title_id = 9, need_title_id = 0, need_lev = 61,
                    need_fc = 12050, fc_add = 100, fc_del = 90,
                    unit_id = 81270, all_point = 11, guard_num = 2,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20065, 0, 1, 0, 2}, {90000, 0, 92160, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 416000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(29) ->
    #glory_lev_data{id = 29, name = lang:get("远古诅咒"),
                    title_id = 9, need_title_id = 0, need_lev = 62,
                    need_fc = 12300, fc_add = 100, fc_del = 90,
                    unit_id = 81280, all_point = 11, guard_num = 4,
                    skill_prac = [{62000, 1}, {62100, 1}, {62200, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20066, 0, 1, 0, 2}, {90000, 0, 92480, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21420, 0, 1, 50},
                         {21421, 0, 1, 10},
                         {21422, 0, 1, 5},
                         {20006, 0, 3, 25},
                         {20034, 0, 1, 10}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 419250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(30) ->
    #glory_lev_data{id = 30, name = lang:get("福波斯"),
                    title_id = 9, need_title_id = 0, need_lev = 63,
                    need_fc = 12550, fc_add = 100, fc_del = 90,
                    unit_id = 81290, all_point = 11, guard_num = 4,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [{22623, 1}],
                    first_reward = [{90000, 0, 92800, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 7800},
                         {21098, 0, 2, 3000},
                         {21420, 0, 1, 1095},
                         {21421, 0, 1, 1215},
                         {21422, 0, 1, 870},
                         {21423, 0, 1, 510},
                         {21380, 0, 1, 75},
                         {21381, 0, 1, 75},
                         {21382, 0, 1, 75},
                         {21383, 0, 1, 75},
                         {21384, 0, 1, 45},
                         {21385, 0, 1, 45},
                         {21386, 0, 1, 30},
                         {21387, 0, 1, 15},
                         {21388, 0, 1, 15},
                         {21389, 0, 1, 15},
                         {21390, 0, 1, 15},
                         {21391, 0, 1, 15},
                         {21392, 0, 1, 15}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 422500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(31) ->
    #glory_lev_data{id = 31, name = lang:get("荒古牛魔"),
                    title_id = 10, need_title_id = 0, need_lev = 64,
                    need_fc = 12800, fc_add = 100, fc_del = 90,
                    unit_id = 81300, all_point = 11, guard_num = 3,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20535, 0, 1, 1, 1},
                         {20536, 0, 1, 2, 1},
                         {20537, 0, 1, 3, 1},
                         {20538, 0, 1, 4, 1},
                         {20539, 0, 1, 5, 1},
                         {21856, 0, 1, 6, 1},
                         {21966, 0, 1, 7, 1},
                         {23535, 0, 1, 1, 0},
                         {23536, 0, 1, 2, 0},
                         {23537, 0, 1, 3, 0},
                         {23538, 0, 1, 4, 0},
                         {23539, 0, 1, 5, 0},
                         {21857, 0, 1, 6, 0},
                         {21967, 0, 1, 7, 0},
                         {90000, 0, 93120, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 432300}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(32) ->
    #glory_lev_data{id = 32, name = lang:get("暗夜"),
                    title_id = 10, need_title_id = 0, need_lev = 65,
                    need_fc = 13050, fc_add = 100, fc_del = 90,
                    unit_id = 81310, all_point = 11, guard_num = 2,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20008, 0, 1, 0, 2}, {90000, 0, 93440, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 435600}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(33) ->
    #glory_lev_data{id = 33, name = lang:get("三剑传承"),
                    title_id = 10, need_title_id = 0, need_lev = 67,
                    need_fc = 13500, fc_add = 100, fc_del = 90,
                    unit_id = 81320, all_point = 11, guard_num = 2,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20022, 0, 1, 0, 2}, {90000, 0, 93760, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 438900}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(34) ->
    #glory_lev_data{id = 34, name = lang:get("不死巨人"),
                    title_id = 11, need_title_id = 0, need_lev = 69,
                    need_fc = 14000, fc_add = 100, fc_del = 90,
                    unit_id = 81330, all_point = 11, guard_num = 4,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 94080, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 452250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(35) ->
    #glory_lev_data{id = 35, name = lang:get("杰森"),
                    title_id = 11, need_title_id = 0, need_lev = 70,
                    need_fc = 14500, fc_add = 100, fc_del = 90,
                    unit_id = 81340, all_point = 14, guard_num = 4,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward = [{90000, 0, 94400, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 455625}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(36) ->
    #glory_lev_data{id = 36, name = lang:get("不灭焰魂"),
                    title_id = 11, need_title_id = 0, need_lev = 71,
                    need_fc = 15000, fc_add = 100, fc_del = 90,
                    unit_id = 81350, all_point = 14, guard_num = 4,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20025, 0, 1, 0, 2}, {90000, 0, 94720, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 459000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(37) ->
    #glory_lev_data{id = 37, name = lang:get("战争古树"),
                    title_id = 11, need_title_id = 0, need_lev = 72,
                    need_fc = 15500, fc_add = 100, fc_del = 90,
                    unit_id = 81360, all_point = 14, guard_num = 3,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 95040, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 462375}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(38) ->
    #glory_lev_data{id = 38, name = lang:get("远古诅咒"),
                    title_id = 12, need_title_id = 0, need_lev = 73,
                    need_fc = 16000, fc_add = 100, fc_del = 90,
                    unit_id = 81370, all_point = 14, guard_num = 4,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20095, 0, 1, 0, 2}, {90000, 0, 95360, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 476100}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(39) ->
    #glory_lev_data{id = 39, name = lang:get("冰甲战熊"),
                    title_id = 12, need_title_id = 0, need_lev = 74,
                    need_fc = 16500, fc_add = 100, fc_del = 90,
                    unit_id = 81380, all_point = 14, guard_num = 0,
                    skill_prac =
                        [{62000, 1}, {62100, 1}, {62200, 1}, {62300, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20004, 0, 3, 0, 2}, {90000, 0, 95680, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 479550}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(40) ->
    #glory_lev_data{id = 40, name = lang:get("飞廉"),
                    title_id = 12, need_title_id = 0, need_lev = 75,
                    need_fc = 17000, fc_add = 100, fc_del = 90,
                    unit_id = 81390, all_point = 14, guard_num = 4,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [{22624, 1}, {22625, 1}],
                    first_reward = [{90000, 0, 96000, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 7800},
                         {21098, 0, 2, 3000},
                         {21420, 0, 1, 1095},
                         {21421, 0, 1, 1215},
                         {21422, 0, 1, 870},
                         {21423, 0, 1, 510},
                         {21380, 0, 1, 75},
                         {21381, 0, 1, 75},
                         {21382, 0, 1, 75},
                         {21383, 0, 1, 75},
                         {21384, 0, 1, 45},
                         {21385, 0, 1, 45},
                         {21386, 0, 1, 30},
                         {21387, 0, 1, 15},
                         {21388, 0, 1, 15},
                         {21389, 0, 1, 15},
                         {21390, 0, 1, 15},
                         {21391, 0, 1, 15},
                         {21392, 0, 1, 15}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 483000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(41) ->
    #glory_lev_data{id = 41, name = lang:get("福波斯"),
                    title_id = 13, need_title_id = 0, need_lev = 76,
                    need_fc = 17500, fc_add = 100, fc_del = 90,
                    unit_id = 81400, all_point = 14, guard_num = 4,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20540, 0, 1, 1, 1},
                         {20541, 0, 1, 2, 1},
                         {20542, 0, 1, 3, 1},
                         {20543, 0, 1, 4, 1},
                         {20544, 0, 1, 5, 1},
                         {21858, 0, 1, 6, 1},
                         {21968, 0, 1, 7, 1},
                         {23540, 0, 1, 1, 0},
                         {23541, 0, 1, 2, 0},
                         {23542, 0, 1, 3, 0},
                         {23543, 0, 1, 4, 0},
                         {23544, 0, 1, 5, 0},
                         {21859, 0, 1, 6, 0},
                         {21969, 0, 1, 7, 0},
                         {90000, 0, 96320, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 493500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(42) ->
    #glory_lev_data{id = 42, name = lang:get("暗夜"),
                    title_id = 13, need_title_id = 0, need_lev = 77,
                    need_fc = 18000, fc_add = 100, fc_del = 90,
                    unit_id = 81410, all_point = 14, guard_num = 2,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 96640, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 497000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(43) ->
    #glory_lev_data{id = 43, name = lang:get("海公主"),
                    title_id = 13, need_title_id = 0, need_lev = 78,
                    need_fc = 18500, fc_add = 100, fc_del = 90,
                    unit_id = 81420, all_point = 14, guard_num = 2,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20007, 0, 1, 0, 2}, {90000, 0, 96960, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 500500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(44) ->
    #glory_lev_data{id = 44, name = lang:get("绯月剑心"),
                    title_id = 14, need_title_id = 0, need_lev = 79,
                    need_fc = 19000, fc_add = 100, fc_del = 90,
                    unit_id = 81430, all_point = 14, guard_num = 2,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20020, 0, 3, 0, 2}, {90000, 0, 97280, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 511200}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(45) ->
    #glory_lev_data{id = 45, name = lang:get("杰森"),
                    title_id = 14, need_title_id = 0, need_lev = 80,
                    need_fc = 19500, fc_add = 100, fc_del = 90,
                    unit_id = 81440, all_point = 18, guard_num = 4,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward = [{90000, 0, 97600, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 514750}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(46) ->
    #glory_lev_data{id = 46, name = lang:get("荒古牛魔"),
                    title_id = 14, need_title_id = 0, need_lev = 81,
                    need_fc = 20000, fc_add = 100, fc_del = 90,
                    unit_id = 81450, all_point = 18, guard_num = 3,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20009, 0, 1, 0, 2}, {90000, 0, 97920, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 518300}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(47) ->
    #glory_lev_data{id = 47, name = lang:get("不灭焰魂"),
                    title_id = 14, need_title_id = 0, need_lev = 82,
                    need_fc = 20500, fc_add = 100, fc_del = 90,
                    unit_id = 81460, all_point = 18, guard_num = 4,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20014, 0, 1, 0, 2}, {90000, 0, 98240, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 521850}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(48) ->
    #glory_lev_data{id = 48, name = lang:get("熔岩之心"),
                    title_id = 15, need_title_id = 0, need_lev = 83,
                    need_fc = 21000, fc_add = 100, fc_del = 90,
                    unit_id = 81470, all_point = 18, guard_num = 2,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 5, 0, 2}, {90000, 0, 98560, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 536500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(49) ->
    #glory_lev_data{id = 49, name = lang:get("三剑传承"),
                    title_id = 15, need_title_id = 0, need_lev = 85,
                    need_fc = 21650, fc_add = 100, fc_del = 90,
                    unit_id = 81480, all_point = 18, guard_num = 2,
                    skill_prac =
                        [{62000, 1},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20025, 0, 1, 0, 2}, {90000, 0, 98880, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 540125}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(50) ->
    #glory_lev_data{id = 50, name = lang:get("不死巨人"),
                    title_id = 15, need_title_id = 0, need_lev = 86,
                    need_fc = 22250, fc_add = 100, fc_del = 90,
                    unit_id = 81490, all_point = 18, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [{22620, 1}],
                    first_reward = [{90000, 0, 99200, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 6000},
                         {21098, 0, 2, 4050},
                         {21420, 0, 1, 1095},
                         {21421, 0, 1, 1185},
                         {21422, 0, 1, 1245},
                         {21423, 0, 1, 585},
                         {21424, 0, 1, 330},
                         {21380, 0, 1, 75},
                         {21381, 0, 1, 75},
                         {21382, 0, 1, 75},
                         {21383, 0, 1, 75},
                         {21384, 0, 1, 45},
                         {21385, 0, 1, 45},
                         {21386, 0, 1, 30},
                         {21387, 0, 1, 15},
                         {21388, 0, 1, 15},
                         {21389, 0, 1, 15},
                         {21390, 0, 1, 15},
                         {21391, 0, 1, 15},
                         {21392, 0, 1, 15}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 555000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(51) ->
    #glory_lev_data{id = 51, name = lang:get("战争古树"),
                    title_id = 16, need_title_id = 0, need_lev = 87,
                    need_fc = 22850, fc_add = 100, fc_del = 90,
                    unit_id = 81500, all_point = 18, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{29104, 0, 3, 0, 2}, {90000, 0, 96320, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 558700}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(52) ->
    #glory_lev_data{id = 52, name = lang:get("无名"),
                    title_id = 16, need_title_id = 0, need_lev = 88,
                    need_fc = 23450, fc_add = 100, fc_del = 90,
                    unit_id = 81510, all_point = 18, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 1},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{29143, 0, 2, 0, 2}, {90000, 0, 96640, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 562400}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(53) ->
    #glory_lev_data{id = 53, name = lang:get("绯月剑心"),
                    title_id = 16, need_title_id = 0, need_lev = 89,
                    need_fc = 24050, fc_add = 100, fc_del = 90,
                    unit_id = 81520, all_point = 18, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [{22621, 1}],
                    first_reward = [{90000, 0, 96960, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 566100}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(54) ->
    #glory_lev_data{id = 54, name = lang:get("千速兽灵"),
                    title_id = 17, need_title_id = 0, need_lev = 90,
                    need_fc = 24650, fc_add = 100, fc_del = 90,
                    unit_id = 81530, all_point = 18, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 8, 0, 2}, {90000, 0, 97280, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 577500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(55) ->
    #glory_lev_data{id = 55, name = lang:get("杰森"),
                    title_id = 17, need_title_id = 0, need_lev = 91,
                    need_fc = 25250, fc_add = 100, fc_del = 90,
                    unit_id = 81540, all_point = 18, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20616, 0, 1, 0, 2}, {90000, 0, 97600, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 581250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(56) ->
    #glory_lev_data{id = 56, name = lang:get("冰甲战熊"),
                    title_id = 17, need_title_id = 0, need_lev = 92,
                    need_fc = 25850, fc_add = 100, fc_del = 90,
                    unit_id = 81550, all_point = 18, guard_num = 0,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20007, 0, 2, 0, 2}, {90000, 0, 97920, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 585000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(57) ->
    #glory_lev_data{id = 57, name = lang:get("熔岩之心"),
                    title_id = 17, need_title_id = 0, need_lev = 93,
                    need_fc = 26450, fc_add = 100, fc_del = 90,
                    unit_id = 81560, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward = [{90000, 0, 98240, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 588750}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(58) ->
    #glory_lev_data{id = 58, name = lang:get("远古诅咒"),
                    title_id = 18, need_title_id = 0, need_lev = 94,
                    need_fc = 27050, fc_add = 100, fc_del = 90,
                    unit_id = 81570, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20075, 0, 1, 0, 2}, {90000, 0, 98560, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 600400}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(59) ->
    #glory_lev_data{id = 59, name = lang:get("不灭焰魂"),
                    title_id = 18, need_title_id = 0, need_lev = 95,
                    need_fc = 27650, fc_add = 100, fc_del = 90,
                    unit_id = 81580, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 1},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{29102, 0, 1, 0, 2}, {90000, 0, 98880, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 604200}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(60) ->
    #glory_lev_data{id = 60, name = lang:get("海公主"),
                    title_id = 18, need_title_id = 0, need_lev = 95,
                    need_fc = 28600, fc_add = 100, fc_del = 90,
                    unit_id = 81590, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [{22622, 1}],
                    first_reward = [{90000, 0, 99200, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 6000},
                         {21098, 0, 2, 4050},
                         {21420, 0, 1, 1095},
                         {21421, 0, 1, 1185},
                         {21422, 0, 1, 1245},
                         {21423, 0, 1, 585},
                         {21424, 0, 1, 330},
                         {21380, 0, 1, 75},
                         {21381, 0, 1, 75},
                         {21382, 0, 1, 75},
                         {21383, 0, 1, 75},
                         {21384, 0, 1, 45},
                         {21385, 0, 1, 45},
                         {21386, 0, 1, 30},
                         {21387, 0, 1, 15},
                         {21388, 0, 1, 15},
                         {21389, 0, 1, 15},
                         {21390, 0, 1, 15},
                         {21391, 0, 1, 15},
                         {21392, 0, 1, 15}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 620000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(61) ->
    #glory_lev_data{id = 61, name = lang:get("三剑传承"),
                    title_id = 19, need_title_id = 0, need_lev = 95,
                    need_fc = 29050, fc_add = 100, fc_del = 90,
                    unit_id = 81600, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{21801, 0, 1, 1, 1},
                         {21802, 0, 1, 2, 1},
                         {21803, 0, 1, 3, 1},
                         {21804, 0, 1, 4, 1},
                         {21805, 0, 1, 5, 1},
                         {21862, 0, 1, 6, 1},
                         {21972, 0, 1, 7, 1},
                         {21806, 0, 1, 1, 0},
                         {21807, 0, 1, 2, 0},
                         {21808, 0, 1, 3, 0},
                         {21809, 0, 1, 4, 0},
                         {21810, 0, 1, 5, 0},
                         {21863, 0, 1, 6, 0},
                         {21973, 0, 1, 7, 0},
                         {90000, 0, 99520, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 623875}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(62) ->
    #glory_lev_data{id = 62, name = lang:get("战争古树"),
                    title_id = 19, need_title_id = 0, need_lev = 95,
                    need_fc = 29500, fc_add = 100, fc_del = 90,
                    unit_id = 81610, all_point = 21, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 10, 0, 2}, {90000, 0, 99840, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 627750}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(63) ->
    #glory_lev_data{id = 63, name = lang:get("无名"),
                    title_id = 19, need_title_id = 0, need_lev = 95,
                    need_fc = 29950, fc_add = 100, fc_del = 90,
                    unit_id = 81620, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20038, 0, 1, 0, 2}, {90000, 0, 100160, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 631625}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(64) ->
    #glory_lev_data{id = 64, name = lang:get("千速兽灵"),
                    title_id = 20, need_title_id = 0, need_lev = 95,
                    need_fc = 30400, fc_add = 100, fc_del = 90,
                    unit_id = 81630, all_point = 21, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20400, 0, 3, 0, 2}, {90000, 0, 100480, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 656000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(65) ->
    #glory_lev_data{id = 65, name = lang:get("杰森"),
                    title_id = 20, need_title_id = 0, need_lev = 95,
                    need_fc = 30850, fc_add = 100, fc_del = 90,
                    unit_id = 81640, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{22306, 0, 1, 0, 2}, {90000, 0, 100800, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 660000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(66) ->
    #glory_lev_data{id = 66, name = lang:get("熔岩之心"),
                    title_id = 20, need_title_id = 0, need_lev = 95,
                    need_fc = 31300, fc_add = 100, fc_del = 90,
                    unit_id = 81650, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{23840, 0, 1, 0, 2}, {90000, 0, 101120, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 664000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(67) ->
    #glory_lev_data{id = 67, name = lang:get("冰甲战熊"),
                    title_id = 20, need_title_id = 0, need_lev = 95,
                    need_fc = 31650, fc_add = 100, fc_del = 90,
                    unit_id = 81660, all_point = 21, guard_num = 0,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{23841, 0, 1, 0, 2}, {90000, 0, 101440, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 668000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(68) ->
    #glory_lev_data{id = 68, name = lang:get("荒古牛魔"),
                    title_id = 21, need_title_id = 0, need_lev = 95,
                    need_fc = 32000, fc_add = 100, fc_del = 90,
                    unit_id = 81670, all_point = 21, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{23842, 0, 1, 0, 2}, {90000, 0, 101760, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 693000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(69) ->
    #glory_lev_data{id = 69, name = lang:get("飞廉"),
                    title_id = 21, need_title_id = 0, need_lev = 100,
                    need_fc = 32600, fc_add = 100, fc_del = 90,
                    unit_id = 81680, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{23843, 0, 1, 0, 2}, {90000, 0, 102080, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 697125}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(70) ->
    #glory_lev_data{id = 70, name = lang:get("远古诅咒"),
                    title_id = 21, need_title_id = 0, need_lev = 100,
                    need_fc = 33000, fc_add = 100, fc_del = 90,
                    unit_id = 81690, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{23844, 0, 1, 0, 2}, {90000, 0, 102400, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 2, 11100},
                         {21420, 0, 1, 525},
                         {21421, 0, 1, 870},
                         {21422, 0, 1, 870},
                         {21423, 0, 1, 690},
                         {21424, 0, 1, 435},
                         {21380, 0, 1, 75},
                         {21381, 0, 1, 75},
                         {21382, 0, 1, 75},
                         {21383, 0, 1, 75},
                         {21384, 0, 1, 45},
                         {21385, 0, 1, 45},
                         {21386, 0, 1, 30},
                         {21387, 0, 1, 15},
                         {21388, 0, 1, 15},
                         {21389, 0, 1, 15},
                         {21390, 0, 1, 15},
                         {21391, 0, 1, 15},
                         {21392, 0, 1, 15}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 701250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(71) ->
    #glory_lev_data{id = 71, name = lang:get("绯月剑心"),
                    title_id = 22, need_title_id = 0, need_lev = 100,
                    need_fc = 33500, fc_add = 100, fc_del = 90,
                    unit_id = 81700, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{22216, 0, 1, 0, 2}, {90000, 0, 102720, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 726750}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(72) ->
    #glory_lev_data{id = 72, name = lang:get("不死巨人"),
                    title_id = 22, need_title_id = 0, need_lev = 100,
                    need_fc = 34000, fc_add = 100, fc_del = 90,
                    unit_id = 81710, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20404, 0, 1, 0, 2}, {90000, 0, 103040, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 731000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(73) ->
    #glory_lev_data{id = 73, name = lang:get("不灭焰魂"),
                    title_id = 22, need_title_id = 0, need_lev = 100,
                    need_fc = 34500, fc_add = 100, fc_del = 90,
                    unit_id = 81720, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20006, 0, 15, 0, 2}, {90000, 0, 103360, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 735250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(74) ->
    #glory_lev_data{id = 74, name = lang:get("熔岩之心"),
                    title_id = 22, need_title_id = 0, need_lev = 110,
                    need_fc = 35000, fc_add = 100, fc_del = 90,
                    unit_id = 81730, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{29314, 0, 1, 0, 2}, {90000, 0, 103680, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 739500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(75) ->
    #glory_lev_data{id = 75, name = lang:get("杰森"),
                    title_id = 23, need_title_id = 0, need_lev = 110,
                    need_fc = 35500, fc_add = 100, fc_del = 90,
                    unit_id = 81740, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20007, 0, 3, 0, 2}, {90000, 0, 104000, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 765625}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(76) ->
    #glory_lev_data{id = 76, name = lang:get("荒古牛魔"),
                    title_id = 23, need_title_id = 0, need_lev = 110,
                    need_fc = 36000, fc_add = 100, fc_del = 90,
                    unit_id = 81750, all_point = 21, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{22010, 0, 1, 1, 1},
                         {22011, 0, 1, 2, 1},
                         {22012, 0, 1, 3, 1},
                         {22013, 0, 1, 4, 1},
                         {22014, 0, 1, 5, 1},
                         {22015, 0, 1, 6, 1},
                         {21974, 0, 1, 7, 1},
                         {22016, 0, 1, 1, 0},
                         {22017, 0, 1, 2, 0},
                         {22018, 0, 1, 3, 0},
                         {22019, 0, 1, 4, 0},
                         {22020, 0, 1, 5, 0},
                         {22021, 0, 1, 6, 0},
                         {21975, 0, 1, 7, 0},
                         {90000, 0, 104640, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 770000}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(77) ->
    #glory_lev_data{id = 77, name = lang:get("飞廉"),
                    title_id = 23, need_title_id = 0, need_lev = 110,
                    need_fc = 36500, fc_add = 100, fc_del = 90,
                    unit_id = 81760, all_point = 21, guard_num = 4,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20053, 0, 1, 0, 2}, {90000, 0, 104640, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 787500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(78) ->
    #glory_lev_data{id = 78, name = lang:get("战争古树"),
                    title_id = 23, need_title_id = 0, need_lev = 110,
                    need_fc = 37000, fc_add = 100, fc_del = 90,
                    unit_id = 81770, all_point = 21, guard_num = 3,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{29102, 0, 2, 0, 2}, {90000, 0, 104960, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 809375}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(79) ->
    #glory_lev_data{id = 79, name = lang:get("海公主"),
                    title_id = 23, need_title_id = 0, need_lev = 110,
                    need_fc = 37500, fc_add = 100, fc_del = 90,
                    unit_id = 81780, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{21244, 0, 1, 0, 2}, {90000, 0, 105280, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 831250}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(80) ->
    #glory_lev_data{id = 80, name = lang:get("三剑传承"),
                    title_id = 24, need_title_id = 0, need_lev = 110,
                    need_fc = 38000, fc_add = 100, fc_del = 90,
                    unit_id = 81790, all_point = 21, guard_num = 2,
                    skill_prac =
                        [{62000, 2},
                         {62100, 2},
                         {62200, 2},
                         {62300, 1},
                         {62400, 1},
                         {62500, 1}],
                    skill_prac_lev = [],
                    first_reward =
                        [{20076, 0, 1, 0, 2}, {90000, 0, 105600, 0, 2}],
                    first_exp_mod = 3361,
                    normal_reward =
                        [{21098, 0, 1, 3125},
                         {21420, 0, 1, 500},
                         {21421, 0, 1, 250},
                         {21422, 0, 1, 125},
                         {20006, 0, 3, 2750},
                         {20034, 0, 1, 250}],
                    normal_exp_mod = 3359,
                    day_reward = [{90000, 0, 877500}], day_exp_mod = 3360,
                    buff_num = 99, buff_id = 31013};
get_level(_) -> false.

get_title(0) ->
    #glory_title_data{title_id = 0, next_title_id = 1,
                      title_name = lang:get("平民"), honor_id = 30000,
                      rate = 0};
get_title(1) ->
    #glory_title_data{title_id = 1, next_title_id = 2,
                      title_name = lang:get("初级游侠"), honor_id = 30001,
                      rate = 100};
get_title(2) ->
    #glory_title_data{title_id = 2, next_title_id = 3,
                      title_name = lang:get("中级游侠"), honor_id = 30002,
                      rate = 120};
get_title(3) ->
    #glory_title_data{title_id = 3, next_title_id = 4,
                      title_name = lang:get("高级游侠"), honor_id = 30003,
                      rate = 150};
get_title(4) ->
    #glory_title_data{title_id = 4, next_title_id = 5,
                      title_name = lang:get("三等骑士"), honor_id = 30004,
                      rate = 180};
get_title(5) ->
    #glory_title_data{title_id = 5, next_title_id = 6,
                      title_name = lang:get("二等骑士"), honor_id = 30005,
                      rate = 200};
get_title(6) ->
    #glory_title_data{title_id = 6, next_title_id = 7,
                      title_name = lang:get("一等骑士"), honor_id = 30006,
                      rate = 220};
get_title(7) ->
    #glory_title_data{title_id = 7, next_title_id = 8,
                      title_name = lang:get("三等勋爵"), honor_id = 30007,
                      rate = 250};
get_title(8) ->
    #glory_title_data{title_id = 8, next_title_id = 9,
                      title_name = lang:get("二等勋爵"), honor_id = 30008,
                      rate = 280};
get_title(9) ->
    #glory_title_data{title_id = 9, next_title_id = 10,
                      title_name = lang:get("一等勋爵"), honor_id = 30009,
                      rate = 300};
get_title(10) ->
    #glory_title_data{title_id = 10, next_title_id = 11,
                      title_name = lang:get("三等子爵"), honor_id = 30010,
                      rate = 320};
get_title(11) ->
    #glory_title_data{title_id = 11, next_title_id = 12,
                      title_name = lang:get("二等子爵"), honor_id = 30011,
                      rate = 350};
get_title(12) ->
    #glory_title_data{title_id = 12, next_title_id = 13,
                      title_name = lang:get("一等子爵"), honor_id = 30012,
                      rate = 380};
get_title(13) ->
    #glory_title_data{title_id = 13, next_title_id = 14,
                      title_name = lang:get("三等伯爵"), honor_id = 30013,
                      rate = 400};
get_title(14) ->
    #glory_title_data{title_id = 14, next_title_id = 15,
                      title_name = lang:get("二等伯爵"), honor_id = 30014,
                      rate = 420};
get_title(15) ->
    #glory_title_data{title_id = 15, next_title_id = 16,
                      title_name = lang:get("一等伯爵"), honor_id = 30015,
                      rate = 450};
get_title(16) ->
    #glory_title_data{title_id = 16, next_title_id = 17,
                      title_name = lang:get("三等侯爵"), honor_id = 30030,
                      rate = 480};
get_title(17) ->
    #glory_title_data{title_id = 17, next_title_id = 18,
                      title_name = lang:get("二等侯爵"), honor_id = 30031,
                      rate = 500};
get_title(18) ->
    #glory_title_data{title_id = 18, next_title_id = 19,
                      title_name = lang:get("一等侯爵"), honor_id = 30032,
                      rate = 520};
get_title(19) ->
    #glory_title_data{title_id = 19, next_title_id = 20,
                      title_name = lang:get("三等公爵"), honor_id = 30033,
                      rate = 550};
get_title(20) ->
    #glory_title_data{title_id = 20, next_title_id = 21,
                      title_name = lang:get("二等公爵"), honor_id = 30034,
                      rate = 600};
get_title(21) ->
    #glory_title_data{title_id = 21, next_title_id = 22,
                      title_name = lang:get("一等公爵"), honor_id = 30035,
                      rate = 650};
get_title(22) ->
    #glory_title_data{title_id = 22, next_title_id = 23,
                      title_name = lang:get("三等大公"), honor_id = 30036,
                      rate = 700};
get_title(23) ->
    #glory_title_data{title_id = 23, next_title_id = 24,
                      title_name = lang:get("二等大公"), honor_id = 30037,
                      rate = 750};
get_title(24) ->
    #glory_title_data{title_id = 24,
                      title_name = lang:get("一等大公"), honor_id = 30038,
                      rate = 800};
get_title(_) -> false.

get_rank(Val) when Val >= 1 andalso Val =< 3 ->
    #glory_rank_data{min = 1, max = 3,
                     reward = [{21165, 1}, {21098, 5}, {29046, 3}]};
get_rank(Val) when Val >= 4 andalso Val =< 10 ->
    #glory_rank_data{min = 4, max = 10,
                     reward = [{21098, 5}, {29046, 3}]};
get_rank(Val) when Val >= 11 andalso Val =< 20 ->
    #glory_rank_data{min = 11, max = 20,
                     reward = [{21098, 3}, {29046, 2}]};
get_rank(Val) when Val >= 21 andalso Val =< 50 ->
    #glory_rank_data{min = 21, max = 50,
                     reward = [{21098, 1}, {29046, 1}]};
get_rank(_) -> false.

get_open_rank({Val, 14})
    when Val >= 1 andalso Val =< 1 ->
    #glory_open_rank_data{min = 1, max = 1, open = 14};
get_open_rank({Val, 14})
    when Val >= 2 andalso Val =< 10 ->
    #glory_open_rank_data{min = 2, max = 10, open = 14};
get_open_rank({Val, 15})
    when Val >= 1 andalso Val =< 1 ->
    #glory_open_rank_data{min = 1, max = 1, open = 15,
                          reward = [{22663, 1}], title = lang:get("爵位排名奖励"),
                          content =
                              lang:get("恭喜你在爵位排行榜中名次前10，获得开服活动-爵位排行榜的奖励，再接再厉哦！"),
                          honor_id = 11086};
get_open_rank({Val, 15})
    when Val >= 2 andalso Val =< 10 ->
    #glory_open_rank_data{min = 2, max = 10, open = 15,
                          reward = [{22663, 1}], title = lang:get("爵位排名奖励"),
                          content =
                              lang:get("恭喜你在爵位排行榜中名次前10，获得开服活动-爵位排行榜的奖励，再接再厉哦！")};
get_open_rank(_) -> false.

get_switch(1) -> 1;
get_switch(2) -> 2;
get_switch(3) -> 3;
get_switch(4) -> 4;
get_switch(5) -> 5;
get_switch(6) -> 6;
get_switch(7) -> 7;
get_switch(8) -> 8;
get_switch(9) -> 9;
get_switch(10) -> 10;
get_switch(11) -> 11;
get_switch(12) -> 12;
get_switch(13) -> 13;
get_switch(14) -> 14;
get_switch(15) -> 15;
get_switch(16) -> 16;
get_switch(17) -> 17;
get_switch(18) -> 18;
get_switch(19) -> 19;
get_switch(20) -> 20;
get_switch(21) -> 21;
get_switch(22) -> 22;
get_switch(23) -> 23;
get_switch(24) -> 24;
get_switch(25) -> 25;
get_switch(26) -> 26;
get_switch(27) -> 27;
get_switch(28) -> 28;
get_switch(29) -> 29;
get_switch(30) -> 30;
get_switch(31) -> 31;
get_switch(32) -> 32;
get_switch(33) -> 33;
get_switch(34) -> 34;
get_switch(35) -> 35;
get_switch(36) -> 36;
get_switch(37) -> 37;
get_switch(38) -> 38;
get_switch(39) -> 39;
get_switch(40) -> 40;
get_switch(41) -> 41;
get_switch(42) -> 42;
get_switch(43) -> 43;
get_switch(44) -> 44;
get_switch(45) -> 45;
get_switch(46) -> 46;
get_switch(47) -> 47;
get_switch(48) -> 48;
get_switch(49) -> 49;
get_switch(50) -> 50;
get_switch(51) -> 51;
get_switch(52) -> 52;
get_switch(53) -> 53;
get_switch(54) -> 54;
get_switch(55) -> 55;
get_switch(56) -> 56;
get_switch(57) -> 57;
get_switch(58) -> 58;
get_switch(59) -> 59;
get_switch(60) -> 60;
get_switch(_) -> 0.

buffs() -> [].

get_buff(_) -> [].

get_fcpercent(Val) when Val >= 95 -> 110;
get_fcpercent(Val) when Val >= 90 -> 120;
get_fcpercent(Val) when Val >= 85 -> 130;
get_fcpercent(Val) when Val >= 80 -> 140;
get_fcpercent(Val) when Val >= 75 -> 150;
get_fcpercent(Val) when Val >= 60 -> 160;
get_fcpercent(Val) when Val >= 50 -> 180;
get_fcpercent(Val) when Val >= 0 -> 200;
get_fcpercent(_) -> 150.

