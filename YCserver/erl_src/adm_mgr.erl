-file("src/mod/adm/adm_mgr.erl", 1).

-module(adm_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         submit_report/6,
         handle_report/7,
         call/1,
         prohibit_device/0,
         prohibit_device/2,
         query_auth_cfg_info/1,
         load_authsfz_cfg/0,
         reload_role_charge_cfg/0]).

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

-file("src/mod/adm/adm_mgr.erl", 23).

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

-file("src/mod/adm/adm_mgr.erl", 24).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/mod/adm/adm_mgr.erl", 25).

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

-file("src/mod/adm/adm_mgr.erl", 26).

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

-file("src/mod/adm/adm_mgr.erl", 27).

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

-file("src/mod/adm/adm_mgr.erl", 28).

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

-file("src/mod/adm/adm_mgr.erl", 29).

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

-file("src/mod/adm/adm_mgr.erl", 30).

-file("inc/log.hrl", 1).

-file("src/mod/adm/adm_mgr.erl", 31).

-record(state, {churn_rate = [], instructor = []}).

call(Info) ->
    case catch gen_server:call(adm_mgr, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

prohibit_device() ->
    prohibit_device("42c1175687c01d3c752d4c02799db774", 2).

prohibit_device(DeviceId, Type) ->
    gen_server:cast(adm_mgr,
                    {handle_prohibit_device, DeviceId, Type}).

-spec start_link() -> {ok, pid()} |
                      ignore |
                      {error, term()}.

start_link() ->
    gen_server:start_link({local, adm_mgr},
                          adm_mgr,
                          [],
                          []).

submit_report(Role = #role{id = RoleId, name = RoleName,
                           lev = RoleLev},
              ReportId = {_RId, ReportPlat, ReportZoneId}, Reason,
              Msg, Type, Flag) ->
    Now = date:unixtime(),
    AdmReport = #adm_report{id = RoleId, name = RoleName,
                            lev = RoleLev, time = Now, type = Type,
                            reason = Reason, msg = Msg, flag = Flag},
    case cross:call(ReportPlat,
                    ReportZoneId,
                    adm_mgr,
                    call,
                    [{submit_report, ReportId, Now, AdmReport}])
        of
        {true, 1, Args} ->
            BackMsg =
                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
            notice:pop(Role, 2, BackMsg),
            Loss = [#loss{label = energy, val = 10}],
            Role1 = case role_gain:do_notice(Loss,
                                             Role,
                                             lang:get("感谢您，提交举报"))
                        of
                        {ok, NewRole} -> NewRole;
                        _ -> Role
                    end,
            catch do_post_3k(Role1,
                             ReportId,
                             Args,
                             Type,
                             Reason,
                             Msg,
                             Flag),
            {true, Role1};
        {true, 0, Args} ->
            BackMsg =
                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
            notice:pop(Role, 2, BackMsg),
            catch do_post_3k(Role,
                             ReportId,
                             Args,
                             Type,
                             Reason,
                             Msg,
                             Flag),
            {true, Role};
        {false, FailReason} -> {false, FailReason};
        {error, center_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")};
        _ -> {false, lang:get("系统繁忙，请稍后尝试")}
    end.

handle_report(Rid, Plat, Zone, HandleState, Time, Items,
              IsCast)
    when is_integer(Rid) andalso
             is_list(Plat) andalso
                 is_integer(Zone) andalso
                     HandleState >= 1 andalso
                         HandleState =< 4 andalso
                             IsCast >= 0 andalso
                                 IsCast =< 1 andalso Time >= 0 ->
    case check_item(Items) of
        {true, NewItems} ->
            logger:info("后台处理举报HandleState:~w, Time:~w, Items:~w, "
                        "NewItems:~w, IsCast:~w",
                        [HandleState, Time, Items, NewItems, IsCast],
                        adm_mgr,
                        99),
            gen_server:cast(adm_mgr,
                            {handle_report,
                             {Rid, Plat, Zone},
                             HandleState,
                             Time,
                             NewItems,
                             IsCast});
        false ->
            logger:error("后台举报道具错误:~w", [Items], adm_mgr, 102),
            false
    end;
handle_report(Rid, Plat, Zone, HandleState, Time, Items,
              IsCast) ->
    logger:error("后台举报发放错误参数:~w,~w,~w,~w,~w",
                 [{Rid, Plat, Zone}, HandleState, Time, Items, IsCast],
                 adm_mgr,
                 107),
    false.

check_item(Items) -> check_item(Items, []).

check_item([], Items) -> {true, Items};
check_item([{ItemId, Bind, Num} | T], Items)
    when Num > 0 ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ ->
            logger:error("举报发放不存在的奖励:~w", [ItemId], adm_mgr, 118),
            check_item(T, Items)
    end;
check_item([_Err | _T], _Items) -> false.

query_auth_cfg_info(PlatChannel) ->
    catch ets:lookup(adm_authsfz_cfg, PlatChannel).

set_adm_authsfz_cfg(Data) when is_list(Data) ->
    Plat = env:get(platform),
    case lists:keyfind(Plat, #auth_sfz_cfg.platform, Data)
        of
        Cfg = #auth_sfz_cfg{} ->
            role_group:pack_send(world, 10035, {[Cfg]});
        _ -> ok
    end,
    adm_mgr ! {update_auth_sfz_cfg, Data},
    true;
set_adm_authsfz_cfg(_Data) ->
    {false, lang:get("传入参数不正确")}.

init([]) ->
    process_flag(trap_exit, true),
    logger:info("[~w] 正在启动...", [adm_mgr], adm_mgr, 147),
    self() ! online_state,
    ets:new(ets_adm_report,
            [set,
             named_table,
             public,
             {keypos, #adm_report_info.id}]),
    dets:open_file(ets_adm_device,
                   [{file, "./dets/adm_device.dets"},
                    {keypos, #adm_device_info.id}]),
    ets:new(ets_adm_device,
            [set,
             named_table,
             public,
             {keypos, #adm_device_info.id}]),
    dets:to_ets(ets_adm_device, ets_adm_device),
    erlang:send_after(util:rand(4000, 10000),
                      self(),
                      load_report),
    ets:new(adm_authsfz_cfg,
            [set,
             named_table,
             public,
             {keypos, #auth_sfz_cfg.plat_channel}]),
    reload_cfg(),
    ets:new(role_charge_cfg,
            [set,
             named_table,
             public,
             {keypos, #role_charge_cfg.id}]),
    reload_role_charge_cfg(),
    dets:open_file(ets_camp_inquiry,
                   [{file, "./dets/ets_camp_inquiry.dets"}, {keypos, 1}]),
    ets:new(ets_camp_inquiry,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(ets_camp_inquiry, ets_camp_inquiry),
    State = #state{},
    logger:info("[~w] 启动完成...", [adm_mgr], adm_mgr, 173),
    {ok, State}.

handle_call({submit_report,
             ReportId,
             Now,
             AdmReport = #adm_report{id = SubmitId, type = Type,
                                     msg = Msg, flag = ReportFlag}},
            _From, State) ->
    Reply = case find_report(ReportId) of
                {true,
                 AdmReportInfo = #adm_report_info{report = Report,
                                                  lev = Lev}} ->
                    Len = length(Report),
                    Flag = case lists:keymember(3, #adm_report.type, Report)
                               of
                               false -> 0;
                               _ -> 1
                           end,
                    logger:debug("_____________________________________~w",
                                 [Flag],
                                 adm_mgr,
                                 184),
                    case Len >= 5 of
                        true -> {false, lang:get("对方已经被多人举报，无需再举报")};
                        false ->
                            case lists:keymember(SubmitId,
                                                 #adm_report.id,
                                                 Report)
                                of
                                true -> {false, lang:get("你已经举报过对方，请耐心等待处理")};
                                false ->
                                    case do_query(ReportId, Type, ReportFlag) of
                                        {true, Args = #{name := ReportName}} ->
                                            NMsg = ["\n" ++
                                                        "[" ++
                                                            Title ++
                                                                "]" ++
                                                                    ReportName
                                                                        ++
                                                                        "：" ++
                                                                            Content
                                                    || {Title, Content, _}
                                                           <- Msg],
                                            NewAdmReport =
                                                AdmReport#adm_report{msg = NMsg,
                                                                     order =
                                                                         Len +
                                                                             1},
                                            NewAdmReportInfo =
                                                AdmReportInfo#adm_report_info{report
                                                                                  =
                                                                                  [NewAdmReport
                                                                                   | Report]},
                                            case update_report(NewAdmReportInfo,
                                                               {update,
                                                                Len + 1,
                                                                AdmReport#adm_report{msg
                                                                                         =
                                                                                         NMsg}})
                                                of
                                                true ->
                                                    case Type =:= 3 andalso
                                                             Flag =:= 1 andalso
                                                                 Lev < 50
                                                        of
                                                        true ->
                                                            auto_handle_report3(NewAdmReportInfo),
                                                            {true, 0, Args};
                                                        _ ->
                                                            check_auto_handle_repot(NewAdmReportInfo),
                                                            {true, 0, Args}
                                                    end;
                                                false ->
                                                    {false,
                                                     lang:get("系统繁忙，请稍后再试")}
                                            end;
                                        {false, Reason} -> {false, Reason}
                                    end
                            end
                    end;
                null ->
                    case do_query(ReportId, Type, ReportFlag) of
                        {true,
                         Args = #{status := Status, name := ReportName,
                                  lev := ReportLev,
                                  classes := ReportClasses}} ->
                            case Status =:= 1 of
                                true when (Type =:= 3) and (ReportLev < 50) ->
                                    adm:advert([ReportId],
                                               600,
                                               1,
                                               lang:get("举报"),
                                               "admin"),
                                    {true, 1, Args};
                                true -> {false, lang:get("对方已经禁言，无需举报")};
                                _ when Status =:= 0 ->
                                    NMsg = ["\n" ++
                                                "[" ++
                                                    Title ++
                                                        "]" ++
                                                            ReportName ++
                                                                "：" ++ Content
                                            || {Title, Content, _} <- Msg],
                                    AdmReportInfo = #adm_report_info{id =
                                                                         ReportId,
                                                                     time = Now,
                                                                     classes =
                                                                         ReportClasses,
                                                                     lev =
                                                                         ReportLev,
                                                                     name =
                                                                         ReportName,
                                                                     report =
                                                                         [AdmReport#adm_report{msg
                                                                                                   =
                                                                                                   NMsg,
                                                                                               order
                                                                                                   =
                                                                                                   1}]},
                                    case update_report(AdmReportInfo,
                                                       {create,
                                                        AdmReport#adm_report{msg
                                                                                 =
                                                                                 NMsg}})
                                        of
                                        true ->
                                            ets_update_report(AdmReportInfo),
                                            {true, 1, Args};
                                        false -> {false, lang:get("系统繁忙，请稍后再试")}
                                    end;
                                _ ->
                                    logger:error("未处理到的状态：~w",
                                                 [Status],
                                                 adm_mgr,
                                                 237),
                                    {false, lang:get("举报异常，请联系gm")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("系统繁忙，请稍后提交")}
            end,
    {reply, Reply, State};
handle_call({check_report, ReportId, SubmitId}, _From,
            State) ->
    R1 = case find_report(ReportId) of
             {true, #adm_report_info{report = Report}} ->
                 Len = length(Report),
                 case Len >= 5 of
                     true -> {false, lang:get("对方已经被多人举报，无需再举报")};
                     false ->
                         case lists:keymember(SubmitId, #adm_report.id, Report)
                             of
                             true -> {false, lang:get("你已经举报过对方，请耐心等待处理")};
                             _ -> ok
                         end
                 end;
             _ -> ok
         end,
    Reply = case R1 of
                ok ->
                    case role_query:attr(by_id,
                                         ReportId,
                                         [#role.lock_status])
                        of
                        {ok, [2]} -> {false, lang:get("对方已经封号，无需举报")};
                        {ok, [3]} -> {false, lang:get("对方已经封号，无需举报")};
                        {ok, [4]} -> {false, lang:get("对方已经禁言，无需举报")};
                        {ok, [_]} -> {true, ok};
                        _ -> {false, lang:get("对方似乎不在线，无需举报")}
                    end;
                {false, Reason} -> {false, Reason}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({handle_report,
             RoleId,
             HandleState,
             Time,
             Items,
             IsCast},
            State) ->
    case find_report(RoleId) of
        {true, AdmReportInfo = #adm_report_info{}} ->
            case do_handle_report(AdmReportInfo, HandleState, Time)
                of
                ok ->
                    save_report(RoleId, HandleState, Time, Items),
                    del_report(AdmReportInfo),
                    reward_report(AdmReportInfo,
                                  HandleState,
                                  Items,
                                  IsCast),
                    ok;
                {false, Reason} ->
                    logger:error("处理举报操作时出错:~w", [Reason], adm_mgr, 302),
                    ok
            end,
            {noreply, State};
        null ->
            save_report(RoleId, HandleState, Time, []),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast({handle_device_check, DeviceId, RoleId},
            State) ->
    logger:debug("登陆时检查设备是否被封,设备号:~w",
                 [DeviceId],
                 adm_mgr,
                 314),
    case find_device(DeviceId) of
        {true, #adm_device_info{type = Type}} ->
            logger:debug("设备被封禁，进行角色封号处理,角色号:~w",
                         [RoleId],
                         adm_mgr,
                         317),
            do_prohibit_device(RoleId, Type),
            {noreply, State};
        null -> {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast({handle_prohibit_device, DeviceId, Type},
            State) ->
    case find_device(DeviceId) of
        {true, #adm_device_info{}} -> {noreply, State};
        null ->
            AdmDeviceInfo = #adm_device_info{id = DeviceId,
                                             type = Type},
            update_prohibit_device(insert, AdmDeviceInfo),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast({handle_remove_device, DeviceId}, State) ->
    case find_device(DeviceId) of
        {true, #adm_device_info{}} ->
            update_prohibit_device(delete, DeviceId),
            {noreply, State};
        null -> {noreply, State};
        _ -> {noreply, State}
    end;
handle_cast({update_camp_clue_answer, ClueId, Answer},
            State) ->
    case get_camp_clue(ClueId) of
        {ok, {ClueId, AnswerInfo}} ->
            case lists:keyfind(Answer, 1, AnswerInfo) of
                {Answer, Count} ->
                    NewAnswerInfo = lists:keystore(Answer,
                                                   1,
                                                   AnswerInfo,
                                                   {Answer, Count + 1}),
                    catch update_camp_clue({ClueId, NewAnswerInfo});
                _ ->
                    NewAnswerInfo = [{Answer, 1} | AnswerInfo],
                    catch update_camp_clue({ClueId, NewAnswerInfo})
            end;
        _ -> catch update_camp_clue({ClueId, [{Answer, 1}]})
    end,
    {noreply, State};
handle_cast({role_get_inquiry_result, RolePid, ClueId},
            State) ->
    case get_camp_clue(ClueId) of
        {ok, {ClueId, AnswerInfo}} ->
            role:pack_send(RolePid, 20602, {ClueId, AnswerInfo});
        _ -> ok
    end,
    {noreply, State};
handle_cast(_Msg, State) ->
    logger:error("收到未知消息:~w", [_Msg], adm_mgr, 379),
    {noreply, State}.

handle_info(online_state, State) ->
    erlang:send_after(60 * 1000, self(), online_state),
    calc_online_num(),
    {noreply, State};
handle_info(load_report, State) ->
    Sql = "select id, platform, zone_id, time, "
          "classes, lev, name, id_1, platform_1, "
          "zone_id_1, name_1, lev_1, time_1, type_1, "
          "reason_1, msg_1, id_2, platform_2, zone_id_2, "
          "name_2, lev_2, time_2, type_2, reason_2, "
          "msg_2, id_3, platform_3, zone_id_3, "
          "name_3, lev_3, time_3, type_3, reason_3, "
          "msg_3, id_4, platform_4, zone_id_4, "
          "name_4, lev_4, time_4, type_4, reason_4, "
          "msg_4, id_5, platform_5, zone_id_5, "
          "name_5, lev_5, time_5, type_5, reason_5, "
          "msg_5 from sys_report where state = "
          "?",
    case db:get_all(Sql, [0]) of
        {ok, L} -> do_load_report(L);
        {error, _Err} ->
            logger:error("加载举报数时发生错误:~w", [_Err], adm_mgr, 394)
    end,
    {noreply, State};
handle_info({close_authsfz, PlatChannel}, State) ->
    logger:debug("关闭防沉迷", [], adm_mgr, 399),
    case query_auth_cfg_info(PlatChannel) of
        [Cfg = #auth_sfz_cfg{}] ->
            NewCfg = Cfg#auth_sfz_cfg{can_charge = 1, is_nonage = 0,
                                      is_wallow = 0, is_show_phone = 0,
                                      is_mail = 0, is_mid_exp = 0},
            set_adm_authsfz_cfg([NewCfg]);
        _ -> ok
    end,
    {noreply, State};
handle_info({open_authsfz,
             RoleId = {_, Plat, _},
             ChannelReg,
             Type,
             Val},
            State) ->
    case query_auth_cfg_info({Plat, ChannelReg}) of
        [Cfg = #auth_sfz_cfg{}] ->
            NewCfg = case Type of
                         0 ->
                             Msg = lang:get("开启防沉迷所有选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{can_charge = 0, is_nonage = 1,
                                              is_wallow = 1, is_show_phone = 1,
                                              is_mail = 1, is_mid_exp = 1,
                                              is_lev_60 = 0, is_need_check = 1};
                         1 ->
                             Msg = lang:get("开启强制下线选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_wallow = Val};
                         2 ->
                             Msg = lang:get("开启收益减半选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_mid_exp = Val};
                         3 ->
                             Msg = lang:get("开启未认证充值限制选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{can_charge = Val};
                         4 ->
                             Msg = lang:get("开启未成年充值额度限制选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_nonage = Val};
                         5 ->
                             Msg = lang:get("开启开启显示联系方式选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_show_phone = Val};
                         6 ->
                             Msg = lang:get("开启充值邮件发送选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_mail = Val};
                         7 ->
                             Msg = lang:get("开启充值邮件发送选项"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_mail = Val};
                         8 ->
                             Msg = lang:get("开启防沉迷UI"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{is_need_check = Val};
                         9 ->
                             Msg = lang:get("设定沉迷时间"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{down_sec = Val};
                         10 ->
                             Msg = lang:get("设定未成年充值额度"),
                             notice:send(RoleId, 1, Msg),
                             Cfg#auth_sfz_cfg{charge_limit = Val}
                     end,
            role_group:pack_send(world, 10035, {[NewCfg]}),
            update_auth_sfz_cfg(NewCfg);
        _ -> ok
    end,
    {noreply, State};
handle_info({update_auth_sfz_cfg, Data}, State) ->
    update_auth_sfz_cfg(Data),
    {noreply, State};
handle_info({update_role_charge_cfg, Data}, State) ->
    update_role_charge_cfg(Data),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, #state{churn_rate = ChurnRate}) ->
    logger:info("[~w] 正在关闭...", [adm_mgr], adm_mgr, 479),
    case ChurnRate of
        [] -> skip;
        _ -> env:save(adm_churn_rate, ChurnRate)
    end,
    logger:info("[~w] 关闭完成", [adm_mgr], adm_mgr, 484),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_load_report([]) -> ok;
do_load_report(Report) -> do_load_report(Report, []).

do_load_report([], []) -> ok;
do_load_report([], Report) ->
    Report1 = lists:keysort(#adm_report_info.time, Report),
    lists:foreach(fun (AdmReportInfo) ->
                          ets_update_report(AdmReportInfo)
                  end,
                  Report1),
    ok;
do_load_report([[Id,
                 P,
                 Z,
                 Time,
                 Classes,
                 Lev,
                 Name,
                 Id1,
                 P1,
                 Z1,
                 Name1,
                 Lev1,
                 Time1,
                 Type1,
                 _Reason1,
                 _Msg1,
                 Id2,
                 P2,
                 Z2,
                 Name2,
                 Lev2,
                 Time2,
                 Type2,
                 _Reason2,
                 _Msg2,
                 Id3,
                 P3,
                 Z3,
                 Name3,
                 Lev3,
                 Time3,
                 Type3,
                 _Reason3,
                 _Msg3,
                 Id4,
                 P4,
                 Z4,
                 Name4,
                 Lev4,
                 Time4,
                 Type4,
                 _Reason4,
                 _Msg4,
                 Id5,
                 P5,
                 Z5,
                 Name5,
                 Lev5,
                 Time5,
                 Type5,
                 _Reason5,
                 _Msg5]
                | T],
               Report) ->
    RList1 = case Id1 =/= 0 of
                 true ->
                     [#adm_report{id = {Id1, P1, Z1}, order = 1,
                                  name = Name1, lev = Lev1, time = Time1,
                                  reason = "", type = Type1}];
                 false -> []
             end,
    RList2 = case Id2 =/= 0 of
                 true ->
                     [#adm_report{id = {Id2, P2, Z2}, order = 2,
                                  name = Name2, lev = Lev2, time = Time2,
                                  reason = "", type = Type2}];
                 false -> []
             end,
    RList3 = case Id3 =/= 0 of
                 true ->
                     [#adm_report{id = {Id3, P3, Z3}, order = 3,
                                  name = Name3, lev = Lev3, time = Time3,
                                  reason = "", type = Type3}];
                 false -> []
             end,
    RList4 = case Id4 =/= 0 of
                 true ->
                     [#adm_report{id = {Id4, P4, Z4}, order = 4,
                                  name = Name4, lev = Lev4, time = Time4,
                                  reason = "", type = Type4}];
                 false -> []
             end,
    RList5 = case Id5 =/= 0 of
                 true ->
                     [#adm_report{id = {Id5, P5, Z5}, order = 5,
                                  name = Name5, lev = Lev5, time = Time5,
                                  reason = "", type = Type5}];
                 false -> []
             end,
    RList = RList1 ++ RList2 ++ RList3 ++ RList4 ++ RList5,
    R = #adm_report_info{id = {Id, P, Z}, time = Time,
                         classes = Classes, lev = Lev, name = Name,
                         report = RList},
    do_load_report(T, [R | Report]);
do_load_report([_ | T], Report) ->
    do_load_report(T, Report).

reward_report(#adm_report_info{name = Name,
                               report = Report,
                               id = ReportId = {_, ReportPlat, ReportZoneId}},
              State, Items, IsCast) ->
    case lists:keysort(#adm_report.order, Report) of
        [#adm_report{id = RoleId} | _] ->
            Title = lang:get("举报反馈"),
            Content = case State of
                          3 ->
                              notice:format(lang:get("你对~ts的举报信息经查核无效。建议详细描述举报原因并附加准确的举报证据"),
                                            [{role_2, Name}]);
                          _ ->
                              notice:format(lang:get("你对~ts的举报信息经查核有效。我们已为其准备好小黑屋。 感谢您对维护游戏秩序做出的贡献，"
                                                     "希望我们能一同努力，让游戏保持和谐健康！"),
                                            [{role_2, Name}])
                      end,
            case IsCast =:= 1 andalso State =/= 3 of
                true ->
                    CastMsg = case Items of
                                  [_ | _] ->
                                      notice:format(lang:get("一位热心的玩家举报了~ts发布的不良信息，维护了游戏环境，获得了~ts的奖励"),
                                                    [{role_2, Name},
                                                     {item_2, Items}]);
                                  _ ->
                                      notice:format(lang:get("一位热心的玩家举报了~ts发布的不良信息，维护了游戏环境"),
                                                    [{role_2, Name}])
                              end,
                    case role_misc:is_local_role(ReportId) of
                        true -> notice:cast(all, 7, CastMsg);
                        _ ->
                            notice:cast(all, 7, CastMsg),
                            cross:cast(ReportPlat,
                                       ReportZoneId,
                                       {notice, cast, [all, 7, CastMsg]})
                    end;
                false -> skip
            end,
            mail:send(RoleId,
                      #{title => Title, content => Content, items => Items}),
            ok;
        _ -> skip
    end.

save_report({Rid, Plat, ZoneId}, State, Time, Items) ->
    Sql = "update sys_report set state = ?, ctime "
          "= ?, items = ? where id = ? and platform "
          "= ? and zone_id = ?",
    ItemStr = do_item_string(Items, ""),
    case db:exec(Sql,
                 [State, Time, ItemStr, Rid, Plat, ZoneId])
        of
        ok -> ok;
        {error, Reason} ->
            logger:error("更新举报数据库时失败~w", [Reason], adm_mgr, 581),
            {false, Reason}
    end.

do_item_string([], Str) -> Str;
do_item_string([{ItemId, Bind, Num} | T], Str) ->
    NewStr = util:flist("{~w,~w,~w},~ts",
                        [ItemId, Bind, Num, Str]),
    do_item_string(T, NewStr);
do_item_string([_ | T], Str) -> do_item_string(T, Str).

do_handle_report(_AdmReportInfo, 3, _Time) -> ok;
do_handle_report(#adm_report_info{id = RoleId,
                                  lev = Lev},
                 1, Time) ->
    Hide = case Lev < 50 of
               true -> 1;
               _ -> 0
           end,
    adm:silent([RoleId],
               Time,
               Hide,
               lang:get("举报"),
               "admin");
do_handle_report(#adm_report_info{id = RoleId,
                                  lev = Lev},
                 4, Time) ->
    Hide = case Lev < 50 of
               true -> 1;
               _ -> 0
           end,
    adm:advert([RoleId],
               Time,
               Hide,
               lang:get("举报"),
               "admin");
do_handle_report(#adm_report_info{id = RoleId}, 2,
                 Time) ->
    adm:lock([RoleId], Time, lang:get("举报"), "admin").

find_report(ReportId) ->
    case catch ets:lookup(ets_adm_report, ReportId) of
        [Report = #adm_report_info{}] -> {true, Report};
        [] -> null;
        _Err ->
            logger:error("查询举报表失败:~w", [_Err], adm_mgr, 617),
            false
    end.

del_report(#adm_report_info{id = ReportId}) ->
    ets:delete(ets_adm_report, ReportId),
    ok.

ets_update_report(AdmReportInfo = #adm_report_info{}) ->
    ets:insert(ets_adm_report, AdmReportInfo),
    ok;
ets_update_report(_) -> ok.

check_auto_handle_repot(AdmReportInfo =
                            #adm_report_info{lev = Lev, report = Report})
    when Lev =< 60 ->
    Boardreport = [R
                   || R = #adm_report{flag = 1} <- Report],
    Len = length(Boardreport),
    case Len >= 2 of
        true -> auto_handle_report2(AdmReportInfo);
        false -> ok
    end,
    case length(Report) >= 2 of
        true when Lev >= 20 andalso Lev < 50 ->
            auto_handle_report(AdmReportInfo);
        _ -> ets_update_report(AdmReportInfo)
    end;
check_auto_handle_repot(AdmReportInfo) ->
    ets_update_report(AdmReportInfo),
    ok.

auto_handle_report(AdmReportInfo = #adm_report_info{id =
                                                        RoleId}) ->
    HandleState = 1,
    Time = 600,
    IsCast = 1,
    Items = [{90000, 0, 46800}],
    case do_handle_report(AdmReportInfo, HandleState, Time)
        of
        ok ->
            save_report(RoleId, HandleState, Time, Items),
            del_report(AdmReportInfo),
            reward_report(AdmReportInfo,
                          HandleState,
                          Items,
                          IsCast),
            ok;
        {false, Reason} ->
            logger:error("自动处理举报操作时出错:~w", [Reason], adm_mgr, 682),
            ok
    end.

auto_handle_report2(AdmReportInfo = #adm_report_info{id
                                                         = RoleId}) ->
    HandleState = 1,
    Time = 259200,
    IsCast = 1,
    Items = [{90000, 0, 46800}],
    case do_handle_report(AdmReportInfo, HandleState, Time)
        of
        ok ->
            save_report(RoleId, HandleState, Time, Items),
            del_report(AdmReportInfo),
            reward_report(AdmReportInfo,
                          HandleState,
                          Items,
                          IsCast),
            friend_zone:del_all_trends(RoleId),
            ok;
        {false, Reason} ->
            logger:error("自动处理举报操作时出错:~w", [Reason], adm_mgr, 702),
            ok
    end.

auto_handle_report3(AdmReportInfo = #adm_report_info{id
                                                         = RoleId}) ->
    HandleState = 4,
    Time = 600,
    IsCast = 1,
    Items = [{90000, 0, 46800}],
    case do_handle_report(AdmReportInfo, HandleState, Time)
        of
        ok ->
            save_report(RoleId, HandleState, Time, Items),
            del_report(AdmReportInfo),
            reward_report(AdmReportInfo,
                          HandleState,
                          Items,
                          IsCast),
            ok;
        {false, Reason} ->
            logger:error("自动处理举报操作时出错:~w", [Reason], adm_mgr, 720),
            ok
    end.

update_report(#adm_report_info{id = {Rid, P, Z},
                               time = Time, classes = Classes, lev = Lev,
                               name = Name},
              Mode) ->
    Result = case Mode of
                 {create,
                  #adm_report{id = {Rid1, P1, Z1}, name = Name1,
                              lev = Lev1, time = Time1, type = Type1,
                              reason = Reason1, msg = Msg1}} ->
                     {"insert into sys_report(id, platform, "
                      "zone_id, time, classes, lev, name, id_1, "
                      "platform_1, zone_id_1, name_1, lev_1, "
                      "time_1, type_1, reason_1, msg_1) values(?, "
                      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_1 "
                      "= ?, platform_1 = ?, zone_id_1 = ?, "
                      "name_1 = ?, lev_1 = ?, time_1 = ?, type_1 "
                      "= ?, reason_1 = ?, msg_1 = ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Classes,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1]};
                 {update,
                  2,
                  #adm_report{id = {Rid1, P1, Z1}, name = Name1,
                              lev = Lev1, time = Time1, type = Type1,
                              reason = Reason1, msg = Msg1}} ->
                     {"insert into sys_report(id, platform, "
                      "zone_id, time, classes, lev, name, id_2, "
                      "platform_2, zone_id_2, name_2, lev_2, "
                      "time_2, type_2, reason_2, msg_2) values(?, "
                      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_2 "
                      "= ?, platform_2 = ?, zone_id_2 = ?, "
                      "name_2 = ?, lev_2 = ?, time_2 = ?, type_2 "
                      "= ?, reason_2 = ?, msg_2 = ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Classes,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1]};
                 {update,
                  3,
                  #adm_report{id = {Rid1, P1, Z1}, name = Name1,
                              lev = Lev1, time = Time1, type = Type1,
                              reason = Reason1, msg = Msg1}} ->
                     {"insert into sys_report(id, platform, "
                      "zone_id, time, classes, lev, name, id_3, "
                      "platform_3, zone_id_3, name_3, lev_3, "
                      "time_3, type_3, reason_3, msg_3) values(?, "
                      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_3 "
                      "= ?, platform_3 = ?, zone_id_3 = ?, "
                      "name_3 = ?, lev_3 = ?, time_3 = ?, type_3 "
                      "= ?, reason_3 = ?, msg_3 = ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Classes,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1]};
                 {update,
                  4,
                  #adm_report{id = {Rid1, P1, Z1}, name = Name1,
                              lev = Lev1, time = Time1, type = Type1,
                              reason = Reason1, msg = Msg1}} ->
                     {"insert into sys_report(id, platform, "
                      "zone_id, time, classes, lev, name, id_4, "
                      "platform_4, zone_id_4, name_4, lev_4, "
                      "time_4, type_4, reason_4, msg_4) values(?, "
                      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_4 "
                      "= ?, platform_4 = ?, zone_id_4 = ?, "
                      "name_4 = ?, lev_4 = ?, time_4 = ?, type_4 "
                      "= ?, reason_4 = ?, msg_4 = ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Classes,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1]};
                 {update,
                  _,
                  #adm_report{id = {Rid1, P1, Z1}, name = Name1,
                              lev = Lev1, time = Time1, type = Type1,
                              reason = Reason1, msg = Msg1}} ->
                     {"insert into sys_report(id, platform, "
                      "zone_id, time, classes, lev, name, id_5, "
                      "platform_5, zone_id_5, name_5, lev_5, "
                      "time_5, type_5, reason_5, msg_5) values(?, "
                      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_5 "
                      "= ?, platform_5 = ?, zone_id_5 = ?, "
                      "name_5 = ?, lev_5 = ?, time_5 = ?, type_5 "
                      "= ?, reason_5 = ?, msg_5 = ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Classes,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       Type1,
                       Reason1,
                       Msg1]};
                 _Err ->
                     logger:error("未知的举报参数:~w", [_Err], adm_mgr, 752),
                     false
             end,
    case Result of
        {Sql, Args} ->
            case db:exec(Sql, Args) of
                ok -> true;
                _Other ->
                    logger:error("提交举报入库失败:~w, Sql语句:~w, 参数:~w",
                                 [_Other, Sql, Args],
                                 adm_mgr,
                                 760),
                    false
            end;
        _ -> false
    end.

calc_online_num() ->
    Time = date:unixtime(),
    Onlines = acc_online_num(ets:tab2list(role_cache), []),
    log:onlines(Onlines),
    adm_db:save_online_num(Time, Onlines).

acc_online_num([], Onlines) -> Onlines;
acc_online_num([#role_cache{channel_reg = Channel} | T],
               Onlines) ->
    case lists:keyfind(Channel, 1, Onlines) of
        {Channel, Num} ->
            acc_online_num(T,
                           lists:keyreplace(Channel,
                                            1,
                                            Onlines,
                                            {Channel, Num + 1}));
        _ -> acc_online_num(T, [{Channel, 1} | Onlines])
    end.

find_device(DeviceId) ->
    case catch ets:lookup(ets_adm_device, DeviceId) of
        [DeviceInfo = #adm_device_info{}] -> {true, DeviceInfo};
        [] -> null;
        _Err ->
            logger:error("查询封禁设备失败:~w", [_Err], adm_mgr, 788),
            false
    end.

update_prohibit_device(insert, AdmDeviceInfo) ->
    ets:insert(ets_adm_device, AdmDeviceInfo),
    dets:insert(ets_adm_device, AdmDeviceInfo);
update_prohibit_device(delete, DeviceId) ->
    ets:delete(ets_adm_device, DeviceId),
    dets:delete(ets_adm_device, DeviceId).

update_auth_sfz_cfg(CfgInfo) ->
    ets:insert(adm_authsfz_cfg, CfgInfo).

update_role_charge_cfg(Data) ->
    ets:insert(role_charge_cfg, Data).

do_prohibit_device(RoleId, Type) ->
    case Type of
        1 ->
            adm:silent([RoleId],
                       120,
                       1,
                       lang:get("设备被阻止发言"),
                       "admin");
        2 -> adm:lock([RoleId], 0, lang:get("设备被封号"), "admin")
    end.

load_authsfz_cfg() ->
    CfgData = reload_cfg(),
    role_group:pack_send(world, 10035, {CfgData}),
    ok.

reload_cfg() ->
    Platform = env:get(platform),
    DbQueryResult =
        db:get_all("select channel_reg, can_charge, is_nonage, "
                   "charge_limit, is_wallow, down_sec, is_show_ph"
                   "one, is_mail, show_info, is_mid_exp, "
                   "is_lev_60, is_need_check from auth_sfz_cfg "
                   "where platform = ?",
                   [Platform]),
    case DbQueryResult of
        {ok, Rows} ->
            logger:debug("加载数据成功:~w", [Rows], adm_mgr, 825),
            Fun = fun (Data, Rtn) ->
                          case to_auth_cfg(Data) of
                              AuthSfzCfg = #auth_sfz_cfg{} ->
                                  update_auth_sfz_cfg(AuthSfzCfg),
                                  [AuthSfzCfg | Rtn];
                              _ -> Rtn
                          end
                  end,
            lists:foldl(Fun, [], Rows);
        _ -> []
    end.

to_auth_cfg([ChannelReg,
             CanCharge,
             IsNonage,
             ChargeLimit,
             IsWallow,
             DownSec,
             IsShowPlone,
             IsMail,
             ShowInfo,
             IsMidExp,
             IsLev60,
             IsNeedCheck]) ->
    Platform = env:get(platform),
    #auth_sfz_cfg{plat_channel = {Platform, ChannelReg},
                  platform = Platform, channel_reg = ChannelReg,
                  can_charge = CanCharge, is_nonage = IsNonage,
                  charge_limit = ChargeLimit, is_wallow = IsWallow,
                  down_sec = DownSec, is_show_phone = IsShowPlone,
                  is_mail = IsMail, show_info = ShowInfo,
                  is_mid_exp = IsMidExp, is_lev_60 = IsLev60,
                  is_need_check = IsNeedCheck};
to_auth_cfg(_Data) -> false.

reload_role_charge_cfg() ->
    ets:delete_all_objects(role_charge_cfg),
    DbQueryResult =
        db:get_all("select id, platform, zone_id, label "
                   "from role_charge_cfg"),
    case DbQueryResult of
        {ok, Rows} ->
            logger:debug("加载数据成功:~w", [Rows], adm_mgr, 851),
            Fun = fun (Data, Rtn) ->
                          case to_charge_cfg(Data) of
                              ChargeCfg = #role_charge_cfg{} ->
                                  update_role_charge_cfg(ChargeCfg),
                                  [ChargeCfg | Rtn];
                              _Else -> Rtn
                          end
                  end,
            lists:foldl(Fun, [], Rows);
        _ -> []
    end.

to_charge_cfg([Id, Platform, ZoneId, Label]) ->
    #role_charge_cfg{id = {Id, Platform, ZoneId},
                     label = Label};
to_charge_cfg(_Data) ->
    logger:debug("错误的数据:~w", [_Data], adm_mgr, 869),
    false.

get_camp_clue(ClueId) ->
    case catch ets:lookup(ets_camp_inquiry, ClueId) of
        [ClueInfo] -> {ok, ClueInfo};
        _ -> false
    end.

update_camp_clue(ClueInfo) ->
    ets:insert(ets_camp_inquiry, ClueInfo),
    dets:insert(ets_camp_inquiry, ClueInfo),
    ok.

do_query(ReportId = {RId, ReportPlat, ReportZoneId},
         Type, Flag) ->
    case role_query:attr(by_id,
                         ReportId,
                         [#role.lock_status,
                          #role.lev,
                          #role.name,
                          #role.classes,
                          #role.account,
                          #role.m_guild,
                          #role.charge])
        of
        {ok, [2, _, _, _, _]} ->
            {false, lang:get("对方已经封号，无需举报")};
        {ok, [1, _, _, _, _]}
            when (Type =/= 3) and (Flag =/= 2) ->
            {false, lang:get("对方已经禁言，无需举报")};
        {ok, [4, _, _, _, _]} ->
            {false, lang:get("对方已经禁言，无需举报")};
        {ok, [3, _, _, _, _]} ->
            {false, lang:get("对方已经封号，无需举报")};
        {ok,
         [Status,
          Lev,
          Name,
          Classes,
          Account,
          MGuild,
          Charge]} ->
            GuildName = case MGuild of
                            #m_guild{name = _GuildName} -> _GuildName;
                            _ -> lang:get("无")
                        end,
            Args = #{status => Status, lev => Lev, name => Name,
                     classes => Classes, account => Account,
                     guild_name => GuildName, charge => Charge * 10},
            {true, Args};
        _ when Flag =:= 2 ->
            case role_data:info(by_id,
                                RId,
                                ReportPlat,
                                ReportZoneId)
                of
                {ok,
                 #role_info{lev = _Lev_, name = _Name_,
                            classes = _Classes_, lock_status = LockStatus}} ->
                    case (LockStatus =:= 2) or (LockStatus =:= 3) of
                        true -> {false, lang:get("对方已经禁言，无需举报")};
                        _ -> {true, LockStatus, _Lev_, _Name_, _Classes_, ""}
                    end;
                _ -> {false, lang:get("对方已成为失踪人口，正在努力搜寻中……")}
            end;
        _ -> {false, lang:get("对方已经下线，无需举报")}
    end.

do_post_3k(Role, ReportId, Args, Type, Reason, Msg,
           Flag)
    when Flag =:= 0 ->
    case lists:member(env:get(platform),
                      ["unite", "ios", "beta", "mix", "sp"])
        of
        true ->
            [{Channel, Content, ChatTime} | _] = Msg,
            Data = log:make_report(Role,
                                   Channel,
                                   ReportId,
                                   Args,
                                   Content,
                                   ChatTime,
                                   Type,
                                   Reason),
            logger:debug("举报信息:~w", [Data], adm_mgr, 921),
            log_web_3k:post(report, Data);
        _ -> ok
    end;
do_post_3k(_, _, _, _, _, _, _) -> ok.

