-file("src/mod/guild/guild_treasure.erl", 1).

-module(guild_treasure).

-export([add/1,
         add_fail/1,
         set_time/2,
         combat_check/2,
         check_pick/2,
         open_box/1,
         combat_over/1,
         check_gain/3,
         apply_guild/2,
         gen_units/1,
         check_num/1,
         reset/1,
         init_timer/1,
         all_clear/0]).

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

-file("src/mod/guild/guild_treasure.erl", 26).

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

-file("src/mod/guild/guild_treasure.erl", 27).

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

-file("src/mod/guild/guild_treasure.erl", 28).

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

-file("src/mod/guild/guild_treasure.erl", 29).

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

-file("src/mod/guild/guild_treasure.erl", 30).

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

-file("src/mod/guild/guild_treasure.erl", 31).

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

-file("src/mod/guild/guild_treasure.erl", 32).

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

-file("src/mod/guild/guild_treasure.erl", 33).

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

-file("src/mod/guild/guild_treasure.erl", 34).

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

-file("src/mod/guild/guild_treasure.erl", 35).

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

-file("src/mod/guild/guild_treasure.erl", 36).

add([]) -> ok;
add([Gid | T]) ->
    add(Gid),
    add(T);
add(Gid) ->
    guild_mgr:apply(async,
                    Gid,
                    {guild_treasure, apply_guild, [add]}).

add_fail([]) -> ok;
add_fail([Gid | T]) ->
    add_fail(Gid),
    add_fail(T);
add_fail(Gid) ->
    guild_mgr:apply(async,
                    Gid,
                    {guild_treasure, apply_guild, [add_fail]}).

set_time(#role{m_guild = #m_guild{post = Post}}, _)
    when Post < 40 ->
    {false, lang:get("只有会长、副会长、长老才能打开这神奇的宝箱")};
set_time(#role{m_guild = #m_guild{pid = GuildPid},
               name = Name},
         0) ->
    Now = date:unixtime(),
    case guild:apply(sync,
                     GuildPid,
                     {guild_treasure,
                      apply_guild,
                      [{set_time, Name, Now, Now}]})
        of
        ok -> ok;
        Else -> Else
    end;
set_time(#role{m_guild = #m_guild{pid = GuildPid},
               name = Name},
         Time) ->
    Now = date:unixtime(),
    STime = Time + date:unixtime(zero),
    case guild:apply(sync,
                     GuildPid,
                     {guild_treasure,
                      apply_guild,
                      [{set_time, Name, STime, Now}]})
        of
        ok -> ok;
        Else -> Else
    end;
set_time(#role{}, _) ->
    {false, lang:get("只有会长、副会长、长老才能打开这神奇的宝箱")}.

open_box(Role = #role{m_guild =
                          #m_guild{pid = GuildPid, post = Post},
                      name = Name})
    when Post >= 40 ->
    case guild:apply(sync,
                     GuildPid,
                     {guild_treasure, apply_guild, [{open_box, Name}]})
        of
        ok ->
            notice:send(Role, 1, lang:get("宝藏已成功打开")),
            ok;
        Else -> Else
    end;
open_box(#role{}) ->
    {false, lang:get("只有会长、副会长、长老才能打开这神奇的宝箱")}.

check_pick(Role, PickArgs = #{fun_type := 29}) ->
    case open_box(Role) of
        ok -> {true, PickArgs};
        Else -> Else
    end;
check_pick(#role{id = Id,
                 m_guild = #m_guild{pid = GuildPid, name = GName},
                 name = Name},
           PickArgs = #{base_id := BaseId}) ->
    case guild:apply(sync,
                     GuildPid,
                     {guild_treasure, apply_guild, [{pick_box, Id}]})
        of
        ok ->
            Gain = case guild_data:get_treasure_box(BaseId) of
                       L = [_ | _] ->
                           case util:rand_list(L, item_weight) of
                               #{item_id := ItemId, item_num := ItemNum,
                                 announce := Announce} ->
                                   ItemId0 = item_type:special_id(ItemId),
                                   case Announce of
                                       1 ->
                                           AnStr =
                                               notice:format(lang:get("~ts公会打开了~ts，~ts目瞪口呆地从满地宝物中拾取一件~ts{face_1, "
                                                                      "42}"),
                                                             [{string_2,
                                                               2,
                                                               GName},
                                                              {string_2,
                                                               5,
                                                               lang:get("宝藏")},
                                                              {role_2, Name},
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

combat_check(#role{lev = Lev}, _Unit) when Lev < 20 ->
    {false,
     util:flist(lang:get("哎哟太危险啦，你的等级不足<color='#ffff00'>~w</color>级，不能挑"
                         "战公会宝藏。"),
                [20])};
combat_check(Role = #role{m_guild =
                              #m_guild{pid = Pid}},
             Unit = #unit{base_id = BaseId}) ->
    case combat_mgr:check_self(28, Role, Unit) of
        {false, Reason} -> {false, Reason};
        true ->
            case team:get_fighters(Role) of
                {ok, Mates} when length(Mates) < 3 ->
                    {false,
                     util:flist(lang:get("就这点人也敢来？组满~w人再来挑战我吧"), [3])};
                {ok, Mates} ->
                    case check_team_mate(Mates) of
                        ok ->
                            _Res = combat_mgr:start_combat(28,
                                                           Mates,
                                                           Unit,
                                                           #combat_start_args{ext_args
                                                                                  =
                                                                                  {Pid,
                                                                                   BaseId}}),
                            logger:debug("开战结果 ~w",
                                         [_Res],
                                         guild_treasure,
                                         203),
                            {ok};
                        Else -> Else
                    end;
                Else -> Else
            end
    end.

-spec combat_over(Combat :: #combat{}) -> list().

combat_over(#combat{winner = Winner,
                    start_args =
                        #combat_start_args{ext_args = {Pid, BaseId}}}) ->
    case [F || F = #fighter{type = 1, group = 0} <- Winner]
        of
        WinnerF = [_ | _] ->
            guild:apply(async,
                        Pid,
                        {guild_treasure,
                         apply_guild,
                         [{combat_over, WinnerF, BaseId}]}),
            ok;
        _ -> ok
    end.

check_gain(Role, Rewards, win) ->
    case var:get_var(Role, day, 38, 0) of
        N when N < 5 ->
            Role1 = var:acc_var(Role, day, 38),
            G1 = format:val_to_gain([{90011, 5}]),
            {Role1, G1 ++ Rewards};
        N when N < 20 ->
            Fun = fun (G = #gain{label = Label, val = V})
                          when Label =:= exp orelse Label =:= pet_exp ->
                          G#gain{val = round(V * 6.99999999999999955591e-1)};
                      (G) -> G
                  end,
            {Role, [Fun(Go) || Go <- Rewards]};
        _ ->
            Fun = fun (G = #gain{label = Label, val = V})
                          when Label =:= exp orelse Label =:= pet_exp ->
                          G#gain{val = round(V * 2.99999999999999988898e-1)};
                      (G) -> G
                  end,
            {Role, [Fun(Go) || Go <- Rewards]}
    end;
check_gain(Role, _Rewards, _) -> {Role, []}.

apply_guild(G = #guild{id = Gid, treasure = Treasure,
                       map_id = MapId, map_pid = Mpid, members = Members},
            add_fail) ->
    guild_common:send_mail(Gid,
                           lang:get("激励宝藏"),
                           notice:format(lang:get("几经厮杀，本公会在公会战中遗憾战败，但是大家的拼搏精神值得嘉奖。公会领地出现了公会~ts。"
                                                  "请会长前往查看{face_1, 16}"),
                                         [{string_2, 5, lang:get("激励宝藏")}])),
    Now = date:unixtime(),
    Time = date:now_diff(2, {19, 0, 0}),
    Timeout = Time * 1000,
    NewTreasure = Treasure#guild_treasure{added = Now,
                                          setting_chance = 1, can_open = 0,
                                          setting_time = Now + Time,
                                          unit_num = 0, gen_time = 0,
                                          generated = 0, fighters = [],
                                          picker = [], type = fail},
    {BaseId, _, _} = {79713, 1198, 621},
    {BaseId2, _, _} = {79712, 1198, 621},
    {BaseId3, X, Y} = {79722, 1198, 621},
    {BaseId4, _, _} = {79721, 1198, 621},
    clear_units(Mpid, [BaseId, BaseId2, BaseId3, BaseId4]),
    unit_mgr:create(19, BaseId3, {MapId, X, Y}),
    gen_unit_timer(Timeout),
    Msg0 =
        notice:format(lang:get("公会战鼓励奖~ts已运达公会领地，请会长前往查看{face_1, 16}"),
                      [{string_2, 3, lang:get("激励宝藏")}]),
    guild:notice(Members, Msg0),
    {ok, G#guild{treasure = NewTreasure}};
apply_guild(G = #guild{treasure = Treasure,
                       map_id = MapId, map_pid = Mpid, members = Members},
            add) ->
    Now = date:unixtime(),
    Time = date:now_diff(2, {19, 0, 0}),
    Timeout = Time * 1000,
    NewTreasure = Treasure#guild_treasure{added = Now,
                                          setting_chance = 1, can_open = 0,
                                          setting_time = Now + Time,
                                          unit_num = 0, gen_time = 0,
                                          generated = 0, fighters = [],
                                          picker = [], type = win},
    {BaseId, X, Y} = {79713, 1198, 621},
    {BaseId2, _, _} = {79712, 1198, 621},
    {BaseId3, _, _} = {79722, 1198, 621},
    {BaseId4, _, _} = {79721, 1198, 621},
    clear_units(Mpid, [BaseId, BaseId2, BaseId3, BaseId4]),
    unit_mgr:create(19, BaseId, {MapId, X, Y}),
    gen_unit_timer(Timeout),
    Msg0 =
        notice:format(lang:get("公会战战利品~ts已运达公会领地，请会长前往查看！{face_1, 16}"),
                      [{string_2, 3, lang:get("公会秘藏")}]),
    guild:notice(Members, Msg0),
    {ok, G#guild{treasure = NewTreasure}};
apply_guild(#guild{treasure =
                       #guild_treasure{setting_chance = 0}},
            {set_time, _, _Time, _Now}) ->
    {ok, {false, lang:get("当前不能设定宝藏时间")}};
apply_guild(G = #guild{treasure =
                           Treasure = #guild_treasure{setting_time = Set,
                                                      type = Type},
                       members = Members},
            {set_time, Name, Time, Now}) ->
    Res = case date:is_same_day(Set, Now) of
              _ when Set =< Time -> {false, lang:get("无效的时间")};
              true -> {false, lang:get("今天不能设定开启时间")};
              _ ->
                  NewTreasure = Treasure#guild_treasure{setting_time =
                                                            Time,
                                                        setting_chance = 0},
                  Timeout = case Time > Now of
                                true -> (Time - Now) * 1000;
                                _ -> 1
                            end,
                  gen_unit_timer(Timeout),
                  case Timeout of
                      1 -> {ok, G#guild{treasure = NewTreasure}};
                      _ ->
                          {{_, M, D}, {H, Min, _}} =
                              date:seconds_to_datetime(Time),
                          TimeStr = case Min of
                                        0 ->
                                            util:flist(lang:get("~w月~w日 ~w:~w~w"),
                                                       [M, D, H, Min, Min]);
                                        _ ->
                                            util:flist(lang:get("~w月~w日 ~w:~w"),
                                                       [M, D, H, Min])
                                    end,
                          case Type of
                              fail ->
                                  Content =
                                      notice:format(lang:get("经过公会高层的商议，会长决定开启公会战所获的战利品~ts开始时间定为~ts,诸位成员请准时"
                                                             "到达公会领地，共同守护激励宝藏。"),
                                                    [{string_2,
                                                      5,
                                                      lang:get("激励宝藏")},
                                                     {string_2, 5, TimeStr}]),
                                  Msg =
                                      notice:format(lang:get("~ts决定在~ts开启激励宝藏，各方妖魔闻风而动！请公会各成员准时集结，共御强敌！{fac"
                                                             "e_1, 7}"),
                                                    [{role_2, Name},
                                                     {string_2, 5, TimeStr}]),
                                  guild:notice(Members, Msg),
                                  MailInfo = #{content => Content, title => ""},
                                  guild_common:sync_send_mail(G#guild{treasure =
                                                                          NewTreasure},
                                                              MailInfo);
                              _ ->
                                  Content =
                                      notice:format(lang:get("经过公会高层的商议，会长决定开启公会战所获的战利品~ts开始时间定为~ts,诸位成员请准时"
                                                             "到达公会领地，共同守护公会秘藏。"),
                                                    [{string_2,
                                                      5,
                                                      lang:get("公会秘藏")},
                                                     {string_2, 5, TimeStr}]),
                                  Msg =
                                      notice:format(lang:get("~ts决定在~ts开启公会秘藏，各方妖魔闻风而动！请公会各成员准时集结，共御强敌！{fac"
                                                             "e_1, 7}"),
                                                    [{role_2, Name},
                                                     {string_2, 5, TimeStr}]),
                                  guild:notice(Members, Msg),
                                  MailInfo = #{content => Content, title => ""},
                                  guild_common:sync_send_mail(G#guild{treasure =
                                                                          NewTreasure},
                                                              MailInfo)
                          end
                  end
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> {ok, Res}
    end;
apply_guild(G = #guild{treasure =
                           Treasure = #guild_treasure{picker = Picker}},
            {pick_box, Id}) ->
    Res = case lists:member(Id, Picker) of
              true -> {false, lang:get("宝箱每人只能采集一个")};
              _ ->
                  NewTreasure = Treasure#guild_treasure{picker =
                                                            [Id | Picker]},
                  {ok, G#guild{treasure = NewTreasure}}
          end,
    case Res of
        {ok, NewG} -> {ok, ok, NewG};
        Else -> {ok, Else}
    end;
apply_guild(G = #guild{id = _Id, map_id = _MapId,
                       members = Members,
                       treasure =
                           Treasure = #guild_treasure{unit_num = UnitNum,
                                                      generated = Generated,
                                                      setting_time = Set,
                                                      type = fail},
                       assets = OldAssets, max_assets = MaxAssets},
            {combat_over, Winner, BaseId})
    when Generated < 4 ->
    Ids = [{Rid, Plat, ZoneId}
           || #fighter{rid = Rid, platform = Plat,
                       zone_id = ZoneId, type = 1, group = 0}
                  <- Winner],
    AddAssets = case lists:member(BaseId,
                                  [79760, 79761, 79762, 79763])
                    of
                    true -> 50000;
                    _ ->
                        case lists:member(BaseId, [79764, 79765, 79766]) of
                            true -> 100000;
                            _ -> 500000
                        end
                end,
    case [{role_2, Name}
          || #fighter{name = Name, type = 1, group = 0} <- Winner]
        of
        Names = [_, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        Names = [_, _, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        Names = [_, _, _, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资"
                                       "金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        _ -> ok
    end,
    logger:debug("击杀魔族工会--->~w, fighters ---> ~w",
                 [_Id, Ids],
                 guild_treasure,
                 395),
    Now = date:unixtime(),
    Remain = max(0, UnitNum - 1),
    NewAssets = min(OldAssets + AddAssets, MaxAssets),
    logger:debug("剩余魔族 ~w", [Remain], guild_treasure, 400),
    NewGuild = case Treasure of
                   #guild_treasure{last_killed = Killed}
                       when Killed > 0 andalso Remain =:= 0 ->
                       Treasure1 = Treasure#guild_treasure{last_killed = 0,
                                                           killed_time = Now,
                                                           unit_num = 0},
                       Msg = case Generated of
                                 3 ->
                                     Timeout = max(1,
                                                   min(6000,
                                                       (1200 - (Now - Set)) *
                                                           1000)),
                                     logger:debug("宝箱时间 ~w",
                                                  [Timeout],
                                                  guild_treasure,
                                                  411),
                                     gen_unit_timer(Timeout),
                                     notice:format(lang:get("所有敌人已被击退，请等待~ts开启{face_1, 18}"),
                                                   [{string_2,
                                                     5,
                                                     lang:get("宝藏")}]);
                                 _ ->
                                     Timeout = max(1,
                                                   min(120000,
                                                       600000 -
                                                           (Now - Set) * 1000)),
                                     logger:debug("第二波怪时间 ~w",
                                                  [Timeout],
                                                  guild_treasure,
                                                  416),
                                     gen_unit_timer(Timeout),
                                     lang:get("暂时击退了小妖小魔，不要放松警惕，还有敌人潜伏在附近！{face_1, "
                                              "26}")
                             end,
                       guild:notice(Members, Msg),
                       Treasure2 = #guild_treasure{} =
                                       update_fighters(Treasure1, Ids),
                       G#guild{treasure = Treasure2, assets = NewAssets};
                   #guild_treasure{last_killed = Killed} ->
                       Treasure1 = Treasure#guild_treasure{last_killed =
                                                               Killed + 1,
                                                           killed_time = Now,
                                                           unit_num = Remain},
                       Treasure2 = update_fighters(Treasure1, Ids),
                       G#guild{treasure = Treasure2, assets = NewAssets}
               end,
    guild_build:push_11113(NewGuild),
    {ok, NewGuild};
apply_guild(G = #guild{id = _Id, map_id = _MapId,
                       members = Members,
                       treasure =
                           Treasure = #guild_treasure{unit_num = UnitNum,
                                                      generated = Generated,
                                                      setting_time = Set},
                       assets = OldAssets, max_assets = MaxAssets},
            {combat_over, Winner, BaseId})
    when Generated < 4 ->
    Ids = [{Rid, Plat, ZoneId}
           || #fighter{rid = Rid, platform = Plat,
                       zone_id = ZoneId, type = 1, group = 0}
                  <- Winner],
    AddAssets = case lists:member(BaseId,
                                  [79730, 79731, 79732, 79733])
                    of
                    true -> 50000;
                    _ ->
                        case lists:member(BaseId, [79734, 79735, 79736]) of
                            true -> 100000;
                            _ -> 500000
                        end
                end,
    case [{role_2, Name}
          || #fighter{name = Name, type = 1, group = 0} <- Winner]
        of
        Names = [_, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        Names = [_, _, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        Names = [_, _, _, _, _] ->
            Msg0 =
                notice:format(lang:get("~ts、~ts、~ts、~ts、~ts表现骁勇，将~ts打的落花流水，为公会收获了~ts资"
                                       "金！~ts"),
                              Names ++
                                  [{unit_1, BaseId},
                                   {string_2, 5, AddAssets},
                                   {face_1, 18}]),
            guild:notice(Members, Msg0);
        _ -> ok
    end,
    logger:debug("击杀魔族工会--->~w, fighters ---> ~w",
                 [_Id, Ids],
                 guild_treasure,
                 457),
    Now = date:unixtime(),
    Remain = max(0, UnitNum - 1),
    NewAssets = min(OldAssets + AddAssets, MaxAssets),
    logger:debug("剩余魔族 ~w", [Remain], guild_treasure, 462),
    NewGuild = case Treasure of
                   #guild_treasure{last_killed = Killed}
                       when Killed > 0 andalso Remain =:= 0 ->
                       Treasure1 = Treasure#guild_treasure{last_killed = 0,
                                                           killed_time = Now,
                                                           unit_num = 0},
                       Msg = case Generated of
                                 3 ->
                                     Timeout = max(1,
                                                   min(6000,
                                                       (1200 - (Now - Set)) *
                                                           1000)),
                                     logger:debug("宝箱时间 ~w",
                                                  [Timeout],
                                                  guild_treasure,
                                                  473),
                                     gen_unit_timer(Timeout),
                                     notice:format(lang:get("所有敌人已被击退，请等待~ts开启{face_1, 18}"),
                                                   [{string_2,
                                                     5,
                                                     lang:get("秘藏")}]);
                                 _ ->
                                     Timeout = max(1,
                                                   min(120000,
                                                       600000 -
                                                           (Now - Set) * 1000)),
                                     logger:debug("第二波怪时间 ~w",
                                                  [Timeout],
                                                  guild_treasure,
                                                  478),
                                     gen_unit_timer(Timeout),
                                     lang:get("暂时击退了小妖小魔，不要放松警惕，还有敌人潜伏在附近！{face_1, "
                                              "26}")
                             end,
                       guild:notice(Members, Msg),
                       Treasure2 = #guild_treasure{} =
                                       update_fighters(Treasure1, Ids),
                       G#guild{treasure = Treasure2, assets = NewAssets};
                   #guild_treasure{last_killed = Killed} ->
                       Treasure1 = Treasure#guild_treasure{last_killed =
                                                               Killed + 1,
                                                           killed_time = Now,
                                                           unit_num = Remain},
                       Treasure2 = update_fighters(Treasure1, Ids),
                       G#guild{treasure = Treasure2, assets = NewAssets}
               end,
    guild_build:push_11113(NewGuild),
    {ok, NewGuild};
apply_guild(#guild{}, {combat_over, _, _}) -> ok;
apply_guild(#guild{treasure =
                       #guild_treasure{can_open = 0}},
            {open_box, _Name}) ->
    {ok, {false, lang:get("宝箱还不能打开")}};
apply_guild(G = #guild{map_id = MapId,
                       members = Members, map_pid = Mpid,
                       treasure =
                           Treasure = #guild_treasure{fighters = Fighters,
                                                      unit_num = UnitNum,
                                                      type = fail}},
            {open_box, Name}) ->
    Now = date:unixtime(),
    BoxNum = 1 + round(length(Fighters) * 8.0e-1),
    {BaseId, _, _} = {79722, 1198, 621},
    clear_units(Mpid,
                [BaseId,
                 79760,
                 79761,
                 79762,
                 79763,
                 79764,
                 79765,
                 79766,
                 79737]),
    logger:debug("宝箱数量 ~w", [BoxNum], guild_treasure, 507),
    GuildBattleId = 19,
    LittleRate = min(100, 70 + 5 * UnitNum),
    BigRate = max(0, 100 - LittleRate),
    create_units({GuildBattleId, MapId},
                 round(BoxNum * LittleRate / 100),
                 [79724]),
    create_units({GuildBattleId, MapId},
                 round(BoxNum * BigRate / 100),
                 [79723]),
    Msg =
        notice:format(lang:get("~ts在众人的注视下打开了激励宝藏，金光闪闪，公会领地中散满一地宝箱！{face_1, "
                               "20}"),
                      [{role_2, Name}]),
    guild:notice(Members, Msg),
    gen_unit_timer(600000),
    Treasure1 = Treasure#guild_treasure{can_open = 0,
                                        gen_time = Now, unit_num = 0,
                                        fighters = []},
    {ok, ok, G#guild{treasure = Treasure1}};
apply_guild(G = #guild{map_id = MapId,
                       members = Members, map_pid = Mpid,
                       treasure =
                           Treasure = #guild_treasure{fighters = Fighters,
                                                      unit_num = UnitNum}},
            {open_box, Name}) ->
    Now = date:unixtime(),
    BoxNum = 1 + round(length(Fighters) * 8.0e-1),
    {BaseId, _, _} = {79713, 1198, 621},
    clear_units(Mpid,
                [BaseId,
                 79730,
                 79731,
                 79732,
                 79733,
                 79734,
                 79735,
                 79736,
                 79737]),
    logger:debug("宝箱数量 ~w", [BoxNum], guild_treasure, 529),
    GuildBattleId = 19,
    LittleRate = min(100, 70 + 5 * UnitNum),
    BigRate = max(0, 100 - LittleRate),
    create_units({GuildBattleId, MapId},
                 round(BoxNum * LittleRate / 100),
                 [79715]),
    create_units({GuildBattleId, MapId},
                 round(BoxNum * BigRate / 100),
                 [79714]),
    Msg =
        notice:format(lang:get("~ts在众人的注视下打开了公会秘藏，金光闪闪，公会领地中散满一地宝箱！{face_1, "
                               "20}"),
                      [{role_2, Name}]),
    guild:notice(Members, Msg),
    gen_unit_timer(600000),
    Treasure1 = Treasure#guild_treasure{can_open = 0,
                                        gen_time = Now, unit_num = 0,
                                        fighters = []},
    {ok, ok, G#guild{treasure = Treasure1}};
apply_guild(G = #guild{map_pid = Mpid,
                       treasure = Treasure},
            all_clear) ->
    {BaseId, _, _} = {79712, 1198, 621},
    {BaseId2, _, _} = {79713, 1198, 621},
    {BaseId3, _, _} = {79721, 1198, 621},
    {BaseId4, _, _} = {79722, 1198, 621},
    clear_units(Mpid,
                [BaseId,
                 BaseId2,
                 BaseId3,
                 BaseId4,
                 79730,
                 79731,
                 79732,
                 79733,
                 79734,
                 79735,
                 79736,
                 79737]
                    ++
                    [79760,
                     79761,
                     79762,
                     79763,
                     79764,
                     79765,
                     79766,
                     79737]),
    Treasure1 = Treasure#guild_treasure{can_open = 0,
                                        unit_num = 0, fighters = []},
    {ok, G#guild{treasure = Treasure1}};
apply_guild(#guild{}, _Act) ->
    logger:error("未知消息 ~w", [_Act], guild_treasure, 559),
    ok.

-spec gen_units(Guild :: #guild{}) -> ok |
                                      {ok, NewGuild :: #guild{}}.

gen_units(G = #guild{treasure =
                         Treasure = #guild_treasure{generated = 0, type = Type},
                     members = Members}) ->
    Now = date:unixtime(),
    Treasure1 = Treasure#guild_treasure{generated = 1,
                                        setting_chance = 0, gen_time = Now,
                                        unit_num = 0, picker = []},
    Msg = case Type of
              fail ->
                  lang:get("激励宝藏正在开启，开启过程中有夺宝小妖入侵，请务必在开启前清除入侵者！{face_1, 7}");
              _ ->
                  lang:get("公会秘藏正在开启，开启过程中有夺宝小妖入侵，请务必在开启前清除入侵者！{face_1, 7}")
          end,
    guild:notice(Members, Msg),
    pop_all(Type, Members),
    gen_unit_timer(30000),
    {ok, G#guild{treasure = Treasure1}};
gen_units(G = #guild{map_id = MapId, members = Members,
                     map_pid = _Mpid,
                     treasure =
                         Treasure = #guild_treasure{generated = Generated,
                                                    setting_time = Set,
                                                    unit_num = Remain,
                                                    type = Type}})
    when Generated < 3 ->
    Now = date:unixtime(),
    GuildBattleId = 19,
    OnlineNum = length([O
                        || O = #guild_role{status = 1} <- Members]),
    {Num1, Num2} = case Generated of
                       1 ->
                           {min(25, 2 + round(OnlineNum * 2.0e-1)),
                            min(5, round(OnlineNum * 5.0e-2))};
                       _ ->
                           {min(25,
                                2 +
                                    round(OnlineNum *
                                              1.49999999999999994449e-1)),
                            min(5, 1 + round(OnlineNum * 1.0e-1))}
                   end,
    case Type of
        fail ->
            create_units({GuildBattleId, MapId},
                         Num1,
                         [79760, 79761, 79762, 79763]),
            create_units({GuildBattleId, MapId},
                         Num2,
                         [79764, 79765, 79766]);
        _ ->
            create_units({GuildBattleId, MapId},
                         Num1,
                         [79730, 79731, 79732, 79733]),
            create_units({GuildBattleId, MapId},
                         Num2,
                         [79734, 79735, 79736])
    end,
    Num3 = Num1 + Num2 + Remain,
    Num = case Generated of
              1 -> Num3;
              _ when Type == fail ->
                  create_units({GuildBattleId, MapId}, 1, [79767]),
                  Num3 + 1;
              _ ->
                  create_units({GuildBattleId, MapId}, 1, [79737]),
                  Num3 + 1
          end,
    Msg = case Generated of
              1 when Type == fail ->
                  notice:format(lang:get("领地里出现了大量觊觎宝藏的~ts！快快赶跑他们！{face_1, 12}"),
                                [{string_2, 5, lang:get("宝藏妖魔")}]);
              1 ->
                  notice:format(lang:get("领地里出现了大量觊觎秘藏的~ts！快快赶跑他们！{face_1, 12}"),
                                [{string_2, 5, lang:get("秘藏妖魔")}]);
              _ when Type == fail ->
                  notice:format(lang:get("领地里出现了强大的~ts！清除他的爪牙，彻底击败他！{face_1, 12}"),
                                [{string_2, 5, lang:get("宝藏收割者")}]);
              _ ->
                  notice:format(lang:get("领地里出现了强大的~ts！清除他的爪牙，彻底击败他！{face_1, 12}"),
                                [{string_2, 5, lang:get("秘藏收割者")}])
          end,
    guild:notice(self(), Msg),
    Treasure1 = Treasure#guild_treasure{generated =
                                            Generated + 1,
                                        setting_chance = 0, gen_time = Now,
                                        unit_num = Num, picker = []},
    Timeout = calc_gen_time(Generated, Set, Now),
    logger:debug("第 ~w 波怪时间 ~w",
                 [Generated, Timeout],
                 guild_treasure,
                 625),
    gen_unit_timer(Timeout),
    case erlang:get(guild_treasure_check_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(30000,
                               self(),
                               check_treasure_num),
    erlang:put(guild_treasure_check_ref, NewRef),
    {ok, G#guild{treasure = Treasure1}};
gen_units(G = #guild{map_pid = Mpid,
                     treasure =
                         Treasure = #guild_treasure{generated = 3, type = Type},
                     map_id = MapId, members = Members}) ->
    Msg = case get_remain_unit_num(Mpid) of
              0 when Type == fail ->
                  notice:format(lang:get("公会成员通力合作，完整地保护了~ts，快来开启这神秘的宝藏吧！{face_1, "
                                         "29}"),
                                [{string_2, 5, lang:get("激励宝藏")}]);
              0 ->
                  notice:format(lang:get("公会成员通力合作，完整地保护了~ts，快来开启这神秘的宝藏吧！{face_1, "
                                         "29}"),
                                [{string_2, 5, lang:get("公会秘藏")}]);
              _ when Type == fail ->
                  lang:get("公会成员努力保护住了部分宝藏，快来开启这得来不易的宝藏吧！{face_1, "
                           "18}");
              _ ->
                  lang:get("公会成员努力保护住了部分秘藏，快来开启这得来不易的秘藏吧！{face_1, "
                           "18}")
          end,
    guild:notice(Members, Msg),
    {BaseId, _X, _Y} = {79713, 1198, 621},
    {FBaseId, _X, _Y} = {79722, 1198, 621},
    clear_units(Mpid,
                [BaseId,
                 FBaseId,
                 79730,
                 79731,
                 79732,
                 79733,
                 79734,
                 79735,
                 79736,
                 79737]
                    ++
                    [79760, 79761, 79762, 79763, 79764, 79765, 79766, 79737]
                        ++ [79714, 79715] ++ [79723, 79724]),
    gen_unit_timer(600000 * 3),
    NewCanOpen = 1,
    Treasure1 = Treasure#guild_treasure{generated = 4,
                                        can_open = NewCanOpen,
                                        setting_chance = 0, picker = []},
    {BaseId2, X, Y} = case Type of
                          fail -> {79721, 1198, 621};
                          _ -> {79712, 1198, 621}
                      end,
    unit_mgr:create(19, BaseId2, {MapId, X, Y}),
    {ok, G#guild{treasure = Treasure1}};
gen_units(G = #guild{map_pid = Mpid,
                     treasure = Treasure = #guild_treasure{},
                     members = Members}) ->
    {BaseId, _X, _Y} = {79713, 1198, 621},
    {BaseId2, _, _} = {79712, 1198, 621},
    {BaseId3, _, _} = {79722, 1198, 621},
    {BaseId4, _, _} = {79721, 1198, 621},
    clear_units(Mpid,
                [BaseId,
                 BaseId2,
                 BaseId3,
                 BaseId4,
                 79730,
                 79731,
                 79732,
                 79733,
                 79734,
                 79735,
                 79736,
                 79737]
                    ++
                    [79760, 79761, 79762, 79763, 79764, 79765, 79766, 79737]
                        ++ [79714, 79715] ++ [79723, 79724]),
    case erlang:get(guild_treasure_unit_expire_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Msg = lang:get("时间到，宝藏慢慢散去了"),
    guild:notice(Members, Msg),
    Treasure1 = Treasure#guild_treasure{generated = 5,
                                        can_open = 0, setting_chance = 0,
                                        unit_num = 0},
    {ok, G#guild{treasure = Treasure1}}.

check_num(#guild{map_pid = MapPid, members = Members,
                 treasure = #guild_treasure{type = Type}}) ->
    case erlang:get(guild_treasure_check_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case get_remain_unit_num(MapPid) of
        0 -> ok;
        Num ->
            case Type of
                fail ->
                    guild:notice(Members,
                                 notice:format(lang:get("还有~ts个敌人正拼命冲向宝藏，快击退他们，让他们有来无回！{face_1, "
                                                        "13}"),
                                               [{string_2, 5, Num}]));
                _ ->
                    guild:notice(Members,
                                 notice:format(lang:get("还有~ts个敌人正拼命冲向秘藏，快击退他们，让他们有来无回！{face_1, "
                                                        "13}"),
                                               [{string_2, 5, Num}]))
            end,
            NewRef = erlang:send_after(30000,
                                       self(),
                                       check_treasure_num),
            erlang:put(guild_treasure_check_ref, NewRef)
    end,
    ok.

reset(G = #guild{treasure =
                     Treasure = #guild_treasure{setting_chance = Chance,
                                                setting_time = Set,
                                                type = Type},
                 members = Members})
    when Chance > 0 ->
    case date:is_same_day(date:unixtime(), Set) of
        true ->
            {{_, M, D}, {H, Min, _}} =
                date:seconds_to_datetime(Set),
            TimeStr = case Min of
                          0 ->
                              util:flist(lang:get("~w月~w日 ~w:~w~w"),
                                         [M, D, H, Min, Min]);
                          _ ->
                              util:flist(lang:get("~w月~w日 ~w:~w"),
                                         [M, D, H, Min])
                      end,
            Content = case Type of
                          fail ->
                              notice:format(lang:get("会长事务繁忙，尚未处置公会战战利品~ts，开始时间自动定为~ts,诸位成员请准时到达公会领"
                                                     "地，共同守护激励宝藏。"),
                                            [{string_2, 5, lang:get("激励宝藏")},
                                             {string_2, 5, TimeStr}]);
                          _ ->
                              notice:format(lang:get("会长事务繁忙，尚未处置公会战战利品~ts，开始时间自动定为~ts,诸位成员请准时到达公会领"
                                                     "地，共同守护公会秘藏。"),
                                            [{string_2, 5, lang:get("公会秘藏")},
                                             {string_2, 5, TimeStr}])
                      end,
            guild:notice(Members, Content),
            MailInfo = #{content => Content, title => ""},
            NewTreasure = Treasure#guild_treasure{setting_chance =
                                                      0},
            {ok, NewG} =
                guild_common:sync_send_mail(G#guild{treasure =
                                                        NewTreasure},
                                            MailInfo),
            NewG;
        _ -> G
    end;
reset(G) -> G.

init_timer(#guild{treasure =
                      #guild_treasure{setting_time = Set, type = fail},
                  map_id = MapId}) ->
    Now = date:unixtime(),
    case Set - Now of
        N when N > 0 andalso N < 3600 * 68 ->
            {BaseId, X, Y} = {79722, 1198, 621},
            unit_mgr:create(19, BaseId, {MapId, X, Y}),
            Timeout = N * 1000,
            logger:debug("宝藏时间 ~w, timeout ~w",
                         [Set, Timeout],
                         guild_treasure,
                         742),
            NewGRef = erlang:send_after(Timeout,
                                        self(),
                                        gen_treasure_unit),
            erlang:put(guild_treasure_unit_expire_ref, NewGRef),
            ok;
        _ -> ok
    end;
init_timer(#guild{treasure =
                      #guild_treasure{setting_time = Set},
                  map_id = MapId}) ->
    Now = date:unixtime(),
    case Set - Now of
        N when N > 0 andalso N < 3600 * 68 ->
            {BaseId, X, Y} = {79713, 1198, 621},
            unit_mgr:create(19, BaseId, {MapId, X, Y}),
            Timeout = N * 1000,
            logger:debug("宝藏时间 ~w, timeout ~w",
                         [Set, Timeout],
                         guild_treasure,
                         755),
            NewGRef = erlang:send_after(Timeout,
                                        self(),
                                        gen_treasure_unit),
            erlang:put(guild_treasure_unit_expire_ref, NewGRef),
            ok;
        _ -> ok
    end.

all_clear() ->
    L = ets:tab2list(guild_list),
    lists:foreach(fun (#guild{pid = Pid}) ->
                          guild_mgr:apply(async,
                                          Pid,
                                          {guild_treasure,
                                           apply_guild,
                                           [all_clear]})
                  end,
                  L).

update_fighters(Treasure = #guild_treasure{fighters =
                                               Fighters},
                Ids) ->
    Treasure#guild_treasure{fighters =
                                (Fighters -- Ids) ++ Ids}.

create_units(_Where, Num, _) when Num < 1 -> ok;
create_units(Where = {GuildBattleId, MapId}, Num,
             Units) ->
    BaseId = util:rand_list(Units),
    {X, Y} = map:rand_pos(30001),
    unit_mgr:create(GuildBattleId, BaseId, {MapId, X, Y}),
    create_units(Where, Num - 1, Units).

clear_units(MapPid, Ids) ->
    case map:unit_list(MapPid) of
        {ok, L} ->
            lists:foreach(fun (#map_unit{base_id = BaseId,
                                         id = Uid}) ->
                                  case lists:member(BaseId, Ids) of
                                      true -> unit_mgr:remove(Uid);
                                      _ -> ok
                                  end
                          end,
                          L);
        Err ->
            logger:error("id : ~w 找不到单位: ~w",
                         [MapPid, Err],
                         guild_treasure,
                         796)
    end.

check_team_mate([]) -> ok;
check_team_mate([#team_mate{lev = Lev, name = Name}
                 | _T])
    when Lev < 20 ->
    {false,
     notice:format(lang:get("哎哟太危险啦，你队伍中的~ts等级不足~ts级，不能挑战公会宝藏。"),
                   [{role_2, Name}, {string_2, 5, 20}])};
check_team_mate([_ | T]) -> check_team_mate(T).

get_remain_unit_num(Mpid) ->
    logger:debug("地图进程 ~w", [Mpid], guild_treasure, 808),
    case map:unit_list(Mpid) of
        {ok, L} ->
            length([BaseId
                    || #map_unit{base_id = BaseId} <- L,
                       lists:member(BaseId,
                                    [79730,
                                     79731,
                                     79732,
                                     79733,
                                     79734,
                                     79735,
                                     79736,
                                     79737]
                                        ++
                                        [79760,
                                         79761,
                                         79762,
                                         79763,
                                         79764,
                                         79765,
                                         79766,
                                         79737])]);
        _ -> 0
    end.

gen_unit_timer(Time) ->
    case erlang:get(guild_treasure_unit_expire_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewRef = erlang:send_after(Time,
                               self(),
                               gen_treasure_unit),
    erlang:put(guild_treasure_unit_expire_ref, NewRef).

pop_all(fail, Members) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          notice:pop({pid, Pid},
                                     2,
                                     lang:get("激励宝藏正在开启，请前往公会领地守护宝藏"));
                      (_) -> ok
                  end,
                  Members);
pop_all(_, Members) ->
    lists:foreach(fun (#guild_role{pid = Pid})
                          when is_pid(Pid) ->
                          notice:pop({pid, Pid},
                                     2,
                                     lang:get("公会秘藏正在开启，请前往公会领地守护秘藏"));
                      (_) -> ok
                  end,
                  Members).

calc_gen_time(1, _, _Now) -> 600000 - 120000;
calc_gen_time(2, Set, Now) ->
    max(1, (1200 - (Now - Set)) * 1000);
calc_gen_time(Generated, Last, _Now) ->
    logger:error("一次点 ~w, last ~w",
                 [Generated, Last],
                 guild_treasure,
                 844),
    600000.

