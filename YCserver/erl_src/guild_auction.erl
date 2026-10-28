-file("src/mod/guild/guild_auction.erl", 1).

-module(guild_auction).

-behaviour(gen_fsm).

-export([start_link/0,
         add/2,
         add_list/2,
         bid/3,
         subscribe/2,
         unsubscribe/2,
         push/2,
         lookup/1,
         destory/1,
         reload/0,
         apply_guild/2,
         role_callback/2,
         get_start_time/0]).

-export([idle/2, active/2, ending/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/guild/guild_auction.erl", 30).

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

-file("src/mod/guild/guild_auction.erl", 31).

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

-file("src/mod/guild/guild_auction.erl", 32).

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

-file("src/mod/guild/guild_auction.erl", 33).

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

-file("src/mod/guild/guild_auction.erl", 34).

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

-file("src/mod/guild/guild_auction.erl", 35).

-file("inc/guild_dungeon.hrl", 1).

-record(guild_dungeon,
        {ver = 0,
         guild_id = {0, "", 0},
         base_id = 0,
         map_id = 0,
         map_pid = undefined,
         unit_id = 0,
         chapter_now = 0,
         strongpoint_now = 0,
         boss_id = 0,
         num = 0,
         time = 0,
         chapters = [],
         rewards_all = []}).

-record(guild_dungeon_chapter,
        {ver = 0,
         chapter_id = 0,
         status = 0,
         strongpoints = []}).

-record(guild_dungeon_strongpoint,
        {ver = 0, strongpoint_id = 1, monsters = []}).

-record(guild_dungeon_monster,
        {unique = 0,
         monster_id = 0,
         percent = 0,
         challenge = 1,
         role_name = "",
         role_sex = 0,
         role_classes = 0,
         percent_list = [],
         type = 0,
         combat_pid = undefined,
         combat_id = 0,
         rewards = []}).

-record(guild_dungeon_rank,
        {id = 0,
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         ranks = [],
         rewards = []}).

-record(guild_dungeon_rank_role,
        {role_id = {0, "", 0},
         times = 0,
         role_name = "",
         classes = 0,
         sex = 0,
         harm = 0,
         role_ids = []}).

-record(guild_dungeon_hp,
        {id = {{0, "", 0}, 0, 0, 0},
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         monster_id = 0,
         monsters = []}).

-file("src/mod/guild/guild_auction.erl", 36).

-file("inc/guild_auction.hrl", 1).

-record(guild_auction,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         goods = [] :: list(),
         last_goods = [] :: list(),
         next_id = 1 :: non_neg_integer()}).

-record(guild_auction_goods,
        {id = 0 :: non_neg_integer(),
         ver = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_num = 0 :: non_neg_integer(),
         current_price = 0 :: non_neg_integer(),
         max_price = 0 :: non_neg_integer(),
         last_bidden = 0 :: non_neg_integer(),
         bidden = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         deadline = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         bidders = [] :: list(),
         subscribers = [] :: list()}).

-record(guild_auction_bidder,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 1,
         price = 0 :: non_neg_integer(),
         loss = [] :: list()}).

-file("src/mod/guild/guild_auction.erl", 37).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/guild/guild_auction.erl", 38).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         expire_ref :: undefined | reference()}).

add(Gid, ItemId) ->
    case guild_auction_data:get(ItemId) of
        #{max_price := Max} ->
            Now = date:unixtime(),
            Item = #guild_auction_goods{item_id = ItemId,
                                        item_num = 1, max_price = Max,
                                        added = Now},
            guild_mgr:apply(async,
                            Gid,
                            {guild_auction, apply_guild, [{add, Item}]});
        _ -> {false, lang:get("找不到商品配置")}
    end.

add_list(Gid, Ids) ->
    logger:info("公会~w 增加物品 ~w",
                [Gid, Ids],
                guild_auction,
                96),
    L = do_list(Ids, date:unixtime()),
    guild_mgr:apply(async,
                    Gid,
                    {guild_auction, apply_guild, [{add_list, L}]}).

bid(Role = #role{m_guild =
                     #m_guild{pid = Pid, id = Gid},
                 id = Rid, name = Name,
                 assets = #assets{brother = Brother}},
    Id, Price) ->
    case check_bid(lookup(Gid), Id, Price) of
        ok ->
            Cost = case Brother >= Price of
                       true -> [{90036, Price}];
                       _ ->
                           [{90036, Brother},
                            {90002, round((Price - Brother) * 2)}]
                   end,
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    case guild_mgr:apply(sync,
                                         Pid,
                                         {guild_auction,
                                          apply_guild,
                                          [{bid, Rid, Id, Price, Cost}]})
                        of
                        {ok, 1, ItemId} ->
                            Msg = notice:format(lang:get("恭喜您成功获得~ts，请查收~ts"),
                                                [{item_2, ItemId},
                                                 {string_2,
                                                  5,
                                                  lang:get("邮件")}]),
                            {ok, Msg, Role1};
                        {ok, _, _} ->
                            Msg = lang:get("出价成功，请耐心等待结算"),
                            {ok, Msg, Role1};
                        {error, timeout} ->
                            logger:error("角色~w [~ts] 竞拍商品超时 id ~w, price ~w, cost ~w",
                                         [Rid, Name, Id, Price, Cost],
                                         guild_auction,
                                         119),
                            {ok, Role1};
                        Else -> Else
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        Fail -> Fail
    end;
bid(_Role, _Id, _Price) -> {false, lang:get("现在不能竞标")}.

subscribe(#role{m_guild = #m_guild{pid = Pid},
                id = Rid},
          Id) ->
    case guild_mgr:apply(sync,
                         Pid,
                         {guild_auction, apply_guild, [{subscribe, Rid, Id}]})
        of
        {ok, ItemId} ->
            {ok,
             notice:format(lang:get("收藏成功，~ts已置顶显示"),
                           [{item_2, ItemId}])};
        {error, timeout} -> ok;
        Else -> Else
    end;
subscribe(_Role, _Id) -> {false, lang:get("现在不能关注")}.

unsubscribe(#role{m_guild = #m_guild{pid = Pid},
                  id = Rid},
            Id) ->
    case guild_mgr:apply(sync,
                         Pid,
                         {guild_auction, apply_guild, [{unsubscribe, Rid, Id}]})
        of
        ok -> ok;
        {error, timeout} -> ok;
        Else -> Else
    end;
unsubscribe(_Role, _Id) -> {false, lang:get("现在不能关注")}.

push(_, Cmd = 19700) ->
    {St, Tt} = case env:get(guild_auction_state) of
                   {_, _, infinity} -> {0, 0};
                   {active, Ts, Timeout} ->
                       {1, util:time_left(Timeout, Ts)};
                   {ending, Ts, Timeout} ->
                       {2, util:time_left(Timeout, Ts)};
                   {_, Ts, Timeout} -> {0, util:time_left(Timeout, Ts)};
                   _ -> {0, 0}
               end,
    sys_conn:pack_send(Cmd, {St, Tt div 1000});
push(#role{m_guild = #m_guild{id = Gid}},
     Cmd = 19701) ->
    Goods = case lookup(Gid) of
                [#guild_auction{goods = L}] -> L;
                _ -> []
            end,
    sys_conn:pack_send(Cmd, {Goods});
push(#role{m_guild = #m_guild{id = Gid}, id = Id},
     Cmd = 19704) ->
    Goods = case lookup(Gid) of
                [#guild_auction{goods = L}] -> L;
                _ -> []
            end,
    Subs = [I
            || #guild_auction_goods{id = I, subscribers = Sbs}
                   <- Goods,
               lists:member(Id, Sbs)],
    sys_conn:pack_send(Cmd, {Subs});
push(#role{m_guild = #m_guild{id = Gid}},
     Cmd = 19707) ->
    Goods = case lookup(Gid) of
                [#guild_auction{last_goods = L}] -> L;
                _ -> []
            end,
    sys_conn:pack_send(Cmd, {Goods});
push(#role{}, {Cmd, Data}) ->
    sys_conn:pack_send(Cmd, Data);
push(_, _) -> ok.

lookup(Gid) -> ets:lookup(guild_auction, Gid).

destory(#guild{id = Gid}) ->
    do_destory(lookup(Gid)),
    ets:delete(guild_auction, Gid),
    dets:delete(guild_auction, Gid),
    ok.

reload() -> guild_auction ! reload.

apply_guild(#guild{name = Name, id = Gid},
            {add, ItemRaw = #guild_auction_goods{added = Now}}) ->
    Item = ItemRaw#guild_auction_goods{start_time =
                                           Now + get_start_time()},
    case lookup(Gid) of
        [Au = #guild_auction{goods = Goods,
                             next_id = NextId}] ->
            update(Au#guild_auction{goods =
                                        [Item#guild_auction_goods{id = NextId}
                                         | Goods],
                                    next_id = NextId + 1});
        _ ->
            update(#guild_auction{id = Gid, name = Name,
                                  goods = [Item#guild_auction_goods{id = 1}],
                                  next_id = 2})
    end,
    ok;
apply_guild(#guild{name = Name, id = Gid},
            {add_list, Items}) ->
    StartTime = get_start_time(),
    case lookup(Gid) of
        [Au = #guild_auction{goods = Goods,
                             next_id = NextId}] ->
            {NewNextId, NewGoods} = do_add_list(Items,
                                                NextId,
                                                Goods,
                                                StartTime),
            update(Au#guild_auction{goods = NewGoods,
                                    next_id = NewNextId});
        _ ->
            {NewNextId, NewGoods} = do_add_list(Items,
                                                1,
                                                [],
                                                StartTime),
            update(#guild_auction{id = Gid, name = Name,
                                  goods = NewGoods, next_id = NewNextId})
    end,
    ok;
apply_guild(#guild{id = Gid, members = Members},
            {bid, Rid, Id, Price, Loss}) ->
    Now = date:unixtime(),
    Reply = case env:get(guild_auction_state) of
                {_, _, _} ->
                    case lists:keyfind(Rid, #guild_role.id, Members) of
                        #guild_role{enter_time = Entered}
                            when Now - Entered < 3600 * 24 * 3 ->
                            {false, lang:get("进入公会3天以上的成员才能参与公会拍卖")};
                        R = #guild_role{name = Name} ->
                            Au = lookup(Gid),
                            case check_bid(Au, Id, Price) of
                                ok ->
                                    case do_bid(R,
                                                #{auction => Au, id => Id,
                                                  price => Price, loss => Loss,
                                                  now => Now})
                                        of
                                        {ok,
                                         Item = #guild_auction_goods{status =
                                                                         Status,
                                                                     item_id =
                                                                         ItemId}} ->
                                            case Status of
                                                1 ->
                                                    AnnArgs = [{role_2, Name},
                                                               {assets_1,
                                                                90036,
                                                                Price},
                                                               {item_2, ItemId},
                                                               {assets_1,
                                                                90036,
                                                                Price div 2},
                                                               {string_2,
                                                                5,
                                                                round(Price div
                                                                          2
                                                                          *
                                                                          2000)}],
                                                    AnnStr =
                                                        notice:format(lang:get("千金难买心头好，恭喜~ts使用一口价~ts直接购买~ts，拍卖结束时~ts将作为分红，其余"
                                                                               "将转化为~ts公会资金{face_1,18}"),
                                                                      AnnArgs),
                                                    guild:notice(Members,
                                                                 AnnStr);
                                                _ -> ok
                                            end,
                                            [role:apply(async,
                                                        Pid,
                                                        {guild_auction,
                                                         role_callback,
                                                         [{push,
                                                           19702,
                                                           {[Item]}}]})
                                             || #guild_role{pid = Pid}
                                                    <- Members,
                                                is_pid(Pid)],
                                            {ok, Status, ItemId};
                                        Else -> Else
                                    end;
                                Fail -> Fail
                            end;
                        _ -> {false, lang:get("你不在该公会")}
                    end;
                _ -> {false, lang:get("竞拍还没开始")}
            end,
    {ok, Reply};
apply_guild(#guild{id = Gid, members = Members},
            {subscribe, Rid, Id}) ->
    Reply = case lists:keyfind(Rid, #guild_role.id, Members)
                of
                #guild_role{} -> do_subscribe(lookup(Gid), Rid, Id);
                _ -> {false, lang:get("你不在该公会")}
            end,
    {ok, Reply};
apply_guild(#guild{id = Gid, members = Members},
            {unsubscribe, Rid, Id}) ->
    Reply = case lists:keyfind(Rid, #guild_role.id, Members)
                of
                #guild_role{} -> do_unsubscribe(lookup(Gid), Rid, Id);
                _ -> {false, lang:get("你不在该公会")}
            end,
    {ok, Reply};
apply_guild(#guild{members = Members, id = Gid},
            check_bidden) ->
    Msg = lang:get("本次公会拍卖已进入尾声，恭喜获得至宝的成员{face_1,25}"),
    guild:notice(Members, Msg),
    case check_bidden(lookup(Gid)) of
        [] -> ok;
        Changeds ->
            [role:apply(async,
                        Pid,
                        {guild_auction,
                         role_callback,
                         [{push, 19702, {Changeds}}]})
             || #guild_role{pid = Pid} <- Members, is_pid(Pid)]
    end,
    ok;
apply_guild(#guild{members = Members, id = Gid},
            check_day_end) ->
    case check_day_end(lookup(Gid)) of
        [] -> ok;
        Changeds ->
            [role:apply(async,
                        Pid,
                        {guild_auction,
                         role_callback,
                         [{push, 19702, {Changeds}}]})
             || #guild_role{pid = Pid} <- Members, is_pid(Pid)]
    end,
    ok;
apply_guild(#guild{members = Members, id = Gid},
            {notice, ending}) ->
    Msg =
        lang:get("本次公会拍卖已进入尾声，恭喜获得至宝的成员，相关分红结算将于11:30通过邮件发放{fac"
                 "e_1,25}"),
    guild:notice(Members, Msg),
    case do_ending(lookup(Gid)) of
        [] -> ok;
        Changeds ->
            [role:apply(async,
                        Pid,
                        {guild_auction,
                         role_callback,
                         [{push, 19702, {Changeds}}]})
             || #guild_role{pid = Pid} <- Members, is_pid(Pid)]
    end,
    ok;
apply_guild(G = #guild{members = Members, id = Gid,
                       assets = Assets, max_assets = Max, name = Name},
            {notice, idle}) ->
    DoneL = done_account(lookup(Gid)),
    CaclFun = fun (#guild_auction_goods{current_price = 0,
                                        item_id = ItemId}) ->
                      case guild_auction_data:get(ItemId) of
                          #{min_price := Mp} -> Mp;
                          _ -> 0
                      end;
                  (#guild_auction_goods{current_price = P}) -> P
              end,
    Sum = lists:sum([CaclFun(Dg) || Dg <- DoneL]),
    Value = round(Sum / 2 * 2000),
    NewAssets = min(Assets + Value, Max),
    Msg = case Value of
              0 -> lang:get("本次公会竞拍已结束");
              _ ->
                  notice:format(lang:get("本次公会拍卖总金额为~ts，分红已发通过邮件发放，其余转化为~ts公会资金{face_1,18}"),
                                [{assets_1, 90036, Sum}, {string_2, 5, Value}])
          end,
    reward_dividend(Sum,
                    guild_dungeon:rank(Gid),
                    Members,
                    Gid,
                    Name),
    guild:notice(Members, Msg),
    logger:info("公会 ~w[~ts]获得活动资金:~w, 原值:~w，max: ~w, "
                "新值:~w",
                [Gid, Name, Value, Assets, Max, NewAssets],
                guild_auction,
                331),
    [role:apply(async,
                Pid,
                {guild_auction, role_callback, [{push, 19701, {[]}}]})
     || #guild_role{pid = Pid} <- Members, is_pid(Pid)],
    NewG = G#guild{assets = NewAssets, flag = 1},
    guild_build:push_11113(NewG),
    {ok, NewG};
apply_guild(#guild{members = Members},
            {notice, active}) ->
    Msg = lang:get("公会拍卖已开启，公会副本掉落的珍稀宝物将开始竞拍{face_1,36}"),
    guild:notice(Members, Msg),
    ok;
apply_guild(#guild{members = _Members},
            {notice, _StateName}) ->
    ok;
apply_guild(#guild{id = Gid, members = Members},
            reload) ->
    case reload(lookup(Gid)) of
        Changeds = [_ | _] ->
            [role:apply(async,
                        Pid,
                        {guild_auction,
                         role_callback,
                         [{push, 19702, {Changeds}}]})
             || #guild_role{pid = Pid} <- Members, is_pid(Pid)];
        _ -> ok
    end,
    ok;
apply_guild(#guild{id = Gid, name = Name},
            {fix_merge,
             OA = #guild_auction{goods = Gs, last_goods = LGs,
                                 next_id = NextId1}}) ->
    case lookup(Gid) of
        [Au = #guild_auction{goods = Goods, last_goods = Last,
                             next_id = NextId2}] ->
            logger:info("合并旧数据~w ~ts",
                        [Gid, Name],
                        guild_auction,
                        353),
            update(Au#guild_auction{goods =
                                        [Go#guild_auction_goods{id =
                                                                    I + NextId1}
                                         || Go = #guild_auction_goods{id = I}
                                                <- Goods]
                                            ++ Gs,
                                    last_goods = Last ++ LGs,
                                    next_id = NextId1 + NextId2});
        _ ->
            logger:info("采用旧数据~w ~ts",
                        [Gid, Name],
                        guild_auction,
                        356),
            update(OA)
    end,
    ok;
apply_guild(#guild{}, _Act) ->
    logger:error("未知消息 ~w", [_Act], guild_auction, 361),
    ok.

role_callback(Role, {push, Cmd, Data}) ->
    push(Role, {Cmd, Data}),
    ok;
role_callback(_, _Info) ->
    logger:debug("未知回调 ~w", [_Info], guild_auction, 369),
    ok.

start_link() ->
    gen_fsm:start_link({local, guild_auction},
                       guild_auction,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], guild_auction, 380),
    dets:open_file(guild_auction,
                   [{file, "./dets/guild_auction.dets"},
                    {keypos, #guild_auction.id},
                    {type, set}]),
    ets:new(guild_auction,
            [set,
             named_table,
             public,
             {keypos, #guild_auction.id}]),
    dets:to_ets(guild_auction, guild_auction),
    {StateName, Tt} = get_state(),
    update_start_time(StateName),
    Timeout = Tt * 1000,
    Now = erlang:now(),
    State = #state{ts = Now, timeout = Timeout},
    env:set(guild_auction_state, {StateName, Now, Timeout}),
    logger:info("启动完成, 当前状态:~w 下一次更新状态时间:~w",
                [StateName, Timeout],
                guild_auction,
                390),
    {ok, StateName, State, Timeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(reload, StateName, State) ->
    [guild_mgr:apply(async,
                     Pid,
                     {guild_auction, apply_guild, [reload]})
     || [Pid]
            <- ets:match(guild_list, #guild{pid = '$1', _ = '_'})],
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    Now = erlang:now(),
    Timeout = agenda:get_duration(1031) * 1000,
    State1 = State#state{ts = Now, timeout = Timeout},
    env:set(guild_auction_state, {active, Now, Timeout}),
    role_group:pack_send(world,
                         19700,
                         {1, Timeout div 1000}),
    [guild_mgr:apply(async,
                     Pid,
                     {guild_auction, apply_guild, [{notice, active}]})
     || [Pid]
            <- ets:match(guild_list, #guild{pid = '$1', _ = '_'})],
    continue(active, State1);
idle(_, State) -> continue(idle, State).

active(timeout, State) ->
    Now = erlang:now(),
    Timeout = 1800 * 1000,
    State1 = State#state{ts = Now, timeout = Timeout},
    env:set(guild_auction_state, {ending, Now, Timeout}),
    role_group:pack_send(world,
                         19700,
                         {2, Timeout div 1000}),
    CheckType = case date:day_of_the_week(date:unixtime())
                    of
                    7 -> [{notice, ending}];
                    _ -> [check_bidden]
                end,
    [guild_mgr:apply(async,
                     Pid,
                     {guild_auction, apply_guild, CheckType})
     || [Pid]
            <- ets:match(guild_list, #guild{pid = '$1', _ = '_'})],
    continue(ending, State1);
active(_, State) -> continue(active, State).

ending(timeout, State) ->
    Timeout = get_next_timeout() * 1000,
    Now = erlang:now(),
    State1 = State#state{ts = Now, timeout = Timeout},
    env:set(guild_auction_state, {idle, Now, Timeout}),
    role_group:pack_send(world,
                         19700,
                         {0, Timeout div 1000}),
    CheckType = case date:day_of_the_week(date:unixtime())
                    of
                    7 -> [{notice, idle}];
                    _ -> [check_day_end]
                end,
    [guild_mgr:apply(async,
                     Pid,
                     {guild_auction, apply_guild, CheckType})
     || [Pid]
            <- ets:match(guild_list, #guild{pid = '$1', _ = '_'})],
    continue(idle, State1);
ending(_, State) -> continue(ending, State).

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

update(Au = #guild_auction{}) ->
    dets:insert(guild_auction, Au),
    ets:insert(guild_auction, Au);
update(_D) ->
    logger:error("未知数据 ~w", [_D], guild_auction, 487),
    ok.

do_bid(R = #guild_role{id = Rid, name = Name, lev = Lev,
                       classes = Classes},
       #{auction :=
             [Au = #guild_auction{goods = Goods, name = GuildName}],
         id := Id, price := Price, loss := Loss, now := Now}) ->
    case lists:keyfind(Id, #guild_auction_goods.id, Goods)
        of
        #guild_auction_goods{start_time = StartTime}
            when Now < StartTime ->
            {false,
             notice:format(lang:get("请稍等该商品还要等 ~ts"),
                           [{string_2,
                             5,
                             date:seconds_to_str(StartTime - Now)}])};
        #guild_auction_goods{deadline = DeadLine,
                             timeout = Timeout}
            when Timeout =/= 0 andalso
                     (Now > Timeout orelse Now > DeadLine) ->
            {false, lang:get("拍卖时间已经过了")};
        #guild_auction_goods{current_price = CPrice}
            when Price < CPrice ->
            {false, lang:get("你开价太低了")};
        #guild_auction_goods{status = 1} ->
            {false, lang:get("该商品已经拍卖出去了")};
        #guild_auction_goods{status = 2} ->
            {false, lang:get("该商品已流拍")};
        Item = #guild_auction_goods{max_price = Max,
                                    bidders = Bidders, bidden = Bidden,
                                    timeout = Timeout, deadline = DeadLine}
            when Max > Price ->
            case lists:keyfind(Rid,
                               #guild_auction_bidder.id,
                               Bidders)
                of
                #guild_auction_bidder{} ->
                    {false,
                     notice:format(lang:get("您当前出价最高，请耐心等待竞拍结束或~ts购买"),
                                   [{string_2, 5, lang:get("一口价")}])};
                _ ->
                    NewTimeout = case Timeout of
                                     0 -> 0;
                                     _ -> min(DeadLine, Timeout + 300)
                                 end,
                    NewItem = Item#guild_auction_goods{current_price =
                                                           Price,
                                                       bidders =
                                                           [to(R, Price, Loss)],
                                                       bidden = Bidden + 1,
                                                       last_bidden = Now,
                                                       timeout = NewTimeout},
                    return_predecessor(Bidders),
                    NewGoods = lists:keyreplace(Id,
                                                #guild_auction_goods.id,
                                                Goods,
                                                NewItem),
                    update(Au#guild_auction{goods = NewGoods}),
                    {ok, NewItem}
            end;
        Item = #guild_auction_goods{bidden = Bidden,
                                    item_id = ItemId, item_num = ItemNum,
                                    bidders = Bidders} ->
            NewItem = Item#guild_auction_goods{current_price =
                                                   Price,
                                               bidders = [to(R, Price, Loss)],
                                               bidden = Bidden + 1,
                                               last_bidden = Now, status = 1},
            return_predecessor(Bidders),
            NewGoods = lists:keyreplace(Id,
                                        #guild_auction_goods.id,
                                        Goods,
                                        NewItem),
            update(Au#guild_auction{goods = NewGoods}),
            MailInfo = #{items => [{ItemId, 0, ItemNum}],
                         title => lang:get("竞拍宝物成功"),
                         content =>
                             notice:format(lang:get("恭喜您竞拍~ts成功，请查收：\n可前往~ts查看"),
                                           [{item_2, ItemId, ItemNum},
                                            {string_2,
                                             5,
                                             lang:get("【背包-宝物】")}])},
            mail:send(Rid, MailInfo),
            case guild_auction_data:get(ItemId) of
                #{announce := 1} ->
                    AnnStr =
                        notice:format(lang:get("喜获至宝！~ts通过公会拍卖将~ts收入囊中，小伙伴们投来羡慕的眼光{face_1,29}"),
                                      [{role_2, Name},
                                       {item_2, ItemId, ItemNum}]),
                    notice:cast(all, 5, AnnStr);
                _ -> ok
            end,
            {Quality, AuName} = case talisman_data:get(ItemId) of
                                    #talisman_base{quality = Q, name = N} ->
                                        {Q, N};
                                    _ -> {1, lang:get("未知宝物")}
                                end,
            log:guild_auction(Rid,
                              Name,
                              Classes,
                              AuName,
                              Quality,
                              0,
                              1,
                              Price,
                              GuildName,
                              Lev),
            {ok, NewItem};
        _ -> {false, lang:get("找不到商品")}
    end;
do_bid(_, _) -> {false, lang:get("找不到拍卖信息")}.

do_subscribe([Au = #guild_auction{goods = Goods}], Rid,
             Id) ->
    case lists:keyfind(Id, #guild_auction_goods.id, Goods)
        of
        #guild_auction_goods{status = 1} ->
            {false, lang:get("该商品已经拍卖出去了")};
        #guild_auction_goods{status = 2} ->
            {false, lang:get("该商品已流拍")};
        Item = #guild_auction_goods{subscribers = Subs,
                                    item_id = ItemId} ->
            case lists:member(Rid, Subs) of
                true -> {false, lang:get("你已经在关注它了")};
                _ ->
                    NewItem = Item#guild_auction_goods{subscribers =
                                                           [Rid | Subs]},
                    NewGoods = lists:keyreplace(Id,
                                                #guild_auction_goods.id,
                                                Goods,
                                                NewItem),
                    update(Au#guild_auction{goods = NewGoods}),
                    {ok, ItemId}
            end;
        _ -> {false, lang:get("找不到指定商品")}
    end;
do_subscribe(_, _, _) -> {false, lang:get("找不到拍卖信息")}.

do_unsubscribe([Au = #guild_auction{goods = Goods}],
               Rid, Id) ->
    case lists:keyfind(Id, #guild_auction_goods.id, Goods)
        of
        #guild_auction_goods{status = 1} ->
            {false, lang:get("该商品已经拍卖出去了")};
        #guild_auction_goods{status = 2} ->
            {false, lang:get("该商品已流拍")};
        Item = #guild_auction_goods{subscribers = Subs} ->
            case lists:member(Rid, Subs) of
                true ->
                    NewItem = Item#guild_auction_goods{subscribers =
                                                           Subs -- [Rid]},
                    NewGoods = lists:keyreplace(Id,
                                                #guild_auction_goods.id,
                                                Goods,
                                                NewItem),
                    update(Au#guild_auction{goods = NewGoods}),
                    ok;
                _ -> {false, lang:get("你还没在关注它")}
            end;
        _ -> {false, lang:get("找不到指定商品")}
    end;
do_unsubscribe(_, _, _) -> {false, lang:get("找不到拍卖信息")}.

check_bid([#guild_auction{goods = Goods}], Id, Price) ->
    case lists:keyfind(Id, #guild_auction_goods.id, Goods)
        of
        Item = #guild_auction_goods{item_id = ItemId} ->
            do_check_bid(guild_auction_data:get(ItemId),
                         Item,
                         Price);
        _ -> {false, lang:get("找不到指定商品")}
    end;
check_bid(_, _, _) -> {false, lang:get("找不到拍卖信息")}.

do_check_bid(#{min_price := Min, ascending_base := Base,
               recommand_rate1 := Rate},
             #guild_auction_goods{current_price = 0}, Price)
    when Price >= Min + Base * Rate andalso
             Price rem Base =:= 0 ->
    ok;
do_check_bid(#{ascending_base := Base,
               recommand_rate1 := Rate},
             #guild_auction_goods{current_price = Min}, Price)
    when Price >= Min + Base * Rate andalso
             Price rem Base =:= 0 ->
    ok;
do_check_bid(#{min_price := Min, ascending_base := Base,
               recommand_rate1 := Rate},
             #guild_auction_goods{current_price = 0}, _) ->
    {false,
     notice:format(lang:get("本次出价不能低于~ts"),
                   [{assets_1, 90036, Min + Base * Rate}])};
do_check_bid(#{ascending_base := Base,
               recommand_rate1 := Rate},
             #guild_auction_goods{current_price = Min}, _) ->
    {false,
     notice:format(lang:get("本次出价不能低于~ts"),
                   [{assets_1, 90036, Min + Base * Rate}])};
do_check_bid(_Cfg, _Item, _Price) ->
    logger:debug("找不到配置 ~w ~w ~w",
                 [_Cfg, _Item, _Price],
                 guild_auction,
                 631),
    {false, lang:get("没有标价信息")}.

do_ending([Au = #guild_auction{goods = Goods,
                               name = GuildName}]) ->
    Now = date:unixtime(),
    NewGoods = check_overtime(Goods, Now, GuildName),
    update(Au#guild_auction{goods = NewGoods}),
    NewGoods;
do_ending(_) -> [].

check_overtime([], _, _) -> [];
check_overtime([Item = #guild_auction_goods{status =
                                                Status}
                | T],
               Now, GuildName)
    when Status =/= 0 ->
    [Item | check_overtime(T, Now, GuildName)];
check_overtime([Item =
                    #guild_auction_goods{current_price = 0,
                                         item_id = ItemId}
                | T],
               Now, GuildName) ->
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction({9999,
                       env:get(platform),
                       env:get(zone_id)},
                      "流拍默认玩家",
                      1,
                      AuName,
                      Quality,
                      1,
                      0,
                      0,
                      GuildName,
                      1),
    [Item#guild_auction_goods{status = 2}
     | check_overtime(T, Now, GuildName)];
check_overtime([Item = #guild_auction_goods{last_bidden
                                                = Last,
                                            status = 0}
                | T],
               Now, GuildName)
    when Now < Last + 300 ->
    [Item#guild_auction_goods{timeout = Now + 300,
                              deadline = Now + 1800 * 1000 div 1000}
     | check_overtime(T, Now, GuildName)];
check_overtime([Item = #guild_auction_goods{item_id =
                                                ItemId,
                                            item_num = ItemNum,
                                            bidders =
                                                [#guild_auction_bidder{id = Rid,
                                                                       lev =
                                                                           Lev,
                                                                       name =
                                                                           Name,
                                                                       classes =
                                                                           Classes,
                                                                       price =
                                                                           Price}
                                                 | _]}
                | T],
               Now, GuildName) ->
    MailInfo = #{items => [{ItemId, 0, ItemNum}],
                 title => lang:get("竞拍宝物成功"),
                 content =>
                     notice:format(lang:get("恭喜您竞拍~ts成功，请查收："),
                                   [{item_2, ItemId, ItemNum}])},
    mail:send(Rid, MailInfo),
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction(Rid,
                      Name,
                      Classes,
                      AuName,
                      Quality,
                      0,
                      0,
                      Price,
                      GuildName,
                      Lev),
    [Item#guild_auction_goods{status = 1}
     | check_overtime(T, Now, GuildName)];
check_overtime([Item | T], Now, GuildName) ->
    [Item | check_overtime(T, Now, GuildName)].

check_bidden([Au = #guild_auction{id = _Id,
                                  goods = Goods, name = GuildName}]) ->
    logger:debug("开始结算 ~w", [_Id], guild_auction, 680),
    Now = date:unixtime(),
    NewGoods = do_check_bidden(Goods, Now, GuildName),
    update(Au#guild_auction{goods = NewGoods}),
    NewGoods;
check_bidden(_) -> [].

do_check_bidden([], _, _) -> [];
do_check_bidden([Item = #guild_auction_goods{status =
                                                 Status}
                 | T],
                Now, GuildName)
    when Status =/= 0 ->
    [Item | do_check_bidden(T, Now, GuildName)];
do_check_bidden([Item = #guild_auction_goods{last_bidden
                                                 = Last,
                                             status = 0}
                 | T],
                Now, GuildName)
    when Now < Last + 300 ->
    [Item#guild_auction_goods{timeout = Now + 300,
                              deadline = Now + 1800 * 1000 div 1000}
     | do_check_bidden(T, Now, GuildName)];
do_check_bidden([Item = #guild_auction_goods{item_id =
                                                 ItemId,
                                             item_num = ItemNum,
                                             bidders =
                                                 [#guild_auction_bidder{id =
                                                                            Rid,
                                                                        name =
                                                                            Name,
                                                                        lev =
                                                                            Lev,
                                                                        classes
                                                                            =
                                                                            Classes,
                                                                        price =
                                                                            Price}
                                                  | _]}
                 | T],
                Now, GuildName) ->
    MailInfo = #{items => [{ItemId, 0, ItemNum}],
                 title => lang:get("竞拍宝物成功"),
                 content =>
                     notice:format(lang:get("恭喜您竞拍~ts成功，请查收："),
                                   [{item_2, ItemId, ItemNum}])},
    mail:send(Rid, MailInfo),
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction(Rid,
                      Name,
                      Classes,
                      AuName,
                      Quality,
                      0,
                      0,
                      Price,
                      GuildName,
                      Lev),
    [Item#guild_auction_goods{status = 1}
     | do_check_bidden(T, Now, GuildName)];
do_check_bidden([Item | T], Now, GuildName) ->
    [Item | do_check_bidden(T, Now, GuildName)].

check_day_end([Au = #guild_auction{goods = Goods,
                                   name = GuildName}]) ->
    Now = date:unixtime(),
    NewGoods = do_check_day_end(Goods, Now, GuildName),
    update(Au#guild_auction{goods = NewGoods}),
    NewGoods;
check_day_end(_) -> [].

do_check_day_end([], _, _) -> [];
do_check_day_end([Item = #guild_auction_goods{status =
                                                  Status}
                  | T],
                 NextTime, GuildName)
    when Status =/= 0 ->
    [Item | do_check_day_end(T, NextTime, GuildName)];
do_check_day_end([Item = #guild_auction_goods{item_id =
                                                  ItemId,
                                              item_num = ItemNum,
                                              bidders =
                                                  [#guild_auction_bidder{id =
                                                                             Rid,
                                                                         lev =
                                                                             Lev,
                                                                         name =
                                                                             Name,
                                                                         classes
                                                                             =
                                                                             Classes,
                                                                         price =
                                                                             Price}
                                                   | _],
                                              timeout = Timeout}
                  | T],
                 NextTime, GuildName)
    when Timeout =/= 0 ->
    MailInfo = #{items => [{ItemId, 0, ItemNum}],
                 title => lang:get("竞拍宝物成功"),
                 content =>
                     notice:format(lang:get("恭喜您竞拍~ts成功，请查收："),
                                   [{item_2, ItemId, ItemNum}])},
    mail:send(Rid, MailInfo),
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction(Rid,
                      Name,
                      Classes,
                      AuName,
                      Quality,
                      0,
                      0,
                      Price,
                      GuildName,
                      Lev),
    [Item#guild_auction_goods{status = 1}
     | do_check_day_end(T, NextTime, GuildName)];
do_check_day_end([Item | T], NextTime, GuildName) ->
    [Item | do_check_day_end(T, NextTime, GuildName)].

done_account([Au = #guild_auction{goods = Goods,
                                  name = GuildName}]) ->
    NewGoods = check_done_account(Goods, GuildName),
    update(Au#guild_auction{goods = [],
                            last_goods = NewGoods}),
    NewGoods;
done_account(_) -> [].

check_done_account([], _) -> [];
check_done_account([Item = #guild_auction_goods{status =
                                                    1}
                    | T],
                   GuildName) ->
    [Item | check_done_account(T, GuildName)];
check_done_account([Item = #guild_auction_goods{item_id
                                                    = ItemId,
                                                item_num = ItemNum,
                                                bidders =
                                                    [#guild_auction_bidder{id =
                                                                               Rid,
                                                                           lev =
                                                                               Lev,
                                                                           name
                                                                               =
                                                                               Name,
                                                                           classes
                                                                               =
                                                                               Classes,
                                                                           price
                                                                               =
                                                                               Price}
                                                     | _]}
                    | T],
                   GuildName) ->
    MailInfo = #{items => [{ItemId, 0, ItemNum}],
                 title => lang:get("竞拍宝物成功"),
                 content =>
                     notice:format(lang:get("恭喜您竞拍~ts成功，请查收："),
                                   [{item_2, ItemId, ItemNum}])},
    mail:send(Rid, MailInfo),
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction(Rid,
                      Name,
                      Classes,
                      AuName,
                      Quality,
                      0,
                      0,
                      Price,
                      GuildName,
                      Lev),
    [Item#guild_auction_goods{status = 1}
     | check_done_account(T, GuildName)];
check_done_account([Item = #guild_auction_goods{status =
                                                    0,
                                                item_id = ItemId}
                    | T],
                   GuildName) ->
    {Quality, AuName} = case talisman_data:get(ItemId) of
                            #talisman_base{quality = Q, name = N} -> {Q, N};
                            _ -> {1, lang:get("未知宝物")}
                        end,
    log:guild_auction({9999,
                       env:get(platform),
                       env:get(zone_id)},
                      "流拍默认玩家",
                      1,
                      AuName,
                      Quality,
                      1,
                      0,
                      0,
                      GuildName,
                      1),
    [Item#guild_auction_goods{status = 2}
     | check_done_account(T, GuildName)];
check_done_account([Item | T], GuildName) ->
    [Item | check_done_account(T, GuildName)].

return_predecessor([]) -> ok;
return_predecessor([#guild_auction_bidder{id = Rid,
                                          loss = Loss}
                    | T]) ->
    MailInfo = #{items => Loss, title => lang:get("公会拍卖返还"),
                 content =>
                     lang:get("在公会竞拍中，您的竞拍道具名的价格被其他人超出，现返还竞拍资金，请查收：")},
    mail:send(Rid, MailInfo),
    return_predecessor(T).

to(#guild_role{id = Id, name = Name, sex = Sex,
               classes = Classes, lev = Lev},
   Price, Loss) ->
    #guild_auction_bidder{id = Id, name = Name, sex = Sex,
                          classes = Classes, lev = Lev, price = Price,
                          loss = Loss}.

do_list([], _Now) -> [];
do_list([ItemId | T], Now) ->
    case guild_auction_data:get(ItemId) of
        #{max_price := Max} ->
            Item = #guild_auction_goods{item_id = ItemId,
                                        item_num = 1, max_price = Max,
                                        added = Now,
                                        start_time = Now + get_start_time()},
            [Item | do_list(T, Now)];
        _ ->
            logger:error("找不到商品配置 ~w",
                         [ItemId],
                         guild_auction,
                         810),
            do_list(T, Now)
    end.

do_add_list([], NextId, Goods, _) -> {NextId, Goods};
do_add_list([Item = #guild_auction_goods{added = Now}
             | T],
            NextId, Goods, StartTime) ->
    do_add_list(T,
                NextId + 1,
                [Item#guild_auction_goods{id = NextId,
                                          start_time = Now + StartTime}
                 | Goods],
                StartTime).

reward_dividend(Total, [H | T], Members, Gid, GName) ->
    Sum = lists:sum([Joined
                     || #guild_dungeon_rank_role{times = Joined}
                            <- [H | T]]),
    logger:info("分红结算 ~w[~ts] 总额：~w, 总参与人次 ~w",
                [Gid, GName, Total, Sum],
                guild_auction,
                823),
    case Total > 0 andalso Sum > 0 of
        true ->
            Avg = util:ceil(Total / 2 / Sum),
            MailInfo = #{avg => Avg, title => lang:get("公会拍卖分红"),
                         total => Total},
            do_reward_dividend([H | T], MailInfo, Members);
        _ -> ok
    end;
reward_dividend(_, _, _, _, _) -> ok.

do_reward_dividend([], _, _) -> ok;
do_reward_dividend([#guild_dungeon_rank_role{role_id =
                                                 Id,
                                             times = Joined}
                    | T],
                   MailInfo = #{avg := Avg, total := Total}, Members) ->
    case lists:keyfind(Id, #guild_role.id, Members) of
        #guild_role{} ->
            Share = round(Joined * Avg),
            Content =
                notice:format(lang:get("本次公会拍卖总金额为~ts，感谢您在公会副本的辛劳付出，您获得分红~ts，敬请查收："),
                              [{assets_1, 90036, Total},
                               {assets_1, 90036, Share}]),
            mail:send(Id,
                      MailInfo#{items => [{90036, Share}],
                                content => Content});
        _ -> ok
    end,
    do_reward_dividend(T, MailInfo, Members).

do_destory([#guild_auction{goods = Goods}]) ->
    destory_return(Goods);
do_destory(_) -> ok.

destory_return([]) -> ok;
destory_return([#guild_auction_goods{status = 0,
                                     bidders = Bidders}
                | T]) ->
    return_predecessor(Bidders),
    destory_return(T);
destory_return([_ | T]) -> destory_return(T).

reload([Au = #guild_auction{goods = Goods}]) ->
    {NewGoods, Changeds} = do_reload(Goods, [], []),
    update(Au#guild_auction{goods = NewGoods}),
    Changeds;
reload(_) -> ok.

do_reload([], Goods, Changeds) -> {Goods, Changeds};
do_reload([H = #guild_auction_goods{status = 0,
                                    item_id = ItemId, max_price = MaxPrice}
           | T],
          Goods, Changeds) ->
    case guild_auction_data:get(ItemId) of
        #{max_price := Max} when Max =/= MaxPrice ->
            H1 = H#guild_auction_goods{max_price = Max},
            do_reload(T, [H1 | Goods], [H1 | Changeds]);
        _ -> do_reload(T, [H | Goods], Changeds)
    end;
do_reload([H | T], Goods, Changeds) ->
    do_reload(T, [H | Goods], Changeds).

get_state() ->
    Now = date:unixtime(),
    Zero = date:unixtime(zero),
    case agenda_data:get(1031) of
        Cfg = #{starttime := Start, endtime := End} ->
            IsToday = case Cfg of
                          #{args := WeekDays1} ->
                              lists:member(date:day_of_the_week(Now),
                                           WeekDays1);
                          _ -> true
                      end,
            if IsToday andalso Now < Zero + Start ->
                   {idle, Zero + Start - Now};
               IsToday andalso
                   Now >= Start + Zero andalso Now < Zero + End ->
                   {active, Zero + End - Now};
               true ->
                   case Cfg of
                       #{args := WeekDays} ->
                           {idle, date:week_next_diff(WeekDays, Now, Start)};
                       _ -> {idle, date:next_diff(Start, Now)}
                   end
            end;
        _ -> false
    end.

get_next_timeout() ->
    Now = date:unixtime(),
    case agenda_data:get(1031) of
        #{starttime := Start, args := WeekDays} ->
            date:week_next_diff(WeekDays, Now, Start);
        #{starttime := Start} -> date:next_diff(Start, Now)
    end.

get_start_time() -> get_next_timeout().

update_start_time(idle_not_use) ->
    L = ets:tab2list(guild_auction),
    Now = date:unixtime(),
    NextTime = Now + get_start_time(),
    do_update_start_time(L, NextTime);
update_start_time(_) -> ok.

do_update_start_time([], _) -> ok;
do_update_start_time([H = #guild_auction{goods = Goods}
                      | T],
                     NextTime) ->
    NewGoods = update_goods_start_time(Goods, NextTime),
    update(H#guild_auction{goods = NewGoods}),
    do_update_start_time(T, NextTime).

update_goods_start_time([], _) -> [];
update_goods_start_time([H | T], NextTime) ->
    [H | update_goods_start_time(T, NextTime)].

