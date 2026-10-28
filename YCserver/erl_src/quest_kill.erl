-file("src/mod/quest/quest_kill.erl", 1).

-module(quest_kill).

-behaviour(gen_server).

-export([start_link/0,
         login/1,
         level_up/1,
         get_token/1,
         accept/3,
         upgrade_star/1,
         upgrade_star/5,
         get_list/1,
         get_reward/2,
         get_info/1,
         get_total_num/1,
         get_records/1,
         next/3,
         push_help_star/3,
         push_info/1,
         sync_guild/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/quest/quest_kill.erl", 39).

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

-file("src/mod/quest/quest_kill.erl", 40).

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

-file("src/mod/quest/quest_kill.erl", 41).

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

-file("src/mod/quest/quest_kill.erl", 42).

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

-file("src/mod/quest/quest_kill.erl", 43).

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

-file("src/mod/quest/quest_kill.erl", 44).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/quest/quest_kill.erl", 45).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/quest/quest_kill.erl", 46).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/quest/quest_kill.erl", 47).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/quest/quest_kill.erl", 48).

-file("inc/quest_kill.hrl", 1).

-record(quest_kill,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         pid = 0,
         quest_id = 0,
         guild_id = {0, "", 0},
         star = 0,
         status = 1,
         start_time = 0,
         next_id = 1,
         record_len = 0,
         star_record = queue:new(),
         total_num = 0,
         item_reward = []}).

-record(quest_kill_star_record,
        {id = 0,
         type = 1,
         rid = {0, "", 0},
         help_name = "",
         time = 0,
         star = 0,
         help_star = 1}).

-file("src/mod/quest/quest_kill.erl", 49).

-record(state, {}).

-export([gm_lookup_quest/1, gm_clean/1]).

gm_lookup_quest(Rid) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{quest_id = QuestId, star = Star,
                    status = Status, total_num = Total,
                    item_reward = ItemReward} ->
            StatusStr = case Status of
                            1 -> "未接受";
                            2 -> "进行中";
                            3 -> "完成"
                        end,
            util:flist("任务Id：~w, 星级：~w, 状态：~ts, 完成次数：~w, 道具奖励：~w",
                       [QuestId, Star, StatusStr, Total, ItemReward]);
        _False -> util:flist("查看历练任务数据错误：~w", [_False])
    end.

gm_clean(#role{id = Rid}) ->
    gen_server:cast(quest_kill, {clean, Rid}),
    util:flist("清空历练(屠魔)任务成功").

login(#role{lev = Lev}) when Lev < 40 -> ok;
login(Role = #role{id = Rid, lev = Lev, pid = Pid}) ->
    QuestRole = case case catch ets:lookup(quest_kill, Rid)
                         of
                         [Obj] -> Obj;
                         [] -> none;
                         _ -> false
                     end
                    of
                    none ->
                        case quest_kill_data:get_quest_id(Lev) of
                            0 -> ok;
                            QuestId ->
                                gen_server:cast(quest_kill,
                                                {quest_id,
                                                 {Rid, Pid},
                                                 {QuestId, Lev}}),
                                ok
                        end,
                        Role;
                    #quest_kill{status = 2, quest_id = 0} ->
                        case quest_kill_data:get_quest_id(Lev) of
                            0 -> ok;
                            QuestId ->
                                gen_server:cast(quest_kill,
                                                {revise,
                                                 {Rid, Pid},
                                                 {QuestId, Lev}}),
                                ok
                        end,
                        Role;
                    #quest_kill{status = 2, quest_id = QuestId} ->
                        {_, NextRole} = role_trigger:add(#trigger{label =
                                                                      evt_commit_quest,
                                                                  m =
                                                                      quest_kill,
                                                                  f = next,
                                                                  a =
                                                                      [QuestId]},
                                                         Role),
                        NextRole;
                    Quest = #quest_kill{lev = OldLev} ->
                        case Lev > OldLev of
                            true -> check_quest_id(Quest, Role);
                            false -> ok
                        end,
                        Role;
                    _False -> Role
                end,
    {_, JoinRole} = role_trigger:add(#trigger{label =
                                                  evt_guild,
                                              m = quest_kill, f = sync_guild,
                                              a = []},
                                     QuestRole),
    {_, NewRole} = role_trigger:add(#trigger{label =
                                                 evt_guild_leave,
                                             m = quest_kill, f = sync_guild,
                                             a = []},
                                    JoinRole),
    {ok, NewRole}.

sync_guild(#evt_guild{},
           #role{id = Rid, m_guild = #m_guild{id = GuildId}}) ->
    gen_server:cast(quest_kill, {join, Rid, GuildId}),
    ok;
sync_guild(#evt_guild_leave{}, #role{id = Rid}) ->
    gen_server:cast(quest_kill, {leave, Rid}),
    ok.

level_up(Role = #role{lev = Lev}) when Lev < 40 -> Role;
level_up(Role = #role{id = Rid, lev = Lev,
                      pid = Pid}) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        none ->
            case quest_kill_data:get_quest_id(Lev) of
                0 -> ok;
                QuestId ->
                    gen_server:cast(quest_kill,
                                    {quest_id, {Rid, Pid}, {QuestId, Lev}}),
                    ok
            end,
            ok;
        #quest_kill{status = 2, quest_id = 0} ->
            case quest_kill_data:get_quest_id(Lev) of
                0 -> ok;
                QuestId ->
                    gen_server:cast(quest_kill,
                                    {revise, {Rid, Pid}, {QuestId, Lev}}),
                    ok
            end,
            ok;
        #quest_kill{status = 2} -> ok;
        Quest = #quest_kill{} ->
            check_quest_id(Quest, Role),
            ok;
        _False -> ok
    end,
    Role.

next(#evt_commit_quest{id = QuestId},
     Role = #role{id = Rid, lev = Lev, pid = Pid},
     QuestId) ->
    DayCount = var:get_var(Role, day, 18, 0),
    NewDayCount = DayCount + 1,
    case NewDayCount =< 3 of
        true ->
            case quest_kill_data:get_quest_id(Lev) of
                0 -> ok;
                NewQuestId ->
                    case gen_server:call(quest_kill,
                                         {commit,
                                          {Rid, Pid},
                                          {NewQuestId, Lev}})
                        of
                        ok ->
                            Msg = case NewDayCount =:= 3 of
                                      false ->
                                          notice:format(lang:get("您今日已提交~w次历练任务，还可提交~w次"),
                                                        [NewDayCount,
                                                         3 - NewDayCount]);
                                      true ->
                                          notice:format(lang:get("您今天已提交~w次历练任务，请明天再来吧"),
                                                        [3])
                                  end,
                            notice:send(Role, 11, Msg),
                            VarRole = var:add_var(Role, day, 18, 1, 0),
                            push_info(VarRole),
                            {remove, VarRole};
                        _False ->
                            logger:error("提交屠魔（历练）任务失败~w",
                                         [_False],
                                         quest_kill,
                                         225),
                            remove
                    end
            end;
        false -> remove
    end;
next(_Evt, _Role, _QuestId) -> ok.

check_quest_id(#quest_kill{status = 2}, _Role) -> ok;
check_quest_id(_Quest,
               Role = #role{id = Rid, lev = NewLev, pid = Pid}) ->
    DayCount = var:get_var(Role, day, 18, 0),
    case DayCount < 3 of
        true ->
            case quest_kill_data:get_quest_id(NewLev) of
                0 -> ok;
                QuestId ->
                    gen_server:cast(quest_kill,
                                    {quest_id, {Rid, Pid}, {QuestId, NewLev}}),
                    ok
            end,
            ok;
        false -> ok
    end,
    ok.

get_token(Role) ->
    IsGain = var:get_var(Role, day, 19, 0),
    case IsGain of
        0 ->
            Gain = [#gain{label = item_base_id,
                          val = [{20058, 1, 5}]}],
            case role_gain:do_notice(Gain, Role) of
                {ok, NRole} ->
                    NewRole = var:set_var(NRole, day, 19, 1),
                    {ok, NewRole};
                {false, #gain{msg = Msg}} -> {false, Msg};
                _False -> false
            end;
        1 -> {false, lang:get("您今日已领取过历练令")}
    end.

accept(#role{lev = Lev}, item, _Args) when Lev < 40 ->
    {false, lang:get("要达到40级才能使用历练令哟")};
accept(#role{lev = Lev}, _Tag, _Args) when Lev < 40 ->
    {false, lang:get("要达到40级才能接受历练任务哟")};
accept(Role = #role{id = Rid}, _Tag, Args) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        none -> {false, lang:get("您当前不可以接受历练任务")};
        Quest = #quest_kill{} -> do_accept(Quest, Args, Role);
        _False -> {false, lang:get("您当前不可以接受历练任务")}
    end.

do_accept(#quest_kill{status = 2}, _Args, _Role) ->
    {false, lang:get("您只能同时接受一个历练任务哟")};
do_accept(#quest_kill{quest_id = QuestId}, Args,
          Role) ->
    DayCount = var:get_var(Role, day, 18, 0),
    case DayCount < 3 of
        true -> transaction_accept(Role, Args, QuestId);
        false -> {false, lang:get("您今天已提交3次历练任务，请明天再来吧！")}
    end.

accept_quest(Role = #role{m_guild = MGuild}, QuestId) ->
    GuildId = case MGuild of
                  #m_guild{id = RtnGuild} -> RtnGuild;
                  _False -> {0, "", 0}
              end,
    ItemList = quest_kill_data:get_item_reward(),
    case util:rand_list(ItemList, 1) of
        {_Weight, ItemBaseId, IsBind, Num} ->
            case quest_filter:check(QuestId, Role) of
                true ->
                    do_accept_quest(Role,
                                    QuestId,
                                    GuildId,
                                    ItemBaseId,
                                    {ItemBaseId, IsBind, Num});
                false -> false
            end;
        _Undef -> false
    end.

do_accept_quest(Role = #role{name = _Name}, QuestId,
                GuildId, ItemBaseId, Item) ->
    Star = util:rand(1, 3),
    case case catch gen_server:call(quest_kill,
                                    {accept,
                                     Role#role.id,
                                     Role#role.name,
                                     Role#role.lev,
                                     Role#role.sex,
                                     Role#role.classes,
                                     {GuildId, Star, [Item]}},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        false -> false;
        ok ->
            case quest:callback_accept(Role,
                                       QuestId,
                                       [accept, fire])
                of
                ok ->
                    logger:error("[~ts]接受屠魔任务[QuestId:~w]失败",
                                 [_Name, QuestId],
                                 quest_kill,
                                 321),
                    false;
                {ok, AcceptRole} ->
                    {_, NewRole} = role_trigger:add(#trigger{label =
                                                                 evt_commit_quest,
                                                             m = quest_kill,
                                                             f = next,
                                                             a = [QuestId]},
                                                    AcceptRole),
                    DayCount = var:get_var(NewRole, day, 18, 0),
                    {ok, {DayCount, ItemBaseId, Star}, NewRole}
            end
    end.

transaction_accept(Role, {IsAuto, ItemBaseId, Num},
                   QuestId) ->
    role:send_buff_begin(),
    Loss = case IsAuto of
               1 ->
                   [#loss{label = item_base_id_auto_buy,
                          val = [{ItemBaseId, Num}]}];
               0 ->
                   [#loss{label = item_base_id, val = [{ItemBaseId, Num}]}]
           end,
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            case accept_quest(LossRole, QuestId) of
                Rtn = {ok, _Reply, _NRole} ->
                    role:send_buff_flush(),
                    Rtn;
                _False ->
                    role:send_buff_clean(),
                    false
            end;
        {false, #loss{msg = _Msg}} ->
            role:send_buff_clean(),
            {false, lang:get("您目前还未拥有历练令哟")};
        _False ->
            role:send_buff_clean(),
            false
    end.

upgrade_star(#role{lev = Lev}) when Lev < 40 ->
    {false, lang:get("未达到40级，无法刷新历练任务")};
upgrade_star(Role = #role{id = Rid}) ->
    case check_start(Rid) of
        true ->
            Loss = [#loss{label = item_base_id,
                          val = [{20058, 1}]}],
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    case case catch gen_server:call(quest_kill,
                                                    {upgrade_star, Rid},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, AddStar} -> {ok, AddStar, LossRole};
                        _False -> false
                    end;
                {false, _LossRec} -> {false, lang:get("缺乏历练令，无法升星")};
                _False -> false
            end;
        false -> {false, lang:get("任务未开始，刷新失败")}
    end.

upgrade_star(_HelpRid, _IsAuto, _ItemBaseId, _Num,
             #role{lev = Lev})
    when Lev < 40 ->
    {false, lang:get("未达到40级，无法刷新历练任务")};
upgrade_star(HelpRid, IsAuto, ItemBaseId, Num, Role) ->
    case check_start(HelpRid) of
        true ->
            Loss = case IsAuto of
                       0 ->
                           [#loss{label = item_base_id,
                                  val = [{ItemBaseId, Num}]}];
                       1 ->
                           [#loss{label = item_base_id_auto_buy,
                                  val = [{ItemBaseId, Num}]}]
                   end,
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole = #role{id = Rid, name = Name}} ->
                    case case catch gen_server:call(quest_kill,
                                                    {upgrade_star,
                                                     HelpRid,
                                                     Rid,
                                                     Name},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {ok, Reply} -> {ok, Reply, LossRole};
                        {false, Msg} -> {false, Msg};
                        false -> false
                    end;
                {false, _LossRec} -> {false, lang:get("缺乏历练，无法升星")};
                _False -> false
            end;
        Rtn = {false, _Msg} -> Rtn;
        _False -> {false, lang:get("任务未开始，刷新失败")}
    end.

check_start(Rid) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{status = 2, star = Star} when Star =:= 10 ->
            {false, lang:get("星级已满，无需再次刷新")};
        #quest_kill{status = 2, star = Star} when Star < 10 ->
            true;
        _False -> false
    end.

get_list(Role) ->
    List = do_get_list(Role),
    [{Id, Platform, ZoneId, Name, Lev, Classes, Sex, Star}
     || #quest_kill{rid = {Id, Platform, ZoneId},
                    name = Name, lev = Lev, classes = Classes, sex = Sex,
                    star = Star}
            <- List].

do_get_list(Role = #role{m_guild = undefined}) ->
    get_friends(Role, []);
do_get_list(Role = #role{id = Rid,
                         m_guild = #m_guild{id = GuildId}}) ->
    Ms = [{#quest_kill{guild_id = '$1', rid = '$2',
                       status = '$3', _ = '_'},
           [{'andalso',
             {'=/=', {const, Rid}, '$2'},
             {'=:=', {const, GuildId}, '$1'},
             {'=:=', {const, 2}, '$3'}}],
           ['$_']}],
    case catch ets:select(quest_kill, Ms) of
        GuildList = [_ | _] ->
            case guild_mgr:members(GuildId) of
                {ok, Members} ->
                    Now = date:unixtime(),
                    FilterGuildList = filter_guild_role(GuildList,
                                                        Now,
                                                        Members,
                                                        []),
                    get_friends(Role, FilterGuildList);
                _False -> get_friends(Role, [])
            end;
        _False -> get_friends(Role, [])
    end.

filter_guild_role([], _Now, _Members, Acc) -> Acc;
filter_guild_role([Quest = #quest_kill{rid = Rid}
                   | Rest],
                  Now, Members, Acc) ->
    case lists:keyfind(Rid, #guild_role.id, Members) of
        #guild_role{status = 1} ->
            filter_guild_role(Rest, Members, Now, [Quest | Acc]);
        #guild_role{last_logout = LastLogout}
            when LastLogout >= Now - 1800 ->
            filter_guild_role(Rest, Members, Now, [Quest | Acc]);
        _False -> filter_guild_role(Rest, Members, Now, Acc)
    end.

get_records(#role{id = Rid}) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{star_record = Records} ->
            List = queue:to_list(Records),
            [{Id,
              Platform,
              ZoneId,
              Type,
              HelpName,
              Time,
              Star,
              HelpStar}
             || #quest_kill_star_record{rid = {Id, Platform, ZoneId},
                                        help_name = HelpName, type = Type,
                                        time = Time, star = Star,
                                        help_star = HelpStar}
                    <- List];
        _False -> []
    end.

get_friends(Role, Acc) ->
    Now = date:unixtime(),
    List = friend:list(Role),
    FrdRoleList = [FrdRole || {_FrdShip, FrdRole} <- List],
    get_friend_list(FrdRoleList, Now, [], Acc).

get_friend_list([], _Now, FrdList, GuildList) ->
    lists:flatten([FrdList, GuildList]);
get_friend_list([FrdRole = #friend_role{online = Online,
                                        online_time = Time}
                 | Rest],
                Now, Acc, GuildList) ->
    Status = case Online of
                 1 -> check_friend_status(FrdRole, GuildList);
                 0 ->
                     case Time >= Now - 1800 of
                         true -> check_friend_status(FrdRole, GuildList);
                         false -> false
                     end
             end,
    case Status of
        {true, Quest} ->
            get_friend_list(Rest, Now, [Quest | Acc], GuildList);
        _False -> get_friend_list(Rest, Now, Acc, GuildList)
    end.

check_friend_status(#friend_role{id = Id}, GuildList) ->
    case case catch ets:lookup(quest_kill, Id) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{status = 2} ->
            case GuildList =:= [] of
                false ->
                    case lists:keyfind(Id, #quest_kill.rid, GuildList) of
                        #quest_kill{} -> false;
                        _False -> {true, Quest}
                    end;
                true -> {true, Quest}
            end;
        _False -> false
    end.

get_reward(#quest_data{rewards_commit = Rewards},
           #role{id = Rid}) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{lev = Lev, star = Star,
                    item_reward = ItemReward} ->
            LevRatio = quest_kill_data:get_lev_ratio(Lev),
            StarRatio = quest_kill_data:get_star_ratio(Star),
            CalcRewards = calc_rewards(Rewards,
                                       LevRatio,
                                       StarRatio,
                                       []),
            NewRewards = case Star >= 8 of
                             true ->
                                 ItemGain = #gain{label = item_base_id,
                                                  val = ItemReward},
                                 [ItemGain | CalcRewards];
                             false -> CalcRewards
                         end,
            {ok, NewRewards};
        _False ->
            logger:debug("为什么没有屠魔任务数据[Err:~w]",
                         [_False],
                         quest_kill,
                         533),
            {ok, []}
    end.

calc_rewards([], _LevRatio, _StarRatio, Acc) -> Acc;
calc_rewards([Gain = #gain{label = exp, val = Val}
              | Rest],
             LevRatio, StarRatio, Acc) ->
    NewVal = util:floor(Val * LevRatio * StarRatio /
                            1000000),
    NewGain = Gain#gain{val = NewVal},
    PetGain = #gain{label = pet_exp, val = NewVal},
    calc_rewards(Rest,
                 LevRatio,
                 StarRatio,
                 [NewGain, PetGain | Acc]);
calc_rewards([_H | Rest], LevRatio, StarRatio, Acc) ->
    logger:error("未知的屠魔任务奖励~w", [_H], quest_kill, 549),
    calc_rewards(Rest, LevRatio, StarRatio, Acc).

get_info(Role = #role{id = Rid, pid = Pid}) ->
    DayCount = var:get_var(Role, day, 18, 0),
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{star = Star, quest_id = QuestId,
                    item_reward = [{ItemBaseId, _IsBind, _Num}]} ->
            gen_server:cast(quest_kill, {alive, Rid, Pid}),
            {ok, {QuestId, Star, DayCount, ItemBaseId}};
        #quest_kill{star = Star, quest_id = QuestId} ->
            gen_server:cast(quest_kill, {alive, Rid, Pid}),
            {ok, {QuestId, Star, DayCount, 0}};
        _False -> {ok, {0, 0, DayCount, 0}}
    end.

get_total_num(#role{id = Rid}) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        #quest_kill{total_num = Count} -> Count;
        _False -> 0
    end.

start_link() ->
    gen_server:start_link({local, quest_kill},
                          quest_kill,
                          [],
                          []).

init([]) ->
    logger:info("屠魔（历练）任务正在启动:[~w]",
                [quest_kill],
                quest_kill,
                599),
    process_flag(trap_exit, true),
    case catch load_data() of
        ok ->
            logger:info("屠魔（历练）任务启动完成:[~w]",
                        [quest_kill],
                        quest_kill,
                        603),
            {ok, #state{}};
        {error, LoadErr} ->
            logger:error("屠魔（历练）任务启动失败:[~w][Err:~w]",
                         [quest_kill, LoadErr],
                         quest_kill,
                         606),
            {stop, abnormal};
        Exit ->
            logger:error("屠魔（历练）任务启动失败:[~w][Err:~w]",
                         [quest_kill, Exit],
                         quest_kill,
                         609),
            {stop, abnormal}
    end.

handle_call({accept,
             Rid,
             Name,
             Lev,
             Sex,
             Classes,
             {GuildId, Star, Items}},
            _From, State) ->
    Reply = case case catch ets:lookup(quest_kill, Rid) of
                     [Obj] -> Obj;
                     [] -> none;
                     _ -> false
                 end
                of
                Quest = #quest_kill{} ->
                    Now = date:unixtime(),
                    NewQuest = Quest#quest_kill{start_time = Now,
                                                name = Name, lev = Lev,
                                                sex = Sex, classes = Classes,
                                                status = 2, guild_id = GuildId,
                                                item_reward = Items,
                                                star = Star},
                    storage(quest_kill, NewQuest);
                _False ->
                    logger:error("接受任务错误：~w", [_False], quest_kill, 635),
                    false
            end,
    {reply, Reply, State};
handle_call({commit, {Rid, Pid}, {QuestId, Lev}}, _From,
            State) ->
    Reply = case case catch ets:lookup(quest_kill, Rid) of
                     [Obj] -> Obj;
                     [] -> none;
                     _ -> false
                 end
                of
                Quest = #quest_kill{total_num = TotalNum} ->
                    NewQuest = Quest#quest_kill{rid = Rid, status = 1,
                                                quest_id = QuestId, lev = Lev,
                                                pid = Pid, star = 0,
                                                start_time = 0,
                                                total_num = TotalNum + 1},
                    storage(quest_kill, NewQuest);
                _False ->
                    logger:error("提交屠魔任务~w", [_False], quest_kill, 646),
                    false
            end,
    {reply, Reply, State};
handle_call({upgrade_star, Rid}, _From, State) ->
    Reply = do_upgrade_star(self, Rid),
    {reply, Reply, State};
handle_call({upgrade_star, HelpRid, Rid, Name}, _From,
            State) ->
    Reply = do_upgrade_star(HelpRid, Rid, Name),
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [quest_kill, _Request],
                 quest_kill,
                 657),
    Reply = ok,
    {reply, Reply, State}.

handle_cast({quest_id, {Rid, Pid}, {QuestId, Lev}},
            State) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        none ->
            Quest = #quest_kill{rid = Rid, quest_id = QuestId,
                                lev = Lev, pid = Pid},
            storage(quest_kill, Quest);
        Quest = #quest_kill{} ->
            NewQuest = Quest#quest_kill{status = 1,
                                        quest_id = QuestId, lev = Lev,
                                        pid = Pid, star = 0, start_time = 0},
            storage(quest_kill, NewQuest);
        _False ->
            logger:error("屠魔任务~w", [_False], quest_kill, 680),
            false
    end,
    {noreply, State};
handle_cast({revise, {Rid, Pid}, {QuestId, Lev}},
            State) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{} ->
            NewQuest = Quest#quest_kill{status = 1,
                                        quest_id = QuestId, lev = Lev,
                                        pid = Pid, star = 0, start_time = 0},
            storage(quest_kill, NewQuest);
        _False ->
            logger:error("屠魔任务~w", [_False], quest_kill, 690),
            false
    end,
    {noreply, State};
handle_cast({alive, Rid, Pid}, State) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{} ->
            NewQuest = Quest#quest_kill{pid = Pid},
            storage(quest_kill, NewQuest);
        _False ->
            logger:error("屠魔任务~w", [_False], quest_kill, 700),
            false
    end,
    {noreply, State};
handle_cast({join, Rid, Guild}, State) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{} ->
            NewQuest = Quest#quest_kill{guild_id = Guild},
            storage(quest_kill, NewQuest);
        _False ->
            logger:error("屠魔任务~w", [_False], quest_kill, 710),
            false
    end,
    {noreply, State};
handle_cast({leave, Rid}, State) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{} ->
            NewQuest = Quest#quest_kill{guild_id = {0, "", 0}},
            storage(quest_kill, NewQuest);
        _False ->
            logger:error("屠魔任务~w", [_False], quest_kill, 720),
            false
    end,
    {noreply, State};
handle_cast({clean, Rid}, State) ->
    case catch ets:delete(quest_kill, Rid) of
        true -> ok;
        _ -> false
    end,
    case catch dets:delete(quest_kill, Rid) of
        ok -> ok;
        _ -> false
    end,
    {noreply, State};
handle_cast(_Msg, State) ->
    logger:error("[~w]收到未知的消息:[~w]",
                 [quest_kill, _Msg],
                 quest_kill,
                 729),
    {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    util:close_dets(quest_kill),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    quest_kill = ets:new(quest_kill,
                         [set, named_table, public, {keypos, #quest_kill.rid}]),
    {ok, quest_kill} = dets:open_file(quest_kill,
                                      [{file, "dets/quest_kill.dets"},
                                       {keypos, #quest_kill.rid},
                                       {type, set}]),
    quest_kill = dets:to_ets(quest_kill, quest_kill),
    ok.

storage(Tab, Data) ->
    case case catch ets:insert(Tab, Data) of
             true -> ok;
             _ -> false
         end
        of
        ok ->
            case case catch dets:insert(Tab, Data) of
                     ok -> ok;
                     _ -> false
                 end
                of
                ok -> ok;
                false ->
                    logger:error("持久化数据出错", [], quest_kill, 790),
                    false
            end;
        false ->
            logger:error("持久化数据出错", [], quest_kill, 794),
            false
    end.

push_help_star(Role,
               {_Id,
                _Platform,
                _ZoneId,
                _Name,
                _Lev,
                _Classes,
                _Sex,
                0},
               SelfInfo) ->
    role:link_send(Role, 13807, SelfInfo),
    ok;
push_help_star(Role, HelperInfo, SelfInfo) ->
    role:link_send(Role, 13807, SelfInfo),
    role:link_send(Role, 13804, {[HelperInfo]}),
    ok.

push_info(Role) ->
    {ok, Reply} = get_info(Role),
    role:link_send(Role, 13806, Reply).

do_upgrade_star(Tag, Rid = {Id, Platform, ZoneId}) ->
    case case catch ets:lookup(quest_kill, Rid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        Quest = #quest_kill{status = 2, star = Star,
                            record_len = Len, star_record = Records,
                            name = Name, lev = Lev, classes = Classes,
                            sex = Sex} ->
            case Star < 10 of
                true ->
                    Stars = quest_kill_data:get_star_weight(),
                    case util:rand_list(Stars, 2) of
                        undefined -> false;
                        {AddStar, _Weight} ->
                            Now = date:unixtime(),
                            AddRec = case Tag of
                                         {help, HelpName} ->
                                             #quest_kill_star_record{type = 3,
                                                                     help_name =
                                                                         HelpName,
                                                                     time = Now,
                                                                     star =
                                                                         AddStar};
                                         self ->
                                             #quest_kill_star_record{type = 1,
                                                                     time = Now,
                                                                     star =
                                                                         AddStar}
                                     end,
                            {NewRecords, NewLen} = add_star_record(AddRec,
                                                                   Len,
                                                                   Records),
                            NewStar = erlang:min(Star + AddStar, 10),
                            NewQuest = Quest#quest_kill{star = NewStar,
                                                        record_len = NewLen,
                                                        star_record =
                                                            NewRecords},
                            case storage(quest_kill, NewQuest) of
                                ok ->
                                    {ok,
                                     {Id,
                                      Platform,
                                      ZoneId,
                                      Name,
                                      Lev,
                                      Classes,
                                      Sex,
                                      NewStar}};
                                false ->
                                    {ok,
                                     {Id,
                                      Platform,
                                      ZoneId,
                                      Name,
                                      Lev,
                                      Classes,
                                      Sex,
                                      0}}
                            end
                    end;
                false ->
                    Now = date:unixtime(),
                    NewStar = 10,
                    AddRec = case Tag of
                                 {help, HelpName} ->
                                     #quest_kill_star_record{type = 3,
                                                             help_name =
                                                                 HelpName,
                                                             time = Now,
                                                             star = 0};
                                 self ->
                                     #quest_kill_star_record{type = 1,
                                                             time = Now,
                                                             star = NewStar}
                             end,
                    {NewRecords, NewLen} = add_star_record(AddRec,
                                                           Len,
                                                           Records),
                    NewQuest = Quest#quest_kill{star = NewStar,
                                                record_len = NewLen,
                                                star_record = NewRecords},
                    case storage(quest_kill, NewQuest) of
                        ok ->
                            {ok,
                             {Id,
                              Platform,
                              ZoneId,
                              Name,
                              Lev,
                              Classes,
                              Sex,
                              NewStar}};
                        false ->
                            {ok,
                             {Id, Platform, ZoneId, Name, Lev, Classes, Sex, 0}}
                    end
            end;
        Quest = #quest_kill{star_record = Records,
                            record_len = Len, name = Name, lev = Lev,
                            classes = Classes, sex = Sex} ->
            Now = date:unixtime(),
            AddRec = case Tag of
                         {help, HelpName} ->
                             #quest_kill_star_record{type = 3,
                                                     help_name = HelpName,
                                                     time = Now};
                         self -> #quest_kill_star_record{type = 1, time = Now}
                     end,
            {NewRecords, NewLen} = add_star_record(AddRec,
                                                   Len,
                                                   Records),
            NewQuest = Quest#quest_kill{record_len = NewLen,
                                        star_record = NewRecords},
            storage(quest_kill, NewQuest),
            {ok,
             {Id, Platform, ZoneId, Name, Lev, Classes, Sex, 0}};
        _False ->
            logger:error("帮助刷星~w", [_False], quest_kill, 870),
            false
    end.

do_upgrade_star(HelpRid, Rid, Name) ->
    case case catch ets:lookup(quest_kill, HelpRid) of
             [Obj] -> Obj;
             [] -> none;
             _ -> false
         end
        of
        HelpQuest = #quest_kill{status = 2, star = Star,
                                pid = Pid, record_len = Len,
                                star_record = Records, name = HelpName,
                                lev = HelpLev, classes = HelpClasses,
                                sex = HelpSex}
            when Star < 10 ->
            Now = date:unixtime(),
            AddRec = #quest_kill_star_record{type = 2, time = Now,
                                             help_name = Name},
            {NewRecords, NewLen} = add_star_record(AddRec,
                                                   Len,
                                                   Records),
            NewStar = Star + 1,
            NewHelpQuest = HelpQuest#quest_kill{star = NewStar,
                                                record_len = NewLen,
                                                star_record = NewRecords},
            case storage(quest_kill, NewHelpQuest) of
                ok ->
                    case do_upgrade_star({help, HelpName}, Rid) of
                        {ok,
                         HelperInfo = {_Id,
                                       _Platform,
                                       _ZoneId,
                                       _Name,
                                       _Lev,
                                       _Classes,
                                       _Sex,
                                       SelfStar}} ->
                            case is_pid(Pid) of
                                true ->
                                    role:apply(async,
                                               Pid,
                                               {quest_kill,
                                                push_help_star,
                                                [HelperInfo, {NewStar, Name}]}),
                                    ok;
                                false -> skip
                            end,
                            {ok,
                             {HelpName,
                              HelpLev,
                              HelpClasses,
                              HelpSex,
                              NewStar,
                              SelfStar}};
                        _False ->
                            {ok,
                             {HelpName,
                              HelpLev,
                              HelpClasses,
                              HelpSex,
                              NewStar,
                              0}}
                    end;
                false -> false
            end;
        #quest_kill{status = 2} -> {false, lang:get("对方星数已满")};
        _False ->
            logger:error("帮助刷星~w", [_False], quest_kill, 903),
            false
    end.

add_star_record(AddRec, Len, Records) ->
    case Len < 50 of
        true -> {queue:in(AddRec, Records), Len + 1};
        false ->
            {_, RestRecords} = queue:out(Records),
            {queue:in(AddRec, RestRecords), Len}
    end.

