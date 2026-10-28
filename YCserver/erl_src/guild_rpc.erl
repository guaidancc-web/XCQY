-file("src/mod/guild/guild_rpc.erl", 1).

-module(guild_rpc).

-export([handle/3]).

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

-file("src/mod/guild/guild_rpc.erl", 14).

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

-file("src/mod/guild/guild_rpc.erl", 15).

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

-file("src/mod/guild/guild_rpc.erl", 16).

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

-file("src/mod/guild/guild_rpc.erl", 17).

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

-file("src/mod/guild/guild_rpc.erl", 18).

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

-file("src/mod/guild/guild_rpc.erl", 19).

handle(11100, {},
       #role{name = _Rname, m_guild = undefined}) ->
    {reply, {#guild{}, 0}};
handle(11100, {},
       R = #role{name = Rname,
                 m_guild = #m_guild{id = GuildId, post = Post}}) ->
    logger:debug("请求公会数据信息:11100", [], guild_rpc, 24),
    case guild_mgr:info(by_id, GuildId) of
        {error, guild_not_exists} ->
            {reply, {#guild{}, 0, 0}, R#role{m_guild = undefined}};
        {error, Err} ->
            logger:error("无法查询[~ts]所属的公会信息: ~w",
                         [Rname, Err],
                         guild_rpc,
                         30),
            {reply, {#guild{}, 0}};
        {ok,
         Guild = #guild{max_mem_num = MaxMemNum0,
                        max_fresh_num = MaxFreshNum0,
                        exchequer_lev = ExchequerLev}} ->
            {MaxMemNum, MaxFreshNum} = case
                                           guild_data:exchequer(ExchequerLev)
                                           of
                                           #{mem := MMemNum,
                                             fresh := MFreshNum} ->
                                               {MMemNum, MFreshNum};
                                           _ -> {MaxMemNum0, MaxFreshNum0}
                                       end,
            {reply,
             {Guild#guild{max_mem_num = MaxMemNum,
                          max_fresh_num = MaxFreshNum},
              Post}}
    end;
handle(11101, {}, #role{m_guild = undefined}) -> ok;
handle(11101, {},
       #role{name = Rname,
             m_guild =
                 #m_guild{id = GuildId, guild_lev = _GuildLev}}) ->
    case guild_mgr:info(by_id, GuildId) of
        {error, guild_not_exists} -> ok;
        {error, Err} ->
            logger:error("无法查询[~ts]所属的公会[~w]信息: ~w",
                         [Rname, GuildId, Err],
                         guild_rpc,
                         47),
            ok;
        {ok,
         #guild{members = Mems, mem_num = MemNum,
                max_mem_num = MaxMemNum0, fresh_num = FreshNum,
                max_fresh_num = MaxFreshNum0,
                exchequer_lev = ExchequerLev}} ->
            {It, Pt, Gt} = {0, 0, 0},
            {MaxMemNum, MaxFreshNum} = case
                                           guild_data:exchequer(ExchequerLev)
                                           of
                                           #{mem := MMemNum,
                                             fresh := MFreshNum} ->
                                               {MMemNum, MFreshNum};
                                           _ -> {MaxMemNum0, MaxFreshNum0}
                                       end,
            {reply,
             {Mems,
              MemNum,
              MaxMemNum,
              FreshNum,
              MaxFreshNum,
              It,
              Pt,
              Gt}}
    end;
handle(11102, {Name}, _Role) ->
    case guild_mgr:search(Name) of
        {ok, L} -> {reply, {L}};
        {false, Err} ->
            logger:error("无法查询公会列表: ~w", [Err], guild_rpc, 63),
            {reply, {[]}}
    end;
handle(11103, _, #role{cross_type = 1}) ->
    {reply, {0, lang:get("跨服状态不能创建公会哦")}};
handle(11103, {Gname, Notice},
       Role = #role{m_guild = undefined}) ->
    case util:check_name(Gname) of
        {false, Reason} -> {reply, {0, Reason}};
        ok ->
            case util:check_text(Notice, 224, lang:get("公告")) of
                {false, Reason} -> {reply, {0, Reason}};
                ok ->
                    role:send_buff_begin(),
                    case guild_mgr:create(Gname, Notice, Role) of
                        {ok, NewRole} ->
                            NRole = role_trigger:fire(#evt_guild{}, NewRole),
                            role:send_buff_flush(),
                            {reply, {1, lang:get("公会创建成功")}, NRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}}
                    end
            end
    end;
handle(11103, {_, _}, _) ->
    {reply, {0, lang:get("你已经加入了公会，无法创建新的公会")}};
handle(11104, {GuildId, Platform, ZoneId, Tag, Msg},
       Role) ->
    case guild_common:join({{GuildId, Platform, ZoneId},
                            Tag,
                            Msg},
                           Role)
        of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        ok -> ok
    end;
handle(11105, {}, Role) ->
    case guild_common:leave(Role) of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole}
    end;
handle(11106, {}, _Role) ->
    case guild_mgr:list_to_client() of
        {ok, L} -> {reply, {L}};
        {false, Err} ->
            logger:error("无法查询公会列表: ~w", [Err], guild_rpc, 116),
            {reply, {[]}}
    end;
handle(11108, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11108, {Rid, P, Z, _Post},
       #role{id = {Rid, P, Z}}) ->
    {reply, {0, lang:get("不可操作自己")}};
handle(11108, {Rid, P, Z, Post}, Role) ->
    case guild_common:appoint(Role, {Rid, P, Z}, Post) of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg} -> {reply, {1, Msg}}
    end;
handle(11109, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11109, {Rid, P, Z}, #role{id = {Rid, P, Z}}) ->
    {reply, {0, lang:get("不可操作自己")}};
handle(11109, {Rid, P, Z}, Role) ->
    role:send_buff_begin(),
    case guild_common:expel(Role, {Rid, P, Z}) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole}
    end;
handle(11111, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11111, {Type, LimitMode},
       #role{id = RoleId, pid = RolePid,
             m_guild = #m_guild{pid = GuildPid}}) ->
    logger:debug("建筑升级=======:~w",
                 [{Type, LimitMode}],
                 guild_rpc,
                 152),
    case guild_build:uplev(Type,
                           LimitMode,
                           GuildPid,
                           RoleId,
                           RolePid)
        of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg} -> {reply, {1, Msg}}
    end;
handle(11112, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11112, {Type, Mode}, Role) ->
    role:send_buff_begin(),
    case guild_build:accelerate(Role, Type, Mode) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole}
    end;
handle(11114, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11114, {Type, Content}, Role) ->
    case util:check_text(Content, 224, lang:get("宗旨")) of
        {false, Reason} -> {reply, {0, Reason, Type, ""}};
        ok ->
            case guild_common:modify_board(Role, Type, Content) of
                {false, Reason} -> {reply, {0, Reason, Type, ""}};
                {ok, _Msg} -> {reply, {1, "", Type, Content}}
            end
    end;
handle(11115, _, #role{m_guild = undefined}) -> ok;
handle(11115, {}, Role) ->
    guild_build:push(Role, 11115),
    ok;
handle(11116, _, #role{m_guild = undefined}) -> ok;
handle(11116, {Type}, Role) ->
    role:send_buff_begin(),
    case guild_build:payoff(Role, Type) of
        {ok, Msg, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, <<>>}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(11117, _, #role{m_guild = undefined}) ->
    {reply, {0, lang:get("无法操作")}};
handle(11117, {Type},
       Role = #role{m_guild = #m_guild{pid = GuildPid}}) ->
    case guild_build:destory(Type, GuildPid, Role) of
        {false, Reason} -> {reply, {0, Reason}};
        ok -> ok
    end;
handle(11118, _, #role{m_guild = undefined}) -> ok;
handle(11118, {}, Role = #role{}) ->
    L1 = guild_build:get_store(Role),
    L2 = guild_build:get_normal_goods(Role),
    logger:debug("商店信息-------------> ~w, ~w",
                 [L1, L2],
                 guild_rpc,
                 221),
    {reply, {L1, L2}};
handle(11119, _, #role{m_guild = undefined}) -> ok;
handle(11119, {Id, Num}, Role = #role{}) when Num > 0 ->
    role:send_buff_begin(),
    case guild_build:buy_store(Role, Id, Num) of
        {false, Reason, Flag} ->
            role:send_buff_clean(),
            {reply, {0, Reason, Flag}};
        {true, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("购买成功"), 0}, NewRole}
    end;
handle(11120, _, #role{m_guild = undefined}) -> ok;
handle(11120, {},
       #role{m_guild = #m_guild{pid = GuildPid}, pid = Pid}) ->
    guild_build:push({GuildPid, Pid}, 11120),
    ok;
handle(11121, {Rid, P, Z}, #role{id = {Rid, P, Z}}) ->
    ok;
handle(11121, _, #role{m_guild = undefined}) -> ok;
handle(11121, {Rid, P, Z},
       #role{id = RoleId, pid = Pid,
             m_guild = #m_guild{pid = GuildPid}}) ->
    case guild_common:transfer(GuildPid,
                               RoleId,
                               Pid,
                               {Rid, P, Z})
        of
        ok -> {reply, {1, lang:get("转让成功")}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(11122, _, #role{m_guild = undefined}) -> ok;
handle(11122, {1, _Type, _Lev},
       #role{m_guild = #m_guild{id = Gid}}) ->
    case guild_mgr:info(by_id, Gid) of
        {ok, Guild} ->
            Info = guild_common:join_info(Guild),
            {reply, Info};
        _ -> ok
    end;
handle(11122, {2, Type, Lev},
       #role{id = RoleId, pid = RolePid,
             m_guild = #m_guild{pid = GuildPid}})
    when Type =:= 1 orelse Type =:= 2 ->
    guild_common:set_condition(GuildPid,
                               {Type, Lev},
                               RoleId,
                               RolePid),
    ok;
handle(11123, _, #role{m_guild = undefined}) -> ok;
handle(11123, {},
       #role{m_guild = #m_guild{id = Gid}}) ->
    case guild_mgr:attr(Gid, #guild.apply_list) of
        ApplyList when is_list(ApplyList) ->
            {reply, {ApplyList}};
        _ -> ok
    end;
handle(11124, _, #role{m_guild = undefined}) -> ok;
handle(11124, {Rid, P, Z, Flag},
       Role = #role{m_guild = #m_guild{}})
    when Flag =:= 1 orelse Flag =:= 0 ->
    guild_common:approve({Rid, P, Z}, Flag, Role),
    ok;
handle(11125, {_Rid, _P, _Z, _},
       #role{m_guild = undefined}) ->
    ok;
handle(11125, {Rid, P, Z, Signature}, Role) ->
    ToRid = {Rid, P, Z},
    case util:check_text(Signature, 5, lang:get("个性签名")) of
        {false, Reason} -> {reply, {0, Reason, ToRid}};
        ok ->
            case guild_common:set_signature(Role, ToRid, Signature)
                of
                {ok, NewRole} ->
                    {reply, {1, lang:get("修改成功"), ToRid}, NewRole};
                ok -> {reply, {1, lang:get("修改成功"), ToRid}};
                {false, Why} -> {reply, {0, Why, ToRid}};
                _Err ->
                    logger:error("修改个性签名异常 ~w", [_Err], guild_rpc, 297),
                    {reply, {false, lang:get("无法修改"), ToRid}}
            end
    end;
handle(11126, _, #role{m_guild = undefined}) -> ok;
handle(11126, {},
       #role{m_guild = #m_guild{id = Gid}}) ->
    case guild_mgr:info(by_id, Gid) of
        {ok, #guild{event_list = EventList}} ->
            {reply, {EventList}};
        _ -> ok
    end;
handle(11127, _, #role{m_guild = undefined}) -> ok;
handle(11127, {},
       #role{id = RoleId, pid = RolePid,
             m_guild = #m_guild{pid = GuildPid}}) ->
    guild_common:clear_apply(GuildPid, RoleId, RolePid),
    ok;
handle(11128, {}, Role) ->
    case guild:enter(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("进入领地失败")}}
    end;
handle(11129, {}, Role) ->
    case guild:leave(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("进入领地失败")}}
    end;
handle(11130, {Num}, Role) ->
    case guild_common:donate(Role, Num) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Why} -> {reply, {0, Why}};
        _R ->
            logger:debug("贡献异常 ~w", [_R], guild_rpc, 346),
            {reply, {0, lang:get("贡献失败")}}
    end;
handle(11131, {Title, Num, Type, Source}, Role)
    when Source =:= 1 orelse Source =:= 2 ->
    role:send_buff_begin(),
    case guild_common:send_envelop(Role,
                                   Title,
                                   Num,
                                   Type,
                                   Source)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 3, Reason),
            ok
    end;
handle(11132, {R, P, Z}, Role) ->
    guild_common:look_envelope(Role, {R, P, Z}),
    ok;
handle(11133, {R, P, Z},
       Role = #role{id = {Rid, Plat, Zone}, name = Name}) ->
    case guild_common:grab_envelop(Role, {R, P, Z}) of
        {ok, NewRole, {TRid, TPlat, TZone}, TName} ->
            {reply,
             {Rid, Plat, Zone, Name, TRid, TPlat, TZone, TName},
             NewRole};
        {false, Reason} ->
            notice:send(Role, 3, Reason),
            ok
    end;
handle(11134, {},
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11134, {},
       R = #role{name = Rname,
                 m_guild = #m_guild{id = GuildId}}) ->
    case guild_mgr:attr(GuildId, #guild.boss) of
        Boss = #guild_boss{} -> {reply, {Boss}};
        {error, guild_not_exists} ->
            {reply, {#guild_boss{}}, R#role{m_guild = undefined}};
        {error, Err} ->
            logger:error("无法查询[~ts]所属的公会信息: ~w",
                         [Rname, Err],
                         guild_rpc,
                         390),
            {reply, {#guild_boss{}}}
    end;
handle(11135, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11135, {}, Role) ->
    case guild_boss:feed(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("喂养成功")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11137, {}, Role) ->
    Data = guild_mercenary:list(Role, all),
    {reply, {Data}};
handle(11138, {BaseId}, Role) ->
    case guild_mercenary:dispatch(Role, BaseId) of
        ok -> {reply, {1, lang:get("成功派遣佣兵")}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11139, {BaseId}, Role) ->
    case guild_mercenary:recall(Role, BaseId) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11140, {R, P, Z}, Role) ->
    case guild_role:get(Role, {R, P, Z}) of
        #guild_role{looks = Looks} -> {reply, {Looks}};
        _ -> {reply, {[]}}
    end;
handle(11141, {}, Role) ->
    Data = guild_mercenary:list(Role, mine),
    {reply, {Data}};
handle(11142, {R, P, Z, BaseId}, Role) ->
    case guild_mercenary:fetch(Role, {R, P, Z}, BaseId) of
        M = #guild_mercenary{} -> {reply, {M}};
        false ->
            notice:return(lang:get("找不到指定雇佣兵")),
            ok
    end;
handle(11143, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11143, {Name}, Role) ->
    case guild_boss:rename(Role, Name) of
        ok -> {reply, {1, lang:get("神兽成功改名了"), Name}};
        {false, Why} -> {reply, {0, Why, Name}}
    end;
handle(11144, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11144, {Totem}, Role) ->
    case guild_common:change_totem(Role, Totem) of
        ok -> {reply, {1, lang:get("图腾修改成功"), Totem}};
        {false, Why} -> {reply, {0, Why, Totem}}
    end;
handle(11145, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11145, {}, Role) ->
    case guild_common:buy_totem_chance(Role) of
        {ok, NewChance, NewRole} ->
            {reply, {1, lang:get("购买成功"), NewChance}, NewRole};
        {ok, NewRole} ->
            {reply, {0, lang:get("系统繁忙"), 0}, NewRole};
        {false, Why} -> {reply, {0, Why, 0}}
    end;
handle(11146, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11146, {}, _Role) ->
    Data = guild_spring:info(status),
    {reply, Data};
handle(11147, {},
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11147, {}, Role) ->
    guild_spring:push(Role, 11147),
    ok;
handle(11148, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11148, {Option}, Role) ->
    case guild_spring:answer(Role, Option) of
        {ok, Msg, NewRole} ->
            {reply, {2, Msg, Option}, NewRole};
        {wrong, Msg, NewRole} ->
            {reply, {1, Msg, Option}, NewRole};
        {false, Why} -> {reply, {0, Why, Option}}
    end;
handle(11149, {}, _Role) ->
    L = guild_spring:get_rank(),
    {reply, {L}};
handle(11150, {},
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11150, {}, Role) ->
    guild_spring:push(Role, 11150),
    ok;
handle(11152, _,
       #role{name = _Rname, m_guild = undefined}) ->
    ok;
handle(11152, {R, P, Z}, Role) ->
    case guild_spring:cheat_off(Role, {R, P, Z}) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {ok, Msg} -> {reply, {1, Msg}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11154, {}, _Role) ->
    Name = guild_spring:get_best_guild(),
    {reply, {Name}};
handle(11155, {}, Role) ->
    Info = guild_spring:get_pannel(Role),
    {reply, Info};
handle(11156, {BattleId, Id}, Role) ->
    Cd = guild_robber:get_box_cd(Role),
    {reply, {BattleId, Id, Cd}};
handle(11157, {},
       #role{m_guild = #m_guild{id = GuildId}}) ->
    case guild_mgr:attr(GuildId, #guild.usurpers) of
        L = [_ | _] -> {reply, {L}};
        _ -> {reply, {[]}}
    end;
handle(11157, {}, _) -> ok;
handle(11158, {}, Role) ->
    role:send_buff_begin(),
    case guild_common:usurp(Role) of
        {ok, Role1} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("自荐成功")}, Role1};
        {ok, Msg, Role1} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, Role1};
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}}
    end;
handle(11159, {R, P, Z}, Role) ->
    case guild_common:reject_usurping(Role, {R, P, Z}) of
        ok -> {reply, {1, lang:get("反对成功")}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11160, {}, Role) ->
    guild:get_chat_history(Role),
    ok;
handle(11161, {}, Role) ->
    case guild_common:apply_all(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("您的申请已经提交上去了，请静待各会长审核")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11162, {Id, Num}, Role) when Num > 0 ->
    role:send_buff_begin(),
    case guild_build:buy_normal_goods(Role, Id, Num) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("购买成功")}, NewRole}
    end;
handle(11163, {}, Role) ->
    case guild_common:propagate(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("恭喜你又为公会尽了一份力")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11164, {}, Role) ->
    case guild_common:finish_propagating(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("恭喜你又为公会尽了一份力")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11165, {X, Y}, Role) ->
    case guild_plant:sow(Role, X, Y) of
        {ok, NewRole} ->
            {reply, {0, lang:get("种花成功")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11166, {BattleId, UnitId}, Role) ->
    case guild_plant:lookup(Role, {BattleId, UnitId}) of
        P = #guild_plant{} -> {reply, {P}};
        {false, _Why} -> ok;
        _ -> ok
    end;
handle(11167, {BattleId, UnitId}, Role) ->
    case guild_plant:irrigate(Role, {BattleId, UnitId}) of
        {ok, Msg} -> {reply, {1, Msg}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11168, {Title, Content}, Role) ->
    case guild_common:send_mail(Role, Title, Content) of
        {ok, NewRole} ->
            {reply, {0, lang:get("发送成功")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11169, {}, Role) ->
    Id = guild_plant:get_unit_id(Role),
    {reply, Id};
handle(11170, {}, Role) ->
    Data = guild_union:get_applys(Role),
    {reply, {Data}};
handle(11171, {}, Role) ->
    Data = guild_union:get_applied(Role),
    {reply, {Data}};
handle(11172, {G, P, Z}, Role) ->
    case guild_union:apply_to(Role, {G, P, Z}) of
        ok -> {reply, {1, lang:get("申请成功，请等待对方会长的同意")}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11173, {G, P, Z, Decision}, Role) ->
    case guild_union:merge(Role, {G, P, Z}, Decision) of
        ok when Decision =:= 1 ->
            {reply, {1, lang:get("合并成功")}};
        ok -> {reply, {1, lang:get("你已经拒绝对方请求，建议可以联系对方会长商议")}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11174, {Type}, Role) ->
    case guild_common:exchange_donation(Role, Type) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11175, {}, Role) ->
    guild_common:push_exchangable(Role),
    ok;
handle(11177, {},
       #role{m_guild = #m_guild{id = GuildId}}) ->
    case guild_mgr:attr(GuildId, #guild.treasure) of
        D = #guild_treasure{type = win} -> {reply, {D, 1}};
        D = #guild_treasure{} -> {reply, {D, 0}};
        _ -> {reply, {#guild_treasure{}, 1}}
    end;
handle(11177, {}, _) -> ok;
handle(11178, {Time}, Role) ->
    case guild_treasure:set_time(Role, Time) of
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11179, {}, Role) ->
    case guild_treasure:open_box(Role) of
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11180, {},
       #role{m_guild = #m_guild{id = GuildId}}) ->
    case guild_mgr:attr(GuildId, #guild.loot) of
        D = #guild_loot{} -> {reply, {D}};
        _ -> {reply, {#guild_loot{}}}
    end;
handle(11180, {}, _) -> ok;
handle(11181, {L}, Role) ->
    case guild_loot:allocate(Role, L) of
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11182, {R, P, Z}, Role) ->
    case role_misc:check_cd(rpc_11182) of
        false -> ok;
        _ ->
            Times = var:get_var(Role, day, 635, 0),
            case Times >= 1 of
                true -> ok;
                _ ->
                    case guild_common:invite(Role, {R, P, Z}) of
                        ok ->
                            NewRole = var:add_var(Role, day, 635, 1, 0),
                            {reply, {1, lang:get("已向对方发起邀请")}, NewRole};
                        {false, Why} -> {reply, {0, Why}};
                        _ -> ok
                    end
            end
    end;
handle(11183, {G, P, Z, Type}, Role) ->
    logger:debug("回应邀请~w", [Type], guild_rpc, 744),
    case guild_common:reply_invitation(Role,
                                       {G, P, Z},
                                       Type)
        of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        ok when Type =:= 0 -> {reply, {1, lang:get("拒绝成功")}};
        ok -> ok
    end;
handle(11183, {}, _Role) ->
    case erlang:get(guild_invitation) of
        L when is_list(L) -> {reply, {L}};
        _ -> {reply, {[]}}
    end;
handle(11186, {Lev}, Role) ->
    case guild_common:set_formalizing_lev(Role, Lev) of
        ok ->
            {reply,
             {1,
              notice:format(lang:get("新秀转正等级成功设置为~ts级"),
                            [{string_2, 5, Lev}])}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11187, {Name}, Role) ->
    role:send_buff_begin(),
    case guild_common:rename(Role, Name) of
        {ok, NameUsed, NewRole} ->
            role:send_buff_flush(),
            {reply,
             {1,
              notice:format(lang:get("公会成功改名为~ts"),
                            [{string_2, 2, Name}]),
              Name,
              NameUsed},
             NewRole};
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why, "", ""}};
        _ ->
            role:send_buff_clean(),
            {reply, {0, lang:get("公会系统繁忙"), "", ""}}
    end;
handle(11188, {}, Role) ->
    Data = guild_robber:get_robber_info(Role),
    logger:debug("查询强盗数据:~w", [Data], guild_rpc, 788),
    {reply, Data};
handle(11189, {}, Role) ->
    case guild_build:rpc_unlock_element(Role) of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} ->
            logger:debug("解锁公会元素出错:~ts", [Reason], guild_rpc, 797),
            {reply, {0, Reason}};
        _Err ->
            logger:error(lang:get("解锁元素失败:~w"),
                         [_Err],
                         guild_rpc,
                         800),
            ok
    end;
handle(11190, {Type, UseType, CostType}, Role) ->
    case guild_role:rpc_element_pray(Role,
                                     Type,
                                     UseType,
                                     CostType)
        of
        {ok, NewRole} ->
            {reply, {1, lang:get("祈福成功")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(11191, {Type}, Role) ->
    case guild_role:rpc_save_pray(Role, Type) of
        {ok, NewRole} ->
            {reply, {1, lang:get("保存祈福成功")}, NewRole};
        {false, Reason} ->
            logger:debug("保存祈福出错:~ts", [Reason], guild_rpc, 817),
            {reply, {0, Reason}}
    end;
handle(11192, {}, Role) ->
    guild_role:push_element_info(Role),
    ok;
handle(11193, {BuildType}, Role) ->
    Cost = guild_build:rpc_query_element_cost(Role,
                                              BuildType),
    logger:debug("查询升级元素价格", [], guild_rpc, 827),
    {reply, {Cost}};
handle(11194, _Data, _Role) ->
    Data = case env:get(max_element_info) of
               MaxEmtInfo = [_ | _] -> MaxEmtInfo;
               _ -> []
           end,
    {reply, {Data}};
handle(11195, {Type}, Role) ->
    case guild_common:exchange_assets(Role, Type) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(11196, {}, Role) ->
    guild_common:push_exchangable_assets(Role),
    ok;
handle(11197, {Mode}, Role) ->
    logger:debug("请求公会数据信息:11197:~w",
                 [Mode],
                 guild_rpc,
                 852),
    case guild_build:rpc_change_accelerate_limit_mod(Role,
                                                     Mode)
        of
        ok -> {reply, {1, lang:get("已成功取消额度限制{face_1, 7}")}};
        {false, Reason} -> {reply, {0, Reason}};
        _Err ->
            logger:error(lang:get("取消公会加速限制额度错误:~w"),
                         [_Err],
                         guild_rpc,
                         859),
            ok
    end;
handle(11198, {}, Role) ->
    guild_build:push_11198(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [guild_rpc, _Cmd, _Data],
                 guild_rpc,
                 869),
    {error, unknow_command}.

