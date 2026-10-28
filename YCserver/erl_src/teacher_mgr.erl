-file("src/mod/teacher/teacher_mgr.erl", 1).

-module(teacher_mgr).

-behaviour(gen_server).

-export([start_link/0,
         cast/1,
         call/1,
         lookup/1,
         lookup/2,
         update_data/1,
         update_data/2,
         del_data/1,
         del_data/2,
         is_same_mount/2]).

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

-file("src/mod/teacher/teacher_mgr.erl", 25).

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

-file("src/mod/teacher/teacher_mgr.erl", 26).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/teacher/teacher_mgr.erl", 27).

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

-file("src/mod/teacher/teacher_mgr.erl", 28).

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

-file("src/mod/teacher/teacher_mgr.erl", 29).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, teacher_mgr},
                          teacher_mgr,
                          [],
                          []).

cast(Info) -> teacher_mgr ! Info.

call(Info) ->
    case catch gen_server:call(teacher_mgr, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

init([]) ->
    logger:info("开始启动...", [], teacher_mgr, 50),
    process_flag(trap_exit, true),
    dets:open_file(teacher,
                   [{file, "./dets/teacher.dets"}, {keypos, #teacher.id}]),
    ets:new(teacher,
            [set, named_table, public, {keypos, #teacher.id}]),
    dets:open_file(teacher_sign,
                   [{file, "./dets/teacher_sign.dets"},
                    {keypos, #teacher_sign.id}]),
    ets:new(teacher_sign,
            [set, named_table, public, {keypos, #teacher_sign.id}]),
    ets:new(teacher_student_sign,
            [set,
             named_table,
             public,
             {keypos, #teacher_student_sign_info.id}]),
    load_data(teacher, type_teacher),
    load_data(teacher_sign, type_teacher_sign),
    State = #state{},
    logger:info("启动完成", [], teacher_mgr, 60),
    {ok, State}.

handle_call({student,
             Teacher = #teacher{id = TRoleId, name = TName,
                                sex = TSex, classes = TClasses, lev = TLev,
                                guild_id = TGId, guild_name = TGName,
                                login_time = TLoginTime},
             Student = #student{id = SRoleId}},
            _From, State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students,
                                       teacher_score = TeacherScore} ->
                    NewStudent = Student#student{status = 1},
                    NewStudents = lists:keystore(SRoleId,
                                                 #student.id,
                                                 Students,
                                                 NewStudent),
                    NewTeacherInfo = TeacherInfo#teacher{name = TName,
                                                         sex = TSex,
                                                         classes = TClasses,
                                                         login_time =
                                                             TLoginTime,
                                                         lev = TLev,
                                                         guild_id = TGId,
                                                         guild_name = TGName,
                                                         students =
                                                             NewStudents},
                    update_data(NewTeacherInfo),
                    {ok,
                     #{teacher_score => TeacherScore,
                       num => length(NewStudents)}};
                _ ->
                    NewTeacherInfo = Teacher#teacher{students = [Student]},
                    update_data(NewTeacherInfo),
                    {ok, #{teacher_score => 0, num => 1}}
            end,
    {reply, Reply, State};
handle_call({quit_student, TRoleId, SRoleId}, _From,
            State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students} ->
                    case lists:keydelete(SRoleId, #student.id, Students) of
                        NewStudents ->
                            NewTeacherInfo = TeacherInfo#teacher{students =
                                                                     NewStudents},
                            update_data(NewTeacherInfo),
                            {ok, teacher}
                    end;
                _ -> {false, lang:get("没有找到师傅信息")}
            end,
    {reply, Reply, State};
handle_call({quit_agree, TRoleId, SRoleId}, _From,
            State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students,
                                       lev = Lev} ->
                    case lists:keyfind(SRoleId, #student.id, Students) of
                        Student = #student{teacher_score = Score} ->
                            Now = date:unixtime(),
                            NewStudents = lists:keyreplace(SRoleId,
                                                           #student.id,
                                                           Students,
                                                           Student#student{status
                                                                               =
                                                                               2,
                                                                           out_time
                                                                               =
                                                                               Now}),
                            Length = length([1
                                             || #student{status = 2}
                                                    <- NewStudents]),
                            MountLength = length([1
                                                  || #student{status = 2,
                                                              out_time =
                                                                  OutTime}
                                                         <- NewStudents,
                                                     is_same_mount(Now,
                                                                   OutTime)]),
                            update_data(TeacherInfo#teacher{students =
                                                                NewStudents}),
                            role_trigger:async_fire(TRoleId,
                                                    [#evt_teacher_student{num =
                                                                              Length}]),
                            {ok,
                             #{score => Score, length => Length, lev => Lev,
                               mount_length => MountLength}};
                        _ -> {false, lang:get("没有找到该徒弟")}
                    end;
                _ -> {false, lang:get("没有找到师傅信息")}
            end,
    {reply, Reply, State};
handle_call({quit_teacher, TRoleId, SRoleId}, _From,
            State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students} ->
                    case lists:keydelete(SRoleId, #student.id, Students) of
                        NewStudents ->
                            NewTeacherInfo = TeacherInfo#teacher{students =
                                                                     NewStudents},
                            update_data(NewTeacherInfo),
                            {ok, teacher}
                    end;
                _ -> {false, lang:get("没有找到师傅信息")}
            end,
    {reply, Reply, State};
handle_call({target_reward_teacher,
             TRoleId,
             SRoleId,
             Type},
            _From, State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students} ->
                    case lists:keyfind(SRoleId, #student.id, Students) of
                        Student = #student{lev = Lev, daily_reward = 0} ->
                            NewStudents = lists:keyreplace(SRoleId,
                                                           #student.id,
                                                           Students,
                                                           Student#student{daily_reward
                                                                               =
                                                                               1}),
                            update_data(TeacherInfo#teacher{students =
                                                                NewStudents}),
                            case teacher_data:get_daily_reward({1, Lev, Type})
                                of
                                {StudentRewards, ExpRate} ->
                                    AddExp = teacher:get_exp(#{mode => 3306,
                                                               lev => Lev,
                                                               rate =>
                                                                   ExpRate}),
                                    case Type of
                                        1 ->
                                            mail:send(SRoleId,
                                                      lang:get("日常功课"),
                                                      lang:get("师傅对你今天完成的功课表示满意，继续加油哦{face_1,16}"),
                                                      StudentRewards ++ AddExp);
                                        _ ->
                                            mail:send(SRoleId,
                                                      lang:get("日常功课"),
                                                      lang:get("师傅对你今天完成的功课表示非常满意，对你做出了额外的奖励，继续加油哦{face_1,38}"),
                                                      StudentRewards ++ AddExp)
                                    end;
                                _E ->
                                    logger:error("验收没有奖励：~w",
                                                 [{TRoleId,
                                                   SRoleId,
                                                   Type,
                                                   Lev,
                                                   _E}],
                                                 teacher_mgr,
                                                 157)
                            end,
                            case role_query:pid(by_id, SRoleId) of
                                {ok, SPid} ->
                                    role:apply(async,
                                               SPid,
                                               {teacher,
                                                target_reward_teacher_apply,
                                                [Type]});
                                _ -> ignore
                            end,
                            ok;
                        #student{} -> {false, lang:get("已经验收过了")};
                        _ -> {false, lang:get("没有找到该徒弟")}
                    end;
                _ -> {false, lang:get("没有找到师傅信息")}
            end,
    {reply, Reply, State};
handle_call({teacher_reward_target,
             TRoleId,
             SRoleId,
             Id},
            _From, State) ->
    Reply = case lookup(TRoleId) of
                TeacherInfo = #teacher{students = Students} ->
                    case lists:keyfind(SRoleId, #student.id, Students) of
                        Student = #student{name = SName,
                                           target_rewarded = TargetReearded,
                                           target_reward = TargetReeard} ->
                            Flag = lists:member(Id, TargetReeard),
                            case lists:member(Id, TargetReearded) of
                                true -> {false, lang:get("该目标已经领了")};
                                _ when Flag == false ->
                                    {false, lang:get("该目标不能领取")};
                                _ ->
                                    case teacher_data:get_target(Id) of
                                        #teacher_target_data{teacher_reward =
                                                                 TeacherReward,
                                                             name = TargetName,
                                                             teacher_exp =
                                                                 Exp} ->
                                            NewTargetReearded = [Id
                                                                 | TargetReearded],
                                            NewTargetReeard = TargetReeard --
                                                                  [Id],
                                            NewStudents =
                                                lists:keyreplace(SRoleId,
                                                                 #student.id,
                                                                 Students,
                                                                 Student#student{target_rewarded
                                                                                     =
                                                                                     NewTargetReearded,
                                                                                 target_reward
                                                                                     =
                                                                                     NewTargetReeard}),
                                            update_data(TeacherInfo#teacher{students
                                                                                =
                                                                                NewStudents}),
                                            {ok,
                                             #{item_list => TeacherReward,
                                               name => SName, exp => Exp,
                                               target_name => TargetName}};
                                        _ -> {false, lang:get("没有找到配置")}
                                    end
                            end;
                        _ -> {false, lang:get("没有找到该徒弟")}
                    end;
                _ -> {false, lang:get("没有找到师傅数据")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_student, TRoleId, SRoleId, List},
            State) ->
    case lookup(TRoleId) of
        TeacherInfo = #teacher{students = Students} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                Student = #student{} ->
                    NewStudent = update_info(Student, List),
                    NewStudents = lists:keyreplace(SRoleId,
                                                   #student.id,
                                                   Students,
                                                   NewStudent),
                    NewTeacherInfo = TeacherInfo#teacher{students =
                                                             NewStudents},
                    update_data(NewTeacherInfo);
                _ -> ignore
            end;
        _ -> ignore
    end,
    {noreply, State};
handle_info({update_student,
             TRoleId,
             SRoleId,
             add_score,
             Score},
            State) ->
    case lookup(TRoleId) of
        TeacherInfo = #teacher{students = Students} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                Student = #student{teacher_score = TeacherScore} ->
                    NewStudent = update_info(Student,
                                             [{#student.teacher_score,
                                               TeacherScore + Score}]),
                    NewStudents = lists:keyreplace(SRoleId,
                                                   #student.id,
                                                   Students,
                                                   NewStudent),
                    NewTeacherInfo = TeacherInfo#teacher{students =
                                                             NewStudents},
                    update_data(NewTeacherInfo);
                _ -> ignore
            end;
        _ -> ignore
    end,
    {noreply, State};
handle_info({update_student_target_reward,
             TRoleId,
             SRoleId,
             Id},
            State) ->
    logger:debug("徒弟完成任务:~w", [Id], teacher_mgr, 253),
    case lookup(TRoleId) of
        TeacherInfo = #teacher{students = Students} ->
            case lists:keyfind(SRoleId, #student.id, Students) of
                Student = #student{target = Target,
                                   target_reward = TargetReward,
                                   target_rewarded = TargetRewarded} ->
                    case lists:member(Id, TargetRewarded) of
                        true -> ignore;
                        _ ->
                            NewTargetReward = [Id | lists:delete(Id,
                                                                 TargetReward)],
                            NewTarget = lists:keydelete(Id,
                                                        #teacher_target.id,
                                                        Target),
                            NewStudent = update_info(Student,
                                                     [{#student.target_reward,
                                                       NewTargetReward},
                                                      {#student.target,
                                                       NewTarget}]),
                            NewStudents = lists:keyreplace(SRoleId,
                                                           #student.id,
                                                           Students,
                                                           NewStudent),
                            NewTeacherInfo = TeacherInfo#teacher{students =
                                                                     NewStudents},
                            update_data(NewTeacherInfo)
                    end;
                _ -> ignore
            end;
        _ -> ignore
    end,
    {noreply, State};
handle_info({update_teacher, TRoleId, List}, State) ->
    case lookup(TRoleId) of
        TeacherInfo = #teacher{} ->
            NewTeacherInfo = update_info(TeacherInfo, List),
            update_data(NewTeacherInfo),
            teacher_update_name(NewTeacherInfo, List);
        _ -> ignore
    end,
    {noreply, State};
handle_info({update_teacher, TRoleId, add_score, List},
            State) ->
    case lookup(TRoleId) of
        TeacherInfo = #teacher{} ->
            NewList = update_teacher_score(TeacherInfo, List, []),
            NewTeacherInfo = #teacher{teacher_score =
                                          TeacherScore} =
                                 update_info(TeacherInfo, NewList),
            role_trigger:async_fire(TRoleId,
                                    [#evt_teacher_score_sum{score =
                                                                TeacherScore}]),
            update_data(NewTeacherInfo),
            teacher_update_name(NewTeacherInfo, List);
        _ -> ignore
    end,
    {noreply, State};
handle_info({update_sign, TRoleId, List}, State) ->
    case lookup(TRoleId) of
        TeacherInfo = #teacher_sign{} ->
            NewTeacherInfo = update_info(TeacherInfo, List),
            update_data(NewTeacherInfo),
            role:apply(async, TRoleId, {teacher, push_sign, []});
        _ -> ignore
    end,
    {noreply, State};
handle_info({get_sign_list,
             #{id := RoleId, pid := Pid, sex := Sex,
               classes := Classes, lev := Lev}},
            State) ->
    SexList = case Sex of
                  1 -> [1];
                  0 -> [0];
                  _ -> [1, 0]
              end,
    ClassesList = case Classes of
                      1 -> [1, 2, 3, 6];
                      2 -> [4, 5];
                      _ -> [1, 2, 3, 4, 5, 6]
                  end,
    List = ets:tab2list(teacher_sign),
    case get_sign_list(List,
                       [con_online_sign, con_online, is_sign, online],
                       #{id => RoleId, sex => SexList, classes => ClassesList,
                         lev => Lev},
                       [])
        of
        [] ->
            notice:send({pid, Pid}, 1, lang:get("没有找到合适的玩家"), []),
            ignore;
        List2 ->
            role:pack_send(Pid, 15816, {lists:sublist(List2, 3)})
    end,
    {noreply, State};
handle_info({get_sign_list2, #{pid := Pid, lev := Lev}},
            State) ->
    SexList = [1, 0],
    ClassesList = [1, 2, 3, 4, 5, 6],
    List = ets:tab2list(teacher_sign),
    case get_sign_list(List,
                       [is_sign, online],
                       #{sex => SexList, classes => ClassesList, lev => Lev},
                       [])
        of
        [] ->
            notice:send({pid, Pid}, 1, lang:get("没有找到合适的玩家"), []),
            ignore;
        List2 ->
            List3 = util:rand_list_n(List2, 8),
            logger:debug("师傅列表~w", [List3], teacher_mgr, 345),
            role:pack_send(Pid, 15822, {List3})
    end,
    {noreply, State};
handle_info({get_studen_sign_list, #{pid := Pid}},
            State) ->
    List = ets:tab2list(teacher_student_sign),
    List2 = case util:rand_list_n(List, 8) of
                L when is_list(L) -> L;
                _ -> []
            end,
    role:pack_send(Pid, 15823, {List2}),
    {noreply, State};
handle_info({login,
             #{id := TRoleId, name := TName, lev := Lev,
               classes := Classes, now := Now}},
            State) ->
    case lookup(teacher_sign, TRoleId) of
        TeacherInfo = #teacher_sign{login_time = LoginTime,
                                    logout_time = 0, online = Online} ->
            update_data(teacher_sign,
                        TeacherInfo#teacher_sign{login_time = Now,
                                                 logout_time = 0, online = 1,
                                                 online_time =
                                                     Now - LoginTime + Online,
                                                 name = TName,
                                                 classes = Classes, lev = Lev});
        TeacherInfo = #teacher_sign{logout_time = LogoutTime}
            when LogoutTime > 0 ->
            update_data(teacher_sign,
                        TeacherInfo#teacher_sign{name = TName,
                                                 classes = Classes, lev = Lev,
                                                 login_time = Now,
                                                 logout_time = 0, online = 1});
        _ -> ignore
    end,
    {noreply, State};
handle_info({logout, #{id := TRoleId, now := Now}},
            State) ->
    case lookup(teacher_sign, TRoleId) of
        TeacherInfo = #teacher_sign{login_time = LoginTime,
                                    logout_time = 0, online = Online} ->
            update_data(teacher_sign,
                        TeacherInfo#teacher_sign{login_time = Now,
                                                 logout_time = Now,
                                                 online_time =
                                                     Now - LoginTime + Online,
                                                 online = 0});
        TeacherInfo = #teacher_sign{} ->
            update_data(teacher_sign,
                        TeacherInfo#teacher_sign{login_time = Now,
                                                 logout_time = Now,
                                                 online = 0});
        _ -> ignore
    end,
    {noreply, State};
handle_info({student_signin,
             #{id := TRoleId, name := TName, sex := Sex, lev := Lev,
               classes := Classes, msg := Msg}},
            State) ->
    StudentData = #teacher_student_sign_info{id = TRoleId,
                                             sex = Sex, name = TName, lev = Lev,
                                             classes = Classes, msg = Msg},
    update_student_data(StudentData),
    {noreply, State};
handle_info({student_signout, #{id := TRoleId}},
            State) ->
    case lookup(teacher_student_sign, TRoleId) of
        #teacher_student_sign_info{} ->
            del_student_data(TRoleId);
        _ -> ignore
    end,
    {noreply, State};
handle_info({push_daily,
             #{pid := Pid, teacher_id := TRoleId,
               target_id := OtherRoleId}},
            State) ->
    case lookup(TRoleId) of
        #teacher{students = Students} ->
            case lists:keyfind(OtherRoleId, #student.id, Students)
                of
                #student{id = RoleId, name = Name, sex = Sex,
                         classes = Classes, lev = Lev,
                         teacher_score = TeacherScore, daily = Daily,
                         daily_reward = DailyReward, daily_time = DailyTime} ->
                    Now = date:unixtime(),
                    {NewDaily, NewDailyReward} = case date:is_same_day(Now,
                                                                       DailyTime)
                                                     of
                                                     true ->
                                                         {Daily, DailyReward};
                                                     _ -> {[], 0}
                                                 end,
                    teacher:push_daily(#{id => RoleId,
                                         target_id => OtherRoleId, name => Name,
                                         sex => Sex, classes => Classes,
                                         lev => Lev, fc => TeacherScore,
                                         daily => NewDaily,
                                         daily_reward => NewDailyReward},
                                       Pid);
                _ ->
                    notice:send({pid, Pid}, 1, lang:get("该徒弟已经不存在了"), [])
            end;
        _ -> notice:send({pid, Pid}, 1, lang:get("没有找到数据"), [])
    end,
    {noreply, State};
handle_info({push_target,
             #{pid := Pid, teacher_id := TRoleId,
               target_id := OtherRoleId}},
            State) ->
    case lookup(TRoleId) of
        #teacher{students = Students} ->
            case lists:keyfind(OtherRoleId, #student.id, Students)
                of
                #student{id = RoleId, name = Name, sex = Sex,
                         classes = Classes, lev = Lev,
                         teacher_score = TeacherScore, target = Target,
                         target_reward = TargetReward,
                         target_rewarded = TargetRewarded} ->
                    teacher:push_target(#{id => RoleId,
                                          target_id => OtherRoleId,
                                          name => Name, sex => Sex,
                                          classes => Classes, lev => Lev,
                                          fc => TeacherScore, target => Target,
                                          target_reward => TargetReward,
                                          target_rewarded => TargetRewarded},
                                        Pid);
                _ ->
                    notice:send({pid, Pid}, 1, lang:get("该徒弟已经不存在了"), [])
            end;
        _ -> notice:send({pid, Pid}, 1, lang:get("没有找到数据"), [])
    end,
    {noreply, State};
handle_info({push_teacher_info,
             #{teacher_id := TRoleId, pid := Pid}},
            State) ->
    case lookup(TRoleId) of
        #teacher{name = TName, sex = TSex, classes = TClasses,
                 lev = TLev, guild_id = TGuildId, guild_name = TGName,
                 msg = Msg, teacher_score = TeacherScore,
                 login_time = LoginTime, students = Students} ->
            role:pack_send(Pid,
                           15807,
                           {TRoleId,
                            TName,
                            TSex,
                            TClasses,
                            TLev,
                            TGuildId,
                            TGName,
                            Msg,
                            TeacherScore,
                            LoginTime,
                            Students});
        _ -> notice:send({pid, Pid}, 1, lang:get("没有找到数据"), [])
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

lookup(Id) -> lookup(teacher, Id).

lookup(Table, Id) ->
    case ets:lookup(Table, Id) of
        [Data] -> Data;
        _ -> false
    end.

update_data(Data) ->
    update_ets(teacher, Data),
    update_dets(teacher, Data).

update_data(Table, Data) ->
    update_ets(Table, Data),
    update_dets(Table, Data).

update_ets(Table, Data) -> ets:insert(Table, Data).

update_dets(Table, Data) -> dets:insert(Table, Data).

update_student_data(Data) ->
    update_ets(teacher_student_sign, Data).

del_data(Id) ->
    del_ets(teacher, Id),
    del_dets(teacher, Id).

del_student_data(Id) ->
    del_ets(teacher_student_sign, Id).

del_data(Table, Id) ->
    del_ets(Table, Id),
    del_dets(Table, Id).

del_ets(Table, Id) -> ets:delete(Table, Id).

del_dets(Table, Id) -> dets:delete(Table, Id).

update_info(Info, []) -> Info;
update_info(Info, [{Key, Val} | T]) ->
    NewInfo = erlang:setelement(Key, Info, Val),
    update_info(NewInfo, T).

update_teacher_score(_TeacherInfo, [], List) -> List;
update_teacher_score(TeacherInfo =
                         #teacher{teacher_score = TeacherScore},
                     [{Label = #teacher.teacher_score, Score} | T], List) ->
    update_teacher_score(TeacherInfo,
                         T,
                         [{Label, TeacherScore + Score} | List]);
update_teacher_score(TeacherInfo =
                         #teacher{teacher_score_offline = TeacherScore},
                     [{Label = #teacher.teacher_score_offline, Score} | T],
                     List) ->
    update_teacher_score(TeacherInfo,
                         T,
                         [{Label, TeacherScore + Score} | List]);
update_teacher_score(TeacherInfo, [{Label, Score} | T],
                     List) ->
    update_teacher_score(TeacherInfo,
                         T,
                         [{Label, Score} | List]).

get_sign_list([], _, _, List) -> lists:reverse(List);
get_sign_list(_, [], _, List) -> lists:reverse(List);
get_sign_list(SignList, [Label | T], Cond, List) ->
    AddList1 = get_sign_list(SignList, Label, Cond, []),
    AddList = get_sign_list(AddList1,
                            teacher_check,
                            Cond,
                            []),
    NewList = List ++ AddList,
    case length(NewList) >= 8 of
        true -> util:rand_list_n(NewList, 8);
        _ ->
            get_sign_list(SignList -- AddList1, T, Cond, NewList)
    end;
get_sign_list([#teacher_sign{id = RoleId} | T], Label,
              Cond = #{id := RoleId}, List) ->
    get_sign_list(T, Label, Cond, List);
get_sign_list([I = #teacher_sign{online = 1} | T],
              Label = online, Cond, List) ->
    get_sign_list(T, Label, Cond, [I | List]);
get_sign_list([I = #teacher_sign{is_sign = 1,
                                 online = 1}
               | T],
              Label = is_sign, Cond, List) ->
    get_sign_list(T, Label, Cond, [I | List]);
get_sign_list([I = #teacher_sign{id = RoleId, lev = Lev}
               | T],
              Label = teacher_check, Cond = #{lev := SLev}, List)
    when Lev - SLev >= 5 ->
    MinLev = teacher:get_teacher_min_lev(),
    case teacher:teacher_check(#{id => RoleId, lev => Lev,
                                 m_teacher => teacher:init(),
                                 min_lev => MinLev})
        of
        ok -> get_sign_list(T, Label, Cond, [I | List]);
        _ -> get_sign_list(T, Label, Cond, List)
    end;
get_sign_list([I = #teacher_sign{id = _RoleId,
                                 lev = _Lev, online = 1, sex = Sex,
                                 classes = Classes}
               | T],
              Label = con_online,
              Cond = #{sex := SexList, classes := ClassesList},
              List) ->
    case lists:member(Sex, SexList) andalso
             lists:member(Classes, ClassesList)
        of
        true -> get_sign_list(T, Label, Cond, [I | List]);
        _ -> get_sign_list(T, Label, Cond, List)
    end;
get_sign_list([I = #teacher_sign{id = _RoleId,
                                 lev = _Lev, online = 1, is_sign = 1, sex = Sex,
                                 classes = Classes}
               | T],
              Label = con_online_sign,
              Cond = #{sex := SexList, classes := ClassesList},
              List) ->
    case lists:member(Sex, SexList) andalso
             lists:member(Classes, ClassesList)
        of
        true -> get_sign_list(T, Label, Cond, [I | List]);
        _ -> get_sign_list(T, Label, Cond, List)
    end;
get_sign_list([_ | T], Label, Cond, List) ->
    get_sign_list(T, Label, Cond, List).

teacher_update_name(_, []) -> ok;
teacher_update_name(Teacher = #teacher{id = RoleId,
                                       name = Name, students = Students},
                    [{#teacher.name, _} | T]) ->
    [role:apply(async,
                SRoleId,
                {teacher, teacher_update_name, [RoleId, Name]})
     || #student{id = SRoleId} <- Students],
    teacher_update_name(Teacher, T);
teacher_update_name(Teacher, [_ | T]) ->
    teacher_update_name(Teacher, T).

load_data(Table, Type) ->
    case dets:first(Table) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], teacher_mgr, 568),
            [];
        _ ->
            dets:traverse(Table,
                          fun (Data) ->
                                  case Type of
                                      type_teacher_sign ->
                                          Data2 = teacher_ver:convert_sign(1,
                                                                           Data),
                                          case is_record(Data2, teacher_sign) of
                                              true ->
                                                  NewData =
                                                      Data2#teacher_sign{online
                                                                             =
                                                                             0},
                                                  update_ets(Table, NewData),
                                                  update_dets(Table, NewData),
                                                  continue;
                                              _ ->
                                                  update_ets(Table, Data2),
                                                  continue
                                          end;
                                      _ ->
                                          case teacher_ver:convert_teacher(Data)
                                              of
                                              {true, NewData} ->
                                                  update_data(NewData),
                                                  continue;
                                              _Err ->
                                                  logger:error("师徒系统数据加载失败:~w",
                                                               [_Err],
                                                               teacher_mgr,
                                                               592),
                                                  {done, false}
                                          end
                                  end
                          end)
    end.

is_same_mount(Time, Time2) ->
    {{Y, M, _}, _} = date:seconds_to_datetime(Time),
    {{Y2, M2, _}, _} = date:seconds_to_datetime(Time2),
    Y == Y2 andalso M == M2.

