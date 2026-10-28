-file("src/mod/friend/friend.erl", 1).

-module(friend).

-behaviour(gen_server).

-export([start_link/0,
         init/0,
         login/1,
         fetch/2,
         fetch_cross/2,
         list/1,
         list_all/1,
         list_id/1,
         list_all_id/1,
         list_friend_ship/1,
         get_num/1,
         list_role/1,
         list_all_role/1,
         set_signature/2,
         set_offline_push/2,
         request/2,
         add_request/2,
         get_request/3,
         reply_request/3,
         fetch_reply_friend/2,
         update_target_reply/5,
         blacklist/2,
         delete/2,
         update_target_delete/2,
         is_friend/2,
         is_cross_friend/2,
         is_blacklist/2,
         push/3,
         recommand/2,
         get_requests/1,
         apply_evt/2,
         apply_role/2,
         give_present/3,
         give_present/4,
         rename/2,
         reward_popularity/2,
         combat_add_intimacy/2,
         get_intimacy/2,
         send_friend_mail/4,
         update/2,
         update_cache/2,
         add_intimacy/3,
         add_intimacy_and_push/4,
         make_friend/2,
         reset_intimacy/2,
         fix_friend_cross/0,
         give_quest_offer_present/3,
         get_leader_present/2,
         update_quest_offer_present/3,
         match_friendship/2,
         gm_cmd/3]).

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

-file("src/mod/friend/friend.erl", 67).

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

-file("src/mod/friend/friend.erl", 68).

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

-file("src/mod/friend/friend.erl", 69).

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

-file("src/mod/friend/friend.erl", 70).

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

-file("src/mod/friend/friend.erl", 71).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/friend/friend.erl", 72).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/friend/friend.erl", 73).

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

-file("src/mod/friend/friend.erl", 74).

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

-file("src/mod/friend/friend.erl", 75).

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

-file("src/mod/friend/friend.erl", 76).

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

-file("src/mod/friend/friend.erl", 77).

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

-file("src/mod/friend/friend.erl", 78).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/friend/friend.erl", 79).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/friend/friend.erl", 80).

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

-file("src/mod/friend/friend.erl", 81).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/friend/friend.erl", 82).

-record(state, {started = 0}).

-spec init() -> #m_friend{}.

init() -> #m_friend{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{id = RoleId}) ->
    L = [#trigger{label = evt_logout, a = [], m = friend,
                  f = apply_evt},
         #trigger{label = evt_levup, a = [], m = friend,
                  f = apply_evt},
         #trigger{label = evt_guild, a = [], m = friend,
                  f = apply_evt},
         #trigger{label = evt_fc, a = [], m = friend,
                  f = apply_evt},
         #trigger{label = evt_guild_leave, a = [], m = friend,
                  f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    {ok, R0} = role_convert:to(friend_role, NRole),
    update_cache(friend_role,
                 R0#friend_role{update_time = date:unixtime()}),
    cast_online(Role, R0),
    load_friendship(RoleId),
    {ok, NRole}.

rename(Role, _OldName) ->
    {ok, R0} = role_convert:to(friend_role, Role),
    update_cache(friend_role, R0),
    refresh_push(Role),
    ok.

-spec fetch(Id :: tuple()) -> #friend_role{} | none.

fetch(Id) -> fetch(by_id, Id).

fetch(by_name, {Name, P, Z}) ->
    case ets:lookup(friend_role_index, {Name, P, Z}) of
        [{_, Id}] -> fetch(by_id, Id);
        _ -> none
    end;
fetch(by_id, Id) ->
    case role_misc:is_local_role(Id) of
        true ->
            case lookup_role(Id) of
                {true, F = #friend_role{}} -> F;
                _ -> none
            end;
        false ->
            case lookup_cross_role(Id) of
                {true, F = #friend_role{}} -> F;
                _ -> none
            end
    end.

fetch_cross(by_id, Id) ->
    case lookup_cross_role(Id) of
        {true, F = #friend_role{}} -> F;
        _ -> none
    end.

lookup_role(RoleId) ->
    case ets:lookup(friend_role, RoleId) of
        [F = #friend_role{}] -> {true, F};
        _ ->
            case dets:lookup(friend_role, RoleId) of
                [FriendRole] ->
                    case friend_ver:do_role(FriendRole) of
                        {false, Reason} ->
                            logger:error("好友数据转换失败:~w", [Reason], friend, 204),
                            false;
                        {ok,
                         NewFriendRole = #friend_role{id = Id = {_, P, Z},
                                                      name = Name}} ->
                            ets:insert(friend_role_index, {{Name, P, Z}, Id}),
                            ets:insert(friend_role, NewFriendRole),
                            {true, NewFriendRole}
                    end;
                _ -> false
            end
    end.

lookup_cross_role(RoleId) ->
    case ets:lookup(friend_role_cross, RoleId) of
        [F = #friend_role{}] -> {true, F};
        _ ->
            case dets:lookup(friend_role_cross, RoleId) of
                [FriendRole] ->
                    case friend_ver:do_role(FriendRole) of
                        {false, Reason} ->
                            logger:error("好友数据转换失败:~w", [Reason], friend, 225),
                            false;
                        {ok, NewFriendRole = #friend_role{}} ->
                            ets:insert(friend_role_cross, NewFriendRole),
                            {true, NewFriendRole}
                    end;
                _ -> false
            end
    end.

get_intimacy(Id, OtherId) ->
    case match_friendship(Id, OtherId) of
        #friendship{intimacy = Intimacy} -> Intimacy;
        _ -> 0
    end.

-spec list(#role{} |
           {pos_integer(),
            string(),
            pos_integer()}) -> {[{#friendship{}, #friend_role{}}]}.

list(#role{id = Id}) -> list(Id);
list(Id) ->
    L = ets:lookup(friendship, Id),
    L1 = [Fs
          || Fs = #friendship{id = Tid} <- L,
             role_misc:is_local_role(Tid) =:= true],
    find_friends(L1).

list_all(#role{id = Id}) -> list_all(Id);
list_all(Id) ->
    L = ets:lookup(friendship, Id),
    find_friends(L).

list_role(#role{id = Id}) -> list_role(Id);
list_role(Id) ->
    L = ets:lookup(friendship, Id),
    IdList = [Tid
              || #friendship{id = Tid, type = 0} <- L,
                 role_misc:is_local_role(Tid) =:= true],
    find_friend_role(IdList, []).

list_all_role(#role{id = Id}) -> list_role(Id);
list_all_role(Id) ->
    L = ets:lookup(friendship, Id),
    IdList = [Tid || #friendship{id = Tid, type = 0} <- L],
    find_friend_role(IdList, []).

-spec list_id(#role{} |
              {pos_integer(), string(), pos_integer()}) -> list().

list_id(#role{id = Id}) -> list_id(Id);
list_id(Id) ->
    L = ets:lookup(friendship, Id),
    [FriendId
     || #friendship{id = FriendId, type = 0} <- L,
        role_misc:is_local_role(FriendId) =:= true].

list_all_id(#role{id = Id}) -> list_all_id(Id);
list_all_id(Id) ->
    L = ets:lookup(friendship, Id),
    [FriendId || #friendship{id = FriendId, type = 0} <- L].

list_friend_ship(#role{id = Id}) ->
    list_friend_ship(Id);
list_friend_ship(Id) ->
    L = ets:lookup(friendship, Id),
    [Fr
     || Fr = #friendship{id = FriendId, type = 0} <- L,
        role_misc:is_local_role(FriendId) =:= true].

send_friend_mail(Role, Title, Content, ItemList) ->
    IdList = list_id(Role),
    lists:foreach(fun (RoleId) ->
                          mail:send(RoleId,
                                    #{title => Title, content => Content,
                                      items => ItemList})
                  end,
                  IdList),
    ok.

-spec set_signature(Role :: #role{},
                    Signature :: string()) -> {ok, NewRole :: #role{}} |
                                              {false, Why :: string()}.

set_signature(Role = #role{m_friend = Mf}, Signature) ->
    Role1 = Role#role{m_friend =
                          Mf#m_friend{signature = Signature}},
    {ok, FR} = role_convert:to(friend_role, Role1),
    update(friend_role, FR),
    refresh_push(Role1),
    {ok, Role1}.

-spec set_offline_push(Role :: #role{},
                       Signature :: string()) -> {ok, NewRole :: #role{}} |
                                                 {false, Why :: string()}.

set_offline_push(Role = #role{m_friend = Mf},
                 OfflinePush) ->
    Role1 = Role#role{m_friend =
                          Mf#m_friend{offline_push = OfflinePush}},
    {ok, FR} = role_convert:to(friend_role, Role1),
    update(friend_role, FR),
    push(Role1, 11800, ok),
    {ok, Role1}.

-spec request(#role{}, Target :: tuple()) -> ok |
                                             {false, Why :: string()}.

request(#role{id = Target}, Target) -> ok;
request(Role = #role{id = Owner, lev = Lev,
                     charge = Charge},
        Target) ->
    CountLimit = var:get_var(Role, day, 628, 0),
    MaxCount = case Charge of
                   _ when Charge =< 0 -> 15;
                   _ when Charge =< 300 -> 30;
                   _ -> 9999
               end,
    case CountLimit >= MaxCount of
        true -> {false, lang:get("今日可添加好友数量已达到上限{face_1,2}")};
        _ ->
            case match_friendship(Owner, Target) of
                #friendship{type = 0} ->
                    notice:return(lang:get("对方已经是你好友")),
                    ok;
                #friendship{type = 1} ->
                    notice:return(lang:get("您已经向对方申请过了，耐心等待回复吧")),
                    ok;
                _ ->
                    case role_misc:is_local_role(Target) of
                        true -> do_request(Role, Target, local);
                        false when Lev >= 40 -> do_request(Role, Target, cross);
                        _ ->
                            notice:return(lang:get("40级之后才能添加跨服好友")),
                            ok
                    end
            end
    end.

-spec reply_request(#role{}, Target :: tuple(),
                    1 | 0) -> ok | {false, Why :: string()}.

reply_request(Role = #role{id = Owner}, Target, Type) ->
    case get_request(Owner, Target, local) of
        none -> {false, lang:get("邀请已过期")};
        _ ->
            case match_friendship(Owner, Target) of
                #friendship{type = 0} ->
                    del_request(Owner, Target),
                    {false, lang:get("对方已经是你好友了")};
                #friendship{type = 1} ->
                    del_request(Owner, Target),
                    {false, lang:get("对方在你黑名单中")};
                _ -> do_reply_request(Role, Target, Type)
            end
    end.

-spec blacklist(#role{}, Target :: tuple()) -> ok |
                                               {false, Why :: string()}.

blacklist(Role = #role{id = Owner},
          Target = {P, Z, _}) ->
    case match_friendship(Owner, Target) of
        #friendship{type = 0} ->
            notice:return(lang:get("您和Ta是好友关系，不能拉黑哟{face_1,1}")),
            false;
        #friendship{type = 1} ->
            notice:return(lang:get("Ta已经在您的黑名单里了，不用再拉黑哟{face_1,1}")),
            false;
        _ ->
            case fetch(Target) of
                FTarget = #friend_role{} ->
                    Ship1 = #friendship{owner = Owner, id = Target,
                                        type = 1, ct = date:unixtime()},
                    save_friendship(Ship1),
                    push(Role,
                         11802,
                         {1,
                          [{#friendship{owner = Owner, id = Target, type = 1},
                            FTarget}]}),
                    ok;
                _ ->
                    case big_world:call(P, Z, friend, fetch, [Target]) of
                        FTarget2 = #friend_role{} ->
                            Ship1 = #friendship{owner = Owner, id = Target,
                                                type = 1, ct = date:unixtime()},
                            save_friendship(Ship1),
                            push(Role,
                                 11802,
                                 {1,
                                  [{#friendship{owner = Owner, id = Target,
                                                type = 1},
                                    FTarget2}]}),
                            ok;
                        _Err ->
                            logger:info("~w", [_Err], friend, 402),
                            notice:return(lang:get("暂时无法列入黑名单")),
                            false
                    end
            end
    end.

-spec delete(#role{}, Target :: tuple()) -> ok |
                                            {false, Why :: string()}.

delete(Role = #role{id = Owner, m_friend = MF},
       TargetRoleId = {_, P, Z}) ->
    case check_can_delete(Role, TargetRoleId) of
        {false, Msg} -> {false, Msg};
        true ->
            case match_friendship(Owner, TargetRoleId) of
                #friendship{type = 0} ->
                    IsLocal = role_misc:is_local_role(TargetRoleId),
                    case IsLocal of
                        true ->
                            del_friendship(Owner, TargetRoleId),
                            del_friendship(TargetRoleId, Owner),
                            case role_query:pid(by_id, TargetRoleId) of
                                {ok, Pid} ->
                                    role:apply(async,
                                               Pid,
                                               {friend,
                                                apply_role,
                                                [{delete, Owner}]});
                                _False -> ok
                            end,
                            NewMF = MF#m_friend{num = get_num(Owner)},
                            push(Role,
                                 11802,
                                 {3,
                                  [{#friendship{owner = Owner,
                                                id = TargetRoleId, type = 0},
                                    #friend_role{id = TargetRoleId}}]}),
                            {ok, Role#role{m_friend = NewMF}};
                        false ->
                            case big_world:call(P,
                                                Z,
                                                friend,
                                                update_target_delete,
                                                [Owner, TargetRoleId])
                                of
                                ok ->
                                    del_friendship(Owner, TargetRoleId),
                                    NewMF = MF#m_friend{num = get_num(Owner)},
                                    push(Role,
                                         11802,
                                         {3,
                                          [{#friendship{owner = Owner,
                                                        id = TargetRoleId,
                                                        type = 0},
                                            #friend_role{id = TargetRoleId}}]}),
                                    {ok, Role#role{m_friend = NewMF}};
                                {error, big_world_not_ready} ->
                                    {false, lang:get("跨服时空断开连接, 请稍后处理")};
                                _Err ->
                                    logger:info("跨服好友消息处理时发生异常:~w",
                                                [_Err],
                                                friend,
                                                443),
                                    {false, lang:get("跨服时空暂时不稳定, 请稍后处理")}
                            end
                    end;
                #friendship{} ->
                    del_friendship(Owner, TargetRoleId),
                    push(Role,
                         11802,
                         {3,
                          [{#friendship{owner = Owner, id = TargetRoleId,
                                        type = 1},
                            #friend_role{id = TargetRoleId}}]}),
                    ok;
                _ -> {false, lang:get("关系已经解除了")}
            end
    end.

update_target_delete(SelfRoleId, TargetRoleId) ->
    del_friendship(TargetRoleId, SelfRoleId),
    case role_query:pid(by_id, TargetRoleId) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {friend, apply_role, [{delete, SelfRoleId}]});
        _False -> ok
    end,
    ok.

-spec is_friend(#role{}, Target :: tuple()) -> true |
                                               false.

is_friend(#role{id = Owner}, Target) ->
    is_friend(Owner, Target);
is_friend(Owner, Target) ->
    case role_misc:is_local_role(Target) of
        true ->
            case match_friendship(Owner, Target) of
                #friendship{type = 0} -> true;
                _ -> false
            end;
        false -> false
    end.

-spec is_cross_friend(#role{},
                      Target :: tuple()) -> true | false.

is_cross_friend(#role{id = Owner}, Target) ->
    is_cross_friend(Owner, Target);
is_cross_friend(Owner, Target) ->
    case role_misc:is_local_role(Target) of
        false ->
            case match_friendship(Owner, Target) of
                #friendship{type = 0} -> true;
                _ -> false
            end;
        true -> false
    end.

-spec is_blacklist(#role{}, Target :: tuple()) -> true |
                                                  false.

is_blacklist(#role{id = Owner}, Target = {_, P, Z}) ->
    case match_friendship(Owner, Target) of
        #friendship{type = 1} -> true;
        _ ->
            case role_misc:is_local_role(Target) of
                true ->
                    case match_friendship(Target, Owner) of
                        #friendship{type = 1} -> true;
                        _ -> false
                    end;
                false ->
                    case big_world:call(P,
                                        Z,
                                        friend,
                                        match_friendship,
                                        [Target, Owner])
                        of
                        #friendship{type = 1} -> true;
                        _D ->
                            logger:debug("~w", [_D], friend, 511),
                            false
                    end
            end
    end.

-spec get_requests(#role{}) -> list().

get_requests(#role{id = Id}) ->
    ets:lookup(friend_request, Id).

get_num(#role{id = Id}) -> get_num(Id);
get_num(Id) -> length(list_all_id(Id)).

get_num(Id, Label) ->
    IsLocal = case Label of
                  local -> true;
                  _ -> false
              end,
    length([I
            || I <- list_all_id(Id),
               role_misc:is_local_role(I) =:= IsLocal]).

apply_evt(_Evt, #role{lev = Lev}) when Lev < 10 -> ok;
apply_evt(#evt_logout{}, Role) ->
    {ok, RF0} = role_convert:to(friend_role, Role),
    RF = RF0#friend_role{online = 0,
                         update_time = date:unixtime()},
    update(friend_role, RF),
    cast_online(Role, RF),
    remove;
apply_evt(#evt_levup{}, Role) ->
    {ok, RF} = role_convert:to(friend_role, Role),
    erlang:erase(recommand_continue),
    RF1 = RF#friend_role{update_time = date:unixtime()},
    update(friend_role, RF1),
    ok;
apply_evt(#evt_guild{}, Role) ->
    {ok, RF = #friend_role{guild = Guild}} =
        role_convert:to(friend_role, Role),
    friend_zone:update(Role, guild, Guild),
    RF1 = RF#friend_role{update_time = date:unixtime()},
    update(friend_role, RF1),
    ok;
apply_evt(#evt_fc{}, Role) ->
    {ok, RF} = role_convert:to(friend_role, Role),
    RF1 = RF#friend_role{update_time = date:unixtime()},
    update(friend_role, RF1),
    ok;
apply_evt(#evt_guild_leave{}, Role) ->
    {ok, RF = #friend_role{guild = Guild}} =
        role_convert:to(friend_role, Role),
    friend_zone:update(Role, guild, Guild),
    RF1 = RF#friend_role{update_time = date:unixtime()},
    update(friend_role, RF1),
    ok.

recommand(Role = #role{id = SelfId, lev = _SelfLev},
          Num)
    when Num > 0 ->
    LevRatio = 1,
    {ok, Self} = role_convert:to(friend_role, Role),
    case erlang:get(recommand_continue) of
        undefined ->
            Conds = [{'=/=', '$2', {SelfId}}],
            Ms = [{#friend_role{online = 1, lev = '$1', id = '$2',
                                _ = '_'},
                   Conds,
                   ['$_']}],
            case catch ets:select(friend_role, Ms, Num) of
                {L0 = [_ | _], Continue} ->
                    L = filter_recommand(#{list => L0, num => Num,
                                           self => Self,
                                           lev_ratio => LevRatio}),
                    case Num - length(L) of
                        0 -> L;
                        Extra ->
                            do_recommand(#{continue => Continue, current => L,
                                           num => Extra, self => Self,
                                           lev_ratio => LevRatio})
                    end;
                _R ->
                    logger:debug("错误 ~w", [_R], friend, 586),
                    []
            end;
        Continue ->
            do_recommand(#{continue => Continue, current => [],
                           num => Num, self => Self, lev_ratio => LevRatio + 1})
    end.

give_present(#role{id = TargetId}, TargetId, _) ->
    {false, lang:get("不能给自己赠送礼物哦")};
give_present(_Role, _TargetId, []) ->
    {false, lang:get("最少也要给个物品吧？")};
give_present(Role = #role{m_friend =
                              MF = #m_friend{given_presents = Given,
                                             given_num = GivenNum},
                          id = Id},
             TargetId, Items = [_ | _]) ->
    IsLocal = role_misc:is_local_role(TargetId),
    AddLimit = month_card:get_privilege(Role,
                                        friend_present),
    case check_give_items(Items,
                          Role,
                          TargetId,
                          #{total => 0, items => [], intimacy => 0,
                            flower_num => 0, received_count => 0})
        of
        _ when IsLocal =:= false ->
            {false, lang:get("只能给本服玩家赠送物品哦")};
        #{received_count := Total} when Total > 5 + AddLimit ->
            {false,
             notice:format(lang:get("每天最多只能赠送~ts道具"),
                           [{string_2, 5, 5 + AddLimit}])};
        Cfg = #{received_count := Total,
                flower_num := AddFlower} ->
            Now = date:unixtime(),
            case lists:keyfind(TargetId,
                               #friend_present.recipient,
                               Given)
                of
                P = #friend_present{num = Num, time = Last} ->
                    case date:is_same_day(Last, Now) of
                        true
                            when Total > 0 andalso Num + Total > 5 + AddLimit ->
                            {false,
                             notice:format(lang:get("每天最多只能赠送~ts道具"),
                                           [{string_2, 5, 5 + AddLimit}])};
                        IsSameDay ->
                            NewNum = case IsSameDay of
                                         true -> Num + Total;
                                         _ -> Total
                                     end,
                            NewRole = Role#role{m_friend =
                                                    MF#m_friend{given_presents =
                                                                    lists:keyreplace(TargetId,
                                                                                     #friend_present.recipient,
                                                                                     Given,
                                                                                     P#friend_present{num
                                                                                                          =
                                                                                                          NewNum,
                                                                                                      time
                                                                                                          =
                                                                                                          Now}),
                                                                given_num =
                                                                    GivenNum +
                                                                        AddFlower}},
                            case check_expression_bun(NewRole, Items) of
                                {ok, NewRole2} ->
                                    do_give_present(NewRole2,
                                                    Cfg#{target_id => TargetId,
                                                         loss => Items});
                                {false, Msg} -> {fasle, Msg};
                                _ -> {false, lang:get("赠送发生错误")}
                            end
                    end;
                _ ->
                    P = #friend_present{giver = Id, recipient = TargetId,
                                        num = Total, time = Now},
                    NewRole = Role#role{m_friend =
                                            MF#m_friend{given_presents =
                                                            [P | Given],
                                                        given_num =
                                                            GivenNum +
                                                                AddFlower}},
                    case check_expression_bun(NewRole, Items) of
                        {ok, NewRole2} ->
                            do_give_present(NewRole2,
                                            Cfg#{target_id => TargetId,
                                                 loss => Items});
                        {false, Msg} -> {fasle, Msg};
                        _ -> {false, lang:get("赠送发生错误")}
                    end
            end;
        Else -> Else
    end.

give_present(#role{id = TargetId}, TargetId, _, _) ->
    {false, lang:get("不能给自己赠送礼物哦")};
give_present(Role, TargetId, BaseId, Msg)
    when is_integer(BaseId) ->
    give_present(Role, TargetId, [{BaseId, 1}], Msg);
give_present(_Role, _TargetId, [], _) ->
    {false, lang:get("最少也要给个礼品吧？")};
give_present(Role, TargetId, Items = [_ | _], Msg) ->
    case check_give_items(Items,
                          Role,
                          TargetId,
                          #{total => 0, is_gift => true, intimacy => 0,
                            best_id => 0, best_intimacy => 0, flower_num => 0,
                            popularity => 0, prac_exp => 0})
        of
        Cfg = #{} ->
            case util:check_text(Msg, 20) of
                ok ->
                    do_give_present(Role,
                                    Cfg#{target_id => TargetId, msg => Msg,
                                         items => Items});
                Fail -> Fail
            end;
        Else -> Else
    end.

reward_popularity(Role = #role{m_friend =
                                   MF = #m_friend{popularity_rewarded =
                                                      Rewarded},
                               name = RName},
                  Id) ->
    case lists:keyfind(Id, 1, Rewarded) of
        {Id, _} -> {false, lang:get("你已经领取过该奖励")};
        _ ->
            case friend_data:get_popularity_reward(Id) of
                {{NeedPop}, L} ->
                    case NeedPop > friend_zone:get_popularity(Role) of
                        true ->
                            {false,
                             util:flist(lang:get("需要~w人气才能领取这个奖励"), [NeedPop])};
                        _ ->
                            #{item_id := ItemId, item_num := ItemNum,
                              announce := Ann} =
                                util:rand_list(L, item_weight),
                            Gain = format:val_to_gain([{ItemId, 0, ItemNum}]),
                            Now = date:unixtime(),
                            Role1 = Role#role{m_friend =
                                                  MF#m_friend{popularity_rewarded
                                                                  =
                                                                  [{Id, Now}
                                                                   | Rewarded]}},
                            case role_gain:do_notice(Gain, Role1) of
                                {ok, Role2} ->
                                    push(Role2, 11847, ok),
                                    case Ann of
                                        1 ->
                                            AnnStr =
                                                notice:format(lang:get("~ts打开了人气礼包，受到大家的祝福，获得了~ts"),
                                                              [{role_2, RName},
                                                               {item_2,
                                                                ItemId,
                                                                ItemNum}]),
                                            notice:cast(all, 5, AnnStr);
                                        _ -> ok
                                    end,
                                    {ok, lang:get("领取奖励成功"), Role2};
                                {false, #gain{msg = Why}} -> {false, Why}
                            end
                    end;
                _ ->
                    logger:error("找不到奖励 ~w", [Id], friend, 705),
                    {false, lang:get("奖励不存在")}
            end
    end.

combat_add_intimacy([], _) -> ok;
combat_add_intimacy([F = #fighter{type = 1} | T],
                    Intimacy) ->
    do_combat_add_intimacy(T, F, Intimacy),
    combat_add_intimacy(T, Intimacy);
combat_add_intimacy([_ | T], Intimacy) ->
    combat_add_intimacy(T, Intimacy).

-spec push(#role{}, Cmd :: integer(),
           Data :: term()) -> ok.

push(#role{link = #link{conn_pid = ConnPid},
           m_friend = Mf, id = Id},
     Cmd = 11800, _) ->
    MaxNum = get_max_num() + ext_friend_num(Id, local),
    logger:debug("~w", [MaxNum], friend, 722),
    sys_conn:pack_send(ConnPid, Cmd, {Mf, MaxNum});
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 11801, _) ->
    L = list_all(Id),
    sys_conn:pack_send(ConnPid, Cmd, {L});
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 11802, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(Pid, Cmd = 11802, Data) ->
    role:pack_send(Pid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 11809, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 11843, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(#role{link = #link{conn_pid = ConnPid},
           m_friend = #m_friend{given_presents = Given}},
     Cmd = 11844, _Data) ->
    sys_conn:pack_send(ConnPid, Cmd, {Given});
push(#role{link = #link{conn_pid = ConnPid},
           m_friend = #m_friend{popularity_rewarded = Rewarded}},
     Cmd = 11847, _Data) ->
    sys_conn:pack_send(ConnPid, Cmd, {Rewarded});
push(Role = #role{link = #link{conn_pid = ConnPid}},
     Cmd = 11810, _) ->
    L = recommand(Role, 6),
    logger:debug("l----> ~w", [L], friend, 741),
    sys_conn:pack_send(ConnPid, Cmd, {L}).

-spec apply_role(#role{}, Args :: term()) -> ok |
                                             {ok, NewRole :: #role{}} |
                                             {ok,
                                              Reply :: term(),
                                              NewRole :: #role{}}.

apply_role(Role = #role{m_friend = Mf, id = Me},
           {make_friend,
            F = #friend_role{id = Target, name = Name}}) ->
    push(Role,
         11802,
         {1,
          [{#friendship{owner = Me, id = Target, type = 0}, F}]}),
    notice:send(Role,
                3,
                {lang:get("成功加~ts为好友"), [{role_1, Target, Name}]}),
    FriendRole = Role#role{m_friend =
                               Mf#m_friend{num = get_num(Me)}},
    VarRole = var:add_var(FriendRole, day, 628, 1),
    NewRole = role_trigger:fire(#evt_friend{}, VarRole),
    {ok, NewRole};
apply_role(Role = #role{m_friend = Mf, id = Owner},
           {delete, Target}) ->
    push(Role,
         11802,
         {3,
          [{#friendship{owner = Owner, id = Target, type = 0},
            #friend_role{id = Target}}]}),
    NewRole = Role#role{m_friend =
                            Mf#m_friend{num = get_num(Owner)}},
    {ok, NewRole};
apply_role(Role, {request, Fr}) ->
    push(Role, 11809, {Fr}),
    ok;
apply_role(Role = #role{id = Owner},
           {update,
            Ship,
            Friend = #friend_role{id = TargetId},
            Msg}) ->
    notice:send(Role, 3, Msg),
    push(Role,
         11802,
         {2,
          [{Ship#friendship{owner = Owner, id = TargetId},
            Friend}]}),
    ok;
apply_role(Role = #role{id = Owner}, {refresh, Id}) ->
    logger:debug("向：~w推送好友信息:~w", [Owner, Id], friend, 773),
    case match_friendship(Owner, Id) of
        FS = #friendship{} ->
            case fetch(Id) of
                Friend = #friend_role{} ->
                    push(Role, 11802, {2, [{FS, Friend}]});
                _ -> ok
            end;
        _ -> ok
    end,
    ok;
apply_role(Role = #role{name = RName, id = Rid,
                        pos = #pos{map_pid = MapPid, map_base_id = MapBaseId},
                        pid = Pid,
                        m_friend = M = #m_friend{received_num = ReceivedNum}},
           {give_present,
            Args = #{items := Items, flower_num := FlowerNum,
                     send_id := SendId, intimacy := Intimacy}}) ->
    Role1 = Role#role{m_friend =
                          M#m_friend{received_num = ReceivedNum + FlowerNum}},
    Role2 = add_present_buff(Items, Role1),
    FlowerEvt = #evt_recv_flower{num =
                                     ReceivedNum + FlowerNum,
                                 val = FlowerNum, send_id = SendId},
    NewRole = role_trigger:fire(FlowerEvt, Role2),
    case role_misc:is_local_role(SendId) of
        false ->
            add_intimacy(Rid, Rid, Intimacy),
            case match_friendship(Rid, SendId) of
                FS1 = #friendship{} ->
                    push(Pid, 11802, {2, find_friends([FS1])});
                _ -> ok
            end,
            present_effects(Args#{target_id => Rid,
                                  target_name => RName});
        _ -> ok
    end,
    {ok,
     {ok,
      #{name => RName, map_pid => MapPid,
        map_base_id => MapBaseId, pid => Pid}},
     NewRole}.

fix_friend_cross() -> friend ! fix_friend_cross.

start_link() ->
    gen_server:start_link({local, friend}, friend, [], []).

init([]) ->
    logger:info("开始启动...", [], friend, 819),
    dets:open_file(friend_role,
                   [{file, "./dets/friend_role.dets"},
                    {keypos, #friend_role.id},
                    {repair, force}]),
    ets:new(friend_role,
            [set, named_table, public, {keypos, #friend_role.id}]),
    ets:new(friend_role_index,
            [set, named_table, public, {keypos, 1}]),
    ets:new(friend_request,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #friend_request.owner}]),
    dets:open_file(friend_role_cross,
                   [{file, "./dets/friend_role_cross.dets"},
                    {keypos, #friend_role.id}]),
    ets:new(friend_role_cross,
            [set, named_table, public, {keypos, #friend_role.id}]),
    dets:open_file(friendship,
                   [{file, "./dets/friends.dets"},
                    {keypos, #friendship.owner},
                    {type, duplicate_bag}]),
    ets:new(friendship,
            [duplicate_bag,
             named_table,
             public,
             {keypos, #friendship.owner}]),
    ets:new(friend_offer_medal,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(friend_offer_medal,
                   [{file, "./dets/friend_offer_medal.dets"},
                    {keypos, 1}]),
    ets:new(friend_offer_medal_get,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(friend_offer_medal_get,
                   [{file, "./dets/friend_offer_medal_get.dets"},
                    {keypos, 1}]),
    dets:open_file(friend_eachday_max_intimacy,
                   [{file, "./dets/friend_eachday_max_intimacy.dets"},
                    {keypos, 1}]),
    ets:new(friend_eachday_max_intimacy,
            [set, named_table, public, {keypos, 1}]),
    case load_cache() of
        ok ->
            erlang:send_after(80 * 1000,
                              self(),
                              async_friend_cross_update),
            erlang:send_after(util:rand(600, 1200) * 1000,
                              self(),
                              fix_friend_cross),
            State = #state{},
            logger:info("启动完成", [], friend, 847),
            {ok, State};
        _Err ->
            logger:error("好友数据加载失败:~w", [_Err], friend, 857),
            {stop, err_friend_role}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(async_friend_cross_update, State) ->
    friend_cross:get_cross_friend_role(),
    erlang:send_after(80 * 1000,
                      self(),
                      async_friend_cross_update),
    {noreply, State};
handle_info(fix_friend_cross, State) ->
    case env:get(big_world_center) of
        #{ready := 1, platform := P, zone_id := Z} ->
            List = take_cross_friend_ship(),
            friend_cross:get_cross_friend_role(List, P, Z);
        _ -> skip
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

calc_gain_num(0, _RandList, _Pos, Acc) -> Acc;
calc_gain_num(Num, RandList, Pos, Acc) ->
    Result = util:rand_list(RandList, Pos),
    calc_gain_num(Num - 1, RandList, Pos, [Result | Acc]).

take_cross_friend_ship() ->
    FriendShip = ets:tab2list(friendship),
    take_cross_friend_ship(FriendShip, []).

take_cross_friend_ship([], Data) -> Data;
take_cross_friend_ship([#friendship{id = Id} | T],
                       Data) ->
    case role_misc:is_local_role(Id) of
        false ->
            D = [Id, 0],
            take_cross_friend_ship(T, [D | Data]);
        _ -> take_cross_friend_ship(T, Data)
    end.

find_friends([]) -> [];
find_friends(List) -> find_friends(List, []).

find_friends([], List) -> List;
find_friends([S = #friendship{id = Id} | T], List) ->
    case fetch(Id) of
        F = #friend_role{} -> find_friends(T, [{S, F} | List]);
        _ -> find_friends(T, List)
    end.

find_friend_role([], FriendRoles) -> FriendRoles;
find_friend_role([Id | T], FriendRoles) ->
    case fetch(Id) of
        F = #friend_role{} ->
            find_friend_role(T, [F | FriendRoles]);
        _ -> find_friend_role(T, FriendRoles)
    end.

get_max_num() -> 60 + 20.

get_max_num(local) -> 60;
get_max_num(_) -> 20.

ext_friend_num(RoleId, local) ->
    PLev = privilege:get_val(RoleId, 101),
    Val = var:get_role_var(RoleId, forever, 3000, 0),
    Val + PLev;
ext_friend_num(_RoleId, _) -> 0.

do_request(Role = #role{id = Id}, {Rid, P, Z}, Label) ->
    MaxNum = get_max_num(Label) + ext_friend_num(Id, Label),
    case get_num(Id, Label) >= MaxNum of
        true when Label =:= local ->
            notice:return(lang:get("你的好友列表已经达到了上限，无法再加更多的好友")),
            ok;
        true ->
            notice:return(lang:get("你的跨服好友列表已经达到了上限，无法再加更多的好友")),
            ok;
        false ->
            case get_request({Rid, P, Z}, Id, Label) of
                #friend_request{} ->
                    notice:return(lang:get("您已经向对方申请过了，耐心等待回复吧")),
                    ok;
                none ->
                    {ok, Request} = role_convert:to(friend_request, Role),
                    NewRequest = Request#friend_request{owner =
                                                            {Rid, P, Z}},
                    case Label of
                        local -> add_request({Rid, P, Z}, NewRequest);
                        cross ->
                            big_world:cast(P,
                                           Z,
                                           friend,
                                           add_request,
                                           [{Rid, P, Z}, NewRequest])
                    end;
                _ ->
                    notice:return(lang:get("跨服时空暂时断开连接，暂时无法添加跨服好友")),
                    ok
            end
    end.

add_request(Owner, Request) ->
    update_request(Request),
    case role_query:pid(by_id, Owner) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {friend, apply_role, [{request, Request}]});
        _ -> ok
    end.

fetch_reply_friend(TargetRoleId, Label) ->
    TargetNum = get_num(TargetRoleId, Label),
    TargetMaxNum = get_max_num(Label) +
                       ext_friend_num(TargetRoleId, Label),
    case TargetNum >= TargetMaxNum of
        true -> {false, lang:get("对方好友人数已经达到上限")};
        false ->
            case role_query:pid(by_id, TargetRoleId) of
                {ok, Pid} ->
                    case role:convert(Pid, friend_role) of
                        {ok, Fr} -> {true, Pid, Fr};
                        _ -> {true, Pid, fetch(TargetRoleId)}
                    end;
                _ -> {true, undefined, fetch(TargetRoleId)}
            end
    end.

update_target_reply(SelfRoleId, TargetRoleId,
                    TargetShip, SelfFr, TargetFr) ->
    del_friendship(TargetRoleId, SelfRoleId),
    save_friendship(TargetShip),
    update(friend_role, TargetFr),
    update(friend_role_cross, SelfFr),
    ok.

do_reply_request(Role = #role{id = SelfRoleId,
                              m_friend = Mf, lev = Lev},
                 TargetRoleId = {_, P, Z}, 1) ->
    IsLocal = role_misc:is_local_role(TargetRoleId),
    Label = case IsLocal of
                true -> local;
                _ -> cross
            end,
    SelfMaxNum = get_max_num(Label) +
                     ext_friend_num(SelfRoleId, Label),
    case get_num(SelfRoleId, Label) >= SelfMaxNum of
        true when IsLocal =:= true ->
            {false, lang:get("你的好友列表已经达到了上限，无法再加更多的好友")};
        true -> {false, lang:get("你的跨服好友列表已经达到了上限，无法再加更多的好友")};
        false ->
            TargetResult = case IsLocal of
                               true -> fetch_reply_friend(TargetRoleId, Label);
                               false when Lev >= 40 ->
                                   big_world:call(P,
                                                  Z,
                                                  friend,
                                                  fetch_reply_friend,
                                                  [TargetRoleId, Label]);
                               _ -> {false, lang:get("40级才能添加跨服好友")}
                           end,
            case TargetResult of
                {false, Reason} ->
                    del_request(SelfRoleId, TargetRoleId),
                    {false, Reason};
                {true,
                 TargetPid,
                 TargetFr = #friend_role{name = FName}} ->
                    Now = date:unixtime(),
                    SelfShip = #friendship{owner = SelfRoleId,
                                           id = TargetRoleId, type = 0,
                                           ct = Now},
                    TargetShip = #friendship{owner = TargetRoleId,
                                             id = SelfRoleId, type = 0,
                                             ct = Now},
                    {ok, SelfFr} = role_convert:to(friend_role, Role),
                    case IsLocal of
                        true ->
                            del_request(SelfRoleId, TargetRoleId),
                            del_friendship(SelfRoleId, TargetRoleId),
                            del_friendship(TargetRoleId, SelfRoleId),
                            save_friendship([SelfShip, TargetShip]),
                            update(friend_role, [SelfFr, TargetFr]),
                            FireRole = role_trigger:fire(#evt_friend{},
                                                         Role#role{m_friend =
                                                                       Mf#m_friend{num
                                                                                       =
                                                                                       get_num(SelfRoleId)}}),
                            NewRole = FireRole,
                            push(Role, 11802, {1, [{SelfShip, TargetFr}]}),
                            notice:send(Role,
                                        3,
                                        {lang:get("成功加~ts为好友"),
                                         [{role_2, FName}]}),
                            case is_pid(TargetPid) of
                                true ->
                                    role:apply(async,
                                               TargetPid,
                                               {friend,
                                                apply_role,
                                                [{make_friend, SelfFr}]});
                                _ -> ok
                            end,
                            {ok, NewRole};
                        false ->
                            case big_world:call(P,
                                                Z,
                                                friend,
                                                update_target_reply,
                                                [SelfRoleId,
                                                 TargetRoleId,
                                                 TargetShip,
                                                 SelfFr,
                                                 TargetFr])
                                of
                                ok ->
                                    del_request(SelfRoleId, TargetRoleId),
                                    del_friendship(SelfRoleId, TargetRoleId),
                                    save_friendship(SelfShip),
                                    update(friend_role, SelfFr),
                                    update(friend_role_cross, TargetFr),
                                    FireRole = role_trigger:fire(#evt_friend{},
                                                                 Role#role{m_friend
                                                                               =
                                                                               Mf#m_friend{num
                                                                                               =
                                                                                               get_num(SelfRoleId)}}),
                                    NewRole = FireRole,
                                    push(Role,
                                         11802,
                                         {1, [{SelfShip, TargetFr}]}),
                                    notice:send(Role,
                                                3,
                                                {lang:get("成功加~ts为好友"),
                                                 [{role_2, FName}]}),
                                    case is_pid(TargetPid) of
                                        true ->
                                            role:apply(async,
                                                       TargetPid,
                                                       {friend,
                                                        apply_role,
                                                        [{make_friend,
                                                          SelfFr}]});
                                        _ -> ok
                                    end,
                                    {ok, NewRole};
                                {error, big_world_not_ready} ->
                                    {false, lang:get("跨服时空断开连接, 请稍后处理")};
                                _Err ->
                                    logger:info("跨服好友消息处理时发生异常:~w",
                                                [_Err],
                                                friend,
                                                1095),
                                    {false, lang:get("跨服时空暂时不稳定, 请稍后处理")}
                            end
                    end;
                _ -> {false, lang:get("跨服时空已断开连接，暂时无法处理")}
            end
    end;
do_reply_request(_Role = #role{id = SelfRoleId}, RoleId,
                 _) ->
    del_request(SelfRoleId, RoleId),
    ok.

match_friendship(Owner, Target) ->
    case ets:match_object(friendship,
                          #friendship{owner = Owner, id = Target, _ = '_'})
        of
        [F = #friendship{} | _] -> F;
        _ ->
            case dets:match_object(friendship,
                                   #friendship{owner = Owner, id = Target,
                                               _ = '_'})
                of
                [F = #friendship{} | _] ->
                    ets:insert(friendship, F),
                    F;
                _ -> none
            end
    end.

del_friendship(Owner, Target) ->
    ets:match_delete(friendship,
                     #friendship{owner = Owner, id = Target, _ = '_'}),
    catch dets:match_delete(friendship,
                            #friendship{owner = Owner, id = Target, _ = '_'}).

save_friendship(Data) ->
    ets:insert(friendship, Data),
    catch dets:insert(friendship, Data).

update(friend_role, L = [_ | _]) ->
    [update(friend_role, H) || H <- L];
update(friend_role, Role = #role{}) ->
    {ok, R0} = role_convert:to(friend_role, Role),
    update(friend_role, R0);
update(friend_role,
       R = #friend_role{id = Id = {_, P, Z}, name = Name}) ->
    ets:insert(friend_role, R),
    ets:insert(friend_role_index, {{Name, P, Z}, Id}),
    catch dets:insert(friend_role,
                      R#friend_role{online = 0});
update(friend_role_cross, L = [_ | _]) ->
    [update(friend_role_cross, H) || H <- L];
update(friend_role_cross, R = #friend_role{}) ->
    ets:insert(friend_role_cross, R),
    catch dets:insert(friend_role_cross,
                      R#friend_role{online = 0}),
    ok;
update(_, _) -> skip.

load_friendship(RoleId) ->
    DetsL = dets:lookup(friendship, RoleId),
    EtsL = ets:lookup(friendship, RoleId),
    L = DetsL -- EtsL,
    ets:insert(friendship, L).

update_cache(friend_role, R = #role{}) ->
    {ok, R0} = role_convert:to(friend_role, R),
    update_cache(friend_role, R0);
update_cache(friend_role,
             R = #friend_role{id = Id = {_, P, Z}, name = Name}) ->
    ets:insert(friend_role, R),
    ets:insert(friend_role_index, {{Name, P, Z}, Id});
update_cache(friend_role_cross, R = #friend_role{}) ->
    ets:insert(friend_role_cross, R),
    ok;
update_cache(_, _) -> skip.

load_cache() ->
    dets:to_ets(friend_offer_medal, friend_offer_medal),
    dets:to_ets(friend_offer_medal_get,
                friend_offer_medal_get),
    dets:to_ets(friend_eachday_max_intimacy,
                friend_eachday_max_intimacy),
    ok.

filter_recommand(#{list := []}) -> [];
filter_recommand(#{num := Num}) when Num =< 0 -> [];
filter_recommand(Arg = #{list :=
                             [#friend_role{lev = Lev} | T],
                         self := #friend_role{lev = MLev}, lev_ratio := Ratio})
    when abs(MLev - Lev) > 10 * Ratio ->
    filter_recommand(Arg#{list := T});
filter_recommand(Arg = #{list :=
                             [#friend_role{sex = Sex} | T],
                         self := #friend_role{sex = MSex}, num := Num})
    when Num > 2 andalso Sex =:= MSex ->
    filter_recommand(Arg#{list := T});
filter_recommand(Arg = #{list :=
                             [H = #friend_role{id = Id} | T],
                         self := #friend_role{id = MyId}, num := Num}) ->
    case match_friendship(MyId, Id) of
        #friendship{type = 0} ->
            filter_recommand(Arg#{list := T});
        _ ->
            case match_friendship(Id, MyId) of
                #friendship{type = 1} ->
                    filter_recommand(Arg#{list := T});
                _ ->
                    [H | filter_recommand(Arg#{list := T, num := Num - 1})]
            end
    end.

update_request(R = #friend_request{owner = Owner,
                                   id = Id}) ->
    ets:match_delete(friend_request,
                     #friend_request{owner = Owner, id = Id, _ = '_'}),
    ets:insert(friend_request,
               R#friend_request{ct = date:unixtime()}).

del_request(Owner, Id) ->
    ets:match_delete(friend_request,
                     #friend_request{owner = Owner, id = Id, _ = '_'}).

get_request(Owner, Id, local) ->
    case ets:match_object(friend_request,
                          #friend_request{owner = Owner, id = Id, _ = '_'})
        of
        [R = #friend_request{}] -> R;
        _ -> none
    end;
get_request(Owner = {_, P, Z}, Id, cross) ->
    case big_world:call(P,
                        Z,
                        friend,
                        get_request,
                        [Owner, Id, local])
        of
        R = #friend_request{} -> R;
        none -> none;
        _ -> big_world_not_ready
    end.

do_recommand(#{continue := Continue, num := Num,
               current := OldL, self := Self,
               lev_ratio := LevRatio}) ->
    case catch ets:select(Continue) of
        {L0 = [_ | _], Ct} ->
            L = filter_recommand(#{list => L0, num => Num,
                                   self => Self, lev_ratio => LevRatio}),
            case Num - length(L) of
                Diff when Diff =< 0 ->
                    erlang:put(recommand_continue, Ct),
                    L ++ OldL;
                Extra ->
                    do_recommand(#{continue => Ct, current => L ++ OldL,
                                   num => Extra, self => Self,
                                   lev_ratio => LevRatio + 1})
            end;
        '$end_of_table' ->
            erlang:put(recommand_continue, undefined),
            OldL;
        _R ->
            logger:debug("搜索失败 ~w", [_R], friend, 1280),
            OldL
    end.

refresh_push(#role{id = Id}) ->
    L = ets:lookup(friendship, Id),
    lists:foreach(fun (#friendship{type = 0, id = FId}) ->
                          role:apply(async,
                                     FId,
                                     {friend, apply_role, [{refresh, Id}]});
                      (_) -> ok
                  end,
                  L).

cast_online(Role = #role{m_wedding =
                             #m_wedding{lover_id = LoverId}},
            Me = #friend_role{name = Name, id = RoleId,
                              online = 1}) ->
    Msg = notice:format(lang:get("你的好友~ts上线了"),
                        [{role_2, Name}]),
    L = list_friend_ship(RoleId),
    do_cast_online(Role, L, Msg, Me, [LoverId]);
cast_online(_,
            #friend_role{name = _Name, id = RoleId}) ->
    L = list_friend_ship(RoleId),
    [role:apply(async,
                Id,
                {friend, apply_role, [{refresh, RoleId}]})
     || #friendship{type = 0, id = Id} <- L],
    ok.

do_cast_online(_Role, [], _, _, _) -> ok;
do_cast_online(Role = #role{sex = Sex, name = Name},
               [S = #friendship{type = 0, id = Id} | T], Msg, Me,
               DelIds) ->
    DelFlag = lists:member(Id, DelIds),
    case fetch(Id) of
        #friend_role{online = 1} when DelFlag == false ->
            role:apply(async,
                       Id,
                       {friend, apply_role, [{update, S, Me, Msg}]});
        #friend_role{online = 1} when Sex == 1 ->
            Msg2 = notice:format(lang:get("你的爱人~ts上线了"),
                                 [{role_2, Name}]),
            role:apply(async,
                       Id,
                       {friend, apply_role, [{update, S, Me, Msg2}]});
        #friend_role{online = 1} ->
            Msg2 = notice:format(lang:get("你的爱人~ts上线了"),
                                 [{role_2, Name}]),
            role:apply(async,
                       Id,
                       {friend, apply_role, [{update, S, Me, Msg2}]});
        _ -> ok
    end,
    do_cast_online(Role, T, Msg, Me, DelIds);
do_cast_online(Role, [_ | T], Msg, Me, DelIds) ->
    do_cast_online(Role, T, Msg, Me, DelIds).

do_give_present(Role = #role{id = Id, name = Name,
                             lev = Lev,
                             m_friend = M = #m_friend{given_num = GivenNum}},
                #{items := Items, is_gift := true,
                  target_id := TargetId = {_, Platform, ZoneId},
                  intimacy := Intimacy, msg := Msg, best_id := BaseId,
                  flower_num := FlowerNum, popularity := Popularity,
                  prac_exp := PracExp}) ->
    Role1 = Role#role{m_friend =
                          M#m_friend{given_num = GivenNum + FlowerNum}},
    logger:debug("~w", [Items], friend, 1331),
    Loss = format:val_to_loss(Items),
    ItemFlag = lists:keyfind(29151, 1, Items) == false,
    ChildFlag = lists:keyfind(29050, 1, Items) == false,
    ChristFlag = lists:keyfind(29024, 1, Items) == false,
    CampRushFlag = lists:keyfind(26013, 1, Items) == false,
    TeacherFlag = lists:keyfind(23286, 1, Items) == false,
    StudentFlag = lists:keyfind(23288, 1, Items) == false,
    {ChocolateFlag, ChocolateNum} = case
                                        lists:keyfind(23216, 1, Items)
                                        of
                                        {23216, Count} -> {false, Count};
                                        _ -> {true, 0}
                                    end,
    {DiceFlag, DiceNum} = case lists:keyfind(70028,
                                             1,
                                             Items)
                              of
                              {_, _DiceCount} -> {false, _DiceCount};
                              _ -> {true, 0}
                          end,
    MailItems = case BaseId of
                    29051 -> [{29052, 0, 1}];
                    _ -> []
                end,
    AddGainList = case {ItemFlag, ChildFlag} of
                      _ when ChristFlag =:= false -> [{90000, 100000}];
                      _ when ChocolateFlag =:= false ->
                          [{23218, 0, ChocolateNum}];
                      _ when DiceFlag =:= false -> [{70027, 0, DiceNum * 3}];
                      {false, false} -> [{20006, 15}, {90003, 1000}];
                      {false, _} -> [{20006, 15}];
                      {_, false} -> [{90003, 1000}];
                      _ -> []
                  end,
    RushTargetList = case lists:keyfind(26013, 1, Items) of
                         {26013, Num26013} -> [{26013, 1, Num26013}];
                         _ -> []
                     end,
    NewYearList = case lists:keyfind(70393, 1, Items) of
                      {70393, Num29975} ->
                          NewYearNum = util:rand_list([1, 2, 3]),
                          [{70394, 1, NewYearNum * Num29975},
                           {90048, 5 * Num29975}];
                      _ -> []
                  end,
    TeaGiftList = case lists:keyfind(23286, 1, Items) of
                      {23286, Tea2StuNum} ->
                          [{90010, (243 * Lev + 7200) * Tea2StuNum},
                           {90000, 100000 * Tea2StuNum}];
                      _ -> []
                  end,
    StuGiftList = case lists:keyfind(23288, 1, Items) of
                      {23288, Stu2TeaNum} ->
                          [{90010, (243 * Lev + 7200) * 2 * Stu2TeaNum}];
                      _ -> []
                  end,
    StoreList = case lists:keyfind(70568, 1, Items) of
                    {70568, Num70489} ->
                        RandList = [{1, 100}, {2, 100}, {3, 100}],
                        Pos = 2,
                        Result = calc_gain_num(Num70489, RandList, Pos, []),
                        RandNum = lists:foldl(fun ({TempNum, _}, Sum) ->
                                                      TempNum + Sum
                                              end,
                                              0,
                                              Result),
                        [{70569, 1, RandNum}];
                    _ -> []
                end,
    AddList = add_present_gain(Items, [], #{}),
    Gain = format:val_to_gain(AddGainList ++
                                  MailItems ++
                                      NewYearList ++
                                          TeaGiftList ++
                                              StuGiftList ++
                                                  StoreList ++ AddList),
    GL = case PracExp of
             0 -> Loss;
             _ -> Loss ++ format:val_to_gain([{90013, PracExp}])
         end,
    logger:debug("base_id ----> ~w",
                 [BaseId],
                 friend,
                 1421),
    TargetMailItems = case BaseId of
                          23021 ->
                              case lists:keyfind(23021, 1, Items) of
                                  {23021, PigNum} -> [{23022, 0, PigNum}];
                                  _ -> []
                              end;
                          23216 -> [{23218, 0, ChocolateNum}];
                          _ -> []
                      end,
    {TargetMailItems1, G2} = case lists:keyfind(23220,
                                                1,
                                                Items)
                                 of
                                 {_, Num220} ->
                                     {[{23222, 0, Num220} | TargetMailItems],
                                      format:val_to_gain([{23222, 0, Num220}])};
                                 _ -> {TargetMailItems, []}
                             end,
    {TargetItem400, G400} = case lists:keyfind(23400,
                                               1,
                                               Items)
                                of
                                {_, Num400} ->
                                    {[23222, 0, Num400],
                                     format:val_to_gain([{23222, 0, Num400}])};
                                _ -> {[], []}
                            end,
    StuTargetMailItems = case lists:keyfind(23286, 1, Items)
                             of
                             {23286, StuRNum} -> [{23287, 1, StuRNum}];
                             _ -> []
                         end,
    TeaTargetMailItems = case lists:keyfind(23288, 1, Items)
                             of
                             {23288, TeaRNum} -> [{23289, 1, TeaRNum}];
                             _ -> []
                         end,
    FlowerSays = lists:filter(fun ({ItemID, _}) ->
                                      case item_data:get(ItemID) of
                                          #item_base{type = 156} -> true;
                                          _ -> false
                                      end;
                                  (#item{id = ItemID}) ->
                                      case item_data:get(ItemID) of
                                          #item_base{type = 156} -> true;
                                          _ -> false
                                      end;
                                  (_) -> false
                              end,
                              Items),
    ToMailItems = MailItems ++
                      TargetMailItems1 ++
                          TargetItem400 ++
                              FlowerSays ++
                                  RushTargetList ++
                                      StuTargetMailItems ++ TeaTargetMailItems,
    case do_present_gl(G400 ++ G2 ++ GL ++ Gain, Role1) of
        {ok, Role2} ->
            Args = #{id => Id, name => Name, items => Items,
                     msg => Msg, base_id => BaseId, flower_num => FlowerNum,
                     send_id => Id, mail_items => ToMailItems,
                     intimacy => Intimacy},
            case big_world:call(Platform,
                                ZoneId,
                                role,
                                apply,
                                [sync,
                                 TargetId,
                                 {friend, apply_role, [{give_present, Args}]}])
                of
                {ok, #{name := TargetName, pid := TargetPid}} ->
                    add_intimacy_evt(Id, TargetId, Intimacy),
                    add_intimacy(Id, TargetId, Intimacy),
                    add_intimacy(TargetId, Id, Intimacy),
                    logger:debug("ggggggggggggggggggggggggggggggggggggggggggggg"
                                 "gg~w",
                                 [Items],
                                 friend,
                                 1473),
                    present_effects(#{id => Id, base_id => BaseId,
                                      name => Name, target_id => TargetId,
                                      target_name => TargetName,
                                      mail_items => ToMailItems, msg => Msg,
                                      items => Items}),
                    {Content, Msg3} = case is_friend(Id, TargetId) of
                                          _ when ChildFlag == false ->
                                              Content0 =
                                                  notice:format(lang:get("~ts向你扔来一个捣蛋糖果，你变成了儿童{face_1,22}"),
                                                                [{role_2,
                                                                  Name}]),
                                              {Content0,
                                               notice:format(lang:get("你对~ts使用了捣蛋糖果，对方变成了儿童"),
                                                             [{role_2,
                                                               TargetName}])};
                                          _ when ItemFlag == false ->
                                              Content0 =
                                                  notice:format(lang:get("~ts向你扔来一个奇异果实，你身上出现了一些变化{face_1,22}"),
                                                                [{role_2,
                                                                  Name}]),
                                              {Content0,
                                               notice:format(lang:get("你对~ts使用了奇异果实，对方外形得到变化"),
                                                             [{role_2,
                                                               TargetName}])};
                                          _ when ChristFlag =:= false ->
                                              Content0 =
                                                  notice:format(lang:get("~ts赠送给你一颗雪人糖果，在雪地上品尝时摔了一跤，变成了大雪人{face_1,51}"),
                                                                [{role_2,
                                                                  Name}]),
                                              {Content0,
                                               notice:format(lang:get("你对~ts使用了雪人果实，对方外形得到变化"),
                                                             [{role_2,
                                                               TargetName}])};
                                          _ when DiceFlag =:= false ->
                                              Content0 =
                                                  notice:format(lang:get("你吃掉了~ts赠送的~ts，身体发生了奇妙的变化{face_1, 10}"),
                                                                [{role_2, Name},
                                                                 {item_2,
                                                                  70028}]),
                                              {Content0,
                                               notice:format(lang:get("~ts吃掉了你的~ts，身体发生了奇妙的变化"),
                                                             [{role_2,
                                                               TargetName},
                                                              {item_2,
                                                               70028}])};
                                          _ when CampRushFlag =:= false ->
                                              {notice:format(lang:get("Surprise！您的好友~ts送来了礼物和祝福：\n~ts\n温馨提示：\n1、入场券有"
                                                                      "使用时限，请及时报名参赛\n2、获赠入场券后的12小时内，您再赠送他人入场券，将不能获得复"
                                                                      "活卡\n "),
                                                             [{role_2, Name},
                                                              {string_2,
                                                               5,
                                                               Msg}]),
                                               lang:get("赠送成功")};
                                          _ when TeacherFlag =:= false ->
                                              Content0 =
                                                  notice:format(lang:get("您的师父~ts在游历星辰的过程中记录了自身的心得体会，特赠送给你：\n~ts\n "
                                                                         "       ——来自关爱你的师父"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  5,
                                                                  "一定要努力成长哟"}]),
                                              {Content0,
                                               notice:format(lang:get("你对你的爱徒~ts赠送了师徒礼包，对方获得了丰厚的奖励"),
                                                             [{role_2,
                                                               TargetName}])};
                                          _ when StudentFlag =:= false ->
                                              Content0 =
                                                  notice:format(lang:get("您的徒弟~ts在游历星辰的过程中记录了自身的心得体会，特赠送给你：\n~ts\n "
                                                                         "       ——来自关心你的徒弟"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  5,
                                                                  "我也能独挡一面了呢"}]),
                                              {Content0,
                                               notice:format(lang:get("你对你的恩师~ts使用了师徒礼包，对方获得了丰厚的奖励"),
                                                             [{role_2,
                                                               TargetName}])};
                                          true when BaseId == 29153 ->
                                              Content0 =
                                                  notice:format(lang:get("草长莺飞，阳春三月，你的好友 ~ts 给你赠送了一束新鲜的桃红柳绿祝福：\n~ts\n "
                                                                         "亲密度+~ts。"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  5,
                                                                  Msg},
                                                                 {string_2,
                                                                  5,
                                                                  Intimacy}]),
                                              {Content0,
                                               notice:format(lang:get("赠送成功，你与~ts的亲密度提升~ts点"),
                                                             [{role_2,
                                                               TargetName},
                                                              {string_2,
                                                               5,
                                                               Intimacy}])};
                                          true when FlowerSays =/= [] ->
                                              [{ItemIDT, _} | _] = FlowerSays,
                                              {ItemName, ItemSays, _} =
                                                  campaign_collection_data:get_flower_info(ItemIDT),
                                              Content0 =
                                                  notice:format(lang:get("~ts赠送给您一朵~ts，~ts，请前往~ts查看吧，赠人玫瑰手留余香，重复的花语也可回赠"
                                                                         "给Ta哦"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  1,
                                                                  ItemName},
                                                                 {string_1,
                                                                  ItemSays},
                                                                 {string_2,
                                                                  1,
                                                                  "[缤纷花语]"}]),
                                              {Content0, "赠送成功"};
                                          true when Intimacy =:= 0 ->
                                              case lists:keyfind(20042,
                                                                 1,
                                                                 Items)
                                                  of
                                                  {20042, _} ->
                                                      IrisMsg =
                                                          lang:get("赠送成功，亲密度已大于1000，蝴蝶花仅增加空间人气，不再增加亲密度"),
                                                      notice:send(Role,
                                                                  3,
                                                                  IrisMsg),
                                                      {notice:format(lang:get("Surprise！您的好友~ts送来了礼物和祝福：\n~ts\n （当前亲密度已大于100"
                                                                              "0，蝴蝶花仅增加空间人气，不再增加亲密度）"),
                                                                     [{role_2,
                                                                       Name},
                                                                      {string_2,
                                                                       5,
                                                                       Msg}]),
                                                       ""};
                                                  _ ->
                                                      {notice:format(lang:get("Surprise！您的好友~ts送来了礼物和祝福：\n~ts\n "),
                                                                     [{role_2,
                                                                       Name},
                                                                      {string_2,
                                                                       5,
                                                                       Msg}]),
                                                       lang:get("赠送成功")}
                                              end;
                                          true ->
                                              Content0 =
                                                  notice:format(lang:get("Surprise！您的好友~ts送来了礼物和祝福：\n~ts\n 亲密度+~ts。"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  5,
                                                                  Msg},
                                                                 {string_2,
                                                                  5,
                                                                  Intimacy}]),
                                              {Content0,
                                               notice:format(lang:get("赠送成功，你与~ts的亲密度提升~ts点"),
                                                             [{role_2,
                                                               TargetName},
                                                              {string_2,
                                                               5,
                                                               Intimacy}])};
                                          _ ->
                                              Content0 =
                                                  notice:format(lang:get("默默关注您的~ts送来了礼物和祝福：\n~ts\n 。快和TA成为好友吧，赠送礼物可获得亲"
                                                                         "密度喔。"),
                                                                [{role_2, Name},
                                                                 {string_2,
                                                                  5,
                                                                  Msg}]),
                                              {Content0,
                                               notice:format(lang:get("赠送成功，你与~ts还不是好友，亲密度不增加"),
                                                             [{role_2,
                                                               TargetName}])}
                                      end,
                    Title = case FlowerSays =/= [] of
                                true -> lang:get("缤纷花语好友赠送");
                                _ when TeacherFlag =:= false ->
                                    lang:get("师傅赠送");
                                _ when StudentFlag =:= false ->
                                    lang:get("徒弟赠送");
                                _ -> lang:get("好友赠送")
                            end,
                    MailInfo = #{items => ToMailItems, title => Title,
                                 content => Content},
                    notice:send({pid, TargetPid}, 3, Content),
                    big_world:cast(Platform,
                                   ZoneId,
                                   mail,
                                   send,
                                   [TargetId, MailInfo]),
                    friend_zone:add_trend_no_check(Role,
                                                   3,
                                                   #{content => Msg,
                                                     zone_id => TargetId,
                                                     presents => Items,
                                                     popularity => Popularity}),
                    case match_friendship(Id, TargetId) of
                        FS = #friendship{} ->
                            push(Role, 11802, {2, find_friends([FS])}),
                            case match_friendship(TargetId, Id) of
                                FS1 = #friendship{} ->
                                    push(TargetPid,
                                         11802,
                                         {2, find_friends([FS1])});
                                _ -> ok
                            end;
                        _ -> ok
                    end,
                    logger:debug("赠送量 -----> ~w",
                                 [FlowerNum],
                                 friend,
                                 1547),
                    FlowerEvt = #evt_send_flower{num = GivenNum + FlowerNum,
                                                 val = FlowerNum,
                                                 base_id = BaseId,
                                                 recv_id = TargetId,
                                                 items = Items},
                    FlowerEvt2 = #evt_general_send_flower{items = Items},
                    goodvoice:flower(Items, Id, Name, TargetId),
                    logger:debug("```````````````````````````````````~w",
                                 [BaseId],
                                 friend,
                                 1557),
                    case lists:keyfind(26013, 1, Items) of
                        {26013, N} ->
                            case buff:check_buff(Role, 31015) of
                                false ->
                                    T1 = lang:get("冲顶答题复活卡"),
                                    C1 =
                                        notice:format(lang:get("赠人玫瑰手留余香，感谢您赠送~ts入场券，同时您获得了~ts张复活卡\n（注意：~ts由于"
                                                               "收到您的入场邀请，12小时内~ts赠送其他人入场券，将不能收到复活卡）"),
                                                      [{role_2, TargetName},
                                                       {string_2, 5, N},
                                                       {role_2, TargetName},
                                                       {role_2, TargetName}]),
                                    I1 = [{26014, 0, N}],
                                    mail:send(Id, T1, C1, I1);
                                _ ->
                                    T2 = lang:get("入场券赠送提醒"),
                                    C2 =
                                        lang:get("您的入场券成功送出，但由于您12小时内收到他人赠送的入场券，本次赠送将不能获得复活卡，请把"
                                                 "入场券送给有需要的人吧^_^"),
                                    mail:send(Id, T2, C2, [])
                            end;
                        _ -> ok
                    end,
                    Role3 = reserve_exp(Role2, BaseId),
                    Role4 = update_gave_present(Items, Role3),
                    NewRole1 = role_trigger:fire(FlowerEvt, Role4),
                    NewRole = role_trigger:fire(FlowerEvt2, NewRole1),
                    {ok, Msg3, NewRole};
                _ ->
                    case FlowerSays =/= [] of
                        true ->
                            case campaign_collection:give_present(Role,
                                                                  TargetId,
                                                                  FlowerSays)
                                of
                                {ok, NeRole} ->
                                    friend_zone:add_trend_no_check(Role,
                                                                   3,
                                                                   #{content =>
                                                                         Msg,
                                                                     zone_id =>
                                                                         TargetId,
                                                                     presents =>
                                                                         Items,
                                                                     popularity
                                                                         =>
                                                                         Popularity}),
                                    case match_friendship(Id, TargetId) of
                                        FS = #friendship{} ->
                                            push(Role,
                                                 11802,
                                                 {2, find_friends([FS])});
                                        _ -> ok
                                    end,
                                    {ok, "赠送成功", NeRole};
                                _ -> {false, lang:get("赠送失败，联系管理员")}
                            end;
                        _ -> {false, lang:get("对方现在不在线呢")}
                    end
            end;
        _E -> {false, lang:get("没有物品")}
    end;
do_give_present(Role = #role{id = Id, name = Name},
                #{items := Items, loss := Loss0, target_id := TargetId,
                  intimacy := Intimacy,
                  received_count := ReceivedCount}) ->
    Loss = [#loss{label = item_id, val = Loss0}],
    case role_gain:do(Loss, Role) of
        {ok, NewRole} ->
            add_intimacy_evt(Id, TargetId, Intimacy),
            add_intimacy(Id, TargetId, Intimacy),
            add_intimacy(TargetId, Id, Intimacy),
            IsFriend = is_friend(Id, TargetId),
            Content = case IsFriend of
                          true when Intimacy > 0 ->
                              notice:format(lang:get("这是您的好友~ts赠送的道具，亲密度+~ts，请查收。"),
                                            [{role_2, Name},
                                             {string_2, 5, Intimacy}]);
                          true ->
                              notice:format(lang:get("这是您的好友~ts赠送的道具，请查收。"),
                                            [{role_2, Name}]);
                          _ ->
                              notice:format(lang:get("这是~ts赠送的道具，请查收。快和TA成为好友吧，赠送道具可获得亲密度喔。"),
                                            [{role_2, Name}])
                      end,
            Msg3 = case IsFriend of
                       true when Intimacy > 0 ->
                           notice:format(lang:get("赠送成功，你们俩的亲密度增加~ts"),
                                         [{string_2, 5, Intimacy}]);
                       true -> lang:get("赠送成功");
                       _ -> lang:get("赠送成功，你们俩还不是好友，亲密度不增加")
                   end,
            MailInfo = #{items => Items, title => lang:get("好友赠送"),
                         content => Content},
            push(NewRole, 11844, ok),
            mail:send(TargetId, MailInfo),
            var:update_role_var_list(TargetId,
                                     [{acc,
                                       day,
                                       49,
                                       0,
                                       ReceivedCount,
                                       99999999999999}]),
            case lists:keyfind(22450, 1, Items) of
                {_, Num} ->
                    AcceptedNum = var:get_role_var(TargetId, day, 619, 0),
                    var:set_role_var(TargetId, day, 619, AcceptedNum + Num);
                _ -> ok
            end,
            case need_log(Items) of
                {true, LogInfo} ->
                    TargetName = case role_query:attr(by_id,
                                                      TargetId,
                                                      [#role.name])
                                     of
                                     {ok, [TName]} -> TName;
                                     _ -> ok
                                 end,
                    logger:debug("赠送礼物:~w, 接收者名字：~w",
                                 [LogInfo, TargetName],
                                 friend,
                                 1646),
                    log:give_present(Role, TargetId, TargetName, LogInfo);
                _ -> ok
            end,
            {ok, Msg3, NewRole};
        _E ->
            logger:debug("物品分类 ~w", [_E], friend, 1652),
            {false, lang:get("没有物品")}
    end.

check_give_present([], _,
                   #{reduce_intimacy := ReduceIntimacy}) ->
    {true, ReduceIntimacy};
check_give_present([], _, _) -> true;
check_give_present([charge | T],
                   Role = #role{charge = Charge},
                   Args = #{charged := NeedCharged}) ->
    case NeedCharged > Charge of
        true ->
            {false,
             notice:format(lang:get("需要充值 ~ts"),
                           [{assets_1, 90002, NeedCharged}])};
        _ -> check_give_present(T, Role, Args)
    end;
check_give_present([is_local_role | T], Role,
                   Args = #{target_id := {_, P, Z}}) ->
    case role_misc:is_local_role({P, Z}) of
        true -> check_give_present(T, Role, Args);
        _ -> {false, lang:get("暂时不能送礼给非本服的玩家")}
    end;
check_give_present([intimacy | T],
                   Role = #role{id = Id},
                   Args = #{target_id := TargetId, item_id := ItemId,
                            intimacy := Add}) ->
    case Args of
        #{intimacy_limit := Limit}
            when Limit > 0 orelse ItemId =:= 20042 ->
            case match_friendship(TargetId, Id) of
                #friendship{type = 0, intimacy = Intimacy}
                    when Intimacy >= Limit ->
                    case ItemId of
                        20042 when Add + Intimacy >= 1000 ->
                            check_give_present(T,
                                               Role,
                                               Args#{reduce_intimacy =>
                                                         max(0,
                                                             1000 - Intimacy)});
                        _ -> check_give_present(T, Role, Args)
                    end;
                _ when ItemId =:= 20042 ->
                    {false, lang:get("蝴蝶花只能赠送给好友哦")};
                _ ->
                    {false,
                     notice:format(lang:get("需要亲密度达到~ts"),
                                   [{string_2, 5, Limit}])}
            end;
        _ -> check_give_present(T, Role, Args)
    end;
check_give_present([relation | T], Role,
                   Args = #{target_id := TargetId, item_id := BaseId}) ->
    case Args of
        #{relation := 1} ->
            case teacher:is_teacher_relation(Role, TargetId) of
                {true, student} -> check_give_present(T, Role, Args);
                _ ->
                    {false,
                     notice:format(lang:get("~ts只能送给徒弟喔{face_1,26}"),
                                   [{item_2, BaseId}])}
            end;
        #{relation := 2} ->
            case teacher:is_teacher_relation(Role, TargetId) of
                {true, teacher} -> check_give_present(T, Role, Args);
                _ ->
                    {false,
                     notice:format(lang:get("~ts只能送给师傅喔{face_1,26}"),
                                   [{item_2, BaseId}])}
            end;
        _ -> check_give_present(T, Role, Args)
    end;
check_give_present([msg | T], Role,
                   Args = #{msg := Msg}) ->
    case util:text_banned(Msg) of
        true -> {false, lang:get("内容中有禁用词语")};
        _ -> check_give_present(T, Role, Args)
    end;
check_give_present([gave | T], Role,
                   Args = #{item_id := BaseId = 20042,
                            giving_num := Num}) ->
    case var:get_list_var(Role, day, 608, BaseId, 0) of
        N when N >= 5 -> {false, lang:get("今日蝴蝶花赠送次数已达上限")};
        N when N + Num > 5 ->
            {false,
             notice:format(lang:get("今日蝴蝶花赠送数量只剩~ts个"),
                           [{string_2, 5, 5 - N}])};
        _ -> check_give_present(T, Role, Args)
    end;
check_give_present([gave | T], Role, Args) ->
    check_give_present(T, Role, Args).

add_intimacy(Owner, TargetId, AddInt) ->
    case match_friendship(Owner, TargetId) of
        #friendship{intimacy = Int1, type = 0} = F ->
            NewF = F#friendship{intimacy = Int1 + AddInt},
            del_friendship(Owner, TargetId),
            save_friendship(NewF);
        _ -> ok
    end.

add_intimacy_evt(Owner, TargetId, AddInt) ->
    case match_friendship(Owner, TargetId) of
        #friendship{intimacy = Int1, type = 0} ->
            role_trigger:async_fire(Owner,
                                    [#evt_friend_intimacy{val = Int1 + AddInt},
                                     #evt_friend_intimacy_camp{val = AddInt,
                                                               target_id =
                                                                   TargetId}]),
            role_trigger:async_fire(TargetId,
                                    [#evt_friend_intimacy{val =
                                                              Int1 + AddInt}]);
        _ -> ok
    end.

add_intimacy_and_push(Owner, TargetId, AddInt, Role) ->
    case match_friendship(Owner, TargetId) of
        #friendship{intimacy = Int1, type = 0} = F ->
            NewF = F#friendship{intimacy = Int1 + AddInt},
            del_friendship(Owner, TargetId),
            role_trigger:async_fire(Owner,
                                    [#evt_friend_intimacy{val = Int1 + AddInt},
                                     #evt_friend_intimacy_camp{val = AddInt,
                                                               target_id =
                                                                   TargetId}]),
            role_trigger:async_fire(TargetId,
                                    [#evt_friend_intimacy{val =
                                                              Int1 + AddInt}]),
            save_friendship(NewF),
            case fetch(TargetId) of
                FTarget = #friend_role{name = TargetName} ->
                    push(Role,
                         11802,
                         {2,
                          [{NewF#friendship{owner = Owner, id = TargetId,
                                            type = 0},
                            FTarget}]}),
                    IntimacyMsg = notice:format(lang:get("与~ts的亲密度增加~ts点"),
                                                [{role_2, TargetName},
                                                 {string_2, 1, AddInt}]),
                    notice:send(Role, 3, IntimacyMsg),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end.

make_friend(Id1, Id2) ->
    case is_friend(Id1, Id2) of
        true -> ok;
        _ ->
            Ship1 = #friendship{owner = Id1, id = Id2, type = 0,
                                ct = date:unixtime()},
            Ship2 = #friendship{owner = Id2, id = Id1, type = 0,
                                ct = date:unixtime()},
            del_friendship(Id1, Id2),
            del_friendship(Id2, Id1),
            save_friendship([Ship1, Ship2]),
            del_request(Id1, Id2),
            del_request(Id2, Id1),
            case {fetch(Id1), fetch(Id2)} of
                {FRole1 = #friend_role{}, FRole2 = #friend_role{}} ->
                    role:apply(async,
                               Id1,
                               {friend, apply_role, [{make_friend, FRole2}]}),
                    role:apply(async,
                               Id2,
                               {friend, apply_role, [{make_friend, FRole1}]}),
                    ok;
                _ -> ok
            end
    end.

check_give_items([], _, TargetId,
                 Result = #{received_count := ReceivedCount}) ->
    case var:get_role_var(TargetId, day, 49, 0) of
        Var when Var >= 15 andalso ReceivedCount > 0 ->
            {false, lang:get("对方接收道具数量已达上限，明天再送吧{face_1,9}")};
        Var
            when Var + ReceivedCount > 15 andalso
                     ReceivedCount > 0 ->
            {false,
             notice:format(lang:get("对方今天还可以再接收~ts个道具"),
                           [{string_2, 5, 15 - Var}])};
        _ -> Result
    end;
check_give_items([], _, _, Result) -> Result;
check_give_items([{BaseId, Num} | T], Role, TargetId,
                 Result = #{total := Total, intimacy := Intimacy,
                            is_gift := true, best_intimacy := Best,
                            flower_num := FlowerNum, popularity := Popularity,
                            prac_exp := PracExp}) ->
    case friend_data:get_present(BaseId) of
        Cfg = #{type := 1, intimacy := Add,
                rank_factor := RankFactor, popularity := AddPop,
                prac_exp := AddPrac} ->
            Result1 = Result#{total := Total + Num,
                              intimacy := Intimacy + Add * Num,
                              flower_num := FlowerNum + RankFactor * Num,
                              popularity := Popularity + AddPop * Num,
                              prac_exp := PracExp + AddPrac * Num},
            case check_give_present([charge,
                                     intimacy,
                                     relation,
                                     gave],
                                    Role,
                                    Cfg#{target_id => TargetId,
                                         giving_num => Num, item_id => BaseId})
                of
                true when Add > Best ->
                    check_give_items(T,
                                     Role,
                                     TargetId,
                                     Result1#{best_id := BaseId,
                                              best_intimacy := Add});
                true -> check_give_items(T, Role, TargetId, Result1);
                {true, ReduceIntimacy} when Add > Best ->
                    check_give_items(T,
                                     Role,
                                     TargetId,
                                     Result1#{best_id := BaseId,
                                              best_intimacy := Add,
                                              intimacy :=
                                                  Intimacy + ReduceIntimacy});
                {true, ReduceIntimacy} ->
                    check_give_items(T,
                                     Role,
                                     TargetId,
                                     Result1#{intimacy :=
                                                  Intimacy + ReduceIntimacy});
                Else -> Else
            end;
        _Err ->
            logger:debug("=======:~w", [_Err], friend, 1819),
            {false,
             notice:format(lang:get("~ts不可以赠送"), [{item_2, BaseId}])}
    end;
check_give_items([{ItemId, Num} | T],
                 Role = #role{p_bag = Bag}, TargetId,
                 Result = #{total := Total, items := Items,
                            intimacy := Intimacy,
                            received_count := ReceivedCount}) ->
    TargetNum = var:get_role_var(TargetId, day, 619, 0),
    case package:find(by_id, ItemId, Bag) of
        {ok, #item{base_id = BaseId, bind = 1}} ->
            {false,
             notice:format(lang:get("绑定的~ts，不可以赠送"),
                           [{item_2, BaseId}])};
        {ok, #item{base_id = BaseId, quantity = Q}}
            when Q < Num ->
            {false,
             notice:format(lang:get("~ts数量不足"), [{item_2, BaseId}])};
        {ok, #item{base_id = "" = BaseId}}
            when TargetNum >= 3 ->
            {false,
             notice:format(lang:get("对方已接收3个~ts，明天再送呗"),
                           [{item_2, BaseId}])};
        {ok, #item{base_id = "" = BaseId}}
            when TargetNum + Num > 3 ->
            {false,
             notice:format(lang:get("对方最多只能接收~ts个~ts"),
                           [{string_2, TargetNum + Num - 3},
                            {item_2, BaseId}])};
        {ok, I = #item{base_id = BaseId, bind = 0}} ->
            case friend_data:get_present(BaseId) of
                Cfg = #{type := 0, intimacy := Add,
                        received_limit := ReceivedLimit} ->
                    case check_give_present([charge, intimacy, relation],
                                            Role,
                                            Cfg#{target_id => TargetId})
                        of
                        true ->
                            NewReceivedCount = case ReceivedLimit of
                                                   1 -> ReceivedCount + Num;
                                                   _ -> ReceivedCount
                                               end,
                            check_give_items(T,
                                             Role,
                                             TargetId,
                                             Result#{total := Total + Num,
                                                     items :=
                                                         [I#item{bind = 1,
                                                                 quantity = Num}
                                                          | Items],
                                                     intimacy :=
                                                         Intimacy + Add * Num,
                                                     received_count :=
                                                         NewReceivedCount});
                        Else -> Else
                    end;
                _Err ->
                    logger:debug("~w", [_Err], friend, 1847),
                    {false,
                     notice:format(lang:get("~ts不可以赠送"), [{item_2, BaseId}])}
            end;
        _ -> {false, lang:get("找不到道具")}
    end.

do_combat_add_intimacy([], _, _) -> ok;
do_combat_add_intimacy([#fighter{rid = R, platform = P,
                                 zone_id = Z, type = 1, pid = Rpid,
                                 name = RName}
                        | T],
                       F = #fighter{rid = FR, platform = FP, zone_id = FZ,
                                    pid = Fpid, name = FName},
                       Intimacy) ->
    OwnerId = {R, P, Z},
    FriendId = {FR, FP, FZ},
    case is_friend(OwnerId, FriendId) of
        true ->
            case ets:lookup(friend_eachday_max_intimacy,
                            {OwnerId, FriendId})
                of
                [] ->
                    new_day_intimacy(OwnerId, FriendId, Intimacy),
                    new_day_intimacy(FriendId, OwnerId, Intimacy),
                    add_intimacy_evt(OwnerId, FriendId, Intimacy),
                    add_intimacy(OwnerId, FriendId, Intimacy),
                    add_intimacy(FriendId, OwnerId, Intimacy),
                    role:apply(async,
                               Rpid,
                               {friend, apply_role, [{refresh, FriendId}]}),
                    role:apply(async,
                               Fpid,
                               {friend, apply_role, [{refresh, OwnerId}]}),
                    Msg1 = notice:format(lang:get("与~ts的亲密度增加~ts"),
                                         [{role_2, FName},
                                          {string_2, 5, Intimacy}]),
                    Msg2 = notice:format(lang:get("与~ts的亲密度增加~ts"),
                                         [{role_2, RName},
                                          {string_2, 5, Intimacy}]),
                    notice:send({pid, Rpid}, 3, Msg1),
                    notice:send({pid, Fpid}, 3, Msg2);
                _ ->
                    Oldintimacy =
                        ets:lookup_element(friend_eachday_max_intimacy,
                                           {OwnerId, FriendId},
                                           2),
                    case Oldintimacy =:= 100 of
                        false ->
                            add_intimacy_evt(OwnerId, FriendId, Intimacy),
                            add_intimacy(OwnerId, FriendId, Intimacy),
                            add_intimacy(FriendId, OwnerId, Intimacy),
                            set_day_intimacy(FriendId, OwnerId, Intimacy),
                            role:apply(async,
                                       Rpid,
                                       {friend,
                                        apply_role,
                                        [{refresh, FriendId}]}),
                            role:apply(async,
                                       Fpid,
                                       {friend,
                                        apply_role,
                                        [{refresh, OwnerId}]}),
                            Msg1 = notice:format(lang:get("与~ts的亲密度增加~ts"),
                                                 [{role_2, FName},
                                                  {string_2, 5, Intimacy}]),
                            Msg2 = notice:format(lang:get("与~ts的亲密度增加~ts"),
                                                 [{role_2, RName},
                                                  {string_2, 5, Intimacy}]),
                            notice:send({pid, Rpid}, 3, Msg1),
                            notice:send({pid, Fpid}, 3, Msg2);
                        _ ->
                            role:apply(async,
                                       Rpid,
                                       {friend,
                                        apply_role,
                                        [{refresh, FriendId}]}),
                            role:apply(async,
                                       Fpid,
                                       {friend,
                                        apply_role,
                                        [{refresh, OwnerId}]}),
                            Msg1 = notice:format(lang:get("今日与~ts的组队可获得亲密度已满"),
                                                 [{role_2, FName}]),
                            Msg2 = notice:format(lang:get("今日与~ts的组队可获得亲密度已满"),
                                                 [{role_2, RName}]),
                            notice:send({pid, Rpid}, 3, Msg1),
                            notice:send({pid, Fpid}, 3, Msg2)
                    end
            end;
        _ -> ok
    end,
    do_combat_add_intimacy(T, F, Intimacy);
do_combat_add_intimacy([_ | T], F, Intimacy) ->
    do_combat_add_intimacy(T, F, Intimacy).

new_day_intimacy(OwnerId, FriendId, Intimacy) ->
    dets:insert(friend_eachday_max_intimacy,
                {{OwnerId, FriendId}, Intimacy}),
    ets:insert(friend_eachday_max_intimacy,
               {{OwnerId, FriendId}, Intimacy}).

set_day_intimacy(OwnerId, FriendId, Intimacy) ->
    Oldintimacy =
        ets:lookup_element(friend_eachday_max_intimacy,
                           {OwnerId, FriendId},
                           2),
    Newintimacy = Oldintimacy + Intimacy,
    catch dets:delete(friend_eachday_max_intimacy,
                      {FriendId, OwnerId}),
    catch dets:delete(friend_eachday_max_intimacy,
                      {OwnerId, FriendId}),
    dets:insert(friend_eachday_max_intimacy,
                {{OwnerId, FriendId}, Newintimacy}),
    dets:insert(friend_eachday_max_intimacy,
                {{FriendId, OwnerId}, Newintimacy}),
    ets:update_element(friend_eachday_max_intimacy,
                       {FriendId, OwnerId},
                       {2, Newintimacy}),
    ets:update_element(friend_eachday_max_intimacy,
                       {OwnerId, FriendId},
                       {2, Newintimacy}).

reset_intimacy(Role = #role{id = OwnerId}, _) ->
    catch dets:match_delete(friend_eachday_max_intimacy,
                            {{OwnerId, '_'}, '_'}),
    ets:match_delete(friend_eachday_max_intimacy,
                     {{OwnerId, '_'}, '_'}),
    catch dets:match_delete(friend_eachday_max_intimacy,
                            {{'_', OwnerId}, '_'}),
    ets:match_delete(friend_eachday_max_intimacy,
                     {{'_', OwnerId}, '_'}),
    {ok, Role}.

do_present_gl([], Role) -> {ok, Role};
do_present_gl([H | T], Role) ->
    case role_gain:do_notice([H], Role) of
        {ok, NewRole} -> do_present_gl(T, NewRole);
        {false, #gain{label = prac_exp, msg = Msg}} ->
            notice:return(Msg),
            do_present_gl(T, Role);
        Else -> Else
    end.

check_can_delete(Role, Target) ->
    case wedding:is_couple(Role, Target) of
        true -> {false, lang:get("对方是你的配偶，不能删除好友!")};
        false ->
            case teacher:is_teacher_relation(Role, Target) of
                {true, teacher} ->
                    {false, lang:get("对方是您的师父，请先解除师徒关系再进行删除")};
                {true, student} ->
                    {false, lang:get("对方是您的徒弟，请先解除师徒关系再进行删除")};
                false -> true
            end
    end.

add_present_buff([], Role) -> Role;
add_present_buff([{26013, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 31015),
    add_present_buff(T, TRole1);
add_present_buff([{29151, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22001),
    Gain = format:val_to_gain([{90000, 20000}]),
    case role_gain:do_notice(Gain, TRole1) of
        {ok, TRole2} -> add_present_buff(T, TRole2);
        _ -> add_present_buff(T, TRole1)
    end;
add_present_buff([{70028, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22001),
    add_present_buff(T, TRole1);
add_present_buff([{29050, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22003),
    Gain = format:val_to_gain([{90000, 20000}]),
    case role_gain:do_notice(Gain, TRole1) of
        {ok, TRole2} -> add_present_buff(T, TRole2);
        _ -> add_present_buff(T, TRole1)
    end;
add_present_buff([{29024, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22007),
    add_present_buff(T, TRole1);
add_present_buff([{20032, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 23101),
    add_present_buff(T, TRole1);
add_present_buff([{23021, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 23101),
    add_present_buff(T, TRole1);
add_present_buff([{29153, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 23101),
    add_present_buff(T, TRole1);
add_present_buff([{23220, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 31002),
    add_present_buff(T, TRole1);
add_present_buff([{23400, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 31003),
    add_present_buff(T, TRole1);
add_present_buff([{29975, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22008),
    add_present_buff(T, TRole1);
add_present_buff([{70742, _} | T], Role) ->
    {ok, TRole1} = buff:add_and_calc(Role, 22001),
    add_present_buff(T, TRole1);
add_present_buff([_ | T], Role) ->
    add_present_buff(T, Role).

need_log(Items) -> need_log(Items, false, []).

need_log([], Flag, LogInfo) -> {Flag, LogInfo};
need_log([#item{base_id = BaseId, quantity = Num}
          | Rest],
         Flag, LogInfo) ->
    case lists:member(BaseId, [23098, 23097, 23096]) of
        true ->
            ItemName = case item_data:get(BaseId) of
                           #item_base{name = N} -> N;
                           false -> util:flist(lang:get("无名道具~w"), [BaseId])
                       end,
            Info = util:flist("道具名:~ts,道具Id:~w,数量:~w|",
                              [ItemName, BaseId, Num]),
            need_log(Rest, true, [Info | LogInfo]);
        false -> need_log(Rest, Flag, LogInfo)
    end.

present_effects(_Args = #{id := Id, base_id := BaseId,
                          name := Name, target_id := TargetId,
                          target_name := TargetName, mail_items := MailItems,
                          items := Items}) ->
    case BaseId of
        20032 ->
            BuffId = 21100,
            role_group:apply(world, {buff, add_and_calc, [BuffId]}),
            Msg2 =
                notice:format(lang:get("~ts向~ts赠送了~ts，太浪漫了！全服在线玩家获得1小时经验加成。"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName},
                               {string_2, 3, item:attr(name, BaseId)}]),
            notice:cast(all, 5, Msg2),
            notice:effect(all, util:rand_list([1, 2, 3]));
        29227 ->
            BuffId = 21100,
            role_group:apply(world, {buff, add_and_calc, [BuffId]}),
            Msg2 =
                notice:format(lang:get("~ts向~ts赠送了~ts，太浪漫了！全服在线玩家获得1小时经验加成。"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName},
                               {string_2, 3, item:attr(name, BaseId)}]),
            notice:cast(all, 5, Msg2),
            notice:effect(all, util:rand_list([1, 2, 3]));
        29153 ->
            Msg2 =
                notice:format(lang:get("~ts 向 ~ts 赠送了 ~ts ，桃花满天真是浪漫啊！"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName},
                               {string_2, 3, item:attr(name, BaseId)}]),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30079);
        29051 ->
            Msg2 =
                notice:format(lang:get("~ts为~ts点燃了~ts，双方各获得一份~ts,祝大家儿童节快乐 {face_1,18}"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName},
                               {string_2, 3, item:attr(name, BaseId)},
                               {item_2, MailItems}]),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30080);
        23021 ->
            Msg2 =
                notice:format(lang:get("~ts向~ts赠送了生日礼物：在这特别的日子里，猪你生日快乐，愿快乐、幸福与一切美好伴随你"
                                       "{face_1,22}"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName}]),
            notice:cast(all, 11, Msg2),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30158);
        23216 ->
            Msg2 =
                notice:format(lang:get("~ts对~ts说：和你相爱相伴，一起经历了风雨彩虹，我们还将继续心灵相拥，白头偕老。情人节"
                                       "快乐{face_1, 3}"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName}]),
            notice:cast(all, 11, Msg2),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30185);
        23225 ->
            BuffId = 21100,
            role_group:apply(world, {buff, add_and_calc, [BuffId]}),
            Msg2 =
                notice:format(lang:get("~ts对~ts说：与君携手海誓山盟终不悔，心心相惜走遍天涯朝夕相对，愿我们一生幸福{fac"
                                       "e_1, 3}"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName}]),
            notice:cast(all, 11, Msg2),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30185);
        29975 ->
            Msg2 =
                notice:format(lang:get("~ts对~ts送出爱的祝福，在新的一年里，愿所有美好常伴你左右。"),
                              [{role_1, Id, Name},
                               {role_1, TargetId, TargetName}]),
            notice:cast(all, 5, Msg2),
            notice:effect(all, 30221);
        _ ->
            logger:debug("--------> ~w", [Items], friend, 2064),
            case lists:keyfind(23220, 1, Items) of
                false -> ignore;
                _ ->
                    Msg2 =
                        notice:format(lang:get("~ts对~ts发出爱的告白，今生今世，不离不弃，永生永世，相许相从！白色情人节快乐！"),
                                      [{role_1, Id, Name},
                                       {role_1, TargetId, TargetName}]),
                    notice:cast(all, 11, Msg2),
                    notice:cast(all, 5, Msg2),
                    notice:effect(all, 30186)
            end,
            case lists:keyfind(23400, 1, Items) of
                false -> ignore;
                _ ->
                    Msg3 =
                        notice:format(lang:get("~ts对~ts发出爱的告白，此生此世永结同心，相伴百年永不分离！214情人节快乐！"),
                                      [{role_1, Id, Name},
                                       {role_1, TargetId, TargetName}]),
                    notice:cast(all, 11, Msg3),
                    notice:cast(all, 5, Msg3),
                    notice:effect(all, 30186)
            end
    end.

reserve_exp(Role = #role{lev = Lev,
                         assets = Assets = #assets{reserve_exp = ReserveExp}},
            _BaseId) ->
    case levup_data:get_exp({2110, Lev}) of
        #{exp := Exp} ->
            NewRole = Role#role{assets =
                                    Assets#assets{reserve_exp =
                                                      ReserveExp + Exp}},
            Msg = notice:format(lang:get("增加了~ts储备经验"),
                                [{string_2, 5, Exp}]),
            notice:send(Role, 3, Msg),
            role_gain:push_exp(NewRole),
            NewRole;
        _ -> Role
    end;
reserve_exp(Role, _BaseId) -> Role.

give_quest_offer_present(Role = #role{id =
                                          OwnerId = {_, P, Z}},
                         Id, Msg) ->
    case package:fetch(1, Id, Role) of
        {ok, #item{extra = Extra, base_id = BaseId}}
            when BaseId =:= 23238 ->
            Loss = [#loss{label = item_id, val = [{Id, 1}]}],
            case role_gain:do(Loss, Role) of
                {ok, LossRole} ->
                    RewardId1 = case env:get(friend_offer_medal_id) of
                                    RewardId when is_integer(RewardId) ->
                                        RewardId;
                                    _ -> 1
                                end,
                    {_, RoleId, ""} = lists:keyfind(25, 1, Extra),
                    {_, _, Platform} = lists:keyfind(26, 1, Extra),
                    {_, ZoneId, ""} = lists:keyfind(27, 1, Extra),
                    {_, _, _RoleName} = lists:keyfind(28, 1, Extra),
                    TargetRoleId = {RoleId, Platform, ZoneId},
                    Msg1 =
                        io_lib:format("{protocal_1, ~ts, ~w, ~w, ~ts, ~w}",
                                      [lang:get("点击领取"),
                                       11891,
                                       RewardId1,
                                       P,
                                       Z]),
                    Msg2 = util:flist([Msg, Msg1]),
                    Info = chat:sns_msg(Role, TargetRoleId, Msg),
                    ToInfo = chat:sns_msg(Role, TargetRoleId, Msg2),
                    Result = case role_misc:check_conn_pid(TargetRoleId) of
                                 {true, _IsLocal, ConnPid} ->
                                     sys_conn:pack_send(10402, Info),
                                     sys_conn:pack_send(ConnPid, 10402, ToInfo),
                                     {ok, LossRole};
                                 {false, _IsLocal} ->
                                     case chat_mgr:send_offline(TargetRoleId,
                                                                10402,
                                                                ToInfo)
                                         of
                                         {false, Why} -> {false, Why};
                                         _ ->
                                             sys_conn:pack_send(10402, Info),
                                             {ok, LossRole}
                                     end;
                                 big_world_not_ready ->
                                     {false, lang:get("跨服暂未联通，暂时不能赠送")}
                             end,
                    case Result of
                        {ok, NewRole} ->
                            Leaders = case ets:lookup(friend_offer_medal,
                                                      OwnerId)
                                          of
                                          [{_, _Leaders}] -> _Leaders;
                                          _ -> []
                                      end,
                            OldTimes = case lists:keyfind(TargetRoleId,
                                                          1,
                                                          Leaders)
                                           of
                                           {TargetRoleId, _OldTimes} ->
                                               _OldTimes;
                                           _ -> 0
                                       end,
                            Leaders1 = lists:keystore(TargetRoleId,
                                                      1,
                                                      Leaders,
                                                      {TargetRoleId,
                                                       OldTimes + 1}),
                            NewFOR = {OwnerId, Leaders1},
                            ets:insert(friend_offer_medal, NewFOR),
                            dets:insert(friend_offer_medal, NewFOR),
                            NewId = {RewardId1, P, Z},
                            env:save(friend_offer_medal_id, RewardId1 + 1),
                            notice:send(Role,
                                        1,
                                        notice:format(lang:get("~ts已颁发给队长，谢谢你{face_1,3}"),
                                                      [{item_2,
                                                        [{23238, 1}]}])),
                            case role_misc:is_local_role(TargetRoleId) of
                                true ->
                                    update_quest_offer_present(TargetRoleId,
                                                               OwnerId,
                                                               NewId);
                                _ ->
                                    big_world:cast(Platform,
                                                   ZoneId,
                                                   friend,
                                                   update_quest_offer_present,
                                                   [TargetRoleId,
                                                    OwnerId,
                                                    NewId])
                            end,
                            {ok, NewRole};
                        Else -> Else
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("该物品不存在")}
    end.

update_quest_offer_present(TargetRoleId, RoleId, Id) ->
    OldGet = case ets:lookup(friend_offer_medal_get,
                             TargetRoleId)
                 of
                 [{_, _OldGet}] -> _OldGet;
                 _ -> []
             end,
    ets:insert(friend_offer_medal_get,
               {TargetRoleId, [{RoleId, Id} | OldGet]}),
    dets:insert(friend_offer_medal_get,
                {TargetRoleId, [{RoleId, Id} | OldGet]}),
    ok.

get_leader_present(Role = #role{id = RoleId}, Id) ->
    case ets:lookup(friend_offer_medal_get, RoleId) of
        [{_, OldGetList}] ->
            case lists:keyfind(Id, 2, OldGetList) of
                {GiveRoleId, _} ->
                    DayTimes = var:get_var(Role, day, 607, 0),
                    Reward = quest_offer_data:get_medal_reward(DayTimes +
                                                                   1),
                    Role1 = var:set_var(Role, day, 607, DayTimes + 1),
                    NewRole = case
                                  role_gain:do_notice(format:val_to_gain(Reward),
                                                      Role1)
                                  of
                                  {ok, GainRole} -> GainRole;
                                  {false, #gain{}} ->
                                      mail:send(Role,
                                                lang:get("背包已满"),
                                                lang:get("你在领取悬赏奖章奖励时,背包已满"),
                                                Reward),
                                      Role1
                              end,
                    Msg =
                        notice:format(lang:get("很高兴与你组队悬赏，感谢你的好评，我领取了~ts"),
                                      [{item_2, Reward}]),
                    Info = chat:sns_msg(Role, GiveRoleId, Msg),
                    sys_conn:pack_send(10402, Info),
                    ets:insert(friend_offer_medal_get,
                               {RoleId, lists:keydelete(Id, 2, OldGetList)}),
                    dets:insert(friend_offer_medal_get,
                                {RoleId, lists:keydelete(Id, 2, OldGetList)}),
                    case role_misc:check_conn_pid(GiveRoleId) of
                        {true, _IsLocal, ConnPid} ->
                            sys_conn:pack_send(ConnPid, 10402, Info),
                            ok;
                        {false, _IsLocal} ->
                            chat_mgr:send_offline(GiveRoleId, 10402, Info),
                            ok;
                        _ -> ok
                    end,
                    mail:send(GiveRoleId,
                              lang:get("队长的感谢信"),
                              lang:get("感谢你颁发给我的奖章，在茫茫人海中，有你这样的队员也是我的幸运{face_1,54}"),
                              [{90000, 50000}, {24029, 1}]),
                    {ok, NewRole};
                _ -> {false, lang:get("你已经领取过该奖励")}
            end;
        _ -> {false, lang:get("你已经领取过该奖励")}
    end.

update_gave_present([], Role) -> Role;
update_gave_present([{BaseId = 20042, Num} | T],
                    Role) ->
    Count = var:get_list_var(Role, day, 608, BaseId, 0),
    NRole = var:set_list_var(Role,
                             day,
                             608,
                             BaseId,
                             Count + Num),
    update_gave_present(T, NRole);
update_gave_present([_ | T], Role) ->
    update_gave_present(T, Role).

check_expression_bun(Role, Items) ->
    case lists:keyfind(22450, 1, Items) of
        {_, Num} when Num > 0 ->
            G = format:val_to_gain([{90000, 5000 * Num}]),
            case role_gain:do(G, Role) of
                {ok, NRole} -> {ok, NRole};
                {false, #gain{msg = Msg}} -> {false, Msg};
                _ -> false
            end;
        _ -> {ok, Role}
    end.

add_present_gain([], AddGain, _Args) -> AddGain;
add_present_gain([{Id, Num} | Rest], AddGain, Args) ->
    case friend_data:get_rand_list(Id) of
        RandList
            when is_list(RandList) andalso RandList =/= [] ->
            GainNumList = calc_gain_num(Num, RandList, 2, []),
            GainNum = calc_sum(GainNumList, 0),
            case friend_data:get_reward_id(Id) of
                RewardId when is_integer(RewardId) ->
                    add_present_gain(Rest,
                                     [{RewardId, GainNum} | AddGain],
                                     Args);
                _ -> add_present_gain(Rest, AddGain, Args)
            end;
        false -> add_present_gain(Rest, AddGain, Args)
    end;
add_present_gain([_ | Rest], AddGain, Args) ->
    add_present_gain(Rest, AddGain, Args).

calc_sum([], Sum) -> Sum;
calc_sum([{Num, _Ratio} | Rest], Sum) ->
    calc_sum(Rest, Sum + Num).

gm_cmd(clean, Lev, Time) ->
    Fun = fun (#friend_role{id = RoleId,
                            update_time = UpdateTime, lev = RoleLev},
               Rtn)
                  when UpdateTime < Time andalso RoleLev < Lev ->
                  [RoleId | Rtn];
              (_, Rtn) -> Rtn
          end,
    _DeleteL = ets:foldl(Fun, [], friend_role),
    logger:debug("删除的好友数据个数:~w",
                 [length(_DeleteL)],
                 friend,
                 2291),
    [ets:delete(friend_role, Id) || Id <- _DeleteL],
    [dets:delete(friend_role, Id) || Id <- _DeleteL],
    ok.

