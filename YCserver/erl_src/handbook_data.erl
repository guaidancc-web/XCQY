-file("src/data/handbook_data.erl", 1).

-module(handbook_data).

-export([get/1,
         get_set/1,
         get_attr/1,
         store_list/0,
         get_decompose/1,
         get_lev_attr/1]).

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

-file("src/data/handbook_data.erl", 20).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/data/handbook_data.erl", 21).

get(1) ->
    #handbook_base{id = 1, name = lang:get("龙猫君"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21350, 0, 1}], set_id = [],
                   allow_item = [28607, 28610],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(2) ->
    #handbook_base{id = 2, name = lang:get("波波"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21303, 0, 1}], set_id = [],
                   allow_item = [28607, 28611],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(3) ->
    #handbook_base{id = 3, name = lang:get("小浣熊"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21351, 0, 1}], set_id = [],
                   allow_item = [28607, 28612],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(4) ->
    #handbook_base{id = 4, name = lang:get("花莹"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21352, 0, 1}], set_id = [5],
                   allow_item = [28607, 28613],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(5) ->
    #handbook_base{id = 5, name = lang:get("螳螂忍者"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21313, 0, 1}], set_id = [4],
                   allow_item = [28607, 28614],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(6) ->
    #handbook_base{id = 6, name = lang:get("龙龟"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21353, 0, 1}], set_id = [6],
                   allow_item = [28607, 28615],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(7) ->
    #handbook_base{id = 7, name = lang:get("小虎船长"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21354, 0, 1}], set_id = [],
                   allow_item = [28607, 28616],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(8) ->
    #handbook_base{id = 8, name = lang:get("树人"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21355, 0, 1}], set_id = [1],
                   allow_item = [28607, 28617],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(9) ->
    #handbook_base{id = 9, name = lang:get("森林精灵"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 1, grade_type = 1,
                   active_reward = [{21305, 0, 1}], set_id = [5],
                   allow_item = [28607, 28618],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 8,
                   fc1 = 10, fc2 = 12, fuse_flag = 0};
get(10) ->
    #handbook_base{id = 10, name = lang:get("飞刃忍者"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21307, 0, 1}], set_id = [],
                   allow_item = [28607, 28619],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(11) ->
    #handbook_base{id = 11, name = lang:get("雪狐"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21356, 0, 1}], set_id = [7],
                   allow_item = [28607, 28620],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(12) ->
    #handbook_base{id = 12, name = lang:get("犀牛战士"),
                   level_limit = 50, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21357, 0, 1}], set_id = [],
                   allow_item = [28607, 28621],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(100) ->
    #handbook_base{id = 100, name = lang:get("森林巨人"),
                   level_limit = 55, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21359, 0, 1}], set_id = [5],
                   allow_item = [28607, 28640],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(101) ->
    #handbook_base{id = 101, name = lang:get("人鱼精灵"),
                   level_limit = 55, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21309, 0, 1}], set_id = [6],
                   allow_item = [28607, 28641],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(102) ->
    #handbook_base{id = 102, name = lang:get("霜狼"),
                   level_limit = 55, effect_type = 1, lev = 1,
                   grade_lev = 2, grade_type = 2,
                   active_reward = [{21358, 0, 1}], set_id = [7],
                   allow_item = [28607, 28642],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(103) ->
    #handbook_base{id = 103, name = lang:get("炎魔"),
                   level_limit = 65, effect_type = 1, lev = 1,
                   grade_lev = 3, grade_type = 2,
                   active_reward = [{21360, 0, 1}], set_id = [1],
                   allow_item = [28607, 28643],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(104) ->
    #handbook_base{id = 104, name = lang:get("功夫熊"),
                   level_limit = 65, effect_type = 1, lev = 1,
                   grade_lev = 3, grade_type = 2,
                   active_reward = [{21311, 0, 1}], set_id = [],
                   allow_item = [28607, 28644],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(105) ->
    #handbook_base{id = 105, name = lang:get("剑齿虎"),
                   level_limit = 65, effect_type = 1, lev = 1,
                   grade_lev = 3, grade_type = 2,
                   active_reward = [{21314, 0, 1}], set_id = [7],
                   allow_item = [28607, 28645],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(106) ->
    #handbook_base{id = 106, name = lang:get("石头人"),
                   level_limit = 75, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21317, 0, 1}], set_id = [],
                   allow_item = [28607, 28646],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28646,
                   times = 3, illusion_id = 21317, fuse_num1 = 2,
                   lev_num1 = 3, fuse_num2 = 3, lev_num2 = 3,
                   fuse_num3 = 4, lev_num3 = 3, universal = 1, bind = 1};
get(107) ->
    #handbook_base{id = 107, name = lang:get("雷暴"),
                   level_limit = 75, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21318, 0, 1}], set_id = [1],
                   allow_item = [28607, 28647],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28647,
                   times = 3, illusion_id = 21318, fuse_num1 = 2,
                   lev_num1 = 3, fuse_num2 = 3, lev_num2 = 3,
                   fuse_num3 = 4, lev_num3 = 3, universal = 1, bind = 1};
get(108) ->
    #handbook_base{id = 108, name = lang:get("剑灵"),
                   level_limit = 75, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21316, 0, 1}], set_id = [4],
                   allow_item = [28607, 28648],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28648,
                   times = 3, illusion_id = 21316, fuse_num1 = 2,
                   lev_num1 = 3, fuse_num2 = 3, lev_num2 = 3,
                   fuse_num3 = 4, lev_num3 = 3, universal = 1, bind = 1};
get(109) ->
    #handbook_base{id = 109, name = lang:get("血伯爵"),
                   level_limit = 80, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21319, 0, 1}], set_id = [3],
                   allow_item = [28607, 28649],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28649,
                   times = 5, illusion_id = 21319, fuse_num1 = 2,
                   lev_num1 = 4, fuse_num2 = 3, lev_num2 = 4,
                   fuse_num3 = 4, lev_num3 = 4, universal = 1, bind = 1};
get(110) ->
    #handbook_base{id = 110, name = lang:get("雷霆战神"),
                   level_limit = 80, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21320, 0, 1}], set_id = [6],
                   allow_item = [28607, 28650],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28650,
                   times = 5, illusion_id = 21320, fuse_num1 = 2,
                   lev_num1 = 4, fuse_num2 = 3, lev_num2 = 4,
                   fuse_num3 = 4, lev_num3 = 4, universal = 1, bind = 1};
get(111) ->
    #handbook_base{id = 111, name = lang:get("月光女神"),
                   level_limit = 80, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{21321, 0, 1}], set_id = [2],
                   allow_item = [28607, 28651],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28651,
                   times = 5, illusion_id = 21321, fuse_num1 = 2,
                   lev_num1 = 4, fuse_num2 = 3, lev_num2 = 4,
                   fuse_num3 = 4, lev_num3 = 4, universal = 1, bind = 1};
get(112) ->
    #handbook_base{id = 112, name = lang:get("蝴蝶花姬"),
                   level_limit = 85, effect_type = 1, lev = 1,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21361, 0, 1}], set_id = [8],
                   allow_item = [28607, 28652],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28652,
                   times = 3, illusion_id = 21361, fuse_num1 = 2,
                   lev_num1 = 5, fuse_num2 = 3, lev_num2 = 5,
                   fuse_num3 = 4, lev_num3 = 5, universal = 1, bind = 1};
get(113) ->
    #handbook_base{id = 113, name = lang:get("死亡骑士"),
                   level_limit = 85, effect_type = 1, lev = 1,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21362, 0, 1}], set_id = [3],
                   allow_item = [28607, 28653],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28653,
                   times = 3, illusion_id = 21362, fuse_num1 = 2,
                   lev_num1 = 5, fuse_num2 = 3, lev_num2 = 5,
                   fuse_num3 = 4, lev_num3 = 5, universal = 1, bind = 1};
get(114) ->
    #handbook_base{id = 114, name = lang:get("幻影剑客"),
                   level_limit = 85, effect_type = 1, lev = 1,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21363, 0, 1}], set_id = [4],
                   allow_item = [28607, 28654],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28654,
                   times = 3, illusion_id = 21363, fuse_num1 = 2,
                   lev_num1 = 5, fuse_num2 = 3, lev_num2 = 5,
                   fuse_num3 = 4, lev_num3 = 5, universal = 1, bind = 1};
get(115) ->
    #handbook_base{id = 115, name = lang:get("龙魂猎人"),
                   level_limit = 95, effect_type = 1, lev = 1,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21367, 0, 1}], set_id = [],
                   allow_item = [28607, 28655],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28655,
                   times = 3, illusion_id = 21367, fuse_num1 = 2,
                   lev_num1 = 6, fuse_num2 = 3, lev_num2 = 6,
                   fuse_num3 = 4, lev_num3 = 6, universal = 1, bind = 1};
get(116) ->
    #handbook_base{id = 116, name = lang:get("石灵儿"),
                   level_limit = 95, effect_type = 1, lev = 1,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21368, 0, 1}], set_id = [],
                   allow_item = [28607, 28656],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 1, fuse_id = 28656,
                   times = 3, illusion_id = 21368, fuse_num1 = 2,
                   lev_num1 = 6, fuse_num2 = 3, lev_num2 = 6,
                   fuse_num3 = 4, lev_num3 = 6, universal = 1, bind = 1};
get(200) ->
    #handbook_base{id = 200, name = lang:get("菲雅"),
                   level_limit = 55, effect_type = 2, lev = 2,
                   grade_lev = 4, grade_type = 2,
                   active_reward = [{21380, 0, 1}], set_id = [2],
                   allow_item = [28607, 28680],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(201) ->
    #handbook_base{id = 201, name = lang:get("蓝雯"),
                   level_limit = 55, effect_type = 2, lev = 2,
                   grade_lev = 4, grade_type = 2,
                   active_reward = [{21381, 0, 1}], set_id = [],
                   allow_item = [28607, 28681],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(202) ->
    #handbook_base{id = 202, name = lang:get("琴雅"),
                   level_limit = 55, effect_type = 2, lev = 2,
                   grade_lev = 4, grade_type = 2,
                   active_reward = [{21382, 0, 1}], set_id = [8],
                   allow_item = [28607, 28682],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(203) ->
    #handbook_base{id = 203, name = lang:get("凯恩"),
                   level_limit = 60, effect_type = 2, lev = 2,
                   grade_lev = 4, grade_type = 2,
                   active_reward = [{21383, 0, 1}], set_id = [],
                   allow_item = [28607, 28683],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(204) ->
    #handbook_base{id = 204, name = lang:get("阿瑞斯"),
                   level_limit = 60, effect_type = 2, lev = 2,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21384, 0, 1}], set_id = [3],
                   allow_item = [28607, 28684],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(205) ->
    #handbook_base{id = 205, name = lang:get("福波斯"),
                   level_limit = 60, effect_type = 2, lev = 2,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21385, 0, 1}], set_id = [],
                   allow_item = [28607, 28685],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(206) ->
    #handbook_base{id = 206, name = lang:get("露露"),
                   level_limit = 70, effect_type = 2, lev = 2,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21386, 0, 1}], set_id = [],
                   allow_item = [28607, 28686],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(207) ->
    #handbook_base{id = 207, name = lang:get("佛格瑞特"),
                   level_limit = 70, effect_type = 2, lev = 2,
                   grade_lev = 5, grade_type = 3,
                   active_reward = [{21387, 0, 1}], set_id = [1],
                   allow_item = [28607, 28687],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(208) ->
    #handbook_base{id = 208, name = lang:get("姬"),
                   level_limit = 70, effect_type = 2, lev = 2,
                   grade_lev = 6, grade_type = 3,
                   active_reward = [{21388, 0, 1}], set_id = [],
                   allow_item = [28607, 28688],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(209) ->
    #handbook_base{id = 209, name = lang:get("莉娜"),
                   level_limit = 80, effect_type = 2, lev = 2,
                   grade_lev = 6, grade_type = 3,
                   active_reward = [{21389, 0, 1}], set_id = [2],
                   allow_item = [28607, 28689],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(210) ->
    #handbook_base{id = 210, name = lang:get("无名"),
                   level_limit = 80, effect_type = 2, lev = 2,
                   grade_lev = 6, grade_type = 3,
                   active_reward = [{21390, 0, 1}], set_id = [4],
                   allow_item = [28607, 28690],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(211) ->
    #handbook_base{id = 211, name = lang:get("利贝尔二世"),
                   level_limit = 80, effect_type = 2, lev = 2,
                   grade_lev = 6, grade_type = 3,
                   active_reward = [{21391, 0, 1}], set_id = [3],
                   allow_item = [28607, 28691],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(212) ->
    #handbook_base{id = 212, name = lang:get("凯瑟琳"),
                   level_limit = 80, effect_type = 2, lev = 2,
                   grade_lev = 6, grade_type = 3,
                   active_reward = [{21392, 0, 1}], set_id = [2],
                   allow_item = [28607, 28692],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(300) ->
    #handbook_base{id = 300, name = lang:get("天使飞猪"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28693],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(301) ->
    #handbook_base{id = 301, name = lang:get("南瓜君"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28694],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(302) ->
    #handbook_base{id = 302, name = lang:get("美猴王"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28695],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(303) ->
    #handbook_base{id = 303, name = lang:get("皎月兔"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28696],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(304) ->
    #handbook_base{id = 304, name = lang:get("糖糖"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28697],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(305) ->
    #handbook_base{id = 305, name = lang:get("精灵龙"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28698],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(306) ->
    #handbook_base{id = 306, name = lang:get("南瓜精灵"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{21364, 0, 1}], set_id = [],
                   allow_item = [28608, 28699],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 7, fc2 = 9,
                   fuse_flag = 0};
get(307) ->
    #handbook_base{id = 307, name = lang:get("南瓜恶魔"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{21365, 0, 1}], set_id = [],
                   allow_item = [28608, 28700],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 7, fc2 = 9,
                   fuse_flag = 0};
get(308) ->
    #handbook_base{id = 308, name = lang:get("萌萌雪人"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{29024, 0, 3}], set_id = [],
                   allow_item = [28608, 28701],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 7, fc2 = 9,
                   fuse_flag = 0};
get(309) ->
    #handbook_base{id = 309, name = lang:get("天凤凰"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28702],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(310) ->
    #handbook_base{id = 310, name = lang:get("甜蜜小熊"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{23220, 0, 1}], set_id = [],
                   allow_item = [28608, 28703],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(311) ->
    #handbook_base{id = 311, name = lang:get("幸福小熊"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{23400, 0, 1}], set_id = [],
                   allow_item = [28608, 28704],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(312) ->
    #handbook_base{id = 312, name = lang:get("博学小猪"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{21366, 0, 1}], set_id = [],
                   allow_item = [28608, 28705],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(313) ->
    #handbook_base{id = 313, name = lang:get("神马浮云"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28706],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(314) ->
    #handbook_base{id = 314, name = lang:get("赤炎小龙"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28707],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(315) ->
    #handbook_base{id = 315, name = lang:get("冰霜小龙"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28708],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(316) ->
    #handbook_base{id = 316, name = lang:get("熊猫大侠"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28709],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(317) ->
    #handbook_base{id = 317, name = lang:get("鲸鱼公主"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28710],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(318) ->
    #handbook_base{id = 318, name = lang:get("镜仙"),
                   level_limit = 80, effect_type = 1, lev = 1,
                   grade_lev = 4, grade_type = 3,
                   active_reward = [{20000, 0, 1}], set_id = [],
                   allow_item = [28607, 28711],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 12,
                   fc1 = 14, fc2 = 16, fuse_flag = 0};
get(319) ->
    #handbook_base{id = 319, name = lang:get("天启·黎明"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28712],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(320) ->
    #handbook_base{id = 320, name = lang:get("天启·暗夜"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28713],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(321) ->
    #handbook_base{id = 321, name = lang:get("星辰龙王"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28714],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(322) ->
    #handbook_base{id = 322, name = lang:get("惩戒狮皇"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28715],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(323) ->
    #handbook_base{id = 323, name = lang:get("天启霸主"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28716],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(324) ->
    #handbook_base{id = 324, name = lang:get("金钱狐"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28717],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(325) ->
    #handbook_base{id = 325, name = lang:get("五彩之主"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28718],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(326) ->
    #handbook_base{id = 326, name = lang:get("红灯笼"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28719],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(327) ->
    #handbook_base{id = 327, name = lang:get("爱丽丝"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28720],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(328) ->
    #handbook_base{id = 328, name = lang:get("黄灯笼"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28721],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(329) ->
    #handbook_base{id = 329, name = lang:get("绿灯笼"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28722],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(330) ->
    #handbook_base{id = 330, name = lang:get("蓝灯笼"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28723],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(331) ->
    #handbook_base{id = 331, name = lang:get("爆烈少女"),
                   level_limit = 50, effect_type = 1, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28724],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   star_loss = [{0, 5}, {1, 3}], max_active_step = 4,
                   max_star_step = 2, transform_point = 30, fc = 10,
                   fc1 = 12, fc2 = 14, fuse_flag = 0};
get(332) ->
    #handbook_base{id = 332, name = lang:get("乖巧的孩子"),
                   level_limit = 50, effect_type = 4, lev = 2,
                   grade_lev = 7, grade_type = 3,
                   active_reward = [{20002, 0, 1}], set_id = [],
                   allow_item = [28608, 28725],
                   active_loss = [{0, 1}, {1, 1}, {2, 1}, {3, 1}],
                   max_active_step = 4, max_star_step = 0,
                   transform_point = 30, fc = 5, fc1 = 0, fc2 = 0,
                   fuse_flag = 0};
get(_) -> false.

get_attr({1, 0}) ->
    #{ratio => 100, buff => 10005, varition_buff => 50005,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 37}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物生命+37"),
      star1_desc => lang:get("所有宠物生命+25"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({1, 1}) ->
    #{ratio => 200, buff => 10005, varition_buff => 50005,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 37}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 25}],
      active_desc => lang:get("所有宠物生命+37"),
      star1_desc => lang:get("所有宠物生命+25"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({1, 2}) ->
    #{ratio => 200, buff => 10005, varition_buff => 50005,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 37}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10000, 1, 4}],
      star_attr => [{1, 25}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物生命+37"),
      star1_desc => lang:get("所有宠物生命+25"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({2, 0}) ->
    #{ratio => 100, buff => 10000, varition_buff => 50000,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 15}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物攻+15"),
      star1_desc => lang:get("所有宠物物攻+10"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({2, 1}) ->
    #{ratio => 200, buff => 10000, varition_buff => 50000,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 15}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{4, 10}],
      active_desc => lang:get("所有宠物物攻+15"),
      star1_desc => lang:get("所有宠物物攻+10"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({2, 2}) ->
    #{ratio => 200, buff => 10000, varition_buff => 50000,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 15}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10001, 1, 4}],
      star_attr => [{4, 10}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物攻+15"),
      star1_desc => lang:get("所有宠物物攻+10"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({3, 0}) ->
    #{ratio => 100, buff => 10006, varition_buff => 50006,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 16}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物防+16"),
      star1_desc => lang:get("所有宠物物防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({3, 1}) ->
    #{ratio => 200, buff => 10006, varition_buff => 50006,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 16}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{6, 11}],
      active_desc => lang:get("所有宠物物防+16"),
      star1_desc => lang:get("所有宠物物防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({3, 2}) ->
    #{ratio => 200, buff => 10006, varition_buff => 50006,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 16}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10002, 1, 4}],
      star_attr => [{6, 11}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物防+16"),
      star1_desc => lang:get("所有宠物物防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({4, 0}) ->
    #{ratio => 100, buff => 10007, varition_buff => 50007,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 13}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+13"),
      star1_desc => lang:get("所有宠物魔攻+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({4, 1}) ->
    #{ratio => 200, buff => 10007, varition_buff => 50007,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 13}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 9}],
      active_desc => lang:get("所有宠物魔攻+13"),
      star1_desc => lang:get("所有宠物魔攻+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({4, 2}) ->
    #{ratio => 200, buff => 10007, varition_buff => 50007,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 13}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10003, 1, 4}],
      star_attr => [{5, 9}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+13"),
      star1_desc => lang:get("所有宠物魔攻+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({5, 0}) ->
    #{ratio => 100, buff => 10001, varition_buff => 50001,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 13}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔防+13"),
      star1_desc => lang:get("所有宠物魔防+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({5, 1}) ->
    #{ratio => 200, buff => 10001, varition_buff => 50001,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 13}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{7, 9}],
      active_desc => lang:get("所有宠物魔防+13"),
      star1_desc => lang:get("所有宠物魔防+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({5, 2}) ->
    #{ratio => 200, buff => 10001, varition_buff => 50001,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 13}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10004, 1, 4}],
      star_attr => [{7, 9}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔防+13"),
      star1_desc => lang:get("所有宠物魔防+9"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({6, 0}) ->
    #{ratio => 100, buff => 10020, varition_buff => 50020,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 8}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物攻速+8"),
      star1_desc => lang:get("所有宠物攻速+5"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({6, 1}) ->
    #{ratio => 200, buff => 10020, varition_buff => 50020,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 8}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{3, 5}],
      active_desc => lang:get("所有宠物攻速+8"),
      star1_desc => lang:get("所有宠物攻速+5"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({6, 2}) ->
    #{ratio => 200, buff => 10020, varition_buff => 50020,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 8}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10005, 1, 4}],
      star_attr => [{3, 5}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物攻速+8"),
      star1_desc => lang:get("所有宠物攻速+5"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({7, 0}) ->
    #{ratio => 100, buff => 10010, varition_buff => 50010,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 23}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物攻+23"),
      star1_desc => lang:get("所有宠物物攻+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({7, 1}) ->
    #{ratio => 200, buff => 10010, varition_buff => 50010,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 23}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{4, 16}],
      active_desc => lang:get("所有宠物物攻+23"),
      star1_desc => lang:get("所有宠物物攻+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({7, 2}) ->
    #{ratio => 200, buff => 10010, varition_buff => 50010,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 23}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10006, 1, 4}],
      star_attr => [{4, 16}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物攻+23"),
      star1_desc => lang:get("所有宠物物攻+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({8, 0}) ->
    #{ratio => 100, buff => 10011, varition_buff => 50011,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 55}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物生命+55"),
      star1_desc => lang:get("所有宠物生命+38"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({8, 1}) ->
    #{ratio => 200, buff => 10011, varition_buff => 50011,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 55}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 38}],
      active_desc => lang:get("所有宠物生命+55"),
      star1_desc => lang:get("所有宠物生命+38"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({8, 2}) ->
    #{ratio => 200, buff => 10011, varition_buff => 50011,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 55}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10007, 1, 4}],
      star_attr => [{1, 38}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物生命+55"),
      star1_desc => lang:get("所有宠物生命+38"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({9, 0}) ->
    #{ratio => 100, buff => 10021, varition_buff => 50021,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({9, 1}) ->
    #{ratio => 200, buff => 10021, varition_buff => 50021,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{7, 11}],
      active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({9, 2}) ->
    #{ratio => 200, buff => 10021, varition_buff => 50021,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10008, 1, 4}],
      star_attr => [{7, 11}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({10, 0}) ->
    #{ratio => 100, buff => 10002, varition_buff => 50002,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({10, 1}) ->
    #{ratio => 200, buff => 10002, varition_buff => 50002,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{3, 7}],
      active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({10, 2}) ->
    #{ratio => 200, buff => 10002, varition_buff => 50002,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10009, 1, 4}],
      star_attr => [{3, 7}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({11, 0}) ->
    #{ratio => 100, buff => 10012, varition_buff => 50012,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 20}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+20"),
      star1_desc => lang:get("所有宠物魔攻+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({11, 1}) ->
    #{ratio => 200, buff => 10012, varition_buff => 50012,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 20}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 14}],
      active_desc => lang:get("所有宠物魔攻+20"),
      star1_desc => lang:get("所有宠物魔攻+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({11, 2}) ->
    #{ratio => 200, buff => 10012, varition_buff => 50012,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 20}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10010, 1, 4}],
      star_attr => [{5, 14}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+20"),
      star1_desc => lang:get("所有宠物魔攻+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({12, 0}) ->
    #{ratio => 100, buff => 10022, varition_buff => 50022,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({12, 1}) ->
    #{ratio => 200, buff => 10022, varition_buff => 50022,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{6, 14}],
      active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({12, 2}) ->
    #{ratio => 200, buff => 10022, varition_buff => 50022,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10011, 1, 4}],
      star_attr => [{6, 14}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({100, 0}) ->
    #{ratio => 100, buff => 10003, varition_buff => 50003,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 74}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物生命+74"),
      star1_desc => lang:get("所有宠物生命+51"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({100, 1}) ->
    #{ratio => 200, buff => 10003, varition_buff => 50003,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 74}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 51}],
      active_desc => lang:get("所有宠物生命+74"),
      star1_desc => lang:get("所有宠物生命+51"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({100, 2}) ->
    #{ratio => 200, buff => 10003, varition_buff => 50003,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{1, 74}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10012, 1, 4}],
      star_attr => [{1, 51}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物生命+74"),
      star1_desc => lang:get("所有宠物生命+51"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({101, 0}) ->
    #{ratio => 100, buff => 10013, varition_buff => 50013,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({101, 1}) ->
    #{ratio => 200, buff => 10013, varition_buff => 50013,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{7, 11}],
      active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({101, 2}) ->
    #{ratio => 200, buff => 10013, varition_buff => 50013,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{7, 16}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10013, 1, 4}],
      star_attr => [{7, 11}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔防+16"),
      star1_desc => lang:get("所有宠物魔防+11"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({102, 0}) ->
    #{ratio => 100, buff => 10023, varition_buff => 50023,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({102, 1}) ->
    #{ratio => 200, buff => 10023, varition_buff => 50023,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{3, 7}],
      active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({102, 2}) ->
    #{ratio => 200, buff => 10023, varition_buff => 50023,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{3, 10}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10014, 1, 4}],
      star_attr => [{3, 7}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物攻速+10"),
      star1_desc => lang:get("所有宠物攻速+7"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({103, 0}) ->
    #{ratio => 100, buff => 10004, varition_buff => 50004,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 27}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+27"),
      star1_desc => lang:get("所有宠物魔攻+18"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({103, 1}) ->
    #{ratio => 200, buff => 10004, varition_buff => 50004,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 27}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 18}],
      active_desc => lang:get("所有宠物魔攻+27"),
      star1_desc => lang:get("所有宠物魔攻+18"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({103, 2}) ->
    #{ratio => 200, buff => 10004, varition_buff => 50004,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 27}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10015, 1, 4}],
      star_attr => [{5, 18}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+27"),
      star1_desc => lang:get("所有宠物魔攻+18"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({104, 0}) ->
    #{ratio => 100, buff => 10014, varition_buff => 50014,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({104, 1}) ->
    #{ratio => 200, buff => 10014, varition_buff => 50014,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{6, 14}],
      active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({104, 2}) ->
    #{ratio => 200, buff => 10014, varition_buff => 50014,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{6, 20}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10016, 1, 4}],
      star_attr => [{6, 14}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物防+20"),
      star1_desc => lang:get("所有宠物物防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({105, 0}) ->
    #{ratio => 100, buff => 10024, varition_buff => 50024,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 30}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物攻+30"),
      star1_desc => lang:get("所有宠物物攻+21"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({105, 1}) ->
    #{ratio => 200, buff => 10024, varition_buff => 50024,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 30}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{4, 21}],
      active_desc => lang:get("所有宠物物攻+30"),
      star1_desc => lang:get("所有宠物物攻+21"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({105, 2}) ->
    #{ratio => 200, buff => 10024, varition_buff => 50024,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{4, 30}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10017, 1, 4}],
      star_attr => [{4, 21}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物攻+30"),
      star1_desc => lang:get("所有宠物物攻+21"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({106, 0}) ->
    #{ratio => 100, buff => 10026, varition_buff => 50026,
      senior_buff => 10056, sen_vari_buff => 50037,
      active_effect_type => 1, active_attr => [{1, 92}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物生命+92"),
      star1_desc => lang:get("所有宠物生命+64"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({106, 1}) ->
    #{ratio => 200, buff => 10026, varition_buff => 50026,
      senior_buff => 10056, sen_vari_buff => 50037,
      active_effect_type => 1, active_attr => [{1, 92}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 64}],
      active_desc => lang:get("所有宠物生命+92"),
      star1_desc => lang:get("所有宠物生命+64"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({106, 2}) ->
    #{ratio => 200, buff => 10026, varition_buff => 50026,
      senior_buff => 10056, sen_vari_buff => 50037,
      active_effect_type => 1, active_attr => [{1, 92}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10019, 1, 4}],
      star_attr => [{1, 64}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物生命+92"),
      star1_desc => lang:get("所有宠物生命+64"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({107, 0}) ->
    #{ratio => 100, buff => 10027, varition_buff => 50027,
      senior_buff => 10057, sen_vari_buff => 50038,
      active_effect_type => 1, active_attr => [{7, 20}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔防+20"),
      star1_desc => lang:get("所有宠物魔防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({107, 1}) ->
    #{ratio => 200, buff => 10027, varition_buff => 50027,
      senior_buff => 10057, sen_vari_buff => 50038,
      active_effect_type => 1, active_attr => [{7, 20}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{7, 14}],
      active_desc => lang:get("所有宠物魔防+20"),
      star1_desc => lang:get("所有宠物魔防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({107, 2}) ->
    #{ratio => 200, buff => 10027, varition_buff => 50027,
      senior_buff => 10057, sen_vari_buff => 50038,
      active_effect_type => 1, active_attr => [{7, 20}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10021, 1, 4}],
      star_attr => [{7, 14}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔防+20"),
      star1_desc => lang:get("所有宠物魔防+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({108, 0}) ->
    #{ratio => 100, buff => 10025, varition_buff => 50025,
      senior_buff => 10055, sen_vari_buff => 50036,
      active_effect_type => 1, active_attr => [{3, 12}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物攻速+12"),
      star1_desc => lang:get("所有宠物攻速+8"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({108, 1}) ->
    #{ratio => 200, buff => 10025, varition_buff => 50025,
      senior_buff => 10055, sen_vari_buff => 50036,
      active_effect_type => 1, active_attr => [{3, 12}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{3, 8}],
      active_desc => lang:get("所有宠物攻速+12"),
      star1_desc => lang:get("所有宠物攻速+8"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({108, 2}) ->
    #{ratio => 200, buff => 10025, varition_buff => 50025,
      senior_buff => 10055, sen_vari_buff => 50036,
      active_effect_type => 1, active_attr => [{3, 12}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10022, 1, 4}],
      star_attr => [{3, 8}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物攻速+12"),
      star1_desc => lang:get("所有宠物攻速+8"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({109, 0}) ->
    #{ratio => 100, buff => 10028, varition_buff => 50028,
      senior_buff => 10058, sen_vari_buff => 50039,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({109, 1}) ->
    #{ratio => 200, buff => 10028, varition_buff => 50028,
      senior_buff => 10058, sen_vari_buff => 50039,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 23}],
      active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({109, 2}) ->
    #{ratio => 200, buff => 10028, varition_buff => 50028,
      senior_buff => 10058, sen_vari_buff => 50039,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10023, 1, 4}],
      star_attr => [{5, 23}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({110, 0}) ->
    #{ratio => 100, buff => 10029, varition_buff => 50029,
      senior_buff => 10059, sen_vari_buff => 50040,
      active_effect_type => 1, active_attr => [{4, 38}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物攻+38"),
      star1_desc => lang:get("所有宠物物攻+26"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({110, 1}) ->
    #{ratio => 200, buff => 10029, varition_buff => 50029,
      senior_buff => 10059, sen_vari_buff => 50040,
      active_effect_type => 1, active_attr => [{4, 38}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{4, 26}],
      active_desc => lang:get("所有宠物物攻+38"),
      star1_desc => lang:get("所有宠物物攻+26"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({110, 2}) ->
    #{ratio => 200, buff => 10029, varition_buff => 50029,
      senior_buff => 10059, sen_vari_buff => 50040,
      active_effect_type => 1, active_attr => [{4, 38}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10024, 1, 4}],
      star_attr => [{4, 26}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物攻+38"),
      star1_desc => lang:get("所有宠物物攻+26"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({111, 0}) ->
    #{ratio => 100, buff => 10030, varition_buff => 50030,
      senior_buff => 10060, sen_vari_buff => 50041,
      active_effect_type => 1, active_attr => [{6, 24}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物防+24"),
      star1_desc => lang:get("所有宠物物防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({111, 1}) ->
    #{ratio => 200, buff => 10030, varition_buff => 50030,
      senior_buff => 10060, sen_vari_buff => 50041,
      active_effect_type => 1, active_attr => [{6, 24}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{6, 16}],
      active_desc => lang:get("所有宠物物防+24"),
      star1_desc => lang:get("所有宠物物防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({111, 2}) ->
    #{ratio => 200, buff => 10030, varition_buff => 50030,
      senior_buff => 10060, sen_vari_buff => 50041,
      active_effect_type => 1, active_attr => [{6, 24}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10025, 1, 4}],
      star_attr => [{6, 16}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物防+24"),
      star1_desc => lang:get("所有宠物物防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({112, 0}) ->
    #{ratio => 100, buff => 10031, varition_buff => 50031,
      senior_buff => 10061, sen_vari_buff => 50042,
      active_effect_type => 1, active_attr => [{5, 40}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+40"),
      star1_desc => lang:get("所有宠物魔攻+28"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({112, 1}) ->
    #{ratio => 200, buff => 10031, varition_buff => 50031,
      senior_buff => 10061, sen_vari_buff => 50042,
      active_effect_type => 1, active_attr => [{5, 40}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 28}],
      active_desc => lang:get("所有宠物魔攻+40"),
      star1_desc => lang:get("所有宠物魔攻+28"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({112, 2}) ->
    #{ratio => 200, buff => 10031, varition_buff => 50031,
      senior_buff => 10061, sen_vari_buff => 50042,
      active_effect_type => 1, active_attr => [{5, 40}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10026, 1, 4}],
      star_attr => [{5, 28}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+40"),
      star1_desc => lang:get("所有宠物魔攻+28"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({113, 0}) ->
    #{ratio => 100, buff => 10032, varition_buff => 50032,
      senior_buff => 10062, sen_vari_buff => 50043,
      active_effect_type => 1, active_attr => [{4, 45}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物物攻+45"),
      star1_desc => lang:get("所有宠物物攻+31"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({113, 1}) ->
    #{ratio => 200, buff => 10032, varition_buff => 50032,
      senior_buff => 10062, sen_vari_buff => 50043,
      active_effect_type => 1, active_attr => [{4, 45}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{4, 31}],
      active_desc => lang:get("所有宠物物攻+45"),
      star1_desc => lang:get("所有宠物物攻+31"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({113, 2}) ->
    #{ratio => 200, buff => 10032, varition_buff => 50032,
      senior_buff => 10062, sen_vari_buff => 50043,
      active_effect_type => 1, active_attr => [{4, 45}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10027, 1, 4}],
      star_attr => [{4, 31}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物物攻+45"),
      star1_desc => lang:get("所有宠物物攻+31"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({114, 0}) ->
    #{ratio => 100, buff => 10033, varition_buff => 50033,
      senior_buff => 10063, sen_vari_buff => 50044,
      active_effect_type => 1, active_attr => [{1, 110}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物生命+110"),
      star1_desc => lang:get("所有宠物生命+77"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({114, 1}) ->
    #{ratio => 200, buff => 10033, varition_buff => 50033,
      senior_buff => 10063, sen_vari_buff => 50044,
      active_effect_type => 1, active_attr => [{1, 110}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 77}],
      active_desc => lang:get("所有宠物生命+110"),
      star1_desc => lang:get("所有宠物生命+77"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({114, 2}) ->
    #{ratio => 200, buff => 10033, varition_buff => 50033,
      senior_buff => 10063, sen_vari_buff => 50044,
      active_effect_type => 1, active_attr => [{1, 110}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10028, 1, 4}],
      star_attr => [{1, 77}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物生命+110"),
      star1_desc => lang:get("所有宠物生命+77"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({115, 0}) ->
    #{ratio => 100, buff => 10034, varition_buff => 50034,
      senior_buff => 10064, sen_vari_buff => 50045,
      active_effect_type => 1, active_attr => [{3, 20}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物攻速+20"),
      star1_desc => lang:get("所有宠物攻速+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({115, 1}) ->
    #{ratio => 200, buff => 10034, varition_buff => 50034,
      senior_buff => 10064, sen_vari_buff => 50045,
      active_effect_type => 1, active_attr => [{3, 20}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{3, 14}],
      active_desc => lang:get("所有宠物攻速+20"),
      star1_desc => lang:get("所有宠物攻速+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({115, 2}) ->
    #{ratio => 200, buff => 10034, varition_buff => 50034,
      senior_buff => 10064, sen_vari_buff => 50045,
      active_effect_type => 1, active_attr => [{3, 20}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10029, 1, 4}],
      star_attr => [{3, 14}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物攻速+20"),
      star1_desc => lang:get("所有宠物攻速+14"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({116, 0}) ->
    #{ratio => 100, buff => 10035, varition_buff => 50035,
      senior_buff => 10065, sen_vari_buff => 50046,
      active_effect_type => 1, active_attr => [{7, 24}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔防+24"),
      star1_desc => lang:get("所有宠物魔防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({116, 1}) ->
    #{ratio => 200, buff => 10035, varition_buff => 50035,
      senior_buff => 10065, sen_vari_buff => 50046,
      active_effect_type => 1, active_attr => [{7, 24}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{7, 16}],
      active_desc => lang:get("所有宠物魔防+24"),
      star1_desc => lang:get("所有宠物魔防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({116, 2}) ->
    #{ratio => 200, buff => 10035, varition_buff => 50035,
      senior_buff => 10065, sen_vari_buff => 50046,
      active_effect_type => 1, active_attr => [{7, 24}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10030, 1, 4}],
      star_attr => [{7, 16}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔防+24"),
      star1_desc => lang:get("所有宠物魔防+16"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({200, 0}) ->
    #{ratio => 0, buff => 51000, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化菲雅时物攻+2%"), add_point => 0};
get_attr({200, 1}) ->
    #{ratio => 0, buff => 51100, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 59}],
      active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化菲雅时物攻+2%"), add_point => 0};
get_attr({200, 2}) ->
    #{ratio => 0, buff => 51200, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 59}],
      active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化菲雅时物攻+2%"), add_point => 0};
get_attr({201, 0}) ->
    #{ratio => 0, buff => 51001, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化蓝雯时魔攻+2%"), add_point => 0};
get_attr({201, 1}) ->
    #{ratio => 0, buff => 51101, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 52}],
      active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化蓝雯时魔攻+2%"), add_point => 0};
get_attr({201, 2}) ->
    #{ratio => 0, buff => 51201, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 52}],
      active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化蓝雯时魔攻+2%"), add_point => 0};
get_attr({202, 0}) ->
    #{ratio => 0, buff => 51002, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化琴雅时生命+2%"), add_point => 0};
get_attr({202, 1}) ->
    #{ratio => 0, buff => 51102, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 27}],
      active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化琴雅时生命+2%"), add_point => 0};
get_attr({202, 2}) ->
    #{ratio => 0, buff => 51202, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 27}],
      active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化琴雅时生命+2%"), add_point => 0};
get_attr({203, 0}) ->
    #{ratio => 0, buff => 51003, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化凯恩时攻速+2%"), add_point => 0};
get_attr({203, 1}) ->
    #{ratio => 0, buff => 51103, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 34}],
      active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化凯恩时攻速+2%"), add_point => 0};
get_attr({203, 2}) ->
    #{ratio => 0, buff => 51203, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 34}],
      active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化凯恩时攻速+2%"), add_point => 0};
get_attr({204, 0}) ->
    #{ratio => 0, buff => 51004, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化阿瑞斯时物攻+2%"), add_point => 0};
get_attr({204, 1}) ->
    #{ratio => 0, buff => 51104, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 59}],
      active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化阿瑞斯时物攻+2%"), add_point => 0};
get_attr({204, 2}) ->
    #{ratio => 0, buff => 51204, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 85}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 59}],
      active_desc => lang:get("所有守护物攻+85"),
      star1_desc => lang:get("所有守护物攻+59"),
      star2_desc => lang:get("幻化阿瑞斯时物攻+2%"), add_point => 0};
get_attr({205, 0}) ->
    #{ratio => 0, buff => 51005, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化福波斯时魔攻+2%"), add_point => 0};
get_attr({205, 1}) ->
    #{ratio => 0, buff => 51105, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 52}],
      active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化福波斯时魔攻+2%"), add_point => 0};
get_attr({205, 2}) ->
    #{ratio => 0, buff => 51205, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 75}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 52}],
      active_desc => lang:get("所有守护魔攻+75"),
      star1_desc => lang:get("所有守护魔攻+52"),
      star2_desc => lang:get("幻化福波斯时魔攻+2%"), add_point => 0};
get_attr({206, 0}) ->
    #{ratio => 0, buff => 51006, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化露露时生命+2%"), add_point => 0};
get_attr({206, 1}) ->
    #{ratio => 0, buff => 51106, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 27}],
      active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化露露时生命+2%"), add_point => 0};
get_attr({206, 2}) ->
    #{ratio => 0, buff => 51206, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 39}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 27}],
      active_desc => lang:get("所有守护魔防+39"),
      star1_desc => lang:get("所有守护魔防+27"),
      star2_desc => lang:get("幻化露露时生命+2%"), add_point => 0};
get_attr({207, 0}) ->
    #{ratio => 0, buff => 51007, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化佛格瑞特时攻速+2%"), add_point => 0};
get_attr({207, 1}) ->
    #{ratio => 0, buff => 51107, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 34}],
      active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化佛格瑞特时攻速+2%"), add_point => 0};
get_attr({207, 2}) ->
    #{ratio => 0, buff => 51207, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 49}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 34}],
      active_desc => lang:get("所有守护物防+49"),
      star1_desc => lang:get("所有守护物防+34"),
      star2_desc => lang:get("幻化佛格瑞特时攻速+2%"), add_point => 0};
get_attr({208, 0}) ->
    #{ratio => 0, buff => 51008, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 52}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔防+52"),
      star1_desc => lang:get("所有守护魔防+36"),
      star2_desc => lang:get("幻化姬时生命+3%"), add_point => 0};
get_attr({208, 1}) ->
    #{ratio => 0, buff => 51108, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 52}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 36}],
      active_desc => lang:get("所有守护魔防+52"),
      star1_desc => lang:get("所有守护魔防+36"),
      star2_desc => lang:get("幻化姬时生命+3%"), add_point => 0};
get_attr({208, 2}) ->
    #{ratio => 0, buff => 51208, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{7, 52}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{7, 36}],
      active_desc => lang:get("所有守护魔防+52"),
      star1_desc => lang:get("所有守护魔防+36"),
      star2_desc => lang:get("幻化姬时生命+3%"), add_point => 0};
get_attr({209, 0}) ->
    #{ratio => 0, buff => 51009, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 101}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护魔攻+101"),
      star1_desc => lang:get("所有守护魔攻+70"),
      star2_desc => lang:get("幻化莉娜时魔攻+3%"), add_point => 0};
get_attr({209, 1}) ->
    #{ratio => 0, buff => 51109, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 101}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 70}],
      active_desc => lang:get("所有守护魔攻+101"),
      star1_desc => lang:get("所有守护魔攻+70"),
      star2_desc => lang:get("幻化莉娜时魔攻+3%"), add_point => 0};
get_attr({209, 2}) ->
    #{ratio => 0, buff => 51209, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{5, 101}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{5, 70}],
      active_desc => lang:get("所有守护魔攻+101"),
      star1_desc => lang:get("所有守护魔攻+70"),
      star2_desc => lang:get("幻化莉娜时魔攻+3%"), add_point => 0};
get_attr({210, 0}) ->
    #{ratio => 0, buff => 51010, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 114}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物攻+114"),
      star1_desc => lang:get("所有守护物攻+79"),
      star2_desc => lang:get("幻化无名时物攻+3%"), add_point => 0};
get_attr({210, 1}) ->
    #{ratio => 0, buff => 51110, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 114}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 79}],
      active_desc => lang:get("所有守护物攻+114"),
      star1_desc => lang:get("所有守护物攻+79"),
      star2_desc => lang:get("幻化无名时物攻+3%"), add_point => 0};
get_attr({210, 2}) ->
    #{ratio => 0, buff => 51210, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{4, 114}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{4, 79}],
      active_desc => lang:get("所有守护物攻+114"),
      star1_desc => lang:get("所有守护物攻+79"),
      star2_desc => lang:get("幻化无名时物攻+3%"), add_point => 0};
get_attr({211, 0}) ->
    #{ratio => 0, buff => 51011, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{1, 827}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护生命+827"),
      star1_desc => lang:get("所有守护生命+578"),
      star2_desc => lang:get("幻化利贝尔时攻速+3%"), add_point => 0};
get_attr({211, 1}) ->
    #{ratio => 0, buff => 51111, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{1, 827}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{1, 578}],
      active_desc => lang:get("所有守护生命+827"),
      star1_desc => lang:get("所有守护生命+578"),
      star2_desc => lang:get("幻化利贝尔时攻速+3%"), add_point => 0};
get_attr({211, 2}) ->
    #{ratio => 0, buff => 51211, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{1, 827}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{1, 578}],
      active_desc => lang:get("所有守护生命+827"),
      star1_desc => lang:get("所有守护生命+578"),
      star2_desc => lang:get("幻化利贝尔时攻速+3%"), add_point => 0};
get_attr({212, 0}) ->
    #{ratio => 0, buff => 51012, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 65}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有守护物防+65"),
      star1_desc => lang:get("所有守护物防+45"),
      star2_desc => lang:get("幻化凯瑟琳时物攻+3%"), add_point => 0};
get_attr({212, 1}) ->
    #{ratio => 0, buff => 51112, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 65}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 45}],
      active_desc => lang:get("所有守护物防+65"),
      star1_desc => lang:get("所有守护物防+45"),
      star2_desc => lang:get("幻化凯瑟琳时物攻+3%"), add_point => 0};
get_attr({212, 2}) ->
    #{ratio => 0, buff => 51212, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 2, active_attr => [{6, 65}],
      star_effect_type => 2, star_effect_list => [0],
      star_attr => [{6, 45}],
      active_desc => lang:get("所有守护物防+65"),
      star1_desc => lang:get("所有守护物防+45"),
      star2_desc => lang:get("幻化凯瑟琳时物攻+3%"), add_point => 0};
get_attr({300, 0}) ->
    #{ratio => 0, buff => 10048, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({300, 1}) ->
    #{ratio => 0, buff => 10048, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({300, 2}) ->
    #{ratio => 0, buff => 10048, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 60}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({301, 0}) ->
    #{ratio => 0, buff => 10049, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({301, 1}) ->
    #{ratio => 0, buff => 10049, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({301, 2}) ->
    #{ratio => 0, buff => 10049, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 60}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({302, 0}) ->
    #{ratio => 0, buff => 10047, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({302, 1}) ->
    #{ratio => 0, buff => 10047, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({302, 2}) ->
    #{ratio => 0, buff => 10047, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 60}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+60"), add_point => 2};
get_attr({303, 0}) ->
    #{ratio => 0, buff => 10052, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({303, 1}) ->
    #{ratio => 0, buff => 10052, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({303, 2}) ->
    #{ratio => 0, buff => 10052, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {5, 53}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({304, 0}) ->
    #{ratio => 0, buff => 10051, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({304, 1}) ->
    #{ratio => 0, buff => 10051, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({304, 2}) ->
    #{ratio => 0, buff => 10051, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {5, 53}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({305, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({305, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({305, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {5, 53}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物魔攻+53"), add_point => 2};
get_attr({306, 0}) ->
    #{ratio => 0, buff => 51013, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({306, 1}) ->
    #{ratio => 0, buff => 51013, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({306, 2}) ->
    #{ratio => 0, buff => 51013, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({307, 0}) ->
    #{ratio => 0, buff => 51014, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({307, 1}) ->
    #{ratio => 0, buff => 51014, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({307, 2}) ->
    #{ratio => 0, buff => 51014, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({308, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => "", star2_desc => "", add_point => 2};
get_attr({308, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => "", star2_desc => "", add_point => 2};
get_attr({308, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => "", star2_desc => "", add_point => 2};
get_attr({309, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({309, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({309, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({310, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({311, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({312, 0}) ->
    #{ratio => 0, buff => 51015, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({312, 1}) ->
    #{ratio => 0, buff => 51015, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({312, 2}) ->
    #{ratio => 0, buff => 51015, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({313, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({313, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({313, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({314, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({314, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({314, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({315, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({315, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({315, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({316, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({316, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({316, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({317, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({317, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({317, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({318, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({318, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{5, 23}],
      active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({318, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 1, active_attr => [{5, 34}],
      star_effect_type => 1,
      star_effect_list => [{0, 1, 1}, {10037, 1, 4}],
      star_attr => [{5, 23}, {51, 30}, {55, 30}, {54, 30}],
      active_desc => lang:get("所有宠物魔攻+34"),
      star1_desc => lang:get("所有宠物魔攻+23"),
      star2_desc => lang:get("该宠生命、物攻、魔攻+3%"),
      add_point => 0};
get_attr({319, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({319, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({319, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({320, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({320, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({320, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({321, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({321, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({321, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({322, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({322, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({322, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({323, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({323, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({323, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({324, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({324, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({324, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({325, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({325, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({325, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({326, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({326, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({326, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({327, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({327, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({327, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({328, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({328, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({328, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({329, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({329, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({329, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({330, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({330, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({330, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({331, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({331, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({331, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 1, star_effect_list => [0],
      star_attr => [{1, 150}, {4, 67}],
      active_desc => lang:get("角色属性点+2"),
      star1_desc => lang:get("宠物生命+150"),
      star2_desc => lang:get("宠物物攻+67"), add_point => 2};
get_attr({332, 0}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({332, 1}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr({332, 2}) ->
    #{ratio => 0, buff => 0, varition_buff => 0,
      senior_buff => 0, sen_vari_buff => 0,
      active_effect_type => 3, active_attr => [],
      star_effect_type => 3, star_effect_list => [],
      star_attr => [], active_desc => lang:get("角色属性点+1"),
      star1_desc => "", star2_desc => "", add_point => 1};
get_attr(_) -> false.

get_set(1) ->
    #{name => lang:get("风林火山"), max_num => 4,
      book_list => [107, 8, 103, 207],
      attr => [{1, 70}, {5, 67}], fc => 20,
      star_attr => [{1, 28}, {5, 27}], star_fc => 30,
      level_limit => 70};
get_set(2) ->
    #{name => lang:get("巾帼英豪"), max_num => 4,
      book_list => [200, 209, 212, 111],
      attr => [{1, 70}, {4, 83}], fc => 20,
      star_attr => [{1, 28}, {4, 33}], star_fc => 30,
      level_limit => 70};
get_set(3) ->
    #{name => lang:get("贵族议会"), max_num => 4,
      book_list => [211, 204, 109, 113],
      attr => [{1, 70}, {5, 100}], fc => 20,
      star_attr => [{1, 28}, {5, 40}], star_fc => 30,
      level_limit => 85};
get_set(4) ->
    #{name => lang:get("剑道不孤"), max_num => 4,
      book_list => [5, 108, 114, 210],
      attr => [{1, 70}, {4, 125}], fc => 20,
      star_attr => [{1, 28}, {4, 50}], star_fc => 30,
      level_limit => 85};
get_set(5) ->
    #{name => lang:get("森林之心"), max_num => 3,
      book_list => [4, 9, 100], attr => [{1, 105}, {6, 54}],
      fc => 20, star_attr => [{1, 42}, {6, 21}],
      star_fc => 30, level_limit => 60};
get_set(6) ->
    #{name => lang:get("深海三杰"), max_num => 3,
      book_list => [6, 101, 110], attr => [{1, 105}, {7, 44}],
      fc => 20, star_attr => [{1, 42}, {7, 17}],
      star_fc => 30, level_limit => 80};
get_set(7) ->
    #{name => lang:get("奔跑吧兄弟"), max_num => 3,
      book_list => [11, 102, 105],
      attr => [{1, 105}, {3, 16}], fc => 20,
      star_attr => [{1, 42}, {3, 6}], star_fc => 30,
      level_limit => 60};
get_set(8) ->
    #{name => lang:get("歌舞青春"), max_num => 2,
      book_list => [202, 112],
      attr => [{1, 105}, {6, 54}, {7, 44}], fc => 20,
      star_attr => [{1, 42}, {6, 21}, {7, 17}], star_fc => 30,
      level_limit => 80};
get_set(_) -> false.

store_list() ->
    [#{idx => 13, id => 28640, num => 1, classes => 0,
       sex => 2, val => 26, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 14, id => 28641, num => 1, classes => 0,
       sex => 2, val => 26, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 15, id => 28642, num => 1, classes => 0,
       sex => 2, val => 26, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 16, id => 28643, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 17, id => 28644, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 18, id => 28645, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 150, lev_low => 50,
       lev_high => 999},
     #{idx => 19, id => 28646, num => 1, classes => 0,
       sex => 2, val => 45, ratio => 150, lev_low => 70,
       lev_high => 999},
     #{idx => 20, id => 28647, num => 1, classes => 0,
       sex => 2, val => 45, ratio => 150, lev_low => 70,
       lev_high => 999},
     #{idx => 21, id => 28648, num => 1, classes => 0,
       sex => 2, val => 45, ratio => 100, lev_low => 70,
       lev_high => 999},
     #{idx => 22, id => 28649, num => 1, classes => 0,
       sex => 2, val => 53, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 23, id => 28650, num => 1, classes => 0,
       sex => 2, val => 53, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 24, id => 28651, num => 1, classes => 0,
       sex => 2, val => 53, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 25, id => 28652, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 50, lev_low => 90,
       lev_high => 999},
     #{idx => 26, id => 28653, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 50, lev_low => 90,
       lev_high => 999},
     #{idx => 27, id => 28654, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 50, lev_low => 90,
       lev_high => 999},
     #{idx => 28, id => 28680, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 100, lev_low => 70,
       lev_high => 999},
     #{idx => 29, id => 28681, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 100, lev_low => 70,
       lev_high => 999},
     #{idx => 30, id => 28682, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 100, lev_low => 70,
       lev_high => 999},
     #{idx => 31, id => 28683, num => 1, classes => 0,
       sex => 2, val => 32, ratio => 100, lev_low => 70,
       lev_high => 999},
     #{idx => 32, id => 28684, num => 1, classes => 0,
       sex => 2, val => 48, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 33, id => 28685, num => 1, classes => 0,
       sex => 2, val => 48, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 34, id => 28686, num => 1, classes => 0,
       sex => 2, val => 48, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 35, id => 28687, num => 1, classes => 0,
       sex => 2, val => 48, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 36, id => 28688, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 40, lev_low => 85,
       lev_high => 999},
     #{idx => 37, id => 28689, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 40, lev_low => 85,
       lev_high => 999},
     #{idx => 38, id => 28690, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 40, lev_low => 90,
       lev_high => 999},
     #{idx => 39, id => 28691, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 40, lev_low => 90,
       lev_high => 999},
     #{idx => 40, id => 28692, num => 1, classes => 0,
       sex => 2, val => 75, ratio => 40, lev_low => 90,
       lev_high => 999},
     #{idx => 41, id => 28693, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 42, id => 28694, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 43, id => 28695, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 44, id => 28696, num => 1, classes => 0,
       sex => 2, val => 140, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 45, id => 28697, num => 1, classes => 0,
       sex => 2, val => 140, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 46, id => 28698, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 47, id => 28607, num => 1, classes => 0,
       sex => 2, val => 100, ratio => 150, lev_low => 70,
       lev_high => 999},
     #{idx => 48, id => 28702, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999},
     #{idx => 49, id => 28655, num => 1, classes => 0,
       sex => 2, val => 100, ratio => 40, lev_low => 95,
       lev_high => 999},
     #{idx => 50, id => 28656, num => 1, classes => 0,
       sex => 2, val => 100, ratio => 40, lev_low => 95,
       lev_high => 999},
     #{idx => 51, id => 28711, num => 1, classes => 0,
       sex => 2, val => 53, ratio => 100, lev_low => 80,
       lev_high => 999},
     #{idx => 52, id => 28706, num => 1, classes => 0,
       sex => 2, val => 180, ratio => 15, lev_low => 70,
       lev_high => 999}].

get_decompose(28610) -> {1, 4};
get_decompose(28611) -> {2, 4};
get_decompose(28612) -> {3, 4};
get_decompose(28613) -> {4, 4};
get_decompose(28614) -> {5, 4};
get_decompose(28615) -> {6, 4};
get_decompose(28616) -> {7, 6};
get_decompose(28617) -> {8, 6};
get_decompose(28618) -> {9, 6};
get_decompose(28619) -> {10, 9};
get_decompose(28620) -> {11, 9};
get_decompose(28621) -> {12, 9};
get_decompose(28640) -> {100, 13};
get_decompose(28641) -> {101, 13};
get_decompose(28642) -> {102, 13};
get_decompose(28643) -> {103, 16};
get_decompose(28644) -> {104, 16};
get_decompose(28645) -> {105, 16};
get_decompose(28646) -> {106, 23};
get_decompose(28647) -> {107, 23};
get_decompose(28648) -> {108, 23};
get_decompose(28649) -> {109, 27};
get_decompose(28650) -> {110, 27};
get_decompose(28651) -> {111, 27};
get_decompose(28652) -> {112, 38};
get_decompose(28653) -> {113, 38};
get_decompose(28654) -> {114, 38};
get_decompose(28655) -> {115, 50};
get_decompose(28656) -> {116, 50};
get_decompose(28680) -> {200, 16};
get_decompose(28681) -> {201, 16};
get_decompose(28682) -> {202, 16};
get_decompose(28683) -> {203, 16};
get_decompose(28684) -> {204, 24};
get_decompose(28685) -> {205, 24};
get_decompose(28686) -> {206, 24};
get_decompose(28687) -> {207, 24};
get_decompose(28688) -> {208, 38};
get_decompose(28689) -> {209, 38};
get_decompose(28690) -> {210, 38};
get_decompose(28691) -> {211, 38};
get_decompose(28692) -> {212, 38};
get_decompose(28693) -> {300, 90};
get_decompose(28694) -> {301, 90};
get_decompose(28695) -> {302, 90};
get_decompose(28696) -> {303, 70};
get_decompose(28697) -> {304, 70};
get_decompose(28698) -> {305, 90};
get_decompose(28699) -> {306, 70};
get_decompose(28700) -> {307, 70};
get_decompose(28701) -> {308, 70};
get_decompose(28702) -> {309, 90};
get_decompose(28703) -> {310, 70};
get_decompose(28704) -> {311, 70};
get_decompose(28705) -> {312, 70};
get_decompose(28706) -> {313, 90};
get_decompose(28607) -> {0, 50};
get_decompose(28707) -> {314, 70};
get_decompose(28708) -> {315, 70};
get_decompose(28709) -> {316, 90};
get_decompose(28710) -> {317, 90};
get_decompose(28711) -> {318, 27};
get_decompose(28712) -> {319, 70};
get_decompose(28713) -> {320, 70};
get_decompose(28714) -> {321, 70};
get_decompose(28715) -> {322, 90};
get_decompose(28716) -> {323, 70};
get_decompose(28717) -> {324, 70};
get_decompose(28718) -> {325, 70};
get_decompose(28719) -> {326, 70};
get_decompose(28720) -> {327, 90};
get_decompose(28721) -> {328, 70};
get_decompose(28722) -> {329, 70};
get_decompose(28723) -> {330, 70};
get_decompose(28724) -> {331, 90};
get_decompose(28725) -> {332, 70};
get_decompose(_) -> false.

get_lev_attr({1, 102}) -> 13000;
get_lev_attr({1, 101}) -> 13001;
get_lev_attr({1, 103}) -> 13002;
get_lev_attr({1, 104}) -> 13003;
get_lev_attr({1, 105}) -> 13004;
get_lev_attr({2, 102}) -> 13005;
get_lev_attr({2, 101}) -> 13006;
get_lev_attr({2, 103}) -> 13007;
get_lev_attr({2, 104}) -> 13008;
get_lev_attr({2, 105}) -> 13009;
get_lev_attr({3, 102}) -> 13010;
get_lev_attr({3, 101}) -> 13011;
get_lev_attr({3, 103}) -> 13012;
get_lev_attr({3, 104}) -> 13013;
get_lev_attr({3, 105}) -> 13014;
get_lev_attr(_) -> false.

