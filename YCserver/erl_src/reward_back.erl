-file("src/mod/reward_back/reward_back.erl", 1).

-module(reward_back).

-export([init/0,
         reset/2,
         reset_five/2,
         push/1,
         reward/4,
         reward_one_key/2,
         update_reward/2,
         gm/2]).

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

-file("src/mod/reward_back/reward_back.erl", 23).

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

-file("src/mod/reward_back/reward_back.erl", 24).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/reward_back/reward_back.erl", 25).

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

-file("src/mod/reward_back/reward_back.erl", 26).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/reward_back/reward_back.erl", 27).

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

-file("src/mod/reward_back/reward_back.erl", 28).

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

-file("src/mod/reward_back/reward_back.erl", 29).

-file("inc/reward_back.hrl", 1).

-record(m_reward_back,
        {ver = 3,
         next_id = 1,
         list = [],
         zero_time = 0,
         five_time = 0,
         world_lev = 40,
         last_lev = 1}).

-record(reward_back_data,
        {ver = 1,
         id = 0,
         active_id = 0,
         finish = 0,
         all = 0,
         back = 0,
         reward = [],
         time = 0}).

-file("src/mod/reward_back/reward_back.erl", 30).

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

-file("src/mod/reward_back/reward_back.erl", 31).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/reward_back/reward_back.erl", 32).

-file("inc/quest_offer.hrl", 1).

-type offer_notice() :: integer().

-record(quest_offer_ratio_data,
        {exp_ratio = 0, coin_ratio = 0, leader_ratio = 0}).

-record(quest_offer_calc_ratio,
        {count_exp = 0,
         count_coin = 0,
         count_leader = 0,
         lev_exp = 0,
         lev_coin = 0,
         pet_lev_exp = 0,
         name = ""}).

-record(quest_offer_reward_ratio,
        {exp = 0,
         coin = 0,
         pet_exp = 0,
         double_point = 1,
         ring_20_double = 1}).

-record(quest_offer_team_args,
        {round = 0,
         avg_lev = 1,
         member_num = 0,
         double_point = 0}).

-file("src/mod/reward_back/reward_back.erl", 33).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/reward_back/reward_back.erl", 34).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/reward_back/reward_back.erl", 35).

init() ->
    #m_reward_back{zero_time = date:unixtime(),
                   five_time = date:unixtime()}.

push(Role = #role{m_reward_back = Mrb}) ->
    role:link_send(Role, 18400, {Mrb}).

reward(Role = #role{m_reward_back =
                        Mrb = #m_reward_back{list = List, last_lev = OldLev}},
       ActiveId, Times, Type) ->
    logger:debug("奖励找回 数据 ~w",
                 [{ActiveId, Times, Type}],
                 reward_back,
                 46),
    List1 = lists:keysort(#reward_back_data.time, List),
    logger:debug("奖励找回 数据 ~w", [List1], reward_back, 48),
    case do_get_reward(List1, ActiveId, Times) of
        {ok, List2, Reward} ->
            logger:debug("奖励找回 ~w", [List2], reward_back, 51),
            case reward_back_data:get_active_data(ActiveId) of
                #{normal_exp := NormalExp, coin := Coin,
                  normal_gift := NormalGift, item := Item,
                  perfect_exp := PerfectExp,
                  perfect_gift := PerfectGift} ->
                    {Cost, Gift, Ratio} = case Type of
                                              1 ->
                                                  {get_loss(Type,
                                                            Coin,
                                                            Item,
                                                            Times),
                                                   PerfectGift,
                                                   PerfectExp};
                                              _ ->
                                                  {get_loss(Type,
                                                            Coin,
                                                            Item,
                                                            Times),
                                                   NormalGift,
                                                   NormalExp}
                                          end,
                    Gift1 = get_gift(Gift, OldLev),
                    NewReward = [{AssetsType,
                                  util:floor(Times * AssetsValue * Ratio / 100)}
                                 || {AssetsType, AssetsValue} <- Reward],
                    logger:debug("装换之后奖励  ~w",
                                 [NewReward],
                                 reward_back,
                                 60),
                    NewGift = [{ItemId, Count * Times}
                               || {ItemId, Count} <- Gift1],
                    Loss = format:val_to_loss(Cost,
                                              #{item_base_id_auto_buy => 1,
                                                auto_scene =>
                                                    lang:get("找回奖励")}),
                    Gain = format:val_to_gain(NewReward ++ NewGift),
                    NewGain = case lists:keytake(exp, #gain.label, Gain) of
                                  {value, Gain1, Gain2} ->
                                      [Gain1#gain{source = 12} | Gain2];
                                  _ -> Gain
                              end,
                    case role_gain:do_notice(NewGain ++ Loss, Role) of
                        {ok, Role1} ->
                            NewRole = Role1#role{m_reward_back =
                                                     Mrb#m_reward_back{list =
                                                                           List2}},
                            push(NewRole),
                            {ok, NewRole};
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("配置错误")}
            end;
        {false, Reason} -> {false, Reason}
    end.

get_loss(1, _Coin, Item, Times) ->
    [{ItemId, util:ceil(Times / Once)}
     || {ItemId, Once} <- Item];
get_loss(2, Coin, _Item, Times) ->
    [{90000, Coin * Times}].

reward_one_key(Role = #role{m_reward_back =
                                Mrb = #m_reward_back{list = List,
                                                     last_lev = OldLev}},
               Type) ->
    case do_get_reward_one_key(List,
                               Type,
                               #{reward => [], cost => [], gift => [],
                                 last_lev => OldLev},
                               [])
        of
        {#{cost := []}, _NewList} ->
            {false, lang:get("已找回所有奖励")};
        {#{reward := Reward, cost := Cost, gift := Gift},
         NewList} ->
            NewReward = merge(Reward),
            NewCost = merge(Cost),
            NewGift = merge(Gift),
            Gain = format:val_to_gain(NewGift ++ NewReward),
            Loss = format:val_to_loss(NewCost,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("一键找回")}),
            case role_gain:do_notice(Loss ++ Gain, Role) of
                {ok, Role1} ->
                    NewRole = Role1#role{m_reward_back =
                                             Mrb#m_reward_back{list = NewList}},
                    push(NewRole),
                    {ok, NewRole};
                {false, #gain{msg = Msg}} -> {false, Msg};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("数据错误")}
    end.

merge(List) -> merge(List, []).

merge([], List) -> List;
merge([{Key, Value} | T], List) ->
    case lists:keytake(Key, 1, List) of
        {value, {Key, OldValue}, List1} ->
            merge(T, [{Key, Value + OldValue} | List1]);
        _ -> merge(T, [{Key, Value} | List])
    end.

do_get_reward(List1, ActiveId, Times) ->
    do_get_reward(List1, ActiveId, Times, [], []).

do_get_reward(T, _ActiveId, 0, List, Reward) ->
    {ok, T ++ List, Reward};
do_get_reward([], _ActiveId, _Times, _List, _Reward) ->
    {false, lang:get("可找回次数不足")};
do_get_reward([Data = #reward_back_data{active_id =
                                            ActiveId,
                                        finish = Finish, all = All, back = Back,
                                        reward = Reward}
               | T],
              ActiveId, Times, List, _Reward) ->
    case Finish + Back + Times =< All of
        true ->
            {ok,
             [Data#reward_back_data{back = Back + Times}] ++
                 T ++ List,
             Reward};
        _ ->
            do_get_reward(T,
                          ActiveId,
                          Times - (All - Finish - Back),
                          [Data#reward_back_data{back = All - Finish} | List],
                          Reward)
    end;
do_get_reward([Data | T], ActiveId, Times, List,
              Reward) ->
    do_get_reward(T,
                  ActiveId,
                  Times,
                  [Data | List],
                  Reward).

do_get_reward_one_key([], _Type, Args, NewList) ->
    {Args, NewList};
do_get_reward_one_key([Data =
                           #reward_back_data{active_id = ActiveId,
                                             finish = Finish, back = Back,
                                             all = All, reward = Reward}
                       | List],
                      Type,
                      Args = #{reward := OldReward, cost := OldCost,
                               gift := OldGift, last_lev := OldLev},
                      NewList)
    when All - Finish - Back > 0 ->
    Flag = case lists:keyfind(90010, 1, Reward) of
               false -> false;
               {90010, 0} -> false;
               _ -> true
           end,
    logger:debug("一键找回 ~w",
                 [{Reward, Flag}],
                 reward_back,
                 152),
    case reward_back_data:get_active_data(ActiveId) of
        #{normal_exp := NormalExp, coin := Coin,
          normal_gift := NormalGift, item := Item,
          perfect_exp := PerfectExp, perfect_gift := PerfectGift}
            when Flag =:= true ->
            Times = All - Finish - Back,
            {Cost, Gift, Ratio} = case Type of
                                      1 ->
                                          {get_loss(Type, Coin, Item, Times),
                                           PerfectGift,
                                           PerfectExp};
                                      _ ->
                                          {get_loss(Type, Coin, Item, Times),
                                           NormalGift,
                                           NormalExp}
                                  end,
            Gift1 = get_gift(Gift, OldLev),
            NewReward = [{AssetsType,
                          util:floor(Times * AssetsValue * Ratio / 100)}
                         || {AssetsType, AssetsValue} <- Reward],
            NewGift = [{ItemId, Count * Times}
                       || {ItemId, Count} <- Gift1],
            do_get_reward_one_key(List,
                                  Type,
                                  Args#{reward => NewReward ++ OldReward,
                                        cost => Cost ++ OldCost,
                                        gift => NewGift ++ OldGift},
                                  [Data#reward_back_data{back = Back + Times}
                                   | NewList]);
        _ ->
            do_get_reward_one_key(List,
                                  Type,
                                  Args,
                                  [Data | NewList])
    end;
do_get_reward_one_key([Data | List], Type, Args,
                      NewList) ->
    do_get_reward_one_key(List,
                          Type,
                          Args,
                          [Data | NewList]).

reset(Role = #role{lev = Lev,
                   m_reward_back =
                       Mrb = #m_reward_back{zero_time = Time, list = List}},
      _) ->
    Day = date:day_diff(Time, date:unixtime()),
    logger:debug("零点重置 ~w",
                 [{Day, Time}],
                 reward_back,
                 173),
    NewRole = case Day > 0 of
                  true ->
                      ZeroTime = date:unixtime(zero),
                      NewList = list_del(List,
                                         ZeroTime,
                                         reward_back_data:get_active_id(0)),
                      do_reset(reward_back_data:get_active_id(0),
                               Role#role{m_reward_back =
                                             Mrb#m_reward_back{zero_time =
                                                                   date:unixtime(),
                                                               list = NewList,
                                                               last_lev = Lev}},
                               Day);
                  _ -> Role
              end,
    push(NewRole),
    {ok, NewRole}.

reset_five(Role = #role{m_reward_back =
                            Mrb = #m_reward_back{five_time = Time,
                                                 list = List}},
           _Args) ->
    logger:debug("五点重置", [], reward_back, 185),
    FiveTime = date:get_five_reset(date:unixtime()),
    Day = case (FiveTime - Time) / (3600 * 24) of
              Diff when Diff < 0 -> 0;
              Diff -> util:ceil(Diff)
          end,
    logger:debug("=========五点重置 ==== ~w",
                 [{Day, Time, FiveTime}],
                 reward_back,
                 191),
    NewRole = case Day > 0 of
                  true ->
                      NewList = list_del(List,
                                         FiveTime,
                                         reward_back_data:get_active_id(5)),
                      do_reset(reward_back_data:get_active_id(5),
                               Role#role{m_reward_back =
                                             Mrb#m_reward_back{list = NewList,
                                                               five_time =
                                                                   date:unixtime()}},
                               Day);
                  _ -> Role
              end,
    push(NewRole),
    {ok, NewRole}.

list_del(List, _Time, _Ids) ->
    lists:foldl(fun (Data = #reward_back_data{id = _Id,
                                              active_id = Id, time = OldTime},
                     Acc) ->
                        ResetTime = case lists:member(Id,
                                                      reward_back_data:get_active_id(0))
                                        of
                                        true -> date:unixtime(zero);
                                        _ ->
                                            date:get_five_reset(date:unixtime())
                                    end,
                        case OldTime < ResetTime - 86400 * 2 of
                            true -> Acc;
                            _ -> [Data | Acc]
                        end
                end,
                [],
                List).

do_reset([], Role, _Day) -> Role;
do_reset([Id | T], Role = #role{lev = Lev}, Day) ->
    case reward_back_data:get_active_data(Id) of
        #{lev := LevMin, lev_max := LevMax}
            when Lev >= LevMin andalso Lev =< LevMax ->
            NewRole = do_reset_id(Id, Role, Day),
            do_reset(T, NewRole, Day);
        _ -> do_reset(T, Role, Day)
    end.

do_reset_id(Id,
            Role = #role{m_reward_back =
                             Mrb = #m_reward_back{next_id = NextId,
                                                  list = Lists,
                                                  world_lev = _FiveWorldLev},
                         m_agenda = #m_agenda{progress = Progs}},
            Day)
    when Day =:= 1 ->
    JoinedTimes = case lists:keyfind(Id,
                                     #agenda_prog.id,
                                     Progs)
                      of
                      #agenda_prog{joined = Joined} -> Joined;
                      _ -> 0
                  end,
    TotalTimes = case reward_back_data:get_active_data(Id)
                     of
                     #{total := Total} -> Total;
                     _ -> 0
                 end,
    Reward = get_reward(Id, Role, JoinedTimes, TotalTimes),
    WorldLev = case lists:member(Id,
                                 reward_back_data:get_active_id(0))
                   of
                   true -> world_lev:get_world_lev_yesterday();
                   _ ->
                       {WorldLev0, _Time} = world_lev:get_world_lev(),
                       WorldLev0
               end,
    Reward1 = reward_world_lev(Reward, WorldLev, Role),
    Data = #reward_back_data{id = NextId, active_id = Id,
                             finish = JoinedTimes, all = TotalTimes, back = 0,
                             time = date:unixtime() - 86400, reward = Reward1},
    Lists2 = update_reward(Lists, Data),
    Role#role{m_reward_back =
                  Mrb#m_reward_back{next_id = NextId + 1,
                                    list = [Data | Lists2]}};
do_reset_id(Id,
            Role = #role{m_reward_back =
                             Mrb = #m_reward_back{next_id = NextId,
                                                  world_lev = _FiveWorldLev,
                                                  list = Lists}},
            _Day) ->
    TotalTimes = case reward_back_data:get_active_data(Id)
                     of
                     #{total := Total} -> Total;
                     _ -> 0
                 end,
    Reward = get_reward(Id, Role, 0, TotalTimes),
    WorldLev = case lists:member(Id,
                                 reward_back_data:get_active_id(0))
                   of
                   true -> world_lev:get_world_lev_yesterday();
                   _ ->
                       {WorldLev0, _Time} = world_lev:get_world_lev(),
                       WorldLev0
               end,
    Reward1 = reward_world_lev(Reward, WorldLev, Role),
    Lists1 = update_reward(Lists,
                           #reward_back_data{active_id = Id, reward = Reward1}),
    logger:debug("奖励重新计算 ~w",
                 [{Reward, Reward1, WorldLev}],
                 reward_back,
                 265),
    case lists:keyfind(Id,
                       #reward_back_data.active_id,
                       Lists)
        of
        false ->
            Datas = [#reward_back_data{id = NextId, active_id = Id,
                                       all = TotalTimes,
                                       time = date:unixtime() - 86400,
                                       reward = Reward1},
                     #reward_back_data{id = NextId + 1, active_id = Id,
                                       all = TotalTimes,
                                       time = date:unixtime() - 86400 * 2,
                                       reward = Reward1}],
            Role#role{m_reward_back =
                          Mrb#m_reward_back{next_id = NextId + 2,
                                            list = Datas ++ Lists1}};
        _ ->
            Role#role{m_reward_back =
                          Mrb#m_reward_back{next_id = NextId + 1,
                                            list =
                                                [#reward_back_data{id = NextId,
                                                                   active_id =
                                                                       Id,
                                                                   all =
                                                                       TotalTimes,
                                                                   time =
                                                                       date:unixtime()
                                                                           -
                                                                           86400,
                                                                   reward =
                                                                       Reward1}
                                                 | Lists1]}}
    end.

get_reward(Id, #role{lev = Lev}, Times, TotalTimes)
    when Id =:= 1000 ->
    case quest_data:get(30000) of
        #quest_data{rewards_commit = Reward} ->
            {Exp, _Coin} = cal_quest_offer(Lev,
                                           Reward,
                                           Times,
                                           TotalTimes,
                                           0,
                                           0),
            [{90010, util:floor(Exp / max(1, TotalTimes - Times))}];
        _ -> []
    end;
get_reward(Id, #role{lev = Lev}, Times, TotalTimes)
    when Id =:= 1001 ->
    case quest_data:get(20000) of
        #quest_data{rewards_commit = Reward} ->
            {Exp, _Coin} = cal_quest_class(Lev,
                                           Reward,
                                           Times,
                                           TotalTimes,
                                           0,
                                           0),
            [{90010, util:floor(Exp / max(1, TotalTimes - Times))}];
        _ -> []
    end;
get_reward(Id, #role{m_guild = undefined}, _Times,
           _TotalTimes)
    when Id =:= 1013 ->
    [];
get_reward(Id,
           #role{m_guild = #m_guild{id = {0, "", 0}}}, _Times,
           _TotalTimes)
    when Id =:= 1013 ->
    [];
get_reward(Id,
           #role{lev = Lev, m_guild = #m_guild{id = GuildId}},
           Times, TotalTimes)
    when Id =:= 1013 ->
    #{exp := Exp, coin := _Coin, donation := Donation} =
        cal_quest_guild(Lev,
                        GuildId,
                        Times,
                        TotalTimes,
                        #{exp => 0, coin => 0, donation => 0}),
    [{90010, util:floor(Exp / max(1, TotalTimes - Times))},
     {90011,
      util:floor(Donation / max(1, TotalTimes - Times))}];
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 1014 ->
    case levup_data:get_exp({1002, Lev}) of
        #{exp := Exp, coin := Coin} ->
            [{90010, Exp}, {90000, Coin}];
        _ -> []
    end;
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 2013 ->
    case levup_data:get_exp({3014, Lev}) of
        #{exp := Exp, coin := Coin} ->
            [{90010, Exp}, {90000, Coin}];
        _ -> []
    end;
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 1007 ->
    case levup_data:get_exp({3014, Lev}) of
        #{exp := Exp, coin := Coin} ->
            [{90010, Exp}, {90000, Coin}];
        _ -> []
    end;
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 1002 ->
    case arena_data:get_exp(Lev) of
        {Exp, _PetExp} -> [{90010, Exp}];
        _ -> []
    end;
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 1026 ->
    {Exp3, Coin3} = do_get_exp(Lev),
    [{90010, Exp3}, {90000, Coin3}];
get_reward(Id, #role{lev = Lev}, _Times, _TotalTimes)
    when Id =:= 1028 ->
    {Exp3, Coin3} = do_get_exp(Lev),
    [{90010, Exp3}, {90000, Coin3}];
get_reward(_Id, _Role, _Times, _TotalTimes) -> [].

get_gift(Reward, Lev) ->
    [{BaseId, Num}
     || {BaseId, Num, LevMin, LevMax} <- Reward,
        Lev >= LevMin, Lev =< LevMax].

do_get_exp(Lev) ->
    {Exp2, Coin2} = case levup_data:get_exp({2060, Lev}) of
                        #{exp := Exp1, coin := Coin1} -> {Exp1, Coin1};
                        _ -> {0, 0}
                    end,
    {Exp4, Coin4} = case levup_data:get_exp({2061, Lev}) of
                        #{exp := Exp3, coin := Coin3} -> {Exp3, Coin3};
                        _ -> {0, 0}
                    end,
    {Exp2 * 3 + Exp4 * 2, Coin2 * 3 + Coin4 * 2}.

cal_quest_offer(_Lev, _Reward, Times, TotalTimes, Exp,
                Coin)
    when Times >= TotalTimes ->
    {Exp, Coin};
cal_quest_offer(Lev, Reward, Times, TotalTimes, OldExp,
                OldCoin) ->
    QuestGains = case quest_data:get(30000) of
                     #quest_data{rewards_commit = RewardsCommit} ->
                         RewardsCommit;
                     _ -> []
                 end,
    {DynAvgLevExpRatio, DynMemNumExpRatio} = {1,
                                              1.15999999999999992006},
    Double = 1,
    RingDouble = case Times < 10 of
                     true -> 7.5e-1;
                     false -> 0
                 end,
    Gains = case Times =:= 9 of
                true -> [#gain{label = exp, val = 7650} | QuestGains];
                false -> QuestGains
            end,
    InitCalcRewardRatio =
        #quest_offer_reward_ratio{double_point = Double,
                                  ring_20_double = RingDouble},
    Round = Times rem 10 + 1,
    {CalcGains, ResultRewardRatio} = case
                                         quest_offer_data:get_count_ratio(Round)
                                         of
                                         #quest_offer_ratio_data{exp_ratio =
                                                                     CExp,
                                                                 coin_ratio =
                                                                     CCoin,
                                                                 leader_ratio =
                                                                     CLeader} ->
                                             CalcRatio1 =
                                                 #quest_offer_calc_ratio{count_exp
                                                                             =
                                                                             CExp,
                                                                         count_coin
                                                                             =
                                                                             CCoin,
                                                                         count_leader
                                                                             =
                                                                             CLeader},
                                             case
                                                 quest_offer_data:get_lev_ratio(Lev)
                                                 of
                                                 #quest_offer_ratio_data{exp_ratio
                                                                             =
                                                                             LExp,
                                                                         coin_ratio
                                                                             =
                                                                             LCoin} ->
                                                     CalcRatio =
                                                         CalcRatio1#quest_offer_calc_ratio{lev_exp
                                                                                               =
                                                                                               LExp,
                                                                                           lev_coin
                                                                                               =
                                                                                               LCoin},
                                                     NewGains =
                                                         quest_offer:sort_reward_gain(Gains,
                                                                                      [],
                                                                                      []),
                                                     CalcRewardRatio =
                                                         quest_offer:calc_reward_ratio(2,
                                                                                       CalcRatio,
                                                                                       InitCalcRewardRatio,
                                                                                       DynAvgLevExpRatio,
                                                                                       DynMemNumExpRatio),
                                                     {NewGains,
                                                      CalcRewardRatio};
                                                 _None ->
                                                     {Gains,
                                                      InitCalcRewardRatio}
                                             end;
                                         none -> {Gains, InitCalcRewardRatio}
                                     end,
    CalcRewards = quest_offer:calc_reward(CalcGains,
                                          ResultRewardRatio,
                                          []),
    NewExp1 = case lists:keyfind(90010, 1, CalcRewards) of
                  {_, NewExp} -> NewExp;
                  _ -> 0
              end,
    NewCoin1 = case lists:keyfind(90000, 1, CalcRewards) of
                   {_, NewCoin} -> NewCoin;
                   _ -> 0
               end,
    cal_quest_offer(Lev,
                    Reward,
                    Times + 1,
                    TotalTimes,
                    OldExp + NewExp1,
                    OldCoin + NewCoin1).

cal_quest_class(_Lev, _Reward, Times, TotalTimes, Exp,
                Coin)
    when Times > TotalTimes ->
    {Exp, Coin};
cal_quest_class(Lev, Reward, Times, TotalTimes, OldExp,
                OldCoin) ->
    {LevExpRatio, LevCoinRatio} =
        quest_classes_data:get_lev_reward_ratio(Lev),
    {CoinRatio, ExpRatio} =
        quest_classes_data:get_task_seq_ratio({1, Times + 1}),
    NewLevRatio = LevExpRatio * ExpRatio / 1000000,
    NewLevCoinRatio = LevCoinRatio * CoinRatio / 1000000,
    NewExp = case lists:keyfind(exp, #gain.label, Reward) of
                 #gain{val = ExpVal} ->
                     util:floor(NewLevRatio * ExpVal) + OldExp;
                 _ -> 0
             end,
    NewCoin = case lists:keyfind(coin, #gain.label, Reward)
                  of
                  #gain{val = CoinVal} ->
                      util:floor(NewLevCoinRatio * CoinVal) + OldCoin;
                  _ -> 0
              end,
    cal_quest_class(Lev,
                    Reward,
                    Times + 1,
                    TotalTimes,
                    NewExp,
                    NewCoin).

cal_quest_guild(_Lev, _GuildId, Times, TotalTimes, Args)
    when Times > TotalTimes ->
    Args;
cal_quest_guild(Lev, GuildId, Times, TotalTimes,
                Args = #{exp := OldExp, coin := OldCoin,
                         donation := OldDonation}) ->
    {LevExpRatio, _} = quest_guild_data:get_lev(Lev),
    #{exp_ratio := ExpRatio, donation := Donation,
      coin := Coin} =
        quest_guild_data:get_ring(Times + 1),
    NewLevRatio = LevExpRatio * ExpRatio / 1000000,
    GuildRatio = case
                     guild_data:academy(guild_mgr:attr(GuildId,
                                                       #guild.academy_lev))
                     of
                     #{task_rate := TRatio} -> TRatio;
                     _ -> 100
                 end,
    logger:debug("公会加成 ~w", [GuildRatio], reward_back, 458),
    Base = 1807,
    {ExpLeagueRate, CoinLeagueRate, DonationLeagueRate} =
        case env:get(guild_league_champion) of
            GuildId -> {1.5, 2, 2};
            _ -> {1, 1, 1}
        end,
    AddExp = round(Base * NewLevRatio * GuildRatio *
                       ExpLeagueRate
                       / 100),
    AddCoin = round(Coin * CoinLeagueRate),
    AddDonation = round(Donation * DonationLeagueRate),
    cal_quest_guild(Lev,
                    GuildId,
                    Times + 1,
                    TotalTimes,
                    Args#{exp => OldExp + AddExp, coin => OldCoin + AddCoin,
                          donation => OldDonation + AddDonation}).

reward_world_lev(Reward, WorldLev,
                 Role = #role{lev = RoleLevBase}) ->
    RoleLev = case WorldLev >= 100 andalso
                       lev_break:get_times(Role) =:= 0
                  of
                  true -> min(RoleLevBase, 95);
                  _ -> levup:get_real_lev(Role)
              end,
    logger:debug("============ ~w",
                 [{RoleLev, WorldLev}],
                 reward_back,
                 476),
    ExpRatio1 = case RoleLev - WorldLev >= 7 of
                    true -> 0;
                    _ ->
                        {_WorldLev, ExpRatio, _CoinRatio} =
                            world_lev:calc_exp(RoleLev, WorldLev),
                        ExpRatio
                end,
    Fun = fun ({90010, Exp}, Acc) ->
                  [{90010, util:floor(Exp * ExpRatio1 / 1000)} | Acc];
              (Other, Acc) -> [Other | Acc]
          end,
    lists:foldl(Fun, [], Reward).

update_reward(List, Data) ->
    update_reward(List, Data, []).

update_reward([], _Data, NewList) -> NewList;
update_reward([#reward_back_data{active_id = Id} =
                   OldData
               | T],
              Data = #reward_back_data{active_id = Id,
                                       reward = Reward},
              NewList) ->
    update_reward(T,
                  Data,
                  [OldData#reward_back_data{reward = Reward} | NewList]);
update_reward([OldData | T], Data, NewList) ->
    update_reward(T, Data, [OldData | NewList]).

gm(Role = #role{m_reward_back = Mrb}, Day) ->
    Time = date:unixtime() - Day * 86400,
    {ok,
     Role#role{m_reward_back =
                   Mrb#m_reward_back{zero_time = Time, five_time = Time,
                                     list = []}}}.

