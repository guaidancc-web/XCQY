-file("src/mod/quest/achieve_shop.erl", 1).

-module(achieve_shop).

-export([push/3,
         push/2,
         login/1,
         init/0,
         buy/2,
         gain_achieve_goods/2,
         gain_achieve_goods2/3,
         set_goods_use/3,
         set_zone_theme/2,
         set_team_mark/2,
         set_chat_bubble/2,
         push_bubble/1,
         push_teammark/1,
         set_photo_frame/2,
         set_badges/2,
         get_chat_bubble/1,
         timer_check/2,
         set_goods/2,
         push_use/2,
         set_honor/2]).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/mod/quest/achieve_shop.erl", 30).

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

-file("src/mod/quest/achieve_shop.erl", 31).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/quest/achieve_shop.erl", 32).

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

-file("src/mod/quest/achieve_shop.erl", 33).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/mod/quest/achieve_shop.erl", 34).

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

-file("src/mod/quest/achieve_shop.erl", 35).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/quest/achieve_shop.erl", 36).

-file("inc/camp_dragon_boat.hrl", 1).

-record(m_camp_dragon_boat,
        {ver = 0,
         start_time = 0 :: non_neg_integer(),
         time_span = 0 :: non_neg_integer(),
         rewarded = [] :: non_neg_integer(),
         rewarded_time = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         fought = 0 :: non_neg_integer(),
         triggers = []}).

-record(dragon_boat_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         is_leader = 0 :: 0 | 1}).

-record(dragon_boat_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         rank = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         leader_name = "" :: list()}).

-file("src/mod/quest/achieve_shop.erl", 37).

init() -> #m_achieve_shop{}.

login(Role = #role{m_achieve_shop =
                       MAS = #m_achieve_shop{shops = ShopList},
                   m_achievement = #m_achievement{finish = FinishList}}) ->
    ShopList1 = revise_shop(ShopList),
    RoleBadgeList = case lists:keyfind(3, 1, ShopList1) of
                        {_, BadgeList} -> BadgeList;
                        false -> []
                    end,
    NRole = do_login_gain_badge(Role#role{m_achieve_shop =
                                              MAS#m_achieve_shop{shops =
                                                                     ShopList1}},
                                RoleBadgeList,
                                FinishList),
    NewRole = login_timer(ShopList1, NRole),
    {ok, NewRole}.

revise_shop([]) -> [];
revise_shop([{Type, List} | T]) ->
    [{Type, revise_shop(List)} | revise_shop(T)];
revise_shop([G = #ashop_goods_info{id = 312,
                                   expire = Expire}
             | T])
    when Expire =/= 0 andalso Expire < 1486692106 ->
    [G#ashop_goods_info{expire = Expire + 86400 * 90}
     | revise_shop(T)];
revise_shop([G | T]) -> [G | revise_shop(T)].

login_timer([], Role) -> Role;
login_timer([{Type, List} | T], Role) ->
    NRole = login_timer(List, Type, Role),
    login_timer(T, NRole).

login_timer([], _Type, Role) -> Role;
login_timer([#ashop_goods_info{state = 1, expire = 0}
             | T],
            Type, Role) ->
    login_timer(T, Type, Role);
login_timer([#ashop_goods_info{id = GoodsId, state = 1,
                               expire = Expire}
             | T],
            Type, Role) ->
    Now = date:unixtime(),
    NextTime = max(1, Expire - Now) * 1000,
    Timer = #timer{id = {achieve_shop, Type, GoodsId},
                   timeout = NextTime, times = 1, m = achieve_shop,
                   f = timer_check,
                   a =
                       [#{label => achieve_shop, type => Type,
                          good_id => GoodsId}]},
    NRole = role_timer:set(Timer, Role),
    login_timer(T, Type, NRole);
login_timer([_ | T], Type, Role) ->
    login_timer(T, Type, Role).

push(#role{link = Link,
           m_achieve_shop = #m_achieve_shop{shops = ShopList}},
     ShopType, Cmd = 10226) ->
    ShopGoodsList = case lists:keyfind(ShopType,
                                       1,
                                       ShopList)
                        of
                        {_Type, GoodsList} -> GoodsList;
                        false -> []
                    end,
    role:link_send(Link, Cmd, {ShopType, ShopGoodsList}).

push(Role, GoodsId) ->
    case achieve_shop_data:get(GoodsId) of
        #{goods_type := ShopType} ->
            push(Role, ShopType, 10226);
        _ -> ok
    end.

push_bubble(#role{link = Link,
                  m_achieve_shop =
                      #m_achieve_shop{chat_bubble = Bubble}}) ->
    logger:debug("推送聊天气泡信息~w", [Bubble], achieve_shop, 104),
    role:link_send(Link, 10416, {Bubble}).

push_teammark(#role{link = Link,
                    m_achieve_shop =
                        #m_achieve_shop{team_mark = TeamMark}}) ->
    role:link_send(Link, 11735, {TeamMark}).

push_footmark(Role) -> map:role_update(Role).

buy(Role, GoodsId) ->
    case achieve_shop_data:get(GoodsId) of
        #{goods_type := ShopType} when ShopType =:= 3 ->
            {false, lang:get("徽章不能进行购买，达成成就可以进行解锁徽章")};
        #{goods_type := ShopType} when ShopType =:= 8 ->
            {false, lang:get("足迹不能进行购买，通过活动可以获得并解锁足迹")};
        #{selling := 0} -> {false, lang:get("该装饰不能购买哦")};
        #{goods_type := ShopType, price := Price,
          name := GoodsName} ->
            Loss = format:val_to_loss([{90008, Price}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    case gain_achieve_goods(LossRole, ShopType, GoodsId) of
                        {ok,
                         GainGoodsRole = #role{m_achievement =
                                                   #m_achievement{assets_point =
                                                                      AssetsPoint}}} ->
                            log:achieve_shop(GainGoodsRole,
                                             0,
                                             AssetsPoint,
                                             Price,
                                             GoodsId,
                                             GoodsName,
                                             ShopType),
                            SetUseRole = case set_goods_use(GainGoodsRole,
                                                            ShopType,
                                                            GoodsId)
                                             of
                                             {ok, Role2} -> Role2;
                                             {false, _R} -> GainGoodsRole
                                         end,
                            RetTxt = get_ret_txt(ShopType),
                            push_use(SetUseRole, ShopType),
                            {ok, SetUseRole, RetTxt};
                        {false, _Reason} -> {false, lang:get("发货失败")}
                    end;
                _Err -> {false, lang:get("成就点不足")}
            end;
        false -> {false, lang:get("获取成就商店数据错误")}
    end.

set_zone_theme(Role = #role{m_achieve_shop =
                                ShopData = #m_achieve_shop{shops = ShopList}},
               GoodsId) ->
    case check_can_set(ShopList, GoodsId, zone_theme) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{zone_theme = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_team_mark(Role = #role{m_achieve_shop =
                               ShopData = #m_achieve_shop{shops = ShopList}},
              GoodsId) ->
    case check_can_set(ShopList, GoodsId, team_mark) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{team_mark = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_prefix(Role = #role{m_achieve_shop =
                            ShopData = #m_achieve_shop{shops = ShopList}},
           GoodsId) ->
    case check_can_set(ShopList, GoodsId, prefix) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{prefix = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_footmark(Role = #role{m_achieve_shop =
                              ShopData = #m_achieve_shop{shops = ShopList}},
             GoodsId) ->
    case check_can_set(ShopList, GoodsId, footmark) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{footmark = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_honor(Role = #role{m_achieve_shop =
                           ShopData = #m_achieve_shop{shops = ShopList}},
          GoodsId) ->
    case check_can_set(ShopList, GoodsId, honor) of
        true ->
            NewRole = Role#role{m_achieve_shop =
                                    ShopData#m_achieve_shop{honor = GoodsId}},
            friend_zone:update(NewRole, show_honor, GoodsId),
            {ok, NewRole};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_chat_bubble(Role = #role{m_achieve_shop =
                                 ShopData = #m_achieve_shop{shops = ShopList}},
                GoodsId) ->
    case check_can_set(ShopList, GoodsId, chat_bubble) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{chat_bubble = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_photo_frame(Role = #role{m_achieve_shop =
                                 ShopData = #m_achieve_shop{shops = ShopList}},
                GoodsId) ->
    case check_can_set(ShopList, GoodsId, photo_frame) of
        true ->
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{photo_frame = GoodsId}}};
        false -> {false, lang:get("未激活不能进行切换")}
    end.

set_badges(Role = #role{m_achieve_shop =
                            ShopData = #m_achieve_shop{shops = ShopList}},
           BadgeList)
    when is_list(BadgeList) andalso
             length(BadgeList) =< 3 ->
    case check_can_set(ShopList, BadgeList, zone_badge) of
        true ->
            BadgeList1 = [Id || {Id} <- BadgeList],
            {ok,
             Role#role{m_achieve_shop =
                           ShopData#m_achieve_shop{badges = BadgeList1}}};
        false -> {false, lang:get("您的徽章未激活，不能进行切换")}
    end;
set_badges(_Role, _) ->
    logger:debug("超出设置徽章数目限制, 最多能设置3个徽章",
                 [],
                 achieve_shop,
                 226),
    {false, lang:get("超出设置徽章数目限制, 最多能设置3个徽章")}.

get_chat_bubble(#role{m_achieve_shop =
                          #m_achieve_shop{chat_bubble = ChatBubble}}) ->
    ChatBubble;
get_chat_bubble(_) -> 301.

gain_achieve_goods(Role, GoodsId) ->
    logger:debug("成就进行奖励领取：~w",
                 [GoodsId],
                 achieve_shop,
                 236),
    case achieve_shop_data:get(GoodsId) of
        #{goods_type := ShopType} ->
            case gain_achieve_goods(Role, ShopType, GoodsId) of
                {ok, NewRole} ->
                    push(NewRole, GoodsId),
                    push_use(NewRole, ShopType),
                    {ok, NewRole};
                Other -> Other
            end;
        false -> {ok, Role}
    end.

gain_achieve_goods2(Role, GoodsId, Expire) ->
    logger:debug("成就进行奖励领取：~w",
                 [GoodsId],
                 achieve_shop,
                 251),
    case achieve_shop_data:get(GoodsId) of
        #{goods_type := ShopType} ->
            case gain_achieve_goods(Role, ShopType, GoodsId, Expire)
                of
                {ok, NewRole} ->
                    push(NewRole, GoodsId),
                    push_use(NewRole, ShopType),
                    {ok, NewRole};
                Other -> Other
            end;
        false -> {ok, Role}
    end.

set_goods(Role, GoodsId) ->
    case achieve_shop_data:get(GoodsId) of
        #{goods_type := ShopType} ->
            case set_goods_use(Role, ShopType, GoodsId) of
                {ok, NewRole} ->
                    push_use(NewRole, ShopType),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ when GoodsId >= 0 andalso GoodsId < 99 ->
            ShopType = GoodsId,
            logger:debug("===================================:~w",
                         [ShopType],
                         achieve_shop,
                         278),
            DefaultId = achieve_shop_data:default_id(ShopType),
            case set_goods_use(Role, ShopType, DefaultId) of
                {ok, NewRole} ->
                    push_use(NewRole, ShopType),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("配置表没有找到")}
    end.

push_use(Role = #role{m_achieve_shop =
                          #m_achieve_shop{prefix = Id}},
         Type = 6) ->
    role:link_send(Role, 10423, {Type, Id}),
    ok;
push_use(Role = #role{m_achieve_shop =
                          #m_achieve_shop{footmark = FootMark}},
         Type = 8) ->
    role:link_send(Role, 10423, {Type, FootMark}),
    ok;
push_use(_, _) -> ok.

set_goods_use(Role, 4, GoodsId) ->
    case set_chat_bubble(Role, GoodsId) of
        {ok, BubbleRole} ->
            push_bubble(BubbleRole),
            {ok, BubbleRole};
        {false, Reason} -> {false, Reason}
    end;
set_goods_use(Role, 5, GoodsId) ->
    case set_team_mark(Role, GoodsId) of
        {ok, TeamMarkRole} ->
            push_teammark(TeamMarkRole),
            {ok, TeamMarkRole};
        {false, Reason} -> {false, Reason}
    end;
set_goods_use(Role, 6, GoodsId) ->
    case set_prefix(Role, GoodsId) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
set_goods_use(Role, 8, GoodsId) ->
    case set_footmark(Role, GoodsId) of
        {ok, NewRole} ->
            push_footmark(NewRole),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
set_goods_use(Role, 7, GoodsId) ->
    case set_honor(Role, GoodsId) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
set_goods_use(_Role, _ShopType, _GoodsId) ->
    {false, lang:get("非队标与聊天气泡不需要直接使用")}.

gain_achieve_goods(Role, ShopType, GoodsId) ->
    gain_achieve_goods(Role, ShopType, GoodsId, 0).

gain_achieve_goods(Role = #role{m_achieve_shop =
                                    AShop = #m_achieve_shop{shops = ShopList}},
                   ShopType, GoodsId, Expire) ->
    Now = date:unixtime(),
    NewGoodsInfo = #ashop_goods_info{id = GoodsId,
                                     state = 1, expire = Expire},
    Result = case lists:keyfind(ShopType, 1, ShopList) of
                 false when Expire == 0 ->
                     {true, [{ShopType, [NewGoodsInfo]} | ShopList]};
                 false ->
                     NewEndT = Now + Expire,
                     {true,
                      NewEndT,
                      [{ShopType,
                        [NewGoodsInfo#ashop_goods_info{expire = NewEndT}]}
                       | ShopList]};
                 {ShopType, ShopGoodsList} ->
                     case lists:keyfind(GoodsId,
                                        #ashop_goods_info.id,
                                        ShopGoodsList)
                         of
                         #ashop_goods_info{state = 1, expire = 0} ->
                             {false, lang:get("已经购买过的商品不能重复购买")};
                         #ashop_goods_info{state = 1} when Expire == 0 ->
                             NewGoodsList = lists:keyreplace(GoodsId,
                                                             #ashop_goods_info.id,
                                                             ShopGoodsList,
                                                             NewGoodsInfo),
                             NewShopInfo1 = {ShopType, NewGoodsList},
                             {true,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo1)};
                         #ashop_goods_info{state = 1, expire = EndT} ->
                             StartT = max(EndT, Now),
                             NewEndT = StartT + Expire,
                             NewGoodsList = lists:keyreplace(GoodsId,
                                                             #ashop_goods_info.id,
                                                             ShopGoodsList,
                                                             NewGoodsInfo#ashop_goods_info{expire
                                                                                               =
                                                                                               NewEndT}),
                             NewShopInfo1 = {ShopType, NewGoodsList},
                             {true,
                              NewEndT,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo1)};
                         #ashop_goods_info{} when Expire == 0 ->
                             NewGoodsList = lists:keyreplace(GoodsId,
                                                             #ashop_goods_info.id,
                                                             ShopGoodsList,
                                                             NewGoodsInfo),
                             NewShopInfo1 = {ShopType, NewGoodsList},
                             {true,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo1)};
                         #ashop_goods_info{} ->
                             NewEndT = Now + Expire,
                             NewGoodsList = lists:keyreplace(GoodsId,
                                                             #ashop_goods_info.id,
                                                             ShopGoodsList,
                                                             NewGoodsInfo#ashop_goods_info{expire
                                                                                               =
                                                                                               NewEndT}),
                             NewShopInfo1 = {ShopType, NewGoodsList},
                             {true,
                              NewEndT,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo1)};
                         false when Expire == 0 ->
                             NewShopInfo2 = {ShopType,
                                             [NewGoodsInfo | ShopGoodsList]},
                             {true,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo2)};
                         false ->
                             NewEndT = Now + Expire,
                             NewShopInfo2 = {ShopType,
                                             [NewGoodsInfo#ashop_goods_info{expire
                                                                                =
                                                                                NewEndT}
                                              | ShopGoodsList]},
                             {true,
                              NewEndT,
                              lists:keyreplace(ShopType,
                                               1,
                                               ShopList,
                                               NewShopInfo2)}
                     end
             end,
    case Result of
        {true, NewShopList} ->
            {ok,
             Role#role{m_achieve_shop =
                           AShop#m_achieve_shop{shops = NewShopList}}};
        {true, TEndT, NewShopList} ->
            NRole = Role#role{m_achieve_shop =
                                  AShop#m_achieve_shop{shops = NewShopList}},
            NRole1 = role_timer:del({achieve_shop,
                                     ShopType,
                                     GoodsId},
                                    NRole),
            NextTime = max(1, TEndT - Now) * 1000,
            logger:debug("过期时间:~w", [NextTime], achieve_shop, 398),
            Timer = #timer{id = {achieve_shop, ShopType, GoodsId},
                           timeout = NextTime, times = 1, m = achieve_shop,
                           f = timer_check,
                           a =
                               [#{label => achieve_shop, type => ShopType,
                                  good_id => GoodsId}]},
            NewRole = role_timer:set(Timer, NRole1),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

timer_check(Role = #role{m_achieve_shop =
                             AShop = #m_achieve_shop{shops = ShopList}},
            #{label := achieve_shop, type := ShopType,
              good_id := GoodsId}) ->
    NRole = role_timer:del({achieve_shop,
                            ShopType,
                            GoodsId},
                           Role),
    case lists:keyfind(ShopType, 1, ShopList) of
        false -> {ok, NRole};
        {ShopType, ShopGoodsList} ->
            Now = date:unixtime(),
            case lists:keyfind(GoodsId,
                               #ashop_goods_info.id,
                               ShopGoodsList)
                of
                #ashop_goods_info{state = 1, expire = 0} -> {ok, NRole};
                GoodsInfo = #ashop_goods_info{state = 1,
                                              expire = Expire}
                    when Now >= Expire ->
                    NewGoodsList = lists:keyreplace(GoodsId,
                                                    #ashop_goods_info.id,
                                                    ShopGoodsList,
                                                    GoodsInfo#ashop_goods_info{state
                                                                                   =
                                                                                   0}),
                    NewShopInfo1 = {ShopType, NewGoodsList},
                    NewShopList = lists:keyreplace(ShopType,
                                                   1,
                                                   ShopList,
                                                   NewShopInfo1),
                    NRole1 = NRole#role{m_achieve_shop =
                                            AShop#m_achieve_shop{shops =
                                                                     NewShopList}},
                    DefaultId = achieve_shop_data:default_id(ShopType),
                    push(NRole1, ShopType, 10226),
                    push_use(NRole1, ShopType),
                    case achieve_shop:set_goods_use(NRole1,
                                                    ShopType,
                                                    DefaultId)
                        of
                        {ok, NewRole} ->
                            case ShopType of
                                7 ->
                                    HonorName = case
                                                    achieve_shop_data:get(GoodsId)
                                                    of
                                                    #{name := _Name} -> _Name;
                                                    _ -> lang:get("")
                                                end,
                                    Title = lang:get("荣誉徽章过期"),
                                    Content =
                                        notice:format(lang:get("您的荣誉徽章~ts已过期，请知悉"),
                                                      [{string_2,
                                                        1,
                                                        HonorName}]),
                                    mail:send(Role, Title, Content),
                                    friend_zone:update(NewRole,
                                                       show_honor,
                                                       DefaultId);
                                _ -> ok
                            end,
                            {ok, NewRole};
                        _ -> {ok, NRole1}
                    end;
                _ -> {ok, NRole}
            end
    end;
timer_check(Role, _) -> {ok, Role}.

check_can_set(ShopList, GoodsId, zone_theme) ->
    is_goods_in(ShopList, GoodsId, 1);
check_can_set(ShopList, GoodsId, team_mark) ->
    case is_goods_in(ShopList, GoodsId, 5) of
        true -> true;
        false -> is_common_goodsid(GoodsId)
    end;
check_can_set(ShopList, GoodsId, chat_bubble) ->
    is_goods_in(ShopList, GoodsId, 4);
check_can_set(ShopList, GoodsId, photo_frame) ->
    is_goods_in(ShopList, GoodsId, 2);
check_can_set(ShopList, GoodsId, prefix) ->
    is_goods_in(ShopList, GoodsId, 6);
check_can_set(ShopList, GoodsId, honor) ->
    is_goods_in(ShopList, GoodsId, 7);
check_can_set(ShopList, [{BadgeId} | RT], zone_badge) ->
    case is_goods_in(ShopList, BadgeId, 3) of
        true -> check_can_set(ShopList, RT, zone_badge);
        false -> false
    end;
check_can_set(ShopList, GoodsId, footmark) ->
    is_goods_in(ShopList, GoodsId, 8);
check_can_set(_, [], zone_badge) -> true;
check_can_set(_ShopList, _GoodsId, _Type) ->
    logger:error("检查时匹配错误:~w,~w",
                 [_GoodsId, _Type],
                 achieve_shop,
                 482),
    false.

is_goods_in(ShopList, GoodsId, ShopType) ->
    case is_default(GoodsId, ShopType) of
        true -> true;
        false ->
            case lists:keyfind(ShopType, 1, ShopList) of
                false -> false;
                {ShopType, ShopGoodsList} ->
                    case lists:keyfind(GoodsId,
                                       #ashop_goods_info.id,
                                       ShopGoodsList)
                        of
                        #ashop_goods_info{} -> true;
                        false -> false
                    end
            end
    end.

is_default(GoodsId, ShopType) ->
    achieve_shop_data:default_id(ShopType) =:= GoodsId.

is_common_goodsid(GoddsId) ->
    case GoddsId of
        407 -> true;
        _ -> false
    end.

do_login_gain_badge(Role, RoleBadgeList,
                    [{AchieveId, _} | Rest]) ->
    case achievement_data:get(AchieveId) of
        #quest_data{rewards_badge = CfgBadge} ->
            case lists:keyfind(CfgBadge,
                               #ashop_goods_info.id,
                               RoleBadgeList)
                of
                #ashop_goods_info{} ->
                    do_login_gain_badge(Role, RoleBadgeList, Rest);
                false ->
                    NewRole = case gain_achieve_goods(Role, 3, CfgBadge) of
                                  {ok, Role1} -> Role1;
                                  {false, _} -> Role
                              end,
                    do_login_gain_badge(NewRole, RoleBadgeList, Rest)
            end;
        _Err -> do_login_gain_badge(Role, RoleBadgeList, Rest)
    end;
do_login_gain_badge(Role, _RoleBadgeList, []) -> Role.

get_ret_txt(4) ->
    lang:get("兑换成功，已自动使用，战斗中说话可见{face_1,25}");
get_ret_txt(5) ->
    lang:get("兑换成功，已自动使用，创建队伍后可见{face_1,36}");
get_ret_txt(1) -> lang:get("兑换成功，请前往空间使用");
get_ret_txt(2) -> lang:get("兑换成功，请前往空间使用");
get_ret_txt(_) -> lang:get("兑换成功").

