-file("src/data/canyon_summit_data.erl", 1).

-module(canyon_summit_data).

-author("Liyufei").

-export([get_group/2,
         get_all_group/0,
         get_unit_duration/1,
         get_box_reward/1,
         get_result_reward/1,
         get_combat_reward/1,
         score_ratio/0,
         exchange_score/1,
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

-file("src/data/canyon_summit_data.erl", 28).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/canyon_summit_data.erl", 29).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/data/canyon_summit_data.erl", 30).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/canyon_summit_data.erl", 31).

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

-file("src/data/canyon_summit_data.erl", 32).

get_group(Lev, BKTimes)
    when BKTimes >= 0 andalso
             BKTimes =< 0 andalso Lev =< 79 andalso Lev >= 70 ->
    1;
get_group(Lev, BKTimes)
    when BKTimes >= 0 andalso
             BKTimes =< 0 andalso Lev =< 84 andalso Lev >= 80 ->
    2;
get_group(Lev, BKTimes)
    when BKTimes >= 0 andalso
             BKTimes =< 0 andalso Lev =< 88 andalso Lev >= 85 ->
    3;
get_group(Lev, BKTimes)
    when BKTimes >= 0 andalso
             BKTimes =< 0 andalso Lev =< 89 andalso Lev >= 89 ->
    4;
get_group(Lev, BKTimes)
    when BKTimes >= 0 andalso
             BKTimes =< 0 andalso Lev =< 100 andalso Lev >= 90 ->
    5;
get_group(Lev, BKTimes)
    when BKTimes >= 1 andalso
             BKTimes =< 1 andalso Lev =< 100 andalso Lev >= 95 ->
    6;
get_group(Lev, BKTimes)
    when BKTimes >= 1 andalso
             BKTimes =< 1 andalso Lev =< 109 andalso Lev >= 101 ->
    7;
get_group(Lev, BKTimes)
    when BKTimes >= 1 andalso
             BKTimes =< 1 andalso Lev =< 119 andalso Lev >= 110 ->
    8;
get_group(Lev, BKTimes)
    when BKTimes >= 1 andalso
             BKTimes =< 1 andalso Lev =< 200 andalso Lev >= 120 ->
    9;
get_group(_, _) -> 0.

get_all_group() -> [1, 2, 3, 4, 5, 6, 7, 8, 9].

get_unit_duration(1) -> 1600;
get_unit_duration(2) -> 2000;
get_unit_duration(3) -> 3000;
get_unit_duration(4) -> 1600;
get_unit_duration(5) -> 2000;
get_unit_duration(6) -> 3000;
get_unit_duration(_) -> false.

get_box_reward(79586) ->
    [#{box_id => 79586, item_id => 20013, item_num => 1,
       item_name => lang:get("魔兽要诀"), item_weight => 105,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 88,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 90,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79586, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20022, item_num => 1,
       item_name => lang:get("优秀幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 21101, item_num => 1,
       item_name => lang:get("精灵之羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79586, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 120,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 3,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79586, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 28,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 8,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{box_id => 79586, item_id => 21312, item_num => 1,
       item_name => lang:get("天香果"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{box_id => 79586, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 103,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_box_reward(_) -> false.

get_result_reward(1) ->
    [#{result => 1, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 10,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 49,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20045, item_num => 3,
       item_name => lang:get("月光绒"), item_weight => 50,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20002, item_num => 1,
       item_name => lang:get("金币袋子"), item_weight => 160,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20020, item_num => 3,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20006, item_num => 8,
       item_name => lang:get("星辰精华"), item_weight => 133,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_result_reward(2) ->
    [#{result => 2, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20002, item_num => 1,
       item_name => lang:get("金币袋子"), item_weight => 209,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 133,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_result_reward(3) ->
    [#{result => 3, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20025, item_num => 1,
       item_name => lang:get("冒险笔记"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 100,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 21100, item_num => 1,
       item_name => lang:get("翅膀灵羽"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20038, item_num => 1,
       item_name => lang:get("神兽之魂"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20021, item_num => 1,
       item_name => lang:get("幸运石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20002, item_num => 1,
       item_name => lang:get("金币袋子"), item_weight => 209,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20009, item_num => 1,
       item_name => lang:get("+8强化保护卷"), item_weight => 30,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20020, item_num => 2,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0},
     #{result => 3, item_id => 20039, item_num => 1,
       item_name => lang:get("灵犀"), item_weight => 70,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20040, item_num => 1,
       item_name => lang:get("二品灵犀"), item_weight => 5,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 1},
     #{result => 3, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 133,
       show_odds => 100, sex => 2, classes => 0, lev_min => 0,
       lev_max => 200, announce => 0}];
get_result_reward(_) -> false.

get_combat_reward(1) ->
    [#{result => 1, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 230,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20020, item_num => 1,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 130,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 1, item_id => 21098, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 1, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 96,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0}];
get_combat_reward(2) ->
    [#{result => 2, item_id => 20006, item_num => 5,
       item_name => lang:get("星辰精华"), item_weight => 230,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20052, item_num => 1,
       item_name => lang:get("藏宝图"), item_weight => 180,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20046, item_num => 1,
       item_name => lang:get("彩虹果"), item_weight => 15,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20020, item_num => 1,
       item_name => lang:get("强化石"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 21420, item_num => 1,
       item_name => lang:get("1级图鉴"), item_weight => 130,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20087, item_num => 1,
       item_name => lang:get("四宝"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21421, item_num => 1,
       item_name => lang:get("2级图鉴"), item_weight => 20,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20095, item_num => 1,
       item_name => lang:get("珍兽之魂"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20075, item_num => 1,
       item_name => lang:get("月亮重置丹"), item_weight => 2,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20616, item_num => 1,
       item_name => lang:get("月亮护符"), item_weight => 4,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 20617, item_num => 1,
       item_name => lang:get("太阳护符"), item_weight => 1,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 1},
     #{result => 2, item_id => 21098, item_num => 1,
       item_name => lang:get("英雄宝石"), item_weight => 60,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20088, item_num => 1,
       item_name => lang:get("初级符石"), item_weight => 40,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20034, item_num => 1,
       item_name => lang:get("宝石包"), item_weight => 80,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0},
     #{result => 2, item_id => 20045, item_num => 1,
       item_name => lang:get("月光绒"), item_weight => 96,
       show_odds => 100, sex => 2, classes => 0, lev_min => 30,
       lev_max => 200, announce => 0}];
get_combat_reward(_) -> false.

exchange_score(70) -> 1000;
exchange_score(71) -> 1000;
exchange_score(72) -> 1000;
exchange_score(73) -> 1000;
exchange_score(74) -> 1000;
exchange_score(75) -> 1000;
exchange_score(76) -> 1000;
exchange_score(77) -> 1000;
exchange_score(78) -> 1000;
exchange_score(79) -> 1000;
exchange_score(80) -> 1000;
exchange_score(81) -> 1000;
exchange_score(82) -> 1000;
exchange_score(83) -> 1000;
exchange_score(84) -> 1000;
exchange_score(85) -> 1000;
exchange_score(86) -> 1000;
exchange_score(87) -> 1000;
exchange_score(88) -> 1000;
exchange_score(89) -> 1000;
exchange_score(90) -> 1000;
exchange_score(91) -> 1000;
exchange_score(92) -> 1000;
exchange_score(93) -> 1000;
exchange_score(94) -> 1000;
exchange_score(95) -> 1000;
exchange_score(96) -> 1000;
exchange_score(97) -> 1000;
exchange_score(98) -> 1000;
exchange_score(99) -> 1000;
exchange_score(100) -> 1000;
exchange_score(101) -> 1000;
exchange_score(102) -> 1000;
exchange_score(103) -> 1000;
exchange_score(104) -> 1000;
exchange_score(105) -> 1000;
exchange_score(106) -> 1000;
exchange_score(107) -> 1000;
exchange_score(108) -> 1000;
exchange_score(109) -> 1000;
exchange_score(110) -> 1000;
exchange_score(111) -> 1000;
exchange_score(112) -> 1000;
exchange_score(113) -> 1000;
exchange_score(114) -> 1000;
exchange_score(115) -> 1000;
exchange_score(116) -> 1000;
exchange_score(117) -> 1000;
exchange_score(118) -> 1000;
exchange_score(119) -> 1000;
exchange_score(120) -> 1000;
exchange_score(121) -> 1000;
exchange_score(122) -> 1000;
exchange_score(123) -> 1000;
exchange_score(124) -> 1000;
exchange_score(125) -> 1000;
exchange_score(126) -> 1000;
exchange_score(127) -> 1000;
exchange_score(128) -> 1000;
exchange_score(129) -> 1000;
exchange_score(130) -> 1000;
exchange_score(_Lev) -> false.

score_ratio() ->
    [{299, 400}, {399, 200}, {499, 50}, {999999, 30}].

get_honor({1, 1}) -> 30140;
get_honor({1, 2}) -> 30141;
get_honor({1, 3}) -> 30142;
get_honor({2, 1}) -> 30140;
get_honor({2, 2}) -> 30141;
get_honor({2, 3}) -> 30142;
get_honor({3, 1}) -> 30140;
get_honor({3, 2}) -> 30141;
get_honor({3, 3}) -> 30142;
get_honor({4, 1}) -> 30140;
get_honor({4, 2}) -> 30141;
get_honor({4, 3}) -> 30142;
get_honor({5, 1}) -> 30140;
get_honor({5, 2}) -> 30141;
get_honor({5, 3}) -> 30142;
get_honor({6, 1}) -> 30140;
get_honor({6, 2}) -> 30141;
get_honor({6, 3}) -> 30142;
get_honor({7, 1}) -> 30140;
get_honor({7, 2}) -> 30141;
get_honor({7, 3}) -> 30142;
get_honor({8, 1}) -> 30140;
get_honor({8, 2}) -> 30141;
get_honor({8, 3}) -> 30142;
get_honor({9, 1}) -> 30140;
get_honor({9, 2}) -> 30141;
get_honor({9, 3}) -> 30142;
get_honor(_) -> 0.

