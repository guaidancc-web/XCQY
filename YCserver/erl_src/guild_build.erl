-file("src/mod/guild/guild_build.erl", 1).

-module(guild_build).

-export([active/1,
         uplev/5,
         accelerate/3,
         destory/3,
         payoff/2,
         downgrade/1,
         rpc_unlock_element/1,
         rpc_query_element_cost/2,
         rpc_change_accelerate_limit_mod/2,
         push_11113/2,
         push_11113/1,
         push_11198/1,
         push/2,
         lev_tick/1,
         store_tick/1,
         store_tick/2,
         get_store_next/0,
         get_store/1,
         get_store_time/2,
         buy_store/3,
         get_normal_goods/1,
         buy_normal_goods/3,
         gm_set_element_lev/2,
         get_max_element/0]).

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

-file("src/mod/guild/guild_build.erl", 41).

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

-file("src/mod/guild/guild_build.erl", 42).

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

-file("src/mod/guild/guild_build.erl", 43).

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

-file("src/mod/guild/guild_build.erl", 44).

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

-file("src/mod/guild/guild_build.erl", 45).

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

-file("src/mod/guild/guild_build.erl", 46).

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

-file("src/mod/guild/guild_build.erl", 47).

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

-file("src/mod/guild/guild_build.erl", 48).

-compile(export_all).

push_11113(Pid, G = #guild{}) ->
    role:pack_send(Pid, 11113, {G}),
    ok.

push_11113(G = #guild{members = Members}) ->
    guild:cast(Members, 11113, {G}),
    ok.

push_11198(Role = #role{id = RoleId,
                        m_guild = MGuild}) ->
    TotalCount = case MGuild of
                     #m_guild{id = GuildId} ->
                         case ets:lookup(guild_build_accelerate_info, GuildId)
                             of
                             [{GuildId, AccelerateList}] ->
                                 case lists:keyfind(RoleId, 1, AccelerateList)
                                     of
                                     {_, Count} -> Count;
                                     _ -> 0
                                 end;
                             _ -> 0
                         end;
                     _ -> 0
                 end,
    logger:debug("11198返回:~w",
                 [TotalCount],
                 guild_build,
                 84),
    role:link_send(Role, 11198, {TotalCount}),
    ok.

push(Role = #role{pid = Pid}, Cmd = 11115) ->
    Daily = max(0, 1 - var:get_var(Role, day, 29, 0)),
    Weekly = max(0,
                 1 - var:get_var(Role, week, guild_weekly_payoff, 0)),
    role:pack_send(Pid, Cmd, {Daily, Weekly});
push({GuildPid, Pid}, 11120) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {guild_build, get_store_time, [Pid]}).

payoff(Role = #role{m_guild =
                        #m_guild{id = Gid, enter_time = Entered}},
       Type = 1) ->
    {VarType, VarKey} = case Type of
                            1 -> {day, 29};
                            _ -> {week, guild_weekly_payoff}
                        end,
    Now = date:unixtime(),
    case var:get_var(Role, VarType, VarKey, 0) > 0 of
        _ when Now - Entered < 3600 * 24 ->
            {false, lang:get("进入公会24小时后才能领取工资")};
        true -> {false, lang:get("今天已经领过工资了")};
        _ ->
            case guild_mgr:attr(Gid, #guild.academy_lev) of
                AcademyLev when is_integer(AcademyLev) ->
                    case do_payoff(var:acc_var(Role, VarType, VarKey),
                                   AcademyLev,
                                   Type)
                        of
                        {ok, Msg, NewRole} ->
                            push(NewRole, 11115),
                            {ok, Msg, NewRole};
                        {false, _G = #gain{msg = Msg}} -> {false, Msg};
                        {false, _L = #loss{msg = _Msg}} ->
                            {false, lang:get("需要消耗10贡献才可领取工资")};
                        {false, Why} -> {false, Why};
                        _G ->
                            logger:error("领取失败 ~w", [_G], guild_build, 120),
                            {false, lang:get("领取失败")}
                    end;
                _ -> {false, lang:get("公会异常")}
            end
    end;
payoff(_, _Type) -> {false, lang:get("公会新秀不能领工资")}.

do_payoff(Role = #role{m_guild = #m_guild{post = Post}},
          ExchequerLev, Type) ->
    case guild_data:academy(ExchequerLev) of
        #{daily_coin := Coin, daily_exp := Exp}
            when Type =:= 1 ->
            TrueExp = round(Exp * post_to_salary_rate(Post)),
            Loss = format:val_to_loss([{90011, 10}]),
            Gain = format:val_to_gain([{90000,
                                        round(Coin *
                                                  post_to_salary_rate(Post))},
                                       {90013, TrueExp}]),
            case do_payoff_gl(Gain ++ Loss, Role) of
                {ok, NewRole} -> {ok, lang:get("领取工资成功"), NewRole};
                Else -> Else
            end;
        _ when ExchequerLev =:= 0 andalso Type =:= 1 ->
            {Exp, Coin} = {66, 70000},
            TrueExp = round(Exp * post_to_salary_rate(Post)),
            Loss = format:val_to_loss([{90011, 10}]),
            Gain = format:val_to_gain([{90000,
                                        round(Coin *
                                                  post_to_salary_rate(Post))},
                                       {90013, TrueExp}]),
            case do_payoff_gl(Gain ++ Loss, Role) of
                {ok, NewRole} -> {ok, lang:get("领取工资成功"), NewRole};
                Else -> Else
            end;
        #{weekly_gold_bind := GoldBind, weekly_exp := Exp} ->
            case role_gain:do([#gain{label = gold_bind,
                                     val = GoldBind},
                               #gain{label = exp, val = Exp}],
                              Role)
                of
                {ok, NewRole} ->
                    {ok,
                     util:flist(lang:get("领取工资获得：经验~w 金币~w"),
                                [Exp, GoldBind]),
                     NewRole};
                Else -> Else
            end;
        _R ->
            logger:error("厢房数据异常 ~w", [_R], guild_build, 162),
            {false, lang:get("领取工资失败")}
    end.

do_payoff_gl([], Role) -> {ok, Role};
do_payoff_gl([H | T], Role) ->
    NewH = case H of
               #gain{label = prac_exp} -> H#gain{source = 11};
               _ -> H
           end,
    case role_gain:do_notice([NewH], Role) of
        {ok, NewRole} -> do_payoff_gl(T, NewRole);
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            do_payoff_gl(T, Role);
        Else -> Else
    end.

active(State = #guild{academy_lev = _AcademyLev,
                      store_lev = _StoreLev}) ->
    State1 = do_active(State, {academy, 1}),
    State4 = do_active(State1, {store, 1}),
    State5 = calc_guild_upkeep(State4),
    State5.

do_active(State, {_, Lev}) when Lev > 0 -> State;
do_active(State = #guild{lev = GuildLev},
          {academy, 0}) ->
    case guild_data:academy(1) of
        #{need_lev := NeedGuildLev}
            when GuildLev >= NeedGuildLev ->
            lev_trigger(State#guild{academy_lev = 1},
                        State,
                        academy);
        _ -> State
    end;
do_active(State = #guild{lev = GuildLev}, {store, 0}) ->
    case guild_data:store(1) of
        #{need_lev := NeedGuildLev}
            when GuildLev >= NeedGuildLev ->
            lev_trigger(State#guild{store_lev = 1}, State, store);
        _ -> State
    end.

rpc_unlock_element(#role{id = RoleId, name = RoleName,
                         m_guild = MGuild}) ->
    case MGuild of
        #m_guild{pid = GuildPid} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {fun sync_unlock_element/3,
                                  [RoleId, RoleName]})
                of
                ok -> ok;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("升级公会时发生异常:~w", [_Err], guild_build, 215),
                    {false, lang:get("公会繁忙，请稍后再尝试")}
            end;
        _ -> {false, lang:get("您没有公会，不能进行解锁")}
    end.

sync_unlock_element(Guild, RoleId, RoleName) ->
    case do_unlock_element([check, cost, unlock],
                           Guild,
                           #{role_id => RoleId, role_name => RoleName})
        of
        {ok, NewGuild} -> {ok, ok, NewGuild};
        {false, Reason} -> {ok, {false, Reason}};
        _Err ->
            logger:error("解锁公会元素失败:~w", [_Err], guild_build, 226),
            {ok, {false, lang:get("解锁公会元素失败")}}
    end.

do_unlock_element([], GuildInfo = #guild{members = Mem},
                  _Args = #{role_name := RoleName}) ->
    Now = date:unixtime(),
    UseTime = lists:foldl(fun (BuildType, Rtn) ->
                                  case guild_data:get_element({1, BuildType}) of
                                      #{need_time := NeedTime} ->
                                          Rtn + NeedTime;
                                      _ -> Rtn
                                  end
                          end,
                          0,
                          [5, 6, 7, 8, 9, 10]),
    logger:debug("建筑祭坛用时：~w", [UseTime], guild_build, 238),
    NewGuild = GuildInfo#guild{upgrade_element_time =
                                   Now + UseTime},
    guild:sync_cache(NewGuild),
    push_11113(NewGuild),
    Msg =
        notice:format(lang:get("~ts开启了元素祭坛建设，大家快去贡献自己的一份力量吧~ts"),
                      [{role_2, RoleName},
                       {guildpray_1, 11138, 1, lang:get("前往建造")}]),
    guild:notice(Mem, Msg),
    {ok, NewGuild};
do_unlock_element([check | _Rest],
                  #guild{element_info = [_ | _]}, _Args) ->
    {false, lang:get("元素祈福已经解锁了，无需重复解锁")};
do_unlock_element([check | Rest],
                  Guild = #guild{lev = GuildLev, assets = Assets,
                                 members = Members},
                  Args = #{role_id := RoleId}) ->
    case guild_role:check_fun(RoleId, Members, upbuild) of
        false -> {false, lang:get("你没有权限解锁公会元素祭坛")};
        {true, _Gr} ->
            case world_lev:get_world_lev() of
                {WorldLev, _} when WorldLev >= 70 ->
                    case GuildLev >= 1 of
                        true ->
                            UnlockAssets = get_element_unlock_assets(),
                            case Assets >= UnlockAssets of
                                true -> do_unlock_element(Rest, Guild, Args);
                                _ ->
                                    Msg =
                                        notice:format(lang:get("公会资金不足~ts，不能解锁元素祈福"),
                                                      [{string_2,
                                                        1,
                                                        UnlockAssets}]),
                                    {false, Msg}
                            end;
                        _ ->
                            Msg =
                                notice:format(lang:get("需要公会等级达到~ts级，才能解锁元素祈福"),
                                              [{string_2, 1, 1}]),
                            {false, Msg}
                    end;
                _ ->
                    Msg = notice:format(lang:get("需要世界等级达到~ts级，才能解锁元素祈福"),
                                        [{string_2, 1, 70}]),
                    {false, Msg}
            end
    end;
do_unlock_element([cost | Rest],
                  Guild = #guild{assets = Assets}, Args) ->
    CostAssets = get_element_cost_assets(),
    NewGuild = Guild#guild{assets = Assets - CostAssets},
    do_unlock_element(Rest, NewGuild, Args);
do_unlock_element([unlock | Rest],
                  Guild = #guild{map_id = MapId}, Args) ->
    ElementInfo = init_element_info(),
    NewGuild = Guild#guild{element_info = ElementInfo,
                           flag = 1},
    GuildBattleId = get(guild_battle_id),
    unit_mgr:remove({GuildBattleId, 20101}),
    unit_mgr:create({GuildBattleId, 20102},
                    20102,
                    {MapId, 2542, 1301}),
    do_unlock_element(Rest, NewGuild, Args).

rpc_query_element_cost(#role{m_guild = MGuild},
                       BuildType) ->
    case MGuild of
        #m_guild{id = GuildId} ->
            case guild_mgr:info(by_id, GuildId) of
                #guild{element_info = ElementInfo} ->
                    case calc_uplev_cost(ElementInfo, BuildType) of
                        Cost when is_integer(Cost) -> Cost;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end.

rpc_change_accelerate_limit_mod(#role{id = RoleId,
                                      m_guild = MGuild},
                                LimitMod) ->
    case MGuild of
        #m_guild{pid = GuildPid} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {fun sync_change_accelerate_limit_mod/3,
                                  [RoleId, LimitMod]})
                of
                ok -> ok;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("设置升级模式的时候发生异常:~w",
                                 [_Err],
                                 guild_build,
                                 318),
                    {false, lang:get("公会繁忙，请稍后再尝试")}
            end;
        _ -> {false, lang:get("您没有公会，无法操作")}
    end.

uplev(Type, LimitMode, GuildPid, RoleId, RolePid)
    when Type >= 0 andalso Type < 12 ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_uplev/5, [LimitMode, Type, RoleId, RolePid]})
        of
        {false, Reason} -> {false, Reason};
        {ok, Msg} -> {ok, Msg};
        _Err ->
            logger:error("升级公会时发生异常:~w", [_Err], guild_build, 335),
            {false, lang:get("公会繁忙，请稍后再尝试")}
    end;
uplev(_Type, _LimitMode, _GuildPid, _RoleId,
      _RolePid) ->
    {false, lang:get("错误的升级类型")}.

sync_uplev(Guild, LimitMode, Type, RoleId, RolePid) ->
    do_sync_uplev([check, data, uplev],
                  Guild,
                  LimitMode,
                  Type,
                  RoleId,
                  RolePid).

do_sync_uplev([],
              Guild = #guild{members = Mem,
                             element_info = ElementInfo},
              LimitMode, Type, _RoleId, _RolePid) ->
    NewGuild = lev_tick(Guild),
    EndTime = get_left_time(Guild, Type),
    IsNotOver = EndTime > date:unixtime(),
    case IsNotOver of
        true when Type =< 3 ->
            Msg = case LimitMode of
                      0 ->
                          notice:format(lang:get("~ts正在升级，大家快贡献一份力量加速建设进度吧！~ts"),
                                        [{string_2,
                                          1,
                                          guild_util:build_to_name(Type)},
                                         {panel_2,
                                          11104,
                                          1,
                                          lang:get("我要贡献")}]);
                      _ ->
                          Cost = case guild_data:get_acceleration(LimitMode) of
                                     #{cost_coin := CostCoin} -> CostCoin;
                                     _ -> 0
                                 end,
                          notice:format(lang:get("~ts正在升级，每人可贡献~ts, 大家快贡献一份力量加速建设进度吧！~ts"),
                                        [{string_2,
                                          1,
                                          guild_util:build_to_name(Type)},
                                         {assets_1, 90000, Cost},
                                         {panel_2, 11104, 1, lang:get("我要贡献")}])
                  end,
            guild:notice(Mem, Msg);
        true when Type =< 10 ->
            ToLev = case lists:keyfind(Type,
                                       #element_info.build_type,
                                       ElementInfo)
                        of
                        #element_info{lev = _ToLev} -> _ToLev;
                        _ -> 0
                    end,
            Msg = notice:format(lang:get("~ts正在升至~ts级，大家耐心等待建设完成吧"),
                                [{string_2, 1, guild_util:build_to_name(Type)},
                                 {string_2, 1, ToLev + 1}]),
            guild:notice(Mem, Msg);
        false -> ok
    end,
    push_11113(NewGuild),
    guild:cast(Mem, 11198, {0}),
    guild:sync_cache(NewGuild),
    SendMsg = case Type of
                  _ when Type =< 3 -> lang:get("成功扣除公会资金进行升级");
                  _ when Type =< 10 ->
                      EmtLev = case lists:keyfind(Type,
                                                  #element_info.build_type,
                                                  ElementInfo)
                                   of
                                   #element_info{lev = _EmtLev} -> _EmtLev;
                                   _ -> 0
                               end,
                      case IsNotOver of
                          false ->
                              notice:format(lang:get("~ts成功提升至~ts级"),
                                            [{string_2,
                                              2,
                                              guild_util:build_to_name(Type)},
                                             {string_2, 1, EmtLev + 1}]);
                          true ->
                              notice:format(lang:get("~ts即将提升至~ts级，请耐心等候"),
                                            [{string_2,
                                              2,
                                              guild_util:build_to_name(Type)},
                                             {string_2, 1, EmtLev + 1}])
                      end;
                  _ -> lang:get("成功扣除公会资金进行升级")
              end,
    {ok, {ok, SendMsg}, NewGuild};
do_sync_uplev([check | T],
              Guild = #guild{members = Members,
                             academy_time = AcademyTime,
                             exchequer_time = ExchequerTime,
                             store_time = StoreTime, lev_time = LevTime,
                             today_upgraded_build = TodayUpgraded,
                             last_build_upgraded = LastUpgraded,
                             element_info = ElementInfo},
              LimitMode, Type, RoleId, RolePid) ->
    Data = case guild_role:check_fun(RoleId,
                                     Members,
                                     upbuild)
               of
               false -> {false, lang:get("你没有权限升级公会建筑")};
               {true, _Gr} -> true
           end,
    Now = date:unixtime(),
    case Data of
        {false, Reason} -> {ok, {false, Reason}};
        true ->
            if Type =< 10 andalso Type >= 4 ->
                   case lists:keyfind(Type,
                                      #element_info.build_type,
                                      ElementInfo)
                       of
                       #element_info{time = EndTime} when Now < EndTime ->
                           Msg = notice:format(lang:get("元素祭坛的~ts正在升级中"),
                                               [{string_2,
                                                 1,
                                                 guild_util:build_to_name(Type)}]),
                           {ok, {false, Msg}};
                       _ ->
                           do_sync_uplev(T,
                                         Guild,
                                         LimitMode,
                                         Type,
                                         RoleId,
                                         RolePid)
                   end;
               LevTime =/= 0 -> {ok, {false, lang:get("公会规模正在升级中")}};
               AcademyTime =/= 0 ->
                   {ok, {false, lang:get("公会研究院正在升级中")}};
               ExchequerTime =/= 0 ->
                   {ok, {false, lang:get("公会厢房正在升级中")}};
               StoreTime =/= 0 -> {ok, {false, lang:get("公会商店正在升级中")}};
               Type =< 3 ->
                   case date:is_same_day(date:unixtime(), LastUpgraded) of
                       true when TodayUpgraded >= 4 ->
                           {ok,
                            {false, util:flist(lang:get("每天只可升级~w次建筑"), [4])}};
                       _ ->
                           do_sync_uplev(T,
                                         Guild,
                                         LimitMode,
                                         Type,
                                         RoleId,
                                         RolePid)
                   end;
               true ->
                   do_sync_uplev(T,
                                 Guild,
                                 LimitMode,
                                 Type,
                                 RoleId,
                                 RolePid)
            end
    end;
do_sync_uplev([data | T],
              Guild = #guild{lev = GuildLev, academy_lev = AcademyLev,
                             assets = Assets},
              LimitMode, 1, RoleId, RolePid) ->
    case guild_data:academy(AcademyLev + 1) of
        #{need_lev := NeedLev} when GuildLev < NeedLev ->
            {ok, {false, lang:get("请先提升公会规模再升级研究院")}};
        #{cost := Cost} when Cost > Assets ->
            {ok, {false, lang:get("公会资金不足, 无法升级")}};
        #{need := NeedCost} when NeedCost > Assets ->
            {ok,
             {false,
              util:flist(lang:get("公会资金需要达到~w才能升级研究院"), [NeedCost])}};
        #{cost := Cost, need_time := NeedTime} ->
            Now = date:unixtime(),
            NewGuild = Guild#guild{assets = Assets - Cost, flag = 1,
                                   academy_time = Now + NeedTime,
                                   limit_mode = LimitMode},
            do_sync_uplev(T,
                          NewGuild,
                          LimitMode,
                          1,
                          RoleId,
                          RolePid);
        _ -> {ok, {false, lang:get("公会研究院已经是最高等级了")}}
    end;
do_sync_uplev([data | T],
              Guild = #guild{lev = GuildLev,
                             exchequer_lev = ExchequerLev, assets = Assets},
              LimitMode, 2, RoleId, RolePid) ->
    case guild_data:exchequer(ExchequerLev + 1) of
        #{need_lev := NeedLev} when GuildLev < NeedLev ->
            {ok, {false, lang:get("请先提升公会规模再升级厢房")}};
        #{cost := Cost} when Cost > Assets ->
            {ok, {false, lang:get("公会资金不足, 无法升级")}};
        #{need := NeedCost} when NeedCost > Assets ->
            {ok,
             {false,
              util:flist(lang:get("公会资金需要达到~w才能升级厢房"), [NeedCost])}};
        #{cost := Cost, need_time := NeedTime} ->
            Now = date:unixtime(),
            Guild1 = Guild#guild{assets = Assets - Cost, flag = 1,
                                 exchequer_time = Now + NeedTime,
                                 limit_mode = LimitMode},
            NewGuild = Guild1,
            do_sync_uplev(T,
                          NewGuild,
                          LimitMode,
                          2,
                          RoleId,
                          RolePid);
        _ -> {ok, {false, lang:get("公会厢房已经是最高等级了")}}
    end;
do_sync_uplev([data | T],
              Guild = #guild{lev = GuildLev, store_lev = StoreLev,
                             assets = Assets},
              LimitMode, 3, RoleId, RolePid) ->
    case guild_data:store(StoreLev + 1) of
        #{need_lev := NeedLev} when GuildLev < NeedLev ->
            {ok, {false, lang:get("请先提升公会规模再升级商店")}};
        #{cost := Cost} when Cost > Assets ->
            {ok, {false, lang:get("公会资金不足, 无法升级")}};
        #{need := NeedCost} when NeedCost > Assets ->
            {ok,
             {false,
              util:flist(lang:get("公会资金需要达到~w才能升级商店"), [NeedCost])}};
        #{cost := Cost, need_time := NeedTime} ->
            Now = date:unixtime(),
            NewGuild = Guild#guild{assets = Assets - Cost, flag = 1,
                                   store_time = NeedTime + Now,
                                   limit_mode = LimitMode},
            do_sync_uplev(T,
                          NewGuild,
                          LimitMode,
                          3,
                          RoleId,
                          RolePid);
        _ -> {ok, {false, lang:get("公会商店已经是最高等级了")}}
    end;
do_sync_uplev([data | T],
              Guild = #guild{lev = GuildLev, assets = Assets},
              LimitMode, 0, RoleId, RolePid) ->
    case guild_data:uplev(GuildLev + 1) of
        #{cost := Cost} when Cost > Assets ->
            {ok, {false, lang:get("公会资金不足, 无法升级")}};
        #{need := NeedCost} when NeedCost > Assets ->
            {ok,
             {false,
              util:flist(lang:get("公会资金需要达到~w才能升级公会"), [NeedCost])}};
        #{cost := Cost, need_lev := NeedLev,
          need_time := NeedTime} ->
            Now = date:unixtime(),
            case check_uplev(Guild, NeedLev) of
                true ->
                    Guild1 = Guild#guild{assets = Assets - Cost, flag = 1,
                                         lev_time = NeedTime + Now,
                                         limit_mode = LimitMode},
                    NewGuild = Guild1,
                    do_sync_uplev(T,
                                  NewGuild,
                                  LimitMode,
                                  0,
                                  RoleId,
                                  RolePid);
                {false, Reason} -> {ok, {false, Reason}}
            end;
        _ -> {ok, {false, lang:get("公会已经是最高等级了")}}
    end;
do_sync_uplev([data | T],
              Guild = #guild{element_info = ElementInfo,
                             assets = Assets},
              LimitMode, BuildType, RoleId, RolePid)
    when BuildType >= 4 andalso BuildType =< 10 ->
    BuildLev = case lists:keyfind(BuildType,
                                  #element_info.build_type,
                                  ElementInfo)
                   of
                   #element_info{lev = _BuildLev} -> _BuildLev;
                   _ -> 1
               end,
    case guild_data:get_element({BuildLev + 1, BuildType})
        of
        #{need := NeedCost, element_name := Name}
            when NeedCost > Assets ->
            {ok,
             {false,
              util:flist(lang:get("公会资金需要达到~w才能升级~ts元素"),
                         [NeedCost, Name])}};
        #{need_world_lev := NeedWorldLev,
          need_time := NeedTime} ->
            Now = date:unixtime(),
            case check_uplev_element(Guild, BuildType, NeedWorldLev)
                of
                {true, Cost} ->
                    NewElement = case lists:keyfind(BuildType,
                                                    #element_info.build_type,
                                                    ElementInfo)
                                     of
                                     Element = #element_info{} ->
                                         Element#element_info{time =
                                                                  Now +
                                                                      NeedTime};
                                     _ ->
                                         #element_info{build_type = BuildType,
                                                       time = Now + NeedTime}
                                 end,
                    NewElementInfo = lists:keystore(BuildType,
                                                    #element_info.build_type,
                                                    ElementInfo,
                                                    NewElement),
                    Guild1 = Guild#guild{assets = Assets - Cost, flag = 1,
                                         element_info = NewElementInfo,
                                         limit_mode = LimitMode},
                    NewGuild = Guild1,
                    do_sync_uplev(T,
                                  NewGuild,
                                  LimitMode,
                                  BuildType,
                                  RoleId,
                                  RolePid);
                {false, Reason} -> {ok, {false, Reason}}
            end;
        _Err ->
            logger:debug("升级元素建筑错误:~w", [_Err], guild_build, 536),
            Msg = notice:format(lang:get("~ts已经是最高等级了"),
                                [{string_2,
                                  1,
                                  guild_util:build_to_name(BuildType)}]),
            {ok, {false, Msg}}
    end;
do_sync_uplev([uplev | T],
              Guild = #guild{uplev_element_times = Times,
                             last_uplev_element = LastUplevTime},
              LimitMode, Type, RoleId, RolePid)
    when Type >= 4 andalso Type =< 10 ->
    Now = date:unixtime(),
    NewTodayUpgrade = case date:is_same_day(Now,
                                            LastUplevTime)
                          of
                          true -> Times + 1;
                          _ -> 1
                      end,
    Guild1 = Guild#guild{last_uplev_element = Now,
                         uplev_element_times = NewTodayUpgrade,
                         limit_mode = LimitMode},
    NewGuild = guild_common:add_event(Guild1, 2, [Type]),
    do_sync_uplev(T,
                  NewGuild,
                  LimitMode,
                  Type,
                  RoleId,
                  RolePid);
do_sync_uplev([uplev | T],
              Guild = #guild{last_uplev_element = LastUpgraded,
                             today_upgraded_build = TodayUpgraded},
              LimitMode, Type, RoleId, RolePid) ->
    Now = date:unixtime(),
    NewTodayUpgrade = case date:is_same_day(Now,
                                            LastUpgraded)
                          of
                          true -> TodayUpgraded + 1;
                          _ -> 1
                      end,
    Guild1 = Guild#guild{last_build_upgraded = Now,
                         today_upgraded_build = NewTodayUpgrade},
    NewGuild = guild_common:add_event(Guild1, 2, [Type]),
    do_sync_uplev(T,
                  NewGuild,
                  LimitMode,
                  Type,
                  RoleId,
                  RolePid).

check_uplev(#guild{academy_lev = AcademyLev,
                   store_lev = StoreLev, exchequer_lev = ExchequerLev},
            NeedLev) ->
    case AcademyLev + StoreLev + ExchequerLev >= NeedLev of
        true -> true;
        _ ->
            {false,
             util:flist(lang:get("其他建筑总等级不足 ~w, 无法升级"), [NeedLev])}
    end.

check_uplev_element(#guild{last_uplev_element =
                               LastUplevTime,
                           uplev_element_times = Times, assets = Assets,
                           element_info = ElementInfo},
                    BuildType, NeedWorldLev) ->
    case date:is_same_day(date:unixtime(), LastUplevTime) of
        true when Times >= 15 ->
            Msg =
                notice:format(lang:get("您今日升级祭坛元素次数已满~ts次，不能进行升级了"),
                              [{string_2, 1, Times}]),
            {false, Msg};
        _ ->
            case world_lev:get_world_lev() of
                {WorldLev, _} when WorldLev >= NeedWorldLev ->
                    case calc_uplev_cost(ElementInfo, BuildType) of
                        {false, Reason} -> {false, Reason};
                        Cost when is_integer(Cost) ->
                            logger:debug("公会升级消耗资金:~w",
                                         [Cost],
                                         guild_build,
                                         578),
                            case Cost >= Assets of
                                true -> {false, lang:get("公会资金不足")};
                                false -> {true, Cost}
                            end
                    end;
                _ ->
                    Msg = notice:format(lang:get("需要世界等级达到~ts级，才能升级此元素"),
                                        [{string_2, 1, NeedWorldLev}]),
                    {false, Msg}
            end
    end.

accelerate(Role = #role{id = RoleId, name = RoleName,
                        pid = RolePid, m_guild = #m_guild{pid = GuildPid}},
           Type, Mode)
    when Type >= 0 andalso Type =< 3 ->
    case guild_data:get_acceleration(Mode) of
        #{cost_coin := Cost, reduce_time := ReTime,
          gain_donation := Num} ->
            GL = [#loss{label = coin, val = Cost,
                        msg = lang:get("银币不足, 无法加速")},
                  #gain{label = guild, val = Num, ext = accelerate}],
            case role_gain:do(GL, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, NewRole} ->
                    case guild_mgr:apply(sync,
                                         GuildPid,
                                         {fun sync_accelerate/2,
                                          [#{type => Type, num => Num,
                                             reduce_time => ReTime,
                                             role_id => RoleId,
                                             role_name => RoleName,
                                             role_pid => RolePid,
                                             cost_coin => Cost}]})
                        of
                        {false, Reason} -> {false, Reason};
                        ok ->
                            Msg = notice:format(lang:get("加速成功，消耗~ts，获得~ts"),
                                                [{assets_1, 90000, Cost},
                                                 {assets_1, 90011, Num}]),
                            {ok, Msg, NewRole};
                        _Err ->
                            logger:error("加速公会时发生异常:~w",
                                         [_Err],
                                         guild_build,
                                         610),
                            {ok, lang:get("公会繁忙，请稍后再尝试"), NewRole}
                    end
            end;
        _ -> {false, lang:get("未知加速类型, 无法操作")}
    end;
accelerate(Role = #role{id = RoleId, name = RoleName,
                        pid = RolePid, m_guild = #m_guild{pid = GuildPid}},
           11, Mode) ->
    case guild_data:get_acceleration(Mode) of
        #{cost_coin := Cost, reduce_time := ReTime,
          gain_donation := Num} ->
            GL = [#loss{label = coin, val = Cost,
                        msg = lang:get("银币不足, 无法加速")},
                  #gain{label = guild, val = Num, ext = accelerate}],
            case role_gain:do(GL, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, NewRole} ->
                    case guild_mgr:apply(sync,
                                         GuildPid,
                                         {fun sync_accelerate/2,
                                          [#{type => 11, num => Num,
                                             reduce_time => ReTime,
                                             role_id => RoleId,
                                             role_name => RoleName,
                                             role_pid => RolePid,
                                             cost_coin => Cost}]})
                        of
                        {false, Reason} -> {false, Reason};
                        ok ->
                            Msg = notice:format(lang:get("加速成功，消耗~ts，获得~ts"),
                                                [{assets_1, 90000, Cost},
                                                 {assets_1, 90011, Num}]),
                            {ok, Msg, NewRole};
                        _Err ->
                            logger:error("加速公会时发生异常:~w",
                                         [_Err],
                                         guild_build,
                                         630),
                            {ok, lang:get("公会繁忙，请稍后再尝试"), NewRole}
                    end
            end;
        _ -> {false, lang:get("未知加速类型, 无法操作")}
    end;
accelerate(_Role, _Type, _Mode) ->
    {false, lang:get("错误的加速类型")}.

sync_accelerate(Guild, Args) ->
    do_sync_accelerate([check, limit_mode, accelerate],
                       Guild,
                       Args).

do_sync_accelerate([], Guild, _Args) ->
    guild:sync_cache(Guild),
    {ok, ok, Guild};
do_sync_accelerate([check | T],
                   Guild = #guild{lev_time = LevTime,
                                  academy_time = AcademyTime,
                                  exchequer_time = ExchequerTime,
                                  store_time = StoreTime,
                                  upgrade_element_time = ElementTime},
                   Args = #{type := Type, reduce_time := ReTime}) ->
    Data = if Type =:= 0 andalso LevTime =:= 0 ->
                  {false, lang:get("公会规模不在升级中")};
              Type =:= 1 andalso AcademyTime =:= 0 ->
                  {false, lang:get("公会研究院不在升级中")};
              Type =:= 2 andalso ExchequerTime =:= 0 ->
                  {false, lang:get("公会厢房不在升级中")};
              Type =:= 3 andalso StoreTime =:= 0 ->
                  {false, lang:get("公会商店不在升级中")};
              Type =:= 11 andalso ElementTime =:= 0 ->
                  {false, lang:get("元素祭坛不在建造中")};
              Type =:= 0 ->
                  {true,
                   Guild#guild{lev_time = max(0, LevTime - ReTime)}};
              Type =:= 1 ->
                  {true,
                   Guild#guild{academy_time =
                                   max(0, AcademyTime - ReTime)}};
              Type =:= 2 ->
                  {true,
                   Guild#guild{exchequer_time =
                                   max(0, ExchequerTime - ReTime)}};
              Type =:= 3 ->
                  {true,
                   Guild#guild{store_time = max(0, StoreTime - ReTime)}};
              Type =:= 11 ->
                  logger:debug("======:~w",
                               [{ElementTime, ReTime, ElementTime - ReTime}],
                               guild_build,
                               667),
                  {true,
                   Guild#guild{upgrade_element_time =
                                   max(0, ElementTime - ReTime)}};
              true -> {false, lang:get("未知的加速类型")}
           end,
    case Data of
        {false, Reason} -> {ok, {false, Reason}};
        {true, NewGuild} ->
            do_sync_accelerate(T, NewGuild, Args)
    end;
do_sync_accelerate([limit_mode | T],
                   Guild = #guild{id = GuildId, limit_mode = LimitMode},
                   Args = #{role_id := RoleId, cost_coin := Cost}) ->
    ModeLimitCount = case
                         guild_data:get_acceleration(LimitMode)
                         of
                         #{cost_coin := _ModeLimitCount} -> _ModeLimitCount;
                         _ -> 100000000
                     end,
    case ets:lookup(guild_build_accelerate_info, GuildId) of
        [{_, AccelerateList}] ->
            case lists:keyfind(RoleId, 1, AccelerateList) of
                {_, AccelerateCount} ->
                    case AccelerateCount + Cost > ModeLimitCount of
                        true ->
                            Msg = lang:get("会长设置了贡献额度，可不要多点哟{face_1, 22}"),
                            {ok, {false, Msg}};
                        _ -> do_sync_accelerate(T, Guild, Args)
                    end;
                _ ->
                    case Cost > ModeLimitCount of
                        true ->
                            Msg = lang:get("会长设置了贡献额度，可不要多点哟{face_1, 22}"),
                            {ok, {false, Msg}};
                        _ -> do_sync_accelerate(T, Guild, Args)
                    end
            end;
        _ ->
            case Cost > ModeLimitCount of
                true ->
                    Msg = lang:get("会长设置了贡献额度，可不要多点哟{face_1, 22}"),
                    {ok, {false, Msg}};
                _ -> do_sync_accelerate(T, Guild, Args)
            end
    end;
do_sync_accelerate([accelerate | T],
                   Guild = #guild{id = GuildId, members = Members,
                                  limit_mode = LimitMode},
                   Args = #{role_id := RoleId, num := Value,
                            role_name := RoleName, reduce_time := ReTime,
                            type := Type, cost_coin := Cost}) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> {ok, {false, lang:get("你不属于当前公会")}};
        Gr = #guild_role{value = V, total_value = Tv} ->
            case LimitMode of
                0 -> ingore;
                _ -> update_role_accelerate(GuildId, RoleId, Cost)
            end,
            NewGr = Gr#guild_role{value = V + Value,
                                  total_value = Tv + Value},
            NewMembers = lists:keyreplace(RoleId,
                                          #guild_role.id,
                                          Members,
                                          NewGr),
            Guild1 = Guild#guild{members = NewMembers, flag = 1},
            Msg = case Type of
                      11 ->
                          notice:format(lang:get("~ts贡献了~ts为~ts建设加速~ts，并获得了~ts ~ts"),
                                        [{role_2, RoleName},
                                         {assets_1, 90000, Cost},
                                         {string_2,
                                          5,
                                          guild_util:build_to_name(Type)},
                                         {string_2,
                                          5,
                                          date:seconds_to_str(ReTime)},
                                         {assets_1, 90011, Value},
                                         {guildpray_1,
                                          11138,
                                          1,
                                          lang:get("前往建造")}]);
                      _ ->
                          notice:format(lang:get("~ts贡献了~ts为~ts建设加速~ts，并获得了~ts ~ts"),
                                        [{role_2, RoleName},
                                         {assets_1, 90000, Cost},
                                         {string_2,
                                          5,
                                          guild_util:build_to_name(Type)},
                                         {string_2,
                                          5,
                                          date:seconds_to_str(ReTime)},
                                         {assets_1, 90011, Value},
                                         {panel_2, 11104, 1, lang:get("我要贡献")}])
                  end,
            Guild2 = guild_common:add_event(Guild1,
                                            8,
                                            [Args#{msg => Msg}]),
            Guild3 = lev_tick(Guild2),
            NewGuild = Guild3,
            push_11113(NewGuild),
            do_sync_accelerate(T, NewGuild, Args)
    end.

destory(Type, GuildPid,
        #role{id = RoleId, pid = RolePid})
    when Type >= 0 andalso Type < 12 ->
    guild_mgr:apply(async,
                    GuildPid,
                    {fun async_destory/4, [Type, RoleId, RolePid]}),
    ok;
destory(_Type, _GuildPid, _Role) ->
    {false, lang:get("非法拆除类型")}.

async_destory(Guild, Type, RoleId, RolePid) ->
    do_async_destory([check, destory],
                     Guild,
                     Type,
                     RoleId,
                     RolePid).

do_async_destory([], Guild, Type, _RoleId, RolePid) ->
    Msg = notice:format(lang:get("操作成功，~ts降低~ts级"),
                        [{string_2, 1, guild_util:build_to_name(Type)},
                         {string_2, 5, 1}]),
    role:pack_send(RolePid, 11117, {1, Msg}),
    guild:sync_cache(Guild),
    {ok, Guild};
do_async_destory([check | T],
                 Guild = #guild{members = Members,
                                last_build_destory = LastDestory,
                                today_destory_build = TodayDestory},
                 Type, RoleId, RolePid) ->
    case guild_role:check_fun(RoleId, Members, destory) of
        false ->
            role:pack_send(RolePid,
                           11117,
                           {0, lang:get("你没有权限拆除公会建筑")}),
            ok;
        {true, _Gr} ->
            case date:is_same_day(date:unixtime(), LastDestory) of
                true when TodayDestory >= 2 ->
                    role:pack_send(RolePid,
                                   11117,
                                   {0, lang:get("每天只可拆除2次建筑")}),
                    ok;
                _ -> do_async_destory(T, Guild, Type, RoleId, RolePid)
            end
    end;
do_async_destory([destory | T],
                 Guild = #guild{academy_lev = AcademyLev,
                                store_lev = StoreLev,
                                exchequer_lev = ExchequerLev,
                                last_build_destory = LastDestory,
                                today_destory_build = TodayDestory, lev = Lev,
                                element_info = ElementInfo},
                 Type, RoleId, RolePid) ->
    Data = if Type =:= 0 andalso Lev =< 1 ->
                  {false, lang:get("只能拆除1级以上的建筑")};
              Type =:= 1 andalso AcademyLev =< 1 ->
                  {false, lang:get("只能拆除1级以上的建筑")};
              Type =:= 2 andalso ExchequerLev =< 1 ->
                  {false, lang:get("只能拆除1级以上的建筑")};
              Type =:= 3 andalso StoreLev =< 1 ->
                  {false, lang:get("只能拆除1级以上的建筑")};
              Type =:= 0 ->
                  NewGLev = Lev - 1,
                  Guild1 = Guild#guild{lev = NewGLev, flag = 1},
                  NewGuild = lev_trigger(Guild1, Guild, guild),
                  {true, NewGuild, NewGLev};
              Type =:= 1 ->
                  NewAcademyLev = AcademyLev - 1,
                  Guild1 = Guild#guild{academy_lev = NewAcademyLev,
                                       flag = 1},
                  NewGuild = lev_trigger(Guild1, Guild, academy),
                  {true, NewGuild, NewAcademyLev};
              Type =:= 2 ->
                  NewExchequer = ExchequerLev - 1,
                  Guild1 = Guild#guild{exchequer_lev = NewExchequer,
                                       flag = 1},
                  NewGuild = lev_trigger(Guild1, Guild, exchequer),
                  {true, NewGuild, NewExchequer};
              Type =:= 3 ->
                  NewStoreLev = StoreLev - 1,
                  Guild1 = Guild#guild{store_lev = NewStoreLev, flag = 1},
                  NewGuild = lev_trigger(Guild1, Guild, store),
                  {true, NewGuild, NewStoreLev};
              Type >= 4 andalso Type =< 10 ->
                  case lists:keyfind(Type,
                                     #element_info.build_type,
                                     ElementInfo)
                      of
                      #element_info{lev = Lev} when Lev =< 1 ->
                          {false, lang:get("只能拆除1级以上的建筑")};
                      Element = #element_info{lev = ElementLev} ->
                          NewElementLev = ElementLev - 1,
                          NewElement = Element#element_info{lev =
                                                                NewElementLev},
                          NewElementInfo = lists:keystore(Type,
                                                          #element_info.build_type,
                                                          ElementInfo,
                                                          NewElement),
                          ElementGuild = Guild#guild{element_info =
                                                         NewElementInfo,
                                                     flag = 1},
                          NewGuild = lev_trigger(ElementGuild, Guild, element),
                          {true, NewGuild, NewElementLev};
                      _Err ->
                          logger:debug("=======:~w", [_Err], guild_build, 813),
                          {false, lang:get("升级中的建筑无法拆除")}
                  end;
              true -> {false, lang:get("升级中的建筑无法拆除")}
           end,
    case Data of
        {false, Reason} ->
            role:pack_send(RolePid, 11117, {0, Reason}),
            ok;
        {true, LGuild, NewLev} ->
            Now = date:unixtime(),
            NewTodayDestory = case date:is_same_day(Now,
                                                    LastDestory)
                                  of
                                  true -> TodayDestory + 1;
                                  _ -> 1
                              end,
            LGuild1 =
                calc_guild_upkeep(LGuild#guild{last_build_destory = Now,
                                               today_destory_build =
                                                   NewTodayDestory}),
            LastGuild = guild_common:add_event(LGuild1,
                                               3,
                                               [Type, NewLev]),
            push_11113(LastGuild),
            do_async_destory(T, LastGuild, Type, RoleId, RolePid)
    end.

downgrade(Guild = #guild{lev = Lev}) when Lev > 1 ->
    Guild1 = Guild#guild{lev = Lev - 1, flag = 1},
    Guild2 = lev_trigger(Guild1, Guild, guild),
    Guild3 = calc_guild_upkeep(Guild2),
    LastGuild = guild_common:add_event(Guild3,
                                       3,
                                       [0, Lev - 1]),
    push_11113(LastGuild),
    LastGuild.

lev_cast(Type,
         G = #guild{members = Mem, name = GuildName,
                    lev = GuildLev, academy_lev = AcademyLev,
                    exchequer_lev = ExchequerLev, store_lev = StoreLev,
                    max_assets = MaxAssets, element_info = ElementInfo}) ->
    {Lev, Welfare} = case Type of
                         0 ->
                             case GuildLev =:= 3 orelse GuildLev >= 5 of
                                 true ->
                                     Msg1 =
                                         notice:format(lang:get("~ts公会已提升至~ts级，公会繁荣兴旺、实力大增！"),
                                                       [{string_2,
                                                         2,
                                                         GuildName},
                                                        {string_2,
                                                         5,
                                                         GuildLev}]),
                                     notice:cast(all, 5, Msg1);
                                 _ -> ok
                             end,
                             Wmsg =
                                 notice:format(lang:get("资金上限提升至~ts，其他建筑等级上限提升至~ts！"),
                                               [{string_2, 5, MaxAssets},
                                                {string_2, 5, GuildLev}]),
                             {GuildLev, Wmsg};
                         1 ->
                             Wmsg = lang:get("所有成员的每日工资得到提升！"),
                             {AcademyLev, Wmsg};
                         2 ->
                             Wmsg =
                                 notice:format(lang:get("成员容纳人数提至~ts人，新秀容纳人数提升至~ts人！"),
                                               [{string_2,
                                                 5,
                                                 G#guild.max_mem_num},
                                                {string_2,
                                                 5,
                                                 G#guild.max_fresh_num}]),
                             {ExchequerLev, Wmsg};
                         3 -> {StoreLev, lang:get("开启更多可购买道具！")};
                         _ when Type >= 4 andalso Type =< 10 ->
                             case lists:keyfind(Type,
                                                #element_info.build_type,
                                                ElementInfo)
                                 of
                                 #element_info{lev = BuildLev} ->
                                     {BuildLev, lang:get("")};
                                 _ -> {0, ""}
                             end;
                         _ -> {0, ""}
                     end,
    Msg = case Type of
              11 ->
                  Title = lang:get("元素祭坛开启"),
                  Content =
                      notice:format(lang:get("电闪雷鸣，元素欢动，经过全体成员的不懈努力，本公会现已成功建造~ts，成员祈福后即可获得元"
                                             "素的祝福，可前往~ts查看{face_1, 7}{face_1, 7}"),
                                    [{string_2, 1, lang:get("元素祭坛")},
                                     {string_2, 1, lang:get("公会领地")}]),
                  [mail:send(Id, Title, Content)
                   || #guild_role{id = Id} <- Mem],
                  notice:format(lang:get("{face_1, 38}电闪雷鸣，元素欢动，本公会现已成功建造~ts{face_1, "
                                         "38}，公会成员祈福后即可获得元素的~ts，一段时间内能力大大提升，可前往~ts查看~ts"
                                         ""),
                                [{string_2, 5, lang:get("元素祭坛")},
                                 {string_2, 5, lang:get("祝福")},
                                 {string_2, 5, lang:get("公会领地")},
                                 {guildpray_1, 11134, 2, lang:get("前往查看")}]);
              _ when Type >= 4 andalso Type =< 10 ->
                  case Lev rem 5 =:= 0 of
                      true ->
                          notice:format(lang:get("元素祭坛的~ts提升至~ts级，该元素能够赐予的祝福效果更强了"),
                                        [{string_2,
                                          1,
                                          guild_util:build_to_name(Type)},
                                         {string_2, 5, Lev}]);
                      false -> lang:get("")
                  end;
              _ ->
                  notice:format(lang:get("经过大家的努力，~ts提升至~ts级，~ts"),
                                [{string_2, 1, guild_util:build_to_name(Type)},
                                 {string_2, 5, Lev},
                                 {string_1, Welfare}])
          end,
    case Msg of
        [_ | _] -> guild:notice(Mem, Msg);
        _ -> ok
    end,
    ok.

calc_guild_upkeep(State = #guild{lev = Lev,
                                 academy_lev = AcademyLev, store_lev = StoreLev,
                                 exchequer_lev = ExchequerLev,
                                 element_info = ElementInfo}) ->
    UpKeep1 = case guild_data:uplev(Lev) of
                  #{upkeep := Uk1} -> Uk1;
                  _ -> 0
              end,
    UpKeep2 = case guild_data:academy(AcademyLev) of
                  #{upkeep := Uk2} -> Uk2;
                  _ -> 0
              end,
    UpKeep3 = case guild_data:exchequer(ExchequerLev) of
                  #{upkeep := Uk3} -> Uk3;
                  _ -> 0
              end,
    UpKeep5 = case guild_data:store(StoreLev) of
                  #{upkeep := Uk5} -> Uk5;
                  _ -> 0
              end,
    UpKeep6 = calc_element_upkeep(ElementInfo, 0),
    logger:debug("元素维护:~w", [UpKeep6], guild_build, 917),
    UpKeep = UpKeep1 + UpKeep2 + UpKeep3 + UpKeep5 +
                 UpKeep6,
    State#guild{upkeep = UpKeep, flag = 1}.

calc_element_upkeep([], UpKeep) -> UpKeep;
calc_element_upkeep([#element_info{build_type = BType,
                                   lev = Lev}
                     | Rest],
                    UpKeep) ->
    case guild_data:get_element({Lev, BType}) of
        #{upkeep := UseUpKeep} ->
            calc_element_upkeep(Rest, UseUpKeep + UpKeep);
        _ -> calc_element_upkeep(Rest, UpKeep)
    end.

lev_trigger(Guild = #guild{lev = Lev}, _OldGuild,
            guild) ->
    Guild1 = case guild_data:uplev(Lev) of
                 #{assets_limit := MaxAssets} ->
                     Guild#guild{max_assets = MaxAssets};
                 _ ->
                     logger:debug("找不到配置 ~w", [Lev], guild_build, 938),
                     Guild
             end,
    Guild2 = #guild{members = Members} = active(Guild1),
    camp_web:guild_push(Guild2),
    [role:apply(async,
                Pid,
                {guild_role, set, [{guild_lev, Lev}]})
     || #guild_role{status = 1, pid = Pid} <- Members,
        is_pid(Pid)],
    Guild2;
lev_trigger(Guild = #guild{exchequer_lev =
                               ExchequerLev},
            _OldGuild, exchequer) ->
    case guild_data:exchequer(ExchequerLev) of
        #{mem := Mem, fresh := Fresh} ->
            Guild#guild{max_mem_num = Mem, max_fresh_num = Fresh};
        _ ->
            logger:debug("找不到配置 ~w",
                         [ExchequerLev],
                         guild_build,
                         951),
            Guild
    end;
lev_trigger(Guild = #guild{}, _OldGuild, store) ->
    Guild1 = store_tick(Guild),
    Guild1;
lev_trigger(Guild, _, _) -> Guild.

get_store(#role{m_guild = #m_guild{id = Gid},
                id = RoleId}) ->
    case guild_mgr:attr(Gid, #guild.store_list) of
        [H | T] -> store_info([H | T], RoleId);
        {error, guild_not_exists} -> [];
        _ -> []
    end.

get_store_time(#guild{}, Pid) when is_pid(Pid) ->
    GoodsTime = get_store_goods_time(),
    TickTime = date:next_diff(GoodsTime),
    role:pack_send(Pid, 11120, {TickTime}),
    ok;
get_store_time(_, _) -> ok.

store_info(StoreList, RoleId) ->
    Fun = fun ({Id, BaseId, Num, Price, Limit, Log},
               List) ->
                  RoleNum = case lists:keyfind(RoleId, 1, Log) of
                                {_, N} -> N;
                                _ -> 0
                            end,
                  [{Id, BaseId, Num, Price, Limit, RoleNum} | List]
          end,
    lists:foldl(Fun, [], StoreList).

get_normal_goods(Role = #role{m_guild =
                                  #m_guild{id = GuildId}}) ->
    case guild_data:store_effect(guild_mgr:attr(GuildId,
                                                #guild.store_lev))
        of
        #{normal_goods := GoodsIds} ->
            do_normal_goods(GoodsIds,
                            var:get_var(Role, day, 28, []));
        _ -> []
    end.

do_normal_goods([], _) -> [];
do_normal_goods([Id | T], Log) ->
    case guild_data:store_item(Id) of
        {Id, BaseId, _AllNum, Price, Limit} ->
            RoleNum = case lists:keyfind(Id, 1, Log) of
                          {_, N} -> N;
                          _ -> 0
                      end,
            [{Id, BaseId, Price, Limit, RoleNum}
             | do_normal_goods(T, Log)];
        _ -> do_normal_goods(T, Log)
    end.

buy_normal_goods(Role = #role{m_guild =
                                  #m_guild{id = GuildId}},
                 Id, Num) ->
    case guild_data:store_effect(guild_mgr:attr(GuildId,
                                                #guild.store_lev))
        of
        #{normal_goods := GoodsIds} ->
            case lists:member(Id, GoodsIds) of
                true ->
                    case check_buy_normal(var:get_var(Role, day, 28, []),
                                          Id,
                                          Num)
                        of
                        {ok, BaseId, Price, Log} ->
                            Role1 = var:set_var(Role, day, 28, Log),
                            Loss = format:val_to_loss(Price),
                            Gain = format:val_to_gain([{BaseId, Num}]),
                            case role_gain:do(Gain ++ Loss, Role1) of
                                {ok, NewRole} -> {ok, NewRole};
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        Else -> Else
                    end;
                _ -> {false, lang:get("当前商店没有这个商品")}
            end;
        _ -> {false, lang:get("当前商店没有商品")}
    end.

check_buy_normal(Log, Id, Num) ->
    case guild_data:store_item(Id) of
        {Id, BaseId, _AllNum, Price, Limit} ->
            RoleNum = case lists:keyfind(Id, 1, Log) of
                          {_, N} -> N;
                          _ -> 0
                      end,
            case Limit =/= 0 andalso Limit < Num + RoleNum of
                true -> {false, lang:get("没有足够的道具出售")};
                _ ->
                    {ok,
                     BaseId,
                     [{K, V * Num} || {K, V} <- Price],
                     lists:keystore(Id, 1, Log, {Id, Num + RoleNum})}
            end;
        _ ->
            logger:error("找不到商品信息 ~w", [Id], guild_build, 1057),
            {false, lang:get("找不到商品信息")}
    end.

buy_store(Role = #role{m_guild =
                           #m_guild{id = Gid, pid = GuildPid}},
          Id, Num)
    when is_pid(GuildPid) ->
    case guild_mgr:attr(Gid, #guild.store_list) of
        [H | T] -> buy_store(Role, Id, Num, [H | T]);
        {error, guild_not_exists} ->
            {false, lang:get("你尚未加入公会"), 0};
        _ -> {false, lang:get("你尚未加入公会"), 0}
    end.

buy_store(Role = #role{id = RoleId, pid = RolePid,
                       m_guild =
                           #m_guild{pid = GuildPid, enter_time = EnterTime}},
          Id, Num, StoreList) ->
    Now = date:unixtime(),
    case Now - EnterTime < 86400 of
        true ->
            Msg =
                notice:format(lang:get("您加入公会的时间少于~ts天，不能购买公会~ts"),
                              [{string_2, 6, "1"}, {string_2, 1, "共享商品"}]),
            {false, Msg, 0};
        false ->
            case check_buy_store(StoreList, Id, Num, RoleId) of
                {true, {_Id, BaseId, _N, Price, _Limit, _Log}} ->
                    AllPrice = [{Name, Val * Num} || {Name, Val} <- Price],
                    Loss = format:val_to_loss(AllPrice),
                    Gain = format:val_to_gain([{BaseId, Num}]),
                    case role_gain:do(Loss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg, 0};
                        {ok, Nr} ->
                            case role_gain:do(Gain, Nr) of
                                {false, #gain{msg = Msg}} -> {false, Msg, 0};
                                {ok, Nr1} ->
                                    case guild_mgr:apply(sync,
                                                         GuildPid,
                                                         {fun sync_buy_store/5,
                                                          [Id,
                                                           Num,
                                                           RoleId,
                                                           RolePid]})
                                        of
                                        {false, Reason, Flag} ->
                                            {false, Reason, Flag};
                                        true -> {true, Nr1};
                                        _Err ->
                                            logger:error("购买商店道具时出错,Reason:~w",
                                                         [_Err],
                                                         guild_build,
                                                         1092),
                                            {false, lang:get("公会繁忙,请稍后尝试"), 0}
                                    end
                            end
                    end;
                {false, Reason, Flag} -> {false, Reason, Flag}
            end
    end.

sync_buy_store(Guild = #guild{store_list = StoreList,
                              members = Members},
               Id, Num, RoleId, _RolePid) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        #guild_role{} ->
            case check_buy_store(StoreList, Id, Num, RoleId) of
                {true, {Id, BaseId, N, Price, 0, Log}} ->
                    NewStore = {Id, BaseId, N - Num, Price, 0, Log},
                    NewStoreList = lists:keystore(Id,
                                                  1,
                                                  StoreList,
                                                  NewStore),
                    NewGuild = Guild#guild{store_list = NewStoreList,
                                           flag = 1},
                    guild:sync_cache(NewGuild),
                    {ok, true, NewGuild};
                {true, {Id, BaseId, N, Price, Limit, Log}} ->
                    D = case lists:keyfind(RoleId, 1, Log) of
                            {_, Rn} -> {RoleId, Rn + Num};
                            _ -> {RoleId, Num}
                        end,
                    NewLog = lists:keystore(RoleId, 1, Log, D),
                    NewStore = {Id, BaseId, N - Num, Price, Limit, NewLog},
                    NewStoreList = lists:keystore(Id,
                                                  1,
                                                  StoreList,
                                                  NewStore),
                    NewGuild = Guild#guild{store_list = NewStoreList,
                                           flag = 1},
                    guild:sync_cache(NewGuild),
                    {ok, true, NewGuild};
                {false, Reason, Flag} -> {ok, {false, Reason, Flag}}
            end;
        _ -> {ok, {false, lang:get("非本公会成员无法购买"), 0}}
    end.

check_buy_store(StoreList, Id, Num, RoleId) ->
    case lists:keyfind(Id, 1, StoreList) of
        {_Id, _BaseId, N, _P, _Limit, _Log} when Num > N ->
            {false, lang:get("没有足够的道具出售"), 1};
        Store = {_Id, _BaseId, _N, _Price, 0, _Log} ->
            {true, Store};
        Store = {_Id, _BaseId, _N, _Price, Limit, Log} ->
            case lists:keyfind(RoleId, 1, Log) of
                {_, Rn} when Rn + Num > Limit ->
                    {false, lang:get("个人购买数量超过上限, 无法购买"), 1};
                {_, _Rn} -> {true, Store};
                false when Num > Limit ->
                    {false, lang:get("个人购买数量超过上限, 无法购买"), 1};
                false -> {true, Store}
            end;
        _ -> {false, lang:get("当前商店没有该道具出售"), 1}
    end.

get_store_goods_time() ->
    case erlang:get(store_goods_time) of
        {GH, GM, 0} -> {GH, GM, 0};
        _ ->
            M1 = util:rand(0, 30),
            erlang:put(store_goods_time, {21, M1, 0}),
            {21, M1, 0}
    end.

store_tick(Guild = #guild{members = Members},
           check_time) ->
    {_, Now} = date:seconds_to_datetime(date:unixtime()),
    GoodsTime = {_, Minute, _} = get_store_goods_time(),
    case Now of
        GoodsTime -> store_tick(Guild);
        {16, 0, _} ->
            case get(guild_store_tick_ref) of
                Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
                _ -> skip
            end,
            Time = guild_build:get_store_next(),
            NewRef = erlang:send_after(Time, self(), store_tick),
            put(guild_store_tick_ref, NewRef),
            Msg =
                notice:format(lang:get("公会商店中的~ts已经被附近的居民抢购一空，没买到的成员请期待下一次补货吧！"),
                              [{string_2, 5, lang:get("珍稀道具")}]),
            guild:notice(Members, Msg),
            TickTime = date:next_diff(GoodsTime),
            guild:cast(Members, 11120, {TickTime}),
            Guild#guild{store_list = [], flag = 1,
                        store_tick_time = TickTime};
        Now ->
            case get(guild_store_tick_ref) of
                Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
                _ -> skip
            end,
            Time = guild_build:get_store_next(),
            NewRef = erlang:send_after(Time, self(), store_tick),
            put(guild_store_tick_ref, NewRef),
            TimeStr = case Minute < 10 of
                          true -> util:flist(lang:get("今晚21:0~w"), [Minute]);
                          _ -> util:flist(lang:get("今晚21:~w"), [Minute])
                      end,
            Msg0 =
                notice:format(lang:get("本公会商船将在~ts抵达公会领地，届时公会商店将会补充一批~ts，快准备好公会贡献来抢购吧！"),
                              [{string_2, 5, TimeStr},
                               {string_2, 5, lang:get("珍稀道具")}]),
            Msg = case Now of
                      {20, 30, _} -> Msg0;
                      {21, 0, _} -> Msg0;
                      _ -> false
                  end,
            case Msg of
                false -> ok;
                _ -> guild:notice(Members, Msg)
            end,
            TickTime = date:next_diff(GoodsTime),
            Guild#guild{flag = 1, store_tick_time = TickTime}
    end.

store_tick(Guild = #guild{store_lev = 0,
                          members = _Members}) ->
    Guild#guild{store_list = [], flag = 1,
                store_tick_time = 0};
store_tick(Guild = #guild{store_lev = StoreLev,
                          members = Members}) ->
    OldGoodsTime = get_store_goods_time(),
    NewGuild = case guild_data:store_effect(StoreLev) of
                   #{num := GetNum, id_list := IdList} ->
                       NewIdList = store_rand(IdList, GetNum),
                       Fun = fun ({Id, _}, List) ->
                                     case guild_data:store_item(Id) of
                                         {Id, BaseId, AllNum, Price, Limit} ->
                                             [{Id,
                                               BaseId,
                                               AllNum,
                                               Price,
                                               Limit,
                                               []}
                                              | List];
                                         _Err -> List
                                     end
                             end,
                       NewItemList = lists:foldl(Fun, [], NewIdList),
                       Guild#guild{store_list = NewItemList};
                   _ ->
                       logger:error("不存在[~w]级公会商店数据",
                                    [StoreLev],
                                    guild_build,
                                    1238),
                       Guild
               end,
    case get(guild_store_tick_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> skip
    end,
    Time = guild_build:get_store_next(),
    NewRef = erlang:send_after(Time, self(), store_tick),
    put(guild_store_tick_ref, NewRef),
    {_, Now} = date:seconds_to_datetime(date:unixtime()),
    TickTime = case Now of
                   OldGoodsTime ->
                       GoodsTime = get_store_goods_time(),
                       guild:cast(Members, 11120, {0}),
                       Msg =
                           notice:format(lang:get("本公会商船已经抵达公会领地，公会商店补充了一批~ts，快快带好公会贡献来选购咯！"),
                                         [{string_2, 5, lang:get("珍稀道具")}]),
                       guild:notice(Members, Msg),
                       date:next_diff(GoodsTime);
                   _ -> date:next_diff(OldGoodsTime)
               end,
    NewGuild#guild{flag = 1, store_tick_time = TickTime}.

store_rand(IdList, Num) ->
    Rate = lists:sum([R || {_, R} <- IdList]),
    store_rand(IdList, Num, Rate, []).

store_rand(_IdList, 0, _Rate, GetList) -> GetList;
store_rand([], _Num, _Rate, GetList) -> GetList;
store_rand(IdList, Num, Rate, GetList) ->
    Seed = util:rand(1, Rate),
    case do_store_rand(IdList, Seed, Rate) of
        {NewIdList, GetL, NewRate} ->
            store_rand(NewIdList,
                       Num - 1,
                       NewRate,
                       [GetL | GetList]);
        {false, Reason} ->
            logger:error("公会商店无法取货物, 内容:~w",
                         [Reason],
                         guild_build,
                         1275),
            store_rand(IdList, Num - 1, Rate, GetList)
    end.

do_store_rand(List, Seed, Rate) ->
    do_store_rand(List, Seed, Rate, 0, []).

do_store_rand([], _Seed, _Rate, _Range, _Back) ->
    {false, util:fbin("~w", [_Back])};
do_store_rand([L | T], Seed, Rate, Range, Back) ->
    Ratio = element(2, L),
    case Seed =< Ratio + Range of
        true -> {T ++ Back, L, Rate - Ratio};
        false ->
            do_store_rand(T, Seed, Rate, Range + Ratio, [L | Back])
    end.

get_store_next() ->
    GoodsTime = get_store_goods_time(),
    Time = date:next_diff([{16, 0, 0},
                           {20, 30, 0},
                           {21, 0, 0},
                           GoodsTime]),
    logger:debug("下次商店时间------> ~w",
                 [Time],
                 guild_build,
                 1293),
    Time * 1000.

post_to_salary_rate(60) -> 1.8;
post_to_salary_rate(50) -> 1.3;
post_to_salary_rate(40) -> 1.19999999999999995559;
post_to_salary_rate(30) -> 1.14999999999999991118;
post_to_salary_rate(25) -> 1.14999999999999991118;
post_to_salary_rate(20) -> 1.05;
post_to_salary_rate(_) -> 1.

lev_tick(Guild = #guild{lev = Lev, lev_time = LevTime,
                        academy_lev = AcademyLev, academy_time = AcademyTime,
                        store_lev = StoreLev, store_time = StoreTime,
                        exchequer_lev = ExchequerLev,
                        exchequer_time = ExchequerTime,
                        upgrade_element_time = UpgradeElementTime,
                        lev_ref = Ref, element_info = ElementInfo}) ->
    case is_reference(Ref) of
        true -> catch erlang:cancel_timer(Ref);
        false -> skip
    end,
    Now = date:unixtime(),
    ElementList = lists:foldl(fun (#element_info{build_type
                                                     = BType,
                                                 lev = BLev, time = BTime},
                                   Rtn) ->
                                      [{BType, BLev, BTime} | Rtn]
                              end,
                              [],
                              ElementInfo),
    NGuild = do_lev_tick(Guild,
                         Now,
                         [{0, Lev, LevTime},
                          {1, AcademyLev, AcademyTime},
                          {2, ExchequerLev, ExchequerTime},
                          {3, StoreLev, StoreTime},
                          {11, 0, UpgradeElementTime}]
                             ++ ElementList,
                         0),
    guild_trigger:fire(#g_evt_lev{}, NGuild).

do_lev_tick(Guild, _Now, [], 0) ->
    calc_guild_upkeep(Guild#guild{lev_ref = undefined});
do_lev_tick(Guild, _Now, [], Time) ->
    Ref = erlang:send_after(Time * 1000, self(), lev_tick),
    calc_guild_upkeep(Guild#guild{lev_ref = Ref});
do_lev_tick(Guild, Now, [{_, _, 0} | T], Time) ->
    do_lev_tick(Guild, Now, T, Time);
do_lev_tick(Guild = #guild{id = GuildId,
                           element_info = ElementInfo},
            Now, [{Type, Lev, TypeTime} | T], Time) ->
    case Now >= TypeTime of
        true ->
            NewGuild = case Type of
                           0 ->
                               lev_trigger(Guild#guild{lev = Lev + 1,
                                                       lev_time = 0,
                                                       limit_mode = 0},
                                           Guild,
                                           guild);
                           1 ->
                               lev_trigger(Guild#guild{academy_lev = Lev + 1,
                                                       academy_time = 0,
                                                       limit_mode = 0},
                                           Guild,
                                           academy);
                           2 ->
                               lev_trigger(Guild#guild{exchequer_lev = Lev + 1,
                                                       exchequer_time = 0,
                                                       limit_mode = 0},
                                           Guild,
                                           exchequer);
                           3 ->
                               lev_trigger(Guild#guild{store_lev = Lev + 1,
                                                       store_time = 0,
                                                       limit_mode = 0},
                                           Guild,
                                           store);
                           11 ->
                               lev_trigger(Guild#guild{upgrade_element_time =
                                                           0},
                                           Guild,
                                           element);
                           _ when Type >= 4 andalso Type =< 10 ->
                               case lists:keyfind(Type,
                                                  #element_info.build_type,
                                                  ElementInfo)
                                   of
                                   Element = #element_info{lev = BuildLev} ->
                                       NewElement = Element#element_info{lev =
                                                                             BuildLev
                                                                                 +
                                                                                 1,
                                                                         time =
                                                                             0},
                                       NewElementInfo = lists:keystore(Type,
                                                                       #element_info.build_type,
                                                                       ElementInfo,
                                                                       NewElement),
                                       update_max_element(NewElementInfo),
                                       ElementGuild = Guild#guild{element_info =
                                                                      NewElementInfo},
                                       lev_trigger(ElementGuild,
                                                   Guild,
                                                   element);
                                   _ -> Guild
                               end;
                           _Err ->
                               logger:error("错误的建筑升级类型:~w",
                                            [_Err],
                                            guild_build,
                                            1356),
                               Guild
                       end,
            push_11113(NewGuild),
            lev_cast(Type, NewGuild),
            ets:insert(guild_build_accelerate_info, {GuildId, []}),
            do_lev_tick(NewGuild, Now, T, Time);
        false ->
            case Time of
                0 -> do_lev_tick(Guild, Now, T, TypeTime - Now);
                _ ->
                    do_lev_tick(Guild, Now, T, min(TypeTime - Now, Time))
            end
    end.

get_element_unlock_assets() ->
    lists:foldl(fun (BuildType, Rtn) ->
                        case guild_data:get_element({1, BuildType}) of
                            #{need := NeedAssets} -> NeedAssets + Rtn;
                            _ -> Rtn
                        end
                end,
                0,
                [5, 6, 7, 8, 9, 10]).

get_element_cost_assets() ->
    lists:foldl(fun (BuildType, Rtn) ->
                        case guild_data:get_element({1, BuildType}) of
                            #{cost := CostAssets} -> CostAssets + Rtn;
                            _ -> Rtn
                        end
                end,
                0,
                [5, 6, 7, 8, 9, 10]).

init_element_info() ->
    Fun = fun (BuildType, Rtn) ->
                  Element = #element_info{build_type = BuildType},
                  [Element | Rtn]
          end,
    lists:foldl(Fun, [], [5, 6, 7, 8, 9, 10]).

get_left_time(#guild{academy_time = AcademyTime,
                     exchequer_time = ExchequerTime, store_time = StoreTime,
                     lev_time = LevTime, element_info = ElementInfo},
              Type) ->
    case Type of
        0 -> LevTime;
        1 -> AcademyTime;
        2 -> ExchequerTime;
        3 -> StoreTime;
        _ when Type >= 4 andalso Type =< 10 ->
            case lists:keyfind(Type,
                               #element_info.build_type,
                               ElementInfo)
                of
                #element_info{time = BuildTime} -> BuildTime;
                _ -> 0
            end;
        _ -> 0
    end.

gm_set_element_lev(#role{m_guild = MGuild}, Lev) ->
    case MGuild of
        #m_guild{pid = GuildPid} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {fun sync_set_element/2, [Lev]})
                of
                ok -> ok;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("升级公会时发生异常:~w", [_Err], guild_build, 1417),
                    {false, lang:get("公会繁忙，请稍后再尝试")}
            end;
        _ -> {false, lang:get("您没有公会，不能进行解锁")}
    end.

sync_set_element(Guild = #guild{}, Lev) ->
    Fun = fun (BuildType, Rtn) ->
                  Element = #element_info{build_type = BuildType,
                                          lev = Lev},
                  [Element | Rtn]
          end,
    NewElementInfo = lists:foldl(Fun,
                                 [],
                                 [5, 6, 7, 8, 9, 10]),
    {ok, ok, Guild#guild{element_info = NewElementInfo}}.

update_max_element(ElementInfo) ->
    TotalLevFun = fun (#element_info{lev = Lev}, Rtn) ->
                          Lev + Rtn
                  end,
    TotalLev = lists:foldl(TotalLevFun, 0, ElementInfo),
    case env:get(max_element_info) of
        MaxEmtInfo = [_ | _] ->
            MaxTotalLev = lists:foldl(TotalLevFun, 0, MaxEmtInfo),
            case TotalLev > MaxTotalLev of
                true -> env:save(max_element_info, ElementInfo);
                false -> ok
            end;
        _ -> env:save(max_element_info, ElementInfo)
    end.

get_max_element(Type) ->
    case env:get(max_element_info) of
        MaxEmtInfo = [_ | _] ->
            TotalLevFun = fun (#element_info{lev = Lev}, Rtn) ->
                                  Lev + Rtn
                          end,
            MaxTotalLev = lists:foldl(TotalLevFun, 0, MaxEmtInfo),
            case lists:keyfind(Type,
                               #element_info.build_type,
                               MaxEmtInfo)
                of
                #element_info{lev = Lev} -> {Lev, MaxTotalLev};
                _ -> {0, MaxTotalLev}
            end;
        _ -> {0, 0}
    end.

get_max_element() ->
    case env:get(max_element_info) of
        MaxEmt = [_ | _] -> MaxEmt;
        _ -> []
    end.

calc_uplev_cost(ElementInfo, BuildType) ->
    TotalLevFun = fun (#element_info{lev = Lev}, Rtn) ->
                          Lev + Rtn
                  end,
    TotalLev = lists:foldl(TotalLevFun, 0, ElementInfo),
    case lists:keyfind(BuildType,
                       #element_info.build_type,
                       ElementInfo)
        of
        #element_info{lev = Lev} ->
            case guild_data:get_element({Lev + 1, BuildType}) of
                #{cost := Cost} ->
                    case get_max_element(BuildType) of
                        {MaxLev, MaxTotalLev} when Lev < MaxLev - 5 ->
                            DampLev = MaxTotalLev - TotalLev,
                            DampCostRatio =
                                guild_data:get_element_cost_damp(DampLev),
                            logger:debug("消耗资金参数:~w",
                                         [{DampLev, DampCostRatio}],
                                         guild_build,
                                         1479),
                            round(Cost * DampCostRatio / 1000);
                        _ -> Cost
                    end;
                _ -> {false, lang:get("配置错误")}
            end;
        _ -> {false, lang:get("还未进行解锁，无法建造")}
    end.

update_role_accelerate(GuildId, RoleId, Cost) ->
    TotalCount = case
                     ets:lookup(guild_build_accelerate_info, GuildId)
                     of
                     [{_, AccelerateList}] ->
                         case lists:keyfind(RoleId, 1, AccelerateList) of
                             {_, AccelerateCount} ->
                                 NewAccelerateCount = AccelerateCount + Cost,
                                 NewAccelerateList = lists:keystore(RoleId,
                                                                    1,
                                                                    AccelerateList,
                                                                    {RoleId,
                                                                     NewAccelerateCount}),
                                 ets:insert(guild_build_accelerate_info,
                                            {GuildId, NewAccelerateList}),
                                 NewAccelerateCount;
                             _ ->
                                 NewAccelerateCount = Cost,
                                 NewAccelerateList = lists:keystore(RoleId,
                                                                    1,
                                                                    AccelerateList,
                                                                    {RoleId,
                                                                     NewAccelerateCount}),
                                 ets:insert(guild_build_accelerate_info,
                                            {GuildId, NewAccelerateList}),
                                 NewAccelerateCount
                         end;
                     _ ->
                         NewAccelerateCount = Cost,
                         NewAccelerateList = [{RoleId, NewAccelerateCount}],
                         ets:insert(guild_build_accelerate_info,
                                    {GuildId, NewAccelerateList}),
                         NewAccelerateCount
                 end,
    role:pack_send(RoleId, 11198, {TotalCount}),
    ok.

sync_change_accelerate_limit_mod(Guild, RoleId,
                                 LimitMode) ->
    do_change_accelerate_limit_mod([check, set],
                                   Guild,
                                   RoleId,
                                   LimitMode).

do_change_accelerate_limit_mod([],
                               Guild = #guild{members = Members}, _RoleId,
                               LimitMode) ->
    guild:sync_cache(Guild),
    guild:cast(Members, 11199, {LimitMode}),
    {ok, ok, Guild};
do_change_accelerate_limit_mod([check | Rest],
                               Guild = #guild{members = Members}, RoleId,
                               LimitMode) ->
    case guild_role:check_fun(RoleId, Members, upbuild) of
        false ->
            {false, lang:get("会长设置了贡献额度，可不要多点哟{face_1, 22}")};
        {true, _Gr} ->
            do_change_accelerate_limit_mod(Rest,
                                           Guild,
                                           RoleId,
                                           LimitMode)
    end;
do_change_accelerate_limit_mod([set | Rest],
                               Guild = #guild{pid = GuildPid}, RoleId,
                               LimitMode) ->
    NewGuild = Guild#guild{limit_mode = LimitMode},
    Msg =
        notice:format(lang:get("会长已经解除了对建筑升级的贡献额度，快贡献一份力量加速建设升级吧！~ts"),
                      [{panel_2, 11104, 1, lang:get("我要贡献")}]),
    guild:notice(GuildPid, Msg),
    do_change_accelerate_limit_mod(Rest,
                                   NewGuild,
                                   RoleId,
                                   LimitMode).

