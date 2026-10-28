-file("src/mod/guild/guild_mgr.erl", 1).

-module(guild_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         debug_list/0,
         create/3,
         list/0,
         list_to_client/0,
         search/1,
         pid/1,
         lev/1,
         get_leader_id/1,
         members/1,
         apply/3,
         info/2,
         attr/2,
         fix_role_idx/0,
         load_role_idx/1,
         update_name_used/1,
         refresh_applys/0,
         join/2,
         insert_truth_dare_log/1,
         list_truth_dare_log/0,
         empty_truth_dare_log/0,
         get_guild_num/0,
         sync_approve/2]).

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

-file("src/mod/guild/guild_mgr.erl", 39).

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

-file("src/mod/guild/guild_mgr.erl", 40).

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

-file("src/mod/guild/guild_mgr.erl", 41).

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

-file("src/mod/guild/guild_mgr.erl", 42).

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

-file("src/mod/guild/guild_mgr.erl", 43).

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

-file("src/mod/guild/guild_mgr.erl", 44).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_mgr.erl", 45).

-file("inc/guild_truth_dare.hrl", 1).

-author("Suhan").

-record(guild_truth_dare_info,
        {guild_id = {0, "", 0}, next_id = 0, his_info = []}).

-record(guild_truth_dare_his_info,
        {id = 0,
         time = 0,
         lucky_role = {0, "", 0},
         role_name = "",
         sex = 0,
         classes = 0,
         flower = 0,
         egg = 0,
         question_type = 0,
         question = ""}).

-record(guild_truth_dare_question_bank,
        {guild_id = {0, "", 0},
         ver = 0,
         next_id = 1000,
         truth_num = 0,
         dare_num = 0,
         question = []}).

-record(guild_truth_dare_question,
        {question_id = 0,
         type = 0,
         role_id = {0, "", 0},
         role_name = "",
         question = "",
         is_choose = 0}).

-record(guild_truth_dare_room_info,
        {guild_id = {0, "", 0},
         room_pid = undefined,
         num = 0,
         max_num = 0,
         role = []}).

-record(guild_truth_dare_room_log,
        {guild_id = {0, "", 0},
         scene_info = [],
         truth_num = 0,
         dare_num = 0,
         contents = []}).

-file("src/mod/guild/guild_mgr.erl", 46).

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

-file("src/mod/guild/guild_mgr.erl", 47).

-record(state, {next_id = 1}).

start_link() ->
    gen_server:start_link({local, guild_mgr},
                          guild_mgr,
                          [],
                          []).

create(GuildName, GuildBoard, Role = #role{}) ->
    do_create([check_cd,
               check_lev,
               check_consume,
               loss,
               create],
              GuildName,
              GuildBoard,
              Role,
              []).

do_create([], _GuildName, _GuildBoard, Role, _) ->
    map:role_update(Role),
    {ok, Role};
do_create([check_cd | T], GuildName, GuildBoard, Role,
          Args) ->
    Times = var:get_var(Role, week_five, 301, 0),
    case Times > 0 of
        true -> {false, lang:get("您本周已经创建过公会了,无法进行公会创建")};
        _ -> do_create(T, GuildName, GuildBoard, Role, Args)
    end;
do_create([check_lev | T], GuildName, GuildBoard,
          Role = #role{lev = Lev}, Args) ->
    case Lev < 20 of
        true ->
            {false, util:flist(lang:get("需要升到~w级之后才能创建公会"), [20])};
        _ -> do_create(T, GuildName, GuildBoard, Role, Args)
    end;
do_create([check_consume | T], GuildName, GuildBoard,
          Role = #role{consume = Consume}, Args) ->
    case Consume < 2000 of
        true -> {false, lang:get("累计消耗2000钻石可拥有创建公会的权限")};
        _ -> do_create(T, GuildName, GuildBoard, Role, Args)
    end;
do_create([loss | T], GuildName, GuildBoard,
          Role = #role{id = RoleId = {_, P, Z}, name = Name,
                       classes = Classes, sex = Sex, lev = Lev},
          Args) ->
    Board1 = case GuildBoard of
                 "" -> guild_common:msg(1);
                 _ -> GuildBoard
             end,
    Loss = [#loss{label = gold, val = 500,
                  msg =
                      notice:format(lang:get("需要~ts才能创建公会哦！"),
                                    [{assets_1, 90002, 500}])}],
    case role_gain:do(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, LossRole} ->
            NewRole = var:set_var(LossRole, week_five, 301, 1),
            case guild_role:to_guild_role(NewRole) of
                {ok, Grole} ->
                    Grole1 = Grole#guild_role{status = 1,
                                              last_login = date:unixtime(),
                                              enter_time = date:unixtime(),
                                              post = 60},
                    MaxAssets = case guild_data:uplev(1) of
                                    #{assets_limit := AssetsLimit} ->
                                        AssetsLimit;
                                    _ -> 5000000
                                end,
                    Members = [Grole1],
                    Guild = #guild{id = {1, P, Z}, name = GuildName,
                                   members = Members, mem_num = 1,
                                   leader_id = RoleId, leader_name = Name,
                                   leader_sex = Sex, leader_classes = Classes,
                                   leader_lev = Lev, board = Board1,
                                   announcement = guild_common:msg(2),
                                   max_assets = MaxAssets,
                                   create_time = date:unixtime(),
                                   create_id = RoleId, create_name = Name,
                                   board_id = RoleId},
                    do_create(T,
                              GuildName,
                              Board1,
                              NewRole,
                              [{guild, Guild} | Args]);
                _ -> {false, lang:get("转换角色数据失败, 无法创建公会")}
            end
    end;
do_create([create | T], GuildName, GuildBoard,
          Role = #role{id = RoleId, name = RoleName}, Args) ->
    case lists:keyfind(guild, 1, Args) of
        {_, G = #guild{}} ->
            case case catch gen_server:call(guild_mgr,
                                            {create, G, RoleId, RoleName},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {ok, GuildId, GuildPid} ->
                    Mg = #m_guild{id = GuildId, name = GuildName,
                                  pid = GuildPid, post = 60,
                                  enter_time = date:unixtime()},
                    GuildRole = guild_role:alters([{m_guild, Mg}], Role),
                    guild_truth_dare_mgr:info({create_guild, GuildId}),
                    Items = [{70053, 1}],
                    Gain = format:val_to_gain(Items),
                    NewRole = case role_gain:do_notice(Gain, GuildRole) of
                                  {ok, GainRole} -> GainRole;
                                  _ ->
                                      Title = lang:get("会长礼包"),
                                      Content =
                                          lang:get("由于背包已满,您创建公会的礼包通过邮件发送,请查收"),
                                      mail:send(GuildRole,
                                                Title,
                                                Content,
                                                Items),
                                      GuildRole
                              end,
                    do_create(T, GuildName, GuildBoard, NewRole, Args);
                {false, Reason} -> {false, Reason};
                _Err -> {false, lang:get("系统繁忙，请稍后再尝试")}
            end;
        _ -> {false, lang:get("无法找到公会数据")}
    end.

insert_truth_dare_log(LogInfo) ->
    ets:insert(guild_truth_dare_log, LogInfo).

list_truth_dare_log() ->
    case catch ets:tab2list(guild_truth_dare_log) of
        {'EXIT', {badarg, _}} -> {false, guild_mgr_not_running};
        L when is_list(L) -> {ok, L};
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

empty_truth_dare_log() ->
    ets:delete_all_objects(guild_truth_dare_log).

list() ->
    case catch ets:tab2list(guild_list) of
        {'EXIT', {badarg, _}} -> {false, guild_mgr_not_running};
        L when is_list(L) -> {ok, L};
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

get_guild_num() ->
    case list() of
        {ok, L} -> length(L);
        _ -> 0
    end.

list_to_client() ->
    Match = #guild{id = '$1', name = '$2', lev = '$3',
                   totem = '$4', leader_name = '$5', leader_id = '$6',
                   leader_sex = '$7', leader_classes = '$8',
                   leader_lev = '$9', mem_num = '$10', max_mem_num = '$11',
                   fresh_num = '$12', max_fresh_num = '$13', board = '$14',
                   announcement = '$15', activity = '$16', health = '$17',
                   _ = '_'},
    F = fun ([Id,
              Name,
              Lev,
              Totem,
              LeaderName,
              LeaderId,
              LeaderSex,
              LeaderClass,
              LeaderLev,
              MemNum,
              MaxMemNum,
              FreshNum,
              MaxFreshNum,
              Board,
              Announce,
              Activity,
              Health]) ->
                #guild{id = Id, name = Name, lev = Lev, totem = Totem,
                       leader_name = LeaderName, leader_id = LeaderId,
                       leader_sex = LeaderSex, leader_classes = LeaderClass,
                       leader_lev = LeaderLev, mem_num = MemNum,
                       max_mem_num = MaxMemNum, fresh_num = FreshNum,
                       max_fresh_num = MaxFreshNum, board = Board,
                       announcement = Announce, activity = Activity,
                       health = Health}
        end,
    case catch ets:select(guild_list, [{Match, [], ['$$']}])
        of
        L when is_list(L) -> {ok, [F(O) || O <- L]};
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

search(Name) ->
    case catch ets:match_object(guild_list,
                                #guild{name = Name, _ = '_'})
        of
        {'EXIT', {badarg, _}} -> {false, guild_mgr_not_running};
        L when is_list(L) -> {ok, L};
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

debug_list() ->
    case catch ets:tab2list(guild_list) of
        {'EXIT', {badarg, _}} -> {false, guild_mgr_not_running};
        L when is_list(L) ->
            logger:info("公会名字       成员人数      学徒人数",
                        [],
                        guild_mgr,
                        232),
            lists:foreach(fun (#guild{name = Name, mem_num = MemNum,
                                      fresh_num = FreshNum}) ->
                                  logger:info("~ts    ~w    ~w",
                                              [Name, MemNum, FreshNum],
                                              guild_mgr,
                                              234)
                          end,
                          L),
            ok;
        _ -> {false, lang:get("系统繁忙，无法查询")}
    end.

pid({GuildId, Platform, Zone}) ->
    case catch ets:lookup_element(guild_list,
                                  {GuildId, Platform, Zone},
                                  #guild.pid)
        of
        Pid when is_pid(Pid) -> {ok, Pid};
        _ -> {error, guild_not_found}
    end.

lev({GuildId, Platform, Zone}) ->
    case catch ets:lookup_element(guild_list,
                                  {GuildId, Platform, Zone},
                                  #guild.lev)
        of
        Lev when is_integer(Lev) -> {ok, Lev};
        _ -> {error, guild_not_found}
    end.

members({GuildId, Platform, Zone}) ->
    case catch ets:lookup_element(guild_list,
                                  {GuildId, Platform, Zone},
                                  #guild.members)
        of
        Members when is_list(Members) -> {ok, Members};
        _ -> {error, guild_not_found}
    end.

info(by_pid, Pid) ->
    case catch ets:match_object(guild_list,
                                #guild{pid = Pid, _ = '_'})
        of
        [] -> {error, guild_not_exists};
        [G] -> {ok, G};
        _ -> {error, guild_not_running}
    end;
info(by_id, {GuildId, Platform, ZoneId}) ->
    case catch ets:lookup(guild_list,
                          {GuildId, Platform, ZoneId})
        of
        [G] -> {ok, G};
        [] -> {error, guild_not_exists};
        _ -> {error, guild_not_running}
    end;
info(by_name, GuildName) when is_list(GuildName) ->
    case catch ets:match_object(guild_list,
                                #guild{name = GuildName, _ = '_'})
        of
        [] -> {error, guild_not_exists};
        [G] -> {ok, G};
        _ -> {error, guild_not_running}
    end.

attr(GuildId, Pos) ->
    catch ets:lookup_element(guild_list, GuildId, Pos).

get_leader_id(#role{m_guild =
                        #m_guild{id = GuildId}}) ->
    get_leader_id(GuildId);
get_leader_id(GuildId) ->
    case catch ets:lookup_element(guild_list,
                                  GuildId,
                                  #guild.leader_id)
        of
        {R, P, Z} -> {ok, {R, P, Z}};
        _ -> false
    end.

-spec apply(T, Guild, Mfa) -> ok |
                              {error, not_pid} |
                              {error, self_call} |
                              Reply when T :: async | sync,
                                         Guild :: pid() |
                                                  {non_neg_integer(),
                                                   bitstring(),
                                                   non_neg_integer()},
                                         Mfa :: {F} | {F, A} | {M, F, A},
                                         M :: atom(), F :: function() | atom(),
                                         A :: list(), Reply :: term().

apply(T, {GuildId, Platform, ZoneId}, Mfa) ->
    case guild_mgr:pid({GuildId, Platform, ZoneId}) of
        {ok, GuildPid} -> guild_mgr:apply(T, GuildPid, Mfa);
        _ ->
            logger:error("无法获取公会[~w,~ts,~w]的进程，无法执行[~w]",
                         [GuildId, Platform, ZoneId, Mfa],
                         guild_mgr,
                         307),
            {error, not_pid}
    end;
apply(async, GuildPid, _Mfa)
    when not is_pid(GuildPid) ->
    logger:error("公会回调使用非PID，无法调用[~w]",
                 [_Mfa],
                 guild_mgr,
                 311),
    ok;
apply(async, GuildPid, {F}) ->
    GuildPid ! {apply_async, {F}},
    ok;
apply(async, GuildPid, {F, A}) ->
    GuildPid ! {apply_async, {F, A}},
    ok;
apply(async, GuildPid, {M, F, A}) ->
    GuildPid ! {apply_async, {M, F, A}},
    ok;
apply(sync, GuildPid, _Mfa) when not is_pid(GuildPid) ->
    {error, not_pid};
apply(sync, GuildPid, Mfa) when self() =:= GuildPid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用者[~w:~w]执行apply[~w]时发生错误：调用了自身",
                 [M, F, Mfa],
                 guild_mgr,
                 326),
    {error, self_call};
apply(sync, GuildPid, {F}) ->
    case catch gen_server:call(GuildPid,
                               {apply_sync, F},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, GuildPid, {F, A}) ->
    case catch gen_server:call(GuildPid,
                               {apply_sync, {F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, GuildPid, {M, F, A}) ->
    case catch gen_server:call(GuildPid,
                               {apply_sync, {M, F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

sync_approve(GuildApply, GuildInfo) ->
    case catch gen_server:call(guild_mgr,
                               {sync_approve, GuildApply, GuildInfo},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

fix_role_idx() ->
    ets:delete_all_objects(guild_role_idx),
    L = ets:tab2list(guild_list),
    lists:foreach(fun (#guild{pid = Pid})
                          when is_pid(Pid) ->
                          guild:apply(async,
                                      Pid,
                                      {guild_mgr, load_role_idx, []}),
                          ok;
                      (_) -> ok
                  end,
                  L),
    ok.

refresh_applys() -> guild_mgr ! refresh_applys.

join(GuildId, RoleId) ->
    guild_mgr ! {join, GuildId, RoleId}.

init([]) ->
    logger:info("[~w] 正在启动...",
                [guild_mgr],
                guild_mgr,
                364),
    process_flag(trap_exit, true),
    dets:open_file(guild_list,
                   [{file, "./dets/guild.dets"},
                    {keypos, #guild.id},
                    {type, set}]),
    ets:new(guild_list,
            [set, named_table, public, {keypos, #guild.id}]),
    ets:new(guild_role_idx,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_leaver,
                   [{file, "./dets/guild_leaver.dets"},
                    {keypos, #guild_leaver.id},
                    {type, set}]),
    ets:new(guild_leaver,
            [set, named_table, public, {keypos, #guild_leaver.id}]),
    dets:open_file(guild_join,
                   [{file, "./dets/guild_join.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(guild_join,
            [set, named_table, public, {keypos, 1}]),
    ets:new(guild_name_used,
            [set, named_table, public, {keypos, 1}]),
    env:set(guild_auto_chat_num, 1),
    dets:open_file(guild_mail,
                   [{file, "./dets/guild_mail.dets"},
                    {keypos, #mail.sess},
                    {type, set}]),
    ets:new(guild_mail,
            [set, named_table, public, {keypos, #mail.sess}]),
    dets:to_ets(guild_mail, guild_mail),
    ets:new(guild_build_accelerate_info,
            [set, named_table, public, {keypos, 1}]),
    ets:new(guild_truth_dare_log,
            [set,
             named_table,
             public,
             {keypos, #guild_truth_dare_room_log.guild_id}]),
    StartFlag = case dets:first(guild_list) of
                    '$end_of_table' ->
                        logger:info("没有数据需要加载", [], guild_mgr, 393),
                        [];
                    _ ->
                        dets:traverse(guild_list,
                                      fun (G) ->
                                              case guild_ver:convert(G) of
                                                  {false, Reason} ->
                                                      logger:error("帮会数据转换失败:~w",
                                                                   [Reason],
                                                                   guild_mgr,
                                                                   400),
                                                      {done, false};
                                                  NewG ->
                                                      guild:start_link(NewG),
                                                      load_role_idx(NewG),
                                                      update_name_used(NewG),
                                                      continue
                                              end
                                      end)
                end,
    dets:to_ets(guild_leaver, guild_leaver),
    dets:to_ets(guild_join, guild_join),
    AutoMergeTimeout = date:next_diff(23, 58, 0),
    logger:info("下次自动合并时间 ~w",
                [AutoMergeTimeout],
                guild_mgr,
                415),
    Ref = erlang:send_after(AutoMergeTimeout * 1000,
                            self(),
                            auto_merge),
    put(guild_merge_ref, Ref),
    WeekRewardTimeout = date:next_diff(11, 50, 0),
    logger:info("下次尝试发送周奖励时间 ~w",
                [WeekRewardTimeout],
                guild_mgr,
                419),
    WeekRewardRef = erlang:send_after(WeekRewardTimeout *
                                          1000,
                                      self(),
                                      week_reward),
    put(week_reward_ref, WeekRewardRef),
    case StartFlag of
        [] ->
            case get(max_guild_id) of
                MaxId2 when is_integer(MaxId2) ->
                    NewState = #state{},
                    NewMaxId2 = MaxId2 + 1,
                    logger:debug("载入成功，普通公会ID是[~w]",
                                 [NewMaxId2],
                                 guild_mgr,
                                 429),
                    logger:info("[~w] 启动完成", [guild_mgr], guild_mgr, 430),
                    {ok, NewState#state{next_id = NewMaxId2}};
                undefined ->
                    State = #state{},
                    logger:info("[~w] 启动完成", [guild_mgr], guild_mgr, 434),
                    {ok, State};
                _Err ->
                    logger:error("公会ID获取错误:~w", [_Err], guild_mgr, 437),
                    {stop, err_max_id}
            end;
        _Err ->
            logger:error("公会数据文件载入失败:~w", [_Err], guild_mgr, 441),
            {stop, data_load_err}
    end.

handle_call({create,
             G = #guild{id = {_, Platform, ZoneId}, name = Name},
             RoleId,
             RoleName},
            _From, State = #state{next_id = NextId}) ->
    case ets:lookup(guild_name_used, Name) of
        [_ | _] ->
            {reply, {false, lang:get("已经存在同名的公会，请换一个公会名字")}, State};
        [] ->
            NewG = G#guild{id = {NextId, Platform, ZoneId}},
            case catch dets:insert(guild_list, NewG) of
                ok ->
                    case guild:start_link(NewG, create) of
                        {ok, GuildPid} ->
                            guild_role:add_role({NextId, Platform, ZoneId},
                                                RoleId),
                            guild_creat_cast(RoleId,
                                             RoleName,
                                             {NextId, Platform, ZoneId},
                                             Name),
                            refresh_applys(),
                            {reply,
                             {ok, {NextId, Platform, ZoneId}, GuildPid},
                             State#state{next_id = NextId + 1}};
                        Err ->
                            logger:error("公会已经创建，但启动公会进程失败: ~w",
                                         [Err],
                                         guild_mgr,
                                         462),
                            dets:delete(guild_list, {NextId, Platform, ZoneId}),
                            {reply,
                             {false, lang:get("公会已经创建，但却启动失败，请联系GM")},
                             State}
                    end;
                {error, Err} ->
                    logger:error("创建公会时发生异常: ~w", [Err], guild_mgr, 467),
                    {reply, {false, lang:get("公会系统暂时不可用，请稍后再试")}, State}
            end;
        Err ->
            logger:error("创建公会时发生异常: ~w", [Err], guild_mgr, 471),
            {reply, {false, lang:get("公会系统暂时不可用，请稍后再试")}, State}
    end;
handle_call({sync_approve,
             GuildApply = #guild_apply{id = RoleId, type = Post,
                                       tag = Tag, msg = Msg},
             GuildInfo = {GuildId, _, _, _}},
            _From, State) ->
    Reply = case guild_role:find_role(RoleId) of
                false ->
                    case role_query:pid(by_id, RoleId) of
                        {ok, RolePid} ->
                            case role:apply(sync,
                                            RolePid,
                                            {guild_common,
                                             sync_approve_join,
                                             [#{info => GuildInfo, tag => Tag,
                                                msg => Msg}]})
                                of
                                {true, GuildRole} ->
                                    guild_role:add_role(GuildId, RoleId),
                                    {online_join,
                                     GuildRole#guild_role{post = Post}};
                                false -> {has_guild, RoleId};
                                _ -> {timeout, RoleId}
                            end;
                        {error, not_found} ->
                            guild_role:add_role(GuildId, RoleId),
                            case guild_role:to_guild_role(GuildApply) of
                                {ok, GuildRole} ->
                                    {off_join,
                                     GuildRole#guild_role{post = Post}};
                                _ ->
                                    {off_join,
                                     #guild_role{id = RoleId, post = Post}}
                            end;
                        {error, _} -> {timeout, RoleId}
                    end;
                {ok, _} -> {has_guild, RoleId};
                _ -> {timeout, RoleId}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(refresh_applys, State) ->
    L = ets:tab2list(guild_list),
    lists:foreach(fun (#guild{pid = Pid})
                          when is_pid(Pid) ->
                          Pid ! refresh_applys,
                          ok;
                      (_) -> ok
                  end,
                  L),
    {noreply, State};
handle_info(clear_union_applys, State) ->
    guild_union:clear_applys(),
    {noreply, State};
handle_info(auto_merge, State) ->
    case get(guild_merge_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    guild_union:auto_merge(),
    AutoMergeTimeout = date:next_diff(23, 58, 0),
    logger:info("下次自动合并时间 ~w",
                [AutoMergeTimeout],
                guild_mgr,
                533),
    Ref = erlang:send_after(AutoMergeTimeout * 1000,
                            self(),
                            auto_merge),
    put(guild_merge_ref, Ref),
    {noreply, State};
handle_info({join, GuildId, RoleId}, State) ->
    List1 = case ets:lookup(guild_join, GuildId) of
                [{GuildId, List}] -> List;
                _ -> []
            end,
    Datas = [RoleId | lists:delete(RoleId, List1)],
    ets:insert(guild_join, {GuildId, Datas}),
    dets:insert(guild_join, {GuildId, Datas}),
    {noreply, State};
handle_info(week_reward, State) ->
    case get(week_reward_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    campaign_misc:week_reward(),
    WeekRewardTimeout = date:next_diff(11, 50, 0),
    logger:info("下次尝试发送公会周奖励时间 ~w",
                [WeekRewardTimeout],
                guild_mgr,
                557),
    Ref = erlang:send_after(WeekRewardTimeout * 1000,
                            self(),
                            week_reward),
    put(week_reward_ref, Ref),
    {noreply, State};
handle_info({'EXIT', _, normal}, State) ->
    {noreply, State};
handle_info({'EXIT', Pid, Reason}, State) ->
    case info(by_pid, Pid) of
        {ok, H = #guild{name = Name}} ->
            logger:error("收到公会[~ts]退出消息[Reason:~w]",
                         [Name, Reason],
                         guild_mgr,
                         567),
            case guild:start_link(H) of
                {ok, _Gpid} -> ok;
                _ -> logger:error("公会进程重启失败", [], guild_mgr, 570)
            end;
        _Err ->
            logger:error("重启时无法找到公会数据:~w", [_Err], guild_mgr, 573)
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [guild_mgr],
                guild_mgr,
                581),
    util:close_dets(guild_list),
    logger:info("[~w] 关闭完成", [guild_mgr], guild_mgr, 583),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

guild_creat_cast(_RoleId, RoleName, _GuildId,
                 GuildName) ->
    Msg =
        notice:format(lang:get("~ts与TA的小伙伴建立了公会~ts，大陆势力风起云涌！"),
                      [{role_2, RoleName}, {string_2, 2, GuildName}]),
    notice:cast(all, 5, Msg),
    ok.

load_role_idx(#guild{id = GuildId = {Id, _, _},
                     name = _GuildName, members = Members}) ->
    logger:info("载入[Id:~w][~ts]公会成员数据",
                [GuildId, _GuildName],
                guild_mgr,
                601),
    update_next_guild_id(Id),
    do_load_role_idx(GuildId, Members).

do_load_role_idx(_GuildId, []) -> ok;
do_load_role_idx(GuildId,
                 [#guild_role{id = RoleId} | T]) ->
    ets:insert(guild_role_idx, {RoleId, GuildId}),
    do_load_role_idx(GuildId, T).

update_name_used(#guild{id = Id, name = Name,
                        name_used = NameUsed}) ->
    L = case NameUsed of
            "" -> [{Name, Id}];
            _ -> [{Name, Id}, {NameUsed, Id}]
        end,
    ets:insert(guild_name_used, L).

update_next_guild_id(GuildId) ->
    case get(max_guild_id) of
        undefined -> put(max_guild_id, max(1, GuildId));
        ID -> put(max_guild_id, max(ID, GuildId))
    end.

