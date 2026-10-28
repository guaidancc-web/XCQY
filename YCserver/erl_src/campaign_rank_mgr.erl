-file("src/mod/campaign/campaign_rank_mgr.erl", 1).

-module(campaign_rank_mgr).

-behaviour(gen_server).

-export([start_link/0,
         login/1,
         apply_evt/2,
         cast/1,
         reload/0,
         cfg/0,
         push/2,
         push_rank/2,
         push_role/2,
         reward/3,
         m/0,
         next/1,
         gm_reward/0,
         refire/2,
         notice/4]).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 29).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 30).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 31).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 32).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 33).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 34).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 35).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/campaign/campaign_rank_mgr.erl", 36).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 37).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 38).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 39).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 40).

-file("inc/rencounter.hrl", 1).

-record(m_rencounter, {ver = 1}).

-record(rencounter_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         total_star = 0,
         join_times = 0,
         max_joins = 4 * 2,
         has_get_rank = 1,
         last_matched = 0,
         best_rank = 0,
         best_star = 0,
         best_total_star = 0,
         update_best_star_time = 0,
         win_lasted_times = 0,
         last_result = 0,
         season_join_times = 0,
         season_win_times = 0,
         season_lasted_win = 0,
         total_join_times = 0,
         total_win_times = 0,
         best_laster_win = 0,
         last_join_times = 0,
         last_win_times = 0,
         last_lasted_win = 0}).

-record(rencounter_match_role,
        {ver = 1,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         win_lasted_times = 0,
         mode = 1,
         trail_times = 0,
         last_matched = 0,
         match_id = 0,
         retrys = 0}).

-record(rencounter_match,
        {id = 0 :: non_neg_integer(),
         mode = 1,
         match_roles = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 41).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 42).

-file("inc/maze.hrl", 1).

-record(m_maze,
        {ver = 4,
         status = 0,
         dungeon = 0,
         double = 0,
         emptys = [],
         opens = [],
         datas = [],
         times = 0,
         piece = [],
         time = 0,
         others = [],
         pass = [],
         piece_other = [],
         events = []}).

-record(maze_open,
        {pos = {0, 0},
         ver = 1,
         x = 0,
         y = 0,
         unique = 0,
         type = 0,
         id = 0,
         hard = 0,
         times = 0,
         flag = 0,
         special_id = 0,
         reward = [],
         show = 0}).

-record(maze_event,
        {e_pos = {0, 0},
         e_x = 0,
         e_y = 0,
         e_id = 0,
         e_type = 0,
         e_unique = 0,
         e_reward = [],
         e_flag = 0,
         e_list = []}).

-file("src/mod/campaign/campaign_rank_mgr.erl", 43).

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

-file("src/mod/campaign/campaign_rank_mgr.erl", 44).

-record(state, {list = []}).

login(Role) ->
    L = [#trigger{label = evt_friend_intimacy_camp, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_rencounter_star, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_eqm, a = [], m = campaign_rank_mgr,
                  f = apply_evt},
         #trigger{label = evt_reset_eqm, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_blacksmith_enchant, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_constellation_score, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_tournament_point, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_pet, a = [], m = campaign_rank_mgr,
                  f = apply_evt},
         #trigger{label = evt_wing_lev, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_wing_skill, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_mount_attr, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_family_update, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_family, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_family_env, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_family_furnishing, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_arena_cup, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_arena_cup_target, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_blacksmith_embed, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_blacksmith_embed_lev, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_treasure, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_maze, a = [],
                  m = campaign_rank_mgr, f = apply_evt},
         #trigger{label = evt_consume, a = [],
                  m = campaign_rank_mgr, f = apply_evt}],
    {_, NRole} = role_trigger:add(L, Role),
    fire_rank_info(Role),
    {ok, NRole}.

gm_reward() -> campaign_rank_mgr ! gm_reward.

refire(Role = #role{id = Id, name = Name},
       tournament_season) ->
    logger:info("重新触发事件，武道会，~w， ~ts",
                [Id, Name],
                campaign_rank_mgr,
                92),
    case ets:lookup(tournament_profile, Id) of
        [#tournament_profile{rank_lev = RankLev,
                             rank_point = RankPoint}] ->
            do_fire(Role,
                    #evt_tournament_point{rank_lev = RankLev,
                                          rank_point = RankPoint});
        _ -> ok
    end,
    ok;
refire(Role = #role{id = Id, name = Name},
       rencounter_season) ->
    logger:info("重新触发事件，英雄擂台，~w， ~ts",
                [Id, Name],
                campaign_rank_mgr,
                100),
    case ets:lookup(rencounter_role, Id) of
        [#rencounter_role{rank_lev = RencounterRankLev,
                          star = Star, total_star = TotalStar}] ->
            do_fire(Role,
                    #evt_rencounter_star{rank_lev = RencounterRankLev,
                                         star = Star, total_star = TotalStar});
        _ -> ok
    end,
    ok;
refire(_Role, _) -> ok.

notice(#role{id = RoleId}, 60032, ItemId, AddNum) ->
    case ItemId of
        20053 ->
            Msg = notice:format(lang:get("使用远古藏宝图，寻宝积分+~w"),
                                [AddNum]),
            notice:send(RoleId, 1, Msg);
        20052 ->
            case AddNum > 0 of
                true ->
                    Msg = notice:format(lang:get("使用藏宝图，寻宝积分+~w"),
                                        [AddNum]),
                    notice:send(RoleId, 1, Msg);
                _ ->
                    Msg = lang:get("今日藏宝图的寻宝积分已达上限"),
                    notice:send(RoleId, 1, Msg)
            end;
        29314 ->
            Msg = notice:format(lang:get("使用比翼双飞宝藏，寻宝积分+~w"),
                                [AddNum]),
            notice:send(RoleId, 1, Msg);
        29143 ->
            case AddNum > 0 of
                true ->
                    Msg = notice:format(lang:get("使用同心宝藏，寻宝积分+~w"),
                                        [AddNum]),
                    notice:send(RoleId, 1, Msg);
                _ ->
                    Msg = lang:get("今日同心宝藏的寻宝积分已达上限"),
                    notice:send(RoleId, 1, Msg)
            end;
        21220 ->
            case AddNum > 0 of
                true ->
                    Msg = notice:format(lang:get("使用秘宝锤，寻宝积分+~w"),
                                        [AddNum]),
                    notice:send(RoleId, 1, Msg);
                _ ->
                    Msg = lang:get("今日秘宝锤的寻宝积分已达上限"),
                    notice:send(RoleId, 1, Msg)
            end;
        _ -> skip
    end;
notice(_Role, _, _, _) -> ok.

fire_rank_info(Role = #role{id = Id,
                            m_arena = #m_arena{cup = Cup}}) ->
    case rencounter_agent:lookup_rencounter_role(Id) of
        {ok,
         #rencounter_role{rank_lev = RencounterRankLev,
                          star = Star, total_star = TotalStar}} ->
            do_fire(Role,
                    #evt_rencounter_star{rank_lev = RencounterRankLev,
                                         star = Star, total_star = TotalStar});
        _ -> ok
    end,
    do_fire(Role, #evt_eqm{}),
    case ets:lookup(tournament_profile, Id) of
        [#tournament_profile{rank_lev = RankLev,
                             rank_point = RankPoint}] ->
            do_fire(Role,
                    #evt_tournament_point{rank_lev = RankLev,
                                          rank_point = RankPoint});
        _ -> ok
    end,
    do_fire(Role, #evt_pet{}),
    do_fire(Role, #evt_wing_lev{}),
    do_fire(Role, #evt_mount_attr{}),
    do_fire(Role, #evt_family{}),
    do_fire(Role, #evt_arena_cup{cup = Cup}),
    do_fire(Role, #evt_blacksmith_embed{}),
    do_fire(Role, #evt_consume{}),
    do_fire(Role, #evt_treasure{}),
    ok.

m() -> cast(next).

next(SecType) -> cast({next, SecType}).

apply_evt(_Evt = #evt_maze{}, Role) ->
    do_fire(Role, #evt_treasure{base_id = 21220});
apply_evt(Evt, Role) -> do_fire(Role, Evt).

push_rank(_Role, SecType) ->
    case campaign_rank:lookup(SecType) of
        #campaign_rank{list = List} ->
            sys_conn:pack_send(17858, {SecType, List});
        _Err -> sys_conn:pack_send(17858, {SecType, []})
    end.

push(Role, SecType) ->
    R = get(Role, SecType),
    sys_conn:pack_send(17859, {SecType, [R]}).

get(#role{id = Id}, SecType = 60019) ->
    MatchSpec = [{{campaign_rank_role,
                   '_',
                   '$2',
                   '$3',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'andalso',
                    {'=:=', '$1', {const, SecType}},
                    {'orelse',
                     {'=:=', {const, Id}, '$2'},
                     {'=:=', '$3', {const, Id}}}}],
                  ['$_']}],
    case ets:select(campaign_rank_role, MatchSpec) of
        List = [_ | _] ->
            [I | _] = util:keys_sort([#campaign_rank_role.val1],
                                     List),
            I;
        _ -> #campaign_rank_role{id = Id}
    end;
get(#role{id = Id}, SecType) ->
    Key = {Id, SecType},
    case ets:lookup(campaign_rank_role, Key) of
        [I = #campaign_rank_role{}] -> I;
        _ -> #campaign_rank_role{id = Id}
    end.

push_role(Role, SecType) ->
    case get_camp(SecType) of
        {CampId, _St, _ET} ->
            Rewarded = var:get_var(Role, other, {2093, CampId}, []),
            sys_conn:pack_send(17860, {SecType, Rewarded});
        _ -> sys_conn:pack_send(17860, {SecType, []})
    end.

reward(Role, SecType, Val) ->
    Now = date:unixtime(),
    case get_camp(SecType) of
        {_, -1, -1} -> {false, lang:get("活动未开启")};
        {CampId, St, ET} when Now >= St andalso Now =< ET ->
            case campaign_rank_data:get_reward({SecType, Val}) of
                #camp_rank_self_reward_data{item_list = ItemList0} ->
                    ItemList = campaign_rank:filter_item(Role, ItemList0),
                    Rewarded = var:get_var(Role, other, {2093, CampId}, []),
                    MatchSpec = get_ets_match_spec(Role, SecType, Val),
                    case ets:select(campaign_rank_role, MatchSpec) of
                        [_ | _] ->
                            case lists:member(Val, Rewarded) of
                                true -> {false, lang:get("该奖励已经领取过了")};
                                _ ->
                                    Gain = format:val_to_gain(ItemList),
                                    case role_gain:do_notice(Gain, Role) of
                                        {ok, NRole} ->
                                            NewReward = [Val | Rewarded],
                                            NewRole = var:set_var(NRole,
                                                                  other,
                                                                  {2093,
                                                                   CampId},
                                                                  NewReward),
                                            push_role(NewRole, SecType),
                                            {ok, NewRole};
                                        _ -> {false, lang:get("背包空间不足")}
                                    end
                            end;
                        _ -> {false, lang:get("未达到领取条件")}
                    end;
                _ -> {false, lang:get("该奖励没有配置")}
            end;
        {_CampId, St, _ET} when Now < St ->
            {false, lang:get("活动未开始")};
        _ -> {false, lang:get("活动已过期")}
    end.

reload() -> campaign_rank_mgr ! reload.

cast(Info) -> gen_server:cast(campaign_rank_mgr, Info).

start_link() ->
    gen_server:start_link({local, campaign_rank_mgr},
                          campaign_rank_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [campaign_rank_mgr],
                campaign_rank_mgr,
                297),
    process_flag(trap_exit, true),
    dets:open_file(campaign_rank,
                   [{file, "./dets/campaign_rank.dets"},
                    {keypos, #campaign_rank.sec_type},
                    {type, set}]),
    ets:new(campaign_rank,
            [set,
             named_table,
             public,
             {keypos, #campaign_rank.sec_type}]),
    dets:open_file(campaign_rank_role,
                   [{file, "./dets/campaign_rank_role.dets"},
                    {keypos, #campaign_rank_role.key},
                    {type, set}]),
    ets:new(campaign_rank_role,
            [set,
             named_table,
             public,
             {keypos, #campaign_rank_role.key}]),
    dets:to_ets(campaign_rank, campaign_rank),
    dets:to_ets(campaign_rank_role, campaign_rank_role),
    List = init_sub(cfg(), []),
    State = #state{list = List},
    logger:info("[~w] 启动完成",
                [campaign_rank_mgr],
                campaign_rank_mgr,
                307),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(next, State = #state{list = List}) ->
    [campaign_rank:m(Pid)
     || #campaign_rank_zone{pid = Pid} <- List],
    {noreply, State};
handle_cast({next, SecType},
            State = #state{list = List}) ->
    [campaign_rank:m(Pid)
     || #campaign_rank_zone{pid = Pid,
                            sec_type = CampSecType}
            <- List,
        CampSecType =:= SecType],
    {noreply, State};
handle_cast({update,
             #{label := Labal, sec_type := SecType, rc := Rc}},
            State = #state{list = List}) ->
    case lists:keyfind(SecType,
                       #campaign_rank_zone.sec_type,
                       List)
        of
        #campaign_rank_zone{pid = Pid} when Labal =:= acc ->
            campaign_rank:cast(Pid, {update_role, Rc});
        #campaign_rank_zone{pid = Pid} ->
            campaign_rank:cast(Pid, {set_role, Rc});
        _ -> ignore
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload, State = #state{list = List}) ->
    [Pid ! reload
     || #campaign_rank_zone{pid = Pid} <- List],
    {noreply, State};
handle_info({gm, Id}, State = #state{list = List}) ->
    case campaign_rank_data:get(Id) of
        Cfg = #campaign_rank_data{} ->
            case cfg([Cfg], []) of
                [CfgData = #campaign_rank_data{sec_type = SecType,
                                               zone = ZoneId}] ->
                    case campaign_rank:start_link(CfgData) of
                        {ok, Pid} ->
                            Add = #campaign_rank_zone{id = Id,
                                                      sec_type = SecType,
                                                      pid = Pid, zone = ZoneId},
                            NList = lists:keystore(Id,
                                                   #campaign_rank_zone.id,
                                                   List,
                                                   Add),
                            {noreply, State#state{list = NList}};
                        _Else ->
                            logger:error("启动进程失败:~w, 配置信息:~w",
                                         [_Else, CfgData],
                                         campaign_rank_mgr,
                                         355),
                            {noreply, State}
                    end;
                _ -> {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_info(gm_reward, State = #state{list = List}) ->
    gm_reward(List),
    {noreply, State};
handle_info(Info = {all_info, _},
            State = #state{list = List}) ->
    logger:info("消息:~w", [Info], campaign_rank_mgr, 371),
    [Pid ! Info || #campaign_rank_zone{pid = Pid} <- List],
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

init_sub([], List) -> List;
init_sub([I = #campaign_rank_data{id = Id,
                                  sec_type = SecType, zone = Zone}
          | T],
         List) ->
    case campaign_rank:start_link(I) of
        {ok, Pid} ->
            Add = #campaign_rank_zone{id = Id, sec_type = SecType,
                                      zone = Zone, pid = Pid},
            init_sub(T, [Add | List]);
        _Err ->
            logger:error("启动活动排行榜出错~w",
                         [_Err],
                         campaign_rank_mgr,
                         396),
            init_sub(T, List)
    end.

do_fire(Role = #role{id = _Id},
        _Evt = #evt_friend_intimacy_camp{val = Num,
                                         target_id = TargetId}) ->
    case role_misc:is_local_role(TargetId) of
        true ->
            do_handle([60019],
                      Role,
                      #{num => Num, target_id => TargetId});
        _ -> ok
    end;
do_fire(Role,
        _Evt = #evt_rencounter_star{rank_lev = RankLev,
                                    star = Star}) ->
    do_handle([60020],
              Role,
              #{rank_lev => RankLev, star => Star});
do_fire(Role, _Evt = #evt_eqm{}) ->
    EqmFc = calc_70eqm_fc(Role),
    EqmFc2 = calc_80eqm_fc(Role),
    do_handle([60021, 60030],
              Role,
              #{equip_fc => EqmFc, equip_fc_2 => EqmFc2});
do_fire(Role, _Evt = #evt_reset_eqm{}) ->
    EqmFc = calc_70eqm_fc(Role),
    EqmFc2 = calc_80eqm_fc(Role),
    do_handle([60021, 60030],
              Role,
              #{equip_fc => EqmFc, equip_fc_2 => EqmFc2});
do_fire(Role, _Evt = #evt_blacksmith_enchant{}) ->
    EqmFc = calc_70eqm_fc(Role),
    EqmFc2 = calc_80eqm_fc(Role),
    do_handle([60021, 60030],
              Role,
              #{equip_fc => EqmFc, equip_fc_2 => EqmFc2});
do_fire(Role,
        _Evt = #evt_constellation_score{base_id = BaseId,
                                        lev = Lev}) ->
    KillScore = case constellation_data:get_unit({Lev,
                                                  BaseId})
                    of
                    #{score := Score} -> Score;
                    _ -> 1
                end,
    do_handle([60022], Role, #{kill_score => KillScore});
do_fire(Role,
        _Evt = #evt_tournament_point{rank_lev = RankLev,
                                     rank_point = RankPoint}) ->
    do_handle([60023],
              Role,
              #{rank_lev => RankLev, rank_point => RankPoint});
do_fire(Role, _Evt = #evt_pet{}) ->
    MaxPetScore = get_max_pet_score(Role),
    do_handle([60024], Role, #{pet_score => MaxPetScore});
do_fire(Role, _Evt = #evt_wing_lev{}) ->
    WingScore = wing:calc_wing_score(Role),
    do_handle([60025], Role, #{wing_score => WingScore});
do_fire(Role, _Evt = #evt_wing_skill{}) ->
    WingScore = wing:calc_wing_score(Role),
    do_handle([60025], Role, #{wing_score => WingScore});
do_fire(Role, _Evt = #evt_mount_attr{}) ->
    MountScore = mount_attr:calc_mount_score_client(Role,
                                                    1),
    do_handle([60026], Role, #{mount_score => MountScore});
do_fire(Role, _Evt = #evt_family_update{}) ->
    FamilyScore = family_mgr:get_env_val(Role),
    do_handle([60027],
              Role,
              #{family_score => FamilyScore});
do_fire(Role, _Evt = #evt_family{}) ->
    FamilyScore = family_mgr:get_env_val(Role),
    do_handle([60027],
              Role,
              #{family_score => FamilyScore});
do_fire(Role, _Evt = #evt_family_env{}) ->
    FamilyScore = family_mgr:get_env_val(Role),
    do_handle([60027],
              Role,
              #{family_score => FamilyScore});
do_fire(Role, _Evt = #evt_family_furnishing{}) ->
    FamilyScore = family_mgr:get_env_val(Role),
    do_handle([60027],
              Role,
              #{family_score => FamilyScore});
do_fire(Role, _Evt = #evt_arena_cup{cup = SelfCup}) ->
    do_handle([60028], Role, #{arena_score => SelfCup});
do_fire(Role,
        _Evt = #evt_arena_cup_target{id = TargetId}) ->
    do_handle([60028], Role, #{target_id => TargetId});
do_fire(Role, _Evt = #evt_blacksmith_embed{}) ->
    StoneScore = round(eqm:calc_all_stone_lev(Role) * 6 *
                           2),
    do_handle([60029], Role, #{stone_score => StoneScore});
do_fire(Role, _Evt = #evt_blacksmith_embed_lev{}) ->
    StoneScore = round(eqm:calc_all_stone_lev(Role) * 6 *
                           2),
    do_handle([60029], Role, #{stone_score => StoneScore});
do_fire(Role, _Evt = #evt_treasure{base_id = BaseId}) ->
    Result = case BaseId of
                 20053 -> {Role, 20, 20053, false};
                 20052 ->
                     OldNum = var:get_var(Role, day, 612, 0),
                     case OldNum < 30 of
                         true ->
                             Role1 = var:set_var(Role, day, 612, OldNum + 1),
                             {Role1, 1, 20052, true};
                         _ -> {Role, 0, 20052, false}
                     end;
                 21220 ->
                     OldNum = var:get_var(Role, day, 611, 0),
                     case OldNum < 30 of
                         true ->
                             Role1 = var:set_var(Role, day, 611, OldNum + 1),
                             {Role1, 1, 21220, true};
                         _ -> {Role, 0, 21220, false}
                     end;
                 _ -> ok
             end,
    case Result of
        {NRole, Num, TreaItem, NeedUp} ->
            do_handle([60032], NRole, {Num, TreaItem}),
            case NeedUp of
                true -> {ok, NRole};
                _ -> ok
            end;
        _ -> ok
    end;
do_fire(Role, _Evt = #evt_consume{gold = GoldNum}) ->
    logger:debug("收到累计消费信息:~w，消费钻石 ~w",
                 [_Evt, GoldNum],
                 campaign_rank_mgr,
                 534),
    do_handle([60052], Role, #{gold => GoldNum});
do_fire(_Role, _Evt) -> ok.

do_handle(RTypeList, Role, Args) ->
    do_handle(RTypeList, Role, Args, #rank_rc.val1).

do_handle([], _Role, _Args, _ValPos) -> ok;
do_handle([RType | T], Role, Args, ValPos) ->
    do_handle(RType, Role, Args, ValPos),
    do_handle(T, Role, Args, ValPos);
do_handle(RType, Role, Args, _ValPos) ->
    case conver(RType, Role, Args) of
        {ok, Labal, RankRcs = [_ | _]} ->
            [update(#{sec_type => RType, label => Labal,
                      rc => RankRc})
             || RankRc <- RankRcs];
        {ok, Labal, RankRc = #campaign_rank_role{}} ->
            update(#{sec_type => RType, label => Labal,
                     rc => RankRc});
        _R -> skip
    end.

gm_reward([]) -> ok;
gm_reward([#campaign_rank_zone{pid = Pid, id = Id}
           | T]) ->
    case campaign_rank_data:get(Id) of
        #campaign_rank_data{merge_flag = 1} -> Pid ! gm_reward;
        _ -> ignore
    end,
    gm_reward(T).

update(Info) -> cast({update, Info}).

conver(RType = 60019,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{num := Num,
         target_id :=
             TargetId = {RoleId2, Platform2, ZoneId2}}) ->
    Flag = case RoleId > RoleId2 of
               false
                   when RoleId =:= RoleId2 andalso ZoneId > ZoneId2 ->
                   true;
               true -> true;
               _ -> false
           end,
    RankRc = case Flag of
                 true ->
                     RankRc1 = #campaign_rank_role{key =
                                                       {[Id, TargetId], RType},
                                                   id =
                                                       {RoleId,
                                                        Platform,
                                                        ZoneId},
                                                   role_id = RoleId,
                                                   platform = Platform,
                                                   zone_id = ZoneId,
                                                   id2 = TargetId,
                                                   role_id2 = RoleId2,
                                                   platform2 = Platform2,
                                                   zone_id2 = ZoneId2,
                                                   sec_type = RType,
                                                   name = Name, sex = Sex,
                                                   classes = Classes,
                                                   time = date:unixtime(),
                                                   lev = Lev},
                     case role_query:local_cache(by_id, TargetId) of
                         {ok,
                          #role_cache{name = Name2, sex = Sex2,
                                      classes = Classes2, lev = Lev2}} ->
                             RankRc1#campaign_rank_role{classes2 = Classes2,
                                                        sex2 = Sex2,
                                                        lev2 = Lev2,
                                                        name2 = Name2};
                         _Err ->
                             RankRc1#campaign_rank_role{classes2 = 1, sex2 = 1,
                                                        lev2 = 40, name2 = ""}
                     end;
                 _ ->
                     RankRc1 = #campaign_rank_role{key =
                                                       {[TargetId, Id], RType},
                                                   id2 =
                                                       {RoleId,
                                                        Platform,
                                                        ZoneId},
                                                   role_id2 = RoleId,
                                                   platform2 = Platform,
                                                   zone_id2 = ZoneId,
                                                   id = TargetId,
                                                   role_id = RoleId2,
                                                   platform = Platform2,
                                                   zone_id = ZoneId2,
                                                   sec_type = RType,
                                                   name2 = Name, sex2 = Sex,
                                                   classes2 = Classes,
                                                   time = date:unixtime(),
                                                   lev2 = Lev},
                     case role_query:local_cache(by_id, TargetId) of
                         {ok,
                          #role_cache{name = Name2, sex = Sex2,
                                      classes = Classes2, lev = Lev2}} ->
                             RankRc1#campaign_rank_role{classes = Classes2,
                                                        sex = Sex2, lev = Lev2,
                                                        name = Name2};
                         _Err ->
                             RankRc1#campaign_rank_role{classes = 1, sex = 1,
                                                        lev = 40, name = ""}
                     end
             end,
    do_conver(RType, Role, Num, RankRc);
conver(RType = 60020,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{rank_lev := RankLev, star := Star}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, {RankLev, Star}, RankRc);
conver(RType = 60021,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{equip_fc := EquipFc}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, EquipFc, RankRc);
conver(RType = 60022,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{kill_score := KillScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, KillScore, RankRc);
conver(RType = 60023,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{rank_lev := RankLev, rank_point := RankPoint}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, {RankLev, RankPoint}, RankRc);
conver(RType = 60024,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{pet_score := PetScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, PetScore, RankRc);
conver(RType = 60025,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{wing_score := WingScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, WingScore, RankRc);
conver(RType = 60026,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{mount_score := MountScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, MountScore, RankRc);
conver(RType = 60027,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{family_score := FamilyScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, FamilyScore, RankRc);
conver(RType = 60028,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{arena_score := ArenaScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, ArenaScore, RankRc);
conver(RType = 60028, _Role,
       #{target_id := Id = {RoleId, Platform, ZoneId}}) ->
    case ets:lookup(arena_role, Id) of
        [#arena_role{name = Name, sex = Sex, classes = Classes,
                     lev = Lev, cup = ArenaScore}] ->
            RankRc = #campaign_rank_role{key = {Id, RType},
                                         sec_type = RType, id = Id,
                                         role_id = RoleId, platform = Platform,
                                         zone_id = ZoneId, name = Name,
                                         sex = Sex, classes = Classes,
                                         time = date:unixtime(), lev = Lev},
            do_conver(RType,
                      #role{name = Name, sex = Sex, classes = Classes,
                            lev = Lev},
                      ArenaScore,
                      RankRc);
        _ ->
            logger:info("竞技场找不到对手信息", [], campaign_rank_mgr, 678),
            ok
    end;
conver(RType = 60029,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{stone_score := StoneScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, StoneScore, RankRc);
conver(RType = 60030,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{equip_fc_2 := EquipScore}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, EquipScore, RankRc);
conver(RType = 60052,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       #{gold := Gold}) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 sec_type = RType, id = Id, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, Gold, RankRc);
conver(RType,
       Role = #role{id = Id = {RoleId, Platform, ZoneId},
                    name = Name, sex = Sex, classes = Classes, lev = Lev},
       Data) ->
    RankRc = #campaign_rank_role{key = {Id, RType},
                                 id = {RoleId, Platform, ZoneId},
                                 sec_type = RType, role_id = RoleId,
                                 platform = Platform, zone_id = ZoneId,
                                 name = Name, sex = Sex, classes = Classes,
                                 time = date:unixtime(), lev = Lev},
    do_conver(RType, Role, Data, RankRc);
conver(_RType, _Rdata, _Data) -> ok.

do_conver(60019, #role{lev = Lev, id = {_Id, _, _}},
          Num, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = Num,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60020, #role{lev = Lev, id = {_Id, _, _}},
          {RankLev, Star}, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = RankLev,
                               val2 = date:unixtime(), val3 = Lev,
                               val4 = Star}};
do_conver(60021, #role{lev = Lev, id = {_Id, _, _}},
          Num, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = Num,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60022, #role{lev = Lev, id = {_Id, _, _}},
          Num, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = Num,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60023, #role{lev = Lev, id = {_Id, _, _}},
          {RankLev, RankPoint}, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = RankLev,
                               val2 = date:unixtime(), val3 = Lev,
                               val4 = RankPoint}};
do_conver(60024, #role{lev = Lev, id = {_Id, _, _}},
          PetScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = PetScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60025, #role{lev = Lev, id = {_Id, _, _}},
          WingScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = WingScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60026, #role{lev = Lev, id = {_Id, _, _}},
          MountScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = MountScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60027, #role{lev = Lev, id = {_Id, _, _}},
          FamilyScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = FamilyScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60028, #role{lev = Lev, id = {_Id, _, _}},
          FamilyScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = FamilyScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60029, #role{lev = Lev, id = {_Id, _, _}},
          StoneScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = StoneScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60030, #role{lev = Lev, id = {_Id, _, _}},
          EquipScore, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = EquipScore,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(60032, #role{lev = Lev, id = {_Id, _, _}},
          {Num, TreaItem}, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = Num,
                               val2 = date:unixtime(), val3 = Lev,
                               val4 = TreaItem}};
do_conver(60052, #role{lev = Lev, id = {_Id, _, _}},
          GoldNum, RankRc) ->
    {ok,
     acc,
     RankRc#campaign_rank_role{val1 = GoldNum,
                               val2 = date:unixtime(), val3 = Lev}};
do_conver(_RType, _Role, _, _) -> ok.

get_camp(CampSec) ->
    case campaign_mgr:get_camp_info(CampSec) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

cfg() ->
    Cfg = [campaign_rank_data:get(Id)
           || Id <- campaign_rank_data:ids()],
    cfg(Cfg, []).

cfg([], List) -> lists:reverse(List);
cfg([I = #campaign_rank_data{sec_type = SecType = 60019}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60020}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val4,
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60021}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60022}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60023}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val4,
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60024}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [{asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60025}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [{asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60026}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [{asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60027}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [{asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60028}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60029}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60030}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60032}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [{asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType = 60052}
     | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   {asc, #campaign_rank_role.val2},
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]);
cfg([I = #campaign_rank_data{sec_type = SecType} | T],
    List) ->
    NI = I#campaign_rank_data{keys =
                                  [#campaign_rank_role.val3,
                                   #campaign_rank_role.val2,
                                   #campaign_rank_role.val1],
                              zone =
                                  list_to_atom(lists:concat([campaign_rank,
                                                             "_",
                                                             SecType]))},
    cfg(T, [NI | List]).

calc_70eqm_fc(#role{p_eqm = #package{items = Items}}) ->
    lists:sum([attr:calc_item_score(Item)
               || Item = #item{lev = Lev} <- Items, Lev =:= 70])
        * 2.

calc_80eqm_fc(#role{p_eqm = #package{items = Items}}) ->
    lists:sum([attr:calc_item_score(Item)
               || Item = #item{lev = Lev} <- Items, Lev =:= 80])
        * 2.

get_max_pet_score(#role{m_pet = #m_pet{pets = Pets}}) ->
    Fun = fun (#pet{talent = Talent, base_id = BaseId},
               Rtn) ->
                  case lists:member(BaseId, [10019, 10021, 10022]) of
                      true ->
                          case Talent > Rtn of
                              true -> Talent;
                              _ -> Rtn
                          end;
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, 0, Pets).

get_ets_match_spec(#role{id = Id}, SecType = 60019,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '$3',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$4',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'orelse',
          {'=:=', {const, Id}, '$2'},
          {'=:=', '$3', {const, Id}}},
         {'>=', '$4', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60020,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60021,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60022,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60023,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60024,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60025,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60026,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60027,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60028,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60029,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60030,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType = 60052,
                   Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '_',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$3',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'=:=', {const, Id}, '$2'},
         {'>=', '$3', {const, Val}}}}],
      ['$_']}];
get_ets_match_spec(#role{id = Id}, SecType, Val) ->
    [{{campaign_rank_role,
       '_',
       '$2',
       '$3',
       '$1',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '_',
       '$4',
       '_',
       '_',
       '_',
       '_'},
      [{'andalso',
        {'=:=', '$1', {const, SecType}},
        {'andalso',
         {'orelse',
          {'=:=', {const, Id}, '$2'},
          {'=:=', '$3', {const, Id}}},
         {'>=', '$4', {const, Val}}}}],
      ['$_']}].

