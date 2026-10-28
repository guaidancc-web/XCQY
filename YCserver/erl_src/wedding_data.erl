-file("src/data/wedding_data.erl", 1).

-module(wedding_data).

-export([points/1,
         reward/1,
         unit/1,
         exp/1,
         atmosp_reward/1,
         get_act/1,
         get_unit/1,
         get_box/1,
         get_rank_honor_types/0,
         get_rank_honor_type/1,
         get_rank_honors/1,
         get_rank_honor/1,
         get_wedding_discount_price/1,
         get_cash_honor/1,
         get_memorial_day/1,
         list_cash_honor/0,
         list_memorial_day/0,
         get_history_box/1,
         get_history_maze/1,
         get_whiteday/1,
         get_whiteday_votive/1]).

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

-file("src/data/wedding_data.erl", 29).

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

-file("src/data/wedding_data.erl", 30).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/data/wedding_data.erl", 31).

points(1) ->
    [{286, 1356, 5},
     {471, 1269, 5},
     {760, 1124, 5},
     {984, 1015, 5},
     {1209, 904, 5}];
points(2) ->
    [{254, 1338, 5},
     {439, 1251, 5},
     {728, 1106, 5},
     {952, 997, 5},
     {1177, 886, 5}];
points(3) ->
    [{613, 985, 7},
     {910, 1252, 3},
     {853, 1286, 3},
     {796, 1315, 3},
     {717, 1342, 3},
     {643, 1382, 3}];
points(_) -> [].

reward({2, 1}) ->
    {lang:get("你们顺利完成了典礼，祝福你们！这是赠送给你的喜结良缘礼物哦！"),
     [{29138, 1, 1}, {29142, 0, 20}]};
reward({2, 0}) ->
    {lang:get("你们顺利完成了典礼，祝福你们！这是赠送给你的喜结良缘礼物哦！"),
     [{29138, 1, 1}, {29142, 0, 20}]};
reward({1, 1}) ->
    {lang:get("你们顺利完成了典礼，祝福你们！这是赠送给你的喜结良缘礼物哦！"),
     [{29142, 0, 10}]};
reward({1, 0}) ->
    {lang:get("你们顺利完成了典礼，祝福你们！这是赠送给你的喜结良缘礼物哦！"),
     [{29142, 0, 10}]};
reward(_) -> {"", []}.

unit(_) -> false.

exp({1, Lev}) when Lev >= 1 andalso Lev =< 1 -> 10;
exp({1, Lev}) when Lev >= 2 andalso Lev =< 2 -> 10;
exp({1, Lev}) when Lev >= 3 andalso Lev =< 3 -> 10;
exp({1, Lev}) when Lev >= 4 andalso Lev =< 4 -> 10;
exp({1, Lev}) when Lev >= 5 andalso Lev =< 5 -> 10;
exp({1, Lev}) when Lev >= 6 andalso Lev =< 6 -> 10;
exp({1, Lev}) when Lev >= 7 andalso Lev =< 7 -> 10;
exp({1, Lev}) when Lev >= 8 andalso Lev =< 8 -> 10;
exp({1, Lev}) when Lev >= 9 andalso Lev =< 9 -> 10;
exp({1, Lev}) when Lev >= 10 andalso Lev =< 10 -> 10;
exp({1, Lev}) when Lev >= 11 andalso Lev =< 11 -> 10;
exp({1, Lev}) when Lev >= 12 andalso Lev =< 12 -> 10;
exp({1, Lev}) when Lev >= 13 andalso Lev =< 13 -> 10;
exp({1, Lev}) when Lev >= 14 andalso Lev =< 14 -> 10;
exp({1, Lev}) when Lev >= 15 andalso Lev =< 15 -> 10;
exp({1, Lev}) when Lev >= 16 andalso Lev =< 16 -> 10;
exp({1, Lev}) when Lev >= 17 andalso Lev =< 17 -> 10;
exp({1, Lev}) when Lev >= 18 andalso Lev =< 18 -> 10;
exp({1, Lev}) when Lev >= 19 andalso Lev =< 19 -> 10;
exp({1, Lev}) when Lev >= 20 andalso Lev =< 20 -> 10;
exp({1, Lev}) when Lev >= 21 andalso Lev =< 21 -> 10;
exp({1, Lev}) when Lev >= 22 andalso Lev =< 22 -> 10;
exp({1, Lev}) when Lev >= 23 andalso Lev =< 23 -> 10;
exp({1, Lev}) when Lev >= 24 andalso Lev =< 24 -> 10;
exp({1, Lev}) when Lev >= 25 andalso Lev =< 25 -> 10;
exp({1, Lev}) when Lev >= 26 andalso Lev =< 26 -> 10;
exp({1, Lev}) when Lev >= 27 andalso Lev =< 27 -> 10;
exp({1, Lev}) when Lev >= 28 andalso Lev =< 28 -> 10;
exp({1, Lev}) when Lev >= 29 andalso Lev =< 29 -> 10;
exp({1, Lev}) when Lev >= 30 andalso Lev =< 30 -> 987;
exp({1, Lev}) when Lev >= 31 andalso Lev =< 31 -> 1046;
exp({1, Lev}) when Lev >= 32 andalso Lev =< 32 -> 1075;
exp({1, Lev}) when Lev >= 33 andalso Lev =< 33 -> 1080;
exp({1, Lev}) when Lev >= 34 andalso Lev =< 34 -> 1117;
exp({1, Lev}) when Lev >= 35 andalso Lev =< 35 -> 1141;
exp({1, Lev}) when Lev >= 36 andalso Lev =< 36 -> 1139;
exp({1, Lev}) when Lev >= 37 andalso Lev =< 37 -> 1152;
exp({1, Lev}) when Lev >= 38 andalso Lev =< 38 -> 1181;
exp({1, Lev}) when Lev >= 39 andalso Lev =< 39 -> 1201;
exp({1, Lev}) when Lev >= 40 andalso Lev =< 40 -> 1220;
exp({1, Lev}) when Lev >= 41 andalso Lev =< 41 -> 1267;
exp({1, Lev}) when Lev >= 42 andalso Lev =< 42 -> 1290;
exp({1, Lev}) when Lev >= 43 andalso Lev =< 43 -> 1308;
exp({1, Lev}) when Lev >= 44 andalso Lev =< 44 -> 1324;
exp({1, Lev}) when Lev >= 45 andalso Lev =< 45 -> 1345;
exp({1, Lev}) when Lev >= 46 andalso Lev =< 46 -> 1359;
exp({1, Lev}) when Lev >= 47 andalso Lev =< 47 -> 1379;
exp({1, Lev}) when Lev >= 48 andalso Lev =< 48 -> 1392;
exp({1, Lev}) when Lev >= 49 andalso Lev =< 49 -> 1415;
exp({1, Lev}) when Lev >= 50 andalso Lev =< 50 -> 1434;
exp({1, Lev}) when Lev >= 51 andalso Lev =< 51 -> 1451;
exp({1, Lev}) when Lev >= 52 andalso Lev =< 52 -> 1469;
exp({1, Lev}) when Lev >= 53 andalso Lev =< 53 -> 1491;
exp({1, Lev}) when Lev >= 54 andalso Lev =< 54 -> 1511;
exp({1, Lev}) when Lev >= 55 andalso Lev =< 55 -> 1528;
exp({1, Lev}) when Lev >= 56 andalso Lev =< 56 -> 1580;
exp({1, Lev}) when Lev >= 57 andalso Lev =< 57 -> 1598;
exp({1, Lev}) when Lev >= 58 andalso Lev =< 58 -> 1621;
exp({1, Lev}) when Lev >= 59 andalso Lev =< 59 -> 1639;
exp({1, Lev}) when Lev >= 60 andalso Lev =< 60 -> 1656;
exp({1, Lev}) when Lev >= 61 andalso Lev =< 61 -> 1711;
exp({1, Lev}) when Lev >= 62 andalso Lev =< 62 -> 1731;
exp({1, Lev}) when Lev >= 63 andalso Lev =< 63 -> 1751;
exp({1, Lev}) when Lev >= 64 andalso Lev =< 64 -> 1769;
exp({1, Lev}) when Lev >= 65 andalso Lev =< 65 -> 1788;
exp({1, Lev}) when Lev >= 66 andalso Lev =< 66 -> 1808;
exp({1, Lev}) when Lev >= 67 andalso Lev =< 67 -> 1829;
exp({1, Lev}) when Lev >= 68 andalso Lev =< 68 -> 1850;
exp({1, Lev}) when Lev >= 69 andalso Lev =< 69 -> 1870;
exp({1, Lev}) when Lev >= 70 andalso Lev =< 70 -> 1887;
exp({1, Lev}) when Lev >= 71 andalso Lev =< 71 -> 1907;
exp({1, Lev}) when Lev >= 72 andalso Lev =< 72 -> 1927;
exp({1, Lev}) when Lev >= 73 andalso Lev =< 73 -> 1948;
exp({1, Lev}) when Lev >= 74 andalso Lev =< 74 -> 1968;
exp({1, Lev}) when Lev >= 75 andalso Lev =< 75 -> 1989;
exp({1, Lev}) when Lev >= 76 andalso Lev =< 76 -> 2009;
exp({1, Lev}) when Lev >= 77 andalso Lev =< 77 -> 2030;
exp({1, Lev}) when Lev >= 78 andalso Lev =< 78 -> 2051;
exp({1, Lev}) when Lev >= 79 andalso Lev =< 79 -> 2071;
exp({1, Lev}) when Lev >= 80 andalso Lev =< 80 -> 2091;
exp({1, Lev}) when Lev >= 81 andalso Lev =< 81 -> 2248;
exp({1, Lev}) when Lev >= 82 andalso Lev =< 82 -> 2273;
exp({1, Lev}) when Lev >= 83 andalso Lev =< 83 -> 2294;
exp({1, Lev}) when Lev >= 84 andalso Lev =< 84 -> 2314;
exp({1, Lev}) when Lev >= 85 andalso Lev =< 85 -> 2335;
exp({1, Lev}) when Lev >= 86 andalso Lev =< 86 -> 2355;
exp({1, Lev}) when Lev >= 87 andalso Lev =< 87 -> 2375;
exp({1, Lev}) when Lev >= 88 andalso Lev =< 88 -> 2400;
exp({1, Lev}) when Lev >= 89 andalso Lev =< 89 -> 2421;
exp({1, Lev}) when Lev >= 90 andalso Lev =< 90 -> 2441;
exp({1, Lev}) when Lev >= 91 andalso Lev =< 91 -> 2461;
exp({1, Lev}) when Lev >= 92 andalso Lev =< 92 -> 2486;
exp({1, Lev}) when Lev >= 93 andalso Lev =< 93 -> 2507;
exp({1, Lev}) when Lev >= 94 andalso Lev =< 94 -> 2527;
exp({1, Lev}) when Lev >= 95 andalso Lev =< 95 -> 2552;
exp({1, Lev}) when Lev >= 96 andalso Lev =< 96 -> 2572;
exp({1, Lev}) when Lev >= 97 andalso Lev =< 97 -> 2593;
exp({1, Lev}) when Lev >= 98 andalso Lev =< 98 -> 2617;
exp({1, Lev}) when Lev >= 99 andalso Lev =< 99 -> 2638;
exp({1, Lev}) when Lev >= 100 andalso Lev =< 100 ->
    2658;
exp({1, Lev}) when Lev >= 101 andalso Lev =< 101 ->
    2684;
exp({1, Lev}) when Lev >= 102 andalso Lev =< 102 ->
    2710;
exp({1, Lev}) when Lev >= 103 andalso Lev =< 103 ->
    2737;
exp({1, Lev}) when Lev >= 104 andalso Lev =< 104 ->
    2764;
exp({1, Lev}) when Lev >= 105 andalso Lev =< 105 ->
    2791;
exp({1, Lev}) when Lev >= 106 andalso Lev =< 106 ->
    2818;
exp({1, Lev}) when Lev >= 107 andalso Lev =< 107 ->
    2846;
exp({1, Lev}) when Lev >= 108 andalso Lev =< 108 ->
    2874;
exp({1, Lev}) when Lev >= 109 andalso Lev =< 109 ->
    2902;
exp({1, Lev}) when Lev >= 110 andalso Lev =< 110 ->
    2931;
exp({1, Lev}) when Lev >= 111 andalso Lev =< 111 ->
    2960;
exp({1, Lev}) when Lev >= 112 andalso Lev =< 112 ->
    2989;
exp({1, Lev}) when Lev >= 113 andalso Lev =< 113 ->
    3018;
exp({1, Lev}) when Lev >= 114 andalso Lev =< 114 ->
    3048;
exp({1, Lev}) when Lev >= 115 andalso Lev =< 115 ->
    3078;
exp({1, Lev}) when Lev >= 116 andalso Lev =< 116 ->
    3108;
exp({1, Lev}) when Lev >= 117 andalso Lev =< 117 ->
    3139;
exp({1, Lev}) when Lev >= 118 andalso Lev =< 118 ->
    3170;
exp({1, Lev}) when Lev >= 119 andalso Lev =< 119 ->
    3201;
exp({1, Lev}) when Lev >= 120 andalso Lev =< 120 ->
    3233;
exp({1, Lev}) when Lev >= 121 andalso Lev =< 121 ->
    3233;
exp({1, Lev}) when Lev >= 122 andalso Lev =< 122 ->
    3233;
exp({1, Lev}) when Lev >= 123 andalso Lev =< 123 ->
    3233;
exp({1, Lev}) when Lev >= 124 andalso Lev =< 124 ->
    3233;
exp({1, Lev}) when Lev >= 125 andalso Lev =< 125 ->
    3233;
exp({1, Lev}) when Lev >= 126 andalso Lev =< 126 ->
    3233;
exp({1, Lev}) when Lev >= 127 andalso Lev =< 127 ->
    3233;
exp({1, Lev}) when Lev >= 128 andalso Lev =< 128 ->
    3233;
exp({1, Lev}) when Lev >= 129 andalso Lev =< 129 ->
    3233;
exp({1, Lev}) when Lev >= 130 andalso Lev =< 130 ->
    3233;
exp({2, Lev}) when Lev >= 1 andalso Lev =< 1 -> 10;
exp({2, Lev}) when Lev >= 2 andalso Lev =< 2 -> 10;
exp({2, Lev}) when Lev >= 3 andalso Lev =< 3 -> 10;
exp({2, Lev}) when Lev >= 4 andalso Lev =< 4 -> 10;
exp({2, Lev}) when Lev >= 5 andalso Lev =< 5 -> 10;
exp({2, Lev}) when Lev >= 6 andalso Lev =< 6 -> 10;
exp({2, Lev}) when Lev >= 7 andalso Lev =< 7 -> 10;
exp({2, Lev}) when Lev >= 8 andalso Lev =< 8 -> 10;
exp({2, Lev}) when Lev >= 9 andalso Lev =< 9 -> 10;
exp({2, Lev}) when Lev >= 10 andalso Lev =< 10 -> 10;
exp({2, Lev}) when Lev >= 11 andalso Lev =< 11 -> 10;
exp({2, Lev}) when Lev >= 12 andalso Lev =< 12 -> 10;
exp({2, Lev}) when Lev >= 13 andalso Lev =< 13 -> 10;
exp({2, Lev}) when Lev >= 14 andalso Lev =< 14 -> 10;
exp({2, Lev}) when Lev >= 15 andalso Lev =< 15 -> 10;
exp({2, Lev}) when Lev >= 16 andalso Lev =< 16 -> 10;
exp({2, Lev}) when Lev >= 17 andalso Lev =< 17 -> 10;
exp({2, Lev}) when Lev >= 18 andalso Lev =< 18 -> 10;
exp({2, Lev}) when Lev >= 19 andalso Lev =< 19 -> 10;
exp({2, Lev}) when Lev >= 20 andalso Lev =< 20 -> 10;
exp({2, Lev}) when Lev >= 21 andalso Lev =< 21 -> 10;
exp({2, Lev}) when Lev >= 22 andalso Lev =< 22 -> 10;
exp({2, Lev}) when Lev >= 23 andalso Lev =< 23 -> 10;
exp({2, Lev}) when Lev >= 24 andalso Lev =< 24 -> 10;
exp({2, Lev}) when Lev >= 25 andalso Lev =< 25 -> 10;
exp({2, Lev}) when Lev >= 26 andalso Lev =< 26 -> 10;
exp({2, Lev}) when Lev >= 27 andalso Lev =< 27 -> 10;
exp({2, Lev}) when Lev >= 28 andalso Lev =< 28 -> 10;
exp({2, Lev}) when Lev >= 29 andalso Lev =< 29 -> 10;
exp({2, Lev}) when Lev >= 30 andalso Lev =< 30 -> 2370;
exp({2, Lev}) when Lev >= 31 andalso Lev =< 31 -> 2511;
exp({2, Lev}) when Lev >= 32 andalso Lev =< 32 -> 2581;
exp({2, Lev}) when Lev >= 33 andalso Lev =< 33 -> 2592;
exp({2, Lev}) when Lev >= 34 andalso Lev =< 34 -> 2682;
exp({2, Lev}) when Lev >= 35 andalso Lev =< 35 -> 2738;
exp({2, Lev}) when Lev >= 36 andalso Lev =< 36 -> 2734;
exp({2, Lev}) when Lev >= 37 andalso Lev =< 37 -> 2764;
exp({2, Lev}) when Lev >= 38 andalso Lev =< 38 -> 2835;
exp({2, Lev}) when Lev >= 39 andalso Lev =< 39 -> 2882;
exp({2, Lev}) when Lev >= 40 andalso Lev =< 40 -> 2929;
exp({2, Lev}) when Lev >= 41 andalso Lev =< 41 -> 3040;
exp({2, Lev}) when Lev >= 42 andalso Lev =< 42 -> 3097;
exp({2, Lev}) when Lev >= 43 andalso Lev =< 43 -> 3140;
exp({2, Lev}) when Lev >= 44 andalso Lev =< 44 -> 3177;
exp({2, Lev}) when Lev >= 45 andalso Lev =< 45 -> 3229;
exp({2, Lev}) when Lev >= 46 andalso Lev =< 46 -> 3261;
exp({2, Lev}) when Lev >= 47 andalso Lev =< 47 -> 3310;
exp({2, Lev}) when Lev >= 48 andalso Lev =< 48 -> 3342;
exp({2, Lev}) when Lev >= 49 andalso Lev =< 49 -> 3397;
exp({2, Lev}) when Lev >= 50 andalso Lev =< 50 -> 3442;
exp({2, Lev}) when Lev >= 51 andalso Lev =< 51 -> 3483;
exp({2, Lev}) when Lev >= 52 andalso Lev =< 52 -> 3525;
exp({2, Lev}) when Lev >= 53 andalso Lev =< 53 -> 3579;
exp({2, Lev}) when Lev >= 54 andalso Lev =< 54 -> 3626;
exp({2, Lev}) when Lev >= 55 andalso Lev =< 55 -> 3668;
exp({2, Lev}) when Lev >= 56 andalso Lev =< 56 -> 3792;
exp({2, Lev}) when Lev >= 57 andalso Lev =< 57 -> 3835;
exp({2, Lev}) when Lev >= 58 andalso Lev =< 58 -> 3890;
exp({2, Lev}) when Lev >= 59 andalso Lev =< 59 -> 3933;
exp({2, Lev}) when Lev >= 60 andalso Lev =< 60 -> 3975;
exp({2, Lev}) when Lev >= 61 andalso Lev =< 61 -> 4107;
exp({2, Lev}) when Lev >= 62 andalso Lev =< 62 -> 4155;
exp({2, Lev}) when Lev >= 63 andalso Lev =< 63 -> 4203;
exp({2, Lev}) when Lev >= 64 andalso Lev =< 64 -> 4245;
exp({2, Lev}) when Lev >= 65 andalso Lev =< 65 -> 4292;
exp({2, Lev}) when Lev >= 66 andalso Lev =< 66 -> 4340;
exp({2, Lev}) when Lev >= 67 andalso Lev =< 67 -> 4389;
exp({2, Lev}) when Lev >= 68 andalso Lev =< 68 -> 4440;
exp({2, Lev}) when Lev >= 69 andalso Lev =< 69 -> 4488;
exp({2, Lev}) when Lev >= 70 andalso Lev =< 70 -> 4528;
exp({2, Lev}) when Lev >= 71 andalso Lev =< 71 -> 4578;
exp({2, Lev}) when Lev >= 72 andalso Lev =< 72 -> 4626;
exp({2, Lev}) when Lev >= 73 andalso Lev =< 73 -> 4675;
exp({2, Lev}) when Lev >= 74 andalso Lev =< 74 -> 4724;
exp({2, Lev}) when Lev >= 75 andalso Lev =< 75 -> 4773;
exp({2, Lev}) when Lev >= 76 andalso Lev =< 76 -> 4822;
exp({2, Lev}) when Lev >= 77 andalso Lev =< 77 -> 4873;
exp({2, Lev}) when Lev >= 78 andalso Lev =< 78 -> 4922;
exp({2, Lev}) when Lev >= 79 andalso Lev =< 79 -> 4971;
exp({2, Lev}) when Lev >= 80 andalso Lev =< 80 -> 5019;
exp({2, Lev}) when Lev >= 81 andalso Lev =< 81 -> 5396;
exp({2, Lev}) when Lev >= 82 andalso Lev =< 82 -> 5455;
exp({2, Lev}) when Lev >= 83 andalso Lev =< 83 -> 5505;
exp({2, Lev}) when Lev >= 84 andalso Lev =< 84 -> 5554;
exp({2, Lev}) when Lev >= 85 andalso Lev =< 85 -> 5604;
exp({2, Lev}) when Lev >= 86 andalso Lev =< 86 -> 5652;
exp({2, Lev}) when Lev >= 87 andalso Lev =< 87 -> 5701;
exp({2, Lev}) when Lev >= 88 andalso Lev =< 88 -> 5761;
exp({2, Lev}) when Lev >= 89 andalso Lev =< 89 -> 5810;
exp({2, Lev}) when Lev >= 90 andalso Lev =< 90 -> 5858;
exp({2, Lev}) when Lev >= 91 andalso Lev =< 91 -> 5907;
exp({2, Lev}) when Lev >= 92 andalso Lev =< 92 -> 5967;
exp({2, Lev}) when Lev >= 93 andalso Lev =< 93 -> 6016;
exp({2, Lev}) when Lev >= 94 andalso Lev =< 94 -> 6066;
exp({2, Lev}) when Lev >= 95 andalso Lev =< 95 -> 6124;
exp({2, Lev}) when Lev >= 96 andalso Lev =< 96 -> 6174;
exp({2, Lev}) when Lev >= 97 andalso Lev =< 97 -> 6223;
exp({2, Lev}) when Lev >= 98 andalso Lev =< 98 -> 6282;
exp({2, Lev}) when Lev >= 99 andalso Lev =< 99 -> 6331;
exp({2, Lev}) when Lev >= 100 andalso Lev =< 100 ->
    6380;
exp({2, Lev}) when Lev >= 101 andalso Lev =< 101 ->
    6443;
exp({2, Lev}) when Lev >= 102 andalso Lev =< 102 ->
    6507;
exp({2, Lev}) when Lev >= 103 andalso Lev =< 103 ->
    6572;
exp({2, Lev}) when Lev >= 104 andalso Lev =< 104 ->
    6637;
exp({2, Lev}) when Lev >= 105 andalso Lev =< 105 ->
    6703;
exp({2, Lev}) when Lev >= 106 andalso Lev =< 106 ->
    6770;
exp({2, Lev}) when Lev >= 107 andalso Lev =< 107 ->
    6837;
exp({2, Lev}) when Lev >= 108 andalso Lev =< 108 ->
    6905;
exp({2, Lev}) when Lev >= 109 andalso Lev =< 109 ->
    6974;
exp({2, Lev}) when Lev >= 110 andalso Lev =< 110 ->
    7043;
exp({2, Lev}) when Lev >= 111 andalso Lev =< 111 ->
    7113;
exp({2, Lev}) when Lev >= 112 andalso Lev =< 112 ->
    7184;
exp({2, Lev}) when Lev >= 113 andalso Lev =< 113 ->
    7255;
exp({2, Lev}) when Lev >= 114 andalso Lev =< 114 ->
    7327;
exp({2, Lev}) when Lev >= 115 andalso Lev =< 115 ->
    7400;
exp({2, Lev}) when Lev >= 116 andalso Lev =< 116 ->
    7474;
exp({2, Lev}) when Lev >= 117 andalso Lev =< 117 ->
    7548;
exp({2, Lev}) when Lev >= 118 andalso Lev =< 118 ->
    7623;
exp({2, Lev}) when Lev >= 119 andalso Lev =< 119 ->
    7699;
exp({2, Lev}) when Lev >= 120 andalso Lev =< 120 ->
    7775;
exp({2, Lev}) when Lev >= 121 andalso Lev =< 121 ->
    7775;
exp({2, Lev}) when Lev >= 122 andalso Lev =< 122 ->
    7775;
exp({2, Lev}) when Lev >= 123 andalso Lev =< 123 ->
    7775;
exp({2, Lev}) when Lev >= 124 andalso Lev =< 124 ->
    7775;
exp({2, Lev}) when Lev >= 125 andalso Lev =< 125 ->
    7775;
exp({2, Lev}) when Lev >= 126 andalso Lev =< 126 ->
    7775;
exp({2, Lev}) when Lev >= 127 andalso Lev =< 127 ->
    7775;
exp({2, Lev}) when Lev >= 128 andalso Lev =< 128 ->
    7775;
exp({2, Lev}) when Lev >= 129 andalso Lev =< 129 ->
    7775;
exp({2, Lev}) when Lev >= 130 andalso Lev =< 130 ->
    7775;
exp({2, Lev}) when Lev >= 131 andalso Lev =< 131 ->
    7775;
exp({2, Lev}) when Lev >= 132 andalso Lev =< 132 ->
    7775;
exp({2, Lev}) when Lev >= 133 andalso Lev =< 133 ->
    7775;
exp(_) -> 0.

atmosp_reward({1, Val})
    when Val >= 1 andalso Val =< 398 ->
    #wedding_atmosp_data{type = 1, min_val = 1,
                         max_val = 398};
atmosp_reward({1, Val})
    when Val >= 399 andalso Val =< 698 ->
    #wedding_atmosp_data{type = 1, min_val = 399,
                         max_val = 698, male_reward = [{90018, 30}, {29143, 1}],
                         famale_reward = [{90018, 30}, {29143, 1}],
                         title = lang:get("浪漫值399奖励"),
                         content = lang:get("你与伴侣举办的典礼浪漫值达到399！恭喜！")};
atmosp_reward({1, Val})
    when Val >= 699 andalso Val =< 998 ->
    #wedding_atmosp_data{type = 1, min_val = 699,
                         max_val = 998,
                         male_reward = [{90018, 100}, {29138, 1}],
                         famale_reward = [{90018, 100}, {29138, 1}],
                         title = lang:get("浪漫值699奖励"),
                         content = lang:get("你与伴侣举办的典礼浪漫值达到699！真是令人羡慕！")};
atmosp_reward({1, Val})
    when Val >= 999 andalso Val =< 99999 ->
    #wedding_atmosp_data{type = 1, min_val = 999,
                         max_val = 99999,
                         male_reward = [{90018, 200}, {20032, 1}],
                         famale_reward = [{90018, 200}, {20032, 1}],
                         title = lang:get("浪漫值999奖励"),
                         content =
                             lang:get("你与伴侣举办的典礼浪漫值达到999！可称得上是最浪漫的典礼之一！")};
atmosp_reward({2, Val})
    when Val >= 1 andalso Val =< 398 ->
    #wedding_atmosp_data{type = 2, min_val = 1,
                         max_val = 398};
atmosp_reward({2, Val})
    when Val >= 399 andalso Val =< 698 ->
    #wedding_atmosp_data{type = 2, min_val = 399,
                         max_val = 698, male_reward = [{90018, 30}, {29143, 1}],
                         famale_reward = [{90018, 30}, {29143, 1}],
                         title = lang:get("浪漫值399奖励"),
                         content = lang:get("你与伴侣举办的典礼浪漫值达到399！恭喜！")};
atmosp_reward({2, Val})
    when Val >= 699 andalso Val =< 998 ->
    #wedding_atmosp_data{type = 2, min_val = 699,
                         max_val = 998,
                         male_reward = [{90018, 100}, {29138, 1}],
                         famale_reward = [{90018, 100}, {29138, 1}],
                         title = lang:get("浪漫值699奖励"),
                         content = lang:get("你与伴侣举办的典礼浪漫值达到699！真是令人羡慕！")};
atmosp_reward({2, Val})
    when Val >= 999 andalso Val =< 99999 ->
    #wedding_atmosp_data{type = 2, min_val = 999,
                         max_val = 99999,
                         male_reward = [{90018, 200}, {20032, 1}],
                         famale_reward = [{90018, 200}, {20032, 1}],
                         title = lang:get("浪漫值999奖励"),
                         content =
                             lang:get("你与伴侣举办的典礼浪漫值达到999！可称得上是最浪漫的典礼之一！")};
atmosp_reward(_) -> false.

get_act({1, 2, 1}) ->
    #wedding_act_data{id = 1, target = 1, type = 2,
                      free_num = 0, max_num = 5, cost = [{90002, 100}],
                      msg = lang:get("#role#为感谢各位，给大家派发了糖果"), atmosp = 20,
                      gain = [{90000, 29999}], effect_type = 1,
                      effect_id = 10036, effect_num = 5, cd = 180};
get_act({1, 2, 2}) ->
    #wedding_act_data{id = 1, target = 2, type = 2,
                      free_num = 0, max_num = 5, cost = [{90002, 100}],
                      msg = lang:get("#role#为感谢各位，给大家派发了糖果"), atmosp = 20,
                      gain = [{90000, 29999}], effect_type = 1,
                      effect_id = 10036, effect_num = 5, cd = 180};
get_act({2, 2, 1}) ->
    #wedding_act_data{id = 2, target = 1, type = 2,
                      free_num = 1, max_num = 20, cost = [{90000, 50000}],
                      atmosp = 2, effect_type = 3, effect_id = 30234,
                      cd = 30};
get_act({2, 2, 2}) ->
    #wedding_act_data{id = 2, target = 2, type = 2,
                      free_num = 1, max_num = 20, cost = [{90000, 50000}],
                      atmosp = 2, effect_type = 3, effect_id = 30234,
                      cd = 30};
get_act({2, 2, 3}) ->
    #wedding_act_data{id = 2, target = 3, type = 2,
                      free_num = 1, max_num = 30, cost = [{90000, 9999}],
                      log_msg =
                          lang:get("#role#急急忙忙的点燃了礼炮，浪漫值<color='#ffff00'>+1</color>"),
                      atmosp = 1, effect_type = 3, effect_id = 30074,
                      cd = 10};
get_act({5, 2, 3}) ->
    #wedding_act_data{id = 5, target = 3, type = 2,
                      free_num = 0, max_num = 10, cost = [{90002, 50}],
                      msg = lang:get("#role#心情澎湃，不由地抓起一把花向这对佳人撒去！"),
                      log_msg =
                          lang:get("#role#消耗<color='#ffff00'>50</color>{assets_2, "
                                   "90002}撒花，浪漫值<color='#ffff00'>+20</color>"),
                      atmosp = 20, gain = [{90013, 200}],
                      main_gain = [{90000, 18888}], effect_type = 3,
                      effect_id = 30065, cd = 30};
get_act({6, 2, 3}) ->
    #wedding_act_data{id = 6, target = 3, type = 2,
                      free_num = 1, max_num = 20, cost = [{90000, 9999}],
                      log_msg =
                          lang:get("#role#对新人发送弹幕祝福，浪漫值<color='#ffff00'>+1</color>"),
                      atmosp = 1, effect_type = 4, cd = 10};
get_act({1, 1, 1}) ->
    #wedding_act_data{id = 1, target = 1, type = 1,
                      free_num = 0, max_num = 5, cost = [{90002, 100}],
                      msg = lang:get("#role#为感谢各位，给大家派发了糖果"), atmosp = 20,
                      gain = [{90000, 29999}], effect_type = 1,
                      effect_id = 10036, effect_num = 5, cd = 180};
get_act({1, 1, 2}) ->
    #wedding_act_data{id = 1, target = 2, type = 1,
                      free_num = 0, max_num = 5, cost = [{90002, 100}],
                      msg = lang:get("#role#为感谢各位，给大家派发了糖果"), atmosp = 20,
                      gain = [{90000, 29999}], effect_type = 1,
                      effect_id = 10036, effect_num = 5, cd = 180};
get_act({2, 1, 1}) ->
    #wedding_act_data{id = 2, target = 1, type = 1,
                      free_num = 1, max_num = 20, cost = [{90000, 50000}],
                      atmosp = 2, effect_type = 3, effect_id = 30234,
                      cd = 30};
get_act({2, 1, 2}) ->
    #wedding_act_data{id = 2, target = 2, type = 1,
                      free_num = 1, max_num = 20, cost = [{90000, 50000}],
                      atmosp = 2, effect_type = 3, effect_id = 30234,
                      cd = 30};
get_act({2, 1, 3}) ->
    #wedding_act_data{id = 2, target = 3, type = 1,
                      free_num = 1, max_num = 30, cost = [{90000, 9999}],
                      log_msg =
                          lang:get("#role#急急忙忙的点燃了礼炮，浪漫值<color='#ffff00'>+1</color>"),
                      atmosp = 1, effect_type = 3, effect_id = 30074,
                      cd = 10};
get_act({5, 1, 3}) ->
    #wedding_act_data{id = 5, target = 3, type = 1,
                      free_num = 0, max_num = 10, cost = [{90002, 50}],
                      msg = lang:get("#role#心情澎湃，不由地抓起一把花向这对佳人撒去！"),
                      log_msg =
                          lang:get("#role#消耗<color='#ffff00'>50</color>{assets_2, "
                                   "90002}撒花，浪漫值<color='#ffff00'>+20</color>"),
                      atmosp = 20, gain = [{90013, 200}],
                      main_gain = [{90000, 18888}], effect_type = 3,
                      effect_id = 30065, cd = 30};
get_act({6, 1, 3}) ->
    #wedding_act_data{id = 6, target = 3, type = 1,
                      free_num = 1, max_num = 20, cost = [{90000, 9999}],
                      log_msg =
                          lang:get("#role#对新人发送弹幕祝福，浪漫值<color='#ffff00'>+1</color>"),
                      atmosp = 1, effect_type = 4, cd = 10};
get_act(_) -> false.

get_unit({10036, 1}) ->
    #wedding_unit_data{id = 10036, target = 1,
                       rand =
                           [{20005, 0, 2, 120, 0},
                            {20087, 0, 1, 40, 0},
                            {20006, 0, 8, 120, 0},
                            {20013, 0, 1, 30, 0},
                            {20088, 0, 1, 60, 0},
                            {20052, 0, 1, 180, 0},
                            {20031, 0, 1, 30, 0},
                            {20045, 0, 1, 30, 0},
                            {20046, 0, 1, 10, 0},
                            {21312, 0, 1, 90, 0},
                            {20020, 0, 2, 100, 0},
                            {20025, 0, 1, 50, 0},
                            {20021, 0, 1, 50, 0},
                            {22215, 0, 2, 70, 0},
                            {90000, 0, 200000, 20, 0}],
                       limit = 5};
get_unit({10036, 2}) ->
    #wedding_unit_data{id = 10036, target = 2,
                       rand =
                           [{20005, 0, 2, 120, 0},
                            {20087, 0, 1, 40, 0},
                            {20006, 0, 8, 120, 0},
                            {20013, 0, 1, 30, 0},
                            {20088, 0, 1, 60, 0},
                            {20052, 0, 1, 180, 0},
                            {20031, 0, 1, 30, 0},
                            {20045, 0, 1, 30, 0},
                            {20046, 0, 1, 10, 0},
                            {21312, 0, 1, 90, 0},
                            {20020, 0, 2, 100, 0},
                            {20025, 0, 1, 50, 0},
                            {20021, 0, 1, 50, 0},
                            {22215, 0, 2, 70, 0},
                            {90000, 0, 200000, 20, 0}],
                       limit = 5};
get_unit({10036, 3}) ->
    #wedding_unit_data{id = 10036, target = 3,
                       rand =
                           [{20005, 0, 1, 120, 0},
                            {20087, 0, 1, 40, 1},
                            {20006, 0, 3, 120, 0},
                            {20013, 0, 1, 30, 0},
                            {20088, 0, 1, 60, 0},
                            {20052, 0, 1, 180, 0},
                            {20031, 0, 1, 30, 0},
                            {20045, 0, 1, 30, 0},
                            {20046, 0, 1, 10, 1},
                            {21312, 0, 1, 90, 0},
                            {20020, 0, 1, 100, 0},
                            {20025, 0, 1, 50, 0},
                            {20021, 0, 1, 50, 0},
                            {22215, 0, 1, 70, 0},
                            {90000, 0, 200000, 20, 0}],
                       limit = 5};
get_unit({10045, 1}) ->
    #wedding_unit_data{id = 10045, target = 1,
                       rand =
                           [{20005, 0, 1, 0, 0},
                            {20087, 0, 1, 250, 1},
                            {20006, 0, 5, 0, 0},
                            {20013, 0, 1, 0, 0},
                            {20075, 0, 1, 50, 1},
                            {20076, 0, 1, 5, 1},
                            {20088, 0, 1, 60, 0},
                            {20089, 0, 1, 20, 1},
                            {20052, 0, 1, 0, 0},
                            {20095, 0, 1, 5, 1},
                            {20031, 0, 1, 300, 0},
                            {20045, 0, 1, 0, 0},
                            {20046, 0, 1, 230, 1},
                            {21312, 0, 2, 80, 0},
                            {20020, 0, 1, 0, 0}],
                       limit = 1};
get_unit({10045, 2}) ->
    #wedding_unit_data{id = 10045, target = 2,
                       rand =
                           [{20005, 0, 1, 0, 0},
                            {20087, 0, 1, 250, 1},
                            {20006, 0, 5, 0, 0},
                            {20013, 0, 1, 0, 0},
                            {20075, 0, 1, 50, 1},
                            {20076, 0, 1, 5, 1},
                            {20088, 0, 1, 60, 0},
                            {20089, 0, 1, 20, 1},
                            {20052, 0, 1, 0, 0},
                            {20095, 0, 1, 5, 1},
                            {20031, 0, 1, 300, 0},
                            {20045, 0, 1, 0, 0},
                            {20046, 0, 1, 230, 1},
                            {21312, 0, 2, 80, 0},
                            {20020, 0, 1, 0, 0}],
                       limit = 1};
get_unit({10045, 3}) ->
    #wedding_unit_data{id = 10045, target = 3,
                       rand =
                           [{20005, 0, 1, 195, 0},
                            {20087, 0, 1, 40, 1},
                            {20006, 0, 5, 200, 0},
                            {20013, 0, 1, 30, 0},
                            {20075, 0, 1, 10, 1},
                            {20076, 0, 1, 2, 1},
                            {20088, 0, 1, 20, 0},
                            {20089, 0, 1, 5, 1},
                            {20052, 0, 1, 167, 0},
                            {20095, 0, 1, 3, 1},
                            {20031, 0, 1, 75, 0},
                            {20045, 0, 1, 30, 0},
                            {20046, 0, 1, 10, 1},
                            {21312, 0, 1, 110, 0},
                            {20020, 0, 1, 103, 0}],
                       limit = 1};
get_unit(_) -> false.

get_box(29143) ->
    [#{item_id => 20006, bind => 0, num => 5, weigth => 150,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20004, bind => 0, num => 1, weigth => 16,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20005, bind => 0, num => 1, weigth => 16,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 29138, bind => 0, num => 1, weigth => 2,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 21312, bind => 0, num => 1, weigth => 50,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 22210, bind => 0, num => 1, weigth => 30,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 22211, bind => 0, num => 1, weigth => 10,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20025, bind => 0, num => 1, weigth => 20,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20013, bind => 0, num => 1, weigth => 30,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20020, bind => 0, num => 1, weigth => 69,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20021, bind => 0, num => 1, weigth => 10,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20008, bind => 0, num => 1, weigth => 10,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 22215, bind => 0, num => 1, weigth => 30,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 75},
     #{item_id => 90000, bind => 0, num => 200000,
       weigth => 15, show_weigth => 10, is_cast => 0,
       min_lev => 55, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 800000,
       weigth => 5, show_weigth => 10, is_cast => 1,
       min_lev => 75, max_lev => 200},
     #{item_id => 20088, bind => 0, num => 1, weigth => 18,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20615, bind => 0, num => 1, weigth => 8,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20045, bind => 0, num => 1, weigth => 25,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20046, bind => 0, num => 1, weigth => 6,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20060, bind => 0, num => 1, weigth => 10,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20091, bind => 0, num => 1, weigth => 30,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20087, bind => 0, num => 1, weigth => 30,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 21100, bind => 0, num => 1, weigth => 2,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20039, bind => 0, num => 1, weigth => 4,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20000, bind => 0, num => 1, weigth => 12,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20093, bind => 0, num => 1, weigth => 6,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20074, bind => 0, num => 1, weigth => 8,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20075, bind => 0, num => 1, weigth => 4,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20076, bind => 0, num => 1, weigth => 1,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20031, bind => 0, num => 1, weigth => 2,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20095, bind => 0, num => 1, weigth => 1,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20350, bind => 0, num => 1, weigth => 220,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 90000, bind => 0, num => 8900,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9100,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9000,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9200,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9300,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 8800,
       weigth => 25, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 20351, bind => 0, num => 1, weigth => 110,
       show_weigth => 10, is_cast => 0, min_lev => 45,
       max_lev => 200},
     #{item_id => 20352, bind => 0, num => 1, weigth => 50,
       show_weigth => 10, is_cast => 0, min_lev => 55,
       max_lev => 200},
     #{item_id => 20353, bind => 0, num => 1, weigth => 35,
       show_weigth => 10, is_cast => 1, min_lev => 65,
       max_lev => 200},
     #{item_id => 20354, bind => 0, num => 1, weigth => 25,
       show_weigth => 10, is_cast => 1, min_lev => 75,
       max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9000,
       weigth => 70, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 8800,
       weigth => 30, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 8900,
       weigth => 23, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200},
     #{item_id => 90000, bind => 0, num => 9100,
       weigth => 17, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200}];
get_box(29314) ->
    [#{item_id => 20000, bind => 0, num => 1, weigth => 566,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20006, bind => 0, num => 20, weigth => 566,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20045, bind => 0, num => 5, weigth => 566,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20046, bind => 0, num => 1, weigth => 566,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20025, bind => 0, num => 2, weigth => 566,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 22215, bind => 0, num => 10, weigth => 282,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20017, bind => 0, num => 1, weigth => 282,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20018, bind => 0, num => 1, weigth => 141,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20089, bind => 0, num => 1, weigth => 188,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20615, bind => 0, num => 1, weigth => 376,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20616, bind => 0, num => 1, weigth => 470,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20617, bind => 0, num => 1, weigth => 141,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 21101, bind => 0, num => 1, weigth => 423,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 21102, bind => 0, num => 1, weigth => 188,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20038, bind => 0, num => 1, weigth => 188,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20095, bind => 0, num => 1, weigth => 376,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20040, bind => 0, num => 1, weigth => 141,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20074, bind => 0, num => 1, weigth => 470,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20075, bind => 0, num => 1, weigth => 282,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20076, bind => 0, num => 1, weigth => 94,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20022, bind => 0, num => 1, weigth => 376,
       show_weigth => 10, is_cast => 0, min_lev => 1,
       max_lev => 200},
     #{item_id => 20009, bind => 0, num => 1, weigth => 470,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20010, bind => 0, num => 1, weigth => 188,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20011, bind => 0, num => 1, weigth => 94,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200},
     #{item_id => 20014, bind => 0, num => 1, weigth => 2000,
       show_weigth => 10, is_cast => 1, min_lev => 1,
       max_lev => 200}];
get_box(_) -> [].

get_rank_honor_types() -> [3, 4].

get_rank_honor_type(3) ->
    #wedding_rank_honor_type_data{type = 3,
                                  day = {week, 1}};
get_rank_honor_type(4) ->
    #wedding_rank_honor_type_data{type = 4,
                                  day = {open, 15}};
get_rank_honor_type(_) -> false.

get_rank_honors(3) -> [1];
get_rank_honors(4) -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
get_rank_honors(_) -> [].

get_rank_honor({3, 1}) ->
    #wedding_rank_honor_data{type = 3, rank = 1,
                             male_honor = 11067, female_honor = 11068};
get_rank_honor({4, 1}) ->
    #wedding_rank_honor_data{type = 4, rank = 1,
                             male_honor = 11076, female_honor = 11076,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 2}) ->
    #wedding_rank_honor_data{type = 4, rank = 2,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 3}) ->
    #wedding_rank_honor_data{type = 4, rank = 3,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 4}) ->
    #wedding_rank_honor_data{type = 4, rank = 4,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 5}) ->
    #wedding_rank_honor_data{type = 4, rank = 5,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 6}) ->
    #wedding_rank_honor_data{type = 4, rank = 6,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 7}) ->
    #wedding_rank_honor_data{type = 4, rank = 7,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 8}) ->
    #wedding_rank_honor_data{type = 4, rank = 8,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 9}) ->
    #wedding_rank_honor_data{type = 4, rank = 9,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor({4, 10}) ->
    #wedding_rank_honor_data{type = 4, rank = 10,
                             reward = [{22596, 1}], title = lang:get("开服恩爱榜奖励"),
                             content =
                                 lang:get("恭喜您在开服15天内恩爱历史榜排名前10，特赠送以下奖励")};
get_rank_honor(_) -> false.

get_wedding_discount_price(2) ->
    [#{start_time => {merge_time, 0, 0},
       end_time => {merge_time, 6, 86399}, label => gold,
       discount_price => 920},
     #{start_time => 1487001601, end_time => 1487087999,
       label => gold, discount_price => 920},
     #{start_time => 1489334401, end_time => 1489593599,
       label => gold, discount_price => 920},
     #{start_time => 1495209601, end_time => 1495468799,
       label => gold, discount_price => 920},
     #{start_time => 1503849601, end_time => 1504108799,
       label => gold, discount_price => 920},
     #{start_time => 1534435200, end_time => 1534694399,
       label => gold, discount_price => 920},
     #{start_time => 1549987200, end_time => 1550246399,
       label => gold, discount_price => 920},
     #{start_time => 1565107200, end_time => 1565366399,
       label => gold, discount_price => 920},
     #{start_time => 1581523200, end_time => 1581782399,
       label => gold, discount_price => 920}];
get_wedding_discount_price(1) ->
    [#{start_time => {merge_time, 0, 0},
       end_time => {merge_time, 6, 86399}, label => coin,
       discount_price => 1314520},
     #{start_time => 1487001601, end_time => 1487087999,
       label => coin, discount_price => 1314520},
     #{start_time => 1489334401, end_time => 1489593599,
       label => coin, discount_price => 1314520},
     #{start_time => 1495209601, end_time => 1495468799,
       label => coin, discount_price => 1314520},
     #{start_time => 1503849601, end_time => 1504108799,
       label => coin, discount_price => 1314520},
     #{start_time => 1534435200, end_time => 1534694399,
       label => coin, discount_price => 1314520},
     #{start_time => 1549987200, end_time => 1550246399,
       label => coin, discount_price => 1314520},
     #{start_time => 1565107200, end_time => 1565366399,
       label => coin, discount_price => 1314520},
     #{start_time => 1581523200, end_time => 1581782399,
       label => coin, discount_price => 1314520}];
get_wedding_discount_price(_) -> false.

get_cash_honor(1) ->
    #{male_id => 11224, female_id => 11225,
      activate => [{90018, 0}], switch => [{90018, 0}]};
get_cash_honor(2) ->
    #{male_id => 11200, female_id => 11201,
      activate => [{90018, 900}], switch => [{90018, 300}]};
get_cash_honor(3) ->
    #{male_id => 11202, female_id => 11203,
      activate => [{90018, 900}], switch => [{90018, 300}]};
get_cash_honor(4) ->
    #{male_id => 11216, female_id => 11217,
      activate => [{90018, 900}], switch => [{90018, 300}]};
get_cash_honor(5) ->
    #{male_id => 11210, female_id => 11211,
      activate => [{90018, 1500}], switch => [{90018, 300}]};
get_cash_honor(6) ->
    #{male_id => 11204, female_id => 11205,
      activate => [{90018, 1500}], switch => [{90018, 300}]};
get_cash_honor(7) ->
    #{male_id => 11206, female_id => 11207,
      activate => [{90018, 1500}], switch => [{90018, 300}]};
get_cash_honor(8) ->
    #{male_id => 11208, female_id => 11209,
      activate => [{90003, 50000}], switch => [{90018, 300}]};
get_cash_honor(9) ->
    #{male_id => 11212, female_id => 11213,
      activate => [{90003, 50000}], switch => [{90018, 300}]};
get_cash_honor(10) ->
    #{male_id => 11214, female_id => 11215,
      activate => [{90002, 399}], switch => [{90018, 300}]};
get_cash_honor(11) ->
    #{male_id => 11218, female_id => 11219,
      activate => [{90002, 399}], switch => [{90018, 300}]};
get_cash_honor(12) ->
    #{male_id => 11220, female_id => 11221,
      activate => [{90002, 666}], switch => [{90018, 300}]};
get_cash_honor(_) -> false.

get_memorial_day(1) -> {30, 22316};
get_memorial_day(2) -> {90, 22317};
get_memorial_day(3) -> {180, 22318};
get_memorial_day(4) -> {365, 22319};
get_memorial_day(_) -> false.

list_cash_honor() ->
    [1, 10, 11, 12, 2, 3, 4, 5, 6, 7, 8, 9].

list_memorial_day() ->
    [{1, 30}, {2, 90}, {3, 180}, {4, 365}].

get_history_box({23217, 0}) ->
    [#{id => 23217, weding_month => 0, item_id => 20000,
       bind => 0, num => 1, weigth => 816, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20006,
       bind => 0, num => 20, weigth => 816, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20045,
       bind => 0, num => 5, weigth => 816, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20046,
       bind => 0, num => 1, weigth => 816, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20025,
       bind => 0, num => 2, weigth => 816, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 22215,
       bind => 0, num => 10, weigth => 482, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20017,
       bind => 0, num => 1, weigth => 352, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20018,
       bind => 0, num => 1, weigth => 121, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20089,
       bind => 0, num => 1, weigth => 214, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20617,
       bind => 0, num => 1, weigth => 101, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 21102,
       bind => 0, num => 1, weigth => 122, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20038,
       bind => 0, num => 1, weigth => 122, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20095,
       bind => 0, num => 1, weigth => 306, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20040,
       bind => 0, num => 1, weigth => 111, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20075,
       bind => 0, num => 1, weigth => 152, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20076,
       bind => 0, num => 1, weigth => 64, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]},
     #{id => 23217, weding_month => 0, item_id => 20014,
       bind => 0, num => 1, weigth => 1000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 66}]}];
get_history_box({23217, 1}) ->
    [#{id => 23217, weding_month => 1, item_id => 20000,
       bind => 0, num => 1, weigth => 716, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20006,
       bind => 0, num => 20, weigth => 716, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20045,
       bind => 0, num => 5, weigth => 716, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20046,
       bind => 0, num => 1, weigth => 716, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20025,
       bind => 0, num => 2, weigth => 716, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 22215,
       bind => 0, num => 10, weigth => 482, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20017,
       bind => 0, num => 1, weigth => 352, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20018,
       bind => 0, num => 1, weigth => 121, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20089,
       bind => 0, num => 1, weigth => 214, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20617,
       bind => 0, num => 1, weigth => 101, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 21102,
       bind => 0, num => 1, weigth => 122, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20038,
       bind => 0, num => 1, weigth => 122, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20095,
       bind => 0, num => 1, weigth => 306, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20040,
       bind => 0, num => 1, weigth => 111, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20075,
       bind => 0, num => 1, weigth => 152, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20076,
       bind => 0, num => 1, weigth => 64, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]},
     #{id => 23217, weding_month => 1, item_id => 20014,
       bind => 0, num => 1, weigth => 1500, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 99}]}];
get_history_box({23217, 2}) ->
    [#{id => 23217, weding_month => 2, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]},
     #{id => 23217, weding_month => 2, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 134}]}];
get_history_box({23217, 3}) ->
    [#{id => 23217, weding_month => 3, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]},
     #{id => 23217, weding_month => 3, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 169}]}];
get_history_box({23217, 4}) ->
    [#{id => 23217, weding_month => 4, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]},
     #{id => 23217, weding_month => 4, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 199}]}];
get_history_box({23217, 5}) ->
    [#{id => 23217, weding_month => 5, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]},
     #{id => 23217, weding_month => 5, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 234}]}];
get_history_box({23217, 6}) ->
    [#{id => 23217, weding_month => 6, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]},
     #{id => 23217, weding_month => 6, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 266}]}];
get_history_box({23217, 7}) ->
    [#{id => 23217, weding_month => 7, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]},
     #{id => 23217, weding_month => 7, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 299}]}];
get_history_box({23217, 8}) ->
    [#{id => 23217, weding_month => 8, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]},
     #{id => 23217, weding_month => 8, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 314}]}];
get_history_box({23217, 9}) ->
    [#{id => 23217, weding_month => 9, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]},
     #{id => 23217, weding_month => 9, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 366}]}];
get_history_box({23217, 10}) ->
    [#{id => 23217, weding_month => 10, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]},
     #{id => 23217, weding_month => 10, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 399}]}];
get_history_box({23217, 11}) ->
    [#{id => 23217, weding_month => 11, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 11, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]}];
get_history_box({23217, 12}) ->
    [#{id => 23217, weding_month => 12, item_id => 20000,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20006,
       bind => 0, num => 20, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20045,
       bind => 0, num => 5, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20046,
       bind => 0, num => 1, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20025,
       bind => 0, num => 2, weigth => 566, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 22215,
       bind => 0, num => 10, weigth => 282, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20017,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20018,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20089,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20615,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20616,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20617,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 21101,
       bind => 0, num => 1, weigth => 423, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 21102,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20038,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20095,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20040,
       bind => 0, num => 1, weigth => 141, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20074,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20075,
       bind => 0, num => 1, weigth => 282, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20076,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20022,
       bind => 0, num => 1, weigth => 376, show_weigth => 10,
       is_cast => 0, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20009,
       bind => 0, num => 1, weigth => 470, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20010,
       bind => 0, num => 1, weigth => 188, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20011,
       bind => 0, num => 1, weigth => 94, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]},
     #{id => 23217, weding_month => 12, item_id => 20014,
       bind => 0, num => 1, weigth => 2000, show_weigth => 10,
       is_cast => 1, min_lev => 1, max_lev => 200,
       reward => [{90034, 520}]}];
get_history_box(_) -> [].

get_history_maze(23217) ->
    [#{id => 23217, item_id => 20000, bind => 0, num => 1,
       weigth => 816, show_weigth => 10, is_cast => 0,
       min_lev => 1, max_lev => 200, reward => [{90034, 66}]}];
get_history_maze(_) -> [].

get_whiteday({1, 2}) ->
    [{29600, 0, 15, 550, 0},
     {29600, 0, 1, 225, 0},
     {29600, 0, 1, 170, 0},
     {29600, 0, 1, 20, 0},
     {29600, 0, 1, 10, 0},
     {29600, 0, 1, 5, 0}];
get_whiteday({2, 2}) ->
    [{29601, 0, 1, 600, 0},
     {29601, 0, 1, 143, 0},
     {29601, 0, 1, 130, 0},
     {29601, 0, 1, 60, 0},
     {29601, 0, 1, 5, 0},
     {29601, 0, 1, 2, 0}];
get_whiteday({3, 2}) ->
    [{29602, 0, 1, 550, 0},
     {29602, 0, 1, 150, 0},
     {29602, 0, 1, 108, 0},
     {29602, 0, 1, 30, 0},
     {29602, 0, 1, 12, 0}];
get_whiteday({4, 2}) ->
    [{29603, 0, 1, 392, 0},
     {29603, 0, 1, 380, 0},
     {29603, 0, 2, 220, 0},
     {29603, 0, 1, 5, 0},
     {29603, 0, 1, 2, 0},
     {29603, 0, 1, 1, 0}];
get_whiteday({5, 2}) ->
    [{29604, 0, 2, 687, 0},
     {29604, 0, 1, 159, 0},
     {29604, 0, 1, 60, 0},
     {29604, 0, 1, 40, 0},
     {29604, 0, 1, 20, 0},
     {29604, 0, 1, 30, 0},
     {29604, 0, 1, 4, 0}];
get_whiteday({6, 2}) ->
    [{29605, 0, 1, 642, 0},
     {29605, 0, 1, 343, 0},
     {29605, 0, 1, 12, 0},
     {29605, 0, 1, 3, 0}];
get_whiteday({7, 2}) ->
    [{70570, 0, 2, 650, 0},
     {70570, 0, 1, 320, 0},
     {70570, 0, 1, 27, 0},
     {70570, 0, 1, 3, 0}];
get_whiteday({8, 2}) ->
    [{70571, 0, 1, 528, 0},
     {70571, 0, 1, 10, 0},
     {70571, 0, 1, 2, 0}];
get_whiteday({8, 0}) ->
    [{70571, 0, 1, 450, 0}, {70571, 0, 1, 10, 0}];
get_whiteday({8, 1}) ->
    [{70571, 0, 1, 450, 0}, {70571, 0, 1, 10, 0}];
get_whiteday({9, 2}) ->
    [{29608, 0, 1, 396, 0},
     {29608, 0, 100, 380, 0},
     {29608, 0, 1, 120, 0},
     {29608, 0, 1, 100, 0},
     {29608, 0, 1, 3, 0},
     {29608, 0, 1, 1, 0}];
get_whiteday(_) -> [].

get_whiteday_votive(1) ->
    #{type => 1, cost => [{90000, 100000}],
      reward => [{20002, 0, 2}], rand_reward => [],
      title => lang:get("恭喜您愿望成真！"),
      content =>
          lang:get("星语星愿一线牵，真情可贵愿望成！~ts热心相助，帮您<color='#ffff00'>实现"
                   "愿望</color>，快打开礼物看看吧^_^"),
      mode => 3355};
get_whiteday_votive(2) ->
    #{type => 2, cost => [{90002, 200}],
      reward => [{90048, 0, 5}, {23237, 0, 1}],
      rand_reward => [], title => lang:get("恭喜您愿望成真！"),
      content =>
          lang:get("星语星愿一线牵，真情可贵愿望成！~ts诚挚还愿，帮您实现<color='#ffff00'>"
                   "双倍愿望</color>（额外获得一份许愿奖励）。愿你们情谊永存，快打开礼物看看吧^_^"),
      mode => 3356};
get_whiteday_votive(_) -> false.

