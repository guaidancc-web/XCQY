-file("src/data/agenda_week_data.erl", 1).

-module(agenda_week_data).

-export([get_activity/1, list_activity/0]).

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

-file("src/data/agenda_week_data.erl", 15).

-file("inc/camp_sign_draw.hrl", 1).

-author("Suhan").

-record(camp_sign_draw_config,
        {camp_id = 0,
         cost = [],
         sign_reward = [],
         title,
         content,
         guarantee_round = 10}).

-record(m_camp_sign_draw,
        {ver = 1,
         camp_id = 0,
         sign_flag = 0,
         sign_time = 0,
         draw_times = 0,
         quality_times = [],
         history_quality_times = []}).

-record(camp_sign_draw_reward,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         ratio = 0,
         num_weight = [],
         draw_icon = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-record(camp_sign_draw_reward_base,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         num = 0,
         weight = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-file("src/data/agenda_week_data.erl", 16).

get_activity(1) ->
    {1,
     1521147600,
     400,
     [{27010, 1, 1}],
     lang:get("孜孜不倦礼盒"),
     27010,
     lang:get("周活跃度达到<color='#ffff00'>400</color>，打开即可获得<col"
              "or='#ffff00'>丰厚奖励</color>"),
     800,
     [{27011, 1, 1}],
     lang:get("全勤达人礼盒"),
     23255,
     lang:get("周活跃度达到<color='#ffff00'>800</color>，打开即可获得<col"
              "or='#ffff00'>珍稀奖励</color>，并有<color='#ffff00'>"
              "概率</color>获得<color='#ffff00'>永久时装</color>哦")};
get_activity(_) -> 0.

list_activity() -> [1].

