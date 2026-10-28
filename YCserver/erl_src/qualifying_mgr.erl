-file("src/mod/qualifying/qualifying_mgr.erl", 1).

-module(qualifying_mgr).

-behaviour(gen_fsm).

-export([start_link/1,
         m/1,
         call/1,
         cast/1,
         info/1,
         send/2,
         print/0,
         get_addday/2,
         local_insert_log/1,
         local_add_count/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idel/2, notice/2, active/2, ending/2]).

-export([sign_up/3,
         find_role/1,
         remove_signing_up_roles/1,
         sign_up_result/4,
         match_result/4,
         combat_over/2,
         combat_time_over/1,
         cancel_match/2,
         cancel_match_result/2,
         insert_mark/1,
         clean_count/1,
         set_point/2,
         del_all_mark/0,
         get_mark/1,
         start_combat_result/2,
         get_status/1,
         get_count/2,
         get_role_count/1,
         status/1,
         async_log/2,
         thumb_up/3,
         query_news/1,
         get_week_rank_point/1]).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 61).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 62).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/mod/qualifying/qualifying_mgr.erl", 63).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 64).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 65).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 66).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 67).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 68).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/qualifying/qualifying_mgr.erl", 69).

-file("inc/looks.hrl", 1).

-file("src/mod/qualifying/qualifying_mgr.erl", 70).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 71).

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

-file("src/mod/qualifying/qualifying_mgr.erl", 72).

-record(state,
        {ts = 0,
         timeout = 0,
         mode = 1,
         is_cross = 0,
         status = open,
         news = [],
         news_status = [],
         zone_list = []}).

status(open) -> cast({status, open});
status(close) -> cast({status, close});
status(_) -> skip.

remove_signing_up_roles(RoleIds) ->
    qualifying_mgr ! {remove_signing_up_roles, RoleIds}.

sign_up(QualifyingType, QualifyingRoles, Pids) ->
    GroupId = qualifying_util:get_cross_group(),
    GroupRoles = [R#qualifying_role{cross_group = GroupId}
                  || R = #qualifying_role{} <- QualifyingRoles],
    group_cast({sign_up, QualifyingType, GroupRoles, Pids}).

sign_up_result(Source, Flag, RoleIds, QualifyingType) ->
    cast({sign_up_result,
          Source,
          Flag,
          RoleIds,
          QualifyingType}).

match_result(RoleIds, QualifyingType, TeamInfo,
             EnemyInfo) ->
    cast({match_result,
          RoleIds,
          QualifyingType,
          TeamInfo,
          EnemyInfo}).

cancel_match(QualifyingType, RoleIds) ->
    group_cast({cancel_match, QualifyingType, RoleIds}).

cancel_match_result(RoleIds, Result) ->
    cast({cancel_match_result, RoleIds, Result}).

combat_over(Flag, CombatInfo) ->
    cast({combat_over, Flag, CombatInfo}).

combat_time_over(RoleId) ->
    cast({combat_time_over, RoleId}).

start_combat_result(RoleId, Reason) ->
    cast({start_combat_result, RoleId, Reason}).

get_status(RolePid) -> cast({get_status, RolePid}).

print() -> info(print).

thumb_up(Sid, Spid, Tid) ->
    cast({thumb_up, Sid, Spid, Tid}).

query_news(RolePid) -> cast({query_news, RolePid}).

get_mark(RoleId) ->
    NewMark = case find_role(RoleId) of
                  {ok, Mark} -> Mark;
                  _ -> #qualifying_role_mark{id = RoleId}
              end,
    NewMark.

get_week_rank_point(RoleId) ->
    case find_role(RoleId) of
        {ok,
         #qualifying_role_mark{rank_point = RankPoint,
                               week_flag = WeekFlag,
                               week_max_rank_point = WeekMaxRankPoint}} ->
            Now = date:unixtime(),
            case date:is_same_week(Now, WeekFlag) of
                true -> WeekMaxRankPoint;
                _ -> RankPoint
            end;
        _ -> 1000
    end.

get_role_count(Role) -> get_all_count(Role).

start_link(NodeType) ->
    gen_fsm:start_link({local, qualifying_mgr},
                       qualifying_mgr,
                       [NodeType],
                       []).

m(Event) -> gen_fsm:send_event(qualifying_mgr, Event).

call(Msg) ->
    case catch
             gen_fsm:sync_send_all_state_event(qualifying_mgr, Msg)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(qualifying_mgr, Msg).

group_cast(Msg) ->
    case qualifying_util:get_cross_group() of
        0 -> cast(Msg);
        _ -> cross:cast(qualifying_mgr, cast, [Msg])
    end.

info(Msg) -> qualifying_mgr ! Msg.

find_role(RoleId = {_, P, Z}) ->
    case catch cross:call(P,
                          Z,
                          ets,
                          lookup,
                          [qualifying_role_mark, RoleId])
        of
        [Rmark = #qualifying_role_mark{}] -> {ok, Rmark};
        [] -> false;
        _ -> error
    end;
find_role(_) -> false.

send({Rid, P, Z}, Msg) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} -> notice:send({pid, Pid}, 1, Msg);
        _ -> skip
    end.

insert_mark(Mark)
    when is_record(Mark, qualifying_role_mark) ->
    qualifying_rank:update_rank_lev_list([Mark]),
    ets:insert(qualifying_role_mark, Mark),
    dets:insert(dets_qualifying_role_mark, Mark);
insert_mark(_Mark) ->
    logger:error("错误的段位赛数据:~w",
                 [_Mark],
                 qualifying_mgr,
                 251),
    ok.

clean_count(RoleId) ->
    ets:delete(qualifying_role_log, RoleId),
    dets:delete(dets_qualifying_role_log, RoleId).

del_all_mark() ->
    ets:delete_all_objects(qualifying_role_mark),
    dets:delete_all_objects(dets_qualifying_role_mark).

set_point(#role{id = RoleId, name = Name, lev = Lev,
                sex = Sex, classes = Classes},
          Point) ->
    RankLev = qualifying_data:point_to_lev(Point),
    RankType = case qualifying_data:get(RankLev) of
                   #qualifying_rank_data{rank_type = Rt} -> Rt;
                   _ -> 0
               end,
    case find_role(RoleId) of
        {ok,
         SMark = #qualifying_role_mark{season_max_rank_point =
                                           SeasonRankPoint}} ->
            insert_mark(SMark#qualifying_role_mark{rank_point =
                                                       Point,
                                                   rank_lev = RankLev,
                                                   rank_type = RankType,
                                                   season_max_rank_point =
                                                       max(Point,
                                                           SeasonRankPoint)});
        false ->
            insert_mark(#qualifying_role_mark{id = RoleId,
                                              name = Name, rank_point = Point,
                                              rank_lev = RankLev,
                                              rank_type = RankType, lev = Lev,
                                              sex = Sex, classes = Classes,
                                              day_win = 0})
    end.

init([NodeType]) ->
    logger:info("[~w] 正在启动...",
                [qualifying_mgr],
                qualifying_mgr,
                282),
    process_flag(trap_exit, true),
    State = #state{},
    IdelTime = get_idel_time(),
    dets:open_file(dets_qualifying_role_mark,
                   [{file, "./dets/qualifying_role_mark.dets"},
                    {keypos, #qualifying_role_mark.id},
                    {type, set}]),
    ets:new(qualifying_role_mark,
            [set,
             named_table,
             public,
             {keypos, #qualifying_role_mark.id}]),
    ets:new(qualifying_zone_role,
            [set,
             named_table,
             public,
             {keypos, #qualifying_zone_role.id}]),
    StartFlag = case dets:first(dets_qualifying_role_mark)
                    of
                    '$end_of_table' ->
                        logger:info("没有数据需要加载", [], qualifying_mgr, 295),
                        [];
                    _ ->
                        dets:traverse(dets_qualifying_role_mark,
                                      fun (RoleMark) ->
                                              case
                                                  qualifying_ver:convert(RoleMark)
                                                  of
                                                  {false, Reason} ->
                                                      logger:error("段位赛数据转换失败:~w",
                                                                   [Reason],
                                                                   qualifying_mgr,
                                                                   302),
                                                      {done, false};
                                                  {ok, NewRoleMark} ->
                                                      ets:insert(qualifying_role_mark,
                                                                 NewRoleMark),
                                                      continue
                                              end
                                      end)
                end,
    dets:open_file(dets_qualifying_role_log,
                   [{file, "./dets/qualifying_role_log.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(qualifying_role_log,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(dets_qualifying_role_log,
                qualifying_role_log),
    dets:open_file(qualifying_season_info,
                   [{file, "./dets/qualifying_season_info.dets"},
                    {keypos, #qualifying_season_data.id},
                    {type, set}]),
    ets:new(qualifying_season_info,
            [set,
             named_table,
             public,
             {keypos, #qualifying_season_data.id}]),
    dets:to_ets(qualifying_season_info,
                qualifying_season_info),
    Ref = erlang:send_after(date:next_diff(23, 0, 0) * 1000,
                            self(),
                            calc_season),
    case catch ets:lookup(qualifying_season_info, 1) of
        [#qualifying_season_data{}] -> skip;
        _ -> init_season_data()
    end,
    put(calc_season, Ref),
    init_local_match(),
    ets:new(qualifying_role_match,
            [set,
             named_table,
             public,
             {keypos, #qualifying_role.id}]),
    IsCross = case NodeType of
                  center -> 1;
                  _ -> 0
              end,
    OpenMode = check_open_mode(IsCross),
    case StartFlag of
        [] ->
            self() ! init,
            qualifying_rank:start_link(local),
            logger:info("启动完成，模式~w",
                        [OpenMode],
                        qualifying_mgr,
                        347),
            case IdelTime of
                undefined ->
                    logger:error("无法获取段位赛开启时间，开启失败",
                                 [],
                                 qualifying_mgr,
                                 350),
                    {stop, time_load_err};
                _ ->
                    logger:info("下次段位赛开启时间[~w]",
                                [IdelTime],
                                qualifying_mgr,
                                353),
                    {ok,
                     idel,
                     State#state{ts = erlang:now(), timeout = IdelTime,
                                 is_cross = IsCross, mode = OpenMode},
                     IdelTime}
            end;
        _Err ->
            logger:error("段位赛数据文件载入失败:~w",
                         [_Err],
                         qualifying_mgr,
                         357),
            {stop, data_load_err}
    end.

handle_event({status, Status}, StateName, State) ->
    continue(StateName, State#state{status = Status});
handle_event(reload, StateName,
             State = #state{is_cross = IsCross,
                            mode = OldOpenMode}) ->
    OpenMode = check_open_mode(IsCross),
    logger:info("收到重载公会英雄从[~w]模式转换成[~w]模式",
                [OldOpenMode, OpenMode],
                qualifying_mgr,
                368),
    continue(StateName, State#state{mode = OpenMode});
handle_event({start_combat_result, RoleId, Reason},
             StateName, State) ->
    case Reason of
        {false, fail} ->
            send(RoleId, lang:get("系统繁忙, 发起战斗失败了"));
        {false, op_leave} ->
            send(RoleId, lang:get("你的对手离开了, 无法参与战斗"));
        _ -> skip
    end,
    continue(StateName, State);
handle_event({sign_up, _QualifyingType, _Roles, Pids},
             idel, State) ->
    lists:foreach(fun ({_, Pid}) ->
                          role:pack_send(Pid, 13500, {0, lang:get("段位赛暂未开启")})
                  end,
                  Pids),
    continue(idel, State);
handle_event({sign_up, _QualifyingType, _Roles, Pids},
             notice, State) ->
    lists:foreach(fun ({_, Pid}) ->
                          role:pack_send(Pid,
                                         13500,
                                         {0, lang:get("段位赛正在准备中, 请稍后匹配")})
                  end,
                  Pids),
    continue(notice, State);
handle_event({sign_up, _QualifyingType, _Roles, Pids},
             ending, State) ->
    lists:foreach(fun ({_, Pid}) ->
                          role:pack_send(Pid,
                                         13500,
                                         {0, lang:get("段位赛已经结束了, 请退出准备区")})
                  end,
                  Pids),
    continue(ending, State);
handle_event({sign_up,
              QualifyingType,
              QualifyingRoles,
              Pids},
             active, State) ->
    do_local_sign_up(QualifyingType, QualifyingRoles, Pids),
    continue(active, State);
handle_event({get_status, RolePid}, StateName,
             State = #state{ts = Ts, timeout = TimeOut}) ->
    SeasonEndTime = case ets:lookup(qualifying_season_info,
                                    1)
                        of
                        [#qualifying_season_data{end_time = EndTime}] ->
                            EndTime;
                        _ -> 0
                    end,
    Fun = fun (idel) -> {0, 0, SeasonEndTime};
              (notice) ->
                  {1,
                   util:time_left(TimeOut, Ts) div 1000,
                   SeasonEndTime};
              (active) ->
                  {2,
                   util:time_left(TimeOut, Ts) div 1000,
                   SeasonEndTime};
              (ending) -> {0, 0, SeasonEndTime}
          end,
    role:pack_send(RolePid, 13502, Fun(StateName)),
    continue(StateName, State);
handle_event({cancel_match, QualifyingType, RoleIds},
             StateName, State) ->
    qualifying_util:cancel_match(get({local_match,
                                      QualifyingType}),
                                 RoleIds),
    continue(StateName, State);
handle_event({cancel_match_result, RoleIds, Result},
             StateName, State) ->
    do_cancel_match_result(RoleIds, Result),
    continue(StateName, State);
handle_event({sign_up_result,
              Source,
              Flag,
              RoleIds,
              QualifyingType},
             StateName, State) ->
    do_sign_up_result(Source,
                      Flag,
                      RoleIds,
                      QualifyingType),
    continue(StateName, State);
handle_event({combat_time_over, {Rid, P, Z}}, StateName,
             State) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, RolePid} ->
            role:apply(async,
                       RolePid,
                       {fun do_combat_over/4, [undefined, [], undefined]});
        _ -> skip
    end,
    continue(StateName, State);
handle_event({combat_over,
              local,
              #{type := Type, role_id := RoleId, result := Result,
                rewards := Rewards, role := Qrole,
                point_change := PointChange, combat := CombatStatistics,
                mate := CombatMate, times := Times}},
             StateName,
             State = #state{news = News,
                            news_status = NewsStatus}) ->
    {BRankPoint, ARankPoint, UpdateInfo} =
        qualifying_util:merge_role_mark(Type,
                                        CombatStatistics,
                                        Result,
                                        Qrole,
                                        PointChange),
    case UpdateInfo of
        #qualifying_role_mark{id = {_, P, Z}} ->
            cross:cast(P,
                       Z,
                       qualifying_mgr,
                       insert_mark,
                       [UpdateInfo]);
        _ -> skip
    end,
    {NewRewards, ReduceFlag} = if Times >= 9 -> {[], 1};
                                  Times >= 3 ->
                                      Rewards1 = [{RewardName,
                                                   round(RewardVal / 2)}
                                                  || {RewardName, RewardVal}
                                                         <- Rewards,
                                                     RewardName =:= 90012],
                                      Rewards2 = [{RewardName, RewardVal}
                                                  || {RewardName, RewardVal}
                                                         <- Rewards,
                                                     RewardName =/= 90012],
                                      {Rewards1 ++ Rewards2, 0};
                                  true -> {Rewards, 0}
                               end,
    {News1, NewsStatus1} = update_news(News,
                                       NewsStatus,
                                       UpdateInfo,
                                       Result,
                                       CombatMate),
    case role_query:pid(by_id, RoleId) of
        {ok, RolePid} ->
            NewRewards1 = case ReduceFlag of
                              1 -> [{90005, 0}, {90010, 0}];
                              _ -> NewRewards
                          end,
            role:pack_send(RolePid,
                           13506,
                           {Result,
                            BRankPoint,
                            ARankPoint,
                            NewRewards1,
                            to_show_mate(CombatMate, [])}),
            WinFlag = get_win(Result),
            role_trigger:async_fire(RolePid,
                                    #evt_qualifying_combat_over{type = Type,
                                                                win_flag =
                                                                    WinFlag}),
            role:apply(async,
                       RolePid,
                       {fun do_combat_over/4,
                        [UpdateInfo,
                         to_thumb_mate(CombatMate, []),
                         {NewRewards, Result, ReduceFlag}]});
        _ ->
            mail_reward(RoleId, NewRewards, Result),
            skip
    end,
    continue(StateName,
             State#state{news = News1, news_status = NewsStatus1});
handle_event({match_result,
              Rids,
              QualifyingType,
              TeamInfo,
              OtherInfo},
             StateName, State) ->
    lists:foreach(fun (RoleId) ->
                          add_count(RoleId, QualifyingType),
                          case role_query:pid(by_id, RoleId) of
                              {ok, Pid} ->
                                  role_trigger:async_fire(Pid,
                                                          [#evt_qualifying_combat{type
                                                                                      =
                                                                                      QualifyingType}]),
                                  role:pack_send(Pid,
                                                 13503,
                                                 {QualifyingType,
                                                  TeamInfo,
                                                  OtherInfo});
                              _ -> skip
                          end
                  end,
                  Rids),
    continue(StateName, State);
handle_event({thumb_up,
              Sid = {_, SP, SZ},
              Spid,
              Tid = {_, TP, TZ}},
             StateName, State) ->
    case find_role(Sid) of
        {ok,
         SMark = #qualifying_role_mark{thumb_up_other =
                                           ThumbUpOther}} ->
            case find_role(Tid) of
                {ok,
                 TMark = #qualifying_role_mark{thumb_up = ThumbUp}} ->
                    NewSMark = SMark#qualifying_role_mark{thumb_up_other =
                                                              ThumbUpOther + 1},
                    NewTMark = TMark#qualifying_role_mark{thumb_up =
                                                              ThumbUp + 1},
                    cross:cast(SP,
                               SZ,
                               qualifying_mgr,
                               insert_mark,
                               [NewSMark]),
                    cross:cast(TP,
                               TZ,
                               qualifying_mgr,
                               insert_mark,
                               [NewTMark]),
                    role:pack_send(Spid, 13510, {1, lang:get("点赞成功")});
                _ -> skip
            end;
        _ -> skip
    end,
    continue(StateName, State);
handle_event({query_news, RolePid}, StateName,
             State = #state{news = News}) ->
    role:pack_send(RolePid, 13509, {News}),
    continue(StateName, State);
handle_event({enter, _RoleId, RolePid, _Flag},
             StateName, State = #state{zone_list = []}) ->
    role:pack_send(RolePid,
                   13512,
                   {0, lang:get("时空裂隙只在每晚21：30-22：30出现，到时间再来找我吧！")}),
    continue(StateName, State);
handle_event({enter, RoleId, RolePid, Flag}, StateName,
             State = #state{zone_list = [{_Seq, ZonePid} | _T]})
    when StateName =:= notice orelse StateName =:= active ->
    qualifying_zone:cast(ZonePid,
                         {enter, RoleId, RolePid, Flag}),
    continue(StateName, State);
handle_event({enter, _RoleId, RolePid, _Flag},
             StateName, State) ->
    role:pack_send(RolePid,
                   13512,
                   {0, lang:get("时空裂隙只在每晚21：30-22：30出现，到时间再来找我吧！")}),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:error("段位赛管理进程收到未处理的消息:~w",
                 [_Event],
                 qualifying_mgr,
                 541),
    continue(StateName, State).

handle_sync_event({login, RoleId, RolePid}, _From,
                  StateName, State)
    when StateName =:= notice orelse StateName =:= active ->
    case qualifying_zone:find_role(RoleId) of
        {true, #qualifying_zone_role{zone_pid = ZonePid}}
            when is_pid(ZonePid) ->
            qualifying_zone:cast(ZonePid, {login, RoleId, RolePid}),
            continue(StateName, {true, ZonePid}, State);
        _ -> continue(StateName, false, State)
    end;
handle_sync_event({login, _, _}, _From, StateName,
                  State) ->
    continue(StateName, false, State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({remove_signing_up_roles, RoleIds},
            StateName, State) ->
    put(signing_up_roles, get(signing_up_roles) -- RoleIds),
    continue(StateName, State);
handle_info(calc_season, StateName, State = #state{}) ->
    case get(calc_season) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    reset_qualifying_role_mark(),
    Ref = erlang:send_after(date:next_diff(23, 0, 0) * 1000,
                            self(),
                            calc_season),
    put(calc_season, Ref),
    continue(StateName, State);
handle_info(print, StateName,
            State = #state{news = _News,
                           news_status = _NewsStatus}) ->
    logger:debug("============================",
                 [],
                 qualifying_mgr,
                 580),
    logger:debug("当前新闻:~w", [_News], qualifying_mgr, 581),
    logger:debug("当前状态:~w",
                 [_NewsStatus],
                 qualifying_mgr,
                 582),
    logger:debug("============================",
                 [],
                 qualifying_mgr,
                 583),
    case get({local_match, 1}) of
        Pid when is_pid(Pid) -> Pid ! print;
        _ -> skip
    end,
    continue(StateName, State);
handle_info({'EXIT', _ExitPid, normal}, StateName,
            State) ->
    continue(StateName, State);
handle_info({'EXIT', _ExitPid, _Reason}, StateName,
            State) ->
    logger:error("本服进程异常挂掉:~w",
                 [_Reason],
                 qualifying_mgr,
                 594),
    Pid = get({local_match, 1}),
    case is_process_alive(Pid) of
        true -> skip;
        _ ->
            case qualifying_match:start_link(1) of
                {ok, MatchPid} -> put({local_match, 1}, MatchPid);
                _Err ->
                    logger:error("创建本地匹配进程失败[~w]", [1], qualifying_mgr, 603)
            end
    end,
    continue(StateName, State);
handle_info(init, StateName, State = #state{}) ->
    qualifying_rank:update_rank_lev_list(),
    continue(StateName, State);
handle_info({clean_match, Flag}, idel, State) ->
    put(signing_up_roles, []),
    ets:delete_all_objects(qualifying_role_match),
    ets:delete_all_objects(qualifying_zone_role),
    case Flag of
        clean -> del_all_mark();
        _ -> skip
    end,
    continue(idel, State);
handle_info(cast_active, active, State) ->
    Msg =
        notice:format(lang:get("~ts活动进行中，魔法与刀剑，实力与配合，快来一决高下!"),
                      [{string_2, 1, lang:get("时空段位赛")}]),
    notice:cast(all, 8, Msg),
    erlang:send_after(5 * 60 * 1000, self(), cast_active),
    continue(active, State);
handle_info(cast_active, StateName, State) ->
    continue(StateName, State);
handle_info(calc_final_reward, StateName, State) ->
    Days = date:open_srv_day(),
    case Days >= 15 of
        true -> gm_season_clac_final_reward();
        false -> ok
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    logger:info("[~w] 正在关闭...",
                [qualifying_mgr],
                qualifying_mgr,
                648),
    logger:info("[~w] 关闭完成",
                [qualifying_mgr],
                qualifying_mgr,
                649),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

do_cancel_match_result([], _) -> ok;
do_cancel_match_result([RoleId | T], Result) ->
    case role_query:pid(by_id, RoleId) of
        {ok, Pid} ->
            case Result of
                true ->
                    case catch role:apply(sync,
                                          Pid,
                                          {fun do_signup_cancel/1, []})
                        of
                        true ->
                            role:pack_send(Pid, 13501, {1, lang:get("取消匹配成功")});
                        _ -> role:pack_send(Pid, 13501, {0, lang:get("取消匹配失败")})
                    end;
                {false, matched} ->
                    role:pack_send(Pid,
                                   13501,
                                   {0, lang:get("匹配已经完成,不要急着取消嘛")});
                _ -> role:pack_send(Pid, 13501, {0, lang:get("取消匹配失败")})
            end;
        _ -> skip
    end,
    do_cancel_match_result(T, Result).

do_signup_cancel(Role = #role{m_qualifying = Mqua}) ->
    NewMqua = Mqua#m_qualifying{sign_type = 0},
    Role1 = Role#role{m_qualifying = NewMqua},
    qualifying_util:push_13511(Role1),
    {ok, true, Role1}.

to_show_mate([], Mate) -> Mate;
to_show_mate([#{id := RoleId, name := Name, sex := Sex,
                classes := Classes, lev := Lev}
              | T],
             Mate) ->
    to_show_mate(T,
                 [{RoleId, Name, Sex, Classes, Lev} | Mate]).

to_thumb_mate([], Mate) -> Mate;
to_thumb_mate([#{id := Id} | T], Mate) ->
    to_thumb_mate(T, [Id | Mate]).

send_reward(Role = #role{id = RoleId, name = Name},
            {Rewards, Result, ReduceFlag}) ->
    Gain = format:val_to_gain(Rewards),
    Msg = lang:get("段位赛战斗"),
    case ReduceFlag of
        1 ->
            notice:send(Role, 3, lang:get("当前已经完成10场战斗，无法再获得奖励")),
            Role;
        _ ->
            case role_gain:do_notice(Gain, Role, Msg) of
                {false, #gain{reason = bag_full}} ->
                    mail_reward(RoleId, Rewards, Result),
                    Role;
                {false, Err} ->
                    logger:error("~ts在段位赛结束时无法获得奖励:~w, Gain:~w",
                                 [Name, Err, Gain],
                                 qualifying_mgr,
                                 712),
                    Role;
                {ok, NewRole} -> NewRole
            end
    end;
send_reward(Role, _) -> Role.

mail_reward(_RoleId, [], _Result) -> skip;
mail_reward(RoleId, Rewards, Result) ->
    Items = Rewards,
    Title = lang:get("时空段位赛奖励"),
    Content = util:flist(lang:get("上次战斗结果~ts, 获得如下奖励"),
                         [qualifying_util:result_to_msg(Result)]),
    mail:send(RoleId,
              #{items => Items, title => Title, content => Content}).

do_combat_over(Role = #role{name = _Name,
                            s_event = _Sevent, m_qualifying = Mqua},
               UpdateInfo, GetMate, GainFlag) ->
    logger:debug("[~ts]在[~w]状态下更新战斗结果",
                 [_Name, _Sevent],
                 qualifying_mgr,
                 731),
    put(qualifying_team_mate, GetMate),
    NewMqua = Mqua#m_qualifying{sign_type = 0},
    Role1 = Role#role{m_qualifying = NewMqua},
    Role2 = qualifying_util:update_role_cache(Role1,
                                              UpdateInfo),
    Role3 = send_reward(Role2, GainFlag),
    {ok, Role3}.

do_sign_up_result(_Source, _Flag, [],
                  _QualifyingType) ->
    ok;
do_sign_up_result(local, Flag, [RoleId | T],
                  QualifyingType) ->
    case role_query:pid(by_id, RoleId) of
        {ok, Pid} ->
            case Flag of
                true ->
                    case catch role:apply(sync,
                                          Pid,
                                          {fun do_signup_suc/2,
                                           [QualifyingType]})
                        of
                        true ->
                            role:pack_send(Pid, 13500, {1, lang:get("报名成功")});
                        {false, Reason} ->
                            role:pack_send(Pid, 13500, {0, Reason}),
                            qualifying_util:cancel_match(get({local_match,
                                                              QualifyingType}),
                                                         [RoleId]);
                        _Err ->
                            logger:error("角色[~w]报名[Type=~w]成功后修改角色event失败:~w, "
                                         "取消报名",
                                         [RoleId, QualifyingType, _Err],
                                         qualifying_mgr,
                                         753),
                            role:pack_send(Pid,
                                           13500,
                                           {0, lang:get("报名失败,请重新报名")}),
                            qualifying_util:cancel_match(get({local_match,
                                                              QualifyingType}),
                                                         [RoleId])
                    end;
                {false, Reason} ->
                    role:pack_send(Pid, 13500, {0, Reason})
            end;
        _ ->
            qualifying_util:cancel_match(get({local_match,
                                              QualifyingType}),
                                         [RoleId])
    end,
    do_sign_up_result(local, Flag, T, QualifyingType);
do_sign_up_result(_, _, _, _) -> ok.

do_signup_suc(Role = #role{name = Name, s_event = 5,
                           m_qualifying = Mqua},
              1) ->
    case Mqua of
        #m_qualifying{sign_type = 0} ->
            NewMqua = Mqua#m_qualifying{sign_type = 1},
            NewRole = Role#role{m_qualifying = NewMqua},
            qualifying_util:push_13511(NewRole),
            {ok, true, NewRole};
        _ ->
            {ok,
             {false,
              util:flist(lang:get("~ts已经在匹配中，请先取消匹配"), [Name])},
             Role}
    end;
do_signup_suc(Role = #role{name = Name}, _) ->
    {ok,
     {false,
      util:flist(lang:get("~ts不在段位赛准备区，请先进入准备区"), [Name])},
     Role}.

init_local_match() ->
    init_local_match(1),
    ok.

init_local_match(QualifyingType) ->
    case qualifying_match:start_link(QualifyingType) of
        {ok, MatchPid} ->
            put({local_match, QualifyingType}, MatchPid);
        _Err ->
            logger:error("创建本地匹配进程失败[~w]",
                         [QualifyingType],
                         qualifying_mgr,
                         793)
    end.

do_local_sign_up(QualifyingType, QualifyingRoles,
                 Pids) ->
    SignList = get(signing_up_roles),
    case can_sign_up(QualifyingRoles, SignList) of
        true ->
            do_local_sign_up(QualifyingType,
                             QualifyingRoles,
                             QualifyingRoles,
                             Pids);
        {false, _Name} ->
            lists:foreach(fun ({_, Pid}) ->
                                  role:pack_send(Pid,
                                                 13500,
                                                 {0,
                                                  lang:get("正在段位赛报名等待中,请等待回复")})
                          end,
                          Pids)
    end.

do_local_sign_up(QualifyingType, [], QualifyingRoles,
                 _Pids) ->
    RoleIds = [RoleId
               || #qualifying_role{id = RoleId} <- QualifyingRoles],
    erlang:send_after(5000,
                      self(),
                      {remove_signing_up_roles, RoleIds}),
    qualifying_util:send_sign_up_to_match(get({local_match,
                                               QualifyingType}),
                                          QualifyingRoles),
    ok;
do_local_sign_up(QualifyingType,
                 [#qualifying_role{} | T], QualifyingRoles, Pids) ->
    do_local_sign_up(QualifyingType,
                     T,
                     QualifyingRoles,
                     Pids).

can_sign_up([], _) -> true;
can_sign_up([#qualifying_role{id = RoleId, name = Name}
             | T],
            SignList) ->
    case lists:member(RoleId, SignList) of
        true -> {false, Name};
        false -> can_sign_up(T, SignList)
    end.

get_idel_time() ->
    case agenda_data:get(2002) of
        #{args := Days} ->
            date:week_next_diff(Days, 21 * 3600 + 25 * 60) * 1000;
        _Err ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2002, _Err],
                         qualifying_mgr,
                         829),
            undefined
    end.

add_count(RoleId = {_, P, Z}, QualifyingType) ->
    cross:cast(P,
               Z,
               qualifying_mgr,
               local_add_count,
               [RoleId, QualifyingType]);
add_count(_, _) -> ok.

local_add_count(RoleId, QualifyingType) ->
    Now = date:unixtime(),
    case catch ets:lookup(qualifying_role_log, RoleId) of
        [{RoleId, LogList}] ->
            case lists:keyfind(QualifyingType, 1, LogList) of
                {QualifyingType, LastTime, Count} ->
                    case date:is_today(LastTime) of
                        true ->
                            NewLog = {QualifyingType, Now, Count + 1},
                            NewLogList = lists:keyreplace(QualifyingType,
                                                          1,
                                                          LogList,
                                                          NewLog),
                            NewRoleLog = {RoleId, NewLogList},
                            insert_log(NewRoleLog);
                        false ->
                            NewLog = {QualifyingType, Now, 1},
                            NewLogList = lists:keyreplace(QualifyingType,
                                                          1,
                                                          LogList,
                                                          NewLog),
                            NewRoleLog = {RoleId, NewLogList},
                            insert_log(NewRoleLog)
                    end;
                _ ->
                    NewLog = {QualifyingType, Now, 1},
                    NewLogList = [NewLog | LogList],
                    NewRoleLog = {RoleId, NewLogList},
                    insert_log(NewRoleLog)
            end;
        _ ->
            NewLog = {QualifyingType, Now, 1},
            NewLogList = [NewLog],
            NewRoleLog = {RoleId, NewLogList},
            insert_log(NewRoleLog)
    end.

insert_log({RoleId = {_Rid, P, Z}, Log}) ->
    cross:cast(P,
               Z,
               qualifying_mgr,
               local_insert_log,
               [{RoleId, Log}]).

local_insert_log({RoleId = {Rid, P, Z}, Log}) ->
    spawn(fun () ->
                  case role_query:pid(by_id, Rid, P, Z) of
                      {ok, Pid} ->
                          role:apply(async,
                                     Pid,
                                     {qualifying_mgr, async_log, [Log]}),
                          ok;
                      _ -> skip
                  end
          end),
    ets:insert(qualifying_role_log, {RoleId, Log}),
    dets:insert(dets_qualifying_role_log, {RoleId, Log}).

async_log(Role = #role{m_qualifying = Mqua}, Log) ->
    LogInfo = log_list_to_proto(Log),
    NewMqua = Mqua#m_qualifying{day_log = LogInfo},
    NewRole = Role#role{m_qualifying = NewMqua},
    qualifying_util:push_13511(NewRole),
    {ok, NewRole}.

get_count(#role{id = RoleId}, QualifyingType) ->
    case catch ets:lookup(qualifying_role_log, RoleId) of
        [{RoleId, LogList}] ->
            case lists:keyfind(QualifyingType, 1, LogList) of
                {QualifyingType, LastTime, Count} ->
                    case date:is_today(LastTime) of
                        true -> Count;
                        false -> 0
                    end;
                _ -> 0
            end;
        [] -> 0;
        _ -> false
    end.

get_all_count(#role{id = RoleId}) ->
    List = case catch ets:lookup(qualifying_role_log,
                                 RoleId)
               of
               [{_, LogList}] -> LogList;
               [] -> [];
               _ -> error
           end,
    log_list_to_proto(List).

log_list_to_proto(error) -> [{1, 0}];
log_list_to_proto([]) -> [{1, 0}];
log_list_to_proto(LogList) ->
    Count33 = case lists:keyfind(1, 1, LogList) of
                  {_, LastTime3, Count3} ->
                      case date:is_today(LastTime3) of
                          true -> Count3;
                          false -> 0
                      end;
                  _ -> 0
              end,
    [{1, Count33}].

notify_match_start(#state{mode = 3}) -> ok;
notify_match_start(_) ->
    do_notify_match_start(get({local_match, 1})),
    ok.

do_notify_match_start(MatchPid) when is_pid(MatchPid) ->
    MatchPid ! start;
do_notify_match_start(_MatchPid) -> skip.

notify_match_stop() ->
    do_notify_match_stop(get({local_match, 1})),
    ok.

do_notify_match_stop(MatchPid) when is_pid(MatchPid) ->
    MatchPid ! stop;
do_notify_match_stop(_MatchPid) -> skip.

idel_to_notice() ->
    Msg =
        notice:format(lang:get("~ts将在~ts后开启，快快整顿装备，进入赛场，准备大干一场吧！"),
                      [{string_2, 1, lang:get("时空段位赛")},
                       {string_2, 1, lang:get("5分钟")}]),
    notice:cast(all, 8, Msg),
    SeasonEndTime = case ets:lookup(qualifying_season_info,
                                    1)
                        of
                        [#qualifying_season_data{end_time = EndTime}] ->
                            EndTime;
                        _ -> 0
                    end,
    role_group:pack_send(world,
                         13502,
                         {1, 180, SeasonEndTime}),
    logger:info("时空段位赛活动准备区开放, 进入准备区",
                [],
                qualifying_mgr,
                964),
    ok.

notice_to_active() ->
    Msg =
        notice:format(lang:get("~ts活动开始啦，魔法与刀剑，实力与配合，快来一决高下!"),
                      [{string_2, 1, lang:get("时空段位赛")}]),
    notice:cast(all, 8, Msg),
    SeasonEndTime = case ets:lookup(qualifying_season_info,
                                    1)
                        of
                        [#qualifying_season_data{end_time = EndTime}] ->
                            EndTime;
                        _ -> 0
                    end,
    role_group:pack_send(world,
                         13502,
                         {2, 3600, SeasonEndTime}),
    logger:info("时空段位赛活动匹配开启, 持续一小时",
                [],
                qualifying_mgr,
                977),
    erlang:send_after(5 * 60 * 1000, self(), cast_active),
    ok.

reset_news(State) ->
    State#state{news = [], news_status = []}.

update_news(News, NewsStatus,
            Mark = #qualifying_role_mark{}, Result, TeamMate) ->
    {NewsStatus1, AddNews} =
        qualifying_news:check_new(Result,
                                  Mark,
                                  TeamMate,
                                  NewsStatus),
    logger:debug("NewsStatus1:~w, AddNews:~w",
                 [NewsStatus1, AddNews],
                 qualifying_mgr,
                 990),
    News1 = lists:sublist(AddNews ++ News, 10),
    {News1, NewsStatus1};
update_news(News, NewsStatus, _, _, _) ->
    {News, NewsStatus}.

create_pre_zone(local, State = #state{is_cross = 1}) ->
    State;
create_pre_zone(local, State = #state{}) ->
    ZoneList = do_create_pre_zone(2, []),
    State#state{zone_list = ZoneList}.

do_create_pre_zone(Seq, ZoneList) when Seq =< 0 ->
    ZoneList;
do_create_pre_zone(Seq, ZoneList) ->
    case do_create_map(Seq) of
        {true, Seq, ZonePid} ->
            do_create_pre_zone(Seq - 1,
                               [{Seq, ZonePid} | ZoneList]);
        false -> do_create_pre_zone(Seq - 1, ZoneList)
    end.

do_create_map(Seq) ->
    case qualifying_zone:start_link(Seq) of
        {ok, ZonePid} -> {true, Seq, ZonePid};
        _Err ->
            logger:error("开启段位赛准备区失败:~w:~w",
                         [Seq, _Err],
                         qualifying_mgr,
                         1019),
            false
    end.

stop_all_zone(#state{zone_list = ZoneList}) ->
    stop_all_zone(ZoneList);
stop_all_zone([]) -> ok;
stop_all_zone([{_Seq, ZonePid} | T])
    when is_pid(ZonePid) ->
    logger:debug("ZonePid:~w",
                 [ZonePid],
                 qualifying_mgr,
                 1030),
    ZonePid ! time_out,
    stop_all_zone(T);
stop_all_zone([_ | T]) -> stop_all_zone(T).

ending_all_zone(#state{zone_list = ZoneList}) ->
    ending_all_zone(ZoneList);
ending_all_zone([]) -> ok;
ending_all_zone([{_Seq, ZonePid} | T])
    when is_pid(ZonePid) ->
    ZonePid ! ending,
    ending_all_zone(T);
ending_all_zone([_ | T]) -> ending_all_zone(T).

get_win(1) -> 1;
get_win(2) -> 1;
get_win(_) -> 0.

idel(timeout, State = #state{status = close}) ->
    logger:info("活动关闭中,暂时不开放,再次进入idel状态",
                [],
                qualifying_mgr,
                1056),
    {next_state,
     idel,
     State#state{ts = erlang:now(), timeout = 3600 * 1000},
     3600 * 1000};
idel(timeout, State) ->
    put(signing_up_roles, []),
    ets:delete_all_objects(qualifying_role_match),
    ets:delete_all_objects(qualifying_zone_role),
    State1 = State#state{ts = erlang:now(),
                         timeout = 5 * 60 * 1000},
    State2 = reset_news(State1),
    stop_all_zone(State2),
    State3 = create_pre_zone(local, State2),
    idel_to_notice(),
    {next_state, notice, State3, 5 * 60 * 1000};
idel(_Any, State) -> continue(idel, State).

notice(timeout, State = #state{status = close}) ->
    logger:info("活动关闭中,暂时不开放,再次进入idel状态",
                [],
                qualifying_mgr,
                1077),
    IdelTime = get_idel_time(),
    logger:info("时空段位赛正式关闭,下次开启时间[~w]",
                [IdelTime],
                qualifying_mgr,
                1079),
    erlang:send_after(30 * 1000,
                      self(),
                      {clean_match, keep}),
    stop_all_zone(State),
    qualifying_rank:update_data_to_rank(),
    {next_state,
     idel,
     State#state{ts = erlang:now(), timeout = IdelTime,
                 zone_list = []},
     IdelTime};
notice(timeout, State) ->
    case ets:lookup(qualifying_season_info, 1) of
        [QS = #qualifying_season_data{count = Count}] ->
            NewQs = QS#qualifying_season_data{count = Count + 1},
            ets:insert(qualifying_season_info, NewQs),
            dets:insert(qualifying_season_info, NewQs);
        _ -> init_season_data()
    end,
    notify_match_start(State),
    notice_to_active(),
    {next_state,
     active,
     State#state{ts = erlang:now(),
                 timeout = 60 * 60 * 1000},
     60 * 60 * 1000};
notice(_Any, State) -> continue(notice, State).

active(timeout, State = #state{}) ->
    notify_match_stop(),
    logger:info("时空段位赛关闭匹配,进入收尾阶段",
                [],
                qualifying_mgr,
                1105),
    Msg =
        notice:format(lang:get("~ts活动结束了，激烈的比拼过后，快来排行榜看看今天又涌现出哪些强者！"),
                      [{string_2, 1, lang:get("时空段位赛")}]),
    notice:cast(all, 8, Msg),
    SeasonEndTime = case ets:lookup(qualifying_season_info,
                                    1)
                        of
                        [#qualifying_season_data{end_time = EndTime}] ->
                            EndTime;
                        _ -> 0
                    end,
    role_group:pack_send(world,
                         13502,
                         {0, 0, SeasonEndTime}),
    ending_all_zone(State),
    {next_state,
     ending,
     State#state{ts = erlang:now(),
                 timeout = 15 * 60 * 1000},
     15 * 60 * 1000};
active(_Any, State) ->
    logger:debug("不处理消息：~w", [_Any], qualifying_mgr, 1116),
    continue(active, State).

ending(timeout, State = #state{}) ->
    IdelTime = get_idel_time(),
    logger:info("时空段位赛正式关闭,下次开启时间[~w]",
                [IdelTime],
                qualifying_mgr,
                1122),
    erlang:send_after(30 * 1000,
                      self(),
                      {clean_match, keep}),
    stop_all_zone(State),
    qualifying_rank:update_data_to_rank(),
    {next_state,
     idel,
     State#state{ts = erlang:now(), timeout = IdelTime,
                 zone_list = []},
     IdelTime};
ending(_Any, State) ->
    logger:debug("不处理消息：~w", [_Any], qualifying_mgr, 1129),
    continue(ending, State).

continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

reset_qualifying_role_mark() ->
    case catch ets:lookup(qualifying_season_info, 1) of
        [SeasonData = #qualifying_season_data{count = Count}] ->
            case Count >= 7 andalso
                     date:day_of_the_week(date()) =:= 6
                of
                true ->
                    ChampionList = query_champion(),
                    send_season_reward(ChampionList),
                    EndTime = calca_season_endtime(),
                    NewSeasonData =
                        SeasonData#qualifying_season_data{champion_list =
                                                              ChampionList,
                                                          count = 0,
                                                          end_time = EndTime},
                    case ChampionList of
                        [#qualifying_role_mark{name = FName},
                         #qualifying_role_mark{name = SName},
                         #qualifying_role_mark{name = TName}
                         | _] ->
                            Msg =
                                notice:format(lang:get("~ts本赛季已经圆满谢幕，~ts、~ts、~ts等人名列前茅成为了本赛季楷模，他们的形象将"
                                                       "被打造成雕像出现在段位赛赛场内，前~ts名选手获得了~ts称号，祝贺他们{face_1,1"
                                                       "8}"),
                                              [{string_2, 1, lang:get("时空段位赛")},
                                               {role_2, FName},
                                               {role_2, SName},
                                               {role_2, TName},
                                               {string_2, 1, 10},
                                               {honor_1, 30111}]),
                            notice:cast(all, 5, Msg);
                        _ -> skip
                    end,
                    qualifying_rank:reset(),
                    ets:insert(qualifying_season_info, NewSeasonData),
                    dets:insert(qualifying_season_info, NewSeasonData);
                false -> update_season_endtime()
            end;
        _ -> skip
    end.

query_champion() ->
    MinFun = fun (#qualifying_role_mark{rank_point = S1},
                  #qualifying_role_mark{rank_point = S2}) ->
                     S1 < S2;
                 (_, _) -> false
             end,
    MaxFun = fun (#qualifying_role_mark{rank_point = S1},
                  #qualifying_role_mark{rank_point = S2}) ->
                     S1 > S2;
                 (_, _) -> false
             end,
    CalcChampionFun = fun (Qua = #qualifying_role_mark{},
                           ResultList) ->
                              case length(ResultList) of
                                  10 ->
                                      MinQua = #qualifying_role_mark{id =
                                                                         MinRoleId} =
                                                   lists_ext:min(MinFun,
                                                                 ResultList),
                                      case MinFun(Qua, MinQua) of
                                          true -> ResultList;
                                          false ->
                                              lists:keystore(MinRoleId,
                                                             #qualifying_role_mark.id,
                                                             ResultList,
                                                             Qua)
                                      end;
                                  _ -> [Qua | ResultList]
                              end;
                          (_R, ResultList) -> ResultList
                      end,
    ChampionList = ets:foldl(CalcChampionFun,
                             [],
                             qualifying_role_mark),
    lists:sort(MaxFun, ChampionList).

init_season_data() ->
    EndTime = calca_season_endtime(),
    SeasonData = #qualifying_season_data{end_time =
                                             EndTime},
    ets:insert(qualifying_season_info, SeasonData),
    dets:insert(qualifying_season_info, SeasonData).

calca_season_endtime() ->
    Week = date:day_of_the_week(date()),
    AddDay = case Week >= 6 of
                 true -> 21 + (6 - Week);
                 false -> 14 + (6 - Week)
             end,
    date:unixtime() + date:now_diff(AddDay, {23, 0, 0}).

update_season_endtime() ->
    logger:debug("更新预算赛季结束时间", [], qualifying_mgr, 1213),
    Week = date:day_of_the_week(date()),
    case catch ets:lookup(qualifying_season_info, 1) of
        [SeasonData = #qualifying_season_data{count = Count}] ->
            AddDay = get_addday(Count, Week),
            EndTime = date:unixtime() +
                          date:now_diff(AddDay, {23, 0, 0}),
            NewSeasonData =
                SeasonData#qualifying_season_data{end_time = EndTime},
            ets:insert(qualifying_season_info, NewSeasonData),
            dets:insert(qualifying_season_info, NewSeasonData);
        _ -> skip
    end.

send_season_reward(ChampionList) ->
    honor_mgr:clear(qualifying_champion_honor),
    Fun = fun (Qua = #qualifying_role_mark{id = Id,
                                           rank_point = RankPoint,
                                           season_max_rank_point =
                                               SeasonMaxPoint},
               ResultList) ->
                  SeasonRankLev =
                      qualifying_data:point_to_lev(SeasonMaxPoint),
                  case SeasonRankLev of
                      0 -> ResultList;
                      _ ->
                          #{gain := RewardList, rank_type_name := RankName,
                            new_point := NewPoint} =
                              qualifying_data:get_final_reward(SeasonRankLev),
                          NewRankLev = qualifying_data:point_to_lev(NewPoint),
                          #{rank_type_name := NewRankName} =
                              qualifying_data:get_final_reward(NewRankLev),
                          Items = RewardList,
                          Title = lang:get("时空段位赛赛季结算奖励"),
                          Content = case lists:keymember(Id,
                                                         #qualifying_role_mark.id,
                                                         ChampionList)
                                        of
                                        true ->
                                            notice:format(lang:get("历经一整个时空段位赛赛季，你结识了无数战友，遭遇了无数强敌，全力拼搏，最高达到了获得了~t"
                                                                   "s积分，跻身~ts段位, 并获得了~ts称号。以下是你的赛季奖励，由于上个赛季的突出表现，"
                                                                   "新赛季你将以~ts段位作为起点！总结好经验，约上默契战友，向着新的赛季，进军!"),
                                                          [{string_2,
                                                            1,
                                                            SeasonMaxPoint},
                                                           {string_2,
                                                            5,
                                                            RankName},
                                                           {honor_1, 30111},
                                                           {string_2,
                                                            5,
                                                            NewRankName}]);
                                        false ->
                                            notice:format(lang:get("历经一整个时空段位赛赛季，你结识了无数战友，遭遇了无数强敌，全力拼搏，最高达到了~ts积分"
                                                                   "，跻身~ts段位。以下是你的赛季奖励，由于上个赛季的突出表现，新赛季你将以~ts段位作为起"
                                                                   "点！总结好经验，约上默契战友，向着新的赛季，进军!"),
                                                          [{string_2,
                                                            1,
                                                            RankPoint},
                                                           {string_2,
                                                            5,
                                                            RankName},
                                                           {string_2,
                                                            5,
                                                            NewRankName}])
                                    end,
                          mail:send(Id,
                                    #{items => Items, title => Title,
                                      content => Content}),
                          RankType = case qualifying_data:get(NewRankLev) of
                                         #qualifying_rank_data{rank_type =
                                                                   Rt} ->
                                             Rt;
                                         _ -> 0
                                     end,
                          [Qua#qualifying_role_mark{rank_point = NewPoint,
                                                    rank_lev = NewRankLev,
                                                    rank_type = RankType,
                                                    season_max_rank_point =
                                                        NewPoint,
                                                    up_ranklev_reward = []}
                           | ResultList]
                  end;
              (_R, ResultList) -> ResultList
          end,
    ResultDealList = ets:foldl(Fun,
                               [],
                               qualifying_role_mark),
    logger:debug("奖励发送后:~w",
                 [ResultDealList],
                 qualifying_mgr,
                 1258),
    TitleRoleIds = [{Id, 30111}
                    || #qualifying_role_mark{id = Id} <- ChampionList],
    EndTime = calca_season_endtime(),
    honor_mgr:add(qualifying_champion_honor,
                  TitleRoleIds,
                  EndTime),
    case ResultDealList of
        [_ | _] ->
            lists:foreach(fun insert_mark/1, ResultDealList);
        _Err ->
            logger:error("ResultDealList:~w",
                         [_Err],
                         qualifying_mgr,
                         1270)
    end.

gm_season_clac_final_reward() ->
    case catch ets:lookup(qualifying_season_info, 1) of
        [SeasonData = #qualifying_season_data{}] ->
            ChampionList = query_champion(),
            send_season_reward(ChampionList),
            EndTime = calca_season_endtime(),
            NewSeasonData =
                SeasonData#qualifying_season_data{champion_list =
                                                      ChampionList,
                                                  count = 0,
                                                  end_time = EndTime},
            case ChampionList of
                [#qualifying_role_mark{name = FName},
                 #qualifying_role_mark{name = SName},
                 #qualifying_role_mark{name = TName}
                 | _] ->
                    Msg =
                        notice:format(lang:get("~ts本赛季已经圆满谢幕，~ts、~ts、~ts等人名列前茅成为了本赛季楷模，他们的形象将"
                                               "被打造成雕像出现在段位赛赛场内，前~ts名选手获得了~ts称号，祝贺他们{face_1,1"
                                               "8}"),
                                      [{string_2, 1, lang:get("时空段位赛")},
                                       {role_2, FName},
                                       {role_2, SName},
                                       {role_2, TName},
                                       {string_2, 1, 10},
                                       {honor_1, 30111}]),
                    notice:cast(all, 5, Msg);
                _ -> skip
            end,
            qualifying_rank:reset(),
            ets:insert(qualifying_season_info, NewSeasonData),
            dets:insert(qualifying_season_info, NewSeasonData);
        _ -> skip
    end.

get_addday(Count, Week) ->
    LeftWeek = 3 - Count div 3 rem 3,
    case Week >= 6 of
        true -> LeftWeek * 7 + (6 - Week);
        false -> (LeftWeek - 1) * 7 + (6 - Week)
    end.

check_open_mode(_IsCross = 1) -> 2;
check_open_mode(_) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    case qualifying_data:get_cross_group({Platform, ZoneId})
        of
        false -> 1;
        _ -> 3
    end.

