-file("src/data/camp_fashion_promote_data.erl", 1).

-module(camp_fashion_promote_data).

-export([get_today_goods/1,
         get_etc_config/1,
         get_all_goodsid/0,
         get_promote/3,
         get_itemlist/3]).

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

-file("src/data/camp_fashion_promote_data.erl", 24).

-file("inc/role.hrl", 1).

-record(role,
        {ver = 76 :: pos_integer(),
         pid :: undefined | pid(),
         loop_counter = 1 :: pos_integer(),
         is_gain = false,
         need_sync = false :: boolean(),
         time_info = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         time_reg = 1 :: pos_integer(),
         ip_reg = {0, 0, 0, 0} :: tuple(),
         ip_last_login = {0, 0, 0, 0} :: tuple(),
         lock_status = 0,
         id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "",
         device_id = "",
         device_type = 1,
         device_key = "",
         account = "" :: list(),
         name = "" :: list(),
         charge = 0 :: non_neg_integer(),
         consume = 0,
         label = 0 :: 0..2,
         sex = 2 :: 0..2,
         classes = 0 :: 0..5,
         lev = 0 :: non_neg_integer(),
         realm = 0 :: non_neg_integer(),
         speed = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         face = 1 :: pos_integer(),
         assets :: undefined | tuple(),
         attr :: undefined | tuple(),
         link :: undefined | tuple(),
         trigger = {1, []} :: {pos_integer(), [tuple()]},
         timer :: undefined | tuple(),
         pos :: undefined | tuple(),
         extra = [] :: [{non_neg_integer(), term()}],
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_ride = 0 :: 0..3,
         s_event = 0 :: non_neg_integer(),
         s_event_pid = 0 :: 0 | undefined | pid(),
         s_name = 0 :: 0 | 1,
         s_looks = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer(),
               bitstring()}],
         s_follow = [] :: [tuple()],
         debug_rpc = false :: boolean(),
         name_used = "" :: string(),
         cross_type = 0,
         m_attr_point,
         m_combat,
         m_quest,
         m_pet,
         m_skill,
         m_var,
         m_guard,
         m_plot,
         m_dungeon,
         m_guild,
         m_home,
         m_option,
         m_wing,
         m_team,
         m_honor,
         m_friend,
         m_wake,
         m_arena,
         m_market_silver,
         m_escort,
         m_buff,
         m_formation,
         m_skill_life,
         m_trial,
         m_fashion,
         m_satiety,
         m_agenda,
         m_parade,
         m_mail = [],
         m_qualifying,
         m_treasure,
         m_campaign,
         m_shipping,
         m_checkin,
         m_tower,
         m_classes_challenge,
         m_fairyland,
         m_glory,
         m_examination,
         m_adm,
         m_alchemy,
         m_pet_store,
         m_store,
         m_achievement,
         m_wedding,
         m_constellation,
         m_investment,
         m_privilege,
         m_limit_return,
         m_pray,
         m_teacher,
         m_help,
         m_achieve_shop,
         m_brave_trial,
         m_camp_dragon_boat,
         m_over_seas,
         m_hook_setting,
         m_tournament,
         m_market_gold,
         m_goal,
         m_family,
         m_charge_gift,
         m_mount,
         m_camp_web,
         m_handbook,
         m_endless_challenge,
         m_lev_break,
         m_head,
         m_extension,
         m_camp_cake,
         m_rainbow_lottery,
         m_sworn,
         m_gods_duel,
         m_preparation,
         m_reward_back,
         m_child,
         m_maze,
         m_raffle,
         m_rencounter,
         m_talisman,
         m_month_gift,
         m_pay_turn,
         m_camp_box,
         m_camp_pay_continus,
         m_spirit_treasure,
         m_camp_discount,
         m_camp_7_7th,
         m_new_expression,
         m_exquisite_shelf,
         m_camp_recharge,
         m_camp_recharge_gift,
         m_camp_collection,
         m_camp_cut_price,
         m_camp_inquiry,
         m_gods_place,
         m_camp_slot_machine,
         m_camp_sign_draw,
         m_agenda_week,
         m_exp_bottle,
         m_camp_zillionaire,
         m_provocation,
         m_oracle_treasure,
         m_camp_pass_flower_language,
         m_camp_score_exchange,
         m_camp_pray,
         p_bag,
         p_store,
         p_eqm,
         p_family_store}).

-record(map_role,
        {pid :: undefined | pid(),
         rid = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         conn_pid :: undefined | pid(),
         map = 0 :: non_neg_integer(),
         grid_pid :: undefined | pid(),
         dir = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         action = 0 :: non_neg_integer(),
         ride = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer(),
         hidden = 0 :: 0..1,
         label = 0 :: 0..2,
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         realm = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         fc = 0 :: non_neg_integer(),
         prop = [] :: [{non_neg_integer(), string()}],
         looks = [] :: list(),
         follow_list = [] :: list(),
         guild = "" :: bitstring(),
         guild_post = "" :: bitstring(),
         guild_signature = "" :: bitstring(),
         guild_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         team_status = 0 :: 0..4,
         team_num = 0,
         lover_rid = 0 :: non_neg_integer(),
         lover_platform = "" :: list(),
         lover_zone_id = 0 :: non_neg_integer(),
         lover_name = "" :: list(),
         lover_status = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         foot_mark = 0 :: non_neg_integer()}).

-record(role_info,
        {id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lock_status = 0 :: 0..3,
         lev = 1 :: pos_integer(),
         break_times = 0 :: non_neg_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         guild = "" :: list()}).

-record(role_name_used,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         new_name = "",
         sex = 0,
         classes = 0,
         time = 0}).

-record(role_profile,
        {id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         face = 0 :: non_neg_integer(),
         guild_id = {0, "", 0} :: tuple(),
         guild_name = "" :: list(),
         looks = [],
         achievement_point = 0 :: non_neg_integer(),
         achievement_assets_point = 0,
         achievement_list = [],
         status = 0 :: 0..4,
         team_status = 0 :: 0..4,
         team_num = 0,
         name_used = "" :: string(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         teacher_name = "" :: string(),
         tournament_lev = 0 :: non_neg_integer(),
         family_id = {0, "", 0} :: tuple(),
         break_times = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer()}).

-record(role_cache,
        {id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: undefined | pid(),
         link,
         account = "" :: bitstring(),
         name = "" :: bitstring(),
         label = 0 :: 0..2,
         face = 1,
         sex = 2 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_event = 0 :: non_neg_integer(),
         pos,
         channel_reg = 0 :: non_neg_integer()}).

-record(card_state,
        {gold = 0,
         gold_bind = 0,
         buy_time = 0,
         state = 0,
         day = 0,
         day_sum = 0,
         daily_time = 0}).

-record(m_new_expression,
        {s_expression = [], b_expression = []}).

-file("src/data/camp_fashion_promote_data.erl", 25).

get_today_goods(1) -> [1, 2, 3];
get_today_goods(2) -> [1, 2, 3];
get_today_goods(3) -> [1, 2, 3];
get_today_goods(4) -> [1, 2, 3];
get_today_goods(5) -> [1, 2, 3];
get_today_goods(6) -> [1, 2, 3];
get_today_goods(7) -> [1, 2, 3];
get_today_goods(_) -> [].

get_etc_config(1) -> [1, 2, 3];
get_etc_config(2) -> [4, 5, 6];
get_etc_config(3) -> [7, 8, 9];
get_etc_config(_) -> false.

get_all_goodsid() -> [1, 2, 3].

get_promote(PlanID, Classes, Sex)
    when PlanID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("单件时装"),
     lang:get("暖绒熊宝"),
     7,
     2280,
     1596,
     [{1, 51094}, {2, 50094}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("单件时装"),
     lang:get("暖绒熊宝"),
     7,
     2280,
     1596,
     [{1, 51095}, {2, 50095}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装一"),
     lang:get("暖绒熊宝"),
     7,
     3560,
     1960,
     [{1, 51094}, {2, 50094}, {3, 53058}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装一"),
     lang:get("暖绒熊宝"),
     7,
     3560,
     1960,
     [{1, 51095}, {2, 50095}, {3, 53059}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 9 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装二"),
     lang:get("暖绒熊宝"),
     7,
     4540,
     2270,
     [{1, 51094}, {2, 50094}, {3, 53058}, {4, 52056}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 9 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装二"),
     lang:get("暖绒熊宝"),
     7,
     4540,
     2270,
     [{1, 51095}, {2, 50095}, {3, 53059}, {4, 52056}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("单件时装"),
     lang:get("冬日恋歌"),
     7,
     2280,
     1596,
     [{1, 51114}, {2, 50114}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("单件时装"),
     lang:get("冬日恋歌"),
     7,
     2280,
     1596,
     [{1, 51115}, {2, 50115}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装一"),
     lang:get("冬日恋歌"),
     7,
     3560,
     1960,
     [{1, 51114}, {2, 50114}, {3, 53078}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装一"),
     lang:get("冬日恋歌"),
     7,
     3560,
     1960,
     [{1, 51115}, {2, 50115}, {3, 53077}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装二"),
     lang:get("冬日恋歌"),
     7,
     4540,
     2270,
     [{1, 51114}, {2, 50114}, {3, 53078}, {4, 52046}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装二"),
     lang:get("冬日恋歌"),
     7,
     4540,
     2270,
     [{1, 51115}, {2, 50115}, {3, 53077}, {4, 52046}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("单件时装"),
     lang:get("悠扬乐章"),
     7,
     2280,
     1596,
     [{1, 51106}, {2, 50106}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("单件时装"),
     lang:get("悠扬乐章"),
     7,
     2280,
     1596,
     [{1, 51107}, {2, 50107}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装一"),
     lang:get("悠扬乐章"),
     7,
     3560,
     1960,
     [{1, 51106}, {2, 50106}, {3, 53072}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装一"),
     lang:get("悠扬乐章"),
     7,
     3560,
     1960,
     [{1, 51107}, {2, 50107}, {3, 53073}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    {0,
     0,
     lang:get("时装套装二"),
     lang:get("悠扬乐章"),
     7,
     4540,
     2270,
     [{1, 51106}, {2, 50106}, {3, 53072}, {4, 52054}]};
get_promote(PlanID, Classes, Sex)
    when PlanID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    {1,
     0,
     lang:get("时装套装二"),
     lang:get("悠扬乐章"),
     7,
     4540,
     2270,
     [{1, 51107}, {2, 50107}, {3, 53073}, {4, 52054}]};
get_promote(_, _, _) -> false.

get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29857, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 7 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29860, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29857, 0, 1}, {29863, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 8 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29860, 0, 1}, {29866, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 9 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29857, 0, 1}, {29863, 0, 1}, {29687, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 9 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29860, 0, 1}, {29866, 0, 1}, {29687, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29825, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 1 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29828, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29825, 0, 1}, {29831, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 2 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29828, 0, 1}, {29834, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29825, 0, 1}, {29831, 0, 1}, {29585, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 3 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29828, 0, 1}, {29834, 0, 1}, {29585, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29676, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 4 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29677, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29676, 0, 1}, {29679, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 5 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29677, 0, 1}, {29680, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (0 =:= 2 orelse Sex =:= 0) ->
    [{29676, 0, 1}, {29679, 0, 1}, {29678, 0, 1}];
get_itemlist(PlanID, Classes, Sex)
    when PlanID =:= 6 andalso
             (Classes =:= 0 orelse 0 =:= 0) andalso
                 (1 =:= 2 orelse Sex =:= 1) ->
    [{29677, 0, 1}, {29680, 0, 1}, {29678, 0, 1}];
get_itemlist(_, _, _) -> false.

