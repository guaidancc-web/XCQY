-file("src/mod/map/map.erl", 1).

-module(map).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/1,
         stop/1,
         pack_send_to_all/3,
         is_blocked/4,
         active_region/3,
         push_block_region/3,
         add_listener/3,
         remove_listener/3,
         role_enter/2,
         role_enter/3,
         role_move/4,
         role_transmit/4,
         role_transmit/5,
         role_update/1,
         role_update/2,
         role_update_conn_pid/4,
         role_leave/1,
         role_status_update/1,
         unit_enter/2,
         unit_move/4,
         unit_move/3,
         unit_update/2,
         unit_update/1,
         unit_leave/2,
         unit_list/1,
         update_res_id/2,
         can_see/2,
         name/1,
         rand_pos/1,
         rand_pos2/1,
         rand_pos3/2,
         async_apply/2,
         apply_enter/6,
         send_all_dir/1,
         apply_check_enter_temple/1]).

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

-file("src/mod/map/map.erl", 59).

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

-file("src/mod/map/map.erl", 60).

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

-file("src/mod/map/map.erl", 61).

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

-file("src/mod/map/map.erl", 62).

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

-file("src/mod/map/map.erl", 63).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/map/map.erl", 64).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/map/map.erl", 65).

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

-file("src/mod/map/map.erl", 66).

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

-file("src/mod/map/map.erl", 67).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/map/map.erl", 68).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/map/map.erl", 69).

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

-file("src/mod/map/map.erl", 70).

-spec start_link(#map{}) -> {ok, pid()} |
                            ignore |
                            {error, term()}.

start_link(Map) ->
    gen_server:start_link(map, [Map], []).

-spec stop(pid()) -> ok.

stop(MapPid) when is_pid(MapPid) ->
    MapPid ! stop,
    ok;
stop(_) -> ok.

-spec active_region(MapId :: pos_integer(),
                    RegionId :: pos_integer(), Switch :: 0..1) -> ok.

active_region(MapId, RegionId, Switch) ->
    case map_mgr:pid(MapId) of
        {ok, MapPid} ->
            MapPid ! {active_region, RegionId, Switch},
            ok;
        _Err ->
            logger:error("~w", [_Err], map, 95),
            {error, map_id_error}
    end.

-spec is_blocked(MapId :: pos_integer(),
                 BaseId :: pos_integer(), X :: non_neg_integer(),
                 Y :: non_neg_integer()) -> true | false.

is_blocked(MapId, BaseId, X, Y) ->
    case map_data_walkable:active_region(BaseId) of
        false -> false;
        B when is_list(B) ->
            case catch ets:lookup(map_dynamic_block, MapId) of
                [{_MapId, Block}] ->
                    case find_block(Block, X, Y) of
                        true -> true;
                        false -> false
                    end;
                [] -> false;
                _ ->
                    logger:error("[~w]地图动态区域数据损坏", [BaseId], map, 114),
                    false
            end;
        _ ->
            logger:error("[~w]地图动态区域数据损坏", [BaseId], map, 118),
            false
    end.

-spec push_block_region(MapId :: pos_integer(),
                        BaseId :: pos_integer(), ConnPid :: pid()) -> ok.

push_block_region(MapId, BaseId, ConnPid) ->
    case map_data_walkable:active_region(BaseId) of
        false ->
            case catch ets:lookup(map_dynamic_block, MapId) of
                [{_MapId, Block}] ->
                    sys_conn:pack_send(ConnPid, 10103, {BaseId, Block});
                _ -> skip
            end;
        B when is_list(B) ->
            case catch ets:lookup(map_dynamic_block, MapId) of
                [{_MapId, Block}] ->
                    sys_conn:pack_send(ConnPid, 10103, {BaseId, Block});
                [] ->
                    logger:error("[~w]地图动态区域数据损坏, [~w]",
                                 [BaseId, util:get_stacktrace()],
                                 map,
                                 139),
                    sys_conn:pack_send(ConnPid, 10103, {BaseId, []});
                _Err ->
                    logger:error("[~w]地图动态区域无法查询[~w]",
                                 [BaseId, _Err],
                                 map,
                                 142),
                    sys_conn:pack_send(ConnPid, 10103, {BaseId, []})
            end;
        _ ->
            logger:error("[~w]地图动态区域数据损坏", [BaseId], map, 146),
            skip
    end,
    ok.

-spec pack_send_to_all(MapId :: pos_integer(),
                       Cmd :: pos_integer(), Data :: tuple()) -> ok |
                                                                 {error,
                                                                  term()}.

pack_send_to_all(MapId, Code, Data) ->
    case mapping:module(game_server, Code) of
        {ok, _Auth, _Caller, Parser, _ModName} ->
            case catch Parser:pack(srv, Code, Data) of
                {ok, Bin} -> send_to_all(MapId, Bin);
                Err ->
                    logger:error("打包数据出错[Code:~w][Err:~w]",
                                 [Code, Err],
                                 map,
                                 160),
                    {error, pack_error}
            end;
        {error, _Code} ->
            logger:error("模块影射失败[~w]:~w", [Code, Data], map, 164),
            {error, module_error}
    end.

-spec send_to_all(MapInfo :: pos_integer() | pid(),
                  Bin :: any()) -> ok | {error, term()}.

send_to_all(MapPid, Bin) when is_pid(MapPid) ->
    MapPid ! {send_to_all, Bin},
    ok;
send_to_all(MapId, Bin) ->
    case map_mgr:pid(MapId) of
        {ok, MapPid} ->
            MapPid ! {send_to_all, Bin},
            ok;
        _Err ->
            logger:error("~w", [_Err], map, 179),
            {error, map_id_error}
    end.

send_all_dir(Role = #role{pos =
                              #pos{map_grid_pid = Pid,
                                   map_base_id = BaseId}}) ->
    case role_convert:to(map_role, Role) of
        {ok, Mr} ->
            (map_data:get_mod(BaseId)):send_all_dir(Pid, Mr);
        {error, Reason} ->
            logger:error("角色转换失败: ~w", [Reason], map, 187)
    end,
    ok.

role_enter({Platform, ZoneId, {MapId, DestX, DestY}},
           Role) ->
    role_enter({Platform, ZoneId, MapId, DestX, DestY},
               Role);
role_enter({MapId, DestX, DestY}, Role) ->
    role_enter({MapId, DestX, DestY}, follow, Role);
role_enter({Platform, ZoneId, MapId, DestX, DestY},
           Role) ->
    role_enter({Platform, ZoneId, MapId, DestX, DestY},
               follow,
               Role);
role_enter({Platform,
            ZoneId,
            MapId,
            MapGridPid,
            DestX,
            DestY},
           Role) ->
    role_enter({Platform,
                ZoneId,
                MapId,
                MapGridPid,
                DestX,
                DestY},
               follow,
               Role).

role_enter({Platform, ZoneId, {MapId, DestX, DestY}},
           TeamEvt, Role) ->
    Data = #{map => {Platform, ZoneId, MapId}, x => DestX,
             y => DestY, grid => undefined, team => TeamEvt},
    find_enter(Data, Role);
role_enter({MapId, DestX, DestY}, TeamEvt, Role) ->
    Data = #{map => MapId, x => DestX, y => DestY,
             grid => undefined, team => TeamEvt},
    find_enter(Data, Role);
role_enter({Platform, ZoneId, MapId, DestX, DestY},
           TeamEvt, Role) ->
    Data = #{map => {Platform, ZoneId, MapId}, x => DestX,
             y => DestY, grid => undefined, team => TeamEvt},
    find_enter(Data, Role);
role_enter({Platform,
            ZoneId,
            MapId,
            MapGridPid,
            DestX,
            DestY},
           TeamEvt, Role) ->
    Data = #{map => {Platform, ZoneId, MapId}, x => DestX,
             y => DestY, grid => MapGridPid, team => TeamEvt},
    find_enter(Data, Role).

find_enter(#{map := MapInfo, x := DestX, y := DestY,
             grid := MapGridPid, team := TeamEvt},
           Role) ->
    case find_map(MapInfo) of
        {error, Reason} -> {error, Reason};
        {ok, Map = #map{id = 10009}} ->
            case check_enter_temple(Role) of
                true ->
                    do_enter(DestX, DestY, Map, MapGridPid, TeamEvt, Role);
                Else -> Else
            end;
        {ok, Map} ->
            do_enter(DestX, DestY, Map, MapGridPid, TeamEvt, Role)
    end.

find_map(MapId) when is_integer(MapId) ->
    case map_mgr:info(MapId) of
        {error, not_found} -> {error, lang:get("地图不存在, 无法进入")};
        {ok, Map} -> {ok, Map}
    end;
find_map({Platform, ZoneId, MapId}) ->
    case map_mgr:info(Platform, ZoneId, MapId) of
        {error, not_found} -> {error, lang:get("地图不存在，无法进入")};
        {error, _} -> {error, lang:get("域外时空失去联系，无法进入")};
        {ok, Map} -> {ok, Map}
    end;
find_map(_) -> {error, lang:get("地图不存在, 无法进入")}.

-spec role_move(non_neg_integer(), non_neg_integer(),
                Dir :: non_neg_integer(), #role{}) -> #role{}.

role_move(DestX, DestY, Dir,
          Role = #role{id = RoleId, name = RoleName, pid = Rpid,
                       pos =
                           Pos = #pos{map_pid = MapPid, map_base_id = MapBaseId,
                                      x = Sx, y = Sy}}) ->
    W = case map_data:get(MapBaseId) of
            {ok, #map_data{width = Width}} -> Width;
            _ -> 1500
        end,
    H = case map_data:get(MapBaseId) of
            {ok, #map_data{height = Height}} -> Height;
            _ -> 720
        end,
    Dx = if DestX =< 0 -> 0;
            DestX > W -> W;
            true -> DestX
         end,
    Dy = if DestY =< 0 -> 0;
            DestY > H -> H;
            true -> DestY
         end,
    MapPid !
        {role_move,
         RoleId,
         RoleName,
         Rpid,
         Sx,
         Sy,
         Dx,
         Dy,
         Dir},
    Role1 = Role#role{pos =
                          Pos#pos{x = Dx, y = Dy, dir = Dir}},
    team:sync_pos(Role1),
    camp_halloween:update_pos(Role1),
    role_trigger:fire(#evt_move_map{base_id = MapBaseId,
                                    x = Dx, y = Dy},
                      Role1).

role_transmit(Mode, Speed, DestX, DestY, Role) ->
    do_role_transmit(Mode, Speed, [{DestX, DestY}], Role).

role_transmit(Mode, Speed, DestList, Role)
    when is_list(DestList) ->
    do_role_transmit(Mode, Speed, DestList, Role).

do_role_transmit(Mode, Speed, DestList,
                 Role = #role{id = RoleId, pid = Rpid,
                              pos =
                                  Pos = #pos{map_pid = MapPid,
                                             map_base_id = MapBaseId, x = Sx,
                                             y = Sy},
                              s_looks = Looks, s_event = Event})
    when is_list(DestList) andalso is_pid(MapPid) ->
    {DestX, DestY} = lists:last(DestList),
    W = case map_data:get(MapBaseId) of
            {ok, #map_data{width = Width}} -> Width;
            _ -> 1500
        end,
    H = case map_data:get(MapBaseId) of
            {ok, #map_data{height = Height}} -> Height;
            _ -> 720
        end,
    Dx = if DestX =< 0 -> 0;
            DestX > W -> W;
            true -> DestX
         end,
    Dy = if DestY =< 0 -> 0;
            DestY > H -> H;
            true -> DestY
         end,
    MapPid !
        {role_transmit,
         RoleId,
         MapBaseId,
         Mode,
         Speed,
         Rpid,
         Sx,
         Sy,
         Dx,
         Dy,
         DestList,
         Looks,
         Event},
    Role1 = Role#role{pos = Pos#pos{x = Dx, y = Dy}},
    team:sync_transmit(Role1),
    camp_halloween:update_pos(Role1),
    role_trigger:fire(#evt_move_map{x = Dx, y = Dy}, Role1);
do_role_transmit(_Mode, _Speed, _DestList, Role) ->
    Role.

-spec role_update(#role{}) -> ok.

role_update(Role = #role{pos =
                             #pos{map_grid_pid = Pid, map_base_id = BaseId}}) ->
    case role_convert:to(map_role, Role) of
        {ok, Mr} -> (map_data:get_mod(BaseId)):update(Pid, Mr);
        {error, Reason} ->
            logger:error("角色转换失败: ~w", [Reason], map, 292)
    end,
    ok;
role_update(#role{name = _Name}) ->
    logger:debug("角色[~ts]没有在地图中，忽略掉该刷新请求",
                 [_Name],
                 map,
                 296),
    ignore.

role_update(Role = #role{pos =
                             #pos{map_pid = MapPid, map_grid_pid = GridPid}},
            to_map) ->
    case role_convert:to(map_role, Role) of
        {ok, Mr} -> MapPid ! {role_update, GridPid, Mr};
        {error, Reason} ->
            logger:error("角色转换失败: ~w", [Reason], map, 302)
    end,
    ok;
role_update(#role{name = _Name}, _) ->
    logger:debug("角色[~ts]没有在地图中，忽略掉该刷新请求",
                 [_Name],
                 map,
                 306),
    ignore.

role_status_update(Role = #role{pos =
                                    #pos{map_grid_pid = Pid,
                                         map_base_id = BaseId}}) ->
    case role_convert:to(map_role, Role) of
        {ok, Mr} ->
            (map_data:get_mod(BaseId)):update_status(Pid, Mr);
        {error, Reason} ->
            logger:error("角色转换失败: ~w", [Reason], map, 313)
    end,
    ok;
role_status_update(#role{name = _Name}) ->
    logger:debug("角色[~ts]没有在地图中，忽略掉该刷新请求",
                 [_Name],
                 map,
                 317),
    ignore.

-spec role_update_conn_pid(pid(), pid(), pid(),
                           pid()) -> ok.

role_update_conn_pid(MapPid, Rpid, ConnPid, NewConnPid)
    when is_pid(MapPid) ->
    MapPid !
        {role_update_conn_pid, Rpid, ConnPid, NewConnPid},
    ok;
role_update_conn_pid(_MapPid, _Rpid, _ConnPid,
                     _NewConnPid) ->
    ok.

-spec role_leave(#role{}) -> {ok, #role{}}.

role_leave(Role = #role{pos = undefined}) ->
    {ok, Role#role{pos = #pos{}}};
role_leave(Role = #role{pos = #pos{map = 0}}) ->
    {ok, Role};
role_leave(Role = #role{pos =
                            #pos{map_pid = undefined}}) ->
    {ok, Role};
role_leave(Role = #role{pid = Rpid,
                        pos =
                            #pos{last = Last, platform = _P, zone_id = _Zid,
                                 map = MapId, map_base_id = BaseId,
                                 map_pid = MapPid, x = X, y = Y}}) ->
    case is_pid(MapPid) of
        true -> MapPid ! {role_leave, Rpid};
        false -> ignore
    end,
    Role1 = Role#role{pos = #pos{map = 0, last = Last}},
    Role2 = role_trigger:fire(#evt_leave_map{id = MapId,
                                             base_id = BaseId, x = X, y = Y},
                              Role1),
    {ok, Role2}.

-spec unit_enter(pos_integer(), #map_unit{}) -> {ok,
                                                 pos_integer(),
                                                 pid(),
                                                 pid() | 0} |
                                                error.

unit_enter(MapId, MapUnit) ->
    case map_mgr:info(MapId) of
        {ok,
         #map{base_id = BaseId, pid = MapPid,
              grid_info = GridInfo}} ->
            MapPid ! {unit_enter, MapUnit},
            GridPid = case GridInfo of
                          [{GridPid1, _} | _] -> GridPid1;
                          _ -> 0
                      end,
            {ok, BaseId, MapPid, GridPid};
        _ -> error
    end.

-spec unit_move(MapPid, Unit, DestX,
                DestY) -> ok when MapPid :: pid(), Unit :: #unit{},
                                  DestX :: non_neg_integer(),
                                  DestY :: non_neg_integer().

unit_move(MapPid,
          #unit{id = UnitId, base_id = UnitBaseId,
                type = UnitType, disabled = Disabled},
          DestX, DestY) ->
    MapPid !
        {unit_move,
         UnitId,
         UnitBaseId,
         UnitType,
         DestX,
         DestY,
         Disabled},
    ok.

unit_move(UnitId, DestX, DestY) ->
    case unit_mgr:info(UnitId) of
        {ok, U = #unit{pos = #pos{map_pid = MapPid}}} ->
            unit_move(MapPid, U, DestX, DestY);
        _Else -> logger:debug("找不到单位 ~w", [_Else], map, 376)
    end.

-spec unit_update(#unit{}) -> ok.

unit_update(Unit = #unit{pos = #pos{map_pid = MapPid}})
    when is_pid(MapPid) ->
    {ok, MapUnit} = unit_convert:to(map_unit, Unit),
    unit_update(MapPid, MapUnit).

-spec unit_update(pid(), #map_unit{}) -> ok.

unit_update(MapPid, MapUnit) ->
    MapPid ! {unit_update, MapUnit},
    ok.

-spec unit_leave(pid(), UnitId :: tuple()) -> ok.

unit_leave(MapPid, UnitId) when is_pid(MapPid) ->
    MapPid ! {unit_leave, UnitId},
    ok;
unit_leave(MapPid, UnitId) ->
    logger:error("单位移除错误指令:[~w, ~w]",
                 [MapPid, UnitId],
                 map,
                 398),
    ok.

-spec unit_list(pid()) -> {ok, [#map_unit{}]} |
                          {error, term()}.

unit_list(MapPid) ->
    case catch gen_server:call(MapPid, get_unit_list, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

-spec update_res_id(pid(),
                    ResId :: pos_integer()) -> ok.

update_res_id(MapPid, ResId) ->
    MapPid ! {update_res_id, ResId},
    ok.

-spec async_apply(Pid :: pid(), MFA :: tuple()) -> ok |
                                                   false |
                                                   {error, term()}.

async_apply(#role{pos = #pos{map_pid = MapPid}}, MFA)
    when is_pid(MapPid) ->
    async_apply(MapPid, MFA);
async_apply(#role{}, _MFA) ->
    {false, lang:get("角色不在场景中")};
async_apply(MapPid, MFA) ->
    MapPid ! {async_apply, MFA},
    ok.

-spec can_see(Pos1 :: #pos{}, Pos2 :: #pos{}) -> true |
                                                 false.

can_see(Pos1, Pos2) ->
    case calc_distance(Pos1, Pos2) of
        {ok, {Dx, Dy}} when Dx =< 1 andalso Dy < 1 -> true;
        _Other -> false
    end.

-spec add_listener(pid(), atom, pid()) -> ok.

add_listener(MapPid, Type, RecvPid) ->
    MapPid ! {add_listener, Type, RecvPid}.

-spec remove_listener(pid(), atom, pid()) -> ok.

remove_listener(MapPid, Type, RecvPid) ->
    MapPid ! {remove_listener, Type, RecvPid},
    ok.

name(BaseId) when is_integer(BaseId) ->
    case map_data:get(BaseId) of
        {ok, #map_data{name = Name}} -> Name;
        _ -> ""
    end;
name(#map{name = Name}) -> Name;
name(_) -> "".

rand_pos(MapId) ->
    case map_data_walkable:get_pos_len(MapId) of
        Len when Len > 0 ->
            Idx = util:rand(1, Len),
            case map_data_walkable:get_pos(MapId, Idx) of
                List = [_ | _] -> util:rand_list(List);
                _ ->
                    logger:error("随机地图坐标时,无法获取随机坐标[~w][~w][~w]",
                                 [MapId, Len, Idx],
                                 map,
                                 460),
                    case map_data:get(MapId) of
                        {ok, #map_data{revive = [{X, Y} | _]}} -> {X, Y};
                        _ -> false
                    end
            end;
        _ ->
            logger:error("随机地图坐标时,无法获取随机列表长度[~w]",
                         [MapId],
                         map,
                         467),
            case map_data:get(MapId) of
                {ok, #map_data{revive = [{X, Y} | _]}} -> {X, Y};
                _ -> false
            end
    end.

rand_pos2(MapId) ->
    case get_rand_pos2(MapId) of
        List = [_ | _] -> util:rand_list(List);
        _ -> rand_pos(MapId)
    end.

rand_pos3(MapId, MapBaseId) ->
    case map_data_walkable:get_pos_len(MapBaseId) of
        Len when Len > 0 ->
            Idx = util:rand(1, Len),
            case map_data_walkable:get_pos(MapBaseId, Idx) of
                List = [_ | _] ->
                    case catch ets:lookup(map_dynamic_block, MapId) of
                        [{_MapId, Block}] ->
                            NewList = List -- Block,
                            util:rand_list(NewList);
                        _ -> util:rand_list(List)
                    end;
                _ ->
                    logger:error("随机地图坐标时,无法获取随机坐标[~w][~w][~w]",
                                 [MapBaseId, Len, Idx],
                                 map,
                                 496),
                    case map_data:get(MapBaseId) of
                        {ok, #map_data{revive = [{X, Y} | _]}} -> {X, Y};
                        _ -> false
                    end
            end;
        _ ->
            logger:error("随机地图坐标时,无法获取随机列表长度[~w][~w]",
                         [MapBaseId],
                         map,
                         503),
            case map_data:get(MapBaseId) of
                {ok, #map_data{revive = [{X, Y} | _]}} -> {X, Y};
                _ -> false
            end
    end.

init([Map = #map{id = MapId, base_id = BaseId}]) ->
    process_flag(trap_exit, true),
    put(role_conn, []),
    put(role_pid, []),
    put(unit_list, []),
    put(map_grid_mode, map_data:get_mod(BaseId)),
    {ok, GridPid} = grid_start(Map),
    NewMap = Map#map{pid = self(),
                     grid_info = [{GridPid, 0}]},
    load_dynamic(MapId, BaseId),
    sync(NewMap),
    {ok, NewMap}.

handle_call(get_unit_list, _From, State) ->
    {reply, {ok, get(unit_list)}, State};
handle_call(_Request, _From, Map) -> {noreply, Map}.

handle_cast(_Msg, Map) -> {noreply, Map}.

handle_info({role_enter,
             MapRole = #map_role{rid = Rid, platform = Platform,
                                 zone_id = ZoneId, pid = Pid,
                                 conn_pid = ConnPid, name = _Name, x = X, y = Y,
                                 ride = RoleRide, event = RoleEvent,
                                 speed = RoleSpeed},
             MapGridPid,
             TeamEvt},
            Map = #map{id = MapId, base_id = MapBaseId,
                       res_id = ResId, num = Num, width = W, height = H}) ->
    case get({role, Pid}) of
        undefined ->
            case get_layer(Map, MapGridPid) of
                {NewGridInfo, Gpid} ->
                    Dx = if X =< 0 -> 0;
                            X > W -> W;
                            true -> X
                         end,
                    Dy = if Y =< 0 -> 0;
                            Y > H -> H;
                            true -> Y
                         end,
                    Mr = MapRole#map_role{grid_pid = Gpid, x = Dx, y = Dy},
                    put({role, Pid}, Mr),
                    put(role_conn, [ConnPid | get(role_conn)]),
                    put(role_pid, [Pid | get(role_pid)]),
                    put({role_ref, Pid}, erlang:monitor(process, Pid)),
                    sys_conn:pack_send(ConnPid,
                                       10110,
                                       {MapBaseId,
                                        ResId,
                                        Dx,
                                        Dy,
                                        RoleRide,
                                        RoleEvent,
                                        RoleSpeed}),
                    (get(map_grid_mode)):enter(Gpid, Mr),
                    NewMap = Map#map{grid_info = NewGridInfo,
                                     num = Num + 1},
                    sync(NewMap),
                    Event = #evt_map_role_enter{id = Rid,
                                                platform = Platform,
                                                zone_id = ZoneId,
                                                map_id = MapId,
                                                map_base_id = MapBaseId, x = Dx,
                                                y = Dy},
                    event(role, Event),
                    role:apply(async,
                               Pid,
                               {map,
                                apply_enter,
                                [Platform, ZoneId, MapBaseId, Gpid, TeamEvt]}),
                    {noreply, NewMap};
                _ ->
                    logger:error("角色[~ts]请求进入的地图层[~w]不存在",
                                 [_Name, MapGridPid],
                                 map,
                                 570),
                    self() ! {role_enter, MapRole, undefined, TeamEvt},
                    {noreply, Map}
            end;
        _ ->
            logger:debug("角色[~ts]进入地图失败，已经在地图中，不能重复进入",
                         [_Name],
                         map,
                         575),
            {noreply, Map}
    end;
handle_info({update_res_id, ResId}, Map = #map{}) ->
    NewMap = Map#map{res_id = ResId},
    {ok, Msg} = proto_101:pack(srv, 10111, {ResId}),
    do_cast(get(role_conn), Msg),
    sync(NewMap),
    {noreply, NewMap};
handle_info({add_listener, Type, Pid}, State)
    when is_atom(Type) andalso is_pid(Pid) ->
    logger:debug("地图接收到事件增加：~w ~w", [Type, Pid], map, 589),
    case get({listener, Type}) of
        undefined -> put({listener, Type}, [Pid]);
        L -> put({listener, Type}, [Pid | L])
    end,
    {noreply, State};
handle_info({add_listener, _Type, _Pid}, State) ->
    {noreply, State};
handle_info({remove_listener, Type, Pid}, State) ->
    logger:debug("地图接收到事件删除：~w ~w", [Type, Pid], map, 600),
    case get({listener, Type}) of
        undefined -> ignore;
        L -> put({listener, Type}, lists:delete(Pid, L))
    end,
    {noreply, State};
handle_info({role_update_conn_pid,
             RolePid,
             ConnPid,
             NewConnPid},
            Map) ->
    case get({role, RolePid}) of
        Mr = #map_role{x = X, y = Y, grid_pid = GridPid} ->
            put({role, RolePid},
                Mr#map_role{conn_pid = NewConnPid}),
            put(role_conn,
                [NewConnPid | lists:delete(ConnPid, get(role_conn))]),
            (get(map_grid_mode)):update_conn_pid(GridPid,
                                                 RolePid,
                                                 X,
                                                 Y,
                                                 ConnPid,
                                                 NewConnPid);
        _ -> ignore
    end,
    {noreply, Map};
handle_info({role_move,
             RoleId,
             _RoleName,
             Rpid,
             Sx,
             Sy,
             Dx,
             Dy,
             Dir},
            Map = #map{id = MapId, base_id = BaseId, width = _W,
                       height = _H}) ->
    case get({role, Rpid}) of
        R = #map_role{grid_pid = GridPid, event = Event,
                      x = SrcX, y = SrcY} ->
            put({role, Rpid},
                R#map_role{x = Dx, y = Dy, dir = Dir}),
            (get(map_grid_mode)):move(GridPid,
                                      Rpid,
                                      SrcX,
                                      SrcY,
                                      Dx,
                                      Dy,
                                      Dir),
            event(role_move,
                  #evt_map_role_move{role_id = RoleId, role_pid = Rpid,
                                     map_id = MapId, map_base_id = BaseId,
                                     event = Event, dx = Dx, dy = Dy, sx = Sx,
                                     sy = Sy});
        _ -> logger:debug("角色移动处理失败，该角色不在地图中", [], map, 626)
    end,
    {noreply, Map};
handle_info({role_transmit,
             RoleId,
             BaseId,
             Mode,
             Speed,
             Rpid,
             Sx,
             Sy,
             Dx,
             Dy,
             DestList,
             Looks,
             Event},
            Map = #map{id = MapId, base_id = BaseId, width = W,
                       height = H})
    when Dx =< W andalso Dy =< H ->
    case get({role, Rpid}) of
        R = #map_role{grid_pid = GridPid, x = SrcX, y = SrcY} ->
            put({role, Rpid},
                R#map_role{x = Dx, y = Dy, looks = Looks,
                           event = Event}),
            (get(map_grid_mode)):transmit(GridPid,
                                          BaseId,
                                          Mode,
                                          Speed,
                                          Rpid,
                                          SrcX,
                                          SrcY,
                                          Dx,
                                          Dy,
                                          DestList,
                                          Looks),
            event(role_move,
                  #evt_map_role_move{role_id = RoleId, role_pid = Rpid,
                                     map_id = MapId, map_base_id = BaseId,
                                     event = Event, dx = Dx, dy = Dy, sx = Sx,
                                     sy = Sy});
        _ -> logger:debug("角色同地图传送处理失败，该角色不在地图中", [], map, 638)
    end,
    {noreply, Map};
handle_info({role_update,
             GridPid,
             Mr = #map_role{pid = Rpid, looks = Looks,
                            event = Event}},
            Map = #map{}) ->
    case get({role, Rpid}) of
        R = #map_role{} ->
            put({role, Rpid},
                R#map_role{looks = Looks, event = Event}),
            (get(map_grid_mode)):update(GridPid, Mr);
        _ -> logger:debug("角色同地图传送处理失败，该角色不在地图中", [], map, 649)
    end,
    {noreply, Map};
handle_info({send_to_all, Bin}, State) ->
    do_cast(get(role_conn), Bin),
    {noreply, State};
handle_info({'DOWN', _Ref, _Type, Rpid, _Reason},
            Map) ->
    {noreply, do_leave(Map, get({role, Rpid}))};
handle_info({role_leave, Rpid}, Map) ->
    case get({role, Rpid}) of
        undefined ->
            logger:debug("角色离开地图失败，该角色不在地图中", [], map, 666),
            {noreply, Map};
        _ -> {noreply, do_leave(Map, get({role, Rpid}))}
    end;
handle_info({unit_enter,
             MapUnit = #map_unit{id = UnitId, name = _Name, x = X,
                                 y = Y}},
            State = #map{width = W, height = H}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
        false ->
            Dx = if X =< 0 -> 0;
                    X > W -> W;
                    true -> X
                 end,
            Dy = if Y =< 0 -> 0;
                    Y > H -> H;
                    true -> Y
                 end,
            Unit = MapUnit#map_unit{x = Dx, y = Dy},
            put(unit_list, [Unit | UnitList]),
            {ok, Msg} = proto_101:pack(srv, 10160, MapUnit),
            do_cast(get(role_conn), Msg);
        _ -> ignore
    end,
    {noreply, State};
handle_info({unit_move,
             UnitId = {BattleId, Id},
             _UnitBaseId,
             _UnitType,
             DestX,
             DestY,
             _Disabled},
            State = #map{id = _MapId, width = W, height = H}) ->
    UnitList = get(unit_list),
    NewState = case lists:keyfind(UnitId,
                                  #map_unit.id,
                                  UnitList)
                   of
                   false ->
                       logger:debug("无效的移动操作", [], map, 694),
                       State;
                   N = #map_unit{name = _Name, x = Sx, y = Sy} ->
                       Dx = if DestX =< 0 -> 0;
                               DestX > W -> W;
                               true -> DestX
                            end,
                       Dy = if DestY =< 0 -> 0;
                               DestY > H -> H;
                               true -> DestY
                            end,
                       NewN = N#map_unit{x = Dx, y = Dy},
                       put(unit_list,
                           lists:keyreplace(UnitId,
                                            #map_unit.id,
                                            UnitList,
                                            NewN)),
                       {ok, Msg} = proto_101:pack(srv,
                                                  10164,
                                                  {BattleId,
                                                   Id,
                                                   Sx,
                                                   Sy,
                                                   Dx,
                                                   Dy}),
                       do_cast(get(role_conn), Msg),
                       State
               end,
    {noreply, NewState};
handle_info({unit_update,
             MapUnit = #map_unit{id = UnitId}},
            State = #map{}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
        false -> ignore;
        #map_unit{x = X, y = Y} ->
            NewN = MapUnit#map_unit{x = X, y = Y},
            put(unit_list,
                lists:keyreplace(UnitId, #map_unit.id, UnitList, NewN)),
            {ok, Msg} = proto_101:pack(srv, 10166, NewN),
            do_cast(get(role_conn), Msg)
    end,
    {noreply, State};
handle_info({unit_leave, UnitId},
            State = #map{id = _MapId, base_id = _MapBaseId}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
        false ->
            logger:debug("离开地图失败:地图单位[~w]不在地图中",
                         [UnitId],
                         map,
                         726),
            {noreply, State};
        _Unit = #map_unit{base_id = _BaseId} ->
            put(unit_list,
                lists:keydelete(UnitId, #map_unit.id, UnitList)),
            {ok, Msg} = proto_101:pack(srv, 10162, UnitId),
            do_cast(get(role_conn), Msg),
            {noreply, State}
    end;
handle_info({active_region, RegionId, Switch},
            State = #map{id = MapId, base_id = BaseId}) ->
    case map_data_walkable:active_region(BaseId) of
        false ->
            logger:error("[~w]地图动态区域数据缺失", [BaseId], map, 740),
            ok;
        Block when is_list(Block) ->
            case lists:keyfind(RegionId, 1, Block) of
                false ->
                    logger:error("[~w]地图动态区域数据无法找到区域[~w]",
                                 [BaseId, RegionId],
                                 map,
                                 745),
                    ok;
                {_, XyPos} when is_list(XyPos) ->
                    switch_active_region(BaseId, MapId, Switch, XyPos);
                _ ->
                    logger:error("[~w]地图动态区域数据无法找到区域[~w]",
                                 [BaseId, RegionId],
                                 map,
                                 750),
                    ok
            end;
        _ ->
            logger:error("[~w]地图动态区域数据损坏", [BaseId], map, 754),
            ok
    end,
    {noreply, State};
handle_info({switch_active_region, Switch, Region},
            State = #map{id = MapId, base_id = BaseId})
    when is_list(Region) ->
    switch_active_region(BaseId, MapId, Switch, Region),
    {noreply, State};
handle_info(cancel_dynamic_region,
            State = #map{id = MapId, base_id = BaseId}) ->
    cancel_dynamic_region(BaseId, MapId),
    {noreply, State};
handle_info({async_apply, MFA}, State) ->
    lists:foreach(fun (Pid) ->
                          catch role:apply(async, Pid, MFA)
                  end,
                  get(role_pid)),
    {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info({'EXIT', _, normal}, Map) -> {noreply, Map};
handle_info(_Info, Map = #map{base_id = BaseId}) ->
    logger:error("地图[~w]收到未知消息: ~w",
                 [BaseId, _Info],
                 map,
                 785),
    {noreply, Map}.

terminate(_Reason,
          #map{id = Id, grid_info = GridInfo,
               base_id = BaseId}) ->
    lists:map(fun ({Pid, _}) ->
                      (get(map_grid_mode)):stop(Pid)
              end,
              GridInfo),
    del_dynamic(Id, BaseId),
    catch ets:delete(map_info, Id),
    lists:foreach(fun (#map_unit{activity = 0,
                                 id = UnitId}) ->
                          catch ets:delete(unit_info, UnitId),
                          ok;
                      (_) -> skip
                  end,
                  get(unit_list)),
    logger:debug("关闭地图：Id:~w BaseId:~w",
                 [Id, BaseId],
                 map,
                 804),
    ok.

code_change(_OldVsn, Map, _Extra) -> {ok, Map}.

load_dynamic(MapId, BaseId) ->
    case map_data_walkable:active_region(BaseId) of
        false -> ok;
        Block when is_list(Block) ->
            do_load_dynamic(MapId, Block, []);
        _Err ->
            logger:error("加载动态阻挡区域失败:~w", [_Err], map, 820),
            ok
    end.

do_load_dynamic(MapId, [], Block) ->
    ets:insert(map_dynamic_block, {MapId, Block});
do_load_dynamic(MapId, [{_Id, B} | T], Block) ->
    do_load_dynamic(MapId, T, B ++ Block).

del_dynamic(MapId, BaseId) ->
    case map_data_walkable:active_region(BaseId) of
        false -> ok;
        Block when is_list(Block) ->
            catch ets:delete(map_dynamic_block, MapId),
            ok;
        _Err ->
            logger:error("删除动态阻挡区域失败:~w", [_Err], map, 837),
            ok
    end.

add_block(Block, [], AddBlock) -> {Block, AddBlock};
add_block(Block, [{X, Y} | T], AddBlock) ->
    case find_block(Block, X, Y) of
        true -> add_block(Block, T, AddBlock);
        false ->
            add_block([{X, Y} | Block], T, [{X, Y} | AddBlock])
    end.

find_block([], _X, _Y) -> false;
find_block([{X, Y} | _T], X, Y) -> true;
find_block([_ | T], X, Y) -> find_block(T, X, Y).

switch_active_region(BaseId, MapId, 1, XyPos) ->
    case catch ets:lookup(map_dynamic_block, MapId) of
        [{_MapId, Block}] ->
            {NewBlock, AddBlock} = add_block(Block, XyPos, []),
            ets:insert(map_dynamic_block, {MapId, NewBlock}),
            {ok, Msg} = proto_101:pack(srv,
                                       10102,
                                       {BaseId, 1, AddBlock}),
            do_cast(get(role_conn), Msg),
            ok;
        [] ->
            logger:info("地图不存在动态区域:~w,现在进行动态区域设置",
                        [MapId],
                        map,
                        868),
            {NewBlock, AddBlock} = add_block([], XyPos, []),
            ets:insert(map_dynamic_block, {MapId, NewBlock}),
            {ok, Msg} = proto_101:pack(srv,
                                       10102,
                                       {BaseId, 1, AddBlock}),
            do_cast(get(role_conn), Msg),
            ok;
        _Err ->
            logger:error("查询地图动态区域失败:~w", [_Err], map, 875),
            ok
    end;
switch_active_region(BaseId, MapId, 0, XyPos) ->
    case catch ets:lookup(map_dynamic_block, MapId) of
        [{_MapId, Block}] ->
            NewBlock = Block -- XyPos,
            ets:insert(map_dynamic_block, {MapId, NewBlock}),
            {ok, Msg} = proto_101:pack(srv,
                                       10102,
                                       {BaseId, 0, XyPos}),
            do_cast(get(role_conn), Msg),
            ok;
        [] ->
            logger:error("地图不存在动态区域:~w", [MapId], map, 888),
            ok;
        _Err ->
            logger:error("查询地图动态区域失败:~w", [_Err], map, 891),
            ok
    end;
switch_active_region(_, _, _, _) -> ok.

cancel_dynamic_region(BaseId, MapId) ->
    case catch ets:lookup(map_dynamic_block, MapId) of
        [{_MapId, Block}] ->
            NewBlock = [],
            ets:insert(map_dynamic_block, {MapId, NewBlock}),
            {ok, Msg} = proto_101:pack(srv,
                                       10102,
                                       {BaseId, 0, Block}),
            do_cast(get(role_conn), Msg),
            ok;
        [] ->
            logger:error("地图不存在动态区域:~w", [MapId], map, 906),
            ok;
        _Err ->
            logger:error("查询地图动态区域失败:~w", [_Err], map, 909),
            ok
    end.

sync(Map) -> ets:insert(map_info, Map).

event(Type, Evt) ->
    case get({listener, Type}) of
        undefined -> ignore;
        Pids -> send_event(Pids, Evt)
    end.

send_event([], _Evt) -> ok;
send_event([Pid | T], Evt) ->
    Pid ! {event, Evt},
    send_event(T, Evt).

do_enter(DestX, DestY, #map{width = W, height = H},
         _MapGridPid, _TeamEvt, _Role)
    when DestX < 0 orelse
             DestY < 0 orelse DestX > W orelse DestY > H ->
    {error, lang:get("地图坐标错误")};
do_enter(DestX, DestY,
         Map = #map{id = MapId, platform = Platform,
                    zone_id = ZoneId, base_id = BaseId, pid = Pid,
                    condition = Cond},
         MapGridPid, TeamEvt,
         Role = #role{id = RoleId, pos = OldPos,
                      s_event = Event}) ->
    case role_cond:check(Cond, Role) of
        {false, #condition{msg = Msg}} -> {error, Msg};
        true ->
            {ok, Role1 = #role{pos = Pos}} = role_leave(Role),
            Dir = case {OldPos, Pos} of
                      {#pos{map = MapId, dir = Dir1}, _} -> Dir1;
                      {_, #pos{dir = Dir1}} -> Dir1;
                      _ -> 0
                  end,
            Pos1 = Pos#pos{platform = Platform, zone_id = ZoneId,
                           map = MapId, map_base_id = BaseId, map_pid = Pid,
                           x = DestX, y = DestY, hidden = 1, dir = Dir},
            NewEvent = case Event of
                           2 ->
                               case BaseId =/= 30001 of
                                   true -> 0;
                                   false -> Event
                               end;
                           28 ->
                               case lists:member(BaseId, [30012, 30013]) of
                                   false ->
                                       logger:debug("进入不是家园的地图:~w",
                                                    [MapId],
                                                    map,
                                                    953),
                                       family_mgr ! {leave, RoleId},
                                       0;
                                   true -> Event
                               end;
                           _ -> Event
                       end,
            Role2 = Role1#role{pos = Pos1, s_event = NewEvent},
            Role3 = special_enter(Role2, Role),
            Role4 = role_fly:map_enter_check_fly(Role3),
            Role5 = map_combat:add_trigger(Map, Role4),
            {ok, MapRole} = role_convert:to(map_role, Role5),
            Pid ! {role_enter, MapRole, MapGridPid, TeamEvt},
            {ok, Role5}
    end.

apply_enter(Role = #role{pos =
                             Pos = #pos{map_base_id = BaseId}},
            _Platform, _ZoneId, BaseId, Gpid, TeamEvt) ->
    Role1 = Role#role{pos = Pos#pos{map_grid_pid = Gpid}},
    team:enter_map(Role1, TeamEvt),
    {ok, Role1};
apply_enter(#role{name = Name,
                  pos =
                      #pos{map_base_id = BaseId, platform = Bp,
                           zone_id = Bz}},
            Platform, ZoneId, NewBaseId, _Gpid, _TeamEvt) ->
    logger:error("角色[~ts]收到非当前地图信息: [~ts:~w:~w]=/=[~ts:~w:~w]",
                 [Name, Bp, Bz, BaseId, Platform, ZoneId, NewBaseId],
                 map,
                 980),
    ok.

do_leave(Map, undefined) -> Map;
do_leave(Map = #map{id = MapId, grid_info = GridInfo,
                    base_id = MapBaseId, num = Num},
         #map_role{pid = Rpid, conn_pid = ConnPid, rid = Rid,
                   platform = Platform, zone_id = ZoneId, x = X, y = Y}) ->
    case erase({role, Rpid}) of
        #map_role{grid_pid = GridPid} ->
            {Gpid, Gnum} = case lists:keyfind(GridPid, 1, GridInfo)
                               of
                               {GridPid, GridNum} -> {GridPid, GridNum - 1};
                               false -> {0, 0}
                           end,
            erlang:demonitor(get({role_ref, Rpid})),
            put(role_conn, lists:delete(ConnPid, get(role_conn))),
            put(role_pid, lists:delete(Rpid, get(role_pid))),
            erase({role_ref, Rpid}),
            (get(map_grid_mode)):leave(GridPid,
                                       Rpid,
                                       X,
                                       Y,
                                       Rid,
                                       Platform,
                                       ZoneId),
            NewMap = case Gnum =< 0 of
                         true ->
                             (get(map_grid_mode)):stop(GridPid),
                             Map#map{grid_info =
                                         lists:keydelete(GridPid, 1, GridInfo),
                                     num = Num - 1};
                         false ->
                             Map#map{grid_info =
                                         lists:keyreplace(GridPid,
                                                          1,
                                                          GridInfo,
                                                          {Gpid, Gnum}),
                                     num = Num - 1}
                     end,
            sync(NewMap),
            event(role,
                  #evt_map_role_leave{role_pid = Rpid, map_id = MapId,
                                      map_base_id = MapBaseId}),
            NewMap;
        _ ->
            logger:debug("角色离开地图处理失败，该角色不在地图中", [], map, 1009),
            Map
    end.

do_cast([], _Bin) -> ok;
do_cast([ConnPid | T], Bin) ->
    ConnPid ! {send_data, Bin},
    do_cast(T, Bin).

grid_start(#map{id = MapId, base_id = BaseId, width = W,
                height = H}) ->
    (get(map_grid_mode)):start_link(#map_grid{map_id =
                                                  MapId,
                                              base_id = BaseId,
                                              map_pid = self(), width = W,
                                              height = H}).

get_layer(#map{grid_info = GridInfo}, MapGridPid)
    when is_pid(MapGridPid) ->
    case lists:keyfind(MapGridPid, 1, GridInfo) of
        {Gpid, Gnum} ->
            {lists:keyreplace(Gpid, 1, GridInfo, {Gpid, Gnum + 1}),
             Gpid};
        _ -> false
    end;
get_layer(Map = #map{base_id = MapBaseId,
                     grid_info = GridInfo, num = Num},
          _MapGridPid) ->
    MaxNum = case map_data:get(MapBaseId) of
                 {ok, #map_data{max_pre_layer = Max}} -> Max;
                 _ -> 999999
             end,
    {GridPid, GridNum} = do_get_layer(GridInfo,
                                      MaxNum,
                                      Num),
    {GFlag, Gpid, Gnum} = case GridNum >= MaxNum of
                              false -> {false, GridPid, GridNum};
                              true ->
                                  case grid_start(Map) of
                                      {ok, NewGridPid} -> {true, NewGridPid, 1};
                                      _ -> {false, GridPid, GridNum}
                                  end
                          end,
    case GFlag of
        true -> {GridInfo ++ [{Gpid, Gnum}], Gpid};
        false ->
            {lists:keyreplace(Gpid, 1, GridInfo, {Gpid, Gnum + 1}),
             Gpid}
    end.

do_get_layer([], _MaxNum, _Num) -> {0, 999999};
do_get_layer([H | _T], MaxNum, Num) when Num < MaxNum ->
    H;
do_get_layer(LayerL, MaxNum, Num) ->
    N = util:ceil(Num / MaxNum),
    L = lists:sublist(LayerL, 1, N),
    [H | _] = lists:keysort(2, L),
    H.

calc_distance(#pos{map_pid = MapPid, x = X1, y = Y1},
              #pos{map_pid = MapPid, x = X2, y = Y2}) ->
    Dx = erlang:abs(util:floor(X1 / 600) -
                        util:floor(X2 / 600)),
    Dy = erlang:abs(util:floor(Y1 / 370) -
                        util:floor(Y2 / 370)),
    {ok, {Dx, Dy}};
calc_distance(_, _) -> false.

special_enter(Role,
              _OldRole = #role{pos = #pos{map = 60001}}) ->
    {ok, Role1} = buff:del(Role, [20000]),
    Role2 = attr:calc_and_push(Role1),
    Role2;
special_enter(Role, _) -> Role.

get_rand_pos2(10002) ->
    [{274, 1280},
     {970, 1672},
     {544, 1322},
     {1400, 1682},
     {1682, 1720},
     {1986, 1742},
     {1622, 1144},
     {1322, 966},
     {1582, 532},
     {2084, 560},
     {2418, 592}];
get_rand_pos2(10003) ->
    [{2724, 2386},
     {2472, 2244},
     {2230, 2786},
     {656, 2352},
     {882, 2164},
     {1062, 1904},
     {848, 1638},
     {2048, 862},
     {1864, 398},
     {2584, 522},
     {1262, 356},
     {704, 384},
     {434, 848}];
get_rand_pos2(10004) ->
    [{920, 1826},
     {1182, 2309},
     {2162, 2353},
     {2658, 2043},
     {2724, 821},
     {2109, 443},
     {1451, 553}];
get_rand_pos2(10007) ->
    [{1406, 2960},
     {1044, 2936},
     {360, 2614},
     {748, 2290},
     {368, 1462},
     {406, 1124},
     {726, 1096},
     {1146, 948},
     {1682, 424},
     {1206, 346},
     {778, 406}];
get_rand_pos2(10001) ->
    [{469, 1200},
     {1162, 2369},
     {550, 2559},
     {970, 2995},
     {2096, 2620},
     {1710, 2816},
     {2801, 3185},
     {3356, 2898},
     {3947, 2396},
     {3612, 1874},
     {3917, 1294},
     {2612, 604},
     {3259, 527},
     {2251, 906},
     {4467, 1241}];
get_rand_pos2(_) -> false.

check_enter_temple(Role) ->
    case quest:can_enter_temple(Role) of
        true ->
            case team:get_status(Role) of
                {true, 1} ->
                    case check_team_enter_temple(team:get_members(Role)) of
                        L = [{_, Why} | _] ->
                            Names = string:join([Name || {Name, _} <- L], "、"),
                            notice:npc_talk(Role,
                                            20090,
                                            notice:format(lang:get("~ts~ts"),
                                                          [{role_2, Names},
                                                           {string_1, Why}])),
                            {error, ""};
                        _ -> true
                    end;
                _ -> true
            end;
        {nav, _Why} ->
            sys_conn:pack_send(10173, {1}),
            {error, ""};
        {_, Why} ->
            notice:npc_talk(Role, 20090, Why),
            {error, ""}
    end.

check_team_enter_temple([]) -> [];
check_team_enter_temple([#team_mate{pid = Pid,
                                    status = 2, name = Name}
                         | T]) ->
    case role:apply(sync,
                    Pid,
                    {map, apply_check_enter_temple, []})
        of
        true -> check_team_enter_temple(T);
        {_, Why} -> [{Name, Why} | check_team_enter_temple(T)]
    end;
check_team_enter_temple([_ | T]) ->
    check_team_enter_temple(T).

apply_check_enter_temple(R) ->
    Res = quest:can_enter_temple(R),
    {ok, Res}.

