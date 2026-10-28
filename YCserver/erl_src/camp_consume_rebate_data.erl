-file("src/data/camp_consume_rebate_data.erl", 1).

-module(camp_consume_rebate_data).

-author("Liyufei").

-export([get_item_show/5,
         get_item_info/1,
         get_rebate_info/1,
         get_today_rebate/1]).

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

-file("src/data/camp_consume_rebate_data.erl", 24).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/camp_consume_rebate_data.erl", 25).

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

-file("src/data/camp_consume_rebate_data.erl", 26).

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

-file("src/data/camp_consume_rebate_data.erl", 27).

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

-file("src/data/camp_consume_rebate_data.erl", 28).

get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 1 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {71571, 1, lang:get("遗失的美好"), 2880, 1, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 2 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20638, 1, lang:get("彩虹护符"), 5000, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 3 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20617, 1, lang:get("太阳护符"), 1600, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 4 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20616, 1, lang:get("月亮护符"), 400, 5, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 5 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29041, 1, lang:get("精灵神魂袋"), 1800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 6 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22449, 1, lang:get("爆烈战魂袋"), 1000, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 7 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23740, 1, lang:get("精灵珍宝袋"), 800, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 8 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29101, 1, lang:get("仙灵卷轴"), 500, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 9 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20755, 1, lang:get("萌宠汤圆"), 400, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 10 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20545, 1, lang:get("天资上限礼盒"), 150, 20, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 11 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29102, 1, lang:get("兽王丹"), 120, 20, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 12 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20061, 1, lang:get("成长丹"), 162, 20, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 1 andalso
             Order =:= 13 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20006, 1, lang:get("星辰精华"), 5, 0, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 1 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {71571, 1, lang:get("遗失的美好"), 2880, 1, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 2 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29041, 1, lang:get("精灵神魂袋"), 1800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 3 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22449, 1, lang:get("爆烈战魂袋"), 1000, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 4 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23740, 1, lang:get("精灵珍宝袋"), 800, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 5 andalso
                 Lev =< 200 andalso
                     Lev >= 90 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {21257, 1, lang:get("至尊宝物箱子"), 4000, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 5 andalso
                 Lev =< 89 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {21245, 1, lang:get("神品宝物箱子"), 2750, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 6 andalso
                 Lev =< 200 andalso
                     Lev >= 90 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {21256, 1, lang:get("神圣宝物箱子"), 1000, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 6 andalso
                 Lev =< 89 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {21244, 1, lang:get("极品宝物箱子"), 480, 5, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 7 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23594, 1, lang:get("芙蓉八宝月饼"), 800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 8 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22617, 1, lang:get("仙品水晶粽"), 800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 9 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {70362, 1, lang:get("缤纷五仁月饼"), 800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 10 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23554, 1, lang:get("唤灵丹"), 120, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 11 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22396, 1, lang:get("一大箱宝石"), 180, 10, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 12 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {21098, 1, lang:get("英雄宝石"), 40, 50, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 13 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23556, 1, lang:get("精灵缰绳"), 50, 50, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 14 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23733, 1, lang:get("宝莲花"), 60, 50, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 2 andalso
             Order =:= 15 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20006, 1, lang:get("星辰精华"), 5, 0, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 1 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20638, 1, lang:get("彩虹护符"), 5000, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 2 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20617, 1, lang:get("太阳护符"), 1600, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 3 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20616, 1, lang:get("月亮护符"), 400, 5, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 4 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29041, 1, lang:get("精灵神魂袋"), 1800, 2, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 5 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22449, 1, lang:get("爆烈战魂袋"), 1000, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 6 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {23740, 1, lang:get("精灵珍宝袋"), 800, 5, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 7 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {71285, 1, lang:get("梦幻花圈"), 1000, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 8 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {71167, 1, lang:get("圣夜魔法球"), 1000, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 9 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {70889, 1, lang:get("红桃之心"), 1000, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 10 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {29818, 1, lang:get("美味小骨"), 1000, 10, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 11 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22212, 1, lang:get("洗炼神石"), 150, 30, 1};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 12 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {22306, 1, lang:get("精良珍珠袋子"), 100, 30, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 13 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20025, 1, lang:get("冒险笔记"), 30, 30, 0};
get_item_show(Day, Order, Lev, Sex, Classes)
    when Day =:= 3 andalso
             Order =:= 14 andalso
                 Lev =< 200 andalso
                     Lev >= 1 andalso
                         (2 =:= 2 orelse Sex =:= 2) andalso
                             (0 =:= 0 orelse Classes =:= 0) ->
    {20006, 1, lang:get("星辰精华"), 5, 0, 0};
get_item_show(_, _, _, _, _) -> false.

get_item_info({1, 71571}) -> {0, 1, 1, 2880};
get_item_info({1, 20638}) -> {0, 1, 2, 5000};
get_item_info({1, 20617}) -> {0, 1, 2, 1600};
get_item_info({1, 20616}) -> {0, 1, 5, 400};
get_item_info({1, 29041}) -> {0, 1, 2, 1800};
get_item_info({1, 22449}) -> {0, 1, 5, 1000};
get_item_info({1, 23740}) -> {0, 1, 5, 800};
get_item_info({1, 29101}) -> {0, 1, 10, 500};
get_item_info({1, 20755}) -> {0, 1, 10, 400};
get_item_info({1, 20545}) -> {0, 1, 20, 150};
get_item_info({1, 29102}) -> {0, 1, 20, 120};
get_item_info({1, 20061}) -> {0, 1, 20, 162};
get_item_info({1, 20006}) -> {0, 1, 0, 5};
get_item_info({2, 71571}) -> {0, 1, 1, 2880};
get_item_info({2, 29041}) -> {0, 1, 2, 1800};
get_item_info({2, 22449}) -> {0, 1, 5, 1000};
get_item_info({2, 23740}) -> {0, 1, 5, 800};
get_item_info({2, 21257}) -> {0, 1, 2, 4000};
get_item_info({2, 21245}) -> {0, 1, 2, 2750};
get_item_info({2, 21256}) -> {0, 1, 5, 1000};
get_item_info({2, 21244}) -> {0, 1, 5, 480};
get_item_info({2, 23594}) -> {0, 1, 2, 800};
get_item_info({2, 22617}) -> {0, 1, 2, 800};
get_item_info({2, 70362}) -> {0, 1, 2, 800};
get_item_info({2, 23554}) -> {0, 1, 10, 120};
get_item_info({2, 22396}) -> {0, 1, 10, 180};
get_item_info({2, 21098}) -> {0, 1, 50, 40};
get_item_info({2, 23556}) -> {0, 1, 50, 50};
get_item_info({2, 23733}) -> {0, 1, 50, 60};
get_item_info({2, 20006}) -> {0, 1, 0, 5};
get_item_info({3, 20638}) -> {0, 1, 2, 5000};
get_item_info({3, 20617}) -> {0, 1, 2, 1600};
get_item_info({3, 20616}) -> {0, 1, 5, 400};
get_item_info({3, 29041}) -> {0, 1, 2, 1800};
get_item_info({3, 22449}) -> {0, 1, 5, 1000};
get_item_info({3, 23740}) -> {0, 1, 5, 800};
get_item_info({3, 71285}) -> {0, 1, 10, 1000};
get_item_info({3, 71167}) -> {0, 1, 10, 1000};
get_item_info({3, 70889}) -> {0, 1, 10, 1000};
get_item_info({3, 29818}) -> {0, 1, 10, 1000};
get_item_info({3, 22212}) -> {0, 1, 30, 150};
get_item_info({3, 22306}) -> {0, 1, 30, 100};
get_item_info({3, 20025}) -> {0, 1, 30, 30};
get_item_info({3, 20006}) -> {0, 1, 0, 5};
get_item_info(_) -> false.

get_rebate_info(1) -> {1, 1999, 800};
get_rebate_info(2) -> {2, 6999, 3200};
get_rebate_info(3) -> {3, 19999, 10000};
get_rebate_info(_) -> false.

get_today_rebate(1) -> {1, 13, [1, 2, 3]};
get_today_rebate(2) -> {2, 15, [1, 2, 3]};
get_today_rebate(3) -> {3, 14, [1, 2, 3]};
get_today_rebate(_) -> false.

