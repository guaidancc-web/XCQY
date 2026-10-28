-file("src/data/hero_data.erl", 1).

-module(hero_data).

-export([serieses/0,
         get_series/1,
         get_series_name/1,
         get_reward/1,
         get_win/1,
         get_box/1,
         get_honor/1]).

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

-file("src/data/hero_data.erl", 21).

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

-file("src/data/hero_data.erl", 22).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
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
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/data/hero_data.erl", 23).

serieses() -> [1].

get_series_name(1) -> lang:get("荣耀战场");
get_series_name(_) -> "".

get_series(Lev) when Lev >= 1 andalso Lev =< 200 ->
    #hero_series_data{min = 1, max = 200, series = 1,
                      name = lang:get("荣耀战场")};
get_series(_) -> false.

get_reward({Val, 0}) when Val >= 0 andalso Val =< 11 ->
    #hero_reward_data{min = 0, max = 11, flag = 0,
                      item_list = [{20006, 0, 5, 0, 1000}], exp_mode = 3300,
                      pet_exp_mode = 3300};
get_reward({Val, 0})
    when Val >= 12 andalso Val =< 99999 ->
    #hero_reward_data{min = 12, max = 99999, flag = 0,
                      item_list =
                          [{20046, 0, 1, 1, 60},
                           {20025, 0, 1, 0, 100},
                           {20087, 0, 1, 1, 100},
                           {20075, 0, 1, 1, 80},
                           {20616, 0, 1, 1, 30},
                           {21100, 0, 1, 1, 20},
                           {20038, 0, 1, 1, 1},
                           {20021, 0, 1, 1, 40},
                           {20095, 0, 1, 1, 2},
                           {20045, 0, 1, 0, 40},
                           {20002, 0, 1, 0, 209},
                           {20009, 0, 1, 1, 30},
                           {20020, 0, 2, 0, 80},
                           {20039, 0, 1, 1, 70},
                           {20040, 0, 1, 1, 5},
                           {20006, 0, 5, 0, 133}],
                      exp_mode = 3300, pet_exp_mode = 3300};
get_reward({Val, 1}) when Val >= 0 andalso Val =< 11 ->
    #hero_reward_data{min = 0, max = 11, flag = 1,
                      item_list = [{20006, 0, 8, 0, 1000}], exp_mode = 3300,
                      pet_exp_mode = 3300};
get_reward({Val, 1})
    when Val >= 12 andalso Val =< 99999 ->
    #hero_reward_data{min = 12, max = 99999, flag = 1,
                      item_list =
                          [{20046, 0, 1, 0, 60},
                           {20025, 0, 1, 0, 100},
                           {20087, 0, 1, 0, 100},
                           {20075, 0, 1, 1, 80},
                           {20616, 0, 1, 1, 40},
                           {20617, 0, 1, 1, 10},
                           {21100, 0, 1, 0, 30},
                           {20038, 0, 1, 1, 1},
                           {20021, 0, 1, 0, 49},
                           {20095, 0, 1, 1, 2},
                           {20045, 0, 3, 0, 50},
                           {20002, 0, 1, 0, 160},
                           {20009, 0, 1, 1, 30},
                           {20020, 0, 3, 0, 80},
                           {20039, 0, 1, 0, 60},
                           {20040, 0, 1, 1, 15},
                           {20006, 0, 8, 0, 133}],
                      exp_mode = 3300, pet_exp_mode = 3300};
get_reward(_) -> false.

get_win({Val, 1}) when Val >= 1 andalso Val =< 10 ->
    #hero_win_data{min = 1, max = 10, flag = 1,
                   item_list =
                       [{20006, 0, 5, 0, 220},
                        {21220, 0, 1, 0, 180},
                        {20046, 0, 1, 1, 25},
                        {20020, 0, 1, 0, 80},
                        {20025, 0, 1, 0, 130},
                        {20087, 0, 1, 1, 60},
                        {21100, 0, 1, 1, 20},
                        {20095, 0, 1, 1, 2},
                        {20075, 0, 1, 1, 2},
                        {20616, 0, 1, 1, 4},
                        {20617, 0, 1, 1, 1},
                        {20021, 0, 1, 0, 60},
                        {20034, 0, 1, 0, 80},
                        {20045, 0, 1, 0, 96},
                        {22450, 0, 1, 0, 50},
                        {0, 0, 0, 0, 2333}],
                   exp = 1000, pet_exp = 1000};
get_win({Val, 1}) when Val >= 11 andalso Val =< 20 ->
    #hero_win_data{min = 11, max = 20, flag = 1, exp = 500,
                   pet_exp = 500};
get_win({Val, 1}) when Val >= 21 andalso Val =< 999 ->
    #hero_win_data{min = 21, max = 999, flag = 1, exp = 0,
                   pet_exp = 0};
get_win({Val, 0}) when Val >= 1 andalso Val =< 10 ->
    #hero_win_data{min = 1, max = 10, flag = 0,
                   item_list =
                       [{20006, 0, 5, 0, 220},
                        {21220, 0, 1, 0, 180},
                        {20046, 0, 1, 1, 25},
                        {20020, 0, 1, 0, 80},
                        {20025, 0, 1, 0, 130},
                        {20087, 0, 1, 1, 60},
                        {21100, 0, 1, 1, 20},
                        {20095, 0, 1, 1, 2},
                        {20075, 0, 1, 1, 2},
                        {20616, 0, 1, 1, 4},
                        {20617, 0, 1, 1, 1},
                        {20021, 0, 1, 0, 60},
                        {20034, 0, 1, 0, 80},
                        {20045, 0, 1, 0, 96},
                        {22450, 0, 1, 0, 50},
                        {0, 0, 0, 0, 2333}],
                   exp = 600, pet_exp = 600};
get_win({Val, 0}) when Val >= 11 andalso Val =< 20 ->
    #hero_win_data{min = 11, max = 20, flag = 0, exp = 300,
                   pet_exp = 300};
get_win({Val, 0}) when Val >= 21 andalso Val =< 999 ->
    #hero_win_data{min = 21, max = 999, flag = 0, exp = 0,
                   pet_exp = 0};
get_win(_) -> false.

get_box(79560) ->
    [#{item_id => 20013, num => 1, ratio => 600,
       is_cast => 0},
     #{item_id => 20014, num => 1, ratio => 150,
       is_cast => 1},
     #{item_id => 20020, num => 2, ratio => 1000,
       is_cast => 0},
     #{item_id => 20025, num => 1, ratio => 874,
       is_cast => 0},
     #{item_id => 21220, num => 1, ratio => 300,
       is_cast => 0},
     #{item_id => 20087, num => 1, ratio => 600,
       is_cast => 1},
     #{item_id => 20075, num => 1, ratio => 160,
       is_cast => 1},
     #{item_id => 20076, num => 1, ratio => 40,
       is_cast => 1},
     #{item_id => 20021, num => 2, ratio => 500,
       is_cast => 0},
     #{item_id => 20022, num => 1, ratio => 300,
       is_cast => 1},
     #{item_id => 21100, num => 1, ratio => 1000,
       is_cast => 1},
     #{item_id => 21101, num => 1, ratio => 600,
       is_cast => 1},
     #{item_id => 21102, num => 1, ratio => 300,
       is_cast => 1},
     #{item_id => 20034, num => 1, ratio => 800,
       is_cast => 0},
     #{item_id => 20038, num => 1, ratio => 20,
       is_cast => 1},
     #{item_id => 20095, num => 1, ratio => 50,
       is_cast => 1},
     #{item_id => 20039, num => 1, ratio => 200,
       is_cast => 1},
     #{item_id => 20040, num => 1, ratio => 60,
       is_cast => 1},
     #{item_id => 20036, num => 1, ratio => 40,
       is_cast => 1},
     #{item_id => 21312, num => 2, ratio => 800,
       is_cast => 0},
     #{item_id => 20006, num => 8, ratio => 700,
       is_cast => 0},
     #{item_id => 20007, num => 2, ratio => 901,
       is_cast => 0},
     #{item_id => 29011, num => 1, ratio => 5,
       is_cast => 1}];
get_box(_) -> [].

get_honor({1, 1}) -> 30100;
get_honor({1, 2}) -> 30101;
get_honor({1, 3}) -> 30102;
get_honor(_) -> 0.

