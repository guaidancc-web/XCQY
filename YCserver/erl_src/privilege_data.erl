-file("src/data/privilege_data.erl", 1).

-module(privilege_data).

-export([get/1,
         types/1,
         get_type/1,
         get_lev/1,
         get_save_exp/1,
         get_box/1,
         get_next_lev/1,
         all_gift/0,
         get_gift/1,
         get_privilege/1,
         get_gift_by_charge/1,
         get_extra_cfg/0]).

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

-file("src/data/privilege_data.erl", 26).

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

-file("src/data/privilege_data.erl", 27).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/data/privilege_data.erl", 28).

get(10) ->
    #privilege_data{lev = 10, min = 60, max = 199,
                    item =
                        [{20097, 0, 1, 0, 2},
                         {24100, 0, 1, 1, 2},
                         {24101, 0, 1, 2, 2},
                         {24102, 0, 1, 3, 2},
                         {24103, 0, 1, 4, 2},
                         {24104, 0, 1, 5, 2},
                         {24105, 0, 1, 6, 2},
                         {24191, 0, 1, 7, 2},
                         {90002, 0, 100, 0, 2},
                         {20006, 0, 30, 0, 2},
                         {90000, 0, 300000, 0, 2},
                         {25021, 0, 1, 0, 2}]};
get(20) ->
    #privilege_data{lev = 20, min = 200, max = 599,
                    item =
                        [{20031, 0, 1, 0, 2},
                         {20025, 0, 1, 0, 2},
                         {90000, 0, 300000, 0, 2},
                         {20006, 0, 20, 0, 2}]};
get(30) ->
    #privilege_data{lev = 30, min = 600, max = 999,
                    title = lang:get("星辰祝福1段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福1段</color>效果，激活效果"
                                 "：<color='#ffff00'>★每月补签次数*3★</color>"),
                    item =
                        [{20034, 0, 3, 0, 2},
                         {20002, 0, 1, 0, 2},
                         {20005, 0, 3, 0, 2}]};
get(40) ->
    #privilege_data{lev = 40, min = 1000, max = 1999,
                    title = lang:get("星辰祝福2段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福2段</color>效果，激活效果"
                                 "：<color='#ffff00'>★聊天可使用专属表情包★</color>"),
                    item =
                        [{24106, 0, 1, 1, 2},
                         {24107, 0, 1, 2, 2},
                         {24108, 0, 1, 3, 2},
                         {24109, 0, 1, 4, 2},
                         {24110, 0, 1, 5, 2},
                         {24111, 0, 1, 6, 2},
                         {24192, 0, 1, 7, 2},
                         {21100, 0, 1, 0, 2},
                         {20007, 0, 2, 0, 2},
                         {20020, 0, 8, 0, 2},
                         {90000, 0, 300000, 0, 2}]};
get(50) ->
    #privilege_data{lev = 50, min = 2000, max = 4999,
                    title = lang:get("星辰祝福3段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福3段</color>效果，激活效果"
                                 "：<color='#ffff00'>★离线获得经验奖励的时间上限增加至<color='#0"
                                 "0ff00'>15小时</color>★</color>、<color='#ffff00'"
                                 ">★离线经验获得效率增加20%★</color>、<color='#ffff00'>★好友"
                                 "上限<color='#00ff00'>增加10人</color>★</color>"),
                    item =
                        [{23676, 0, 1, 0, 2},
                         {22396, 0, 1, 0, 2},
                         {20039, 0, 1, 0, 2},
                         {20023, 0, 2, 0, 2},
                         {22216, 0, 1, 0, 2}]};
get(60) ->
    #privilege_data{lev = 60, min = 5000, max = 9999,
                    title = lang:get("星辰祝福4段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福4段</color>效果，激活效果"
                                 "：<color='#ffff00'>★每月补签次数*5★</color>、<color='"
                                 "#ffff00'>★商城总管为您提供<color='#00ff00'>太阳的后裔礼包</c"
                                 "olor>购买机会★</color>、<color='#ffff00'>★每周提供1次<c"
                                 "olor='#00ff00'>一大箱金币</color>购买机会★</color>"),
                    item =
                        [{20616, 0, 1, 0, 2},
                         {20075, 0, 1, 0, 2},
                         {20545, 0, 2, 0, 2},
                         {20006, 0, 30, 0, 2}]};
get(70) ->
    #privilege_data{lev = 70, min = 10000, max = 14999,
                    title = lang:get("星辰祝福5段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福5段</color>效果，激活效果"
                                 "：<color='#ffff00'>★得到院长的点拨，每天可额外使用5本<color='#"
                                 "00ff00'>冒险笔记和人物经验书</color>★</color>、<color='#"
                                 "ffff00'>★神秘商店每天提供<color='#00ff00'>1</color>次<"
                                 "color='#00ff00'>刷新</color>机会★</color>"),
                    item =
                        [{20016, 0, 1, 0, 2},
                         {24112, 0, 1, 1, 2},
                         {24113, 0, 1, 2, 2},
                         {24114, 0, 1, 3, 2},
                         {24115, 0, 1, 4, 2},
                         {24116, 0, 1, 5, 2},
                         {24117, 0, 1, 6, 2},
                         {24193, 0, 1, 7, 2},
                         {20032, 0, 1, 0, 2},
                         {20021, 0, 3, 0, 2},
                         {90000, 0, 300000, 0, 2}]};
get(80) ->
    #privilege_data{lev = 80, min = 15000, max = 19999,
                    title = lang:get("星辰祝福6段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福6段</color>效果，激活效果"
                                 "：<color='#ffff00'>★商城本周优惠可额外购买1个<color='#00ff"
                                 "00'>神宠礼包</color>★</color>、<color='#ffff00'>★得"
                                 "到星辰学院的许可，每天可根据等级额外获得一定的<color='#00ff00'>储备经验<"
                                 "/color>★</color>"),
                    item =
                        [{20076, 0, 1, 0, 2},
                         {20617, 0, 1, 0, 2},
                         {20053, 0, 1, 0, 2}]};
get(90) ->
    #privilege_data{lev = 90, min = 20000, max = 29999,
                    item =
                        [{24124, 0, 1, 1, 2},
                         {24125, 0, 1, 2, 2},
                         {24126, 0, 1, 3, 2},
                         {24127, 0, 1, 4, 2},
                         {24128, 0, 1, 5, 2},
                         {24129, 0, 1, 6, 2},
                         {24195, 0, 1, 7, 2},
                         {20061, 0, 3, 0, 2},
                         {22543, 0, 1, 0, 2},
                         {20006, 0, 100, 0, 2},
                         {29145, 0, 2, 0, 2}]};
get(95) ->
    #privilege_data{lev = 95, min = 30000, max = 49999,
                    item =
                        [{24118, 0, 1, 1, 2},
                         {24119, 0, 1, 2, 2},
                         {24120, 0, 1, 3, 2},
                         {24121, 0, 1, 4, 2},
                         {24122, 0, 1, 5, 2},
                         {24123, 0, 1, 6, 2},
                         {24194, 0, 1, 7, 2},
                         {24136, 0, 1, 1, 2},
                         {24137, 0, 1, 2, 2},
                         {24138, 0, 1, 3, 2},
                         {24139, 0, 1, 4, 2},
                         {24140, 0, 1, 5, 2},
                         {24141, 0, 1, 6, 2},
                         {24196, 0, 1, 7, 2},
                         {23740, 0, 1, 0, 2},
                         {21098, 0, 5, 0, 2},
                         {20006, 0, 30, 0, 2},
                         {90000, 0, 300000, 0, 2}]};
get(100) ->
    #privilege_data{lev = 100, min = 50000, max = 99999,
                    item =
                        [{20545, 0, 5, 0, 2},
                         {20617, 0, 1, 0, 2},
                         {20006, 0, 100, 0, 2},
                         {29145, 0, 3, 0, 2}]};
get(110) ->
    #privilege_data{lev = 110, min = 100000, max = 149999,
                    title = lang:get("星辰祝福7段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福7段</color>效果，激活效果"
                                 "：<color='#ffff00'>★每周提供<color='#00ff00'>2</co"
                                 "lor>次<color='#00ff00'>一大箱金币</color>购买机会★</col"
                                 "or>"),
                    item =
                        [{20024, 0, 2, 0, 2},
                         {29101, 0, 5, 0, 2},
                         {29153, 0, 1, 0, 2}]};
get(120) ->
    #privilege_data{lev = 120, min = 150000, max = 199999,
                    title = lang:get("星辰祝福8段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福8段</color>效果，激活效果"
                                 "：<color='#ffff00'>★神秘商店每天提供<color='#00ff00'>2"
                                 "</color>次<color='#00ff00'>刷新</color>★</color>"
                                 ""),
                    item =
                        [{20656, 0, 5, 0, 2},
                         {23119, 0, 1, 0, 2},
                         {22216, 0, 3, 0, 2}]};
get(130) ->
    #privilege_data{lev = 130, min = 200000,
                    max = 9999999999, title = lang:get("星辰祝福9段"),
                    content =
                        lang:get("恭喜！您获得了<color='#ffff00'>星辰祝福9段</color>效果，激活效果"
                                 "：<color='#ffff00'>★商城总管为您提供<color='#00ff00'>太"
                                 "阳的后裔礼包</color>额外<color='#00ff00'>1次</color>购买"
                                 "机会★</color>"),
                    item =
                        [{29100, 0, 2, 0, 2},
                         {22617, 0, 1, 0, 2},
                         {23632, 0, 1, 0, 2}]};
get(_) -> false.

get_lev(Num) when Num >= 60 andalso Num =< 199 -> 10;
get_lev(Num) when Num >= 200 andalso Num =< 599 -> 20;
get_lev(Num) when Num >= 600 andalso Num =< 999 -> 30;
get_lev(Num) when Num >= 1000 andalso Num =< 1999 -> 40;
get_lev(Num) when Num >= 2000 andalso Num =< 4999 -> 50;
get_lev(Num) when Num >= 5000 andalso Num =< 9999 -> 60;
get_lev(Num) when Num >= 10000 andalso Num =< 14999 ->
    70;
get_lev(Num) when Num >= 15000 andalso Num =< 19999 ->
    80;
get_lev(Num) when Num >= 20000 andalso Num =< 29999 ->
    90;
get_lev(Num) when Num >= 30000 andalso Num =< 49999 ->
    95;
get_lev(Num) when Num >= 50000 andalso Num =< 99999 ->
    100;
get_lev(Num) when Num >= 100000 andalso Num =< 149999 ->
    110;
get_lev(Num) when Num >= 150000 andalso Num =< 199999 ->
    120;
get_lev(Num)
    when Num >= 200000 andalso Num =< 9999999999 ->
    130;
get_lev(_) -> 0.

types(30) -> [102];
types(40) -> [102, 103];
types(50) -> [102, 103, 104, 105, 101];
types(60) -> [102, 103, 104, 105, 101];
types(70) -> [102, 103, 104, 105, 109, 113, 101];
types(80) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(90) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(95) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(100) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(110) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(120) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(130) -> [102, 103, 104, 105, 109, 106, 113, 101];
types(_) -> [].

get_type({30, 102}) ->
    #privilege_type_data{lev = 30, type = 102, val = 3};
get_type({40, 102}) ->
    #privilege_type_data{lev = 40, type = 102, val = 3};
get_type({40, 103}) ->
    #privilege_type_data{lev = 40, type = 103, val = 1};
get_type({50, 102}) ->
    #privilege_type_data{lev = 50, type = 102, val = 3};
get_type({50, 103}) ->
    #privilege_type_data{lev = 50, type = 103, val = 1};
get_type({50, 104}) ->
    #privilege_type_data{lev = 50, type = 104, val = 15};
get_type({50, 105}) ->
    #privilege_type_data{lev = 50, type = 105, val = 200};
get_type({50, 101}) ->
    #privilege_type_data{lev = 50, type = 101, val = 10};
get_type({60, 102}) ->
    #privilege_type_data{lev = 60, type = 102, val = 5};
get_type({60, 103}) ->
    #privilege_type_data{lev = 60, type = 103, val = 1};
get_type({60, 104}) ->
    #privilege_type_data{lev = 60, type = 104, val = 5};
get_type({60, 105}) ->
    #privilege_type_data{lev = 60, type = 105, val = 200};
get_type({60, 101}) ->
    #privilege_type_data{lev = 60, type = 101, val = 10};
get_type({70, 102}) ->
    #privilege_type_data{lev = 70, type = 102, val = 5};
get_type({70, 103}) ->
    #privilege_type_data{lev = 70, type = 103, val = 1};
get_type({70, 104}) ->
    #privilege_type_data{lev = 70, type = 104, val = 18000};
get_type({70, 105}) ->
    #privilege_type_data{lev = 70, type = 105, val = 200};
get_type({70, 109}) ->
    #privilege_type_data{lev = 70, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({70, 113}) ->
    #privilege_type_data{lev = 70, type = 113, val = 1};
get_type({70, 101}) ->
    #privilege_type_data{lev = 70, type = 101, val = 10};
get_type({80, 102}) ->
    #privilege_type_data{lev = 80, type = 102, val = 5};
get_type({80, 103}) ->
    #privilege_type_data{lev = 80, type = 103, val = 1};
get_type({80, 104}) ->
    #privilege_type_data{lev = 80, type = 104, val = 18000};
get_type({80, 105}) ->
    #privilege_type_data{lev = 80, type = 105, val = 200};
get_type({80, 109}) ->
    #privilege_type_data{lev = 80, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({80, 106}) ->
    #privilege_type_data{lev = 80, type = 106, val = 1};
get_type({80, 113}) ->
    #privilege_type_data{lev = 80, type = 113, val = 1};
get_type({80, 101}) ->
    #privilege_type_data{lev = 80, type = 101, val = 10};
get_type({90, 102}) ->
    #privilege_type_data{lev = 90, type = 102, val = 5};
get_type({90, 103}) ->
    #privilege_type_data{lev = 90, type = 103, val = 1};
get_type({90, 104}) ->
    #privilege_type_data{lev = 90, type = 104, val = 18000};
get_type({90, 105}) ->
    #privilege_type_data{lev = 90, type = 105, val = 200};
get_type({90, 109}) ->
    #privilege_type_data{lev = 90, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({90, 106}) ->
    #privilege_type_data{lev = 90, type = 106, val = 1};
get_type({90, 113}) ->
    #privilege_type_data{lev = 90, type = 113, val = 1};
get_type({90, 101}) ->
    #privilege_type_data{lev = 90, type = 101, val = 10};
get_type({95, 102}) ->
    #privilege_type_data{lev = 95, type = 102, val = 5};
get_type({95, 103}) ->
    #privilege_type_data{lev = 95, type = 103, val = 1};
get_type({95, 104}) ->
    #privilege_type_data{lev = 95, type = 104, val = 18000};
get_type({95, 105}) ->
    #privilege_type_data{lev = 95, type = 105, val = 200};
get_type({95, 109}) ->
    #privilege_type_data{lev = 95, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({95, 106}) ->
    #privilege_type_data{lev = 95, type = 106, val = 1};
get_type({95, 113}) ->
    #privilege_type_data{lev = 95, type = 113, val = 1};
get_type({95, 101}) ->
    #privilege_type_data{lev = 95, type = 101, val = 10};
get_type({100, 102}) ->
    #privilege_type_data{lev = 100, type = 102, val = 5};
get_type({100, 103}) ->
    #privilege_type_data{lev = 100, type = 103, val = 1};
get_type({100, 104}) ->
    #privilege_type_data{lev = 100, type = 104,
                         val = 18000};
get_type({100, 105}) ->
    #privilege_type_data{lev = 100, type = 105, val = 200};
get_type({100, 109}) ->
    #privilege_type_data{lev = 100, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({100, 106}) ->
    #privilege_type_data{lev = 100, type = 106, val = 1};
get_type({100, 113}) ->
    #privilege_type_data{lev = 100, type = 113, val = 1};
get_type({100, 101}) ->
    #privilege_type_data{lev = 100, type = 101, val = 10};
get_type({110, 102}) ->
    #privilege_type_data{lev = 110, type = 102, val = 5};
get_type({110, 103}) ->
    #privilege_type_data{lev = 110, type = 103, val = 1};
get_type({110, 104}) ->
    #privilege_type_data{lev = 110, type = 104,
                         val = 18000};
get_type({110, 105}) ->
    #privilege_type_data{lev = 110, type = 105, val = 200};
get_type({110, 109}) ->
    #privilege_type_data{lev = 110, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({110, 106}) ->
    #privilege_type_data{lev = 110, type = 106, val = 1};
get_type({110, 113}) ->
    #privilege_type_data{lev = 110, type = 113, val = 1};
get_type({110, 101}) ->
    #privilege_type_data{lev = 110, type = 101, val = 10};
get_type({120, 102}) ->
    #privilege_type_data{lev = 120, type = 102, val = 5};
get_type({120, 103}) ->
    #privilege_type_data{lev = 120, type = 103, val = 1};
get_type({120, 104}) ->
    #privilege_type_data{lev = 120, type = 104,
                         val = 18000};
get_type({120, 105}) ->
    #privilege_type_data{lev = 120, type = 105, val = 200};
get_type({120, 109}) ->
    #privilege_type_data{lev = 120, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({120, 106}) ->
    #privilege_type_data{lev = 120, type = 106, val = 1};
get_type({120, 113}) ->
    #privilege_type_data{lev = 120, type = 113, val = 2};
get_type({120, 101}) ->
    #privilege_type_data{lev = 120, type = 101, val = 10};
get_type({130, 102}) ->
    #privilege_type_data{lev = 130, type = 102, val = 5};
get_type({130, 103}) ->
    #privilege_type_data{lev = 130, type = 103, val = 1};
get_type({130, 104}) ->
    #privilege_type_data{lev = 130, type = 104,
                         val = 18000};
get_type({130, 105}) ->
    #privilege_type_data{lev = 130, type = 105, val = 200};
get_type({130, 109}) ->
    #privilege_type_data{lev = 130, type = 109, val = 1,
                         args = [{20005, 5}, {20025, 5}]};
get_type({130, 106}) ->
    #privilege_type_data{lev = 130, type = 106, val = 1};
get_type({130, 113}) ->
    #privilege_type_data{lev = 130, type = 113, val = 2};
get_type({130, 101}) ->
    #privilege_type_data{lev = 130, type = 101, val = 10};
get_type(_) -> false.

get_save_exp(1) -> 1000;
get_save_exp(2) -> 1000;
get_save_exp(3) -> 1000;
get_save_exp(4) -> 1000;
get_save_exp(5) -> 1000;
get_save_exp(6) -> 1000;
get_save_exp(7) -> 1000;
get_save_exp(8) -> 1000;
get_save_exp(9) -> 1000;
get_save_exp(10) -> 1000;
get_save_exp(11) -> 1000;
get_save_exp(12) -> 1000;
get_save_exp(13) -> 1000;
get_save_exp(14) -> 1000;
get_save_exp(15) -> 1000;
get_save_exp(16) -> 1000;
get_save_exp(17) -> 1000;
get_save_exp(18) -> 1000;
get_save_exp(19) -> 1000;
get_save_exp(20) -> 74160;
get_save_exp(21) -> 75600;
get_save_exp(22) -> 77040;
get_save_exp(23) -> 78480;
get_save_exp(24) -> 79920;
get_save_exp(25) -> 81360;
get_save_exp(26) -> 82800;
get_save_exp(27) -> 84240;
get_save_exp(28) -> 85680;
get_save_exp(29) -> 87120;
get_save_exp(30) -> 88560;
get_save_exp(31) -> 93360;
get_save_exp(32) -> 94800;
get_save_exp(33) -> 96240;
get_save_exp(34) -> 97680;
get_save_exp(35) -> 99480;
get_save_exp(36) -> 100920;
get_save_exp(37) -> 102360;
get_save_exp(38) -> 103800;
get_save_exp(39) -> 105600;
get_save_exp(40) -> 107040;
get_save_exp(41) -> 111480;
get_save_exp(42) -> 113280;
get_save_exp(43) -> 114720;
get_save_exp(44) -> 116520;
get_save_exp(45) -> 117960;
get_save_exp(46) -> 119400;
get_save_exp(47) -> 121200;
get_save_exp(48) -> 122640;
get_save_exp(49) -> 124440;
get_save_exp(50) -> 125880;
get_save_exp(51) -> 127680;
get_save_exp(52) -> 129120;
get_save_exp(53) -> 130920;
get_save_exp(54) -> 132720;
get_save_exp(55) -> 134160;
get_save_exp(56) -> 138960;
get_save_exp(57) -> 140400;
get_save_exp(58) -> 142200;
get_save_exp(59) -> 144000;
get_save_exp(60) -> 145440;
get_save_exp(61) -> 150240;
get_save_exp(62) -> 152040;
get_save_exp(63) -> 153840;
get_save_exp(64) -> 155280;
get_save_exp(65) -> 157080;
get_save_exp(66) -> 158880;
get_save_exp(67) -> 160680;
get_save_exp(68) -> 162480;
get_save_exp(69) -> 164280;
get_save_exp(70) -> 165720;
get_save_exp(71) -> 167520;
get_save_exp(72) -> 169320;
get_save_exp(73) -> 171120;
get_save_exp(74) -> 172920;
get_save_exp(75) -> 174720;
get_save_exp(76) -> 176520;
get_save_exp(77) -> 178320;
get_save_exp(78) -> 180120;
get_save_exp(79) -> 181920;
get_save_exp(80) -> 183720;
get_save_exp(81) -> 197520;
get_save_exp(82) -> 199680;
get_save_exp(83) -> 201480;
get_save_exp(84) -> 203280;
get_save_exp(85) -> 205080;
get_save_exp(86) -> 206880;
get_save_exp(87) -> 208680;
get_save_exp(88) -> 210840;
get_save_exp(89) -> 212640;
get_save_exp(90) -> 214440;
get_save_exp(91) -> 216240;
get_save_exp(92) -> 218400;
get_save_exp(93) -> 220200;
get_save_exp(94) -> 222000;
get_save_exp(95) -> 224160;
get_save_exp(96) -> 225960;
get_save_exp(97) -> 227760;
get_save_exp(98) -> 229920;
get_save_exp(99) -> 231720;
get_save_exp(100) -> 233520;
get_save_exp(101) -> 235320;
get_save_exp(102) -> 237120;
get_save_exp(103) -> 238920;
get_save_exp(104) -> 240720;
get_save_exp(105) -> 242520;
get_save_exp(106) -> 244320;
get_save_exp(107) -> 246120;
get_save_exp(108) -> 247920;
get_save_exp(109) -> 249720;
get_save_exp(110) -> 251520;
get_save_exp(111) -> 253320;
get_save_exp(112) -> 255120;
get_save_exp(113) -> 256920;
get_save_exp(114) -> 258720;
get_save_exp(115) -> 260520;
get_save_exp(116) -> 262320;
get_save_exp(117) -> 264120;
get_save_exp(118) -> 265920;
get_save_exp(119) -> 267720;
get_save_exp(120) -> 269520;
get_save_exp(121) -> 271320;
get_save_exp(122) -> 273120;
get_save_exp(123) -> 274920;
get_save_exp(124) -> 276720;
get_save_exp(125) -> 278520;
get_save_exp(126) -> 280320;
get_save_exp(127) -> 282120;
get_save_exp(128) -> 283920;
get_save_exp(129) -> 285720;
get_save_exp(130) -> 287520;
get_save_exp(131) -> 289320;
get_save_exp(132) -> 291120;
get_save_exp(133) -> 292920;
get_save_exp(134) -> 294720;
get_save_exp(135) -> 296520;
get_save_exp(136) -> 298320;
get_save_exp(137) -> 300120;
get_save_exp(138) -> 301920;
get_save_exp(139) -> 303720;
get_save_exp(140) -> 305520;
get_save_exp(141) -> 307320;
get_save_exp(142) -> 309120;
get_save_exp(143) -> 310920;
get_save_exp(144) -> 312720;
get_save_exp(145) -> 314520;
get_save_exp(146) -> 316320;
get_save_exp(147) -> 318120;
get_save_exp(148) -> 319920;
get_save_exp(149) -> 321720;
get_save_exp(150) -> 323520;
get_save_exp(_) -> 0.

get_box({62316, 0}) ->
    [#privilege_item{id = 62316, item_id = 20006,
                     is_self = 0, bind = 0, is_cast = 0, num = 5,
                     weigth = 220},
     #privilege_item{id = 62316, item_id = 20020,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 135},
     #privilege_item{id = 62316, item_id = 20025,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 80},
     #privilege_item{id = 62316, item_id = 20087,
                     is_self = 0, bind = 0, is_cast = 1, num = 1,
                     weigth = 30},
     #privilege_item{id = 62316, item_id = 90000,
                     is_self = 0, bind = 0, is_cast = 0, num = 30000,
                     weigth = 50},
     #privilege_item{id = 62316, item_id = 20074,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 50},
     #privilege_item{id = 62316, item_id = 20005,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 61},
     #privilege_item{id = 62316, item_id = 20004,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 60},
     #privilege_item{id = 62316, item_id = 20075,
                     is_self = 0, bind = 0, is_cast = 1, num = 1,
                     weigth = 2},
     #privilege_item{id = 62316, item_id = 20095,
                     is_self = 0, bind = 0, is_cast = 1, num = 1,
                     weigth = 1},
     #privilege_item{id = 62316, item_id = 20021,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 50},
     #privilege_item{id = 62316, item_id = 29102,
                     is_self = 0, bind = 0, is_cast = 1, num = 1,
                     weigth = 10},
     #privilege_item{id = 62316, item_id = 20007,
                     is_self = 0, bind = 0, is_cast = 0, num = 1,
                     weigth = 30},
     #privilege_item{id = 62316, item_id = 20072,
                     is_self = 0, bind = 0, is_cast = 1, num = 1,
                     weigth = 10}];
get_box({62316, 1}) ->
    [#privilege_item{id = 62316, item_id = 20545,
                     is_self = 1, bind = 0, is_cast = 1, num = 3,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 20014,
                     is_self = 1, bind = 0, is_cast = 1, num = 1,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 29102,
                     is_self = 1, bind = 0, is_cast = 1, num = 3,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 20075,
                     is_self = 1, bind = 0, is_cast = 1, num = 1,
                     weigth = 40},
     #privilege_item{id = 62316, item_id = 20076,
                     is_self = 1, bind = 0, is_cast = 1, num = 1,
                     weigth = 60},
     #privilege_item{id = 62316, item_id = 20022,
                     is_self = 1, bind = 0, is_cast = 1, num = 2,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 21101,
                     is_self = 1, bind = 0, is_cast = 1, num = 1,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 20095,
                     is_self = 1, bind = 0, is_cast = 1, num = 1,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 22585,
                     is_self = 1, bind = 0, is_cast = 1, num = 2,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 22216,
                     is_self = 1, bind = 0, is_cast = 1, num = 2,
                     weigth = 100},
     #privilege_item{id = 62316, item_id = 20000,
                     is_self = 1, bind = 0, is_cast = 1, num = 3,
                     weigth = 100}];
get_box(_) -> [].

get_next_lev(10) -> 20;
get_next_lev(20) -> 30;
get_next_lev(30) -> 40;
get_next_lev(40) -> 50;
get_next_lev(50) -> 60;
get_next_lev(60) -> 70;
get_next_lev(70) -> 80;
get_next_lev(80) -> 90;
get_next_lev(90) -> 95;
get_next_lev(95) -> 100;
get_next_lev(100) -> 110;
get_next_lev(110) -> 120;
get_next_lev(120) -> 130;
get_next_lev(130) -> 0;
get_next_lev(_) -> 0.

all_gift() -> [1].

get_gift(1) ->
    #privilege_gift{id = 1, need_val = 1,
                    reward = [{1, 0, 1}], privileges = [1, 2, 3],
                    title = "1", content = "1",
                    client_show = ["1", "2", "3"], mail_title = "1",
                    mail_content = "1"};
get_gift(_) -> false.

get_privilege(1) -> {102, 5, []};
get_privilege(2) -> {103, 1, []};
get_privilege(3) -> {104, 18000, []};
get_privilege(4) -> {105, 200, []};
get_privilege(5) -> {109, 1, [{20005, 5}, {20025, 5}]};
get_privilege(6) -> {106, 1, []};
get_privilege(7) -> {113, 2, []};
get_privilege(8) -> {101, 10, []};
get_privilege(_) -> false.

get_gift_by_charge(1) ->
    #privilege_gift{id = 1, need_val = 1,
                    reward = [{1, 0, 1}], privileges = [1, 2, 3],
                    title = "1", content = "1",
                    client_show = ["1", "2", "3"], mail_title = "1",
                    mail_content = "1"};
get_gift_by_charge(_) -> false.

get_extra_cfg() ->
    [#{mail_title => "1", mail_content => "1"}].

