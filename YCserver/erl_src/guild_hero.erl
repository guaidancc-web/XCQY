-file("src/mod/guild/guild_hero.erl", 1).

-module(guild_hero).

-behaviour(gen_fsm).

-export([start_link/1,
         login/1,
         arrange/3,
         join/1,
         join_to_follow/2,
         leave/1,
         combat_over/1,
         cast_enemy/3,
         check_pick/2,
         pick_gain/2,
         info/1,
         is_arranging/0,
         leader_leave/2,
         push/2,
         role_callback/2,
         role_callback/4,
         m/1]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, plan/2, ready/2, active/2]).

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

-file("src/mod/guild/guild_hero.erl", 34).

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

-file("src/mod/guild/guild_hero.erl", 35).

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

-file("src/mod/guild/guild_hero.erl", 36).

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

-file("src/mod/guild/guild_hero.erl", 37).

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

-file("src/mod/guild/guild_hero.erl", 38).

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

-file("src/mod/guild/guild_hero.erl", 39).

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

-file("src/mod/guild/guild_hero.erl", 40).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/guild/guild_hero.erl", 41).

-file("inc/guild_war.hrl", 1).

-record(guild_war_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 1000 :: non_neg_integer(),
         match_id = {1, 0},
         side = 1,
         pid :: undefined | reference(),
         type = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         team_status = 0,
         team_fc = 0,
         team_len = 0}).

-record(guild_war_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0},
         ver = 2,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = {1, 0},
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         week_assets = 0 :: non_neg_integer()}).

-record(guild_war_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         type = 0,
         combat_time = 0}).

-record(guild_war_alliance,
        {id = {{0, 0}, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = {0, 0},
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_platform = "",
         map_zone_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_hero.erl", 42).

-file("inc/combat.hrl", 1).

-record(combat,
        {type :: undefined | non_neg_integer(),
         pid :: undefined | pid(),
         result :: undefined | integer(),
         round = 1 :: non_neg_integer(),
         start_args :: undefined | tuple(),
         observers = [],
         winner = [],
         loser = [],
         atk_formation = 1,
         atk_formation_lev = 1,
         dfd_formation = 1,
         dfd_formation_lev = 1,
         waiting_join = [],
         cur_plot = 0,
         waiting_next_wave = [] :: [tuple()],
         all_waiting_next_wave = [],
         ts,
         start_time = 0 :: non_neg_integer(),
         t_play = 0 :: integer(),
         t_idle = 500 :: integer(),
         assign_gains = [],
         ratio_val = 0,
         start_failed_reason :: undefined | atom()}).

-record(fighter,
        {id = 0 :: non_neg_integer(),
         pid = 0 :: non_neg_integer() | pid(),
         type = 1,
         name = "",
         group = 0,
         classes = 0,
         sex = 0,
         face_id = 0,
         hp = 0,
         mp = 0,
         hp_max = 0,
         tmp_hp_max = 0,
         mp_max = 0,
         lev = 0,
         looks = [],
         is_die = 0,
         is_die_disappear = 0,
         is_escape = 0,
         is_defence = 0,
         is_radiance = 0,
         is_leader = 0,
         self_preside_status = 0,
         self_preside_text = "",
         target_preside_status = 0,
         target_preside_text = "",
         rid = 0,
         platform = "",
         zone_id = 0,
         origin_id,
         base_id = 0 :: non_neg_integer(),
         lover,
         res_id = 0,
         active_skills = [],
         passive_skills = [],
         halo_skills = [],
         has_use_item = 0,
         buffs = [],
         buff_infos = [],
         skill_cooldown = [],
         skill_infos = [],
         pet_skill_infos = [],
         child_skill_infos = [],
         last_skill = 0,
         attr,
         combat_init_attr,
         combat_dynamic_attr,
         pet_attr,
         m_init,
         action_num = 0,
         formation = 1,
         formation_lev = 1,
         pos = 0,
         order = 0,
         combat_statistics,
         result = 3,
         is_ai_action = 0,
         pre_action,
         action,
         talk = "",
         special_status,
         special_attr,
         s_event = 0,
         s_event_pid,
         active_pet,
         backup_pets = [],
         active_child,
         backup_childs = [],
         has_summon_pet = 0,
         active_guard = [],
         team_guard = [],
         is_hosted = 0,
         is_ready = 0,
         is_auto = 0,
         is_double_point = 0,
         plot = {id, [], []},
         max_catch_num = 0,
         catched = [],
         learn_skills = [],
         m_dungeon,
         anti_heal = 0,
         anger = 0,
         skill_prac_atk = 0,
         skill_prac_phy_def = 0,
         skill_prac_magic_def = 0,
         m_lev_break,
         sworn_id,
         dun_args,
         ext_args = [],
         talisman = [],
         master_pid = 0,
         master_fid = 0,
         master_pos = 0,
         combat_talk = [],
         guard_pid = 0,
         guard_fid = 0,
         guard_pos = 0,
         cost_mp_ratio = 1000,
         slave = [],
         unit_type = 0,
         ratio_val = 0,
         unit_fun_type = 0,
         ai_id = 0,
         ai = {[], []},
         ext = [],
         skill_plan = [],
         hook_index = 1,
         force_is_auto = 0}).

-record(combat_start_args,
        {common_referee :: undefined | pid(),
         other_referees = [] :: [{atom(), pid()}],
         ext_args = [] :: [{atom(), term()}],
         max_guard = 4}).

-record(combat_over_calc_data,
        {fighter :: undefined | tuple(),
         combat_result :: undefined | non_neg_integer(),
         rewards = [] :: [tuple()],
         record :: undefined | tuple()}).

-record(c_observer,
        {role_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         group = 0}).

-record(m_combat,
        {ver = 3 :: pos_integer(),
         pid :: undefined | pid(),
         observe_pid :: undefined | pid(),
         is_debug = 0 :: 0..1,
         ext = [] :: [tuple()],
         self_preside = [],
         target_preside = [],
         combat_type = 0}).

-record(m_combat_init,
        {skills = [] ::
             [{non_neg_integer(), non_neg_integer()}],
         talents = [],
         wing_skills = [],
         eff_skills = [],
         guard_skills = []}).

-record(fighter_wrap,
        {fighter,
         combat_pid = 0,
         s_event,
         m_team,
         status,
         s_action,
         pos :: undefined | tuple(),
         combat_type = 0}).

-record(c_item,
        {item_id,
         base_id :: undefined | non_neg_integer(),
         step = 0,
         target_type :: undefined | non_neg_integer(),
         skill_id = 0,
         skill_lev = 0,
         script_id :: undefined | non_neg_integer(),
         script_args = [] :: [integer()],
         buff_self = [],
         buff_target = [],
         anti_heal = 0,
         can_effect = 0,
         action :: undefined | function()}).

-record(c_skill,
        {id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         passive_type = [] :: non_neg_integer(),
         act_flag = undefined,
         type_flag = undefined,
         use_type = {live, live},
         special_type = [],
         skill :: undefined | tuple(),
         action_no = 1 :: non_neg_integer(),
         target_no = 1 :: non_neg_integer(),
         keep_kill_num = 0 :: non_neg_integer(),
         action :: undefined | {atom(), list()},
         ext_args = [] :: [{atom(), non_neg_integer()}],
         trigger_before = [] ::
             [{{atom(), atom()}, [integer()]}],
         trigger_after = [] :: [{{atom(), atom()}, [integer()]}],
         reduce_dmg = 1000,
         reduce_heal = 1000,
         action_msg = "",
         pursue_attack = 0,
         pursue_skill_attack = 0,
         passive_args,
         variety_base}).

-record(c_buff_base,
        {id,
         eff_type = buff :: buff | debuff,
         type = 1,
         max_layer = 1,
         script_id = 0}).

-record(c_buff,
        {id :: undefined | non_neg_integer(),
         type,
         sec_type,
         layer = 1,
         script_id,
         caster_id :: undefined | non_neg_integer(),
         action_num = 0 :: non_neg_integer(),
         eff_type = buff :: buff | debuff,
         eff_sec_type = normal :: normal | control,
         hit_rate = 1000 :: non_neg_integer(),
         can_dispel = 1 :: 0..1,
         visible = 1 :: 0..1,
         time_unit = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         period = 1 :: non_neg_integer(),
         args = [],
         eff_val_before :: undefined | function(),
         eff_val_after :: undefined | function(),
         eff_before :: undefined | function(),
         eff :: undefined | function(),
         recalc :: undefined | function(),
         eff_after :: undefined | function(),
         compare :: undefined | function(),
         tips_calc :: undefined | function(),
         hit :: undefined | function(),
         can_eff :: undefined | function(),
         die_eff = 0,
         halo_eff_fighter_type = [] :: list()}).

-record(combat_statistics,
        {total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         round_dmg = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         guard = [],
         has_use_item = 0,
         total_heal = 0,
         control_num = 0,
         dispel_num = 0,
         is_die = 0,
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0,
         child_skills = [],
         die_times = 0,
         skill_use_times = [],
         after_die_done = 0,
         auto_round = []}).

-record(combat_context,
        {type :: undefined | non_neg_integer(),
         start_time = 0 :: integer(),
         round = 0,
         pos_num = 0 :: integer(),
         origin_atk = [],
         origin_dfd = [],
         playing = [],
         self_side = [],
         op_side = [],
         skill_cooldown = [],
         all_waiting_next_wave = [] :: [list()],
         passive_attack = [] :: [],
         passive_skill_attack = [],
         pursue_attack = false,
         pursue_skill_attack = false,
         pursue_attack_list = [],
         revive_self = [],
         nirvana_list = [],
         ghost_list = [],
         revive_list = [],
         kill_by_self_list = [],
         avatar_list = [],
         mate_suck_list = [],
         skill_hurt = false :: true | false,
         skill_pursue_crit = false :: true | false,
         kill_someone = false :: true | false,
         skill_crit = false :: true | false,
         skill_dmg = 0,
         action_dmg = 0,
         multi_pursue_num = 0,
         link_hurt = [],
         is_passive_attack = false,
         revive_count = 0,
         is_skill_range = false,
         fisrt_target_id = 0,
         round_die = [],
         common_cooldown = []}).

-record(passive_effect,
        {atk_addt = 0 :: non_neg_integer(),
         atk_ratio = 0 :: non_neg_integer(),
         atk_holy_addt = 0 :: non_neg_integer(),
         buff_holy_addt = 0,
         atk_holy_ratio = 0 :: non_neg_integer(),
         dmg_addt = 0 :: non_neg_integer(),
         phy_dmg_dec = 0,
         magic_dmg_dec = 0,
         dmg_ext = 0,
         dmg_ratio = 0 :: non_neg_integer(),
         dmg_ratio_add = 0,
         def_ratio = 0 :: non_neg_integer(),
         hurt_multi = 0,
         suck_hp = 0,
         kill_suck_hp = 0,
         stone_suck_hp,
         suck_mp = 0,
         suck_mp_loss = 0,
         suck_mp_max = 0,
         master_suck_hp,
         feedback = 0,
         heal_ratio = 0,
         anti_skill,
         def_anti = 0,
         crit_ratio = 0,
         hit_ratio = 0,
         dec_def_ratio = 0,
         dec_phy_def = 0,
         dec_magic_def = 0,
         dec_phy_def_ratio = 0,
         dec_magic_def_ratio = 0,
         float_dmg = 0,
         ghost_atk = 0,
         phy_dmg_ratio = 0,
         defence = 0,
         magic_dmg_ratio = 0,
         revive_self_atk = 0,
         dec_dmg_flag = 0,
         self_val_changed = [],
         self_changed = [],
         target_val_changed = [],
         target_changed = [],
         buff_self_to_self = [] :: [tuple()],
         buff_self_to_target = [] :: [tuple()],
         buff_target_to_self = [] :: [tuple()],
         buff_target_to_target = [] :: [tuple()],
         del_target_buff = [],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         talents = [],
         pet_effect = [],
         conflict_list = [],
         ext_args = [],
         flag = 0,
         injury_ratio = 0,
         tar_ignore_die_ratio = 0,
         target_def_add_buff = [],
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_init_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         magic_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         item_effect_ratio = 0,
         eff_item_effect_ratio = 0,
         can_be_crit = 1,
         anti_poison = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         def_anger_ratio = 0,
         use_anger_ratio = 1000,
         debuff_buff_expire_ratio = {0, 0, 0},
         dec_ghost_ratio = 0,
         heal_crit_ratio = 0,
         eff_revive_ratio = 0,
         eff_heal_val = 0,
         add_chaos_ratio = 0,
         sworn_protect,
         anti_crit_ratio = 0,
         atk_not_anger = 0,
         hit_ratio = 0,
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_dynamic_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         phy_hurt_ratio = 0,
         magic_hurt_ratio = 0,
         phy_final_hurt_ratio = 0,
         magic_final_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         buff_reduce_dmg = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         eff_heal_val = 0,
         feedback = 0,
         reduce_dmg = 0,
         stone_reduce_dmg = 0,
         accuracy = 0,
         phy_accuracy = 0,
         magic_accuracy = 0,
         evasion = 0,
         phy_evasion = 0,
         magic_evasion = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         can_attack_stealth = 0,
         buff_reduce_dmg_max = 0,
         mirror_feedback_rate = 0}).

-record(special_attr,
        {absorb_shield = 0,
         absorb_shield_type = 0,
         absorb_order = 0,
         absorb_shield_suck = 0,
         absorb_dmg = 0,
         magic_absorb_dmg = 0,
         model_order = 0,
         immunity = 0,
         has_immunity = 0,
         pre_action,
         next_action_stay = 0,
         reduce_self_phy_dmg = 0,
         reduce_phy_dmg = 0,
         anti_control_ratio = 0,
         can_feedback = 1,
         fixed_feedback = 0,
         can_anti_attack = 1,
         can_revive_self = 1,
         model_id = 0,
         model_val = 0,
         fixed_dmg = 0,
         anti_ratio = 0,
         anti_times = 0,
         anti_skill = base,
         anti_dmg_ratio = 0,
         protector = undefined,
         has_nirvana = 0,
         nirvaning = 0,
         has_ghost = 0,
         ghosting = 0,
         reviving = 0,
         has_revive_self = 0,
         anti_trial = 0,
         can_attack_stealth = 0,
         control_num = 0,
         has_fearless = 0,
         add_phy_layer = 0,
         last_dispel_phy_dmg_ratio = 0,
         last_eva_phy_dmg_ratio = 0,
         round_add_magic_dmg = 0,
         sleep_layer = 0,
         stone_layer = 0,
         is_sworn_protect = 0,
         is_sworn_heal = 0,
         chaos_ratio = 300,
         round_hurt = 0,
         dec_dmg,
         multi_atk_num = 0,
         has_multi_atk = 0,
         assist_atk_ratio = 0,
         assist_atk_skill = base,
         assist_atk_hurt_ratio = 1000,
         suck_hp = 0,
         suck_times = 1,
         rebound_times = 0,
         rebound_dmg_ratio = 0,
         trap_owener = 0,
         trap_buff = [],
         trap_ratio = 0,
         be_dmg_mp_times = 0,
         flush_pet_times = 0,
         save_life_times = 0,
         elem_dmg_absorb = 0,
         wheel_dmg = 0,
         wheel_skill = 0,
         be_attack_times = undefined,
         first_target_id = 0,
         rebound_type = 1,
         iron_body_times = 0,
         hp_link = 0}).

-record(special_status,
        {is_weakness = 0,
         is_seal = 0,
         is_silent = 0 :: 0..1,
         is_rest = 0,
         is_stealth = 0,
         cannot_use_skill = 0,
         is_taunt = 0 :: 0..1,
         is_chaos = 0,
         chaos_skill = 0,
         is_stun = 0,
         is_sleep = 0,
         is_stone = 0,
         is_anti_heal = 0,
         can_crit = 1,
         cannot_revive = 0,
         taunt_pid = undefined,
         soul_link = undefined,
         buff_revive_self = undefined,
         lover_revive_self = undefined,
         dec_taunt_dmg_ratio = 0,
         can_use_anger_skill = 1,
         bleed = 0,
         energy = 0,
         modify_script = [],
         is_tempt = 0,
         tempt_ratio = 0,
         tempt_dmg = 0,
         be_attack_skills = []}).

-record(buff_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         buff_id :: undefined | non_neg_integer(),
         layer = 1 :: pos_integer(),
         time_unit = 1 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         is_hit = 1 :: 0..1,
         can_dispel = 1 :: 0..1,
         caster_id = 0 :: non_neg_integer(),
         target_id = 0 :: non_neg_integer(),
         skill_fid = 0 :: non_neg_integer(),
         target_changes = [] :: [{non_neg_integer(), integer()}],
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         tips_args = [] :: [integer()]}).

-record(summon_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         summon_type :: undefined | non_neg_integer(),
         summoner_id :: undefined | non_neg_integer(),
         summons = [] :: [tuple()]}).

-record(skill_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         skill_id = 0 :: non_neg_integer(),
         skill_lev = 1 :: non_neg_integer(),
         attack_type :: undefined | non_neg_integer(),
         self_id = 0 :: non_neg_integer(),
         self_type = 0,
         self_classes = 0,
         self_origin_id = 0,
         self_res_id = 0,
         target_id = 0 :: non_neg_integer(),
         self_changes = [] :: [{non_neg_integer(), integer()}],
         target_changes = [] :: [{non_neg_integer(), integer()}],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         is_hit = 1 :: 0..1,
         is_defence = 0 :: 0..1,
         is_crit = 0 :: 0..1,
         is_self_die = 0 :: 0..1,
         is_self_die_disappear = 0 :: 0..1,
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         talk = "" :: list(),
         action_msg = ""}).

-record(c_pet,
        {id = 0,
         ver = 6,
         base_id = 0,
         can_summon = 1,
         status = 0,
         name = "",
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         talent = 0,
         pet_attr,
         grade = 0,
         skill_plan = [],
         is_first = 0}).

-record(c_guard,
        {base_id = 0,
         war_id = 0,
         name = "",
         classes = 0,
         skills = [],
         attr,
         looks = []}).

-record(c_child,
        {id = 0,
         origin_id,
         ver = 1,
         base_id = 0,
         grade = 0,
         status = 0,
         can_summon = 1,
         name = "",
         classes = 0,
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         hungry = 0}).

-record(c_skill_addt_arg,
        {self_val_changed = [] :: [{atom(), integer()}],
         self_changed = [] :: [{non_neg_integer(), integer()}],
         target_val_changed = [] :: [{atom(), integer()}],
         target_changed = [] :: [{non_neg_integer(), integer()}],
         self_buff = [] :: [tuple()],
         target_buff = [] :: [tuple()],
         show_passive_skills = [] :: [tuple()],
         ext_args,
         skip_exec = 0,
         passive_flag,
         conflict_list = []}).

-record(action_effect,
        {can_crit = 1,
         can_feedback = 1,
         can_protect = 1,
         heal_hp = 0,
         can_anti_heal = 0,
         crit_flag = 0,
         holy_addt = 0,
         suck_hp = 0,
         mate_suck_hp = undefined,
         dec_def_ratio = 0,
         dec_magic_def_ratio = 0,
         default_atk = undefined,
         direct_dmg = undefined,
         calc_def = 0,
         hurt_multi = 1000,
         act_dmg = 0,
         hit_ratio = 0,
         crit_ratio = 0,
         crit_dmg_ratio = 0,
         act_dmg_ratio = 0,
         target_val_changes = [],
         target_changes = [],
         suck_buff,
         crit_suck_hp = 0,
         dmg_buff = [],
         injury_ratio = 0,
         extern_dmg = 0,
         act_hurt_multi = 0,
         alice_suck_max = 0}).

-record(combat_record_chat_mgr,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         msg = "",
         report_cnt = 0}).

-record(combat_record,
        {id,
         type = 1,
         ver = 10,
         atk_name = "",
         dfd_name = "",
         combat_type = 0,
         time = 0,
         frames = [],
         cited = 0,
         likes = [],
         liked = 0,
         replayed = 0,
         round = 0,
         fighters = [],
         avg_lev = 0,
         shared = 0,
         atk_sex = 0,
         atk_classes = 0,
         dfd_sex = 0,
         dfd_classes = 0,
         screen_msg = []}).

-record(combat_record_role,
        {id = {0, "", 0}, recent = [], collection = []}).

-record(combat_record_marvelous,
        {id, combat_type = 0, time = 0}).

-record(combat_record_hot,
        {id,
         combat_type = 0,
         replayed = 0,
         shared = 0,
         liked = 0,
         time = 0}).

-record(combat_record_fighter,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         group = 0}).

-file("src/mod/guild/guild_hero.erl", 43).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_hero.erl", 44).

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

-file("src/mod/guild/guild_hero.erl", 45).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/guild/guild_hero.erl", 46).

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

-file("src/mod/guild/guild_hero.erl", 47).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/guild/guild_hero.erl", 48).

-file("inc/guild_hero.hrl", 1).

-record(guild_hero_guild,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         match_id = {1, 0} ::
             {non_neg_integer(), non_neg_integer()},
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         team_leaders = [],
         acc_win = 0 :: non_neg_integer(),
         fighters = [],
         pickers = [],
         logs = [],
         last_rival = [],
         cross_group = 0 :: non_neg_integer()}).

-record(guild_hero_team_leader,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         is_win = 0 :: 0..1,
         position = 2,
         pid :: undefined | reference(),
         is_fighting = 0 :: 0..1}).

-record(guild_hero_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         round = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         gid1 = {0, "", 0},
         g_name1 = "",
         gid2 = {0, "", 0},
         g_name2 = "",
         leaders = [],
         over = 0,
         time = 0 :: non_neg_integer(),
         cross_group = 0 :: non_neg_integer()}).

-record(guild_hero_fighter,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_hero.erl", 49).

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

-file("src/mod/guild/guild_hero.erl", 50).

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

-file("src/mod/guild/guild_hero.erl", 51).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         next_id = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         finishs = [],
         match_ref :: undefined | reference(),
         open_mode = 1,
         is_cross = 0}).

login(Role = #role{s_event = 22,
                   pos =
                       Pos = #pos{map = MapId, map_base_id = MapBaseId,
                                  last =
                                      #pos_history{platform = OldP,
                                                   zone_id = OldZ, map = LMapId,
                                                   x = Lx, y = Ly}},
                   m_guild = #m_guild{id = Gid}}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [#guild_hero_guild{map_id = MapId}] ->
            case map_mgr:info(MapId) of
                {ok, _} -> {ok, Role};
                _ ->
                    NewPos = Pos#pos{platform = OldP, zone_id = OldZ,
                                     map = LMapId, x = Lx, y = Ly},
                    {ok, Role#role{pos = NewPos, s_event = 0}}
            end;
        _ when MapBaseId =:= 30006 ->
            NewPos = Pos#pos{platform = OldP, zone_id = OldZ,
                             map = LMapId, x = Lx, y = Ly},
            {ok, Role#role{pos = NewPos, s_event = 0}};
        _ -> {ok, Role#role{s_event = 0}}
    end;
login(_) -> ok.

arrange(_, _Id, Pos) when Pos < 1 orelse Pos > 3 ->
    {false, lang:get("无效的队伍安排")};
arrange(#role{m_guild = #m_guild{guild_lev = Lev}}, _Id,
        _Pos)
    when Lev < 2 ->
    {false,
     notice:format(lang:get("公会等级达到~ts才可以参与公会英雄"),
                   [{string_2, 5, 2}])};
arrange(Role = #role{m_guild = #m_guild{post = Post}},
        Id, Pos)
    when Post >= 40 ->
    Now = date:unixtime(),
    case guild_role:get(Role, Id) of
        #guild_role{name = Name, lev = Lev} when Lev < 40 ->
            {false,
             notice:format(lang:get("~ts等级不足~ts级，不能被任命为领队"),
                           [{role_2, Name}, {string_2, 5, 40}])};
        #guild_role{name = Name, enter_time = Entered}
            when Now - Entered < 86400 * 3 ->
            {false,
             notice:format(lang:get("~ts入会不足~ts天，不能被任命为领队"),
                           [{role_2, Name}, {string_2, 5, 3}])};
        R = #guild_role{} -> do_arrange(Role, Pos, R);
        _ -> {false, lang:get("找不到指定成员")}
    end;
arrange(_, _, _) ->
    {false, lang:get("只有会长、副会长和长老可以安排队伍")}.

join(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能参与")};
join(#role{s_event = 22}) ->
    {false, lang:get("已经在活动中")};
join(#role{m_team = #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("你跟随队伍中")};
join(Role) ->
    case check_join([lev, event, guild],
                    Role,
                    #{time => date:unixtime()})
        of
        {ok, Args} -> do_join(Role, Args);
        Else -> Else
    end.

join_to_follow(Role = #role{id = Id}, LeaderId) ->
    case guild_util:is_in_same(Id, LeaderId) of
        true ->
            case join(Role) of
                {ok, NewRole} ->
                    team:follow(NewRole),
                    {ok, NewRole};
                {false, Why} ->
                    Msg = util:flist(lang:get("队长正在公会英雄中，~ts"), [Why]),
                    notice:send(Role, 1, Msg)
            end;
        _ ->
            notice:send(Role, 1, lang:get("队长正在公会英雄中，你和队长不是同一公会"))
    end.

leave(Role = #role{s_event = 22, name = Name}) ->
    Role1 = role_trigger:fire(#evt_guild_hero{},
                              Role#role{s_event = 0}),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    TeamEvt = make_team_event(Role1),
    case map:role_enter(ToPos, TeamEvt, Role1) of
        {error, Reason} ->
            logger:error("[~ts]进入公会英雄场失败:~w",
                         [Name, Reason],
                         guild_hero,
                         217),
            {false, lang:get("进入公会英雄场失败")};
        {ok, NRole} ->
            NewRole = case var:get_var(NRole, day, 93, 0) of
                          0 ->
                              guild_role:update(NRole, doing),
                              var:set_var(NRole, day, 93, 1);
                          _ -> NRole
                      end,
            {ok, NewRole}
    end;
leave(_) -> {false, lang:get("不在公会英雄中")}.

cast_enemy(AtkList, DfdList,
           [{Round, Pos, MatchId} | Args]) ->
    #fighter{name = AName} = lists:keyfind(1,
                                           #fighter.is_leader,
                                           AtkList),
    #fighter{name = DName} = lists:keyfind(1,
                                           #fighter.is_leader,
                                           DfdList),
    Msg = notice:format(lang:get("向~ts带领的队伍主动发起攻击！"),
                        [{role_2, DName}]),
    Msg2 = notice:format(lang:get("向~ts带领的队伍主动发起攻击！"),
                         [{role_2, AName}]),
    encounter_notice(DfdList, Msg2),
    encounter_notice(AtkList, Msg),
    case lists:keyfind(cross_group, 1, Args) of
        {_, GroupId} ->
            cast(GroupId, {set_fighting, Pos, MatchId, Round});
        _ -> guild_hero ! {set_fighting, Pos, MatchId, Round}
    end,
    ok.

combat_over(#combat{winner = Winner, loser = Loser,
                    start_args =
                        #combat_start_args{ext_args =
                                               [{Round, Pos, MatchId}
                                                | Args]}}) ->
    Fgroups = case lists:keyfind(observer_args, 1, Args) of
                  {_, Fgs} -> Fgs;
                  _ -> []
              end,
    Fun = fun (#fighter{origin_id = Fid, pid = Fpid,
                        group = Fg, is_leader = FIL, name = Fname, sex = Fsex,
                        classes = Fclasses, lev = Flv}) ->
                  case lists:keyfind(Fg, 1, Fgroups) of
                      {_, Gid} ->
                          #{id => Fid, pid => Fpid, gid => Gid,
                            is_leader => FIL, name => Fname, sex => Fsex,
                            classes => Fclasses, lev => Flv};
                      _ ->
                          #{id => Fid, pid => Fpid, gid => 0, is_leader => FIL,
                            name => Fname, sex => Fsex, classes => Fclasses,
                            lev => Flv}
                  end
          end,
    WinnerF = [Fun(F) || F = #fighter{type = 1} <- Winner],
    LoserF = [Fun(F) || F = #fighter{type = 1} <- Loser],
    Record = combat_record:get_buffer(),
    case lists:keyfind(cross_group, 1, Args) of
        {_, GroupId} ->
            group_apply(GroupId,
                        combat_record,
                        save,
                        [8, {MatchId, Pos}, Record]),
            combat_cast(WinnerF,
                        LoserF,
                        #{pos => Pos, match_id => MatchId,
                          cross_group => GroupId}),
            cast(GroupId, {combat_over, WinnerF, LoserF, Round});
        _ ->
            combat_record:save(8, {MatchId, Pos}, Record),
            combat_cast(WinnerF,
                        LoserF,
                        #{pos => Pos, match_id => MatchId, cross_group => 0}),
            cast(0, {combat_over, WinnerF, LoserF, Round})
    end.

check_pick(Role = #role{name = Name},
           PickArgs = #{base_id := BaseId = 79665}) ->
    case do_check_pick([fighter, picked], Role) of
        true ->
            Gain = case guild_hero_data:get_box_reward(BaseId) of
                       L = [_ | _] ->
                           case util:rand_list(L, item_weight) of
                               #{item_id := ItemId, item_num := ItemNum,
                                 announce := Announce} ->
                                   ItemId0 = item_type:special_id(ItemId),
                                   case Announce of
                                       1 ->
                                           AnStr =
                                               notice:format(lang:get("~ts在~ts中激战正酣时，突然有~ts掉到他眼前{face_1,36}"),
                                                             [{role_2, Name},
                                                              {string_2,
                                                               1,
                                                               lang:get("公会英雄")},
                                                              {item_2,
                                                               ItemId0,
                                                               ItemNum}]),
                                           notice:cast(all, 5, AnStr);
                                       _ -> ok
                                   end,
                                   [{ItemId0, 0, ItemNum}];
                               _ -> []
                           end;
                       _ -> []
                   end,
            {true, PickArgs#{gain => Gain}};
        Else -> Else
    end;
check_pick(Role = #role{name = Name},
           PickArgs = #{base_id := BaseId = 79666}) ->
    case do_check_pick([picked], Role) of
        true ->
            Gain = case guild_hero_data:get_box_reward(BaseId) of
                       L = [_ | _] ->
                           case util:rand_list(L, item_weight) of
                               #{item_id := ItemId, item_num := ItemNum,
                                 announce := Announce} ->
                                   ItemId0 = item_type:special_id(ItemId),
                                   case Announce of
                                       1 ->
                                           AnStr =
                                               notice:format(lang:get("~ts在~ts中，开启宝箱惊喜获得了~ts{face_1,29}"),
                                                             [{role_2, Name},
                                                              {string_2,
                                                               1,
                                                               lang:get("公会英雄")},
                                                              {item_2,
                                                               ItemId0,
                                                               ItemNum}]),
                                           notice:cast(all, 5, AnStr);
                                       _ -> ok
                                   end,
                                   [{ItemId0, 0, ItemNum}];
                               _ -> []
                           end;
                       _ -> []
                   end,
            {true, PickArgs#{gain => Gain}};
        Else -> Else
    end;
check_pick(_, _PickArgs) -> {false, lang:get("不在公会中")}.

pick_gain(Role = #role{pid = _Pid}, #{gain := Gain}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            Role2 = case team:sync_away(Role1) of
                        {ok, ARole = #role{}} -> ARole;
                        _ -> Role1
                    end,
            async_leave(Role2, "");
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("公会英雄奖励"),
            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
            mail:send(Role,
                      #{title => Title, content => Content, items => Gain}),
            async_leave(Role, "");
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], guild_hero, 345),
            ok
    end.

info(status) ->
    case check_srv_open() of
        true ->
            gen_fsm:sync_send_all_state_event(guild_hero,
                                              info_status);
        _ -> {0, 86400}
    end.

is_arranging() ->
    case info(status) of
        {0, _} -> false;
        {1, _} -> false;
        _ -> true
    end.

leader_leave(Id, Gid) ->
    guild_hero ! {leader_leave, Id, Gid}.

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 16200) ->
    Data = info(status),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 16201) ->
    Data = case ets:lookup(guild_hero_guild, Gid) of
               [#guild_hero_guild{team_leaders = Leaders}] ->
                   {Leaders};
               _ -> {[]}
           end,
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 16205) ->
    Now = date:unixtime(),
    Data = case ets:lookup(guild_hero_guild, Gid) of
               [#guild_hero_guild{match_id = MatchId,
                                  team_leaders = Leaders, name = Name}] ->
                   case ets:lookup(guild_hero_match, MatchId) of
                       [M = #guild_hero_match{time = Time}]
                           when Now - Time >= 60 ->
                           {M};
                       [#guild_hero_match{time = Time, leaders = MLeaders}] ->
                           FakeLeader = [#guild_hero_team_leader{name =
                                                                     lang:get("神秘人"),
                                                                 position = Pos}
                                         || Pos <- lists:seq(1, 3)],
                           MLeaders1 = [Mld
                                        || Mld = #guild_hero_team_leader{gid =
                                                                             MGid}
                                               <- MLeaders,
                                           MGid =:= Gid],
                           {#guild_hero_match{gid1 = Gid, g_name1 = Name,
                                              g_name2 = lang:get("神秘公会"),
                                              leaders = FakeLeader ++ MLeaders1,
                                              time = Time}};
                       _ ->
                           {#guild_hero_match{gid1 = Gid, g_name1 = Name,
                                              leaders = Leaders}}
                   end;
               _ -> {#guild_hero_match{}}
           end,
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_guild = #m_guild{id = Gid}},
     Cmd = 16206) ->
    Data = case ets:lookup(guild_hero_guild, Gid) of
               [#guild_hero_guild{logs = Logs}] -> {Logs};
               _ -> {[]}
           end,
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(_, _Cmd) ->
    logger:debug("未知的协议推送 ~w", [_Cmd], guild_hero, 402),
    ok.

role_callback(Role, leave) ->
    case leave(Role) of
        {ok, Role1} -> {ok, Role1};
        _ -> ok
    end;
role_callback(#role{m_team = #m_combat{pid = Pid}},
              to_fighter)
    when is_pid(Pid) ->
    {ok, false};
role_callback(Role = #role{s_event = 22,
                           m_team = #m_team{status = 1, pid = Pid}},
              to_fighter)
    when is_pid(Pid) ->
    Reply = case team:get_fighters(Role) of
                {ok, L} ->
                    L1 = case lists:keyfind(leader, 1, L) of
                             {leader, Role, GuardPosList} ->
                                 {ok, FW} = role_convert:to(fighter_wrap, Role),
                                 lists:keyreplace(leader,
                                                  1,
                                                  L,
                                                  {leader, FW, GuardPosList});
                             _ -> L
                         end,
                    L2 = combat_mgr:to_fighters([106], L1),
                    {ok, L2};
                Else -> Else
            end,
    {ok, Reply};
role_callback(Role = #role{s_event = 22,
                           m_team = #m_team{status = 2, pid = Pid}},
              to_fighter)
    when is_pid(Pid) ->
    Reply = case check_team_mate(Role) of
                {ok, L} ->
                    L1 = case lists:keyfind(leader, 1, L) of
                             {leader, Role, GuardPosList} ->
                                 {ok, FW} = role_convert:to(fighter_wrap, Role),
                                 lists:keyreplace(leader,
                                                  1,
                                                  L,
                                                  {leader, FW, GuardPosList});
                             _ -> L
                         end,
                    L2 = combat_mgr:to_fighters([106], L1),
                    {ok, L2};
                Else -> Else
            end,
    {ok, Reply};
role_callback(_Role, to_fighter) -> {ok, false};
role_callback(Role, {push, Cmd}) ->
    push(Role, Cmd),
    ok;
role_callback(Role = #role{s_event = 22, id = Id,
                           lev = Lev},
              {fight_reward, Type}) ->
    logger:debug("有奖励", [], guild_hero, 451),
    Rate = case ets:lookup(guild_hero_fighter, Id) of
               [#guild_hero_fighter{}] -> 2;
               _ -> 1
           end,
    ExpRate = case Type of
                  win -> 2;
                  _ -> 1
              end,
    Gain1 = case levup_data:get_exp({3300, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp * ExpRate}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3300, PetLev}) of
                                #{pet_exp := PetExp} ->
                                    [{90005, PetExp * ExpRate} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_hero,
                                 472),
                    []
            end,
    Gain2 = case Type of
                win -> [{90011, 30 * Rate}, {90012, 15 * Rate} | Gain1];
                _ -> [{90011, 10 * Rate}, {90012, 5 * Rate} | Gain1]
            end,
    Gain = format:val_to_gain(Gain2),
    push(Role, 16205),
    case role_gain:do_notice(Gain, Role) of
        {ok, Role1} -> {ok, Role1};
        _ -> ok
    end;
role_callback(_, {fight_reward, _}) ->
    logger:debug("没有奖励", [], guild_hero, 486),
    ok;
role_callback(Role = #role{s_event = 22, lev = Lev},
              add_exp) ->
    logger:debug("有奖励", [], guild_hero, 490),
    Gain1 = case levup_data:get_exp({3311, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3311, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 guild_hero,
                                 503),
                    []
            end,
    logger:debug("", [], guild_hero, 506),
    Gain = format:val_to_gain(Gain1),
    case role_gain:do_notice(Gain, Role) of
        {ok, Role1} -> {ok, Role1};
        _ -> ok
    end;
role_callback(_, add_exp) ->
    logger:debug("没有奖励", [], guild_hero, 513),
    ok;
role_callback(#role{s_event = 22,
                    m_combat = #m_combat{pid = CombatPid}},
              stop_fighting)
    when is_pid(CombatPid) ->
    CombatPid ! stop_result,
    ok;
role_callback(_, stop_fighting) -> ok;
role_callback(Role = #role{s_event = 22}, pop) ->
    Msg =
        notice:format(lang:get("本会在此次公会英雄战中获得了不错的成绩，公会场地~ts后将会洒出一批~ts"),
                      [{string_2, 5, lang:get("一分钟")},
                       {string_2, 5, lang:get("胜利宝箱")}]),
    notice:pop(Role, 2, Msg),
    ok;
role_callback(_, pop) -> ok;
role_callback(_, _Info) ->
    logger:error("未知消息 ~w", [_Info], guild_hero, 528),
    ok.

role_callback(_, Role = #role{name = _Name}, _,
              {follow_join, Event}) ->
    logger:debug("~ts 跟随进入", [_Name], guild_hero, 533),
    Role2 = Role#role{s_event = Event},
    map:role_update(Role2),
    {ok, Role2};
role_callback(_, Role = #role{}, _, follow_leave) ->
    Role1 = role_trigger:fire(#evt_guild_hero{},
                              Role#role{s_event = 0}),
    map:role_update(Role1),
    Role2 = case var:get_var(Role1, day, 93, 0) of
                0 ->
                    guild_role:update(Role1, doing),
                    var:set_var(Role1, day, 93, 1);
                _ -> Role1
            end,
    {ok, Role2}.

m(StateName) -> guild_hero ! {gm_set_state, StateName}.

start_link(Mode) ->
    gen_fsm:start_link({local, guild_hero},
                       guild_hero,
                       [Mode],
                       []).

init([Mode]) ->
    logger:info("开始启动...", [], guild_hero, 560),
    {StateName, Tt} = get_state(),
    Timeout = Tt * 1000,
    dets:open_file(guild_hero_guild,
                   [{file, "./dets/guild_hero_guild.dets"},
                    {keypos, #guild_hero_guild.id}]),
    ets:new(guild_hero_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_hero_guild.id}]),
    ets:new(guild_hero_fighter,
            [set,
             named_table,
             public,
             {keypos, #guild_hero_fighter.id}]),
    ets:new(guild_hero_match,
            [set,
             named_table,
             public,
             {keypos, #guild_hero_match.id}]),
    load_data(),
    NextId = case env:get(guild_hero_next_id) of
                 NId when is_integer(NId) -> NId;
                 _ ->
                     env:save(guild_hero_next_id, 1),
                     1
             end,
    IsCross = case Mode of
                  center -> 1;
                  _ -> 0
              end,
    OpenMode = check_open_mode(IsCross),
    State = #state{ts = now(), timeout = Timeout,
                   next_id = NextId, is_cross = IsCross,
                   open_mode = OpenMode},
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                guild_hero,
                586),
    {ok, StateName, State, Timeout}.

handle_event(reload, StateName,
             State = #state{is_cross = IsCross,
                            open_mode = OldOpenMode}) ->
    OpenMode = check_open_mode(IsCross),
    logger:info("收到重载公会英雄从[~w]模式转换成[~w]模式",
                [OldOpenMode, OpenMode],
                guild_hero,
                592),
    continue(StateName, State#state{open_mode = OpenMode});
handle_event({set_state, StateName}, StateName,
             State) ->
    continue(StateName, State);
handle_event({set_state, StateName}, _StateName,
             State = #state{open_mode = 3}) ->
    case StateName of
        idle -> active(timeout, State);
        plan -> idle(timeout, State);
        ready -> plan(timeout, State);
        active -> ready(timeout, State);
        _ -> continue(StateName, State)
    end;
handle_event({set_state, _}, StateName, State) ->
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout}) ->
    St = case StateName of
             plan -> 1;
             ready -> 2;
             active -> 3;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event({arrange, _}, _From, StateName,
                  State = #state{round = 2}) ->
    Reply = {false, lang:get("现在不能分配")},
    continue(Reply, StateName, State);
handle_sync_event({arrange,
                   Leader = #guild_hero_team_leader{id = Id, gid = Gid,
                                                    position = Pos}},
                  _From, StateName, State = #state{open_mode = OpenMode})
    when StateName =:= plan orelse
             StateName =:= ready orelse StateName =:= active ->
    logger:debug("安排", [], guild_hero, 630),
    Now = date:unixtime(),
    Reply = case ets:lookup(guild_hero_guild, Gid) of
                [G = #guild_hero_guild{team_leaders = Leaders,
                                       map_pid = MapPid}] ->
                    Leaders1 = lists:keydelete(Id,
                                               #guild_hero_team_leader.id,
                                               Leaders),
                    Leaders2 = lists:keystore(Pos,
                                              #guild_hero_team_leader.position,
                                              Leaders1,
                                              Leader),
                    G1 = G#guild_hero_guild{team_leaders = Leaders2},
                    update(G1),
                    enroll(OpenMode, G1),
                    case is_pid(MapPid) of
                        true ->
                            map:async_apply(MapPid,
                                            {guild_hero,
                                             role_callback,
                                             [{push, 16205}]});
                        _ -> ok
                    end,
                    ok;
                _ when StateName =:= active ->
                    {false, lang:get("你公会没报名")};
                _ ->
                    case guild_mgr:info(by_id, Gid) of
                        {ok, #guild{mem_num = MemNum}} when MemNum < 50 ->
                            Msg =
                                notice:format(lang:get("由于本公会总人数＜~ts人，无法参加本次~ts，快去再招点人吧！"),
                                              [{string_2, 5, 50},
                                               {string_2,
                                                5,
                                                lang:get("公会英雄")}]),
                            {false, Msg};
                        {ok, #guild{mem_num = MemNum}} when MemNum < 50 ->
                            Msg =
                                notice:format(lang:get("由于本公会总人数＜~ts人，无法参加本次~ts，快去再招点人吧！"),
                                              [{string_2, 5, 50},
                                               {string_2,
                                                5,
                                                lang:get("公会英雄")}]),
                            {false, Msg};
                        {ok, #guild{create_time = Created}}
                            when Now - Created < 86400 * 3 ->
                            Msg =
                                notice:format(lang:get("由于本公会创建天数＜~ts天，无法参加本次~ts，请加油提升公会吧！"),
                                              [{string_2, 5, 3},
                                               {string_2,
                                                5,
                                                lang:get("公会英雄")}]),
                            {false, Msg};
                        {ok, G = #guild{}} ->
                            G1 = to(G,
                                    #{platform => env:get(platform),
                                      zone_id => env:get(zone_id)}),
                            case StateName of
                                plan ->
                                    G2 = G1#guild_hero_guild{team_leaders =
                                                                 [Leader]},
                                    update(G2),
                                    enroll(OpenMode, G2);
                                _ ->
                                    create_maps(OpenMode,
                                                [G1#guild_hero_guild{team_leaders
                                                                         =
                                                                         [Leader]}])
                            end,
                            ok;
                        _ -> {false, lang:get("找不到公会信息")}
                    end
            end,
    continue(Reply, StateName, State);
handle_sync_event({arrange, _}, _From, StateName,
                  State) ->
    Reply = {false, lang:get("现在不能分配")},
    continue(Reply, StateName, State);
handle_sync_event({join, Gid}, _From, StateName,
                  State = #state{finishs = Finishs})
    when StateName =:= ready orelse StateName =:= active ->
    Reply = case lists:member(Gid, Finishs) of
                true -> {false, lang:get("你公会已经出胜负了")};
                _ -> ok
            end,
    continue(Reply, StateName, State);
handle_sync_event({join, _}, _From, StateName, State) ->
    Reply = {false, lang:get("活动还没开始")},
    continue(Reply, StateName, State);
handle_sync_event({check_pick, Id, Gid}, _From,
                  StateName, State = #state{open_mode = OpenMode}) ->
    Reply = case ets:lookup(guild_hero_guild, Gid) of
                [G = #guild_hero_guild{pickers = Pickers}] ->
                    case lists:member(Id, Pickers) of
                        true -> {false, lang:get("你已经捡过宝箱了")};
                        _ ->
                            G1 = G#guild_hero_guild{pickers = [Id | Pickers]},
                            update(G1),
                            enroll(OpenMode, G1),
                            true
                    end;
                _ -> {false, lang:get("现在不能捡")}
            end,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息: ~w, state_name: ~w",
                 [_Event, StateName],
                 guild_hero,
                 705),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({combat_over, Winner, Loser, Round}, active,
            State = #state{round = Round}) ->
    case Winner of
        [] -> ok;
        _ -> calc_fighter(win, Winner)
    end,
    calc_fighter(lost, Loser),
    continue(active, State);
handle_info({combat_over, _, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info({set_fighting, Pos1, MatchId, Round},
            active, State = #state{round = Round}) ->
    case ets:lookup(guild_hero_match, MatchId) of
        [M = #guild_hero_match{leaders = Leaders, gid1 = Gid1,
                               gid2 = Gid2, cross_group = GroupId}] ->
            Fun = fun (Ld = #guild_hero_team_leader{position = Pos})
                          when Pos =:= Pos1 ->
                          Ld#guild_hero_team_leader{is_fighting = 1};
                      (Ld) -> Ld
                  end,
            Leaders1 = [Fun(LdO) || LdO <- Leaders],
            Data1 = [M#guild_hero_match{leaders = Leaders1}],
            Data2 = case ets:lookup(guild_hero_guild, Gid1) of
                        [G1 = #guild_hero_guild{}] -> [G1 | Data1];
                        _ -> Data1
                    end,
            Data3 = case ets:lookup(guild_hero_guild, Gid2) of
                        [G2 = #guild_hero_guild{}] -> [G2 | Data2];
                        _ -> Data2
                    end,
            sync_and_push(GroupId, 16205, Data3);
        _ ->
            logger:error("找不到战场信息[~w]", [MatchId], guild_hero, 743)
    end,
    continue(active, State);
handle_info({set_fighting, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info(round_match, active,
            State = #state{round = Round, next_id = NextId,
                           match_ref = OldRef, open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRound = Round + 1,
    NewNextId = do_match(NewRound, NextId, OpenMode),
    case check_srv_open() of
        true when OpenMode =/= 2 ->
            Msg =
                notice:format(lang:get("第~ts轮对战将在~ts后开始，对战列表已经出现，具体对手将在~ts时公布。"),
                              [{string_2, 5, NewRound},
                               {string_2, 5, lang:get("1分钟后")},
                               {string_2, 5, lang:get("正式开战")}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    Ref = erlang:send_after(60 * 1000, self(), match_fight),
    continue(active,
             State#state{round = NewRound, next_id = NewNextId,
                         match_ref = Ref});
handle_info(round_match, StateName, State) ->
    continue(StateName, State);
handle_info(round_over, active,
            State = #state{match_ref = OldRef, round = Round,
                           open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case OpenMode of
        3 -> ok;
        _ -> stop_fighting()
    end,
    case Round of
        2 -> continue(active, State);
        _ ->
            Ref = erlang:send_after(60 * 1000, self(), round_match),
            continue(active, State#state{match_ref = Ref})
    end;
handle_info(round_over, StateName, State) ->
    continue(StateName, State);
handle_info(match_fight, StateName = active,
            State = #state{match_ref = OldRef, round = Round,
                           open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case OpenMode of
        3 -> ok;
        _ ->
            match_fight(Round),
            broadcast_match()
    end,
    case check_srv_open() of
        true ->
            Prefix = notice:format(lang:get("~ts第~ts场对战正式开始，"),
                                   [{string_2, 5, lang:get("公会英雄")},
                                    {string_2, 5, Round}]),
            notice_match(Prefix, Round, OpenMode);
        _ -> ok
    end,
    Ref = erlang:send_after(840 * 1000, self(), round_over),
    continue(StateName, State#state{match_ref = Ref});
handle_info(match_fight, StateName, State) ->
    continue(StateName, State);
handle_info({add_log, Gid, Olog}, active, State) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{logs = Logs,
                               cross_group = GroupId}] ->
            update(G#guild_hero_guild{logs = [Olog | Logs]}),
            sync_data(GroupId, G);
        _ -> ok
    end,
    continue(active, State);
handle_info({add_log, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info({create_box, Gid}, active,
            State = #state{round = Round}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{}] -> create_box(G, Round);
        _ -> ok
    end,
    erlang:send_after(300 * 1000, self(), {kickout, Gid}),
    continue(active, State);
handle_info({create_box, _}, StateName, State) ->
    continue(StateName, State);
handle_info({kickout, Gid}, active,
            State = #state{round = 2, finishs = Finishs}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [#guild_hero_guild{map_pid = MapPid}]
            when is_pid(MapPid) ->
            map:async_apply(MapPid,
                            {guild_hero, role_callback, [leave]});
        _ -> ok
    end,
    continue(active,
             State#state{finishs = [Gid | Finishs]});
handle_info({kickout, _}, StateName, State) ->
    continue(StateName, State);
handle_info({reward_match_fail,
             Args = #{gid := Id1 = {_, P, Z}, name := Name}},
            active, State = #state{round = Round}) ->
    {Items, Assets} = {[{23014, 6}], 3000000},
    Pref = lang:get("公会英雄获胜"),
    Fmt =
        lang:get("我方选手在公会英雄中轮空直接获胜，公会因此获得~ts公会资金和~ts{face_1,38}"),
    Msg = notice:format(Fmt,
                        [{string_2, 5, Assets}, {item_2, Items}]),
    cross:cast(P, Z, guild_loot, add, [Id1, Items, Pref]),
    cross:cast(P,
               Z,
               guild_common,
               add_assets,
               [Id1, {not_weekly, Assets}]),
    cross:cast(P, Z, guild, notice, [Id1, Msg]),
    Msg2 =
        notice:format(lang:get("~ts公会在公会英雄第~ts轮轮空直接获胜，公会因此获得了丰厚的奖励{face_1,18}"),
                      [{string_2, 2, Name}, {string_2, 5, Round}]),
    cross:cast(P, Z, notice, cast, [all, 5, Msg2]),
    delay_create_box(Args#{round => Round}),
    continue(active, State);
handle_info({reward_match_fail, _}, StateName, State) ->
    continue(StateName, State);
handle_info(add_exp, StateName,
            State = #state{is_cross = 0})
    when StateName =:= ready orelse StateName =:= active ->
    next_add_exp(),
    lists:foreach(fun ([MapPid, Gid]) when is_pid(MapPid) ->
                          case role_misc:is_local_role(Gid) of
                              true ->
                                  map:async_apply(MapPid,
                                                  {guild_hero,
                                                   role_callback,
                                                   [add_exp]});
                              _ -> ok
                          end;
                      (_) -> ok
                  end,
                  ets:match(guild_hero_guild,
                            #guild_hero_guild{map_pid = '$1', id = '$2',
                                              _ = '_'})),
    continue(StateName, State);
handle_info(add_exp, StateName, State) ->
    continue(StateName, State);
handle_info({set_round, Round}, StateName, State) ->
    continue(StateName, State#state{round = Round});
handle_info({enroll, Data}, StateName, State) ->
    update(Data),
    continue(StateName, State);
handle_info({sync_data, Data}, StateName, State) ->
    update(Data),
    continue(StateName, State);
handle_info({update_and_push, Cmd, Data}, StateName,
            State) ->
    update_and_push(Cmd, Data),
    continue(StateName, State);
handle_info({update_and_reward, G, Data, Type},
            StateName, State) ->
    update_and_reward(G, Data, Type),
    continue(StateName, State);
handle_info(reload_state, idle, State) ->
    PrepareSec1 = 3600 * 6 + 1200 + 600,
    Now = date:unixtime(),
    Tt = case agenda_data:get(2020) of
             #{starttime := Start, args := WeekDays} ->
                 date:week_next_diff(WeekDays, Now, Start - PrepareSec1);
             _ -> date:week_next_diff([5], Now, 77400 - PrepareSec1)
         end,
    Timeout = Tt * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    continue(idle, NewState);
handle_info({gm_set_state, StateName}, StateName,
            State) ->
    case StateName of
        idle ->
            {_, Tt} = get_state(),
            Timeout = Tt * 1000,
            NewState = State#state{ts = now(), timeout = Timeout},
            continue(idle, NewState);
        _ -> continue(StateName, State)
    end;
handle_info({gm_set_state, StateName}, _StateName,
            State) ->
    case StateName of
        idle -> active(timeout, State);
        plan -> idle(timeout, State);
        ready -> plan(timeout, State);
        active -> ready(timeout, State);
        _ -> continue(StateName, State)
    end;
handle_info({leader_leave, Id, Gid}, StateName = plan,
            State = #state{open_mode = OpenMode}) ->
    logger:debug("安排", [], guild_hero, 944),
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{team_leaders = Leaders,
                               map_pid = MapPid}] ->
            Leaders1 = lists:keydelete(Id,
                                       #guild_hero_team_leader.id,
                                       Leaders),
            G1 = G#guild_hero_guild{team_leaders = Leaders1},
            update(G1),
            enroll(OpenMode, G1),
            case is_pid(MapPid) of
                true ->
                    map:async_apply(MapPid,
                                    {guild_hero,
                                     role_callback,
                                     [{push, 16205}]});
                _ -> ok
            end,
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({leader_leave, _, _}, StateName, State) ->
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w, state_name: ~w",
                 [_Info, StateName],
                 guild_hero,
                 965),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State = #state{is_cross = IsCross}) ->
    NewState = State#state{ts = now(),
                           timeout = (3600 * 6 + 1200) * 1000, round = 1,
                           finishs = []},
    ets:delete_all_objects(guild_hero_guild),
    dets:delete_all_objects(guild_hero_guild),
    ets:delete_all_objects(guild_hero_fighter),
    case IsCross of
        1 ->
            cross:cast(all,
                       gen_fsm,
                       send_all_state_event,
                       [guild_hero, {set_state, plan}]),
            ok;
        _ ->
            case check_srv_open() of
                true ->
                    role_group:pack_send(world,
                                         16200,
                                         {1, 3600 * 6 + 1200}),
                    Msg =
                        notice:format(lang:get("~ts将在~ts开赛，各大公会管理们请及时~ts啦{face_1,16}"),
                                      [{string_2, 1, lang:get("公会英雄")},
                                       {string_2, 5, lang:get("今晚21:30")},
                                       {string_2, 5, lang:get("安排好参战队伍")}]),
                    Content =
                        notice:format(lang:get("~ts将在今晚21:30分开赛，请公会管理们及时安排好参战队伍。公会英雄将在开战后匹配对手"
                                               "，并以~ts的方式进行角逐，获得~ts的公会获得该场比赛的胜利！"),
                                      [{string_2, 1, lang:get("公会英雄")},
                                       {string_2,
                                        5,
                                        lang:get("太阳对太阳、月亮对月亮、星辰对星辰")},
                                       {string_2, 5, lang:get("2胜以上")}]),
                    notice_guild(Msg),
                    mail_guild(lang:get("公会英雄"), Content),
                    notice:cast(all, 5, Msg);
                _ ->
                    Msg =
                        notice:format(lang:get("由于开服时间不足3天，本次~ts活动暂不开启{face_1, 7}"),
                                      [{string_2, 1, lang:get("公会英雄")}]),
                    notice_guild(Msg),
                    notice:cast(all, 5, Msg),
                    ok
            end
    end,
    continue(plan, NewState);
idle(_, State) -> continue(idle, State).

plan(timeout, State = #state{open_mode = OpenMode}) ->
    NewState = State#state{ts = now(), timeout = 600 * 1000,
                           round = 1},
    case check_srv_open() of
        true when OpenMode =/= 2 ->
            Now = date:unixtime(),
            GroupId = case
                          guild_hero_data:get_cross_group({env:get(platform),
                                                           env:get(zone_id)})
                          of
                          Order when is_integer(Order) -> Order;
                          _ -> 0
                      end,
            MatchType = case OpenMode of
                            1 -> 1;
                            _ -> 2
                        end,
            Conds = [{'>=', '$3', 2},
                     {'>=', '$7', 50},
                     {'>=', {'-', Now, '$8'}, 86400 * 3}],
            MatchSpec = [{#guild{id = '$1', name = '$2', lev = '$3',
                                 leader_id = '$4', leader_name = '$5',
                                 totem = '$6', mem_num = '$7',
                                 create_time = '$8', _ = '_'},
                          Conds,
                          [{#guild_hero_guild{id = '$1', name = '$2',
                                              lev = '$3', leader_id = '$4',
                                              leader_name = '$5', totem = '$6',
                                              cross_group = GroupId,
                                              match_id = {{MatchType, 0}}}}]}],
            L = ets:select(guild_list, MatchSpec),
            create_maps(OpenMode, L),
            next_add_exp(),
            role_group:pack_send(world, 16200, {2, 600}),
            Msg =
                notice:format(lang:get("~ts已经进入准备阶段，公会代表队长快到公会准备区组起队伍，一展风采{face_1,18}"),
                              [{string_2, 1, lang:get("公会英雄")}]),
            notice_guild(Msg),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    case OpenMode of
        2 ->
            cross:cast(all,
                       gen_fsm,
                       send_all_state_event,
                       [guild_hero, {set_state, ready}]);
        _ -> ok
    end,
    continue(ready, NewState);
plan(_, State) -> continue(plan, State).

ready(timeout,
      State = #state{next_id = NextId, match_ref = OldRef,
                     is_cross = IsCross, open_mode = OpenMode}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewState = State#state{ts = now(),
                           timeout = agenda:get_duration(2020) * 1000,
                           round = 1},
    delete_combat_records(IsCross),
    ets:delete_all_objects(guild_hero_match),
    ets:delete_all_objects(guild_hero_fighter),
    honor_mgr:clear(guild_hero_winner),
    NewNextId = case check_srv_open() of
                    true ->
                        case IsCross of
                            1 ->
                                cross:cast(all,
                                           gen_fsm,
                                           send_all_state_event,
                                           [guild_hero, {set_state, active}]),
                                ok;
                            _ ->
                                role_group:pack_send(world,
                                                     16200,
                                                     {3,
                                                      agenda:get_duration(2020)}),
                                Msg =
                                    notice:format(lang:get("~ts正式开始！本次英雄战共~ts，第一轮对战将在~ts开始，对战列表已经出现，具体对手将"
                                                           "在~ts时公布。"),
                                                  [{string_2,
                                                    1,
                                                    lang:get("公会英雄")},
                                                   {string_2,
                                                    1,
                                                    lang:get("分为两轮")},
                                                   {string_2,
                                                    1,
                                                    lang:get("1分钟后")},
                                                   {string_2,
                                                    1,
                                                    lang:get("正式开战")}]),
                                notice:cast(all, 5, Msg)
                        end,
                        NextId1 = case OpenMode of
                                      3 -> NextId;
                                      _ -> do_match(1, NextId, OpenMode)
                                  end,
                        NextId1;
                    _ -> NextId
                end,
    Ref = erlang:send_after(60 * 1000, self(), match_fight),
    continue(active,
             NewState#state{next_id = NewNextId, match_ref = Ref});
ready(_, State) -> continue(ready, State).

active(timeout, State = #state{open_mode = OpenMode}) ->
    {_, Tt} = get_state(),
    Timeout = Tt * 1000,
    NewState = State#state{ts = now(), timeout = Timeout},
    case OpenMode of
        2 ->
            cross:cast(all,
                       gen_fsm,
                       send_all_state_event,
                       [guild_hero, {set_state, idle}]),
            ok;
        _ ->
            all_leave(),
            clear_maps()
    end,
    case check_srv_open() of
        true when OpenMode =/= 2 ->
            role_group:pack_send(world, 16200, {0, Tt}),
            Msg = notice:format(lang:get("本次~ts已经圆满结束，请大家有序离场哦！"),
                                [{string_2, 1, lang:get("公会英雄")}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end,
    logger:debug("下次开始时间 ~w", [Timeout], guild_hero, 1115),
    continue(idle, NewState);
active(_, State) -> continue(active, State).

get_state() ->
    Now = date:unixtime(),
    Zero = date:unixtime(zero),
    PrepareSec1 = 3600 * 6 + 1200 + 600,
    PrepareSec2 = 600,
    case agenda_data:get(2020) of
        Cfg = #{starttime := Start, endtime := End} ->
            IsToday = case Cfg of
                          #{args := WeekDays1} ->
                              lists:member(date:day_of_the_week(Now),
                                           WeekDays1);
                          _ -> true
                      end,
            if IsToday andalso Now < Zero + Start - PrepareSec1 ->
                   {idle, Zero + Start - PrepareSec1 - Now};
               IsToday andalso Now < Zero + Start - PrepareSec2 ->
                   {plan, Zero + Start - PrepareSec2 - Now};
               IsToday andalso
                   Now >= Zero + Start - PrepareSec2 andalso
                       Now =< Zero + Start ->
                   {ready, Zero + Start - Now};
               IsToday andalso
                   Now >= Start + Zero andalso Now < Zero + End - 600 ->
                   {active, Zero + End - Now};
               true ->
                   case Cfg of
                       #{args := WeekDays} ->
                           {idle,
                            date:week_next_diff(WeekDays,
                                                Now,
                                                Start - PrepareSec1)};
                       _ -> {idle, date:next_diff(Start - PrepareSec1, Now)}
                   end
            end;
        _ -> false
    end.

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

check_srv_open() ->
    case date:open_srv_day() of
        N when is_integer(N) -> N > 3;
        _ -> false
    end.

do_arrange(Role = #role{m_guild =
                            #m_guild{id = Gid, pid = Gpid},
                        name = Name1},
           Pos, R = #guild_role{name = Name2, id = Id}) ->
    Leader = to(R, #{gid => Gid, pos => Pos}),
    logger:debug("", [], guild_hero, 1180),
    case gen_fsm:sync_send_all_state_event(guild_hero,
                                           {arrange, Leader})
        of
        ok ->
            Msg = notice:format(lang:get("~ts被~ts委任为~ts领队"),
                                [{role_2, Name2},
                                 {role_2, Name1},
                                 {string_2, 5, pos_to_name(Pos)}]),
            guild:notice(Gpid, Msg),
            TimeStr = lang:get("晚上21:30"),
            Content =
                notice:format(lang:get("你被委任为~ts~ts领队，活动将在~ts开始，建议提早组织好队伍按时参加，届时如果未到场"
                                       "或队伍中人数少于~ts人将被认为弃权"),
                              [{string_2, 1, lang:get("公会英雄")},
                               {string_2, 5, pos_to_name(Pos)},
                               {string_2, 5, TimeStr},
                               {string_2, 5, 3}]),
            MailInfo = #{title => lang:get("公会英雄"),
                         content => Content, items => []},
            mail:send(Id, MailInfo),
            push(Role, 16201),
            Msg1 = notice:format(lang:get("成功委任~ts为~ts领队"),
                                 [{role_2, Name2},
                                  {string_2, 5, pos_to_name(Pos)}]),
            {ok, Msg1};
        Else -> Else
    end.

to(#guild{id = Id, name = Name, lev = Lev,
          totem = #guild_totem{id = TotemId},
          leader_id = LeaderId, leader_name = LeaderName},
   #{platform := P, zone_id := Z}) ->
    GroupId = case guild_hero_data:get_cross_group({P, Z})
                  of
                  Order when is_integer(Order) -> Order;
                  _ -> 0
              end,
    #guild_hero_guild{id = Id, name = Name, lev = Lev,
                      leader_id = LeaderId, leader_name = LeaderName,
                      totem = TotemId, cross_group = GroupId};
to(#guild_role{id = Id, name = Name, lev = Lev,
               pid = Pid, classes = Classes, sex = Sex},
   #{gid := Gid, pos := Pos}) ->
    #guild_hero_team_leader{id = Id, name = Name, lev = Lev,
                            pid = Pid, gid = Gid, position = Pos, sex = Sex,
                            classes = Classes};
to(#{id := Id, name := Name, lev := Lev,
     classes := Classes, sex := Sex},
   #{gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to({leader,
    #fighter_wrap{fighter =
                      #fighter{origin_id = Id, name = Name, lev = Lev,
                               sex = Sex, classes = Classes}},
    _},
   #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to(#fighter_wrap{fighter =
                     #fighter{origin_id = Id, name = Name, lev = Lev,
                              sex = Sex, classes = Classes}},
   #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to({leader,
    #fighter{origin_id = Id, name = Name, lev = Lev,
             sex = Sex, classes = Classes}},
   #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to(#fighter{origin_id = Id, name = Name, lev = Lev,
            sex = Sex, classes = Classes},
   #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to(#team_mate{id = Id, name = Name, lev = Lev,
              sex = Sex, classes = Classes},
   #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, name = Name, lev = Lev,
                        gid = Gid, sex = Sex, classes = Classes};
to({leader, Id, _}, #{type := fighter, gid := Gid}) ->
    #guild_hero_fighter{id = Id, gid = Gid}.

create_maps(_, []) -> ok;
create_maps(OpenMode,
            [G = #guild_hero_guild{id = Id, totem = Totem} | T]) ->
    TotemId = case Totem of
                  #guild_totem{id = Tid} -> Tid;
                  _ when is_integer(Totem) -> Totem;
                  _ -> 0
              end,
    case map_mgr:create(30006) of
        {ok, MapPid, MapId} ->
            create_units({25, MapId}, [{20065, 2044, 1514}]),
            G2 = case ets:lookup(guild_hero_guild, Id) of
                     [G1 = #guild_hero_guild{team_leaders = Leaders}] ->
                         mail_leaders(Leaders),
                         G1#guild_hero_guild{map_id = MapId, map_pid = MapPid};
                     _ ->
                         G#guild_hero_guild{map_id = MapId, map_pid = MapPid,
                                            totem = TotemId}
                 end,
            update(G2),
            enroll(OpenMode, G2),
            create_maps(OpenMode, T);
        _Err ->
            logger:error("创建准备区失败: ~w", [_Err], guild_hero, 1308),
            ok
    end.

check_join([], _, Args) -> {ok, Args};
check_join([lev | _T], #role{lev = Lev}, _)
    when Lev < 30 ->
    {false,
     notice:format(lang:get("角色等级达到~ts才可以参与公会英雄"),
                   [{string_2, 5, 30}])};
check_join([lev | T], Role, Args) ->
    check_join(T, Role, Args);
check_join([guild | _T],
           #role{m_guild = #m_guild{enter_time = Entered}},
           #{time := Now})
    when Now - Entered < 86400 * 3 ->
    {false, lang:get("进入公会3天以上的成员才能参与公会英雄")};
check_join([guild | T],
           Role = #role{m_guild = #m_guild{id = Gid}}, Args) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [#guild_hero_guild{map_id = MapId, name = GName}] ->
            check_join(T,
                       Role,
                       Args#{map_id => MapId, guild_name => GName});
        _ -> {false, lang:get("你公会没有参与本次公会英雄")}
    end;
check_join([guild | _], _Role, _) ->
    {false, lang:get("不在公会中不能参与")};
check_join([event | T], Role, Args) ->
    case role_misc:check_event(Role, [0, 2]) of
        true -> check_join(T, Role, Args);
        Else -> Else
    end.

do_join(Role = #role{pos =
                         #pos{map = OldMapId, x = X, y = Y,
                              platform = OldPlatform, zone_id = OldZoneId},
                     name = Name, m_guild = #m_guild{id = Gid}},
        #{map_id := ReadyMapId}) ->
    logger:debug("~ts 进入准备区", [Name], guild_hero, 1336),
    case gen_fsm:sync_send_all_state_event(guild_hero,
                                           {join, Gid})
        of
        ok ->
            ToPos = get_pos(ReadyMapId),
            Role1 = Role#role{s_event = 22},
            TeamEvt = make_team_event(Role1),
            case map:role_enter(ToPos, TeamEvt, Role1) of
                {error, Reason} ->
                    logger:error("[~ts]进入公会精英战场失败:~w",
                                 [Name, Reason],
                                 guild_hero,
                                 1344),
                    {false, lang:get("进入公会英雄战场失败")};
                {ok, NewRole = #role{pos = Pos}} ->
                    team:stop_recruiting(NewRole),
                    guild_role:update(NewRole, doing),
                    Last = #pos_history{map = OldMapId, x = X, y = Y,
                                        platform = OldPlatform,
                                        zone_id = OldZoneId},
                    {ok, NewRole#role{pos = Pos#pos{last = Last}}}
            end;
        Else -> Else
    end.

make_team_event(Role = #role{s_event = Event}) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 22 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa =>
                  {guild_hero, role_callback, [{follow_join, Event}]}};
        MateIds ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_hero, role_callback, [follow_leave]}}
    end.

check_team(Role = #role{m_team =
                            #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    Now = date:unixtime(),
    case team:get_members(Role) of
        TeamList = [_ | _] ->
            [Id
             || Mate = #team_mate{id = Id, status = 2} <- TeamList,
                can_team_join(Role, Mate, Now)];
        _ -> []
    end;
check_team(_) -> [].

can_team_join(Role, Mate, Now) ->
    do_can_team_join([lev, guild, enter_time],
                     Role,
                     Mate,
                     Now).

do_can_team_join([], _, _, _) -> true;
do_can_team_join([lev | T], Role,
                 Mate = #team_mate{lev = Lev, name = Name, pid = Pid},
                 Now) ->
    case Lev >= 30 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts等级不足~ts级，自动离开了队伍"),
                                [{role_2, Name}, {string_2, 5, 30}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([guild | T],
                 Role = #role{id = LeaderId},
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case guild_util:is_in_same(LeaderId, Id) of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts和队长不同公会，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([enter_time | T], Role,
                 Mate = #team_mate{id = Id, name = Name, pid = Pid},
                 Now) ->
    case guild_role:get(Role, Id) of
        #guild_role{enter_time = Entered}
            when Now - Entered >= 86400 * 3 ->
            do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts入会时间不足3天，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end.

get_pos(MapId) ->
    case map_data:get(30006) of
        {ok, #map_data{revive = [{X, Y} | _]}} -> {MapId, X, Y};
        _ -> {MapId, 1450, 1051}
    end.

do_match(Round, NextId, 1) ->
    Now = date:unixtime(),
    MatchType = 1,
    L = [G
         || G = #guild_hero_guild{team_leaders = Leaders}
                <- ets:tab2list(guild_hero_guild),
            Leaders =/= []],
    L1 = util:keys_sort([#guild_hero_guild.lev], L),
    L2 = sort_guild(Round, 0, L1),
    do_create_match(L2,
                    #{round => Round, next_id => NextId, time => Now,
                      type => MatchType, cross_group => 0});
do_match(Round, NextId, 2) ->
    Now = date:unixtime(),
    MatchType = 2,
    Groups =
        group_and_filter(ets:tab2list(guild_hero_guild), []),
    group_match(Groups,
                #{round => Round, next_id => NextId, time => Now,
                  type => MatchType});
do_match(_, NextId, _) -> NextId.

group_and_filter([], Groups) -> Groups;
group_and_filter([G = #guild_hero_guild{cross_group =
                                            GroupId,
                                        team_leaders = [_ | _]}
                  | T],
                 Groups) ->
    case lists:keyfind(GroupId, 1, Groups) of
        {_, L} ->
            group_and_filter(T,
                             lists:keyreplace(GroupId,
                                              1,
                                              Groups,
                                              {GroupId, [G | L]}));
        _ -> group_and_filter(T, [{GroupId, [G]} | Groups])
    end;
group_and_filter([M = #guild_hero_match{cross_group =
                                            GroupId}
                  | T],
                 Groups) ->
    case lists:keyfind(GroupId, 1, Groups) of
        {_, L} ->
            group_and_filter(T,
                             lists:keyreplace(GroupId,
                                              1,
                                              Groups,
                                              {GroupId, [M | L]}));
        _ -> group_and_filter(T, [{GroupId, [M]} | Groups])
    end;
group_and_filter([_ | T], Groups) ->
    group_and_filter(T, Groups).

group_match([], #{next_id := NextId}) -> NextId;
group_match([{GroupId, L} | T],
            Args = #{round := Round}) ->
    L1 = util:keys_sort([#guild_hero_guild.lev], L),
    L2 = sort_guild(Round, GroupId, L1),
    NextId = do_create_match(L2,
                             Args#{cross_group => GroupId}),
    group_match(T, Args#{next_id := NextId}).

sort_guild(1, _GroupId, L) ->
    RL = ets:tab2list(guild_war_rank),
    SL = util:keys_sort([#guild_war_guild.member_num,
                         #guild_war_guild.score],
                        RL),
    do_sort_guild(SL, L);
sort_guild(_, GroupId, L) ->
    RL = ets:tab2list(guild_war_rank),
    SL = util:keys_sort([#guild_war_guild.member_num,
                         #guild_war_guild.score],
                        RL),
    L1 = do_sort_guild(SL, L),
    case lists:keyfind(erlang:get({match_fail, GroupId}),
                       #guild_hero_guild.id,
                       L1)
        of
        G1 = #guild_hero_guild{id = Gid1} ->
            L2 = util:keys_sort([#guild_hero_guild.win],
                                lists:keydelete(Gid1,
                                                #guild_hero_guild.id,
                                                L1)),
            [G1 | L2];
        _ -> util:keys_sort([#guild_hero_guild.win], L1)
    end.

do_sort_guild([], L) -> L;
do_sort_guild([#guild_war_guild{id = Id} | T], L) ->
    case lists:keyfind(Id, #guild_hero_guild.id, L) of
        G1 = #guild_hero_guild{} ->
            [G1 | do_sort_guild(T,
                                lists:keydelete(Id, #guild_hero_guild.id, L))];
        _ -> do_sort_guild(T, L)
    end.

do_create_match([],
                #{next_id := NextId, cross_group := GroupId}) ->
    erlang:erase({match_fail, GroupId}),
    case erlang:get({match_fail_ref, GroupId}) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NextId;
do_create_match([G = #guild_hero_guild{id = Id1,
                                       name = Name, map_pid = MapPid,
                                       logs = Logs, acc_win = Acc,
                                       team_leaders = Leaders}],
                #{next_id := NextId, time := Now, round := Round,
                  type := MatchType, cross_group := GroupId}) ->
    erlang:put({match_fail, GroupId}, Id1),
    case erlang:get({match_fail_ref, GroupId}) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {Items, Assets} = {[{23014, 6}], 3000000},
    Fmt =
        lang:get("我方选手在公会英雄中轮空直接获胜，公会因此获得~ts公会资金和~ts{face_1,38}"),
    Olog = notice:format(Fmt,
                         [{string_2, 5, Assets}, {item_2, Items}]),
    MatchId = {MatchType, NextId},
    WG = G#guild_hero_guild{match_id = MatchId,
                            acc_win = Acc + 1, win = 1,
                            logs = [{Now, Olog, {0, 0}, 0} | Logs]},
    B = #guild_hero_match{id = MatchId, gid1 = Id1,
                          g_name1 = Name, leaders = Leaders, time = Now,
                          round = Round, over = 1, cross_group = GroupId},
    sync_and_push(GroupId, 16205, [WG, B]),
    Ref = erlang:send_after(10 * 1000,
                            self(),
                            {reward_match_fail,
                             #{gid => Id1, name => Name, win => 1,
                               map_pid => MapPid, acc_win => Acc + 1}}),
    erlang:put({match_fail_ref, GroupId}, Ref),
    NextId + 1;
do_create_match([G1 = #guild_hero_guild{id =
                                            Id1 = {_, P1, Z1},
                                        name = Name1, team_leaders = Leaders1,
                                        logs = Logs1}
                 | T],
                Args = #{next_id := NextId, time := Now, round := Round,
                         type := MatchType, cross_group := GroupId}) ->
    case check_match(T, G1, []) of
        {ok,
         G2 = #guild_hero_guild{id = Id2 = {_, P2, Z2},
                                name = Name2, team_leaders = Leaders2,
                                logs = Logs2},
         Rest} ->
            MatchId = {MatchType, NextId},
            FightNum = max(length(Leaders1), length(Leaders2)),
            LostNum = 3 - FightNum,
            Msg = case Round of
                      1 ->
                          lang:get("公会英雄正式开始！本公会此轮的对手已经匹配，将在开战时公布。本次英雄战共分为两轮，第一轮对"
                                   "战将在1分钟后开始，代表队们加油哦{face_1,18}");
                      _ ->
                          lang:get("本公会第二轮的对手已经匹配，将在开战时公布，代表队们继续加油{face_1,18}")
                  end,
            FmtLog = lang:get("公会英雄战第~ts轮开始匹配对手"),
            Olog1 = notice:format(FmtLog, [{string_2, 5, Round}]),
            Olog2 = notice:format(FmtLog, [{string_2, 5, Round}]),
            WG1 = G1#guild_hero_guild{match_id = MatchId,
                                      lost = LostNum, win = 0,
                                      logs = [{Now, Olog1, {0, 0}, 0} | Logs1],
                                      last_rival = [Id2]},
            WG2 = G2#guild_hero_guild{match_id = MatchId,
                                      lost = LostNum, win = 0,
                                      logs = [{Now, Olog2, {0, 0}, 0} | Logs2],
                                      last_rival = [Id1]},
            cross:cast(P1, Z1, guild, notice, [Id1, Msg]),
            cross:cast(P2, Z2, guild, notice, [Id2, Msg]),
            B = #guild_hero_match{id = MatchId, gid1 = Id1,
                                  g_name1 = Name1, gid2 = Id2, g_name2 = Name2,
                                  leaders = Leaders1 ++ Leaders2, time = Now,
                                  round = Round, cross_group = GroupId},
            sync_and_push(GroupId, 16205, [WG1, WG2, B]),
            do_create_match(Rest, Args#{next_id := NextId + 1});
        false ->
            do_create_match([G1], Args),
            do_create_match(T, Args#{next_id := NextId + 1})
    end.

check_match([], _G1, UnMatched) ->
    case lists:reverse(UnMatched) of
        [G2 | T] -> {ok, G2, T};
        _ -> false
    end;
check_match([G2 = #guild_hero_guild{id = Id} | T],
            G1 = #guild_hero_guild{last_rival = Last}, UnMatched) ->
    case lists:member(Id, Last) of
        true -> check_match(T, G1, [G2 | UnMatched]);
        _ -> {ok, G2, UnMatched ++ T}
    end.

match_fight(Round) ->
    L = ets:match_object(guild_hero_match,
                         #guild_hero_match{round = Round, _ = '_'}),
    match_fight(L, Round).

match_fight([], _) -> ok;
match_fight([#guild_hero_match{over = 1} | T], Round) ->
    match_fight(T, Round);
match_fight([#guild_hero_match{leaders = Leaders,
                               gid1 = Gid1 = {_, P1, Z1},
                               gid2 = Gid2 = {_, P2, Z2}, g_name1 = Name1,
                               g_name2 = Name2, id = MatchId,
                               cross_group = GroupId}
             | T],
            Round) ->
    L1 = [R
          || R = #guild_hero_team_leader{gid = Rg1} <- Leaders,
             Gid1 =:= Rg1],
    L2 = [R
          || R = #guild_hero_team_leader{gid = Rg2} <- Leaders,
             Gid2 =:= Rg2],
    Args = #{round => Round, match_id => MatchId,
             cross_group => GroupId},
    case length(L1) > length(L2) of
        true -> match_fight(L1, L2, Gid2, Args);
        _ -> match_fight(L2, L1, Gid1, Args)
    end,
    Fmt =
        lang:get("~ts第~ts场对战正式开始，本次对阵的对手是~ts，各参赛选手们拿出你们的实力为公会争光"
                 "吧{face_1,18}"),
    Msg1 = notice:format(Fmt,
                         [{string_2, 1, lang:get("公会英雄")},
                          {string_2, 1, Round},
                          {string_2, 2, Name2}]),
    Msg2 = notice:format(Fmt,
                         [{string_2, 1, lang:get("公会英雄")},
                          {string_2, 1, Round},
                          {string_2, 2, Name1}]),
    cross:cast(P1, Z1, guild, notice, [Gid1, Msg1]),
    cross:cast(P2, Z2, guild, notice, [Gid2, Msg2]),
    match_fight(T, Round).

match_fight([], _, _, _Args) -> ok;
match_fight([#guild_hero_team_leader{id = Id1,
                                     gid = Gid1, position = Pos}
             | T],
            L, Gid2,
            Args = #{cross_group := GroupId, match_id := MatchId,
                     round := Round}) ->
    case lists:keyfind(Pos,
                       #guild_hero_team_leader.position,
                       L)
        of
        #guild_hero_team_leader{id = Id2} ->
            case {role:apply(sync,
                             Id1,
                             {guild_hero, role_callback, [to_fighter]}),
                  role:apply(sync,
                             Id2,
                             {guild_hero, role_callback, [to_fighter]})}
                of
                {{ok, [AH | AT]}, {ok, [DH | DT]}}
                    when length([AH | AT]) >= 3 andalso
                             length([DH | DT]) >= 3 ->
                    logger:debug("开打~w", [Pos], guild_hero, 1603),
                    ObserverArgs = {observer_args, [{0, Gid1}, {1, Gid2}]},
                    combat_mgr:start_combat(106,
                                            [AH | AT],
                                            [DH | DT],
                                            #combat_start_args{ext_args =
                                                                   [{Round,
                                                                     Pos,
                                                                     MatchId},
                                                                    ObserverArgs,
                                                                    {cross_group,
                                                                     GroupId}]});
                {{ok, [AH | AT]}, _} when length([AH | AT]) >= 3 ->
                    logger:debug("一方不在~w", [Id2], guild_hero, 1607),
                    lost_fight(Id2, Gid2),
                    win_fight([AH | AT], Gid1);
                {_, {ok, [DH | DT]}} when length([DH | DT]) >= 3 ->
                    logger:debug("一方不在~w", [Id1], guild_hero, 1611),
                    lost_fight(Id1, Gid1),
                    win_fight([DH | DT], Gid2);
                _R ->
                    logger:debug("参战 ~w", [_R], guild_hero, 1615),
                    lost_fight(Id1, Gid1),
                    lost_fight(#{id => Id2, gid => Gid2})
            end;
        _ ->
            logger:debug("找不到对手 ~w", [Pos], guild_hero, 1620),
            case role:apply(sync,
                            Id1,
                            {guild_hero, role_callback, [to_fighter]})
                of
                {ok, [AH | AT]} when length([AH | AT]) >= 3 ->
                    lost_fight(#{position => Pos, gid => Gid2}),
                    win_fight([AH | AT], Gid1);
                _ ->
                    lost_fight(Id1, Gid1),
                    lost_fight(#{position => Pos, gid => Gid2,
                                 judge => true})
            end
    end,
    match_fight(T, L, Gid2, Args).

all_leave() ->
    all_leave(ets:tab2list(guild_hero_guild)).

all_leave([]) -> ok;
all_leave([#guild_hero_guild{id = Id, map_pid = Pid}
           | T])
    when is_pid(Pid) ->
    case role_misc:is_local_role(Id) of
        true ->
            map:async_apply(Pid,
                            {guild_hero, role_callback, [leave]});
        _ -> ok
    end,
    all_leave(T);
all_leave([_ | T]) -> all_leave(T).

combat_cast(Winner, Loser, Args) ->
    do_combat_cast(win, Winner, Loser, Args),
    do_combat_cast(lost, Loser, Winner, Args).

do_combat_cast(_Type, _Ours, [], _) -> ok;
do_combat_cast(Type,
               Ours = [#{id := Oid, gid := Gid} | _], Theirs,
               #{pos := Pos, match_id := MatchId,
                 cross_group := GroupId}) ->
    [#{name := LeadName} | _] = [O
                                 || O = #{is_leader := 1} <- Theirs],
    Roles = [{Id, Name}
             || #{id := Id, name := Name} <- Ours],
    Msg = case Type of
              win ->
                  notice:format(lang:get("~ts~ts在公会英雄中战胜了~ts带领的对方队伍，为公会赢得了宝贵的1分{face_1,38}"),
                                [{string_1, pos_to_name(Pos)},
                                 {role_1, Roles},
                                 {role_2, LeadName}]);
              _ ->
                  notice:format(lang:get("~ts~ts在公会英雄中惜败于~ts带领的对方队伍，其他队伍加油啦！"),
                                [{string_1, pos_to_name(Pos)},
                                 {role_1, Roles},
                                 {role_2, LeadName}])
          end,
    case Gid of
        {_, P, Z} ->
            Now = date:unixtime(),
            cast(GroupId, {add_log, Gid, {Now, Msg, MatchId, Pos}}),
            cross:cast(P, Z, guild, notice, [Gid, Msg]);
        _ -> logger:error("~w找不到参赛公会", [Oid], guild_hero, 1667)
    end;
do_combat_cast(_, _, _, _) -> ok.

calc_fighter(_Type, []) -> ok;
calc_fighter(Type, L) ->
    case [O || O = #{is_leader := 1} <- L] of
        [F = #{id := Id, gid := Gid} | _] ->
            Fighters = [to(GF, #{gid => Gid}) || GF <- L],
            update(Fighters),
            Ids = [Fid || #{id := Fid} <- L],
            case ets:lookup(guild_hero_guild, Gid) of
                [G = #guild_hero_guild{match_id = MatchId,
                                       fighters = OldIds}] ->
                    case ets:lookup(guild_hero_match, MatchId) of
                        [M = #guild_hero_match{leaders = Leaders}] ->
                            NewF = case lists:keyfind(Id,
                                                      #guild_hero_team_leader.id,
                                                      Leaders)
                                       of
                                       #guild_hero_team_leader{} -> F;
                                       _ ->
                                           case get_leader_fighter(Leaders,
                                                                   Gid,
                                                                   L)
                                               of
                                               F1 = #{} -> F1;
                                               _ -> F
                                           end
                                   end,
                            calc_fighter(#{type => Type, leader => NewF,
                                           guild =>
                                               G#guild_hero_guild{fighters =
                                                                      lists:usort(Ids
                                                                                      ++
                                                                                      OldIds)},
                                           match => M, fighters => Fighters});
                        _ ->
                            logger:error("找不到战场信息[~w]",
                                         [MatchId],
                                         guild_hero,
                                         1694)
                    end;
                _ ->
                    logger:error("找不到公会参战信息[~w]", [Gid], guild_hero, 1697),
                    ok
            end;
        _ ->
            logger:error("找不到角色参战信息[~w]", [L], guild_hero, 1701),
            ok
    end.

calc_fighter(#{type := win, leader := #{id := Oid},
               guild := G = #guild_hero_guild{win = Win},
               match := M = #guild_hero_match{leaders = Leaders},
               fighters := Fighters}) ->
    G1 = G#guild_hero_guild{win = Win + 1},
    case lists:keyfind(Oid,
                       #guild_hero_team_leader.id,
                       Leaders)
        of
        R = #guild_hero_team_leader{win = RWin} ->
            R1 = R#guild_hero_team_leader{win = RWin + 1,
                                          is_win = 1, is_fighting = 0},
            Leaders1 = lists:keyreplace(Oid,
                                        #guild_hero_team_leader.id,
                                        Leaders,
                                        R1),
            M1 = M#guild_hero_match{leaders = Leaders1},
            sync_and_reward(G1, [G1, M1 | Fighters], win),
            ok;
        _ -> ok
    end;
calc_fighter(#{type := lost, leader := #{id := Oid},
               guild := G = #guild_hero_guild{lost = Lost, win = Win},
               match := M = #guild_hero_match{leaders = Leaders},
               fighters := Fighters}) ->
    logger:debug("失败结算", [], guild_hero, 1717),
    G1 = G#guild_hero_guild{lost = Lost + 1},
    case lists:keyfind(Oid,
                       #guild_hero_team_leader.id,
                       Leaders)
        of
        R = #guild_hero_team_leader{lost = RLost} ->
            R1 = R#guild_hero_team_leader{lost = RLost + 1,
                                          is_win = 2, is_fighting = 0},
            Leaders1 = lists:keyreplace(Oid,
                                        #guild_hero_team_leader.id,
                                        Leaders,
                                        R1),
            Data1 = case Lost + Win + 1 >= 3 of
                        true ->
                            update(G1),
                            save_result(M#guild_hero_match{leaders = Leaders1}),
                            Fighters;
                        _ ->
                            [G1, M#guild_hero_match{leaders = Leaders1}
                             | Fighters]
                    end,
            sync_and_reward(G1, Data1, lost),
            ok;
        _ -> ok
    end.

notice_match(Prefix, Round, 1) ->
    case do_notice_match(ets:match_object(guild_hero_match,
                                          #guild_hero_match{round = Round,
                                                            _ = '_'}))
        of
        [] -> ok;
        Arr ->
            Res = string:join(Arr, "、"),
            Fmt =
                lang:get("~ts公会对决列表：\n~ts\n，各参赛选手们拿出你们的实力为公会争光吧{face_1, "
                         "18}"),
            Msg = notice:format(Fmt,
                                [{string_1, Prefix}, {string_1, [Res]}]),
            notice:cast(all, 5, Msg)
    end;
notice_match(Prefix, Round, 2) ->
    Groups =
        group_and_filter(ets:match_object(guild_hero_match,
                                          #guild_hero_match{round = Round,
                                                            _ = '_'}),
                         []),
    group_notice_match(Groups, Prefix);
notice_match(_, _, _) -> ok.

group_notice_match([], _) -> ok;
group_notice_match([{GroupId, L} | T], Prefix) ->
    case do_notice_match(L) of
        [] -> ok;
        Arr ->
            Res = string:join(Arr, "、"),
            Fmt =
                lang:get("~ts公会对决列表：\n~ts\n，各参赛选手们拿出你们的实力为公会争光吧{face_1, "
                         "18}"),
            Msg = notice:format(Fmt,
                                [{string_1, Prefix}, {string_1, [Res]}]),
            group_apply(GroupId, notice, cast, [all, 5, Msg])
    end,
    group_notice_match(T, Prefix).

do_notice_match([]) -> [];
do_notice_match([#guild_hero_match{over = 1} | T]) ->
    do_notice_match(T);
do_notice_match([#guild_hero_match{g_name1 = Name1,
                                   g_name2 = Name2}
                 | T]) ->
    Msg = notice:format(lang:get("~ts 对阵 ~ts"),
                        [{string_2, 2, Name1}, {string_2, 2, Name2}]),
    [Msg | do_notice_match(T)].

clear_maps() ->
    do_clear_maps(ets:match(guild_hero_guild,
                            #guild_hero_guild{id = '$1', map_pid = '$2',
                                              _ = '_'})).

do_clear_maps([]) -> ok;
do_clear_maps([[Id, Pid] | T]) ->
    case role_misc:is_local_role(Id) of
        true ->
            clear_units(Pid),
            map:stop(Pid);
        _ -> ok
    end,
    do_clear_maps(T).

lost_fight(Id, Gid = {_, P, Z}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{match_id = MatchId, lost = Lost,
                               logs = Logs}] ->
            G1 = G#guild_hero_guild{lost = Lost + 1},
            case ets:lookup(guild_hero_match, MatchId) of
                [M = #guild_hero_match{leaders = Leaders,
                                       cross_group = GroupId}] ->
                    case lists:keyfind(Id,
                                       #guild_hero_team_leader.id,
                                       Leaders)
                        of
                        R = #guild_hero_team_leader{lost = RLost, name = Name,
                                                    position = Pos} ->
                            Now = date:unixtime(),
                            Olog =
                                notice:format(lang:get("~ts带领的~ts由于队伍到场不足~ts人，被当做弃权处理"),
                                              [{role_2, Name},
                                               {string_2, 5, pos_to_name(Pos)},
                                               {string_2, 5, 3}]),
                            cross:cast(P, Z, guild, notice, [Gid, Olog]),
                            NewG = G1#guild_hero_guild{logs =
                                                           [{Now,
                                                             Olog,
                                                             {0, 0},
                                                             0}
                                                            | Logs]},
                            Leaders1 = lists:keyreplace(Id,
                                                        #guild_hero_team_leader.id,
                                                        Leaders,
                                                        R#guild_hero_team_leader{is_win
                                                                                     =
                                                                                     2,
                                                                                 lost
                                                                                     =
                                                                                     RLost
                                                                                         +
                                                                                         1}),
                            M1 = M#guild_hero_match{leaders = Leaders1},
                            sync_and_push(GroupId, 16205, [NewG, M1]);
                        _ ->
                            logger:error("找不到队长 ~w", [Id], guild_hero, 1804),
                            ok
                    end;
                _ ->
                    logger:error("找不到战场 ~w, gid : ~w",
                                 [MatchId, Gid],
                                 guild_hero,
                                 1808),
                    ok
            end,
            case Lost + 1 >= 3 of
                true ->
                    EGid = case ets:lookup(guild_hero_match, MatchId) of
                               [#guild_hero_match{gid1 = Gid, gid2 = Gid2}] ->
                                   Gid2;
                               [#guild_hero_match{gid1 = Gid2, gid2 = Gid}] ->
                                   Gid2;
                               _ -> false
                           end,
                    case ets:lookup(guild_hero_guild, EGid) of
                        [#guild_hero_guild{lost = Lost2}] when Lost2 >= 3 ->
                            Msg = lang:get("由于本轮竞赛双方均未派出选手参战，系统判定双方都为战败。"),
                            cross:cast(P, Z, guild, notice, [Gid, Msg]),
                            cross:cast(P, Z, guild, notice, [EGid, Msg]);
                        _ -> ok
                    end;
                _ -> ok
            end,
            ok;
        _ ->
            logger:error("找不到公会gid : ~w", [Gid], guild_hero, 1829),
            ok
    end.

lost_fight([]) -> ok;
lost_fight([{Id, Gid} | T]) ->
    lost_fight(Id, Gid),
    lost_fight(T);
lost_fight(#{id := Id, gid := Gid = {_, P, Z}}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{match_id = MatchId, lost = Lost,
                               logs = Logs, win = Win}] ->
            G1 = G#guild_hero_guild{lost = Lost + 1},
            case ets:lookup(guild_hero_match, MatchId) of
                [M = #guild_hero_match{leaders = Leaders,
                                       cross_group = GroupId}] ->
                    case lists:keyfind(Id,
                                       #guild_hero_team_leader.id,
                                       Leaders)
                        of
                        R = #guild_hero_team_leader{lost = RLost, name = Name,
                                                    position = Pos} ->
                            Now = date:unixtime(),
                            Olog =
                                notice:format(lang:get("~ts带领的~ts由于队伍到场不足~ts人，被当做弃权处理"),
                                              [{role_2, Name},
                                               {string_2, 5, pos_to_name(Pos)},
                                               {string_2, 5, 3}]),
                            cross:cast(P, Z, guild, notice, [Gid, Olog]),
                            NewG = G1#guild_hero_guild{logs =
                                                           [{Now,
                                                             Olog,
                                                             {0, 0},
                                                             0}
                                                            | Logs]},
                            Leaders1 = lists:keyreplace(Id,
                                                        #guild_hero_team_leader.id,
                                                        Leaders,
                                                        R#guild_hero_team_leader{is_win
                                                                                     =
                                                                                     2,
                                                                                 lost
                                                                                     =
                                                                                     RLost
                                                                                         +
                                                                                         1}),
                            M1 = M#guild_hero_match{leaders = Leaders1},
                            Data1 = [NewG],
                            case Lost + Win + 1 >= 3 of
                                true ->
                                    update(Data1),
                                    save_result(M);
                                _ -> sync_and_push(GroupId, 16205, [M1 | Data1])
                            end;
                        _ ->
                            logger:error("找不到队长 ~w", [Id], guild_hero, 1860),
                            ok
                    end;
                _ ->
                    logger:error("找不到战场 ~w, gid : ~w",
                                 [MatchId, Gid],
                                 guild_hero,
                                 1864),
                    ok
            end,
            case Lost + 1 >= 3 of
                true ->
                    EGid = case ets:lookup(guild_hero_match, MatchId) of
                               [#guild_hero_match{gid1 = Gid, gid2 = Gid2}] ->
                                   Gid2;
                               [#guild_hero_match{gid1 = Gid2, gid2 = Gid}] ->
                                   Gid2;
                               _ -> false
                           end,
                    case ets:lookup(guild_hero_guild, EGid) of
                        [#guild_hero_guild{lost = Lost2}] when Lost2 >= 3 ->
                            Msg = lang:get("由于本轮竞赛双方均未派出选手参战，系统判定双方都为战败。"),
                            cross:cast(P, Z, guild, notice, [Gid, Msg]),
                            cross:cast(P, Z, guild, notice, [EGid, Msg]);
                        _ -> ok
                    end;
                _ -> ok
            end,
            ok;
        _ ->
            logger:error("找不到公会gid : ~w", [Gid], guild_hero, 1885),
            ok
    end;
lost_fight(Args = #{position := Pos,
                    gid := Gid = {_, P, Z}}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{lost = Lost, logs = Logs,
                               match_id = MatchId, cross_group = GroupId,
                               win = Win}] ->
            Now = date:unixtime(),
            Olog = notice:format(lang:get("~ts由于没有安排领队，被当做弃权处理"),
                                 [{string_2, 5, pos_to_name(Pos)}]),
            cross:cast(P, Z, guild, notice, [Gid, Olog]),
            Data1 = [G#guild_hero_guild{lost = Lost + 1,
                                        logs =
                                            [{Now, Olog, {0, 0}, 0} | Logs]}],
            case Args of
                #{judge := true} when Lost + Win + 1 >= 3 ->
                    case ets:lookup(guild_hero_match, MatchId) of
                        [M = #guild_hero_match{}] ->
                            update(Data1),
                            save_result(M);
                        _ -> sync_and_push(GroupId, 16205, Data1)
                    end;
                _ -> sync_and_push(GroupId, 16205, Data1)
            end,
            case Lost + 1 >= 3 of
                true ->
                    EGid = case ets:lookup(guild_hero_match, MatchId) of
                               [#guild_hero_match{gid1 = Gid, gid2 = Gid2}] ->
                                   Gid2;
                               [#guild_hero_match{gid1 = Gid2, gid2 = Gid}] ->
                                   Gid2;
                               _ -> false
                           end,
                    case ets:lookup(guild_hero_guild, EGid) of
                        [#guild_hero_guild{lost = Lost2}] when Lost2 >= 3 ->
                            Msg = lang:get("由于本轮竞赛双方均未派出选手参战，系统判定双方都为战败。"),
                            cross:cast(P, Z, guild, notice, [Gid, Msg]),
                            cross:cast(P, Z, guild, notice, [EGid, Msg]);
                        _ -> ok
                    end;
                _ -> ok
            end,
            ok;
        _ ->
            logger:error("找不到公会gid : ~w", [Gid], guild_hero, 1925),
            ok
    end.

win_fight(Winner, Gid) ->
    do_win_fight([to(F, #{type => fighter, gid => Gid})
                  || F <- Winner],
                 []).

do_win_fight([], _) -> ok;
do_win_fight([F = #guild_hero_fighter{id = Id,
                                      gid = Gid = {_, P, Z}}
              | T],
             Fighters) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [G = #guild_hero_guild{match_id = MatchId, win = Win,
                               lost = Lost, logs = Logs}] ->
            NewG = G#guild_hero_guild{win = Win + 1},
            case ets:lookup(guild_hero_match, MatchId) of
                [M = #guild_hero_match{leaders = Leaders,
                                       cross_group = GroupId}] ->
                    case lists:keyfind(Id,
                                       #guild_hero_team_leader.id,
                                       Leaders)
                        of
                        R = #guild_hero_team_leader{lost = RWin, name = Name,
                                                    position = Pos} ->
                            Now = date:unixtime(),
                            Olog =
                                notice:format(lang:get("由于对方弃权，~ts带领的~ts由于队伍直接胜利赢得1分"),
                                              [{role_2, Name},
                                               {string_2,
                                                5,
                                                pos_to_name(Pos)}]),
                            cross:cast(P, Z, guild, notice, [Gid, Olog]),
                            Data1 = [[F | T],
                                     Fighters,
                                     NewG#guild_hero_guild{logs =
                                                               [{Now,
                                                                 Olog,
                                                                 {0, 0},
                                                                 0}
                                                                | Logs]}],
                            Leaders1 = lists:keyreplace(Id,
                                                        #guild_hero_team_leader.id,
                                                        Leaders,
                                                        R#guild_hero_team_leader{is_win
                                                                                     =
                                                                                     1,
                                                                                 lost
                                                                                     =
                                                                                     RWin
                                                                                         +
                                                                                         1}),
                            case Lost + Win + 1 >= 3 of
                                true ->
                                    update(Data1),
                                    save_result(M#guild_hero_match{leaders =
                                                                       Leaders1});
                                _ ->
                                    sync_and_push(GroupId,
                                                  16205,
                                                  [M#guild_hero_match{leaders =
                                                                          Leaders1}
                                                   | Data1])
                            end;
                        _ -> do_win_fight(T, [F | Fighters])
                    end;
                _ ->
                    logger:error("找不到战场 ~w, gid : ~w",
                                 [MatchId, Gid],
                                 guild_hero,
                                 1957),
                    ok
            end;
        _ ->
            logger:error("找不到公会gid : ~w", [Gid], guild_hero, 1961),
            ok
    end.

save_result(#guild_hero_match{id = Id, over = 1}) ->
    logger:error("战场~w结算多次", [Id], guild_hero, 1967),
    ok;
save_result(M = #guild_hero_match{gid1 = Gid1,
                                  gid2 = Gid2, g_name1 = Name1, g_name2 = Name2,
                                  round = Round, cross_group = GroupId}) ->
    Data1 = [M#guild_hero_match{over = 1}],
    Now = date:unixtime(),
    case {ets:lookup(guild_hero_guild, Gid1),
          ets:lookup(guild_hero_guild, Gid2)}
        of
        {[G1 = #guild_hero_guild{win = Win1, acc_win = Acc,
                                 logs = Logs1, map_pid = MapPid1}],
         [G2 = #guild_hero_guild{win = Win2, logs = Logs2,
                                 map_pid = MapPid2, acc_win = Acc2}]}
            when Win1 > 1 ->
            do_reward_guild(#{gid => Gid1, win => Win1,
                              loot => {[{23014, 6}], 3000000}, type => win,
                              name => Name2}),
            do_reward_guild(#{gid => Gid2, win => Win2,
                              loot => {[{23014, 2}], 500000}, type => lost,
                              name => Name1}),
            ScoreStr = util:flist("~w:~w", [Win1, Win2]),
            Msg =
                notice:format(lang:get("~ts公会在公会英雄第~ts轮中以~ts的成绩战胜~ts公会，公会因此获得了丰厚的奖励{f"
                                       "ace_1,18}"),
                              [{string_2, 2, Name1},
                               {string_2, 5, Round},
                               {string_2, 5, ScoreStr},
                               {string_2, 2, Name2}]),
            group_apply(GroupId, notice, cast, [all, 5, Msg]),
            {Items1, Assets1} = {[{23014, 6}], 3000000},
            Olog1 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，战胜了~ts公会，公会因此获得~ts公会资金和~ts"),
                              [{string_2, 5, Win1},
                               {string_2, 2, Name2},
                               {string_2, 5, Assets1},
                               {item_2, Items1}]),
            NewG1 = G1#guild_hero_guild{acc_win = Acc + 1,
                                        logs =
                                            [{Now, Olog1, {0, 0}, 0} | Logs1]},
            {Items2, Assets2} = {[{23014, 2}], 500000},
            Olog2 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，惜败于~ts公会，公会仅获得了基础奖励~ts公会资金"
                                       "和~ts"),
                              [{string_2, 5, Win2},
                               {string_2, 2, Name1},
                               {string_2, 5, Assets2},
                               {item_2, Items2}]),
            NewG2 = G2#guild_hero_guild{logs =
                                            [{Now, Olog2, {0, 0}, 0} | Logs2]},
            delay_create_box(#{gid => Gid1, win => Win1,
                               map_pid => MapPid1, round => Round,
                               acc_win => Acc + 1}),
            delay_create_box(#{gid => Gid2, win => Win2,
                               map_pid => MapPid2, round => Round,
                               acc_win => Acc2}),
            sync_and_push(GroupId, 16205, [NewG1, NewG2 | Data1]);
        {[G1 = #guild_hero_guild{win = Win1, logs = Logs1,
                                 map_pid = MapPid1, acc_win = Acc1}],
         [G2 = #guild_hero_guild{acc_win = Acc, win = Win2,
                                 logs = Logs2, map_pid = MapPid2}]}
            when Win2 > 1 ->
            do_reward_guild(#{gid => Gid2, win => Win2,
                              loot => {[{23014, 6}], 3000000}, type => win,
                              name => Name1}),
            do_reward_guild(#{gid => Gid1, win => Win1,
                              loot => {[{23014, 2}], 500000}, type => lost,
                              name => Name2}),
            ScoreStr = util:flist("~w:~w", [Win2, Win1]),
            Msg =
                notice:format(lang:get("~ts公会在公会英雄第~ts轮中以~ts的成绩战胜~ts公会，公会因此获得了丰厚的奖励{f"
                                       "ace_1,18}"),
                              [{string_2, 2, Name2},
                               {string_2, 5, Round},
                               {string_2, 5, ScoreStr},
                               {string_2, 2, Name1}]),
            group_apply(GroupId, notice, cast, [all, 5, Msg]),
            {Items1, Assets1} = {[{23014, 2}], 500000},
            Olog1 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，惜败于~ts公会，公会仅获得了基础奖励~ts公会资金"
                                       "和~ts"),
                              [{string_2, 5, Win1},
                               {string_2, 2, Name2},
                               {string_2, 5, Assets1},
                               {item_2, Items1}]),
            NewG1 = G1#guild_hero_guild{logs =
                                            [{Now, Olog1, {0, 0}, 0} | Logs1]},
            {Items2, Assets2} = {[{23014, 6}], 3000000},
            Olog2 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，战胜了~ts公会，公会因此获得~ts公会资金和~ts"
                                       "个功勋宝箱"),
                              [{string_2, 5, Win2},
                               {string_2, 2, Name1},
                               {string_2, 5, Assets2},
                               {item_2, Items2}]),
            NewG2 = G2#guild_hero_guild{acc_win = Acc + 1,
                                        logs =
                                            [{Now, Olog2, {0, 0}, 0} | Logs2]},
            delay_create_box(#{gid => Gid1, win => Win1,
                               map_pid => MapPid1, round => Round,
                               acc_win => Acc1}),
            delay_create_box(#{gid => Gid2, win => Win2,
                               map_pid => MapPid2, round => Round,
                               acc_win => Acc + 1}),
            sync_and_push(GroupId, 16205, [NewG1, NewG2 | Data1]);
        {[G1 = #guild_hero_guild{logs = Logs1, name = Name1,
                                 win = Win1, map_pid = MapPid1,
                                 acc_win = Acc1}],
         [G2 = #guild_hero_guild{logs = Logs2, name = Name2,
                                 win = Win2, map_pid = MapPid2,
                                 acc_win = Acc2}]} ->
            Msg =
                notice:format(lang:get("~ts公会与~ts公会势均力敌，在公会英雄中打成平局！{face_1, "
                                       "19}"),
                              [{string_2, 2, Name2}, {string_2, 2, Name1}]),
            group_apply(GroupId, notice, cast, [all, 5, Msg]),
            do_reward_guild(#{gid => Gid1, win => Win1,
                              loot => {[{23014, 2}], 500000}, type => lost,
                              name => Name2}),
            do_reward_guild(#{gid => Gid2, win => Win2,
                              loot => {[{23014, 2}], 500000}, type => lost,
                              name => Name1}),
            delay_create_box(#{gid => Gid1, win => Win1,
                               map_id => MapPid1, round => Round,
                               acc_win => Acc1}),
            delay_create_box(#{gid => Gid2, win => Win2,
                               map_id => MapPid2, round => Round,
                               acc_win => Acc2}),
            {Items1, Assets1} = {[{23014, 2}], 500000},
            {Items2, Assets2} = {[{23014, 2}], 500000},
            Olog1 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，惜败于~ts公会，公会仅获得了基础奖励~ts公会资金"
                                       "和~ts"),
                              [{string_2, 5, Win1},
                               {string_2, 2, Name2},
                               {string_2, 5, Assets1},
                               {item_2, Items1}]),
            NewG1 = G1#guild_hero_guild{logs =
                                            [{Now, Olog1, {0, 0}, 0} | Logs1]},
            Olog2 =
                notice:format(lang:get("我方选手在公会英雄中取得~ts场胜利，惜败于~ts公会，公会仅获得了基础奖励~ts公会资金"
                                       "和~ts"),
                              [{string_2, 5, Win2},
                               {string_2, 2, Name1},
                               {string_2, 5, Assets2},
                               {item_2, Items2}]),
            NewG2 = G2#guild_hero_guild{logs =
                                            [{Now, Olog2, {0, 0}, 0} | Logs2]},
            sync_and_push(GroupId, 16205, [NewG1, NewG2 | Data1]);
        _ -> ok
    end.

pos_to_name(1) -> lang:get("月亮代表队");
pos_to_name(2) -> lang:get("太阳代表队");
pos_to_name(_) -> lang:get("星辰代表队").

stop_fighting() ->
    L = ets:tab2list(guild_hero_match),
    stop_fighting(L).

stop_fighting([]) -> ok;
stop_fighting([#guild_hero_match{leaders = Leaders}
               | T]) ->
    lists:foreach(fun (#guild_hero_team_leader{id = Id}) ->
                          role:apply(async,
                                     Id,
                                     {guild_hero,
                                      role_callback,
                                      [stop_fighting]});
                      (_) -> ok
                  end,
                  Leaders),
    stop_fighting(T).

do_reward_guild(#{gid := Gid = {_, P, Z}, win := Win,
                  loot := {Items, Assets}, type := Type, name := Name}) ->
    Pref = case Type of
               win -> lang:get("公会英雄胜利！");
               _ -> lang:get("公会英雄战惜败！")
           end,
    cross:cast(P, Z, guild_loot, add, [Gid, Items, Pref]),
    cross:cast(P,
               Z,
               guild_common,
               add_assets,
               [Gid, {not_weekly, Assets}]),
    Fmt = case Type of
              win ->
                  lang:get("我方选手在公会英雄中取得~ts场胜利，战胜了~ts公会，公会因此获得~ts公会资金和~ts"
                           "{face_1,38}");
              _ ->
                  lang:get("我方选手在公会英雄中取得~ts场胜利，惜败于~ts公会，公会仅获得了基础奖励~ts公会资金"
                           "和~ts{face_1,21}")
          end,
    Msg = notice:format(Fmt,
                        [{string_2, 5, Win},
                         {string_2, 2, Name},
                         {string_2, 5, Assets},
                         {item_2, Items}]),
    cross:cast(P, Z, guild, notice, [Gid, Msg]);
do_reward_guild(_) -> ok.

notice_guild(Msg) ->
    Now = date:unixtime(),
    lists:foreach(fun ([Pid, Lev, _, _]) when Lev < 2 ->
                          guild:notice(Pid,
                                       notice:format(lang:get("由于本公会等级＜~ts级，无法参加本次~ts，请尽快提升等级哟！"),
                                                     [{string_2, 5, 2},
                                                      {string_2,
                                                       5,
                                                       lang:get("公会英雄")}]));
                      ([Pid, _, _, MemNum]) when MemNum < 50 ->
                          guild:notice(Pid,
                                       notice:format(lang:get("由于本公会总人数＜~ts人，无法参加本次~ts，快去再招点人吧！"),
                                                     [{string_2, 5, 50},
                                                      {string_2,
                                                       5,
                                                       lang:get("公会英雄")}]));
                      ([Pid, _, Created, _]) when Now - Created < 86400 * 3 ->
                          guild:notice(Pid,
                                       notice:format(lang:get("由于本公会创建天数＜~ts天，无法参加本次~ts，请加油提升公会吧！"),
                                                     [{string_2, 5, 3},
                                                      {string_2,
                                                       5,
                                                       lang:get("公会英雄")}]));
                      ([Pid, _, _, _]) -> guild:notice(Pid, Msg);
                      (_) -> ok
                  end,
                  ets:match(guild_list,
                            #guild{pid = '$1', lev = '$2', create_time = '$3',
                                   mem_num = '$4', _ = '_'})).

mail_guild(Title, Content) ->
    Now = date:unixtime(),
    Conds = [{'>=', '$2', 2},
             {'>=', '$3', 50},
             {'>=', {'-', Now, '$4'}, 86400 * 3}],
    MatchSpec = [{#guild{id = '$1', lev = '$2',
                         mem_num = '$3', create_time = '$4', _ = '_'},
                  Conds,
                  ['$1']}],
    L = ets:select(guild_list, MatchSpec),
    lists:foreach(fun (Id) ->
                          guild_common:send_mail(Id, Title, Content)
                  end,
                  L).

mail_leaders([]) -> ok;
mail_leaders([#guild_hero_team_leader{id = Id,
                                      position = Pos}
              | T]) ->
    Content =
        notice:format(lang:get("~ts已经进入准备阶段，你被任命为~ts领队，快到公会准备区组起队伍一展风采吧！（如果活动"
                               "正式开始后未到场或队伍人数不足~ts人，将被视作弃权）"),
                      [{string_2, 1, lang:get("公会英雄")},
                       {string_2, 5, pos_to_name(Pos)},
                       {string_2, 5, 3}]),
    MailInfo = #{title => lang:get("公会英雄"),
                 content => Content, items => []},
    mail:send(Id, MailInfo),
    mail_leaders(T).

create_box(G = #guild_hero_guild{map_id = MapId,
                                 fighters = Ids, acc_win = Acc, id = Gid},
           2) ->
    Msg =
        notice:format(lang:get("本届~ts已经圆满结束，根据本公会的胜利情况，公会场地中将会洒出一批~ts{face_1,29}"),
                      [{string_2, 1, lang:get("公会英雄")},
                       {string_2, 5, lang:get("胜利宝箱")}]),
    case map_mgr:info(MapId) of
        {ok, #map{num = RoleNum}} when Acc >= 2 ->
            guild:notice(Gid, Msg),
            reward_honor(G),
            do_create_box({25, MapId, 79665},
                          min(15, max(6, length(Ids)))),
            do_create_box({25, MapId, 79666},
                          min(40,
                              max(6,
                                  round(max(RoleNum - length(Ids), 0) *
                                            5.0e-1))));
        {ok, #map{num = RoleNum}} when Acc =:= 1 ->
            guild:notice(Gid, Msg),
            FNum = round(length(Ids) * 5.0e-1),
            do_create_box({25, MapId, 79665},
                          min(15, max(6, FNum))),
            do_create_box({25, MapId, 79666},
                          min(40,
                              max(6,
                                  round(max(RoleNum - length(Ids), 0) *
                                            2.99999999999999988898e-1)
                                      + FNum)));
        _ -> ok
    end;
create_box(_, _) -> ok.

do_create_box(_, Num) when Num < 1 -> ok;
do_create_box(Where = {GuildBattleId, MapId, UnitId},
              Num) ->
    {X, Y} = map:rand_pos(30006),
    unit_mgr:create(GuildBattleId, UnitId, {MapId, X, Y}),
    do_create_box(Where, Num - 1).

create_units(_Where, []) -> ok;
create_units(Where = {GuildBattleId, MapId},
             [{BaseId, X, Y} | T]) ->
    unit_mgr:create(GuildBattleId, BaseId, {MapId, X, Y}),
    create_units(Where, T).

clear_units(MapPid) ->
    case map:unit_list(MapPid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{id = Uid}) ->
                                  unit_mgr:remove(Uid);
                              (_) -> ok
                          end,
                          L);
        _R ->
            logger:debug("找不到单位 ~w", [_R], guild_hero, 2132),
            ok
    end.

async_leave(Role, _) ->
    case leave(Role) of
        {ok, Role1} -> {ok, Role1};
        _ -> {ok, Role}
    end.

encounter_notice([], _) -> ok;
encounter_notice([{leader, #role{pid = Pid}, _} | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    encounter_notice(T, Msg);
encounter_notice([{leader,
                   #fighter_wrap{fighter = #fighter{pid = Pid}},
                   _}
                  | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    encounter_notice(T, Msg);
encounter_notice([#team_mate{pid = Pid} | T], Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    encounter_notice(T, Msg);
encounter_notice([#fighter{pid = Pid, type = 1} | T],
                 Msg) ->
    notice:send({pid, Pid}, 3, Msg),
    encounter_notice(T, Msg);
encounter_notice([_ | T], Msg) ->
    encounter_notice(T, Msg).

delay_create_box(#{gid := Gid = {_, P, Z}, win := Win,
                   round := 2, acc_win := AccWin})
    when Win < 1 orelse AccWin < 1 ->
    Msg2 = lang:get("本次公会英雄已经圆满结束，请大家有序离场哦！"),
    cross:cast(P, Z, guild, notice, [Gid, Msg2]),
    erlang:send_after(300 * 1000, self(), {kickout, Gid}),
    ok;
delay_create_box(#{gid := Gid = {_, P, Z},
                   map_pid := MapPid, round := 2}) ->
    case is_pid(MapPid) of
        true ->
            map:async_apply(MapPid,
                            {guild_hero, role_callback, [pop]});
        _ -> ok
    end,
    cross:cast(P,
               Z,
               erlang,
               send_after,
               [60 * 1000, guild_hero, {create_box, Gid}]),
    ok;
delay_create_box(_) -> ok.

next_add_exp() ->
    OldRef = erlang:get(add_exp_ref),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = erlang:send_after(60 * 1000, self(), add_exp),
    erlang:put(add_exp_ref, Ref).

reward_honor(#guild_hero_guild{id = Gid, fighters = L,
                               team_leaders = L1}) ->
    Msg2 =
        notice:format(lang:get("本公会在~ts中连续获得2轮胜利，所有参赛选手获得~ts称号{face_1,18}"),
                      [{string_2, 1, lang:get("公会英雄")},
                       {string_2, 5, lang:get("公会英雄")}]),
    guild:notice(Gid, Msg2),
    L2 = [LeaderId
          || #guild_hero_team_leader{id = LeaderId} <- L1],
    L3 = lists:usort(L2 ++ L),
    honor_mgr:add(guild_hero_winner,
                  [{HRid, 30109} || HRid <- L3],
                  0);
reward_honor(_) -> ok.

broadcast_match() ->
    Fun = fun (#guild_hero_guild{map_pid = MapPid}, _)
                  when is_pid(MapPid) ->
                  map:async_apply(MapPid,
                                  {guild_hero, role_callback, [{push, 16205}]});
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, guild_hero_guild).

do_check_pick([], _) -> true;
do_check_pick([fighter | T],
              Role = #role{id = Id, m_guild = #m_guild{id = Gid}}) ->
    case ets:lookup(guild_hero_fighter, Id) of
        [#guild_hero_fighter{}] -> do_check_pick(T, Role);
        _ ->
            case ets:lookup(guild_hero_guild, Gid) of
                [#guild_hero_guild{team_leaders = Leaders}] ->
                    case lists:keyfind(Id,
                                       #guild_hero_team_leader.id,
                                       Leaders)
                        of
                        #guild_hero_team_leader{} -> do_check_pick(T, Role);
                        _ -> {false, lang:get("这个宝箱只有参赛者可以捡")}
                    end;
                _ -> {false, lang:get("这个宝箱只有参赛者可以捡")}
            end
    end;
do_check_pick([picked | T],
              Role = #role{id = Id, m_guild = #m_guild{id = Gid}}) ->
    case gen_fsm:sync_send_all_state_event(guild_hero,
                                           {check_pick, Id, Gid})
        of
        true -> do_check_pick(T, Role);
        Else -> Else
    end.

check_team_mate(Role = #role{m_guild =
                                 #m_guild{id = Gid},
                             id = Id}) ->
    case ets:lookup(guild_hero_guild, Gid) of
        [#guild_hero_guild{match_id = MatchId}] ->
            case ets:lookup(guild_hero_match, MatchId) of
                [#guild_hero_match{leaders = Leaders}] ->
                    case check_team_mate(Id,
                                         team:get_members(Role),
                                         Leaders)
                        of
                        true ->
                            {ok, FW} = role_convert:to(fighter_wrap, Role),
                            team:get_fighters(FW);
                        Else -> Else
                    end;
                _ -> false
            end;
        _ -> false
    end.

check_team_mate(_Id, [], _) -> false;
check_team_mate(Id, Mates, Leaders) ->
    case lists:keytake(Id,
                       #guild_hero_team_leader.id,
                       Leaders)
        of
        {value,
         #guild_hero_team_leader{position = MyPos},
         Others} ->
            do_check_team_mate(Others, MyPos, Mates);
        _ -> false
    end.

do_check_team_mate([], _, _) -> true;
do_check_team_mate([#guild_hero_team_leader{id = Id,
                                            position = Pos}
                    | T],
                   MyPos, Mates) ->
    case lists:keyfind(Id, #team_mate.id, Mates) of
        #team_mate{status = 1} -> false;
        #team_mate{status = 2}
            when MyPos =/= 2 andalso Pos < MyPos ->
            false;
        #team_mate{status = 2} when Pos =:= 2 -> false;
        _ -> do_check_team_mate(T, MyPos, Mates)
    end.

get_leader_fighter(Leaders, Gid, L) ->
    SortLeaders = util:keys_sort([{asc,
                                   #guild_hero_team_leader.position}],
                                 [Aleader
                                  || Aleader = #guild_hero_team_leader{gid =
                                                                           AGid}
                                         <- Leaders,
                                     AGid =:= Gid]),
    get_leader_fighter(SortLeaders, L).

get_leader_fighter([], _) -> false;
get_leader_fighter([#guild_hero_team_leader{id = Id}
                    | T],
                   Fighters) ->
    case [O || O = #{id := Fid} <- Fighters, Fid =:= Id] of
        [F | _] -> F;
        _ -> get_leader_fighter(T, Fighters)
    end.

delete_combat_records(1) -> ok;
delete_combat_records(_) ->
    Fun = fun (#guild_hero_match{id = Id}, _) ->
                  combat_record:delete({8, {Id, 1}}),
                  combat_record:delete({8, {Id, 2}}),
                  combat_record:delete({8, {Id, 3}});
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, guild_hero_match).

load_data() ->
    dets:to_ets(guild_hero_guild, guild_hero_guild).

check_open_mode(_IsCross = 1) -> 2;
check_open_mode(_) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    case guild_hero_data:get_cross_group({Platform, ZoneId})
        of
        false -> 1;
        _ -> 3
    end.

enroll(3, Data) ->
    cross:cast(erlang, send, [guild_hero, {enroll, Data}]);
enroll(_, _) -> ok.

sync_data(0, _) -> ok;
sync_data(GroupId, Data) ->
    group_apply(GroupId,
                erlang,
                send,
                [guild_hero, {sync_data, Data}]).

update([]) -> ok;
update([G | T]) ->
    update(G),
    update(T);
update(G = #guild_hero_guild{}) ->
    ets:insert(guild_hero_guild, G);
update(M = #guild_hero_match{}) ->
    ets:insert(guild_hero_match, M);
update(F = #guild_hero_fighter{}) ->
    ets:insert(guild_hero_fighter, F);
update(_D) ->
    logger:error("未知数据 ~w", [_D], guild_hero, 2324),
    ok.

update_and_push(16205, Data) ->
    update(Data),
    [map:async_apply(MapPid,
                     {guild_hero, role_callback, [{push, 16205}]})
     || #guild_hero_guild{id = Id, map_pid = MapPid} <- Data,
        is_pid(MapPid) andalso role_misc:is_local_role(Id)],
    ok;
update_and_push(_Cmd, Data) ->
    update(Data),
    logger:error("未知协议 ~w", [_Cmd], guild_hero, 2334),
    ok.

sync_and_push(0, Cmd, Data) ->
    update_and_push(Cmd, Data);
sync_and_push(GroupId, Cmd, Data) ->
    update(Data),
    group_apply(GroupId,
                erlang,
                send,
                [guild_hero, {update_and_push, Cmd, Data}]).

group_apply(0, M, F, A) -> erlang:apply(M, F, A);
group_apply(GroupId, M, F, A) ->
    do_group_apply(guild_hero_data:list_by_group(GroupId),
                   M,
                   F,
                   A).

do_group_apply([], _, _, _) -> ok;
do_group_apply([{P, Z} | T], M, F, A) ->
    cross:cast(P, Z, M, F, A),
    do_group_apply(T, M, F, A).

cast(0, Args) -> guild_hero ! Args;
cast(_, Args) ->
    cross:cast(erlang, send, [guild_hero, Args]).

sync_and_reward(G = #guild_hero_guild{cross_group = 0},
                Data, Type) ->
    update_and_reward(G, Data, Type);
sync_and_reward(G = #guild_hero_guild{cross_group =
                                          GroupId},
                Data, Type) ->
    update(Data),
    group_apply(GroupId,
                erlang,
                send,
                [guild_hero, {update_and_reward, G, Data, Type}]).

update_and_reward(#guild_hero_guild{map_pid = MapPid},
                  Data, Type) ->
    update(Data),
    case is_pid(MapPid) of
        true ->
            map:async_apply(MapPid,
                            {guild_hero,
                             role_callback,
                             [{fight_reward, Type}]});
        _ -> ok
    end.

