-file("src/mod/guild/guild_dungeon.erl", 1).

-module(guild_dungeon).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([cast/1, call/1, info/1]).

-export([start_link/0,
         push/1,
         push_rank/2,
         login/1,
         combat_start/4,
         combat_round/1,
         combat_over/1,
         combat_over/2,
         treat_slave_attr/2,
         enter/3,
         leave/1,
         look_hp/2,
         watch_combat/4,
         rank/1,
         check_times/1,
         role_callback/4,
         join_to_follow/2,
         fetch/1,
         fetch_rank/3,
         save/1,
         get_monster/4,
         send_rank_mail/3,
         update_event/3,
         check_next/1,
         gm_create_boss/3,
         gm_reset/1,
         gm_reset/0,
         gm_all/1,
         gm_chall/5,
         gm_clear_combat/0]).

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

-file("src/mod/guild/guild_dungeon.erl", 52).

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

-file("src/mod/guild/guild_dungeon.erl", 53).

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

-file("src/mod/guild/guild_dungeon.erl", 54).

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

-file("src/mod/guild/guild_dungeon.erl", 55).

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

-file("src/mod/guild/guild_dungeon.erl", 56).

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

-file("src/mod/guild/guild_dungeon.erl", 57).

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

-file("src/mod/guild/guild_dungeon.erl", 58).

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

-file("src/mod/guild/guild_dungeon.erl", 59).

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

-file("src/mod/guild/guild_dungeon.erl", 60).

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

-file("src/mod/guild/guild_dungeon.erl", 61).

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

-file("src/mod/guild/guild_dungeon.erl", 62).

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

-file("src/mod/guild/guild_dungeon.erl", 63).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/guild/guild_dungeon.erl", 64).

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

-file("src/mod/guild/guild_dungeon.erl", 65).

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

-file("src/mod/guild/guild_dungeon.erl", 66).

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

-file("src/mod/guild/guild_dungeon.erl", 67).

-record(state, {status}).

push(Role = #role{m_guild = #m_guild{id = GuildId}}) ->
    case fetch(GuildId) of
        fasle -> ok;
        GuildDungeon ->
            Times1 = var:get_var(Role, day_five, 147),
            Times2 = var:get_var(Role, day_five, 148),
            Active = env:get(guild_dungeon_status),
            role:link_send(Role,
                           19500,
                           {GuildDungeon,
                            max(2 - Times1, 0),
                            max(1 - Times2, 0),
                            Active})
    end;
push(_) -> ok.

push_rank(Role = #role{m_guild =
                           #m_guild{id = GuildId}},
          {ChapterId, StrongpointId}) ->
    GDRank = #guild_dungeon_rank{ranks = Ranks} =
                 fetch_rank(GuildId, ChapterId, StrongpointId),
    Ranks2 =
        lists:reverse(lists:keysort(#guild_dungeon_rank_role.harm,
                                    Ranks)),
    role:link_send(Role,
                   19502,
                   {GDRank#guild_dungeon_rank{ranks = Ranks2}}),
    ok.

login(Role = #role{s_event = Event, pos = Pos})
    when Event =:= 47 orelse Event =:= 46 ->
    {LMapId, Lx, Ly} = util:rand_list([{10001, 306, 3507},
                                       {10001, 2583, 3848},
                                       {10001, 4957, 3680},
                                       {10001, 445, 2565},
                                       {10001, 4646, 704},
                                       {10001, 841, 1033},
                                       {10001, 2098, 1834},
                                       {10001, 3617, 1816}]),
    NewPos = Pos#pos{map = LMapId, x = Lx, y = Ly},
    logger:debug("登陆处理~w", [Event], guild_dungeon, 124),
    {ok, Role#role{pos = NewPos, s_event = 0}};
login(_Role) -> ok.

combat_start(Role = #role{m_guild =
                              #m_guild{id = GuildId},
                          id = RoleId, name = RoleName, sex = RoleSex,
                          classes = RoleClasses, s_event = LastEvent},
             ChapterId, StrongpointId, Unique) ->
    Type1 = case guild_dungeon_data:get_chapter({ChapterId,
                                                 StrongpointId})
                of
                #{type := Type} -> Type;
                _ -> 1
            end,
    case check([lev, times, team, event, active],
               #{chapter_id => ChapterId,
                 strongpoint_id => StrongpointId, unique => Unique,
                 guild_id => GuildId, role => Role, type => Type1,
                 leader_id => RoleId})
        of
        {ok, NewArgs} ->
            MonsterId1 = case get_monster(GuildId,
                                          ChapterId,
                                          StrongpointId,
                                          Unique)
                             of
                             {ok,
                              #guild_dungeon_monster{monster_id = MonsterId}} ->
                                 MonsterId;
                             _ -> 0
                         end,
            case unit_convert:to(unit_base_id_to_fighter,
                                 MonsterId1)
                of
                {ok, Fighter = #fighter{slave = Slave}} ->
                    case call({combat_start,
                               #{chapter_id => ChapterId,
                                 strongpoint_id => StrongpointId,
                                 unique => Unique, guild_id => GuildId,
                                 role_id => RoleId, role_name => RoleName,
                                 role_sex => RoleSex,
                                 role_classes => RoleClasses, type => Type1}})
                        of
                        {ok, PercentList, Percent, TeamId} ->
                            logger:debug("随从怪物数据 ~w",
                                         [{PercentList, Percent}],
                                         guild_dungeon,
                                         146),
                            logger:debug("随从怪物数据 ~w",
                                         [Slave],
                                         guild_dungeon,
                                         147),
                            NewSlave1 = [{P,
                                          I,
                                          N,
                                          O,
                                          {guild_dungeon,
                                           treat_slave_attr,
                                           [PercentList]}}
                                         || {P, I, N, O} <- Slave],
                            NewSlave2 = [{I,
                                          N,
                                          O,
                                          {guild_dungeon,
                                           treat_slave_attr,
                                           [PercentList]}}
                                         || {I, N, O} <- Slave],
                            NewSlave = NewSlave1 ++ NewSlave2,
                            Unit = [Fighter#fighter{attr = {PercentList},
                                                    slave = NewSlave}],
                            TeamMate1 = case maps:get(team_mate, NewArgs, []) of
                                            [] -> [Role];
                                            TeamMate -> TeamMate
                                        end,
                            case combat_mgr:start_combat(56,
                                                         TeamMate1,
                                                         Unit,
                                                         #combat_start_args{ext_args
                                                                                =
                                                                                #{role_id
                                                                                      =>
                                                                                      RoleId,
                                                                                  chapter_id
                                                                                      =>
                                                                                      ChapterId,
                                                                                  strongpoint_id
                                                                                      =>
                                                                                      StrongpointId,
                                                                                  unique
                                                                                      =>
                                                                                      Unique,
                                                                                  monster_id
                                                                                      =>
                                                                                      MonsterId1,
                                                                                  guild_id
                                                                                      =>
                                                                                      GuildId,
                                                                                  percent_list
                                                                                      =>
                                                                                      PercentList,
                                                                                  old_percent
                                                                                      =>
                                                                                      Percent,
                                                                                  type
                                                                                      =>
                                                                                      Type1,
                                                                                  team_id
                                                                                      =>
                                                                                      TeamId}})
                                of
                                {ok, CombatPid} ->
                                    put(last_event, LastEvent),
                                    put(team_id, TeamId),
                                    delete_score(TeamId),
                                    [role:apply(async,
                                                MateId,
                                                {guild_dungeon,
                                                 update_event,
                                                 [46, TeamId]})
                                     || #team_mate{id = MateId, status = 2}
                                            <- TeamMate1],
                                    info({update_combat_pid,
                                          #{chapter_id => ChapterId,
                                            strongpoint_id => StrongpointId,
                                            unique => Unique,
                                            monster_id => MonsterId1,
                                            guild_id => GuildId,
                                            combat_pid => CombatPid,
                                            role_id => RoleId}}),
                                    {ok, Role#role{s_event = 46}};
                                _ -> {false, lang:get("发起战斗失败")}
                            end;
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙")}
                    end;
                _R -> {false, lang:get("怪物数据出错")}
            end;
        {false, Reason} -> {false, Reason}
    end.

update_event(Role = #role{s_event = Event}, NewEvent,
             TeamId) ->
    put(last_event, Event),
    put(team_id, TeamId),
    {ok, Role#role{s_event = NewEvent}}.

combat_round(#combat{start_args =
                         #combat_start_args{ext_args =
                                                #{percent_list :=
                                                      OldPercentList,
                                                  type := MonsterType} =
                                                    Args},
                     winner = Winner, loser = Loser}) ->
    Pids = [{pid, Pid}
            || #fighter{pid = Pid, type = 1} <- Winner],
    MateIds = [{Rid1, Platform1, ZoneId1}
               || #fighter{rid = Rid1, platform = Platform1,
                           zone_id = ZoneId1, type = 1}
                      <- Winner],
    {_PercentList, Percent, _Harm} = cal_percent(Loser,
                                                 OldPercentList,
                                                 MonsterType),
    TotalDmg1 = lists:sum([TotalDmg
                           || #fighter{type = Type,
                                       combat_statistics =
                                           #combat_statistics{total_dmg =
                                                                  TotalDmg}}
                                  <- Winner,
                              Type =:= 1 orelse
                                  Type =:= 3 orelse
                                      Type =:= 6 orelse Type =:= 5]),
    info({update_score,
          Args#{percent => Percent,
                score => util:ceil(TotalDmg1 / 1000), pids => Pids,
                mate_ids => MateIds}}),
    ok.

combat_over(#combat{round = Round,
                    start_args =
                        #combat_start_args{ext_args =
                                               #{percent_list := OldPercentList,
                                                 type := MonsterType} =
                                                   Args},
                    winner = Winner, loser = Loser}) ->
    All = Winner ++ Loser,
    case All of
        [] -> logger:error("空的列表", [], guild_dungeon, 199);
        _ ->
            Pids = [{pid, Pid}
                    || #fighter{pid = Pid, type = 1} <- All],
            MateIds = [{Rid1, Platform1, ZoneId1}
                       || #fighter{rid = Rid1, platform = Platform1,
                                   zone_id = ZoneId1, type = 1}
                              <- All],
            {PercentList, Percent, Harm} = cal_percent(Winner ++
                                                           Loser,
                                                       OldPercentList,
                                                       MonsterType),
            Record = combat_record:get_buffer(),
            info({combat_end,
                  Args#{percent_list => PercentList, percent => Percent,
                        harm => Harm, pids => Pids, record => Record,
                        round => Round}}),
            TotalDmg1 = lists:sum([TotalDmg
                                   || #fighter{type = Type,
                                               combat_statistics =
                                                   #combat_statistics{total_dmg
                                                                          =
                                                                          TotalDmg}}
                                          <- All,
                                      Type =:= 1 orelse
                                          Type =:= 3 orelse
                                              Type =:= 6 orelse Type =:= 5]),
            RoleIds = [{{Rid1, Platform1, ZoneId1},
                        RoleName1,
                        RoleClasses1,
                        RoleSex1,
                        TotalDmg1}
                       || #fighter{sex = RoleSex1, classes = RoleClasses1,
                                   name = RoleName1, rid = Rid1,
                                   platform = Platform1, zone_id = ZoneId1,
                                   combat_statistics =
                                       #combat_statistics{total_dmg =
                                                              _TotalDmg2},
                                   type = 1}
                              <- All],
            info({update_score,
                  Args#{percent => Percent,
                        score => util:ceil(TotalDmg1 / 1000), pids => Pids,
                        mate_ids => MateIds}}),
            Leader = lists:keyfind(1,
                                   #fighter.is_leader,
                                   [Fighter
                                    || Fighter = #fighter{type = 1} <- All]),
            case Leader of
                #fighter{sex = RoleSex0, classes = RoleClasses0,
                         name = RoleName0, rid = Rid0, platform = Platform0,
                         zone_id = ZoneId0} ->
                    info({update_dmg,
                          Args#{role_id => {Rid0, Platform0, ZoneId0},
                                role_name => RoleName0, role_sex => RoleSex0,
                                role_classes => RoleClasses0,
                                total_dmg => TotalDmg1, role_ids => RoleIds}});
                _ -> ok
            end,
            [role:apply(async,
                        {Rid, Platform, ZoneId},
                        {guild_dungeon,
                         combat_over,
                         [Args#{win_or_lose => win, total_dmg => TotalDmg1,
                                percent => Percent, round => Round,
                                harm => Harm}]})
             || #fighter{rid = Rid, platform = Platform,
                         zone_id = ZoneId, type = 1,
                         combat_statistics =
                             #combat_statistics{total_dmg = _TotalDmg}}
                    <- Winner],
            [role:apply(async,
                        {Rid, Platform, ZoneId},
                        {guild_dungeon,
                         combat_over,
                         [Args#{win_or_lose => lose, total_dmg => TotalDmg1,
                                percent => Percent, round => Round,
                                harm => Harm}]})
             || #fighter{rid = Rid, platform = Platform,
                         zone_id = ZoneId, type = 1,
                         combat_statistics =
                             #combat_statistics{total_dmg = _TotalDmg}}
                    <- Loser]
    end.

combat_over(Role = #role{id = _RoleId, name = _RoleName,
                         sex = _RoleSex, classes = _RoleClasses, lev = Lev},
            #{type := Type, chapter_id := ChapterId,
              unique := Unique, strongpoint_id := StrongpointId,
              total_dmg := TotalDmg, old_percent := OldPercent,
              percent := Percent, round := Round}) ->
    {Var, RoleEvt} = case Type of
                         0 -> {148, Role};
                         _ ->
                             {147,
                              role_trigger:fire(#evt_guild_dungeon{}, Role)}
                     end,
    Role1 = var:acc_var(RoleEvt, day_five, Var),
    {Min, Max} = get_world_lv_range(ChapterId,
                                    StrongpointId,
                                    Unique),
    {Reward1, ExpId1, ExpRatio1} = case
                                       guild_dungeon_data:get_monster({ChapterId,
                                                                       StrongpointId,
                                                                       Unique,
                                                                       Min,
                                                                       Max})
                                       of
                                       #{fixed_reward := FixedReward,
                                         exp_id := ExpId,
                                         exp_ratio := ExpRatio} ->
                                           {FixedReward, ExpId, ExpRatio};
                                       _ -> {[], 0, []}
                                   end,
    Reward2 = cal_exp(ExpId1,
                      Lev,
                      ExpRatio1,
                      OldPercent - Percent),
    RewardTimes = var:get_var(Role1, day_five, 149, 0),
    logger:debug("结算统计数据 ~w",
                 [{Reward2,
                   Round,
                   TotalDmg,
                   util:ceil(TotalDmg / 1000),
                   Percent,
                   OldPercent - Percent}],
                 guild_dungeon,
                 233),
    role:link_send(Role,
                   19507,
                   {Round,
                    TotalDmg,
                    util:ceil(TotalDmg / 1000),
                    Percent,
                    OldPercent - Percent}),
    Event = case get(last_event) of
                undefined -> 0;
                LastEvent -> LastEvent
            end,
    erlang:erase(last_event),
    erlang:erase(team_id),
    logger:debug("=========================== ~w",
                 [{Event, get(last_event)}],
                 guild_dungeon,
                 241),
    case RewardTimes >= 2 of
        true -> {ok, Role1#role{s_event = Event}};
        _ ->
            Role2 = var:acc_var(Role1, day_five, 149),
            case role_gain:do_notice(format:val_to_gain(Reward1 ++
                                                            Reward2),
                                     Role2)
                of
                {ok, NewRole} -> {ok, NewRole#role{s_event = Event}};
                _ ->
                    mail:send(Role2,
                              lang:get("背包已满"),
                              lang:get("你在英雄副本挑战完成时,背包已满"),
                              Reward1),
                    {ok, Role2#role{s_event = Event}}
            end
    end.

-spec enter(#role{}, _ChapterId, _StrongpointId) -> {ok,
                                                     NewRole :: #role{}} |
                                                    {false, bitstring()}.

enter(#role{cross_type = 1}, _, _) ->
    {false, lang:get("跨服状态无法进入英雄副本")};
enter(Role = #role{name = Name,
                   pos =
                       #pos{map = MapId, x = X, y = Y, platform = OldPlatform,
                            zone_id = OldZoneId},
                   m_guild = #m_guild{id = GuildId}},
      ChapterId, StrongpointId) ->
    case check_enter_area(Role, ChapterId, StrongpointId) of
        false -> {false, lang:get("英雄副本BOSS未开启,无法进入")};
        {false, Why} -> {false, Why};
        {true, ToPos} ->
            Role1 = Role#role{s_event = 47},
            TeamEvt = make_team_event(Role1),
            case map:role_enter(ToPos, TeamEvt, Role1) of
                {error, Reason} ->
                    logger:error("[~ts]进入公会副本BOSS失败:~ts",
                                 [Name, Reason],
                                 guild_dungeon,
                                 271),
                    info({check_create_boss, GuildId}),
                    {false, lang:get("进入英雄副本失败")};
                {ok, NewRole = #role{pos = Pos}} ->
                    Last = #pos_history{map = MapId, x = X, y = Y,
                                        platform = OldPlatform,
                                        zone_id = OldZoneId},
                    {ok, NewRole#role{pos = Pos#pos{last = Last}}}
            end
    end;
enter(_Role, _, _) ->
    {false, lang:get("不在公会中, 无法进入公会副本BOSS")}.

watch_combat(Role = #role{m_guild =
                              #m_guild{id = GuildId},
                          id = RoleId},
             ChapterId, StrongpointId, MonsterId) ->
    case check([event], #{role => Role}) of
        {ok, _Args} ->
            GuildDungeon = fetch(GuildId),
            case get_monster(GuildDungeon,
                             ChapterId,
                             StrongpointId,
                             MonsterId)
                of
                {ok,
                 #guild_dungeon_monster{challenge = 3,
                                        combat_pid = CombatPid,
                                        combat_id = CombatId}}
                    when is_pid(CombatPid) andalso CombatId =/= RoleId ->
                    {ok, Ob} = role_convert:to(c_observer, Role),
                    WatchArgs = #{watch_id => CombatId},
                    CombatPid ! {observer_enter, Ob, WatchArgs},
                    combat_util:member_enter_ob(Role, CombatPid, CombatId),
                    ok;
                _R ->
                    logger:debug("============== ~w ~w",
                                 [MonsterId, _R],
                                 guild_dungeon,
                                 296),
                    {false, lang:get("战斗已经结束")}
            end;
        {false, Reason} -> {false, Reason}
    end;
watch_combat(_, _, _, _) -> {false, lang:get("未加入公会")}.

create(GuildDungeon = #guild_dungeon{guild_id = GuildId,
                                     chapter_now = ChapterNow,
                                     strongpoint_now = StrongpointNow}) ->
    {MonsterId1, BaseId1, X1, Y1, Unique1} = case
                                                 guild_dungeon_data:get_chapter({ChapterNow,
                                                                                 StrongpointNow})
                                                 of
                                                 #{type := 0,
                                                   monsters := Monsters} ->
                                                     {MonsterId,
                                                      BaseId,
                                                      X,
                                                      Y,
                                                      Unique} =
                                                         get_boss_data(ChapterNow,
                                                                       StrongpointNow,
                                                                       Monsters),
                                                     {MonsterId,
                                                      BaseId,
                                                      X,
                                                      Y,
                                                      Unique};
                                                 _ -> {0, 0, 0, 0, 0}
                                             end,
    logger:debug("场景创建 和 刷新怪物 当前 章节 ~w 据点 ~w 怪物Id ~w 场景 "
                 "Id ~w",
                 [ChapterNow, StrongpointNow, MonsterId1, BaseId1],
                 guild_dungeon,
                 314),
    case map_mgr:create(BaseId1) of
        {ok, MapPid, MapId} ->
            Msg =
                notice:format(lang:get("~ts从阴影中而来，受死吧凡人们！{face_1, 13}"),
                              [{string_2, 5, unit:name(MonsterId1)}]),
            guild:notice(GuildId, Msg),
            case unit_mgr:create(49, MonsterId1, {MapId, X1, Y1}) of
                {ok, #unit{id = UnitId}} ->
                    save(GuildDungeon#guild_dungeon{base_id = BaseId1,
                                                    map_id = MapId,
                                                    unit_id = UnitId,
                                                    map_pid = MapPid}),
                    case get_monster(GuildId,
                                     ChapterNow,
                                     StrongpointNow,
                                     Unique1)
                        of
                        {ok, Monster} ->
                            set_monster(fetch(GuildId),
                                        ChapterNow,
                                        StrongpointNow,
                                        Unique1,
                                        Monster#guild_dungeon_monster{challenge
                                                                          = 1});
                        _ -> ok
                    end,
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
create(GuildId) ->
    case fetch(GuildId) of
        false -> ok;
        GuildDungeon -> create(GuildDungeon)
    end.

do_check_create_boss() ->
    List = ets:tab2list(guild_dungeon),
    [do_check_create_boss(GD) || GD <- List].

do_check_create_boss(#guild_dungeon{chapters = Chapters,
                                    chapter_now = CtNow,
                                    strongpoint_now = SpNow,
                                    guild_id = _GuildId} =
                         GD) ->
    Fun1 = fun (#guild_dungeon_chapter{strongpoints =
                                           Strongpoints} =
                    Chapter,
                ChaptersAcc) ->
                   Fun2 = fun (#guild_dungeon_strongpoint{monsters =
                                                              Monsters} =
                                   Sp,
                               StrongpointsAcc) ->
                                  Fun3 = fun (#guild_dungeon_monster{challenge =
                                                                         3} =
                                                  Monster,
                                              MonstersAcc) ->
                                                 [Monster#guild_dungeon_monster{challenge
                                                                                    =
                                                                                    1}
                                                  | MonstersAcc];
                                             (Monster, MonstersAcc) ->
                                                 [Monster | MonstersAcc]
                                         end,
                                  Monsters1 = lists:foldl(Fun3, [], Monsters),
                                  [Sp#guild_dungeon_strongpoint{monsters =
                                                                    Monsters1}
                                   | StrongpointsAcc]
                          end,
                   Strongpoints1 = lists:foldl(Fun2, [], Strongpoints),
                   [Chapter#guild_dungeon_chapter{strongpoints =
                                                      Strongpoints1}
                    | ChaptersAcc]
           end,
    Chapters1 = lists:foldl(Fun1, [], Chapters),
    NewGD = GD#guild_dungeon{chapters = Chapters1,
                             map_id = 0, map_pid = undefined},
    save(NewGD),
    case lists:keyfind(CtNow,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters1)
        of
        #guild_dungeon_chapter{strongpoints = Strongpoints} ->
            case lists:keyfind(SpNow,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                #guild_dungeon_strongpoint{monsters = Monsters} ->
                    case lists:keyfind(0,
                                       #guild_dungeon_monster.type,
                                       Monsters)
                        of
                        #guild_dungeon_monster{challenge = 1} ->
                            logger:info("创建公会副本BOSS ~w",
                                        [_GuildId],
                                        guild_dungeon,
                                        372),
                            create(NewGD);
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

look_hp(Role = #role{id = RoleId,
                     m_guild = #m_guild{id = GuildId}, s_event = Event},
        {ChapterId, StrongpointId, Unique}) ->
    case fetch(GuildId) of
        #guild_dungeon{} = GuildDungeon ->
            case get_monster(GuildDungeon,
                             ChapterId,
                             StrongpointId,
                             Unique)
                of
                {ok, Monster} ->
                    {Score, Percent} = case get(team_id) of
                                           _ when Event =/= 46 -> {0, 0};
                                           undefined -> {0, 0};
                                           TeamId -> fetch_score(TeamId)
                                       end,
                    RoleScore = fetch_score(GuildId,
                                            ChapterId,
                                            StrongpointId,
                                            Unique,
                                            RoleId,
                                            1),
                    GuildScore = fetch_score(GuildId,
                                             ChapterId,
                                             StrongpointId,
                                             Unique,
                                             0,
                                             1),
                    Type1 = case guild_dungeon_data:get_chapter({ChapterId,
                                                                 StrongpointId})
                                of
                                #{type := Type} -> Type;
                                _ -> 1
                            end,
                    Rank = get_rank(GuildId,
                                    ChapterId,
                                    StrongpointId,
                                    Unique,
                                    Score,
                                    Type1),
                    logger:debug("============ ~w",
                                 [{Event,
                                   Score,
                                   Percent,
                                   get(team_id),
                                   RoleId,
                                   RoleScore,
                                   GuildScore}],
                                 guild_dungeon,
                                 403),
                    Data = {ChapterId,
                            StrongpointId,
                            Unique,
                            Score,
                            RoleScore,
                            GuildScore,
                            Rank,
                            Percent,
                            Monster},
                    role:link_send(Role, 19505, Data),
                    ok;
                _ -> {false, lang:get("该BOSS不存在")}
            end;
        _ -> {false, lang:get("该BOSS不存在")}
    end.

-spec leave(#role{}) -> {ok, NewRole :: #role{}} |
                        {false, Why :: bitstring()}.

leave(#role{m_team = #m_team{pid = Pid, status = 2}})
    when is_pid(Pid) ->
    {false, lang:get("您在队伍中，只有队长和暂离队员才能操作")};
leave(Role = #role{s_event = 47, pos = Pos}) ->
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
                    logger:error("退出公会BOSS时出错:~w",
                                 [Reason],
                                 guild_dungeon,
                                 426),
                    {false, lang:get("退出失败")};
                {ok, Nr} -> {ok, Nr}
            end
    end;
leave(Role) -> {ok, Role}.

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

cast(Args) -> gen_server:cast(guild_dungeon, Args).

call(Args) ->
    case catch gen_server:call(guild_dungeon, Args, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> guild_dungeon ! Args.

start_link() ->
    gen_server:start_link({local, guild_dungeon},
                          guild_dungeon,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], guild_dungeon, 458),
    process_flag(trap_exit, true),
    dets:open_file(guild_dungeon,
                   [{file, "./dets/guild_dungeon.dets"},
                    {keypos, #guild_dungeon.guild_id},
                    {type, set}]),
    ets:new(guild_dungeon,
            [set,
             named_table,
             public,
             {keypos, #guild_dungeon.guild_id}]),
    dets:open_file(guild_dungeon_rank,
                   [{file, "./dets/guild_dungeon_rank.dets"},
                    {keypos, #guild_dungeon_rank.id},
                    {type, set}]),
    ets:new(guild_dungeon_rank,
            [set,
             named_table,
             public,
             {keypos, #guild_dungeon_rank.id}]),
    ets:new(guild_dungeon_percent,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_dungeon_percent,
                   [{file, "./dets/guild_dungeon_percent.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(guild_dungeon_score,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_dungeon_score,
                   [{file, "./dets/guild_dungeon_score.dets"},
                    {keypos, 1},
                    {type, set}]),
    dets:to_ets(guild_dungeon_rank, guild_dungeon_rank),
    dets:to_ets(guild_dungeon, guild_dungeon),
    dets:to_ets(guild_dungeon_percent,
                guild_dungeon_percent),
    dets:to_ets(guild_dungeon_score, guild_dungeon_score),
    do_check_create_boss(),
    Week = date:day_of_the_week(erlang:date()),
    {Year, Month, Day} = date:date(),
    Now = date:unixtime(),
    Time1 = date:datetime_to_seconds({Year,
                                      Month,
                                      Day,
                                      5,
                                      0,
                                      0}),
    Time2 = date:datetime_to_seconds({Year,
                                      Month,
                                      Day,
                                      11,
                                      0,
                                      0}),
    Time3 = date:datetime_to_seconds({Year,
                                      Month,
                                      Day,
                                      23,
                                      0,
                                      0}),
    {TimerRef, Status} = case lists:member(Week,
                                           [1, 2, 3, 4, 5, 6])
                             of
                             true ->
                                 if Now < Time1 ->
                                        env:set(guild_dungeon_status, 0),
                                        Ref =
                                            erlang:send_after(date:next_diff(5,
                                                                             0,
                                                                             0)
                                                                  * 1000,
                                                              self(),
                                                              active_recover),
                                        {Ref, active_end};
                                    Now < Time2 ->
                                        env:set(guild_dungeon_status, 0),
                                        Ref =
                                            erlang:send_after(date:next_diff(11,
                                                                             0,
                                                                             0)
                                                                  * 1000,
                                                              self(),
                                                              active_start),
                                        {Ref, active_recover};
                                    Now < Time3 ->
                                        case world_lev:get_world_lev() of
                                            {WorldLev, _} when WorldLev >= 65 ->
                                                env:set(guild_dungeon_status,
                                                        1);
                                            _ ->
                                                env:set(guild_dungeon_status, 0)
                                        end,
                                        Ref =
                                            erlang:send_after(date:next_diff(23,
                                                                             0,
                                                                             0)
                                                                  * 1000,
                                                              self(),
                                                              active_end),
                                        {Ref, active_start};
                                    true ->
                                        case Week of
                                            6 ->
                                                env:set(guild_dungeon_status,
                                                        2);
                                            _ ->
                                                env:set(guild_dungeon_status, 0)
                                        end,
                                        Ref =
                                            erlang:send_after(date:next_diff(5,
                                                                             0,
                                                                             0)
                                                                  * 1000,
                                                              self(),
                                                              active_recover),
                                        {Ref, active_end}
                                 end;
                             _ ->
                                 env:set(guild_dungeon_status, 2),
                                 Ref = erlang:send_after(date:next_diff(5, 0, 0)
                                                             * 1000,
                                                         self(),
                                                         active_recover),
                                 {Ref, active_end}
                         end,
    put(guild_dungeon_fresh_ref, TimerRef),
    logger:info("启动完成", [], guild_dungeon, 513),
    {ok, #state{status = Status}}.

handle_call({combat_start,
             #{type := Type, role_id := RoleId,
               chapter_id := ChapterId,
               strongpoint_id := StrongpointId, unique := Unique,
               guild_id := GuildId, role_name := RoleName,
               role_classes := RoleClasses, role_sex := RoleSex}},
            _From, State) ->
    GuildDungeon = fetch(GuildId),
    Reply = case get_monster(GuildDungeon,
                             ChapterId,
                             StrongpointId,
                             Unique)
                of
                {ok,
                 Monster = #guild_dungeon_monster{percent_list =
                                                      PercentList,
                                                  percent = Percent,
                                                  challenge = 1}} ->
                    NewMonster = Monster#guild_dungeon_monster{challenge =
                                                                   3,
                                                               role_name =
                                                                   RoleName,
                                                               role_classes =
                                                                   RoleClasses,
                                                               role_sex =
                                                                   RoleSex},
                    set_monster(GuildDungeon,
                                ChapterId,
                                StrongpointId,
                                Unique,
                                NewMonster),
                    TeamId1 = case Type of
                                  0 ->
                                      TeamId = case
                                                   env:get(guild_dungeon_team_id)
                                                   of
                                                   Id when is_integer(Id) -> Id;
                                                   _ -> 1
                                               end,
                                      env:save(guild_dungeon_team_id,
                                               TeamId + 1),
                                      TeamId;
                                  _ -> RoleId
                              end,
                    {ok, PercentList, Percent, TeamId1};
                {ok, #guild_dungeon_monster{challenge = 2}} ->
                    {false, lang:get("该怪物现在不能挑战")};
                {ok, #guild_dungeon_monster{challenge = 3}} ->
                    {false, lang:get("目标已在战斗中，无法发起战斗")};
                {ok, #guild_dungeon_monster{challenge = 4}} ->
                    {false, lang:get("该怪物已死亡,不能再次挑战")};
                Msg -> Msg
            end,
    {reply, Reply, State};
handle_call({init_guild_dungeon, GuildId}, _From,
            State) ->
    GuildDungeon1 = case ets:lookup(guild_dungeon, GuildId)
                        of
                        [GuildDungeon] -> GuildDungeon;
                        _ ->
                            [FirstChapterId | _] = ChapterIds =
                                                       guild_dungeon_data:list(),
                            Fun = fun (ChapterId, Acc) ->
                                          StrongpointIds =
                                              guild_dungeon_data:list_strongpoint(ChapterId),
                                          logger:debug("所有据点Id ~w",
                                                       [StrongpointIds],
                                                       guild_dungeon,
                                                       552),
                                          Fun1 = fun (StrongpointId,
                                                      {Acc2, Flag}) ->
                                                         case
                                                             guild_dungeon_data:get_chapter({ChapterId,
                                                                                             StrongpointId})
                                                             of
                                                             #{type := Type,
                                                               monsters :=
                                                                   Monsters} ->
                                                                 {Status,
                                                                  NewFlag} =
                                                                     case Type
                                                                         of
                                                                         _
                                                                             when
                                                                               ChapterId
                                                                                   =:=
                                                                                   FirstChapterId
                                                                                   andalso
                                                                                   Flag
                                                                                       =:=
                                                                                       false ->
                                                                             {1,
                                                                              true};
                                                                         _ ->
                                                                             {2,
                                                                              Flag}
                                                                     end,
                                                                 logger:debug("初始化 状态 ~w",
                                                                              [{ChapterId,
                                                                                FirstChapterId,
                                                                                Flag,
                                                                                Status,
                                                                                NewFlag}],
                                                                              guild_dungeon,
                                                                              562),
                                                                 Monsters1 =
                                                                     lists:foldl(fun
                                                                                     (Unique,
                                                                                      MonsterAcc) ->
                                                                                         {Min,
                                                                                          Max} =
                                                                                             get_world_lv_range(ChapterId,
                                                                                                                StrongpointId,
                                                                                                                Unique),
                                                                                         case
                                                                                             guild_dungeon_data:get_monster({ChapterId,
                                                                                                                             StrongpointId,
                                                                                                                             Unique,
                                                                                                                             Min,
                                                                                                                             Max})
                                                                                             of
                                                                                             #{id
                                                                                                   :=
                                                                                                   MonsterId} ->
                                                                                                 [#guild_dungeon_monster{unique
                                                                                                                             =
                                                                                                                             Unique,
                                                                                                                         type
                                                                                                                             =
                                                                                                                             Type,
                                                                                                                         percent
                                                                                                                             =
                                                                                                                             1000,
                                                                                                                         challenge
                                                                                                                             =
                                                                                                                             Status,
                                                                                                                         monster_id
                                                                                                                             =
                                                                                                                             MonsterId}
                                                                                                  | MonsterAcc];
                                                                                             _ ->
                                                                                                 MonsterAcc
                                                                                         end
                                                                                 end,
                                                                                 [],
                                                                                 Monsters),
                                                                 Strongpoint =
                                                                     #guild_dungeon_strongpoint{strongpoint_id
                                                                                                    =
                                                                                                    StrongpointId,
                                                                                                monsters
                                                                                                    =
                                                                                                    Monsters1},
                                                                 {[Strongpoint
                                                                   | Acc2],
                                                                  NewFlag};
                                                             _R -> {Acc2, Flag}
                                                         end
                                                 end,
                                          {Strongpoints, _} = lists:foldl(Fun1,
                                                                          {[],
                                                                           false},
                                                                          StrongpointIds),
                                          Chapters =
                                              #guild_dungeon_chapter{chapter_id
                                                                         =
                                                                         ChapterId,
                                                                     strongpoints
                                                                         =
                                                                         Strongpoints},
                                          [Chapters | Acc]
                                  end,
                            Chapters1 = lists:foldl(Fun, [], ChapterIds),
                            StrongpointNow =
                                get_next_strongpoint(FirstChapterId, 0),
                            GuildDungeon = #guild_dungeon{chapter_now =
                                                              FirstChapterId,
                                                          chapters = Chapters1,
                                                          guild_id = GuildId,
                                                          strongpoint_now =
                                                              StrongpointNow},
                            save(GuildDungeon),
                            GuildDungeon
                    end,
    {reply, {ok, GuildDungeon1}, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({combat_end,
             #{round := Round, chapter_id := ChapterId,
               strongpoint_id := StrongpointId,
               monster_id := MonsterId, unique := Unique,
               guild_id := GuildId, percent_list := PercentList,
               percent := Percent, old_percent := OldPercent,
               harm := Harm, pids := Pids, record := Record,
               role_id := RoleId}},
            State) ->
    GuildDungeon = #guild_dungeon{map_id = MapId} =
                       fetch(GuildId),
    case get_monster(GuildDungeon,
                     ChapterId,
                     StrongpointId,
                     Unique)
        of
        {ok,
         Monster = #guild_dungeon_monster{role_name =
                                              RoleName}} ->
            NewStatus = case Percent of
                            0 -> 4;
                            _ -> 1
                        end,
            case guild_dungeon_data:get_chapter({ChapterId,
                                                 StrongpointId})
                of
                #{type := Type}
                    when Type =:= 0 andalso NewStatus =:= 4 ->
                    unit_mgr:remove(MapId, MonsterId),
                    Msg =
                        notice:format(lang:get("~ts已被众位勇士抡翻在地，公会拍卖行获得了大量物资！{face_1, "
                                               "38}"),
                                      [{unit_1, MonsterId}]),
                    guild:notice(GuildId, Msg);
                _ when NewStatus =:= 4 ->
                    Msg =
                        notice:format(lang:get("神兵天降！~ts在英雄副本中大杀四方，斩获的<color='#ffff00'>宝物</co"
                                               "lor>已在公会拍卖中展示{face_1,36}"),
                                      [{string_2, 5, RoleName}]),
                    guild:notice(GuildId, Msg);
                _ -> ok
            end,
            NewMonster = Monster#guild_dungeon_monster{challenge =
                                                           NewStatus,
                                                       percent_list =
                                                           PercentList,
                                                       percent = Percent,
                                                       combat_pid = undefined,
                                                       combat_id = 0},
            IsMarvel = case Round >= 5 of
                           true -> true;
                           _ -> false
                       end,
            combat_record:save(#{ids => [RoleId], record => Record,
                                 is_marvel => IsMarvel}),
            {ok, NewGuildDungeon} = set_monster(GuildDungeon,
                                                ChapterId,
                                                StrongpointId,
                                                Unique,
                                                NewMonster),
            check_next(NewGuildDungeon),
            percent_reward(GuildId,
                           ChapterId,
                           StrongpointId,
                           Monster,
                           Percent,
                           OldPercent,
                           Harm,
                           Pids),
            case NewStatus of
                4 ->
                    erlang:send_after(1 * 1000,
                                      self(),
                                      {send_rank_mail,
                                       GuildId,
                                       ChapterId,
                                       StrongpointId});
                _ -> ok
            end,
            ok;
        _Msg -> skip
    end,
    {noreply, State};
handle_info({update_combat_pid,
             #{chapter_id := ChapterId,
               strongpoint_id := StrongpointId,
               monster_id := _MonsterId, unique := Unique,
               guild_id := GuildId, combat_pid := CombatPid,
               role_id := RoleId}},
            State) ->
    GuildDungeon = fetch(GuildId),
    case get_monster(GuildDungeon,
                     ChapterId,
                     StrongpointId,
                     Unique)
        of
        {ok, Monster} ->
            NewMonster = Monster#guild_dungeon_monster{combat_pid =
                                                           CombatPid,
                                                       combat_id = RoleId},
            {ok, NewGuildDungeon} = set_monster(GuildDungeon,
                                                ChapterId,
                                                StrongpointId,
                                                Unique,
                                                NewMonster),
            check_next(NewGuildDungeon),
            ok;
        _Msg -> skip
    end,
    {noreply, State};
handle_info({update_dmg,
             _Args = #{chapter_id := ChapterId,
                       strongpoint_id := StrongpointId, guild_id := GuildId,
                       total_dmg := TotalDmg, role_id := RoleId,
                       role_name := RoleName, role_sex := RoleSex,
                       role_classes := RoleClasses, type := Type,
                       role_ids := RoleIds}},
            State) ->
    update_rank(GuildId,
                ChapterId,
                StrongpointId,
                RoleId,
                RoleName,
                RoleClasses,
                RoleSex,
                TotalDmg,
                RoleIds,
                Type),
    update_rank(GuildId,
                0,
                0,
                RoleId,
                RoleName,
                RoleClasses,
                RoleSex,
                TotalDmg,
                RoleIds,
                Type),
    {noreply, State};
handle_info({update_score,
             #{pids := Pids, chapter_id := ChapterId,
               strongpoint_id := StrongpointId, guild_id := GuildId,
               score := Score, unique := Unique, team_id := TeamId,
               type := Type, old_percent := OldPercent,
               percent := Percent, mate_ids := MateIds}},
            State) ->
    RoleScore = fetch_score(GuildId,
                            ChapterId,
                            StrongpointId,
                            Unique,
                            TeamId,
                            Type),
    GuildScore = fetch_score(GuildId,
                             ChapterId,
                             StrongpointId,
                             Unique,
                             0,
                             Type),
    GuildDungeon = #guild_dungeon{map_id = _MapId} =
                       fetch(GuildId),
    case Score > RoleScore of
        true ->
            save_score(GuildId,
                       ChapterId,
                       StrongpointId,
                       Unique,
                       TeamId,
                       Type,
                       Score);
        _ -> ok
    end,
    case Score > GuildScore of
        true ->
            save_score(GuildId,
                       ChapterId,
                       StrongpointId,
                       Unique,
                       0,
                       Type,
                       Score);
        _ -> ok
    end,
    {ok, Monster = #guild_dungeon_monster{}} =
        get_monster(GuildDungeon,
                    ChapterId,
                    StrongpointId,
                    Unique),
    NewMonster = Monster#guild_dungeon_monster{percent =
                                                   Percent},
    set_monster(GuildDungeon,
                ChapterId,
                StrongpointId,
                Unique,
                NewMonster),
    save_score(TeamId, Score, max(0, OldPercent - Percent)),
    Rank = get_rank(GuildId,
                    ChapterId,
                    StrongpointId,
                    Unique,
                    Score,
                    Type),
    case Type of
        0 ->
            lists:foreach(fun (MateId) ->
                                  MateScore = fetch_score(GuildId,
                                                          ChapterId,
                                                          StrongpointId,
                                                          Unique,
                                                          MateId,
                                                          Type),
                                  case Score > MateScore of
                                      true ->
                                          save_score(GuildId,
                                                     ChapterId,
                                                     StrongpointId,
                                                     Unique,
                                                     MateId,
                                                     Type,
                                                     Score);
                                      _ -> ok
                                  end,
                                  Data = {ChapterId,
                                          StrongpointId,
                                          Unique,
                                          Score,
                                          max(MateScore, Score),
                                          max(GuildScore, Score),
                                          Rank,
                                          max(0, OldPercent - Percent),
                                          NewMonster},
                                  logger:debug("更新评分 ~w",
                                               [{RoleScore, MateScore, Score}],
                                               guild_dungeon,
                                               680),
                                  role:pack_send(MateId, 19505, Data)
                          end,
                          MateIds);
        _ ->
            Data = {ChapterId,
                    StrongpointId,
                    Unique,
                    Score,
                    max(RoleScore, Score),
                    max(GuildScore, Score),
                    Rank,
                    max(0, OldPercent - Percent),
                    NewMonster},
            [role:pack_send(Pid, 19505, Data) || {pid, Pid} <- Pids]
    end,
    {noreply, State};
handle_info({send_rank_mail,
             GuildId,
             ChapterId,
             StrongpointId},
            State) ->
    send_rank_mail(GuildId, ChapterId, StrongpointId),
    {noreply, State};
handle_info({check_create_boss, GuildId}, State) ->
    GD = #guild_dungeon{chapters = Chapters,
                        chapter_now = CtNow, strongpoint_now = SpNow,
                        map_id = MapId} =
             fetch(GuildId),
    case lists:keyfind(CtNow,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters)
        of
        #guild_dungeon_chapter{strongpoints = Strongpoints} ->
            case lists:keyfind(SpNow,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                #guild_dungeon_strongpoint{monsters = Monsters} ->
                    case lists:keyfind(0,
                                       #guild_dungeon_monster.type,
                                       Monsters)
                        of
                        #guild_dungeon_monster{challenge = 1}
                            when MapId =:= 0 ->
                            logger:info("创建公会副本BOSS ~w",
                                        [GuildId],
                                        guild_dungeon,
                                        700),
                            create(GD);
                        _ -> ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end,
    {noreply, State};
handle_info(fix_dmg, State) ->
    List = ets:tab2list(guild_dungeon_rank),
    Fun = fun (#guild_dungeon_rank{chapter_id = 0,
                                   strongpoint_id = 0},
               GDRAcc) ->
                  GDRAcc;
              (#guild_dungeon_rank{ranks = Ranks, guild_id = GuildId},
               GDRAcc) ->
                  Fun1 = fun (#guild_dungeon_rank_role{harm = Harm,
                                                       role_name = Name,
                                                       role_id = RoleId,
                                                       sex = Sex,
                                                       classes = Classes,
                                                       role_ids = RoleIds},
                              GDRRAcc) ->
                                 Datas = case RoleIds of
                                             [] ->
                                                 [{GuildId,
                                                   RoleId,
                                                   Name,
                                                   Classes,
                                                   Sex,
                                                   Harm}];
                                             _ ->
                                                 [{GuildId,
                                                   RoleId1,
                                                   RoleName1,
                                                   RoleClasses1,
                                                   RoleSex1,
                                                   Harm}
                                                  || {RoleId1,
                                                      RoleName1,
                                                      RoleClasses1,
                                                      RoleSex1,
                                                      _Harm1}
                                                         <- RoleIds]
                                         end,
                                 Datas ++ GDRRAcc
                         end,
                  RanksData = lists:foldl(Fun1, [], Ranks),
                  RanksData ++ GDRAcc
          end,
    List1 = lists:foldl(Fun, [], List),
    Fun2 = fun ({GuildId2,
                 RoleId2,
                 RoleName2,
                 RoleClasses2,
                 RoleSex2,
                 Harm2},
                NewAcc) ->
                   RoleDatas1 = case lists:keyfind(GuildId2, 1, NewAcc) of
                                    {GuildId2, RoleDatas} -> RoleDatas;
                                    _ -> []
                                end,
                   OldGdrRole = #guild_dungeon_rank_role{harm = OldHarm,
                                                         times = Times} =
                                    case lists:keyfind(RoleId2,
                                                       #guild_dungeon_rank_role.role_id,
                                                       RoleDatas1)
                                        of
                                        #guild_dungeon_rank_role{} = GdrRole ->
                                            GdrRole;
                                        _ ->
                                            #guild_dungeon_rank_role{role_id =
                                                                         RoleId2,
                                                                     role_name =
                                                                         RoleName2,
                                                                     classes =
                                                                         RoleClasses2,
                                                                     sex =
                                                                         RoleSex2}
                                    end,
                   RoleDatas2 = lists:keystore(RoleId2,
                                               #guild_dungeon_rank_role.role_id,
                                               RoleDatas1,
                                               OldGdrRole#guild_dungeon_rank_role{times
                                                                                      =
                                                                                      Times
                                                                                          +
                                                                                          1,
                                                                                  harm
                                                                                      =
                                                                                      OldHarm
                                                                                          +
                                                                                          Harm2}),
                   lists:keystore(GuildId2,
                                  1,
                                  NewAcc,
                                  {GuildId2, RoleDatas2})
           end,
    List2 = lists:foldl(Fun2, [], List1),
    [save(#guild_dungeon_rank{id = {GuildId3, 0, 0},
                              guild_id = GuildId3, ranks = RoldIds3,
                              chapter_id = 0, strongpoint_id = 0})
     || {GuildId3, RoldIds3} <- List2],
    {noreply, State};
handle_info(active_start, State) ->
    logger:debug("上一个状态 ~w  active_start ",
                 [State],
                 guild_dungeon,
                 747),
    case get(guild_dungeon_fresh_ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    Week = date:day_of_the_week(erlang:date()),
    {WorldLev, _} = world_lev:get_world_lev(),
    NewTref = case lists:member(Week, [1, 2, 3, 4, 5, 6]) of
                  true when WorldLev >= 65 ->
                      env:set(guild_dungeon_status, 1),
                      Msg = lang:get("英雄副本妖魔来袭，众位勇士请拿起武器，准备战斗，为了我们的家园！"),
                      List1 = case guild_mgr:list_to_client() of
                                  {ok, List} -> List;
                                  _ -> []
                              end,
                      [guild:notice(GuildId, Msg)
                       || #guild{id = GuildId} <- List1],
                      erlang:send_after(date:next_diff(23, 0, 0) * 1000,
                                        self(),
                                        active_end);
                  _ ->
                      env:set(guild_dungeon_status, 0),
                      erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                                        self(),
                                        active_recover)
              end,
    put(guild_dungeon_fresh_ref, NewTref),
    {noreply, State#state{status = active_start}};
handle_info(active_end, State) ->
    logger:debug("上一个状态 ~w  active_end ",
                 [State],
                 guild_dungeon,
                 773),
    case get(guild_dungeon_fresh_ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    LastStatus = env:get(guild_dungeon_status),
    Week = date:day_of_the_week(erlang:date()),
    NewTref = case lists:member(Week, [1, 2, 3, 4, 5, 6]) of
                  true when LastStatus =:= 1 ->
                      Msg = case Week of
                                6 ->
                                    env:set(guild_dungeon_status, 2),
                                    lang:get("英雄副本已经结束，请各位勇士下周再来挑战！");
                                _ ->
                                    env:set(guild_dungeon_status, 0),
                                    lang:get("英雄副本的妖魔被众位勇士胖揍得鼻青脸肿，需要时间休息下，请大家下次再战！{face_1, "
                                             "21}")
                            end,
                      List1 = case guild_mgr:list_to_client() of
                                  {ok, List} -> List;
                                  _ -> []
                              end,
                      [guild:notice(GuildId, Msg)
                       || #guild{id = GuildId} <- List1],
                      erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                                        self(),
                                        active_recover);
                  _ ->
                      env:set(guild_dungeon_status, 2),
                      erlang:send_after(date:next_diff(0, 0, 13) * 1000,
                                        self(),
                                        active_recover)
              end,
    put(guild_dungeon_fresh_ref, NewTref),
    {noreply, State#state{status = active_end}};
handle_info(active_recover, State) ->
    logger:debug("上一个状态 ~w  active_recover ",
                 [State],
                 guild_dungeon,
                 808),
    case get(guild_dungeon_fresh_ref) of
        Tref when is_reference(Tref) ->
            erlang:cancel_timer(Tref);
        _ -> skip
    end,
    env:set(guild_dungeon_status, 0),
    case lists:member(date:day_of_the_week(erlang:date()),
                      [2, 3, 4, 5, 6])
        of
        true ->
            List = ets:tab2list(guild_dungeon),
            Fun = fun (#guild_dungeon{chapters = Chapters} = GD) ->
                          Fun1 = fun (#guild_dungeon_chapter{chapter_id =
                                                                 ChapterId,
                                                             strongpoints =
                                                                 Strongpoints} =
                                          Chapter,
                                      ChaptersAcc) ->
                                         Fun2 = fun
                                                    (#guild_dungeon_strongpoint{strongpoint_id
                                                                                    =
                                                                                    StrongpointId,
                                                                                monsters
                                                                                    =
                                                                                    Monsters} =
                                                         Sp,
                                                     StrongpointsAcc) ->
                                                        Fun3 = fun
                                                                   (#guild_dungeon_monster{challenge
                                                                                               =
                                                                                               1,
                                                                                           percent_list
                                                                                               =
                                                                                               PercentList,
                                                                                           percent
                                                                                               =
                                                                                               _Percent,
                                                                                           unique
                                                                                               =
                                                                                               Unique} =
                                                                        Monster,
                                                                    MonstersAcc) ->
                                                                       {Min,
                                                                        Max} =
                                                                           get_world_lv_range(ChapterId,
                                                                                              StrongpointId,
                                                                                              Unique),
                                                                       {RecoverType1,
                                                                        RecoverVal1} =
                                                                           case
                                                                               guild_dungeon_data:get_monster({ChapterId,
                                                                                                               StrongpointId,
                                                                                                               Unique,
                                                                                                               Min,
                                                                                                               Max})
                                                                               of
                                                                               #{recover_type
                                                                                     :=
                                                                                     RecoverType,
                                                                                 recover_value
                                                                                     :=
                                                                                     RecoverVal} ->
                                                                                   {RecoverType,
                                                                                    RecoverVal};
                                                                               _ ->
                                                                                   {0,
                                                                                    100}
                                                                           end,
                                                                       NewPercentList =
                                                                           [begin
                                                                                case
                                                                                    RecoverType1
                                                                                    of
                                                                                    1 ->
                                                                                        {Pos,
                                                                                         HpMax,
                                                                                         min(P
                                                                                                 +
                                                                                                 RecoverVal1
                                                                                                     *
                                                                                                     10,
                                                                                             1000)};
                                                                                    _ ->
                                                                                        {Pos,
                                                                                         HpMax,
                                                                                         min(max(RecoverVal1
                                                                                                     *
                                                                                                     10,
                                                                                                 P),
                                                                                             1000)}
                                                                                end
                                                                            end
                                                                            || {Pos,
                                                                                HpMax,
                                                                                P}
                                                                                   <- PercentList],
                                                                       logger:debug("旧数据 ~w 新数据 ~w ",
                                                                                    [PercentList,
                                                                                     NewPercentList],
                                                                                    guild_dungeon,
                                                                                    835),
                                                                       NewPercent =
                                                                           cal_new_percent(NewPercentList),
                                                                       logger:debug("旧数据 ~w 新数据 ~w ~w ~w",
                                                                                    [_Percent,
                                                                                     NewPercent,
                                                                                     RecoverType1,
                                                                                     RecoverVal1],
                                                                                    guild_dungeon,
                                                                                    837),
                                                                       [Monster#guild_dungeon_monster{percent_list
                                                                                                          =
                                                                                                          NewPercentList,
                                                                                                      percent
                                                                                                          =
                                                                                                          min(NewPercent,
                                                                                                              1000)}
                                                                        | MonstersAcc];
                                                                   (Monster,
                                                                    MonstersAcc) ->
                                                                       [Monster
                                                                        | MonstersAcc]
                                                               end,
                                                        Monsters1 =
                                                            lists:foldl(Fun3,
                                                                        [],
                                                                        Monsters),
                                                        [Sp#guild_dungeon_strongpoint{monsters
                                                                                          =
                                                                                          Monsters1}
                                                         | StrongpointsAcc]
                                                end,
                                         Strongpoints1 = lists:foldl(Fun2,
                                                                     [],
                                                                     Strongpoints),
                                         [Chapter#guild_dungeon_chapter{strongpoints
                                                                            =
                                                                            Strongpoints1}
                                          | ChaptersAcc]
                                 end,
                          Chapters1 = lists:foldl(Fun1, [], Chapters),
                          save(GD#guild_dungeon{chapters = Chapters1})
                  end,
            lists:foreach(Fun, List);
        _ ->
            case date:day_of_the_week(erlang:date()) of
                1 ->
                    ets:delete_all_objects(guild_dungeon),
                    dets:delete_all_objects(guild_dungeon),
                    ets:delete_all_objects(guild_dungeon_rank),
                    dets:delete_all_objects(guild_dungeon_rank),
                    ets:delete_all_objects(guild_dungeon_percent),
                    dets:delete_all_objects(guild_dungeon_percent),
                    ets:delete_all_objects(guild_dungeon_score),
                    dets:delete_all_objects(guild_dungeon_score),
                    env:set(guild_dungeon_status, 0),
                    env:set(guild_dungeon_team_id, 1);
                _ -> env:set(guild_dungeon_status, 2)
            end
    end,
    NextTimeout = date:next_diff(11, 0, 0),
    logger:info("下次检查重置时间 ~w",
                [NextTimeout],
                guild_dungeon,
                873),
    Ref = erlang:send_after(NextTimeout * 1000,
                            self(),
                            active_start),
    put(guild_dungeon_fresh_ref, Ref),
    {noreply, State#state{status = active_recover}};
handle_info(_Info, State) ->
    logger:info("~w 未处理信息 ~w",
                [guild_dungeon, _Info],
                guild_dungeon,
                879),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [guild_dungeon],
                guild_dungeon,
                883),
    util:close_dets(guild_dungeon),
    util:close_dets(guild_dungeon_rank),
    util:close_dets(guild_dungeon_percent),
    util:close_dets(guild_dungeon_score),
    logger:info("[~w] 关闭完成",
                [guild_dungeon],
                guild_dungeon,
                888),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

cal_new_percent([]) -> 1000;
cal_new_percent(PercentList) ->
    {TotalHp, TotalHpMax} = do_cal_new_percent(PercentList,
                                               0,
                                               0),
    case TotalHpMax > 0 of
        true -> util:ceil(TotalHp / TotalHpMax * 1000);
        _ -> 0
    end.

do_cal_new_percent([], TotalHp, TotalHpMax) ->
    {TotalHp, TotalHpMax};
do_cal_new_percent([{_Pos, HpMax, Percent}
                    | PercentList],
                   TotalHp, TotalHpMax) ->
    do_cal_new_percent(PercentList,
                       TotalHp + HpMax * Percent / 1000,
                       TotalHpMax + HpMax).

check_enter_area(#role{m_team =
                           #m_team{pid = Pid, status = 2}},
                 _ChapterId, _StrongpointId)
    when is_pid(Pid) ->
    {false, lang:get("你在跟随队长中")};
check_enter_area(#role{s_event = 47}, _ChapterId,
                 _StrongpointId) ->
    {false, lang:get("你已经在英雄副本中")};
check_enter_area(Role = #role{id = RoleId,
                              m_guild = #m_guild{id = GuildId}},
                 ChapterId, StrongpointId) ->
    case role_misc:check_event_map(Role) of
        true ->
            case team:get_fighters(Role) of
                {ok, Mates} ->
                    case check_mate(Mates, [lev, {guild, RoleId}]) of
                        ok ->
                            check_enter_area(RoleId,
                                             GuildId,
                                             ChapterId,
                                             StrongpointId);
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("怪物非常强大，请组满3人以上再来挑战")}
            end;
        Else -> Else
    end.

check_enter_area(_RoleId, GuildId, ChapterId,
                 StrongpointId) ->
    case fetch(GuildId) of
        Gd = #guild_dungeon{map_id = MapId, base_id = BaseId,
                            chapter_now = ChapterNow,
                            strongpoint_now = StrongpointNow}
            when ChapterId =:= ChapterNow andalso
                     StrongpointId =:= StrongpointNow ->
            case get_monsters(Gd, ChapterNow, StrongpointNow) of
                {ok,
                 [#guild_dungeon_monster{challenge = Challenge,
                                         type = 0}]}
                    when Challenge =:= 1 orelse Challenge =:= 3 ->
                    case map_data:get(BaseId) of
                        {ok, #map_data{revive = [{X, Y} | _]}} ->
                            {true, {MapId, X, Y}};
                        _ -> {true, {MapId, 10, 10}}
                    end;
                _ -> {false, lang:get("英雄副本未开启,无法进入")}
            end;
        _ -> false
    end.

check([], Args) -> {ok, Args};
check([lev | T], Args = #{role := #role{lev = Lev}}) ->
    case Lev >= 65 of
        true -> check(T, Args);
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts级,无法发起挑战"),
                           [{string_1, 65}])}
    end;
check([times | T],
      Args = #{role := Role = #role{name = RoleName},
               chapter_id := ChapterId,
               strongpoint_id := StrongpointId}) ->
    {AllTimes, JoinTimes} = case
                                guild_dungeon_data:get_chapter({ChapterId,
                                                                StrongpointId})
                                of
                                #{type := 0} ->
                                    {1, var:get_var(Role, day_five, 148, 0)};
                                _ -> {2, var:get_var(Role, day_five, 147, 0)}
                            end,
    case JoinTimes < AllTimes of
        true -> check(T, Args);
        _ ->
            {false,
             notice:format(lang:get("~ts次数不足，无法挑战"),
                           [{string_2, 5, RoleName}])}
    end;
check([team | T],
      Args = #{role := Role, type := 0,
               leader_id := LeaderId}) ->
    case team:get_fighters(Role) of
        {ok, Mate} when length(Mate) >= 3 ->
            case check_mate(Mate, [lev, {guild, LeaderId}, times])
                of
                ok -> check(T, Args#{team_mate => Mate});
                {false, Reason} -> {false, Reason}
            end;
        {ok, _} -> {false, lang:get("怪物非常强大，请组满3人以上再来挑战")};
        Else -> Else
    end;
check([team | T],
      Args = #{role :=
                   Role = #role{m_team =
                                    #m_team{pid = Pid, status = Status}}})
    when is_pid(Pid) ->
    case team:get_fighters(Role) of
        {ok, Mate}
            when length(Mate) =:= 1 orelse Status =:= 3 ->
            check(T, Args);
        _ -> {false, lang:get("单人或暂离状态才可以挑战此怪物")}
    end;
check([team | T], Args) -> check(T, Args);
check([event | T], Args = #{role := Role}) ->
    case role_misc:check_event(Role) of
        true -> check(T, Args);
        {false, Reason} -> {false, Reason}
    end;
check([active | T], Args) ->
    case env:get(guild_dungeon_status) of
        Status when Status =:= 1 -> check(T, Args);
        _ -> {false, lang:get("当前不是活动时间")}
    end.

check_mate([], _) -> ok;
check_mate([#role{} = Role | T], Cond) ->
    case do_check_mate(Role, Cond) of
        ok -> check_mate(T, Cond);
        {false, Reason} -> {false, Reason}
    end;
check_mate([{leader, Role, _} | T], Cond) ->
    case do_check_mate(Role, Cond) of
        ok -> check_mate(T, Cond);
        {false, Reason} -> {false, Reason}
    end;
check_mate([#team_mate{} = TeamMate | T], Cond) ->
    case do_check_mate(TeamMate, Cond) of
        ok -> check_mate(T, Cond);
        {false, Reason} -> {false, Reason}
    end.

do_check_mate(_, []) -> ok;
do_check_mate(#team_mate{lev = Lev} = TeamMate,
              [lev | T]) ->
    case Lev >= 65 of
        true -> do_check_mate(TeamMate, T);
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts级,无法发起挑战"),
                           [{string_1, 65}])}
    end;
do_check_mate(#team_mate{id = Id, name = Name} =
                  TeamMate,
              [{guild, LeaderId} | T]) ->
    case guild_util:is_in_same(LeaderId, Id) of
        true -> do_check_mate(TeamMate, T);
        _ ->
            Msg = notice:format(lang:get("队员~ts和队长不在同一公会，自动离开了队伍"),
                                [{role_2, Name}]),
            {false, Msg}
    end;
do_check_mate(#team_mate{id = Id} = TeamMate,
              [times | T]) ->
    case check_times(Id) of
        true -> do_check_mate(TeamMate, T);
        {false, Reason} -> {false, Reason}
    end;
do_check_mate(#role{lev = Lev} = Role, [lev | T]) ->
    case Lev >= 65 of
        true -> do_check_mate(Role, T);
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts级,无法发起挑战"),
                           [{string_1, 65}])}
    end;
do_check_mate(#role{} = Role, [times | T]) ->
    case check_times(Role) of
        {ok, true} -> do_check_mate(Role, T);
        {ok, {false, Reason}} -> {false, Reason}
    end;
do_check_mate(#role{} = Role,
              [{guild, _LeaderId} | T]) ->
    do_check_mate(Role, T).

percent_reward(GuildId, ChapterId, StrongpointId,
               #guild_dungeon_monster{unique = Unique,
                                      role_name = RoleName,
                                      monster_id = MonsterId},
               Percent, OldPercent, _Harm, Pids) ->
    {Min, Max} = get_world_lv_range(ChapterId,
                                    StrongpointId,
                                    Unique),
    case guild_dungeon_data:get_monster({ChapterId,
                                         StrongpointId,
                                         Unique,
                                         Min,
                                         Max})
        of
        #{percent_reward := PercentReward} ->
            PercentRewardList = fetch_percent(GuildId),
            PercentList = case lists:keyfind({ChapterId,
                                              StrongpointId,
                                              Unique},
                                             1,
                                             PercentRewardList)
                              of
                              {_, List} when is_list(List) -> List;
                              _ -> []
                          end,
            {PercentList1, GuildReward} = lists:foldl(fun ({P,
                                                            RewardList},
                                                           {Acc, Acc1}) ->
                                                              case Percent / 10
                                                                       =< P
                                                                  of
                                                                  true ->
                                                                      case
                                                                          lists:member(P,
                                                                                       Acc)
                                                                          of
                                                                          true ->
                                                                              {Acc,
                                                                               Acc1};
                                                                          _ ->
                                                                              {ItemId,
                                                                               Num,
                                                                               _Odds} =
                                                                                  util:rand_list(RewardList,
                                                                                                 3),
                                                                              ItemIdList =
                                                                                  [item_type:special_id(ItemId)
                                                                                   || _X
                                                                                          <- lists:seq(1,
                                                                                                       Num)],
                                                                              ItemList =
                                                                                  [{ItemId1,
                                                                                    1}
                                                                                   || ItemId1
                                                                                          <- ItemIdList],
                                                                              guild_auction:add_list(GuildId,
                                                                                                     ItemIdList),
                                                                              {[P
                                                                                | Acc],
                                                                               ItemList
                                                                                   ++
                                                                                   Acc1}
                                                                      end;
                                                                  _ ->
                                                                      {Acc,
                                                                       Acc1}
                                                              end
                                                      end,
                                                      {PercentList, []},
                                                      PercentReward),
            MonsterName = unit:name(MonsterId),
            Type = case guild_dungeon_data:get_chapter({ChapterId,
                                                        StrongpointId})
                       of
                       #{type := Type0} -> Type0;
                       _ -> 1
                   end,
            logger:debug("怪物百分比奖励 ~w",
                         [{Percent,
                           OldPercent,
                           GuildReward,
                           PercentList,
                           PercentList1,
                           Type,
                           PercentReward}],
                         guild_dungeon,
                         1084),
            case GuildReward of
                [] when Type =:= 0 ->
                    Msg =
                        notice:format(lang:get("由~ts带领的队伍在英雄副本中英勇搏杀，痛击~ts~ts%的生命，~ts剩余~ts%生命，"
                                               "各位公会勇士快快前去剿灭！"),
                                      [{string_2, 5, RoleName},
                                       {string_2, 5, MonsterName},
                                       {string_1,
                                        util:floor((OldPercent - Percent) /
                                                       10)},
                                       {string_2, 5, MonsterName},
                                       {string_2,
                                        5,
                                        util:floor(Percent / 10)}]),
                    guild:notice(GuildId, Msg);
                [_ | _] when Type =:= 0 ->
                    Msg =
                        notice:format(lang:get("神兵天降！由~ts带领的队伍在英雄副本中英勇搏杀，痛击~ts~ts%的生命，从BOSS老巢"
                                               "抢来的<color='#ffff00'>宝物</color>已在公会拍卖中展示{face_"
                                               "1,36}"),
                                      [{string_2, 5, RoleName},
                                       {string_2, 5, MonsterName},
                                       {string_1,
                                        util:floor((OldPercent - Percent) /
                                                       10)}]),
                    guild:notice(GuildId, Msg);
                _ -> ok
            end,
            case GuildReward of
                [_ | _] ->
                    notice:send(Pids,
                                1,
                                notice:format(lang:get("公会获得~ts"),
                                              [{item_2, GuildReward}]));
                _ -> ok
            end,
            PercentRewardList1 = lists:keystore({ChapterId,
                                                 StrongpointId,
                                                 Unique},
                                                1,
                                                PercentRewardList,
                                                {{ChapterId,
                                                  StrongpointId,
                                                  Unique},
                                                 PercentList1}),
            save({GuildId, PercentRewardList1}),
            add_reward(GuildId,
                       ChapterId,
                       StrongpointId,
                       Unique,
                       GuildReward),
            ok;
        _ -> ok
    end.

cal_exp(Id, Lev, RatioList, Percent) ->
    case levup_data:get_exp({Id, Lev}) of
        #{exp := Exp, pet_exp := PetExp} ->
            Ratio = cal_exp(RatioList, Percent / 10, 0),
            [{90010, util:ceil(Exp * Ratio)},
             {90005, util:ceil(PetExp * Ratio)}];
        _ -> []
    end.

cal_exp([], _, Ratio) -> Ratio;
cal_exp([{Percent, Ratio} | T], PercentNow, _RatrioNow)
    when Percent =< PercentNow ->
    cal_exp(T, PercentNow, Ratio);
cal_exp([{Percent, _Ratio} | _T], PercentNow, RatrioNow)
    when Percent > PercentNow ->
    RatrioNow.

send_rank_mail(GuildId, ChapterId, StrongpointId) ->
    case get_monsters(GuildId, ChapterId, StrongpointId) of
        {ok, Monsters} ->
            M1 = [M
                  || #guild_dungeon_monster{challenge = Challenge} = M
                         <- Monsters,
                     Challenge =/= 4],
            logger:debug("发送有奖 ~w",
                         [length(M1)],
                         guild_dungeon,
                         1131),
            case M1 of
                [] ->
                    #guild_dungeon_rank{ranks = Ranks} = fetch_rank(GuildId,
                                                                    ChapterId,
                                                                    StrongpointId),
                    Ranks1 =
                        lists:reverse(lists:keysort(#guild_dungeon_rank_role.harm,
                                                    Ranks)),
                    Reward1 = case
                                  guild_dungeon_data:get_chapter({ChapterId,
                                                                  StrongpointId})
                                  of
                                  #{strongpoint_reward := Reward} -> Reward;
                                  _ -> []
                              end,
                    GuildReward1 = case
                                       guild_dungeon_data:get_chapter({ChapterId,
                                                                       StrongpointId})
                                       of
                                       #{guild_reward := GuildReward} ->
                                           GuildReward;
                                       _ -> []
                                   end,
                    {SpName1, Type1} = case
                                           guild_dungeon_data:get_chapter({ChapterId,
                                                                           StrongpointId})
                                           of
                                           #{type := Type,
                                             strongpoint_name := SpName}
                                               when Type =/= 0 ->
                                               Msg =
                                                   notice:format("~ts据点已被捣毁，请各位勇士再接再厉，向前进发！{face_1, 18}",
                                                                 [{string_2,
                                                                   5,
                                                                   SpName}]),
                                               guild:notice(GuildId, Msg),
                                               {SpName, Type};
                                           #{type := Type,
                                             strongpoint_name := SpName} ->
                                               {SpName, Type}
                                       end,
                    ItemIdList = lists:foldl(fun ({ItemId, Count}, Acc) ->
                                                     [item_type:special_id(ItemId)
                                                      || _X
                                                             <- lists:seq(1,
                                                                          Count)]
                                                         ++ Acc
                                             end,
                                             [],
                                             GuildReward1),
                    guild_auction:add_list(GuildId, ItemIdList),
                    lists:foldl(fun (#guild_dungeon_rank_role{role_id =
                                                                  RoleId,
                                                              role_ids =
                                                                  RoleIds},
                                     {Rank, RoleIdsAcc}) ->
                                        RankIds1 = case Type1 of
                                                       0 ->
                                                           [RoleId1
                                                            || {RoleId1,
                                                                _RoleName,
                                                                _RoleClasses,
                                                                _RoleSex,
                                                                _TotalDmg}
                                                                   <- RoleIds]
                                                               -- RoleIdsAcc;
                                                       _ -> [RoleId]
                                                   end,
                                        logger:debug("排名奖励发送 ~w",
                                                     [{Type1,
                                                       Rank,
                                                       RoleIdsAcc,
                                                       RankIds1,
                                                       RoleId}],
                                                     guild_dungeon,
                                                     1161),
                                        Reward2 = [{ItemId, 0, Count}
                                                   || {RankMax,
                                                       RankMin,
                                                       ItemId,
                                                       Count}
                                                          <- Reward1,
                                                      Rank =< RankMax andalso
                                                          Rank >= RankMin],
                                        case Reward2 of
                                            [] -> ok;
                                            _ ->
                                                mail:send(RankIds1,
                                                          notice:format(lang:get("~ts英雄！"),
                                                                        [{string_1,
                                                                          SpName1}]),
                                                          notice:format(lang:get("由于您在英雄副本~ts表现优异，勇夺英雄榜第~ts，论功行赏您获得以下奖励，请查收{fac"
                                                                                 "e_1,18}"),
                                                                        [{string_1,
                                                                          SpName1},
                                                                         {string_1,
                                                                          Rank}]),
                                                          Reward2)
                                        end,
                                        {Rank + 1, RankIds1 ++ RoleIdsAcc}
                                end,
                                {1, []},
                                Ranks1),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end.

treat_slave_attr(Fighter, Percent) ->
    logger:debug("随从怪属性特殊处理----> ~w",
                 [Percent],
                 guild_dungeon,
                 1185),
    Fighter#fighter{attr = {Percent}}.

rank(GuildId) ->
    #guild_dungeon_rank{ranks = Ranks} = fetch_rank(GuildId,
                                                    0,
                                                    0),
    Ranks.

fetch(GuildId) ->
    case ets:lookup(guild_dungeon, GuildId) of
        [GuildDungeon] -> GuildDungeon;
        _ ->
            case call({init_guild_dungeon, GuildId}) of
                {ok, GuildDungeon} -> GuildDungeon;
                _ -> false
            end
    end.

fetch_rank(GuildId, ChapterId, Strongpoints) ->
    Id = {GuildId, ChapterId, Strongpoints},
    case ets:lookup(guild_dungeon_rank, Id) of
        [Rank] -> Rank;
        _ ->
            #guild_dungeon_rank{id = Id, guild_id = GuildId,
                                chapter_id = ChapterId,
                                strongpoint_id = Strongpoints}
    end.

fetch_percent(GuildId) ->
    case ets:lookup(guild_dungeon_percent, GuildId) of
        [{GuildId, Percent}] -> Percent;
        _ -> []
    end.

fetch_score(_GuildId, _ChapterId, _StrongpointId,
            _Unique, RoleId, Type)
    when Type =:= 0 andalso
             RoleId =/= 0 andalso is_integer(RoleId) ->
    0;
fetch_score(GuildId, ChapterId, StrongpointId, Unique,
            RoleId, _Type) ->
    case ets:lookup(guild_dungeon_score, GuildId) of
        [{GuildId, DataList}] ->
            case lists:keyfind({ChapterId, StrongpointId, Unique},
                               1,
                               DataList)
                of
                {_, ScoreList} ->
                    case lists:keyfind(RoleId, 1, ScoreList) of
                        {_, Score} -> Score;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end.

save_score(GuildId, ChapterId, StrongpointId, Unique,
           RoleId, _Type, Score) ->
    DataList1 = case ets:lookup(guild_dungeon_score,
                                GuildId)
                    of
                    [{GuildId, DataList}] -> DataList;
                    _ -> []
                end,
    ScoreList1 = case lists:keyfind({ChapterId,
                                     StrongpointId,
                                     Unique},
                                    1,
                                    DataList1)
                     of
                     {_, ScoreList} -> ScoreList;
                     _ -> []
                 end,
    ScoreList2 = lists:keystore(RoleId,
                                1,
                                ScoreList1,
                                {RoleId, Score}),
    DataList2 = lists:keystore({ChapterId,
                                StrongpointId,
                                Unique},
                               1,
                               DataList1,
                               {{ChapterId, StrongpointId, Unique},
                                ScoreList2}),
    ets:insert(guild_dungeon_score, {GuildId, DataList2}),
    dets:insert(guild_dungeon_score, {GuildId, DataList2}),
    ok.

fetch_score(TeamId) ->
    case ets:lookup(guild_dungeon_score, {team_id, TeamId})
        of
        [{_, Data}] -> Data;
        _ -> {0, 0}
    end.

save_score(TeamId, Score, Percent) ->
    ets:insert(guild_dungeon_score,
               {{team_id, TeamId}, {Score, Percent}}),
    ok.

delete_score(TeamId) ->
    ets:delete(guild_dungeon_score, {team_id, TeamId}),
    ok.

save(GuildDungeon)
    when is_record(GuildDungeon, guild_dungeon) ->
    ets:insert(guild_dungeon, GuildDungeon),
    dets:insert(guild_dungeon, GuildDungeon),
    ok;
save(Rank) when is_record(Rank, guild_dungeon_rank) ->
    ets:insert(guild_dungeon_rank, Rank),
    dets:insert(guild_dungeon_rank, Rank),
    ok;
save({GuildId, List}) ->
    ets:insert(guild_dungeon_percent, {GuildId, List}),
    dets:insert(guild_dungeon_percent, {GuildId, List}),
    ok.

get_rank(GuildId, ChapterId, StrongpointId, Unique,
         RoleScore, Type) ->
    case ets:lookup(guild_dungeon_score, GuildId) of
        [{GuildId, DataList}] ->
            case lists:keyfind({ChapterId, StrongpointId, Unique},
                               1,
                               DataList)
                of
                {_, ScoreList} ->
                    ScoreList1 = lists:foldl(fun ({Id, Score}, Acc) ->
                                                     case Id of
                                                         0 -> Acc;
                                                         _ ->
                                                             case Type =:= 0 of
                                                                 true ->
                                                                     case
                                                                         is_integer(Id)
                                                                         of
                                                                         true ->
                                                                             [Score
                                                                              | Acc];
                                                                         _ ->
                                                                             Acc
                                                                     end;
                                                                 _ ->
                                                                     [Score
                                                                      | Acc]
                                                             end
                                                     end
                                             end,
                                             [],
                                             ScoreList),
                    ScoreList2 = lists:sort(ScoreList1),
                    cal_rank(lists:reverse(ScoreList2), RoleScore, 1);
                _ -> 1
            end;
        _ -> 1
    end.

cal_rank([], _Score, Rank) -> Rank;
cal_rank([Score | _T], RoleScore, Rank)
    when RoleScore >= Score ->
    Rank;
cal_rank([_Score | T], RoleScore, Rank) ->
    cal_rank(T, RoleScore, Rank + 1).

get_monster(#guild_dungeon{chapters = Chapters},
            ChapterId, StrongpointId, Unique) ->
    case lists:keyfind(ChapterId,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters)
        of
        _Chapter = #guild_dungeon_chapter{strongpoints =
                                              Strongpoints} ->
            case lists:keyfind(StrongpointId,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                _Strongpoint = #guild_dungeon_strongpoint{monsters =
                                                              Monsters} ->
                    case lists:keyfind(Unique,
                                       #guild_dungeon_monster.unique,
                                       Monsters)
                        of
                        Monster = #guild_dungeon_monster{} -> {ok, Monster};
                        _ -> {false, lang:get("该怪物不存在")}
                    end;
                _ -> {false, lang:get("该怪物不存在")}
            end;
        _ -> {false, lang:get("该怪物不存在")}
    end;
get_monster(GuildId, ChapterId, StrongpointId,
            Unique) ->
    case fetch(GuildId) of
        GuildDungeon when GuildDungeon =/= false ->
            get_monster(GuildDungeon,
                        ChapterId,
                        StrongpointId,
                        Unique);
        _ -> {false, lang:get("该怪物不存在1")}
    end.

get_monsters(#guild_dungeon{chapters = Chapters},
             ChapterId, StrongpointId) ->
    case lists:keyfind(ChapterId,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters)
        of
        _Chapter = #guild_dungeon_chapter{strongpoints =
                                              Strongpoints} ->
            case lists:keyfind(StrongpointId,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                _Strongpoint = #guild_dungeon_strongpoint{monsters =
                                                              Monsters} ->
                    {ok, Monsters};
                _ -> {false, lang:get("该怪物不存在3")}
            end;
        _ -> {false, lang:get("该怪物不存在2")}
    end;
get_monsters(GuildId, ChapterId, StrongpointId) ->
    case fetch(GuildId) of
        GuildDungeon when GuildDungeon =/= false ->
            get_monsters(GuildDungeon, ChapterId, StrongpointId);
        _ -> {false, lang:get("该怪物不存在1")}
    end.

set_monster(GuildDungeon = #guild_dungeon{chapters =
                                              Chapters},
            ChapterId, StrongpointId, Unique, NewMonster) ->
    case lists:keyfind(ChapterId,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters)
        of
        Chapter = #guild_dungeon_chapter{strongpoints =
                                             Strongpoints} ->
            case lists:keyfind(StrongpointId,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                Strongpoint = #guild_dungeon_strongpoint{monsters =
                                                             Monsters} ->
                    NewMonsters = lists:keystore(Unique,
                                                 #guild_dungeon_monster.unique,
                                                 Monsters,
                                                 NewMonster),
                    logger:debug("aaaaaaaaaaaaaa ~w",
                                 [{ChapterId,
                                   StrongpointId,
                                   Unique,
                                   NewMonster}],
                                 guild_dungeon,
                                 1379),
                    Strongpoint1 =
                        Strongpoint#guild_dungeon_strongpoint{monsters =
                                                                  NewMonsters},
                    NewStrongpoint = lists:keystore(StrongpointId,
                                                    #guild_dungeon_strongpoint.strongpoint_id,
                                                    Strongpoints,
                                                    Strongpoint1),
                    Chapter1 = Chapter#guild_dungeon_chapter{strongpoints =
                                                                 NewStrongpoint},
                    NewChapter = lists:keystore(ChapterId,
                                                #guild_dungeon_chapter.chapter_id,
                                                Chapters,
                                                Chapter1),
                    NewDungeon = GuildDungeon#guild_dungeon{chapters =
                                                                NewChapter},
                    save(NewDungeon),
                    {ok, NewDungeon};
                _ -> ok
            end;
        _ -> ok
    end.

add_reward(GuildId, ChapterId, StrongpointId, Unique,
           GuildReward1) ->
    GuildDungeon = #guild_dungeon{num = Num} =
                       fetch(GuildId),
    case get_monster(GuildId,
                     ChapterId,
                     StrongpointId,
                     Unique)
        of
        {ok,
         Monster = #guild_dungeon_monster{rewards = Rewards}} ->
            set_monster(GuildDungeon#guild_dungeon{num =
                                                       Num +
                                                           length(GuildReward1)},
                        ChapterId,
                        StrongpointId,
                        Unique,
                        Monster#guild_dungeon_monster{rewards =
                                                          Rewards ++
                                                              GuildReward1});
        _ -> ok
    end.

update_rank(GuildId, 0, 0, _RoleId, _RoleName,
            _RoleClasses, _RoleSex, _TotalDmg, RoleIds, Type)
    when Type =:= 0 ->
    logger:debug("总排行榜更新 ~w",
                 [{_TotalDmg, RoleIds}],
                 guild_dungeon,
                 1405),
    [update_rank(GuildId,
                 0,
                 0,
                 RoleId,
                 RoleName,
                 RoleClasses,
                 RoleSex,
                 TotalDmg,
                 [],
                 1)
     || {RoleId, RoleName, RoleClasses, RoleSex, TotalDmg}
            <- RoleIds];
update_rank(GuildId, ChapterId, StrongpointId, RoleId,
            RoleName, RoleClasses, RoleSex, TotalDmg, RoleIds, Type)
    when Type =:= 0 ->
    Rank = #guild_dungeon_rank{ranks = RankRoles} =
               fetch_rank(GuildId, ChapterId, StrongpointId),
    NewRankRole = #guild_dungeon_rank_role{role_id = RoleId,
                                           role_name = RoleName,
                                           classes = RoleClasses, sex = RoleSex,
                                           harm = util:ceil(TotalDmg / 1000),
                                           role_ids = RoleIds},
    NewRank = Rank#guild_dungeon_rank{ranks =
                                          [NewRankRole | RankRoles]},
    save(NewRank);
update_rank(GuildId, ChapterId, StrongpointId, RoleId,
            RoleName, RoleClasses, RoleSex, TotalDmg, _RoleIds,
            _Type) ->
    Rank = #guild_dungeon_rank{ranks = RankRoles} =
               fetch_rank(GuildId, ChapterId, StrongpointId),
    RankRole1 = #guild_dungeon_rank_role{harm = OldHarm,
                                         times = Times} =
                    case lists:keyfind(RoleId,
                                       #guild_dungeon_rank_role.role_id,
                                       RankRoles)
                        of
                        #guild_dungeon_rank_role{} = RankRole -> RankRole;
                        _ ->
                            #guild_dungeon_rank_role{role_id = RoleId,
                                                     role_name = RoleName,
                                                     classes = RoleClasses,
                                                     sex = RoleSex}
                    end,
    NewRankRole = RankRole1#guild_dungeon_rank_role{harm =
                                                        OldHarm +
                                                            util:ceil(TotalDmg /
                                                                          1000),
                                                    times = Times + 1},
    NewRank = Rank#guild_dungeon_rank{ranks =
                                          lists:keystore(RoleId,
                                                         #guild_dungeon_rank_role.role_id,
                                                         RankRoles,
                                                         NewRankRole)},
    save(NewRank).

cal_percent(Fighters, _, Type) when Type =:= 0 ->
    PosList = [{Pos, 0, 1000} || Pos <- lists:seq(1, 13)],
    Fighters1 = [F
                 || F = #fighter{type = 2, is_leader = 1} <- Fighters],
    case Fighters1 of
        [#fighter{pos = Pos1, hp = Hp, hp_max = HpMax} | _] ->
            Percent = util:floor(1000 * Hp / HpMax),
            logger:debug("战斗结束boss百分比~w ~w",
                         [PosList, Percent],
                         guild_dungeon,
                         1429),
            {lists:keystore(Pos1,
                            1,
                            PosList,
                            {Pos1, HpMax, Percent}),
             Percent,
             util:floor(HpMax - Hp)};
        _ -> {PosList, 0, 0}
    end;
cal_percent(Fighter, [], _Type) ->
    PosList = [{Pos, 0, 0} || Pos <- lists:seq(1, 13)],
    Data = [{Pos, Hp, HpMax}
            || #fighter{pos = Pos, hp = Hp, hp_max = HpMax,
                        type = 2}
                   <- Fighter],
    Fun = fun ({Pos, _Hp, _HpMax}, {Arg1, Arg2, Arg3, Arg4})
                  when Pos =:= 0 ->
                  {Arg1, Arg2, Arg3, Arg4};
              ({Pos, Hp, HpMax}, {Arg1, Arg2, Arg3, Arg4}) ->
                  {lists:keystore(Pos,
                                  1,
                                  Arg1,
                                  {Pos, HpMax, util:floor(1000 * Hp / HpMax)}),
                   Hp + Arg2,
                   HpMax + Arg3,
                   HpMax - Hp + Arg4}
          end,
    {PercentList, Hp1, HpMax1, AllHarm} = lists:foldl(Fun,
                                                      {PosList, 0, 0, 0},
                                                      Data),
    logger:debug("战斗结束怪物数据 ~w",
                 [{PercentList,
                   Hp1,
                   HpMax1,
                   util:floor(1000 * Hp1 / HpMax1),
                   AllHarm}],
                 guild_dungeon,
                 1445),
    {PercentList,
     util:floor(1000 * Hp1 / HpMax1),
     util:floor(AllHarm)};
cal_percent(Fighter, OldPercentList, _Type) ->
    Data = [{Pos, Hp, HpMax}
            || #fighter{pos = Pos, hp = Hp, hp_max = HpMax,
                        type = 2}
                   <- Fighter],
    Fun = fun ({Pos, OldHpMax, OldPercent},
               {Arg1, Arg2, Arg3, Arg4, Arg5}) ->
                  case lists:keytake(Pos, 1, Arg5) of
                      {value, {Pos, Hp, HpMax}, Data1} when Pos =/= 0 ->
                          logger:debug("位置 ~w 旧血量 ~w 当前血量 ~w ",
                                       [Pos,
                                        util:floor(HpMax * OldPercent / 1000),
                                        util:floor(HpMax * OldPercent / 1000) -
                                            Hp],
                                       guild_dungeon,
                                       1452),
                          Harm = util:floor(HpMax * OldPercent / 1000) - Hp,
                          {lists:keystore(Pos,
                                          1,
                                          Arg1,
                                          {Pos,
                                           HpMax,
                                           util:floor(1000 * Hp / HpMax)}),
                           Hp + Arg2,
                           HpMax + Arg3,
                           Harm + Arg4,
                           Data1};
                      _ ->
                          {[{Pos, OldHpMax, OldPercent} | Arg1],
                           Arg2,
                           Arg3,
                           Arg4,
                           Arg5}
                  end;
              ({Pos, OldPercent}, {Arg1, Arg2, Arg3, Arg4, Arg5}) ->
                  case lists:keytake(Pos, 1, Arg5) of
                      {value, {Pos, Hp, HpMax}, Data1} when Pos =/= 0 ->
                          logger:debug("位置 ~w 旧血量 ~w 当前血量 ~w ",
                                       [Pos,
                                        util:floor(HpMax * OldPercent / 1000),
                                        util:floor(HpMax * OldPercent / 1000) -
                                            Hp],
                                       guild_dungeon,
                                       1461),
                          Harm = util:floor(HpMax * OldPercent / 1000) - Hp,
                          {lists:keystore(Pos,
                                          1,
                                          Arg1,
                                          {Pos,
                                           HpMax,
                                           util:floor(1000 * Hp / HpMax)}),
                           Hp + Arg2,
                           HpMax + Arg3,
                           Harm + Arg4,
                           Data1};
                      _ ->
                          {[{Pos, 0, OldPercent} | Arg1],
                           Arg2,
                           Arg3,
                           Arg4,
                           Arg5}
                  end
          end,
    {PercentList, Hp1, HpMax1, AllHarm, LastData} =
        lists:foldl(Fun, {[], 0, 0, 0, Data}, OldPercentList),
    HpList = [Hp || {_Pos, Hp, _HpMax} <- LastData],
    HpMaxList = [HpMax || {_Pos, _Hp, HpMax} <- LastData],
    Hp2 = lists:sum(HpList),
    HpMax2 = lists:sum(HpMaxList),
    logger:debug("战斗结束怪物数据 ~w",
                 [{PercentList, Hp1, HpMax1, AllHarm}],
                 guild_dungeon,
                 1473),
    {PercentList,
     util:floor(1000 * (Hp1 + Hp2) /
                    max(1, HpMax1 + HpMax2)),
     util:floor(AllHarm)}.

check_next(GuildDungeon = #guild_dungeon{guild_id =
                                             GuildId,
                                         chapter_now = ChapterNow,
                                         strongpoint_now = StrongpointNow}) ->
    logger:debug("==  检查是否下一阶段=== ~w",
                 [{ChapterNow,
                   StrongpointNow,
                   get_monsters(GuildDungeon, ChapterNow, StrongpointNow),
                   chekc_finish(lists:seq(1, StrongpointNow),
                                GuildDungeon,
                                ChapterNow)}],
                 guild_dungeon,
                 1479),
    List = lists:seq(1, StrongpointNow),
    case chekc_finish(List, GuildDungeon, ChapterNow) of
        true ->
            case get_next(ChapterNow, StrongpointNow + 1) of
                {ok, ChapterNext, StrongpointNext}
                    when ChapterNext =:= ChapterNow ->
                    GuildDungeon1 = update_monster(GuildDungeon,
                                                   ChapterNext,
                                                   [StrongpointNow + 1]),
                    save(GuildDungeon1#guild_dungeon{strongpoint_now =
                                                         StrongpointNext}),
                    create(GuildId),
                    ok;
                {ok, ChapterNext, StrongpointNext} ->
                    GuildDungeon1 = update_monster(GuildDungeon,
                                                   ChapterNext,
                                                   [StrongpointNext]),
                    save(GuildDungeon1#guild_dungeon{chapter_now =
                                                         ChapterNext,
                                                     strongpoint_now =
                                                         StrongpointNext}),
                    create(GuildId),
                    ok;
                false -> ok
            end;
        _ -> ok
    end.

chekc_finish([], _GuildDungeon, _ChapterId) -> true;
chekc_finish([StrongpointId | T], GuildDungeon,
             ChapterId) ->
    case get_monsters(GuildDungeon,
                      ChapterId,
                      StrongpointId)
        of
        {ok, Monsters} ->
            case do_chekc_finish(Monsters) of
                true -> chekc_finish(T, GuildDungeon, ChapterId);
                _ -> false
            end;
        _ -> chekc_finish(T, GuildDungeon, ChapterId)
    end.

do_chekc_finish([]) -> true;
do_chekc_finish([#guild_dungeon_monster{challenge = 4}
                 | T]) ->
    do_chekc_finish(T);
do_chekc_finish(_) -> false.

get_next(ChapterId, StrongpointId) ->
    case guild_dungeon_data:get_chapter({ChapterId,
                                         StrongpointId})
        of
        #{type := _Type} -> {ok, ChapterId, StrongpointId};
        _ ->
            case guild_dungeon_data:get_chapter({ChapterId + 1,
                                                 StrongpointId})
                of
                false -> false;
                _ -> get_next(ChapterId + 1, 1)
            end
    end.

update_monster(GuildDungeon, _ChapterId, []) ->
    save(GuildDungeon),
    GuildDungeon;
update_monster(GuildDungeon = #guild_dungeon{chapters =
                                                 Chapters},
               ChapterId, [StrongpointId | T]) ->
    case lists:keyfind(ChapterId,
                       #guild_dungeon_chapter.chapter_id,
                       Chapters)
        of
        Chapter = #guild_dungeon_chapter{strongpoints =
                                             Strongpoints} ->
            case lists:keyfind(StrongpointId,
                               #guild_dungeon_strongpoint.strongpoint_id,
                               Strongpoints)
                of
                Strongpoint = #guild_dungeon_strongpoint{monsters =
                                                             Monsters} ->
                    logger:debug("更新怪物 ~w",
                                 [Strongpoint],
                                 guild_dungeon,
                                 1541),
                    Monsters1 = [Monster#guild_dungeon_monster{challenge =
                                                                   1}
                                 || Monster <- Monsters],
                    Strongpoint1 =
                        Strongpoint#guild_dungeon_strongpoint{monsters =
                                                                  Monsters1},
                    Strongpoints1 = lists:keystore(StrongpointId,
                                                   #guild_dungeon_strongpoint.strongpoint_id,
                                                   Strongpoints,
                                                   Strongpoint1),
                    Chapter1 = Chapter#guild_dungeon_chapter{strongpoints =
                                                                 Strongpoints1},
                    Chapters1 = lists:keystore(ChapterId,
                                               #guild_dungeon_chapter.chapter_id,
                                               Chapters,
                                               Chapter1),
                    NewGuildDungeon = GuildDungeon#guild_dungeon{chapters =
                                                                     Chapters1},
                    update_monster(NewGuildDungeon, ChapterId, T);
                _ -> update_monster(GuildDungeon, ChapterId, T)
            end;
        _ -> update_monster(GuildDungeon, ChapterId, T)
    end.

get_next_strongpoint(ChapterId, StrongpointNow) ->
    StrongpointIds =
        guild_dungeon_data:list_strongpoint(ChapterId),
    do_next_strongpoint(StrongpointIds,
                        ChapterId,
                        StrongpointNow).

do_next_strongpoint([], _ChapterId, _StrongpointNow) ->
    ok;
do_next_strongpoint([Id | T], ChapterId, StrongpointNow)
    when Id > StrongpointNow ->
    case guild_dungeon_data:get_chapter({ChapterId, Id}) of
        #{type := _Type} -> Id;
        _ -> do_next_strongpoint(T, ChapterId, StrongpointNow)
    end;
do_next_strongpoint([_Id | T], ChapterId,
                    StrongpointNow) ->
    do_next_strongpoint(T, ChapterId, StrongpointNow).

get_boss_data(_ChapterId, _StrongpointId, []) ->
    {0, 0, 0, 0, 0};
get_boss_data(ChapterId, StrongpointId,
              [Unique | Monster]) ->
    {Min, Max} = get_world_lv_range(ChapterId,
                                    StrongpointId,
                                    Unique),
    case guild_dungeon_data:get_monster({ChapterId,
                                         StrongpointId,
                                         Unique,
                                         Min,
                                         Max})
        of
        #{type := 1, map_id := MapId, map_x := X, map_y := Y,
          id := MonsterId} ->
            {MonsterId, MapId, X, Y, Unique};
        _ -> get_boss_data(ChapterId, StrongpointId, Monster)
    end.

make_team_event(Role = #role{s_event = Event}) ->
    case check_team(Role) of
        [] -> self;
        MateIds when Event =:= 47 ->
            #{label => enter_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_dungeon, role_callback, [follow_join]}};
        MateIds when Event =:= 0 orelse Event =:= 2 ->
            #{label => exit_event, event => Event,
              role_ids => MateIds,
              mfa => {guild_dungeon, role_callback, [follow_leave]}}
    end.

role_callback(_, Role = #role{name = _Name}, _,
              follow_join) ->
    logger:debug("玩家 ~ts 进入地图 ",
                 [_Name],
                 guild_dungeon,
                 1591),
    Role1 = Role#role{s_event = 47},
    map:role_update(Role1),
    {ok, Role1};
role_callback(_, Role, _, follow_leave) ->
    logger:debug("退出 场景 ~ts",
                 [Role#role.name],
                 guild_dungeon,
                 1596),
    Role1 = Role#role{s_event = 0},
    map:role_update(Role1),
    {ok, Role1}.

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

join_to_follow(Role, LeaderId) ->
    logger:debug("队长 id ~w",
                 [LeaderId],
                 guild_dungeon,
                 1615),
    Flag = case role_misc:check_event(Role) of
               {false, Reason} -> {false, Reason};
               true ->
                   case check_follow([{guild, LeaderId}, lev], Role) of
                       {false, Reason} -> {false, Reason};
                       ok -> ok
                   end
           end,
    case Flag of
        ok ->
            logger:debug("玩家可以归队", [], guild_dungeon, 1627),
            NewRole = Role#role{s_event = 47},
            team:follow(NewRole),
            {ok, NewRole};
        {false, Reason1} ->
            Msg = util:flist(lang:get("队长正在英雄副本，~ts"), [Reason1]),
            notice:send(Role, 3, Msg),
            ok
    end.

check_follow([], _Role) -> ok;
check_follow([times | T], Role) ->
    case check_times(Role) of
        {ok, true} -> check_follow(T, Role);
        {ok, {false, Reason}} -> {false, Reason}
    end;
check_follow([lev | T], Role = #role{lev = Lev}) ->
    case Lev >= 65 of
        true -> check_follow(T, Role);
        _ ->
            {false,
             notice:format(lang:get("等级不足~ts级，不能归队"),
                           [{string_2, 5, 65}])}
    end;
check_follow([{guild, LeaderId} | T],
             Role = #role{id = Id}) ->
    case guild_util:is_in_same(LeaderId, Id) of
        true -> check_follow(T, Role);
        _ -> {false, lang:get("和队长不在同一公会，不能归队")}
    end.

can_team_join(Role, Mate, Now) ->
    do_can_team_join([lev, guild], Role, Mate, Now).

do_can_team_join([], _, _, _) -> true;
do_can_team_join([lev | T], Role,
                 Mate = #team_mate{lev = Lev, name = Name, pid = Pid},
                 Now) ->
    case Lev >= 65 of
        true -> do_can_team_join(T, Role, Mate, Now);
        _ ->
            Msg = notice:format(lang:get("队员~ts等级不足~ts级，自动离开了队伍"),
                                [{role_2, Name}, {string_2, 5, 65}]),
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
            Msg = notice:format(lang:get("队员~ts和队长不在同一公会，自动离开了队伍"),
                                [{role_2, Name}]),
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end;
do_can_team_join([times | T], Role,
                 Mate = #team_mate{id = Id, name = _Name, pid = Pid},
                 Now) ->
    case check_times(Id) of
        true -> do_can_team_join(T, Role, Mate, Now);
        {false, Msg} ->
            team:notice(Role, Msg),
            role:apply(async, Pid, {team, async_leave, []}),
            false
    end.

check_times(Role = #role{name = RoleName}) ->
    Times = var:get_var(Role, day_five, 148, 0),
    case Times < 1 of
        true -> {ok, true};
        _ ->
            {ok,
             {false,
              notice:format(lang:get("~ts次数不足，无法挑战"),
                            [{string_2, 5, RoleName}])}}
    end;
check_times(Id) ->
    role:apply(sync, Id, {guild_dungeon, check_times, []}).

gm_create_boss(#role{m_guild = #m_guild{id = GuildId}},
               ChapterId, StrongpointId) ->
    GuildDungeon = fetch(GuildId),
    GuildDungeon1 = GuildDungeon#guild_dungeon{chapter_now =
                                                   ChapterId,
                                               strongpoint_now = StrongpointId},
    create(GuildDungeon1),
    ok;
gm_create_boss(_, _, _) -> {false, lang:get("没有公会")}.

gm_reset(#role{m_guild = #m_guild{id = GuildId}}) ->
    ets:delete_all_objects(guild_dungeon),
    dets:delete_all_objects(guild_dungeon),
    ets:delete_all_objects(guild_dungeon_rank),
    dets:delete_all_objects(guild_dungeon_rank),
    ets:delete_all_objects(guild_dungeon_percent),
    dets:delete_all_objects(guild_dungeon_percent),
    ets:delete_all_objects(guild_dungeon_score),
    dets:delete_all_objects(guild_dungeon_score),
    call({init_guild_dungeon, GuildId}),
    ok.

gm_reset() ->
    ets:delete_all_objects(guild_dungeon),
    dets:delete_all_objects(guild_dungeon),
    ets:delete_all_objects(guild_dungeon_rank),
    dets:delete_all_objects(guild_dungeon_rank),
    ets:delete_all_objects(guild_dungeon_percent),
    dets:delete_all_objects(guild_dungeon_percent),
    ets:delete_all_objects(guild_dungeon_score),
    dets:delete_all_objects(guild_dungeon_score),
    Fun = fun (#guild{id = GuildId}, _) ->
                  call({init_guild_dungeon, GuildId})
          end,
    ets:foldl(Fun, ok, guild_list),
    ok.

gm_clear_combat() ->
    Fun = fun (#guild{id = GuildId}, _) ->
                  case fetch(GuildId) of
                      GuildDungeon = #guild_dungeon{chapters = Chapters} ->
                          NGDC = [begin
                                      NStrongpoints = [begin
                                                           NMonsters = [begin
                                                                            case
                                                                                is_pid(CombatPid)
                                                                                    andalso
                                                                                    is_process_alive(CombatPid)
                                                                                        ==
                                                                                        false
                                                                                of
                                                                                true ->
                                                                                    GDM#guild_dungeon_monster{role_name
                                                                                                                  =
                                                                                                                  "",
                                                                                                              role_sex
                                                                                                                  =
                                                                                                                  0,
                                                                                                              challenge
                                                                                                                  =
                                                                                                                  1,
                                                                                                              role_classes
                                                                                                                  =
                                                                                                                  0,
                                                                                                              combat_pid
                                                                                                                  =
                                                                                                                  undefined,
                                                                                                              combat_id
                                                                                                                  =
                                                                                                                  0};
                                                                                _ ->
                                                                                    GDM
                                                                            end
                                                                        end
                                                                        || GDM =
                                                                               #guild_dungeon_monster{combat_pid
                                                                                                          =
                                                                                                          CombatPid}
                                                                               <- Monsters],
                                                           GDS#guild_dungeon_strongpoint{monsters
                                                                                             =
                                                                                             NMonsters}
                                                       end
                                                       || GDS =
                                                              #guild_dungeon_strongpoint{monsters
                                                                                             =
                                                                                             Monsters}
                                                              <- Strongpoints],
                                      GDC#guild_dungeon_chapter{strongpoints =
                                                                    NStrongpoints}
                                  end
                                  || GDC = #guild_dungeon_chapter{strongpoints =
                                                                      Strongpoints}
                                         <- Chapters],
                          NGD = GuildDungeon#guild_dungeon{chapters = NGDC},
                          logger:debug("======", [], guild_dungeon, 1757),
                          save(NGD);
                      _ -> ok
                  end
          end,
    ets:foldl(Fun, ok, guild_list).

gm_all(#role{m_guild = #m_guild{id = GuildId}}) ->
    [FirstChapterId | _] = ChapterIds =
                               guild_dungeon_data:list(),
    Fun = fun (ChapterId, Acc) ->
                  StrongpointIds =
                      guild_dungeon_data:list_strongpoint(ChapterId),
                  logger:debug("所有据点Id ~w",
                               [StrongpointIds],
                               guild_dungeon,
                               1771),
                  Fun1 = fun (StrongpointId, {Acc2, Flag}) ->
                                 case guild_dungeon_data:get_chapter({ChapterId,
                                                                      StrongpointId})
                                     of
                                     #{type := Type, monsters := Monsters} ->
                                         logger:debug("初始化 状态 ~w",
                                                      [{ChapterId,
                                                        FirstChapterId,
                                                        Flag}],
                                                      guild_dungeon,
                                                      1775),
                                         Monsters1 = lists:foldl(fun (Unique,
                                                                      MonsterAcc) ->
                                                                         {Min,
                                                                          Max} =
                                                                             get_world_lv_range(ChapterId,
                                                                                                StrongpointId,
                                                                                                Unique),
                                                                         case
                                                                             guild_dungeon_data:get_monster({ChapterId,
                                                                                                             StrongpointId,
                                                                                                             Unique,
                                                                                                             Min,
                                                                                                             Max})
                                                                             of
                                                                             #{id
                                                                                   :=
                                                                                   MonsterId} ->
                                                                                 [#guild_dungeon_monster{unique
                                                                                                             =
                                                                                                             Unique,
                                                                                                         type
                                                                                                             =
                                                                                                             Type,
                                                                                                         percent
                                                                                                             =
                                                                                                             1000,
                                                                                                         challenge
                                                                                                             =
                                                                                                             1,
                                                                                                         monster_id
                                                                                                             =
                                                                                                             MonsterId}
                                                                                  | MonsterAcc];
                                                                             _ ->
                                                                                 MonsterAcc
                                                                         end
                                                                 end,
                                                                 [],
                                                                 Monsters),
                                         Strongpoint =
                                             #guild_dungeon_strongpoint{strongpoint_id
                                                                            =
                                                                            StrongpointId,
                                                                        monsters
                                                                            =
                                                                            Monsters1},
                                         {[Strongpoint | Acc2], Flag};
                                     _R -> {Acc2, Flag}
                                 end
                         end,
                  {Strongpoints, _} = lists:foldl(Fun1,
                                                  {[], false},
                                                  StrongpointIds),
                  Chapters = #guild_dungeon_chapter{chapter_id =
                                                        ChapterId,
                                                    strongpoints =
                                                        Strongpoints},
                  [Chapters | Acc]
          end,
    Chapters1 = lists:foldl(Fun, [], ChapterIds),
    StrongpointNow = get_next_strongpoint(FirstChapterId,
                                          1),
    GuildDungeon = #guild_dungeon{chapter_now =
                                      FirstChapterId,
                                  chapters = Chapters1, guild_id = GuildId,
                                  strongpoint_now = StrongpointNow},
    save(GuildDungeon),
    ok.

gm_chall(GuildId, ChapterId, StrongpointId, Unique,
         NewStatus) ->
    case fetch(GuildId) of
        GuildDungeon when GuildDungeon =/= false ->
            case get_monster(GuildDungeon,
                             ChapterId,
                             StrongpointId,
                             Unique)
                of
                {ok, Monster = #guild_dungeon_monster{}} ->
                    NewMonster = Monster#guild_dungeon_monster{challenge =
                                                                   NewStatus,
                                                               combat_pid =
                                                                   undefined,
                                                               combat_id = 0},
                    set_monster(GuildDungeon,
                                ChapterId,
                                StrongpointId,
                                Unique,
                                NewMonster);
                _ -> ignore
            end;
        _ -> ignore
    end.

get_world_lv_range(ChapterId, StrongPointId, Unique) ->
    Now = date:unixtime2(),
    case Now < 1505620800 of
        true -> {0, 0};
        _ ->
            {WorldLv, _} = world_lev:get_world_lev(),
            RangeList = guild_dungeon_data:get_award_world_lv(),
            get_world_lv_range(ChapterId,
                               StrongPointId,
                               Unique,
                               WorldLv,
                               RangeList)
    end.

get_world_lv_range(_ChapterId, _StrongPointId, _Unique,
                   _, []) ->
    {0, 0};
get_world_lv_range(ChapterId, StrongPointId, Unique, Lv,
                   [{ChapterId, StrongPointId, Unique, Min, Max}
                    | Rest]) ->
    case Lv >= Min andalso Lv =< Max of
        true -> {Min, Max};
        _ ->
            get_world_lv_range(ChapterId,
                               StrongPointId,
                               Unique,
                               Lv,
                               Rest)
    end;
get_world_lv_range(ChapterId, StrongPointId, Unique, Lv,
                   [_ | Rest]) ->
    get_world_lv_range(ChapterId,
                       StrongPointId,
                       Unique,
                       Lv,
                       Rest).

