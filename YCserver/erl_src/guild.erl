-file("src/mod/guild/guild.erl", 1).

-module(guild).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1,
         start_link/2,
         destory/1,
         sync_cache/1,
         sync/1,
         leader_send/3,
         stop/2,
         call_stop/2,
         enter/1,
         leave/1,
         apply/3,
         cast/3,
         pack_cast/3,
         chat/3,
         get_chat_history/1,
         chat_others/4,
         notice/2,
         adm_show/1]).

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

-file("src/mod/guild/guild.erl", 34).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/guild/guild.erl", 35).

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

-file("src/mod/guild/guild.erl", 36).

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

-file("src/mod/guild/guild.erl", 37).

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

-file("src/mod/guild/guild.erl", 38).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild.erl", 39).

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

-file("src/mod/guild/guild.erl", 40).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/guild/guild.erl", 41).

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

-file("src/mod/guild/guild.erl", 42).

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

-file("src/mod/guild/guild.erl", 43).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/guild/guild.erl", 44).

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

-file("src/mod/guild/guild.erl", 45).

-spec start_link(#guild{}) -> {ok, pid()} |
                              ignore |
                              {error, term()}.

start_link(Ginfo) ->
    gen_server:start_link(guild, [Ginfo, normal], []).

-spec start_link(#guild{}, create) -> {ok, pid()} |
                                      ignore |
                                      {error, term()}.

start_link(Ginfo, create) ->
    gen_server:start_link(guild, [Ginfo, create], []).

-spec stop(Type :: normal | kill,
           GuildPid :: pid()) -> ok.

stop(Type, GuildPid) when is_pid(GuildPid) ->
    GuildPid ! {stop, Type},
    ok;
stop(_, _) -> ok.

-spec call_stop(Type :: normal | kill,
                GuildPid :: pid()) -> ok.

call_stop(Type, GuildPid) when is_pid(GuildPid) ->
    case catch gen_server:call(GuildPid,
                               {stop, Type},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
call_stop(_, _) -> ok.

-spec cast(Members :: [#guild_role{}] | pid(),
           Cmd :: pos_integer(), Data :: any()) -> ok.

cast(GuildPid, Cmd, Data) when is_pid(GuildPid) ->
    GuildPid ! {cast, Cmd, Data},
    ok;
cast(Members, Cmd, Data) when is_list(Members) ->
    do_cast(Members, Cmd, Data),
    ok;
cast(Gid = {_, _, _}, Cmd, Data) ->
    case guild_mgr:info(by_id, Gid) of
        {ok, #guild{members = Mems}} ->
            do_cast(Mems, Cmd, Data);
        _ -> skip
    end;
cast(_, Cmd, Data) ->
    logger:error("公会广播CMD:~w,Data:~w",
                 [Cmd, Data],
                 guild,
                 99),
    ok.

-spec pack_cast(Members :: [#guild_role{}] | pid(),
                Cmd :: pos_integer(), Data :: any()) -> ok | false.

pack_cast(GuildPid, Cmd, Data) when is_pid(GuildPid) ->
    case sys_conn:pack(Cmd, Data) of
        {ok, PackBin} ->
            GuildPid ! {pack_cast, PackBin},
            ok;
        _ -> false
    end;
pack_cast(Members, Cmd, Data) when is_list(Members) ->
    case sys_conn:pack(Cmd, Data) of
        {ok, PackBin} -> do_cast(Members, PackBin);
        _ -> false
    end;
pack_cast(Gid = {_, _, _}, Cmd, Data) ->
    case guild_mgr:info(by_id, Gid) of
        {ok, #guild{members = Mems}} ->
            pack_cast(Mems, Cmd, Data);
        _ -> false
    end;
pack_cast(_, Cmd, Data) ->
    logger:error("公会广播CMD:~w,Data:~w",
                 [Cmd, Data],
                 guild,
                 119),
    false.

-spec notice(GuildArgs, Msg) -> ok when GuildArgs ::
                                            pid() | list() | guild_id(),
                                        Msg :: bitstring().

notice(GuildPid, Msg) when is_pid(GuildPid) ->
    GuildPid ! {notice, Msg},
    ok;
notice({GuildId, Plat, Zone}, Msg) ->
    case guild_mgr:pid({GuildId, Plat, Zone}) of
        {ok, GuildPid} -> GuildPid ! {notice, Msg};
        _ -> ok
    end;
notice(GuildMem, Msg) when is_list(GuildMem) ->
    do_notice(GuildMem, Msg),
    ok;
notice(#m_guild{id = GuildId}, Msg) ->
    notice(GuildId, Msg);
notice(_, _) -> ok.

-spec chat(Pid :: pid(), Cmd :: pos_integer(),
           ChatMsg :: chat:chat_msg()) -> ok.

chat(Pid, Cmd, ChatMsg) ->
    Pid ! {chat, Cmd, ChatMsg},
    ok.

chat_others(Pid, Rid, Cmd, ChatMsg) ->
    Pid ! {chat_others, Rid, Cmd, ChatMsg},
    ok.

get_chat_history(#role{pid = Pid,
                       m_guild = #m_guild{pid = GuildPid}}) ->
    GuildPid ! {get_chat_history, Pid};
get_chat_history(_) -> ok.

leader_send(Members, Cmd, Data) when is_list(Members) ->
    case lists:keyfind(60, #guild_role.post, Members) of
        #guild_role{pid = RolePid} when is_pid(RolePid) ->
            role:pack_send(RolePid, Cmd, Data),
            ok;
        _ -> ok
    end;
leader_send(GuildId, Cmd, Data) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok, #guild{members = Members}} ->
            leader_send(Members, Cmd, Data);
        _ -> ok
    end.

destory(Guild = #guild{id = GuildId,
                       mail_list = MailList}) ->
    case dets:delete(guild_list, GuildId) of
        ok ->
            do_leave(Guild),
            rank_listener:handle(destory, Guild, 1),
            catch guild_auction:destory(Guild),
            catch guild_common:del_guild_mail(MailList),
            put(flag_destory, true),
            true;
        Err ->
            logger:error("销毁公会时发生异常:~w", [Err], guild, 184),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

-spec enter(#role{}) -> {ok, NewRole :: #role{}} |
                        {false, bitstring()}.

enter(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态无法进入公会领地")};
enter(Role = #role{name = Name, id = Id,
                   pos =
                       #pos{map = MapId, x = X, y = Y, platform = OldPlatform,
                            zone_id = OldZoneId},
                   m_guild = #m_guild{}}) ->
    case check_enter_area(Role) of
        false -> {false, lang:get("不在公会中, 无法进入公会领地")};
        {false, Why} -> {false, Why};
        {true, ToPos} ->
            case map:role_enter(ToPos,
                                {enter_guild, Id},
                                Role#role{s_event = 2})
                of
                {error, Reason} ->
                    logger:error("[~s]进入公会领地失败:~w",
                                 [Name, Reason],
                                 guild,
                                 199),
                    {false, lang:get("进入公会领地失败")};
                {ok, NewRole = #role{pos = Pos}} ->
                    Last = #pos_history{map = MapId, x = X, y = Y,
                                        platform = OldPlatform,
                                        zone_id = OldZoneId},
                    {ok, NewRole#role{pos = Pos#pos{last = Last}}}
            end
    end;
enter(_Role) -> {false, lang:get("不在公会中, 无法进入公会领地")}.

-spec leave(#role{}) -> {ok, NewRole :: #role{}} |
                        {false, Why :: bitstring()}.

leave(Role = #role{s_event = 2, pos = Pos}) ->
    ToPos = get_leave_pos(Pos),
    case map:role_enter(ToPos, Role#role{s_event = 0}) of
        {ok, NewRole} -> {ok, NewRole};
        _ ->
            case map:role_enter(util:rand_list([{10001, 306, 3507},
                                                {10001, 2583, 3848},
                                                {10001, 4957, 3680},
                                                {10001, 445, 2565},
                                                {10001, 4646, 704},
                                                {10001, 841, 1033},
                                                {10001, 2098, 1834},
                                                {10001, 3617, 1816}]),
                                Role#role{s_event = 0})
                of
                {error, Reason} ->
                    logger:error("退出公会领地进入主城时出错:~w", [Reason], guild, 220),
                    {false, lang:get("退出失败")};
                {ok, Nr} -> {ok, Nr}
            end
    end;
leave(Role) -> {ok, Role}.

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
        {ok, GuildPid} -> guild:apply(T, GuildPid, Mfa);
        _ ->
            logger:error("无法获取公会[~w,~s,~w]的进程，无法执行[~w]",
                         [GuildId, Platform, ZoneId, Mfa],
                         guild,
                         242),
            {error, not_pid}
    end;
apply(async, GuildPid, _Mfa)
    when not is_pid(GuildPid) ->
    logger:error("公会回调使用非PID，无法调用[~w]", [_Mfa], guild, 246),
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
                 guild,
                 261),
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

init([G = #guild{name = _Name, members = Mb, lev = Lev,
                 assets = Assets, exchequer_lev = ExchequerLev, id = _Id,
                 element_info = ElementInfo},
      Flag]) ->
    process_flag(trap_exit, true),
    case battle_mgr:fetch_ids(2) of
        {ok, [GuildBattleId, GuildBossBattleId]} ->
            put(guild_battle_id, GuildBattleId),
            put(guild_boss_battle_id, GuildBossBattleId),
            put(chat_history, []),
            case map_mgr:create(30001) of
                {ok, MapPid, MapId} ->
                    Guild = case Flag of
                                create ->
                                    NG = case guild_data:uplev(Lev) of
                                             #{assets_limit := AssetsLimit} ->
                                                 case
                                                     guild_data:exchequer(ExchequerLev)
                                                     of
                                                     #{mem := MaxMemNum,
                                                       fresh := MaxFreshNum} ->
                                                         G#guild{pid = self(),
                                                                 max_assets =
                                                                     AssetsLimit,
                                                                 assets =
                                                                     min(Assets,
                                                                         AssetsLimit),
                                                                 max_mem_num =
                                                                     MaxMemNum,
                                                                 max_fresh_num =
                                                                     MaxFreshNum};
                                                     _ ->
                                                         G#guild{pid = self(),
                                                                 max_assets =
                                                                     AssetsLimit,
                                                                 assets =
                                                                     min(Assets,
                                                                         AssetsLimit)}
                                                 end;
                                             _ -> G#guild{pid = self()}
                                         end,
                                    guild_trigger:fire([#g_evt_lev{val = Lev},
                                                        #g_evt_member{val =
                                                                          length(Mb)}],
                                                       NG);
                                _ ->
                                    self() ! start,
                                    NewMb = [Gr#guild_role{pid = undefined,
                                                           status = 0}
                                             || Gr <- Mb],
                                    G1 = G#guild{pid = self(), members = NewMb},
                                    G1
                            end,
                    NewGuild = guild_build:active(Guild#guild{map_pid =
                                                                  MapPid,
                                                              map_id = MapId}),
                    unit_mgr:create({GuildBattleId, 10006},
                                    10006,
                                    {MapId, 3604, 1748}),
                    unit_mgr:create({GuildBattleId, 20032},
                                    20032,
                                    {MapId, 1415, 493}),
                    unit_mgr:create({GuildBattleId, 20058},
                                    20058,
                                    {MapId, 1921, 535}),
                    ElementNpcId = case ElementInfo of
                                       [] -> 20101;
                                       _ -> 20102
                                   end,
                    unit_mgr:create({GuildBattleId, ElementNpcId},
                                    ElementNpcId,
                                    {MapId, 2542, 1301}),
                    init_time(),
                    guild_treasure:init_timer(NewGuild),
                    sync_cache(NewGuild),
                    rank_listener:handle(guild, NewGuild, 1),
                    case Flag of
                        create -> catch sync_admin_url(NewGuild);
                        _ -> ok
                    end,
                    logger:debug("公会[~ts]已经启动",
                                 [NewGuild#guild.name],
                                 guild,
                                 338),
                    {ok, NewGuild#guild{flag = 0}};
                {error, Err} ->
                    logger:error("启动公会进程失败，因为地图进程启动失败所导致: ~w",
                                 [Err],
                                 guild,
                                 341),
                    {stop, guild_map_start_failure}
            end;
        _Err ->
            logger:error("公会请求战场ID失败:~w", [_Err], guild, 345),
            {stop, guild_battle_id_failure}
    end.

handle_call({apply_sync, {F}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F, [State]),
                             {undefined, F, []},
                             State);
handle_call({apply_sync, {F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F,
                                                [State | A]),
                             {undefined, F, A},
                             State);
handle_call({apply_sync, {M, F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(M,
                                                F,
                                                [State | A]),
                             {M, F, A},
                             State);
handle_call({guild_role, RoleId}, _From,
            State = #guild{members = Members}) ->
    Reply = case lists:keyfind(RoleId,
                               #guild_role.id,
                               Members)
                of
                GuildRole = #guild_role{} -> {ok, GuildRole};
                _ -> false
            end,
    {reply, Reply, State};
handle_call(info, _From, State) ->
    {reply, {ok, State}, State};
handle_call({stop, Reason}, _From, State) ->
    {stop, Reason, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({apply_async, {F}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
                                                 [State]),
                              {undefined, F, []},
                              State);
handle_info({apply_async, {F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
                                                 [State | A]),
                              {undefined, F, A},
                              State);
handle_info({apply_async, {M, F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(M,
                                                 F,
                                                 [State | A]),
                              {M, F, A},
                              State);
handle_info({chat, Cmd, ChatMsg},
            State = #guild{members = Members}) ->
    case Cmd of
        10400 ->
            put(chat_history,
                lists:sublist([ChatMsg | get(chat_history)], 5));
        _ -> skip
    end,
    do_cast(Members, Cmd, ChatMsg),
    {noreply, State};
handle_info({chat_others, Rid, Cmd, ChatMsg},
            State = #guild{members = Members}) ->
    do_cast(lists:keydelete(Rid, #guild_role.id, Members),
            Cmd,
            ChatMsg),
    {noreply, State};
handle_info({get_chat_history, Pid}, State) ->
    lists:foreach(fun (ChatMsg) ->
                          role:pack_send(Pid, 10400, ChatMsg)
                  end,
                  lists:reverse(get(chat_history))),
    {noreply, State};
handle_info({notice, Msg},
            State = #guild{members = Members}) ->
    do_notice(Members, Msg),
    {noreply, State};
handle_info({cast, Cmd, Data},
            State = #guild{members = Members}) ->
    do_cast(Members, Cmd, Data),
    {noreply, State};
handle_info({pack_cast, PackBin},
            State = #guild{members = Members}) ->
    do_cast(Members, PackBin),
    {noreply, State};
handle_info({online,
             #guild_role{id = RoleId, pid = RolePid, name = RoleName,
                         sex = Sex, lev = Lev, fc = Fc, synth_fc = SynthFc,
                         lev_break_times = BreakTimes, looks = Looks, cup = Cup,
                         total_value = TotalValue}},
            State = #guild{name = Name, members = Members,
                           leader_name = LeaderName, leader_id = LeaderId,
                           leader_lev = LeaderLev, flag = OldFlag}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        Gr = #guild_role{} ->
            LoginTime = date:unixtime(),
            Gr1 = Gr#guild_role{pid = RolePid,
                                last_login = LoginTime, last_logout = LoginTime,
                                status = 1, fc = Fc, lev = Lev,
                                synth_fc = SynthFc,
                                lev_break_times = BreakTimes, name = RoleName,
                                sex = Sex, looks = Looks, cup = Cup,
                                total_value = TotalValue},
            {Flag, NewGr} = case guild_role:check_conversion(Gr1,
                                                             State)
                                of
                                false -> {false, Gr1};
                                {true, Gr2} -> {true, Gr2}
                            end,
            NewMembers = lists:keyreplace(RoleId,
                                          #guild_role.id,
                                          Members,
                                          NewGr),
            {NewLeaderName, NewLeaderLev, SyncFlag} = case RoleId
                                                               =:= LeaderId
                                                          of
                                                          true ->
                                                              {RoleName,
                                                               Lev,
                                                               1};
                                                          false ->
                                                              {LeaderName,
                                                               LeaderLev,
                                                               OldFlag}
                                                      end,
            guild:cast(Members, 11110, {1, NewGr}),
            State1 = State#guild{members = NewMembers,
                                 leader_name = NewLeaderName,
                                 leader_lev = NewLeaderLev, flag = SyncFlag},
            NewState = case Flag of
                           true ->
                               {NewMemNum, NewFreshNum} =
                                   guild_role:count(NewMembers),
                               State1#guild{fresh_num = NewFreshNum,
                                            mem_num = NewMemNum};
                           false -> State1
                       end,
            guild_plant:login(NewState, RoleId, RolePid),
            sync_cache(NewState),
            {noreply, NewState};
        false ->
            logger:error("角色[~w]已经不是公会[~ts]的会员，注册在线信息失败",
                         [RoleId, Name],
                         guild,
                         450),
            {noreply, State}
    end;
handle_info({offline, RoleId},
            State = #guild{name = _Name, members = Members,
                           leader_id = LeaderId, flag = OldFlag}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        Gr = #guild_role{last_login = _LastLogin}
            when is_record(Gr, guild_role) ->
            LastLogout = date:unixtime(),
            NewGr = Gr#guild_role{status = 0, pid = undefined,
                                  last_logout = LastLogout},
            NewMembers = lists:keyreplace(RoleId,
                                          #guild_role.id,
                                          Members,
                                          NewGr),
            guild:cast(Members, 11110, {1, NewGr}),
            SyncFlag = case RoleId of
                           LeaderId -> 1;
                           _ -> OldFlag
                       end,
            NewState = State#guild{members = NewMembers,
                                   flag = SyncFlag},
            sync_cache(NewState),
            {noreply, NewState};
        false ->
            logger:debug("角色[~w]已经不是公会[~ts]的会员，注销在线信息失败(也有可能是角色在线时退出了公会)",
                         [RoleId, _Name],
                         guild,
                         472),
            {noreply, State}
    end;
handle_info(reset,
            State = #guild{lev = Lev, assets = Assets,
                           members = Members, name = GuildName}) ->
    case Assets < 500000 of
        true when Lev > 1 ->
            State1 = reset_guild(State),
            State2 = guild_plant:grow(State1),
            State3 = guild_build:downgrade(State2),
            NewState = calc_guild_role(State3),
            sync_cache(NewState),
            catch sync_admin_url(NewState),
            {noreply, NewState};
        true ->
            MailInfo = #{items => [], title => lang:get("公会解散"),
                         content =>
                             notice:format(lang:get("由于~ts公会资金长期不足，现被系统自动解散，希望你在其它公会能有更好的发展！"),
                                           [{string_2, 2, GuildName}])},
            Now = date:unixtime(),
            lists:foreach(fun (#guild_role{id = Id,
                                           last_logout = Logout})
                                  when Now - Logout < 3600 * 72 ->
                                  mail:send(Id, MailInfo);
                              (_) -> ok
                          end,
                          Members),
            destory(State),
            {stop, normal, State};
        _ ->
            State1 = guild_plant:grow(State),
            State3 = reset_guild(State1),
            NewState = calc_guild_role(State3),
            sync_cache(NewState),
            catch sync_admin_url(NewState),
            {noreply, NewState}
    end;
handle_info(maintain, State = #guild{}) ->
    NewState = maintain(State),
    sync_cache(NewState),
    {noreply, NewState};
handle_info(maintain_health, State = #guild{}) ->
    NewState = guild_union:maintain_health(State),
    sync_cache(NewState),
    {noreply, NewState};
handle_info({add_medal, Num},
            State = #guild{today_used_medal = UsedMedal,
                           last_medal_used = Last}) ->
    Now = date:unixtime(),
    NewUsedMedal = case date:is_same_day(Now, Last) of
                       true -> UsedMedal + Num;
                       _ -> Num
                   end,
    NewState = State#guild{today_used_medal = NewUsedMedal,
                           last_medal_used = Now},
    sync_cache(NewState),
    {noreply, NewState};
handle_info(refresh_applys,
            State = #guild{apply_list = Applys,
                           members = Members}) ->
    NewApplyList = reset_applys(Applys),
    case NewApplyList of
        [] when length(Applys) > 0 ->
            lists:foreach(fun (#guild_role{pid = MPid, post = Post})
                                  when is_pid(MPid) andalso Post > 20 ->
                                  role:pack_send(MPid, 11123, {NewApplyList});
                              (_) -> ok
                          end,
                          Members);
        _ -> ok
    end,
    NewState = State#guild{apply_list = NewApplyList},
    sync_cache(NewState),
    {noreply, NewState};
handle_info(loop, State = #guild{flag = 1}) ->
    State1 = guild_common:usurp_done(State),
    sync(State1),
    rank_listener:handle(guild, State1, 1),
    Timeout = util:rand(120, 480) * 1000,
    erlang:send_after(Timeout, self(), loop),
    catch sync_admin_url(State1),
    logger:debug("下次同步 ~w", [Timeout], guild, 557),
    {noreply, State1#guild{flag = 0}};
handle_info(loop, State) ->
    Timeout = util:rand(120, 480) * 1000,
    erlang:send_after(Timeout, self(), loop),
    logger:debug("下次同步 ~w", [Timeout], guild, 563),
    State1 = guild_common:usurp_done(State),
    {noreply, State1};
handle_info(lev_tick, State) ->
    NewState = guild_build:lev_tick(State),
    sync_cache(NewState),
    {noreply, NewState};
handle_info(store_tick, State) ->
    NewState = guild_build:store_tick(State, check_time),
    sync_cache(NewState),
    {noreply, NewState};
handle_info(check_robber_num, State) ->
    guild_robber:check_num(State),
    {noreply, State};
handle_info(clear_robber_box, State) ->
    guild_robber:clear_box(State),
    {noreply, State};
handle_info(check_treasure_num, State) ->
    guild_treasure:check_num(State),
    {noreply, State};
handle_info(gen_treasure_unit, State) ->
    case guild_treasure:gen_units(State) of
        {ok, State1 = #guild{}} ->
            sync(State1),
            {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info(update_role,
            State = #guild{members = Members}) ->
    lists:foreach(fun (#guild_role{pid = Pid, status = 1})
                          when is_pid(Pid) ->
                          role:apply(async, Pid, {guild_role, update, [sync]}),
                          ok;
                      (_) -> skip
                  end,
                  Members),
    Timeout = util:rand(400, 600) * 1000,
    erlang:send_after(Timeout, self(), update_role),
    logger:debug("下次成员同步 ~w", [Timeout], guild, 616),
    sync_cache(State),
    {noreply, State};
handle_info(start,
            State = #guild{pid = Pid, members = Members}) ->
    spawn(fun () -> reload_role(Members, Pid) end),
    State1 = guild_plant:init(State),
    {noreply, State1};
handle_info({stop, Reason}, State) ->
    {stop, Reason, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(normal,
          State = #guild{id = GuildId, name = GuildName}) ->
    case get(flag_destory) of
        true ->
            logger:info("公会[~ts]销毁关闭", [GuildName], guild, 636),
            ignore;
        _ -> sync(State)
    end,
    catch ets:delete(guild_list, GuildId),
    ok;
terminate(shutdown,
          State = #guild{id = _GuildId, name = GuildName}) ->
    case get(flag_destory) of
        true ->
            logger:info("公会[~ts]销毁关闭", [GuildName], guild, 645),
            ignore;
        _ -> sync(State)
    end,
    ok;
terminate(_Reason, State = #guild{name = _GuildName}) ->
    logger:debug("公会【~ts】关闭, Reason:~w",
                 [_GuildName, _Reason],
                 guild,
                 651),
    case get(flag_destory) of
        true -> ignore;
        _ -> sync(State)
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

check_enter_area(#role{m_team =
                           #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("你在跟随队长中")};
check_enter_area(Role = #role{id = RoleId,
                              m_guild = #m_guild{id = GuildId}}) ->
    case role_misc:check_event_map(Role) of
        true -> check_enter_area(RoleId, GuildId);
        Else -> Else
    end.

check_enter_area(RoleId, GuildId) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok, #guild{map_id = MapId, members = Members}} ->
            case lists:keyfind(RoleId, #guild_role.id, Members) of
                #guild_role{} ->
                    case map_data:get(30001) of
                        {ok, #map_data{revive = [{X, Y} | _]}} ->
                            {true, {MapId, X, Y}};
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

get_leave_pos(#pos{last =
                       #pos_history{map = MapId, x = X, y = Y,
                                    platform = Platform, zone_id = ZoneId}}) ->
    {Platform, ZoneId, MapId, X, Y};
get_leave_pos(_) ->
    util:rand_list([{10001, 306, 3507},
                    {10001, 2583, 3848},
                    {10001, 4957, 3680},
                    {10001, 445, 2565},
                    {10001, 4646, 704},
                    {10001, 841, 1033},
                    {10001, 2098, 1834},
                    {10001, 3617, 1816}]).

init_time() ->
    self() ! loop,
    self() ! update_role,
    Ref = erlang:send_after(date:next_diff(0, 0, 5) * 1000,
                            self(),
                            reset),
    put(guild_reset_ref, Ref),
    HealthRef = erlang:send_after(date:next_diff(23, 55, 0)
                                      * 1000,
                                  self(),
                                  maintain_health),
    put(guild_health_ref, HealthRef),
    erlang:send_after(util:rand(5000, 10000),
                      self(),
                      lev_tick),
    erlang:send_after(util:rand(5000, 10000),
                      self(),
                      store_tick),
    put(guild_store_tick_ref, undefined),
    MTimeout = case erlang:time() of
                   {23, _, _} -> date:next_diff(0, 0, 3);
                   {H, _, _} -> date:next_diff(H + 1, 0, 3)
               end,
    logger:debug("下次正点维护 ~w", [MTimeout], guild, 717),
    MRef = erlang:send_after(MTimeout * 1000,
                             self(),
                             maintain),
    put(guild_maintain_ref, MRef),
    ok.

reset_guild(Guild = #guild{members = Members,
                           apply_list = Applys, week_assets = WeekAssets}) ->
    Now = date:unixtime(),
    NewMem = reset_mem(Members, Now),
    FreshNum = length([FO
                       || FO = #guild_role{post = 0} <- NewMem]),
    OnlineNum = length([O
                        || O = #guild_role{last_logout = Logout} <- NewMem,
                           Now - Logout < 3600 * 24]),
    MemNum = length(NewMem),
    Activity = round(OnlineNum / MemNum * 100),
    NewWeekAssets = case date:day_of_the_week(Now) of
                        1 -> 0;
                        _ -> WeekAssets
                    end,
    State1 = Guild#guild{members = NewMem,
                         apply_list = reset_applys(Applys), activity = Activity,
                         fresh_num = FreshNum, week_assets = NewWeekAssets,
                         flag = 1},
    OldRef = get(guild_reset_ref),
    case is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> skip
    end,
    NewRef = erlang:send_after(date:next_diff(0, 0, 5) *
                                   1000,
                               self(),
                               reset),
    put(guild_reset_ref, NewRef),
    State2 = guild_loot:reset(State1),
    guild_treasure:reset(State2).

maintain(Guild = #guild{upkeep = UpKeep,
                        health = Health, assets = Assets, members = Members,
                        lev = Lev}) ->
    logger:debug("整点维护开始", [], guild, 756),
    {Flag, NewHealth, NewAssets} = case Assets >= 500000 of
                                       true -> {false, Health, Assets - UpKeep};
                                       false ->
                                           {true,
                                            max(0, Health - 3),
                                            max(0, Assets - 20000)}
                                   end,
    State1 = Guild#guild{assets = NewAssets,
                         health = NewHealth, flag = 1},
    case Flag of
        true when Lev > 1 ->
            Msg =
                notice:format(lang:get("由于公会资金不足，仅扣除20000的基础维护费用，今天0点时如果公会资金低于500000，"
                                       "公会将自动降1级"),
                              []),
            notice(Members, Msg),
            ok;
        true ->
            Msg =
                notice:format(lang:get("由于公会资金不足仅扣除20000的基础维护费用，今天0点时如果公会资金低于500000，公"
                                       "会将自动解散"),
                              []),
            notice(Members, Msg),
            ok;
        false ->
            UpKeepMsg = notice:format(lang:get("整点维护扣除公会资金~w"),
                                      [UpKeep]),
            notice(Members, UpKeepMsg),
            ok
    end,
    NewRef = erlang:send_after(3600 * 1000,
                               self(),
                               maintain),
    put(guild_maintain_ref, NewRef),
    State1.

reset_mem(Members, Now) ->
    Members1 = kick_off_fresh(Members),
    Fun = fun (R1 = #guild_role{envelope =
                                    #guild_envelop{remain = Remain},
                                id = Id, last_login = LastLogin,
                                status = Status}) ->
                  case Remain > 0 of
                      true ->
                          MailInfo = #{items => [{90000, Remain}],
                                       title => lang:get("红包返还"),
                                       content =>
                                           notice:format(lang:get("你发出的红包剩余~ts没有被领取。"),
                                                         [{assets_1,
                                                           90000,
                                                           Remain}])},
                          mail:send(Id, MailInfo);
                      _ -> ok
                  end,
                  NewLastLogin = case Status of
                                     1 -> Now;
                                     _ -> LastLogin
                                 end,
                  R1#guild_role{envelope = #guild_envelop{},
                                last_login = NewLastLogin}
          end,
    [Fun(R) || R <- Members1].

reset_applys(Applys) ->
    reset_applys(Applys, date:unixtime()).

reset_applys([], _) -> [];
reset_applys([#guild_apply{time = Time} | T], Now)
    when Now - Time > 3600 * 24 ->
    reset_applys(T, Now);
reset_applys([A = #guild_apply{id = Id} | T], Now) ->
    case ets:lookup(guild_role_idx, Id) of
        [_] -> reset_applys(T, Now);
        _ -> [A | reset_applys(T, Now)]
    end.

do_leave(#guild{id = GuildId, name = GuildName,
                members = Members}) ->
    catch ets:delete(guild_list, GuildId),
    do_leave_member(GuildName, Members),
    ok.

do_leave_member(_GuildName, []) -> ok;
do_leave_member(GuildName,
                [#guild_role{id = RoleId = {Id, Platform, ZoneId}}
                 | T]) ->
    case role_query:pid(by_id, Id, Platform, ZoneId) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {guild_role, set, [{expel, GuildName}]});
        _ -> skip
    end,
    guild_role:del_role(RoleId),
    do_leave_member(GuildName, T).

reload_role([], _GuildPid) -> ok;
reload_role([#guild_role{id = {Id, Platform, ZoneId}}
             | T],
            GuildPid) ->
    case role_query:pid(by_id, Id, Platform, ZoneId) of
        {ok, RolePid} when is_pid(RolePid) ->
            role:apply(async,
                       RolePid,
                       {guild_role, set, [{guild_restart, GuildPid}]});
        _ -> skip
    end,
    reload_role(T, GuildPid).

sync(G = #guild{members = Members}) ->
    NewMembers = [R#guild_role{pid = undefined}
                  || R <- Members],
    catch dets:insert(guild_list,
                      G#guild{pid = undefined, members = NewMembers,
                              flag = 0}).

sync_cache(G) when is_record(G, guild) ->
    ets:insert(guild_list, G);
sync_cache(_G) -> skip.

do_cast([], _, _) -> ok;
do_cast([#guild_role{pid = Pid} | T], Cmd, Data)
    when is_pid(Pid) ->
    role:pack_send(Pid, Cmd, Data),
    do_cast(T, Cmd, Data);
do_cast([_ | T], Cmd, Data) -> do_cast(T, Cmd, Data).

do_cast([], _) -> ok;
do_cast([#guild_role{pid = Pid} | T], PackBin)
    when is_pid(Pid) ->
    role:pack_send(Pid, PackBin),
    do_cast(T, PackBin);
do_cast([_ | T], PackBin) -> do_cast(T, PackBin).

do_notice([], _Msg) -> ok;
do_notice([#guild_role{pid = Pid} | T], Msg)
    when is_pid(Pid) ->
    notice:send({pid, Pid}, 32, Msg),
    do_notice(T, Msg);
do_notice([_ | T], Msg) -> do_notice(T, Msg).

handle_apply_async_return({ok, NewState}, _Mfa, _State)
    when is_record(NewState, guild) ->
    sync_cache(NewState),
    {noreply, NewState};
handle_apply_async_return(ok, _Mfa, State) ->
    {noreply, State};
handle_apply_async_return({stop, Reason, NewState},
                          _Mfa, _State)
    when is_record(NewState, guild) ->
    {stop, Reason, NewState};
handle_apply_async_return(Else, {M, F, A}, State) ->
    logger:error("公会[~ts]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#guild.name, M, F, A, Else],
                 guild,
                 890),
    {noreply, State}.

handle_apply_sync_return({ok, Reply, NewState}, _Mfa,
                         _State)
    when is_record(NewState, guild) ->
    sync_cache(NewState),
    {reply, Reply, NewState};
handle_apply_sync_return({ok, Reply}, _Mfa, State) ->
    {reply, Reply, State};
handle_apply_sync_return({stop, Reason, NewState}, _Mfa,
                         _State)
    when is_record(NewState, guild) ->
    {stop, Reason, NewState};
handle_apply_sync_return({stop,
                          Reason,
                          Reply,
                          NewState},
                         _Mfa, _State)
    when is_record(NewState, guild) ->
    {stop, Reason, Reply, NewState};
handle_apply_sync_return(Else, {M, F, A}, State) ->
    logger:error("公会[~ts]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#guild.name, M, F, A, Else],
                 guild,
                 904),
    {reply, Else, State}.

kick_off_fresh(Members) -> kick_off_fresh(Members, []).

kick_off_fresh([], Members) -> Members;
kick_off_fresh([G = #guild_role{id = RoleId, post = 0}
                | T],
               Members) ->
    OffDay = get_offline(G),
    case OffDay > 1 of
        true ->
            guild_role:del_role(RoleId),
            kick_off_fresh(T, Members);
        false -> kick_off_fresh(T, [G | Members])
    end;
kick_off_fresh([G | T], Members) ->
    kick_off_fresh(T, [G | Members]).

get_offline(#guild_role{status = 1}) -> 0;
get_offline(#guild_role{last_logout = LastLogout,
                        status = 0}) ->
    Now = date:unixtime(),
    case Now > LastLogout andalso LastLogout =/= 0 of
        true -> date:day_diff(LastLogout, Now);
        false -> 0
    end.

calc_guild_role(State = #guild{members = []}) -> State;
calc_guild_role(State = #guild{members = Members}) ->
    Zero = date:unixtime(zero),
    FiveZero = Zero - 5 * 86400 - 1,
    State1 = #guild{members = Members1} =
                 calc_guild_role(chat_num,
                                 State,
                                 Members,
                                 #{five_zero => FiveZero},
                                 []),
    State2 = #guild{members = Members2} =
                 calc_guild_role(doing,
                                 State1,
                                 Members1,
                                 #{five_zero => FiveZero},
                                 []),
    MaxChatNum = lists:max([Val
                            || #guild_role{chat_num = Val} <- Members2]),
    MaxDoing = lists:max([Val
                          || #guild_role{doing = Val} <- Members2]),
    MaxFc = lists:max([Val
                       || #guild_role{fc = Val} <- Members2]),
    MaxSynthFc = lists:max([Val
                            || #guild_role{synth_fc = Val} <- Members2]),
    State3 = State2#guild{max_chat_num = MaxChatNum,
                          max_doing = MaxDoing, max_fc = MaxFc,
                          max_synth_fc = MaxSynthFc},
    State4 = #guild{members = Members4} =
                 calc_guild_role(active,
                                 State3,
                                 Members2,
                                 #{five_zero => FiveZero},
                                 []),
    State5 = calc_guild_role(ability,
                             State4,
                             Members4,
                             #{five_zero => FiveZero},
                             []),
    NewState = State5,
    NewState.

calc_guild_role(_, State, [], _, Members) ->
    State#guild{members = Members};
calc_guild_role(Label = chat_num, State,
                [R = #guild_role{chat_num_list = List} | T],
                Args = #{five_zero := FiveZero}, Members) ->
    NewList = [I
               || I = {MTime, _} <- List, MTime >= FiveZero],
    Value = lists:sum([Num || {_, Num} <- NewList]),
    calc_guild_role(Label,
                    State,
                    T,
                    Args,
                    [R#guild_role{chat_num_list = NewList, chat_num = Value}
                     | Members]);
calc_guild_role(Label = doing, State,
                [R = #guild_role{doing_list = List} | T],
                Args = #{five_zero := FiveZero}, Members) ->
    NewList = [I
               || I = {MTime, _} <- List, MTime >= FiveZero],
    Value = lists:sum([Num || {_, Num} <- NewList]),
    calc_guild_role(Label,
                    State,
                    T,
                    Args,
                    [R#guild_role{doing_list = NewList, doing = Value}
                     | Members]);
calc_guild_role(Label = active,
                State = #guild{max_chat_num = MaxChatNum,
                               max_doing = MaxDoing},
                [R = #guild_role{chat_num = ChatNum, doing = Doing}
                 | T],
                Args, Members) ->
    Active = util:ceil(500 * ChatNum / max(MaxChatNum, 1) +
                           500 * Doing / max(MaxDoing, 1)),
    calc_guild_role(Label,
                    State,
                    T,
                    Args,
                    [R#guild_role{active = Active} | Members]);
calc_guild_role(Label = ability,
                State = #guild{max_fc = MaxFc},
                [R = #guild_role{fc = Fc, cup = Cup} | T], Args,
                Members) ->
    Ability = util:ceil(Cup * Fc / max(MaxFc, 1) + Cup),
    calc_guild_role(Label,
                    State,
                    T,
                    Args,
                    [R#guild_role{ability = Ability} | Members]).

adm_show(#role{m_guild =
                   #m_guild{name = Name, guild_lev = GuildLev,
                            enter_time = EnterTime}}) ->
    {ok,
     [{name, Name},
      {lev, GuildLev},
      {enter_time, EnterTime}]};
adm_show(#role{}) ->
    {ok, [{name, "无"}, {lev, 0}, {enter_time, 0}]}.

sync_admin_url(_) -> ok.

