-file("src/data/camp_lucky_draw_data.erl", 1).

-module(camp_lucky_draw_data).

-export([group_index_list/0,
         get_etc_config/0,
         get_add_weight/2,
         get_gold_info/1,
         get_other_config/0]).

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

-file("src/data/camp_lucky_draw_data.erl", 18).

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

-file("src/data/camp_lucky_draw_data.erl", 19).

-file("inc/camp_lucky_draw.hrl", 1).

-author("jia").

-record(camp_lucky_draw_reward_base,
        {group_id = 0,
         base_id = 0,
         bind = 0,
         num = 0,
         min_times = 0,
         is_free = 0,
         weight = 0,
         icon = "",
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_record = 0,
         is_effect = 0,
         is_cast = 0,
         add_weight = 0,
         is_zone_cast = 0}).

-record(camp_lucky_draw_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 2,
         classes = 0,
         free_times = 0,
         draw_times = 0,
         update_time = 0}).

-record(camp_lucky_draw_info,
        {camp_id = 0, gold = 0, add_gold = 0, msg_list = []}).

-record(camp_lucky_draw_record_msg,
        {add_time = 0, msg = ""}).

-file("src/data/camp_lucky_draw_data.erl", 20).

get_etc_config() ->
    [#{camp_id => 3201, add_gold => 60, free_times => 0,
       cost => [{71568, 1}], init_gold => 100000,
       max_draw => 9999999,
       tips_msg =>
           lang:get("1、活动期间每天拥活跃度达到100，即可免费获得1个勤劳幸运币，通过劳动节活动与商城购买可"
                    "获得更多<color='#ffff00'>勤劳幸运币</color>\n2、每次祈福可增加"
                    "奖池奖金，奖池奖金越多，获得<color='#ffff00'>钻石奖励</color>的几"
                    "率越大")}].

group_index_list() ->
    [#camp_lucky_draw_reward_base{group_id = 1,
                                  base_id = 90002, bind = 0, num = 25000,
                                  min_times = 10, is_free = 0, weight = 2,
                                  icon = "90060", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 1, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 2,
                                  base_id = 90002, bind = 0, num = 7000,
                                  min_times = 5, is_free = 0, weight = 28,
                                  icon = "90058", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 1, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 3,
                                  base_id = 90026, bind = 0, num = 3500,
                                  min_times = 3, is_free = 0, weight = 100,
                                  icon = "90059", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 0, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 4,
                                  base_id = 21187, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 220,
                                  icon = "21187", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 0, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 5,
                                  base_id = 22456, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 2000,
                                  icon = "70135", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 5,
                                  base_id = 22450, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 800,
                                  icon = "70135", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 5,
                                  base_id = 22452, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 500,
                                  icon = "70135", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 0, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 6,
                                  base_id = 71570, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 600,
                                  icon = "71573", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 1,
                                  is_effect = 1, is_cast = 0, is_zone_cast = 1},
     #camp_lucky_draw_reward_base{group_id = 6,
                                  base_id = 29121, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 650,
                                  icon = "71573", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 6,
                                  base_id = 29120, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 800,
                                  icon = "71573", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 7,
                                  base_id = 23740, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 300,
                                  icon = "26020", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 7,
                                  base_id = 22449, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 300,
                                  icon = "26020", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 7,
                                  base_id = 22585, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 1350,
                                  icon = "26020", min_lev = 1, max_lev = 79,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 7,
                                  base_id = 21098, bind = 0, num = 5,
                                  min_times = 0, is_free = 1, weight = 1350,
                                  icon = "26020", min_lev = 80, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 8,
                                  base_id = 21322, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 1000,
                                  icon = "26021", min_lev = 1, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 8,
                                  base_id = 23752, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 1350,
                                  icon = "26021", min_lev = 1, max_lev = 89,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0, is_zone_cast = 0},
     #camp_lucky_draw_reward_base{group_id = 8,
                                  base_id = 22307, bind = 0, num = 1,
                                  min_times = 0, is_free = 1, weight = 1350,
                                  icon = "26021", min_lev = 90, max_lev = 200,
                                  sex = 2, classes = 0, is_record = 0,
                                  is_effect = 0, is_cast = 0,
                                  is_zone_cast = 0}].

get_add_weight(GoldNum, GroupID)
    when GroupID =:= 1 andalso
             GoldNum >= 120000 andalso GoldNum =< 140000 ->
    1;
get_add_weight(GoldNum, GroupID)
    when GroupID =:= 1 andalso
             GoldNum >= 140001 andalso GoldNum =< 160000 ->
    2;
get_add_weight(GoldNum, GroupID)
    when GroupID =:= 1 andalso
             GoldNum >= 160001 andalso GoldNum =< 99999999 ->
    3;
get_add_weight(GoldNum, GroupID)
    when GroupID =:= 2 andalso
             GoldNum >= 120000 andalso GoldNum =< 140000 ->
    1;
get_add_weight(GoldNum, GroupID)
    when GroupID =:= 2 andalso
             GoldNum >= 140001 andalso GoldNum =< 160000 ->
    2;
get_add_weight(GoldNum, GroupID)
    when GroupID =:= 2 andalso
             GoldNum >= 160001 andalso GoldNum =< 99999999 ->
    3;
get_add_weight(_, _) -> 0.

get_gold_info(1) -> {1, 300, 0, 9999999};
get_gold_info(2) -> {2, 100, 0, 9999999};
get_gold_info(3) -> {3, 50, 0, 9999999};
get_gold_info(_) -> false.

get_other_config() ->
    [#{mail_title => lang:get("劳动节祝福100分！"),
       mail_content =>
           lang:get("您在活动期间达到100活跃度，满满的祝福送给您，使用可参与幸运宝库活动，有几率获取丰厚奖励"
                    "哟，祝您幸运爆棚，赢取大奖！"),
       reward => [{71568, 1, 1}]}].

