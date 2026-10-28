-file("src/mod/dungeon/dungeon_team.erl", 1).

-module(dungeon_team).

-behaviour(gen_server).

-export([login/1,
         logout/1,
         enlist/2,
         leave_enlisting/1,
         leave_handover/1,
         match/2,
         unmatch/1,
         join/3,
         apply_join/2,
         match_join/2,
         choose/2,
         start/1,
         lookup/1,
         fetch_mate/1,
         list_enlistment/1,
         leave/1,
         ask_help/2,
         answer_help/3,
         kickout/2,
         chat/3,
         sync_kickout/2,
         handover/1,
         set_event/1,
         set_event/3,
         reply_invite/2,
         sync_data/1,
         role_callback/2,
         push/2]).

-export([start_link/1]).

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

-file("src/mod/dungeon/dungeon_team.erl", 43).

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

-file("src/mod/dungeon/dungeon_team.erl", 44).

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

-file("src/mod/dungeon/dungeon_team.erl", 45).

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

-file("src/mod/dungeon/dungeon_team.erl", 46).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/dungeon/dungeon_team.erl", 47).

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

-file("src/mod/dungeon/dungeon_team.erl", 48).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/dungeon/dungeon_team.erl", 49).

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

-file("src/mod/dungeon/dungeon_team.erl", 50).

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

-file("src/mod/dungeon/dungeon_team.erl", 51).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/dungeon/dungeon_team.erl", 52).

-record(state,
        {pair_ref :: undefined | reference(),
         sync_ref :: undefined | reference(),
         mode,
         next_id = 1 :: non_neg_integer(),
         update_enlisting = [] :: list(),
         stop_enlisting = [] :: list()}).

login(Role = #role{s_event = 43}) ->
    {ok, Role#role{s_event = 0}};
login(_) -> ok.

logout(Role = #role{s_event = 43}) -> leave(Role);
logout(Role) ->
    leave(Role),
    ok.

enlist(Role = #role{}, DunId) ->
    case check_mates(Role, DunId) of
        {ok, Role1 = #role{}} ->
            {ok, M} = role_convert:to(dungeon_mate, Role1),
            Leader = M#dungeon_mate{status = 1, dun_id = DunId},
            Team = #dungeon_team{leader = Leader, member_num = 1,
                                 dun_id = DunId, status = 1},
            case case catch gen_server:call(dungeon_team,
                                            {enlist, Team},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                ok ->
                    NewRole = Role1#role{s_event = 43},
                    map:role_update(NewRole),
                    push(NewRole, 12130),
                    {ok, NewRole};
                Fail ->
                    team:async_leave(Role1, ""),
                    Fail
            end;
        {ok, Mates} ->
            {ok, M} = role_convert:to(dungeon_mate, Role),
            OriginIds = [Mid || #dungeon_mate{id = Mid} <- Mates],
            Leader = M#dungeon_mate{status = 1, dun_id = DunId,
                                    origin_ids = OriginIds},
            Team = #dungeon_team{leader = Leader, members = Mates,
                                 member_num = length(Mates) + 1, dun_id = DunId,
                                 status = 1},
            team:stop_recruiting(Role),
            case case catch gen_server:call(dungeon_team,
                                            {enlist, Team},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                ok ->
                    NewRole = Role#role{s_event = 43},
                    map:role_update(NewRole),
                    [role:apply(async,
                                MPid,
                                {dungeon_team, role_callback, [matching]})
                     || #dungeon_mate{pid = MPid} <- Mates, is_pid(MPid)],
                    push(NewRole, 12130),
                    {ok, NewRole};
                Fail -> Fail
            end;
        Else -> Else
    end;
enlist(_, _) -> {false, lang:get("只有队长才可以招募")}.

leave_enlisting(Role = #role{id = Id, s_event = 43}) ->
    case fetch_mate(Id) of
        [#dungeon_mate{status = 1,
                       team_id = TeamId = {Tid, P, Z}, dun_id = DunId}]
            when Tid =/= 0 ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team,
                            {leave_enlisting,
                             #dungeon_enlistment{id = TeamId,
                                                 dun_id = DunId}}]);
        _ -> ok
    end,
    Role1 = Role#role{s_event = 0},
    map:role_update(Role1),
    {ok, Role1};
leave_enlisting(#role{id = Id}) ->
    case fetch_mate(Id) of
        [#dungeon_mate{status = 1,
                       team_id = TeamId = {Tid, P, Z}, dun_id = DunId}]
            when Tid =/= 0 ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team,
                            {leave_enlisting,
                             #dungeon_enlistment{id = TeamId,
                                                 dun_id = DunId}}]);
        _ -> ok
    end,
    ok.

match(#role{m_team = #m_team{pid = Pid}}, _DunId)
    when is_pid(Pid) ->
    {false, lang:get("已经在队伍中")};
match(Role = #role{}, DunId) ->
    case check_match(Role, DunId) of
        ok ->
            team_mgr:stop_matching(Role),
            case do_match(Role, DunId) of
                {false, M} ->
                    case case catch gen_server:call(dungeon_team,
                                                    {match, M},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok ->
                            NewRole = Role#role{s_event = 43},
                            map:role_update(NewRole),
                            {ok, NewRole};
                        Else -> Else
                    end;
                {ok, M} ->
                    dungeon_team ! {matched, M},
                    NewRole = Role#role{s_event = 43},
                    map:role_update(NewRole),
                    {ok, NewRole}
            end;
        Fail -> Fail
    end;
match(_Role, _DunId) -> {false, lang:get("不能匹配")}.

unmatch(Role = #role{s_event = 43, id = Id}) ->
    case case catch gen_server:call(dungeon_team,
                                    {unmatch, Id},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        ok ->
            NewRole = Role#role{s_event = 0},
            map:role_update(NewRole),
            {ok, NewRole};
        _ -> {ok, Role}
    end;
unmatch(_) -> ok.

reply_invite(Role, Rid) ->
    case fetch_mate(Rid) of
        [#dungeon_mate{team_id = TeamId = {Tid, _, _},
                       dun_id = DunId}]
            when Tid =/= 0 ->
            join(Role, TeamId, DunId);
        _ -> {false, lang:get("对方在匹配中")}
    end.

join(#role{m_team = #m_team{pid = Pid}}, _TeamId,
     _DunId)
    when is_pid(Pid) ->
    {false, lang:get("你已经在队伍中")};
join(Role = #role{id = Rid}, TeamId, DunId) ->
    case fetch_mate(Rid) of
        [#dungeon_mate{team_id = {Tid, _, _}}] when Tid =/= 0 ->
            {false, lang:get("你已经在队伍中")};
        _ ->
            case lookup(TeamId) of
                [#dungeon_team{dun_id = DunId}] ->
                    case check_match(Role, DunId) of
                        ok ->
                            {ok, M} = role_convert:to(dungeon_mate, Role),
                            case apply_join(M, TeamId) of
                                {ok, DunId} ->
                                    M1 = M#dungeon_mate{dun_id = DunId,
                                                        team_id = TeamId},
                                    dungeon_team ! {matched, M1},
                                    NewRole = Role#role{s_event = 43},
                                    map:role_update(NewRole),
                                    {ok, NewRole};
                                Else -> Else
                            end;
                        Fail -> Fail
                    end;
                _ -> {false, lang:get("招募已过期")}
            end
    end;
join(_Role, _TeamId, _DunId) ->
    {false, lang:get("不能加入")}.

leave(Role = #role{s_event = 43, id = Id}) ->
    dungeon_team ! {leave, Id},
    Role1 = Role#role{s_event = 0},
    TeamRole = case team:async_leave(Role1, "") of
                   {ok, Role2} -> Role2;
                   _ -> Role1
               end,
    NewRole = case help:del_help_info_by_fun_type(TeamRole,
                                                  8)
                  of
                  {ok, HelpRole} -> HelpRole;
                  _ -> TeamRole
              end,
    map:role_update(NewRole),
    {ok, NewRole};
leave(#role{id = Id}) ->
    dungeon_team ! {leave, Id},
    ok.

leave_handover(Id) ->
    catch gen_server:call(dungeon_team,
                          {leave_handover, Id}),
    ok.

choose(Role = #role{s_event = 43, id = Id}, DunId) ->
    case check_match(Role, DunId) of
        ok ->
            NeedLev = get_need_lev(DunId),
            case case catch gen_server:call(dungeon_team,
                                            {choose, Id, DunId, NeedLev},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                ok -> ok;
                Else -> Else
            end;
        Fail -> Fail
    end;
choose(_Role, _DunId) -> ok.

ask_help(#role{id = Id}, #{id := Id}) ->
    {false, lang:get("不要向自己申请")};
ask_help(#role{s_event = Event}, _) when Event =/= 43 ->
    {false, lang:get("不在副本招募状态")};
ask_help(Role = #role{id = Rid},
         Args = #{type := 1, id := Id}) ->
    case friend:is_friend(Role, Id) of
        true ->
            case fetch_mate(Rid) of
                [#dungeon_mate{team_id = TeamId = {TI, _, _},
                               dun_id = DunId}]
                    when TI > 0 ->
                    do_ask_help(Role,
                                Args#{team_id => TeamId, dun_id => DunId});
                _ -> {false, lang:get("不在招募队伍中")}
            end;
        _ -> {false, lang:get("对方不是你好友")}
    end;
ask_help(Role = #role{id = Rid},
         HelpData = #help_data{}) ->
    case fetch_mate(Rid) of
        [#dungeon_mate{team_id = TeamId = {TI, _, _},
                       dun_id = DunId}]
            when TI > 0 ->
            do_ask_help(Role,
                        #{team_id => TeamId, dun_id => DunId,
                          help_data => HelpData});
        _ -> {false, lang:get("不在招募队伍中")}
    end;
ask_help(_Role, _Type) -> {false, lang:get("无效请求")}.

answer_help(#role{id = Id}, Id, _) ->
    {false, lang:get("不能回应自己")};
answer_help(#role{m_team =
                      #m_team{pid = Pid, status = Status}},
            _Id, _)
    when is_pid(Pid) andalso Status =/= 3 ->
    {false, lang:get("在队伍中不能去帮忙哦")};
answer_help(#role{m_combat = #m_combat{pid = Pid}}, _Id,
            _)
    when is_pid(Pid) ->
    {false, lang:get("在战斗中不能去帮忙哦")};
answer_help(#role{cross_type = 1}, _Id, _) ->
    {false, lang:get("跨服状态不能去帮忙")};
answer_help(#role{s_event = Event}, _Id, _)
    when Event =/= 0 andalso Event =/= 2 ->
    {false, lang:get("当前状态不能去帮忙")};
answer_help(Role, Id, 1) ->
    case erlang:get(dungeon_invitations) of
        L when is_list(L) ->
            erlang:put(dungeon_invitations,
                       lists:keydelete(Id, #dungeon_invitation.id, L)),
            do_answer_help(Role,
                           lists:keyfind(Id, #dungeon_invitation.id, L));
        _ -> {false, lang:get("请求已过期")}
    end;
answer_help(Role = #role{}, Data = #help_msg{}, _) ->
    do_answer_help(Role, Data).

kickout(#role{id = Id}, Id) ->
    {false, lang:get("不能踢自己哦")};
kickout(Role = #role{s_event = 43, id = LeaderId,
                     m_team = #m_team{pid = Pid, status = 1}},
        Id)
    when is_pid(Pid) ->
    case fetch_mate(LeaderId) of
        [#dungeon_mate{team_id = TeamId = {_, P, Z},
                       status = 1}] ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team, {kickout, TeamId, LeaderId, Id}]),
            NewRole = case team:kickout(Role, Id) of
                          {ok, Role2} -> Role2;
                          _ -> Role
                      end,
            {ok, NewRole};
        _ -> {false, lang:get("只有队长可以操作")}
    end;
kickout(_, _) -> {false, lang:get("只有队长可以操作")}.

sync_kickout(LeaderId, Id) ->
    case fetch_mate(LeaderId) of
        [#dungeon_mate{team_id = TeamId = {_, P, Z},
                       status = 1}] ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team, {kickout, TeamId, LeaderId, Id}]),
            ok;
        _ -> ok
    end.

handover(Id) ->
    case fetch_mate(Id) of
        [#dungeon_mate{team_id = TeamId = {_, P, Z}}] ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team, {handover, TeamId, Id}]),
            ok;
        _ -> ok
    end.

set_event(Role = #role{s_event = 0, lev = Lev},
          Mates = [_ | _], DunId) ->
    DungeonPass = dungeon_util:get_pass(Role),
    Total = lists:sum([min(3, Done)
                       || {_, Done} <- DungeonPass, is_integer(Done)]),
    case dungeon_data:get_day_limit(Lev) > Total of
        true ->
            case dungeon_data:get(DunId) of
                #dungeon_base{type = 2} ->
                    Mates1 = convert_mates(Mates, DunId),
                    {ok, M} = role_convert:to(dungeon_mate, Role),
                    OriginIds = [Mid || #dungeon_mate{id = Mid} <- Mates],
                    Leader = M#dungeon_mate{status = 1, dun_id = DunId,
                                            origin_ids = OriginIds},
                    Team = #dungeon_team{leader = Leader, members = Mates1,
                                         member_num = length(Mates1) + 1,
                                         dun_id = DunId, status = 1},
                    case case catch gen_server:call(dungeon_team,
                                                    {enlist, Team},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        ok -> Role#role{s_event = 43};
                        _ -> Role
                    end;
                _ -> Role
            end;
        _ -> Role
    end;
set_event(Role, _Mates, _) -> Role.

set_event(Role = #role{id = Id, s_event = 0}) ->
    case fetch_mate(Id) of
        [#dungeon_mate{team_id = {I, _P, _Z}}] when I > 0 ->
            Role#role{s_event = 43};
        _ -> Role
    end;
set_event(Role) -> Role.

chat(#role{s_event = 43, id = Id}, Cmd, Msg) ->
    case fetch_mate(Id) of
        [#dungeon_mate{team_id = TeamId}] ->
            case lookup(TeamId) of
                [#dungeon_team{members = Members}] ->
                    [role:pack_send(Pid, Cmd, Msg)
                     || #dungeon_mate{pid = Pid} <- Members];
                _ -> ok
            end;
        _ -> ok
    end;
chat(_, _, _) -> ok.

apply_join(M, TeamId = {_, P, Z}) ->
    big_world:call(P,
                   Z,
                   gen_server,
                   call,
                   [dungeon_team, {join, M, TeamId}]).

match_join(M, TeamId = {_, P, Z}) ->
    big_world:call(P,
                   Z,
                   gen_server,
                   call,
                   [dungeon_team, {match_join, M, TeamId}]).

start(Role = #role{id = Id, s_event = 43,
                   m_team = #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case fetch_mate(Id) of
        [#dungeon_mate{status = Status}] when Status =/= 1 ->
            {false, lang:get("只有队长带队才能开始开启")};
        [#dungeon_mate{team_id = TeamId}] ->
            case lookup(TeamId) of
                [Team = #dungeon_team{dun_id = DunId}] ->
                    case dungeon:start_dungeon(Role, Team) of
                        {ok, NewRole} ->
                            dungeon_team !
                                {stop_enlisting,
                                 #dungeon_enlistment{id = TeamId,
                                                     dun_id = DunId}},
                            {ok, NewRole};
                        Else -> Else
                    end;
                _ -> {false, lang:get("队伍还没准备好")}
            end;
        _ -> {false, lang:get("队伍还没准备好")}
    end;
start(_Role = #role{}) ->
    {false, lang:get("只有队长带队才能开始开启")}.

lookup(Id = {_, P, Z}) ->
    big_world:call(P, Z, ets, lookup, [dungeon_team, Id]).

fetch_mate(Id = {_, P, Z}) ->
    big_world:call(P, Z, ets, lookup, [dungeon_mate, Id]).

list_enlistment(DunId) ->
    ets:lookup(dungeon_enlistment, DunId).

sync_data({Stoping, Updating}) ->
    dungeon_team ! {sync_data, Stoping, Updating}.

role_callback(Role = #role{s_event = 43,
                           m_team = MTeam},
              leave_enlisting) ->
    TeamRole = case MTeam of
                   #m_team{pid = TPid, status = 1} when is_pid(TPid) ->
                       push(Role, {12137, {2, lang:get("招募超时，请重新尝试")}}),
                       Role#role{s_event = 0};
                   #m_team{pid = TPid} when is_pid(TPid) ->
                       push(Role, {12137, {2, ""}}),
                       Role#role{s_event = 0};
                   _ ->
                       notice:send(Role, 1, lang:get("队长退出了队伍，请重新进入")),
                       push(Role, {12130, #dungeon_team{}}),
                       Role
               end,
    NewRole = case help:del_help_info_by_fun_type(TeamRole,
                                                  8)
                  of
                  {ok, HelpRole} -> HelpRole;
                  _ -> TeamRole
              end,
    map:role_update(NewRole),
    {ok, NewRole};
role_callback(_, leave_enlisting) -> ok;
role_callback(Role = #role{s_event = 43}, disband) ->
    TeamRole = case team:async_leave(Role) of
                   {ok, Role1} -> Role1;
                   _ -> Role
               end,
    notice:send(Role, 1, lang:get("队长退出了队伍，请重新进入")),
    push(Role, {12130, #dungeon_team{}}),
    NRole = case help:del_help_info_by_fun_type(TeamRole, 8)
                of
                {ok, HelpRole} -> HelpRole;
                _ -> TeamRole
            end,
    NewRole = NRole#role{s_event = 0},
    map:role_update(NewRole),
    {ok, NewRole};
role_callback(_, disband) -> ok;
role_callback(Role, kickout) ->
    push(Role, {12130, #dungeon_team{}}),
    TeamRole = Role,
    NewRole = case help:del_help_info_by_fun_type(TeamRole,
                                                  8)
                  of
                  {ok, HelpRole} -> HelpRole;
                  _ -> TeamRole
              end,
    {ok, NewRole};
role_callback(Role = #role{m_team =
                               #m_team{pid = Pid, status = 2}},
              matching)
    when is_pid(Pid) ->
    NewRole = Role#role{s_event = 43},
    map:role_update(NewRole),
    push(NewRole, 12130),
    {ok, NewRole};
role_callback(#role{m_team = #m_team{pid = Pid}},
              {pair, _})
    when is_pid(Pid) ->
    ok;
role_callback(Role = #role{s_event = 43},
              {pair, DunId}) ->
    case do_match(Role, DunId) of
        {false, _M} -> ok;
        {ok, M} ->
            dungeon_team ! {matched, M},
            NewRole = Role#role{s_event = 43},
            map:role_update(NewRole),
            {ok, NewRole}
    end;
role_callback(_Role, {pair, _DunId}) -> ok;
role_callback(Role, {choose, DunId}) ->
    push(Role, {12149, {1, "", DunId}}),
    Msg = notice:format(lang:get("队长将挑战目标切换为~ts"),
                        [{string_2, 5, dungeon_util:get_dun_name(DunId)}]),
    notice:send(Role, 1, Msg),
    ok;
role_callback(Role, {push, Cmd}) ->
    push(Role, Cmd),
    ok;
role_callback(#role{id = Id},
              {set_status, Status, TeamId}) ->
    case fetch_mate(Id) of
        [M = #dungeon_mate{team_id = TeamId}] ->
            dungeon_team !
                {update, M#dungeon_mate{status = Status}};
        _ -> ok
    end,
    ok;
role_callback(Role = #role{m_team =
                               #m_team{pid = Pid, status = 2}},
              {check_mate,
               #{dun :=
                     DunBase = #dungeon_base{cross_cond_enter = CondEnter},
                 leader_lev := Lev, min_floor := MinFloor}})
    when is_pid(Pid) ->
    Res = case dungeon:do_check_enter(Role,
                                      CondEnter,
                                      DunBase,
                                      #{leader_lev => Lev,
                                        min_floor => MinFloor})
              of
              {ok, {false, Reason}} -> {false, Reason};
              {ok, {true, _}} -> role_convert:to(dungeon_mate, Role)
          end,
    {ok, Res};
role_callback(_Role = #role{name = Name},
              {check_mate, _}) ->
    {false,
     notice:format(lang:get("~ts不在跟随状态"), [{role_2, Name}])};
role_callback(Role = #role{name = _Name},
              {invite,
               Data = #dungeon_invitation{id = Id, dun_id = DunId}}) ->
    Reply = case check_match(Role, DunId) of
                ok ->
                    case erlang:get(dungeon_invitations) of
                        L when is_list(L) ->
                            L1 = lists:keystore(Id,
                                                #dungeon_invitation.id,
                                                L,
                                                Data),
                            erlang:put(dungeon_invitations, L1);
                        _ -> erlang:put(dungeon_invitations, [Data])
                    end,
                    push(Role, {12145, {Data}}),
                    ok;
                Else -> Else
            end,
    {ok, Reply};
role_callback(Role,
              {ask_help, HelpMsg = #help_msg{}}) ->
    NewRole = help:ack_recv(HelpMsg, Role),
    {ok, NewRole};
role_callback(_, _Info) ->
    logger:error("未知回调 ~w", [_Info], dungeon_team, 577),
    ok.

push(#role{id = Rid}, Cmd = 12130) ->
    case fetch_mate(Rid) of
        [#dungeon_mate{team_id = TeamId}] ->
            case lookup(TeamId) of
                [Team = #dungeon_team{}] ->
                    sys_conn:pack_send(Cmd, Team);
                _ -> sys_conn:pack_send(Cmd, #dungeon_team{})
            end;
        _ -> sys_conn:pack_send(Cmd, #dungeon_team{})
    end;
push(#role{id = Rid}, Cmd = 12140) ->
    case ets:lookup(dungeon_mate_matching, Rid) of
        [#dungeon_mate{dun_id = DunId}] ->
            sys_conn:pack_send(Cmd, {1, DunId});
        _ -> sys_conn:pack_send(Cmd, {0, 0})
    end;
push(_, {Cmd, Data}) -> sys_conn:pack_send(Cmd, Data);
push(_, _) -> ok.

start_link(Type) ->
    gen_server:start_link({local, dungeon_team},
                          dungeon_team,
                          [Type],
                          []).

init([Type]) ->
    logger:info("开始启动...", [], dungeon_team, 612),
    ets:new(dungeon_mate,
            [set, named_table, public, {keypos, #dungeon_mate.id}]),
    ets:new(dungeon_team,
            [set, named_table, public, {keypos, #dungeon_team.id}]),
    ets:new(dungeon_enlistment,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #dungeon_enlistment.dun_id}]),
    ets:new(dungeon_mate_matching,
            [set, named_table, public, {keypos, #dungeon_mate.id}]),
    Mode = case Type of
               big_world -> 1;
               _ -> 2
           end,
    PairRef = erlang:send_after(5000, self(), pair),
    SyncRef = erlang:send_after(util:rand(5, 15) * 1000,
                                self(),
                                sync),
    State = #state{pair_ref = PairRef, sync_ref = SyncRef,
                   mode = Mode},
    logger:info("启动完成", [], dungeon_team, 628),
    {ok, State}.

handle_call({enlist,
             Team = #dungeon_team{leader =
                                      Leader = #dungeon_mate{id = LeaderId},
                                  members = Mates}},
            _From, State = #state{next_id = NextId}) ->
    Res = case fetch_mate(LeaderId) of
              [#dungeon_mate{team_id = OldTeamId}] ->
                  case lookup(OldTeamId) of
                      [#dungeon_team{}] -> exist;
                      _ -> ok
                  end;
              _ -> ok
          end,
    case Res of
        ok ->
            TeamId = {NextId, env:get(platform), env:get(zone_id)},
            Leader1 = Leader#dungeon_mate{team_id = TeamId},
            Mates1 = [Leader1 | [M#dungeon_mate{team_id = TeamId}
                                 || M <- Mates]],
            Team1 = Team#dungeon_team{id = TeamId,
                                      members = Mates1},
            [ets:delete(dungeon_mate_matching, DelId)
             || #dungeon_mate{id = DelId} <- Mates1],
            update(Team1),
            update(Mates1),
            {reply,
             ok,
             set_updating(Team1, State#state{next_id = NextId + 1})};
        _ -> {reply, ok, State}
    end;
handle_call({match, Mate}, _From, State) ->
    ets:insert(dungeon_mate_matching, Mate),
    update(Mate),
    {reply, ok, State};
handle_call({join,
             Mate = #dungeon_mate{id = Id},
             TeamId},
            _From, State) ->
    Res = case lookup(TeamId) of
              [#dungeon_team{member_num = Num}] when Num >= 5 ->
                  {false, lang:get("该队伍人数已满")};
              [#dungeon_team{status = 2}] ->
                  {false, lang:get("该队伍不在招募中")};
              [Team = #dungeon_team{member_num = Num,
                                    members = Members, dun_id = DunId}] ->
                  M1 = Mate#dungeon_mate{team_id = TeamId, status = 2},
                  Team1 = Team#dungeon_team{members =
                                                lists:keystore(Id,
                                                               #dungeon_mate.id,
                                                               Members,
                                                               M1),
                                            member_num = Num + 1},
                  broadcast(Team1, {12141, {[M1]}}),
                  Enlist = to(enlistment, Team1),
                  update(Team1),
                  update(Enlist),
                  {ok, DunId, set_updating(Team1, State)};
              _ -> {false, lang:get("找不到队伍")}
          end,
    case Res of
        {ok, Did, State1 = #state{}} ->
            {reply, {ok, Did}, State1};
        _ -> {reply, Res, State}
    end;
handle_call({match_join,
             Mate = #dungeon_mate{id = Id, dun_id = DunId},
             TeamId},
            _From, State) ->
    Res = case lookup(TeamId) of
              [#dungeon_team{member_num = Num}] when Num >= 5 ->
                  {false, lang:get("该队伍人数已满")};
              [#dungeon_team{dun_id = NewDunId}]
                  when NewDunId =/= DunId ->
                  {false, lang:get("该队伍不在当前副本")};
              [#dungeon_team{status = 2}] ->
                  {false, lang:get("该队伍不在招募中")};
              [Team = #dungeon_team{member_num = Num,
                                    members = Members, dun_id = DunId,
                                    kicked = Kicked}] ->
                  Now = date:unixtime(),
                  case lists:keyfind(Id, 1, Kicked) of
                      {_, Last} when Now - Last < 180000 ->
                          {false, lang:get("暂时不能进入这个队伍")};
                      _ ->
                          M1 = Mate#dungeon_mate{team_id = TeamId, status = 2},
                          Team1 = Team#dungeon_team{members =
                                                        lists:keystore(Id,
                                                                       #dungeon_mate.id,
                                                                       Members,
                                                                       M1),
                                                    member_num = Num + 1},
                          broadcast(Team1, {12141, {[M1]}}),
                          Enlist = to(enlistment, Team1),
                          update(Team1),
                          update(Enlist),
                          {ok, DunId, set_updating(Team1, State)}
                  end;
              _ -> {false, lang:get("找不到队伍")}
          end,
    case Res of
        {ok, Did, State1 = #state{}} ->
            {reply, {ok, Did}, State1};
        _ -> {reply, Res, State}
    end;
handle_call({unmatch, Id}, _From, State) ->
    ets:delete(dungeon_mate_matching, Id),
    Reply = case fetch_mate(Id) of
                [#dungeon_mate{team_id = {TI, _, _}}] when TI =/= 0 ->
                    matched;
                _ ->
                    ets:delete(dungeon_mate, Id),
                    ok
            end,
    {reply, Reply, State};
handle_call({choose, Id, DunId, NeedLev}, _From,
            State) ->
    Res = case fetch_mate(Id) of
              [#dungeon_mate{dun_id = DunId}] -> ok;
              [#dungeon_mate{team_id = {TI, _, _}, status = St}]
                  when TI =/= 0 andalso St =/= 1 ->
                  {false, lang:get("请让队长操作")};
              [#dungeon_mate{team_id = TeamId = {TI, P, Z},
                             dun_id = OldDunId}]
                  when TI =/= 0 ->
                  case lookup(TeamId) of
                      [#dungeon_team{dun_id = DunId}] -> ok;
                      [Team = #dungeon_team{leader = Leader,
                                            members = Members}] ->
                          case [Fn
                                || #dungeon_mate{name = Fn, lev = Flv}
                                       <- Members,
                                   Flv < NeedLev]
                              of
                              FailNames = [_ | _] ->
                                  {false,
                                   notice:format(lang:get("~ts等级不足~ts级，不能挑战~ts"),
                                                 [{role_2, FailNames},
                                                  {string_2, 5, NeedLev},
                                                  {string_2,
                                                   5,
                                                   dungeon_util:get_dun_name(DunId)}])};
                              _ ->
                                  Members1 = [M#dungeon_mate{dun_id = DunId}
                                              || M <- Members],
                                  Team1 = Team#dungeon_team{leader =
                                                                Leader#dungeon_mate{dun_id
                                                                                        =
                                                                                        DunId},
                                                            dun_id = DunId,
                                                            members = Members1},
                                  update(Team1),
                                  update(Members1),
                                  State1 = set_stoping(Team, State),
                                  State2 = set_updating(Team1, State1),
                                  [role:apply(async,
                                              Mpid,
                                              {dungeon_team,
                                               role_callback,
                                               [{choose, DunId}]})
                                   || #dungeon_mate{pid = Mpid, id = Mid}
                                          <- Members1,
                                      Mid =/= Id],
                                  big_world:cast(P,
                                                 Z,
                                                 ets,
                                                 match_delete,
                                                 [dungeon_enlistment,
                                                  #dungeon_enlistment{id =
                                                                          TeamId,
                                                                      dun_id =
                                                                          OldDunId,
                                                                      _ =
                                                                          '_'}]),
                                  {ok, State2}
                          end;
                      _ -> ok
                  end;
              [M = #dungeon_mate{}] ->
                  M1 = M#dungeon_mate{dun_id = DunId},
                  update(M1),
                  case ets:lookup(dungeon_mate_matching, Id) of
                      [#dungeon_mate{}] ->
                          ets:insert(dungeon_mate_matching, M1);
                      _ -> ok
                  end,
                  ok;
              _ -> ok
          end,
    case Res of
        {ok, NewState = #state{}} -> {reply, ok, NewState};
        ok -> {reply, ok, State};
        _ -> {reply, Res, State}
    end;
handle_call({leave_handover, Id}, _From, State) ->
    ets:delete(dungeon_mate_matching, Id),
    Res = case fetch_mate(Id) of
              [#dungeon_mate{team_id = TeamId = {_, P, Z},
                             status = 1}] ->
                  ets:delete(dungeon_mate, Id),
                  case lookup(TeamId) of
                      [Team = #dungeon_team{members = Members,
                                            dun_id = DunId}] ->
                          disband(Members),
                          big_world:cast(P,
                                         Z,
                                         ets,
                                         delete,
                                         [dungeon_team, TeamId]),
                          big_world:cast(P,
                                         Z,
                                         ets,
                                         match_delete,
                                         [dungeon_enlistment,
                                          #dungeon_enlistment{id = TeamId,
                                                              dun_id = DunId,
                                                              _ = '_'}]),
                          {ok, set_stoping(Team, State)};
                      _ -> ok
                  end;
              [#dungeon_mate{team_id = TeamId = {_, P, Z}}] ->
                  big_world:cast(P,
                                 Z,
                                 erlang,
                                 send,
                                 [dungeon_team, {apply_leave, TeamId, Id}]),
                  ets:delete(dungeon_mate, Id),
                  ok;
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {reply, ok, State1};
        _ -> {reply, ok, State}
    end;
handle_call(_Request, _From, State) ->
    {reply, false, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({matched,
             M = #dungeon_mate{id = Id, pid = Pid}},
            State) ->
    update(M),
    ets:delete(dungeon_mate_matching, Id),
    role:apply(async,
               Pid,
               {dungeon_team, role_callback, [{push, 12130}]}),
    {noreply, State};
handle_info({leave, Id}, State) ->
    ets:delete(dungeon_mate_matching, Id),
    case fetch_mate(Id) of
        [#dungeon_mate{team_id = TeamId = {_, P, Z},
                       status = 1}] ->
            case lookup(TeamId) of
                [Team = #dungeon_team{members = Members,
                                      dun_id = DunId}] ->
                    disband(Members),
                    big_world:cast(P,
                                   Z,
                                   ets,
                                   delete,
                                   [dungeon_team, TeamId]),
                    big_world:cast(P,
                                   Z,
                                   ets,
                                   match_delete,
                                   [dungeon_enlistment,
                                    #dungeon_enlistment{id = TeamId,
                                                        dun_id = DunId,
                                                        _ = '_'}]),
                    {noreply, set_stoping(Team, State)};
                _ -> {noreply, State}
            end;
        [#dungeon_mate{team_id = TeamId = {_, P, Z}}] ->
            big_world:cast(P,
                           Z,
                           erlang,
                           send,
                           [dungeon_team, {apply_leave, TeamId, Id}]),
            ets:delete(dungeon_mate, Id),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_info({apply_leave, TeamId, Id}, State) ->
    Res = case lookup(TeamId) of
              [Team = #dungeon_team{members = Members,
                                    dun_id = DunId}] ->
                  case lists:keydelete(Id, #dungeon_mate.id, Members) of
                      [] ->
                          ets:delete(dungeon_team, TeamId),
                          ets:match_delete(dungeon_enlistment,
                                           #dungeon_enlistment{id = TeamId,
                                                               dun_id = DunId,
                                                               _ = '_'}),
                          {ok, set_stoping(Team, State)};
                      Members1 ->
                          Team1 = Team#dungeon_team{members = Members1,
                                                    member_num =
                                                        length(Members1)},
                          broadcast(Team1, {12142, {[Id]}}),
                          update(Team1),
                          {ok, set_updating(Team1, State)}
                  end;
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info({kickout, TeamId, LeaderId, Id = {_, P, Z}},
            State) ->
    big_world:cast(P,
                   Z,
                   erlang,
                   send,
                   [dungeon_team, {apply_kickout, Id, TeamId}]),
    Res = case lookup(TeamId) of
              [Team = #dungeon_team{leader =
                                        #dungeon_mate{id = LeaderId},
                                    members = Members, kicked = Kicked}] ->
                  case lists:keydelete(Id, #dungeon_mate.id, Members) of
                      [] ->
                          ets:delete(dungeon_team, TeamId),
                          {ok, set_stoping(Team, State)};
                      Members1 ->
                          NewKicked = lists:keystore(Id,
                                                     1,
                                                     Kicked,
                                                     {Id, date:unixtime()}),
                          Team1 = Team#dungeon_team{members = Members1,
                                                    member_num =
                                                        length(Members1),
                                                    kicked = NewKicked},
                          broadcast(Team1, {12142, {[Id]}}),
                          update(Team1),
                          {ok, set_updating(Team1, State)}
                  end;
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info({apply_kickout, Id, TeamId}, State) ->
    case fetch_mate(Id) of
        [M = #dungeon_mate{team_id = TeamId, pid = Pid}] ->
            role:apply(async,
                       Pid,
                       {dungeon_team, role_callback, [kickout]}),
            update(M#dungeon_mate{team_id = {0, "", 0}});
        _ -> ok
    end,
    {noreply, State};
handle_info({handover, TeamId, Id}, State) ->
    Res = case lookup(TeamId) of
              [Team = #dungeon_team{members = Members,
                                    leader =
                                        Origin = #dungeon_mate{id = OriginId,
                                                               pid = OPid}}] ->
                  case lists:keyfind(Id, #dungeon_mate.id, Members) of
                      Mate = #dungeon_mate{pid = Pid} ->
                          role:apply(async,
                                     Pid,
                                     {dungeon_team,
                                      role_callback,
                                      [{set_status, 1, TeamId}]}),
                          role:apply(async,
                                     OPid,
                                     {dungeon_team,
                                      role_callback,
                                      [{set_status, 2, TeamId}]}),
                          Leader = Mate#dungeon_mate{status = 1},
                          Origin1 = Origin#dungeon_mate{status = 2},
                          Members1 = lists:keyreplace(OriginId,
                                                      #dungeon_mate.id,
                                                      Members,
                                                      Origin1),
                          Members2 = lists:keyreplace(Id,
                                                      #dungeon_mate.id,
                                                      Members1,
                                                      Leader),
                          Team1 = Team#dungeon_team{leader = Leader,
                                                    members = Members2},
                          update(Team1),
                          broadcast(Team1, {12141, {[Origin1, Leader]}}),
                          {ok, set_updating(Team1, State)};
                      _ -> ok
                  end;
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info({stop_enlisting,
             #dungeon_enlistment{id = TeamId, dun_id = DunId}},
            State) ->
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{id = TeamId, dun_id = DunId,
                                         _ = '_'}),
    Res = case lookup(TeamId) of
              [Team = #dungeon_team{members = Members}] ->
                  [big_world:cast(P, Z, ets, delete, [dungeon_mate, Id])
                   || #dungeon_mate{id = Id = {_, P, Z}} <- Members],
                  ets:delete(dungeon_team, TeamId),
                  {ok, set_stoping(Team, State)};
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info({leave_enlisting,
             #dungeon_enlistment{id = TeamId, dun_id = DunId}},
            State) ->
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{id = TeamId, dun_id = DunId,
                                         _ = '_'}),
    Res = case lookup(TeamId) of
              [Team = #dungeon_team{members = Members}] ->
                  all_leave_enlisting(Members),
                  ets:delete(dungeon_team, TeamId),
                  {ok, set_stoping(Team, State)};
              _ -> ok
          end,
    case Res of
        {ok, State1 = #state{}} -> {noreply, State1};
        _ -> {noreply, State}
    end;
handle_info(pair,
            State = #state{pair_ref = OldRef, mode = 2}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    enlisting_expire(),
    [role:apply(async,
                MPid,
                {dungeon_team, role_callback, [{pair, DunId}]})
     || [MPid, DunId]
            <- ets:match(dungeon_mate_matching,
                         #dungeon_mate{pid = '$1', dun_id = '$2', _ = '_'}),
        is_pid(MPid)],
    PairRef = erlang:send_after(5000, self(), pair),
    {noreply, State#state{pair_ref = PairRef}};
handle_info(pair, State) -> {noreply, State};
handle_info(sync,
            State = #state{sync_ref = OldRef, mode = Mode,
                           stop_enlisting = Stoping,
                           update_enlisting = Updating}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case {Stoping, Updating} of
        {[], []} -> ok;
        _Data when Mode =:= 1 -> ok;
        Data ->
            case world_lev:get_world_lev() of
                {WorldLev, _} when WorldLev >= 45 ->
                    big_world:cast(dungeon_team, sync_data, [Data]);
                _ -> ok
            end
    end,
    SyncRef = erlang:send_after(util:rand(5, 15) * 1000,
                                self(),
                                sync),
    {noreply,
     State#state{sync_ref = SyncRef, stop_enlisting = [],
                 update_enlisting = []}};
handle_info({sync_data, Stoping, Updating},
            State = #state{mode = 1}) ->
    big_world:cast(all,
                   dungeon_team,
                   sync_data,
                   [{Stoping, Updating}]),
    {noreply, State};
handle_info({sync_data, Stoping, Updating}, State) ->
    case world_lev:get_world_lev() of
        {WorldLev, _} when WorldLev >= 45 ->
            Updating1 = [U
                         || U = #dungeon_enlistment{id = Ui} <- Updating,
                            role_misc:is_local_role(Ui) =:= false],
            Stoping1 = [S
                        || S = {_, Si} <- Stoping,
                           role_misc:is_local_role(Si) =:= false],
            update(Updating1),
            delete(Stoping1);
        _ -> ok
    end,
    {noreply, State};
handle_info({update, M}, State) ->
    update(M),
    {noreply, State};
handle_info(_Info, State) ->
    logger:error("未知消息 ~w", [_Info], dungeon_team, 1022),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

check_mates(Role = #role{m_team =
                             #m_team{pid = Pid, status = 1},
                         lev = Lev},
            DunId)
    when is_pid(Pid) ->
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    case dungeon_data:get(DunId) of
        DunBase = #dungeon_base{cross_cond_enter = CondEnter} ->
            case dungeon:do_check_enter(Role,
                                        CondEnter,
                                        DunBase,
                                        #{leader_lev => Lev,
                                          min_floor => Floor})
                of
                {ok, {false, Reason}} -> {false, Reason};
                {ok, {true, MinFloor}} ->
                    do_check_mates(team:get_members(Role),
                                   #{dun => DunBase, leader_lev => Lev,
                                     min_floor => MinFloor},
                                   [])
            end;
        _ -> {false, lang:get("不存在该副本")}
    end;
check_mates(Role = #role{lev = Lev}, DunId) ->
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    case dungeon_data:get(DunId) of
        DunBase = #dungeon_base{cross_cond_enter = CondEnter} ->
            case dungeon:do_check_enter(Role,
                                        CondEnter,
                                        DunBase,
                                        #{leader_lev => Lev,
                                          min_floor => Floor})
                of
                {ok, {false, Reason}} -> {false, Reason};
                {ok, {true, _MinFloor}} ->
                    case team_mgr:create(Role) of
                        {ok, Role1} -> {ok, Role1};
                        Else -> Else
                    end
            end;
        _ -> {false, lang:get("不存在该副本")}
    end.

do_check_mates([], _, Mates) -> {ok, Mates};
do_check_mates([#team_mate{id = Id, status = 2} | T],
               Args, Mates) ->
    case role:apply(sync,
                    Id,
                    {dungeon_team, role_callback, [{check_mate, Args}]})
        of
        {ok, M = #dungeon_mate{}} ->
            do_check_mates(T,
                           Args,
                           [M#dungeon_mate{status = 2} | Mates]);
        {false, Why} -> {false, Why}
    end;
do_check_mates([#team_mate{name = Name} | _T], _DunId,
               _Mates) ->
    {false,
     notice:format(lang:get("~ts还没归队不能进行副本招募"),
                   [{role_2, Name}])}.

check_match(Role = #role{lev = Lev}, DunId) ->
    Floor = var:get_list_var(Role, day_five, 131, DunId, 0),
    case dungeon_data:get(DunId) of
        DunBase = #dungeon_base{cross_cond_enter = CondEnter} ->
            case dungeon:do_check_enter(Role,
                                        CondEnter,
                                        DunBase,
                                        #{leader_lev => Lev,
                                          min_floor => Floor})
                of
                {ok, {false, Reason}} -> {false, Reason};
                {ok, {true, _MinFloor}} -> ok
            end;
        _ -> {false, lang:get("不存在该副本")}
    end.

do_match(Role = #role{}, DunId) ->
    L = ets:lookup(dungeon_enlistment, DunId),
    L1 = util:keys_sort([#dungeon_enlistment.member_num],
                        L),
    {ok, M} = role_convert:to(dungeon_mate, Role),
    do_match(L1, M#dungeon_mate{dun_id = DunId});
do_match([], M) -> {false, M};
do_match([#dungeon_enlistment{id = Id = {_, P, Z}} | T],
         M) ->
    case big_world:call(P,
                        Z,
                        dungeon_team,
                        match_join,
                        [M, Id])
        of
        {ok, _} -> {ok, M#dungeon_mate{team_id = Id}};
        _ -> do_match(T, M)
    end.

update([]) -> ok;
update([H | T]) ->
    update(H),
    update(T);
update(M = #dungeon_mate{id = {_, P, Z}}) ->
    big_world:cast(P, Z, ets, insert, [dungeon_mate, M]);
update(Team = #dungeon_team{status = 1}) ->
    ets:insert(dungeon_team, Team),
    Enlist = to(enlistment, Team),
    update(Enlist);
update(Team = #dungeon_team{dun_id = DunId, id = Id}) ->
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{dun_id = DunId, id = Id, _ = '_'}),
    ets:insert(dungeon_team, Team);
update(Enlist = #dungeon_enlistment{dun_id = DunId,
                                    id = Id}) ->
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{dun_id = DunId, id = Id, _ = '_'}),
    ets:insert(dungeon_enlistment, Enlist).

delete([]) -> ok;
delete([{DunId, Id} | T]) ->
    logger:debug("删除副本招募 ------> ~w",
                 [{DunId, Id}],
                 dungeon_team,
                 1126),
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{dun_id = DunId, id = Id, _ = '_'}),
    delete(T).

to(enlistment,
   #dungeon_team{id = Id, dun_id = DunId, member_num = Num,
                 leader = Leader}) ->
    #dungeon_enlistment{id = Id, dun_id = DunId,
                        member_num = Num, leader = Leader}.

disband([]) -> ok;
disband([#dungeon_mate{id = Id = {_, P, Z}, pid = Pid}
         | T]) ->
    role:apply(async,
               Pid,
               {dungeon_team, role_callback, [disband]}),
    big_world:cast(P, Z, ets, delete, [dungeon_mate, Id]),
    disband(T).

all_leave_enlisting([]) -> ok;
all_leave_enlisting([#dungeon_mate{id = Id = {_, P, Z},
                                   pid = Pid}
                     | T]) ->
    role:apply(async,
               Pid,
               {dungeon_team, role_callback, [leave_enlisting]}),
    big_world:cast(P, Z, ets, delete, [dungeon_mate, Id]),
    all_leave_enlisting(T).

set_stoping(#dungeon_team{status = 1, id = TeamId,
                          dun_id = DunId},
            State = #state{stop_enlisting = Stoping,
                           update_enlisting = Updating}) ->
    Stoping1 = lists:usort([{DunId, TeamId} | Stoping]),
    Updating1 = [Up
                 || Up = #dungeon_enlistment{id = Uti, dun_id = Udi}
                        <- Updating,
                    Uti =/= TeamId orelse Udi =/= DunId],
    State#state{stop_enlisting = Stoping1,
                update_enlisting = Updating1};
set_stoping(_, State) -> State.

set_updating(Team = #dungeon_team{status = 1,
                                  id = TeamId, dun_id = DunId},
             State = #state{stop_enlisting = Stoping,
                            update_enlisting = Updating}) ->
    Enlist = to(enlistment, Team),
    Stoping1 = [{Sdi, Sti}
                || {Sdi, Sti} <- Stoping,
                   Sdi =/= DunId orelse Sti =/= TeamId],
    Updating1 = lists:keystore(TeamId,
                               #dungeon_enlistment.id,
                               Updating,
                               Enlist),
    State#state{stop_enlisting = Stoping1,
                update_enlisting = Updating1};
set_updating(_, State) -> State.

broadcast(#dungeon_team{members = Members}, Cmd) ->
    [role:apply(async,
                Mpid,
                {dungeon_team, role_callback, [{push, Cmd}]})
     || #dungeon_mate{pid = Mpid} <- Members, is_pid(Mpid)],
    ok.

do_ask_help(#role{id = Id, name = Name, lev = Lev,
                  sex = Sex, classes = Classes},
            #{type := Type, id := TargetId, team_id := TeamId,
              dun_id := DunId}) ->
    Help = #dungeon_invitation{id = Id, name = Name,
                               lev = Lev, sex = Sex, classes = Classes,
                               type = Type, team_id = TeamId, dun_id = DunId,
                               dun_name = dungeon_util:get_dun_name(DunId),
                               time = date:unixtime()},
    case role:apply(sync,
                    TargetId,
                    {dungeon_team, role_callback, [{invite, Help}]})
        of
        ok -> ok;
        {error, not_online} -> {false, lang:get("对方不在线")};
        {false, Why} -> {false, Why};
        _Else -> {false, lang:get("对方在忙，请稍等")}
    end;
do_ask_help(Role = #role{id = Id, name = Name,
                         m_guild = #m_guild{id = Gid}, lev = _Lev},
            #{team_id := {TI, TP, TZ}, dun_id := DunId,
              help_data := HelpData = #help_data{id = HelpId}}) ->
    case guild_mgr:members(Gid) of
        {ok, Members} ->
            DunName = util:flist("~tsLv.~w",
                                 [dungeon_util:get_dun_name(DunId),
                                  get_need_lev(DunId)]),
            Fmt = lang:get("~ts正在挑战副本-~ts，一起加入吧"),
            Args = [{role_2, Name}, {string_2, 5, DunName}],
            NoticeMsg = notice:format(Fmt, Args),
            StrArr = [{1008, TP}, {1000, NoticeMsg}],
            DigArr = [{11, TI}, {12, TZ}, {13, DunId}],
            HelpMsg = #help_msg{help_rid = Id, help_id = HelpId,
                                str_array = StrArr, digit_array = DigArr},
            case help:add(HelpData, HelpMsg, Role) of
                {ok, NewHelpMsg, NewRole} ->
                    MFA = {dungeon_team,
                           role_callback,
                           [{ask_help, NewHelpMsg}]},
                    NeedLev = get_need_lev(DunId),
                    NewMembers = [GR
                                  || GR = #guild_role{lev = MLev} <- Members,
                                     MLev >= NeedLev],
                    guild_role:async_apply_role(NewMembers, MFA),
                    {ok, NewRole};
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("无法发起公会求助")}
    end;
do_ask_help(_Role, #{help_data := #help_data{}}) ->
    {false, lang:get("不在公会中,无法发起公会求助")}.

get_need_lev(DunId) ->
    case dungeon_data:get(DunId) of
        #dungeon_base{cond_enter = Conds} ->
            case lists:keyfind(lev, #condition.label, Conds) of
                #condition{val = Val} -> Val;
                _ -> 35
            end;
        _ -> 35
    end.

do_answer_help(Role,
               #dungeon_invitation{team_id = TeamId,
                                   dun_id = DunId}) ->
    case join(Role, TeamId, DunId) of
        {ok, NewRole} -> {ok, NewRole};
        Else -> Else
    end;
do_answer_help(Role,
               #help_msg{digit_array =
                             [{11, TI}, {12, TZ}, {13, DunId} | _],
                         str_array = [{1008, TP} | _]}) ->
    case join(Role, {TI, TP, TZ}, DunId) of
        {ok, NewRole} -> {ok, NewRole};
        Else -> Else
    end;
do_answer_help(_, _) -> {false, lang:get("请求已过期")}.

enlisting_expire() ->
    Now = date:unixtime(),
    L = ets:tab2list(dungeon_enlistment),
    enlisting_expire(L, Now).

enlisting_expire([], _Now) -> ok;
enlisting_expire([Enlist = #dungeon_enlistment{id =
                                                   TeamId,
                                               dun_id = DunId,
                                               leader =
                                                   #dungeon_mate{matched =
                                                                     Time}}
                  | T],
                 Now)
    when Now - Time > 180 ->
    ets:match_delete(dungeon_enlistment,
                     #dungeon_enlistment{id = TeamId, dun_id = DunId,
                                         _ = '_'}),
    case role_misc:is_local_role(TeamId) of
        true -> dungeon_team ! {leave_enlisting, Enlist};
        _ -> ok
    end,
    enlisting_expire(T, Now);
enlisting_expire([_ | T], Now) ->
    enlisting_expire(T, Now).

convert_mates([], _) -> [];
convert_mates([H | T], DunId) ->
    {ok, M} = role_convert:to(dungeon_mate, H),
    [M#dungeon_mate{dun_id = DunId} | convert_mates(T,
                                                    DunId)].

