-file("src/mod/quest/quest_marriage.erl", 1).

-module(quest_marriage).

-behaviour(gen_server).

-export([start_link/0,
         rpc_accept/1,
         check_commit/1,
         accept/4,
         accept_next/2,
         commit/2,
         answer/3,
         sync_commit/3,
         sync_question/5,
         sync_quest_marriage/4,
         sync_quest_talk/3,
         next_question/2,
         end_question/2,
         question_result/2,
         get_reward/2,
         kill/4,
         reset_five/2,
         quest_ext_data/0,
         revise/1,
         del_quest/1,
         del_type/1,
         add_trigger/3,
         finish_marriage_flower/2,
         push_question_info/1,
         push_next_question/2,
         push_question_stats/1,
         push_question_stats/2,
         finish_question_quest/2,
         commit_question_quest/2,
         get_challange_looks/1,
         get_special_sex/2,
         get_special_classes/2,
         is_challange_finished/4,
         divorce/1]).

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

-file("src/mod/quest/quest_marriage.erl", 56).

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

-file("src/mod/quest/quest_marriage.erl", 57).

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

-file("src/mod/quest/quest_marriage.erl", 58).

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

-file("src/mod/quest/quest_marriage.erl", 59).

-file("inc/plot.hrl", 1).

-record(m_plot,
        {ver = 1 :: pos_integer(),
         plot_quest_ver = 1 :: pos_integer(),
         finished = [] :: [pos_integer()],
         play_list = [] :: [pos_integer()],
         do_list = [] :: [tuple()],
         combat_list = [] :: [tuple()],
         fun_icons = [] :: [pos_integer()],
         unit_list = [] :: [tuple()],
         map_list = [] :: [pos_integer()],
         guide_list = [] :: [pos_integer()],
         dun_id = 0 :: non_neg_integer(),
         hide_mode = 0 :: non_neg_integer(),
         scene = [] :: list(),
         dungeon = [] :: list(),
         quest_trace = 0 :: non_neg_integer()}).

-record(plot,
        {id :: undefined | non_neg_integer(),
         num = 0 :: non_neg_integer(),
         act_idx = 0 :: non_neg_integer()}).

-record(plot_trigger,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lev = 0 :: non_neg_integer(),
         status = 1 :: 0 | 1,
         type = 1 :: 1 | 2,
         off_line = 0 :: 0..2,
         can_skip = 1 :: 0..1,
         hide_layer = 1 :: 0..1,
         res_list = [] :: [bitstring()],
         maps = [] :: [pos_integer()],
         num = 1 :: non_neg_integer(),
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         cond_logic = 'and' :: atom(),
         condition = [] :: [tuple()],
         action = [] :: [tuple()],
         lev_break_min_times = 0,
         lev_break_max_times = 1}).

-record(plot_act,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         time = 0 :: non_neg_integer(),
         mode = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         unit_base_id = 0 :: non_neg_integer(),
         looks = [] :: list(),
         ext_info = [] :: [{pos_integer(), bitstring()}],
         battle_id = 0 :: non_neg_integer(),
         mapid = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         res_id = 0 :: non_neg_integer(),
         color = "" :: bitstring(),
         msg = "" :: bitstring(),
         ext_msg = "" :: bitstring(),
         gain = [] :: [{pos_integer(), pos_integer()}],
         need_next = 0 :: 0..1,
         timeout = 0 :: non_neg_integer(),
         skip_do = 0 :: 0..1,
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(plot_quest_revise_data,
        {ver = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_exp = 0 :: non_neg_integer(),
         pos :: undefined | tuple(),
         finish_quests = [] :: [pos_integer()],
         finish_reward_quests = [] :: [pos_integer()],
         finish_plots = [] :: [pos_integer()],
         open_plots = [] :: [pos_integer()],
         open_sys_list = [] :: [pos_integer()],
         open_map_list = [] :: [pos_integer()],
         skill_list = [] :: [pos_integer()],
         reward_list = [] :: list()}).

-record(plot_quest_unit,
        {label,
         id = 0,
         base_id = 0,
         pos,
         dir,
         act_type,
         is_rand_pos = 0}).

-file("src/mod/quest/quest_marriage.erl", 60).

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

-file("src/mod/quest/quest_marriage.erl", 61).

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

-file("src/mod/quest/quest_marriage.erl", 62).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/quest/quest_marriage.erl", 63).

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

-file("src/mod/quest/quest_marriage.erl", 64).

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

-file("src/mod/quest/quest_marriage.erl", 65).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/quest/quest_marriage.erl", 66).

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

-file("src/mod/quest/quest_marriage.erl", 67).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest_marriage.erl", 68).

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

-file("src/mod/quest/quest_marriage.erl", 69).

-file("inc/quest_marriage.hrl", 1).

-record(quest_marriage_state,
        {question_next_mid = 1,
         reset_timer,
         platform = "",
         zone_id = 0}).

-record(quest_marriage_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         lover_pid,
         robot_id,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_marriage_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_marriage_question,
        {mid = 0,
         ver = 1,
         sid = 0,
         qid = 0,
         start_time = 0,
         male_id,
         male_pid,
         male_info = #{},
         female_id,
         female_pid,
         female_info = #{},
         opts = [],
         answer_list = [],
         agreed = [],
         questions = [],
         ext_data = #{}}).

-record(quest_marriage_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(quest_marriage_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         intimacy = 0,
         love = 0,
         rand_items = []}).

-file("src/mod/quest/quest_marriage.erl", 70).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/quest/quest_marriage.erl", 71).

reset_five(NRole = #role{m_quest =
                             #m_quest{quest = Quests}},
           _OldRole) ->
    case lists:keyfind(15, #quest.sec_type, Quests) of
        Quest = #quest{finish = 0} ->
            DelRole = quest:del_quest(Quest, NRole),
            #role{m_quest =
                      MQuest = #m_quest{quest_marriage = QMarriage}} =
                DelRole,
            NewQMarriage = QMarriage#quest_marriage{round = 0,
                                                    quest_id = 0, type = 0,
                                                    sec_type = 0,
                                                    ext_data =
                                                        #{mid => 0,
                                                          robot_id =>
                                                              undefined}},
            NewMQuest = MQuest#m_quest{quest_marriage =
                                           NewQMarriage},
            NewRole = NRole#role{m_quest = NewMQuest},
            {ok, NewRole};
        false ->
            #role{m_quest =
                      MQuest = #m_quest{quest_marriage = QMarriage}} =
                NRole,
            NewQMarriage = QMarriage#quest_marriage{round = 0,
                                                    quest_id = 0, type = 0,
                                                    sec_type = 0,
                                                    ext_data =
                                                        #{mid => 0,
                                                          robot_id =>
                                                              undefined}},
            NewMQuest = MQuest#m_quest{quest_marriage =
                                           NewQMarriage},
            NewRole = NRole#role{m_quest = NewMQuest},
            {ok, NewRole};
        _ -> ok
    end.

del_quest(Role = #role{m_quest =
                           MQuest = #m_quest{quest_marriage =
                                                 QMarriage =
                                                     #quest_marriage{type =
                                                                         Type,
                                                                     ext_data =
                                                                         ExtData}}}) ->
    case Type of
        3 ->
            case get_mid(ExtData, Role) of
                {ok, Mid} -> delete(quest_marriage_question, Mid);
                _ -> ok
            end;
        _ -> ok
    end,
    NewQMarriage = QMarriage#quest_marriage{ext_data =
                                                #{mid => 0,
                                                  robot_id => undefined}},
    NewMQuest = MQuest#m_quest{quest_marriage =
                                   NewQMarriage},
    Role#role{m_quest = NewMQuest};
del_quest(Role) -> Role.

del_type(Role = #role{m_quest =
                          #m_quest{quest = Quests}}) ->
    case lists:keyfind(15, #quest.sec_type, Quests) of
        Quest = #quest{} ->
            NewRole = quest:del_quest(Quest, Role),
            NewRole;
        _ -> Role
    end.

divorce(Role) ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_marriage = QuestMarriage}} =
                del_type(Role),
    NewQuestMarriage = QuestMarriage#quest_marriage{quest_id
                                                        = 0,
                                                    type = 0, sec_type = 0,
                                                    round = 0,
                                                    ext_data =
                                                        quest_marriage:quest_ext_data()},
    NewMQuest = MQuest#m_quest{quest_marriage =
                                   NewQuestMarriage},
    NRole1 = NRole#role{m_quest = NewMQuest},
    var:set_var(NRole1, day_five, 113, 0).

revise(Role = #role{m_quest =
                        #m_quest{quest = Quest}}) ->
    case lists:keyfind(15, #quest.sec_type, Quest) of
        Quest = #quest{} -> revise(Role, Quest);
        _ -> Role
    end.

revise(Role = #role{m_quest =
                        #m_quest{quest_marriage =
                                     #quest_marriage{type = 3,
                                                     ext_data = ExtData}}},
       #quest{end_time = EndT}) ->
    case get_mid(ExtData, Role) of
        {ok, Mid} ->
            Now = date:unixtime(),
            case EndT < Now of
                true -> del_quest(Role);
                _ ->
                    case lookup(quest_marriage_question, Mid) of
                        [MQuestion = #quest_marriage_question{}] ->
                            revise_question(MQuestion, Role);
                        _ ->
                            logger:error("[~ts]修正夫妻答题任务时数据错误",
                                         [Role#role.name],
                                         quest_marriage,
                                         214),
                            Role
                    end
            end;
        _ ->
            logger:error("[~ts]修正夫妻答题任务时数据错误",
                         [Role#role.name],
                         quest_marriage,
                         219),
            Role
    end;
revise(Role, _Quest) -> Role.

revise_question(MQuestion, Role = #role{id = SelfId}) ->
    case get_pre_answer(MQuestion) of
        {ok,
         Answer = #quest_marriage_answer{draw_list = DrawList,
                                         sid = _Sid}} ->
            case lists:member(SelfId, DrawList) of
                true -> Role;
                false ->
                    case gain_question_reward(Role, MQuestion, Answer) of
                        {ok, NewRole} -> NewRole;
                        _ -> Role
                    end
            end;
        false -> Role
    end.

quest_ext_data() -> #{mid => 0, robot_id => undefined}.

rpc_accept(Role = #role{m_quest =
                            #m_quest{quest_marriage =
                                         #quest_marriage{round = Round,
                                                         type = Type}}}) ->
    case check_rpc_accept(Role) of
        {ok, Lover} ->
            NewRound = case Round > 0 of
                           true when Type =:= 3 -> Round + 1;
                           true -> Round;
                           false -> 1
                       end,
            case rand_quest(Role, NewRound, Lover) of
                {ok, QuestRole} ->
                    MaxVar = var:get_var(QuestRole, day_five, 113, 0),
                    VarRole = case MaxVar < 1 of
                                  false -> QuestRole;
                                  true ->
                                      var:set_var(QuestRole, day_five, 113, 1)
                              end,
                    NewRole = VarRole,
                    {ok, NewRole};
                Rtn -> Rtn
            end;
        {false, Msg} -> {false, Msg};
        {team_false, Msg} ->
            MFA = {notice, send, [1, Msg]},
            team:async_teammate(Role, MFA),
            {false, Msg};
        _False ->
            logger:error("[~ts]接受情缘任务失败Err:~w",
                         [Role#role.name, _False],
                         quest_marriage,
                         277),
            {false, lang:get("无法接受情缘任务")}
    end.

rand_quest(Role, Round, Lover) ->
    RandQuests =
        quest_marriage_data:get_quest_rand_list(Round),
    case util:rand_list(RandQuests,
                        #quest_marriage_rand_data.weight)
        of
        Data = #quest_marriage_rand_data{} ->
            accept_next(Data, Round, Lover, Role);
        _False ->
            logger:error("[~ts]接受情缘任务失败Round:~w, Err:~w",
                         [Role#role.name, Round, _False],
                         quest_marriage,
                         288),
            {false, lang:get("没有情缘任务可以领取")}
    end.

accept_next(Role = #role{m_quest =
                             MQuest = #m_quest{quest_marriage =
                                                   QMarriage =
                                                       #quest_marriage{round =
                                                                           Round}}},
            Lover = #team_mate{pid = LoverPid}) ->
    NewRound = Round + 1,
    case Round < 10 of
        true -> rand_quest(Role, NewRound, Lover);
        false ->
            Fmt = lang:get("恭喜完成了今日的~ts环情缘任务，希望感情有所增益，记得明日再来哦"),
            Msg = notice:format(Fmt, [{string_1, 10}]),
            notice:send(Role, 3, Msg),
            MFA = {notice, send, [3, Msg]},
            role:apply(async, LoverPid, MFA),
            NewQMarriage = QMarriage#quest_marriage{round =
                                                        NewRound},
            NewMQuest = MQuest#m_quest{quest_marriage =
                                           NewQMarriage},
            Role1 = Role#role{m_quest = NewMQuest},
            NewRole = role_trigger:fire(#evt_finish_couple_task{},
                                        Role1),
            {ok, NewRole}
    end.

accept_next(#quest_marriage_rand_data{quest_id =
                                          QuestId,
                                      type = Type, sec_type = SecType},
            Round, Lover = #team_mate{pid = LoverPid},
            Role = #role{m_quest =
                             MQuest = #m_quest{quest_marriage = QMarriage}})
    when is_pid(LoverPid) ->
    Steps = [condition, loss, accept, fire],
    Args = #quest_marriage_args{quest_id = QuestId,
                                round = Round, lover_pid = LoverPid,
                                type = Type, sec_type = SecType},
    QuestRole = Role#role{m_quest =
                              MQuest#m_quest{quest_marriage =
                                                 QMarriage#quest_marriage{type =
                                                                              Type,
                                                                          sec_type
                                                                              =
                                                                              SecType}}},
    case quest:callback_accept(QuestRole,
                               QuestId,
                               Steps,
                               Args)
        of
        {ok, NewRole} ->
            quest_talk(QMarriage, QuestId, NewRole),
            doing_quest(Args, Lover, NewRole);
        _ -> {false, lang:get("领取情缘任务失败")}
    end;
accept_next(_RandMarriageData, _Round, _Lover,
            #role{sex = Sex}) ->
    Msg = case Sex of
              0 -> lang:get("领取失败，您的爱人已经离线了");
              _ -> lang:get("领取失败，您的爱人已经离线了")
          end,
    {false, Msg}.

quest_talk(#quest_marriage{type = 1}, _NextQuestId,
           _Role) ->
    ok;
quest_talk(#quest_marriage{type = 3}, _NextQuestId,
           _Role) ->
    ok;
quest_talk(#quest_marriage{type = _Type}, NextQuestId,
           Role) ->
    role:link_send(Role, 10223, {1, NextQuestId, 1}),
    ok.

doing_quest(#quest_marriage_args{type = 3},
            #team_mate{id = LoverId, pid = LoverPid},
            Role = #role{sex = Sex, id = SelfId,
                         m_team = #m_team{pid = TeamPid},
                         m_quest =
                             MQuest = #m_quest{quest_marriage =
                                                   QMarriage =
                                                       #quest_marriage{ext_data
                                                                           =
                                                                           ExtData}}}) ->
    {FemaleId, MaleId} = case Sex of
                             0 -> {LoverId, SelfId};
                             _ -> {SelfId, LoverId}
                         end,
    case question_init(FemaleId, MaleId) of
        {ok, MQuestion = #quest_marriage_question{mid = Mid}} ->
            IsStart = 1,
            Args = [SelfId, TeamPid, MQuestion, IsStart],
            case role:apply(sync,
                            LoverPid,
                            {quest_marriage, sync_question, Args})
                of
                ok -> ok;
                {false, Msg} ->
                    notice:send(Role, 1, Msg),
                    false;
                _ ->
                    Msg = lang:get("需要伴侣二人组队才能开始进行答题"),
                    notice:send(Role, 1, Msg),
                    false
            end,
            NewExtData = ExtData#{mid => Mid},
            NewQMarriage = QMarriage#quest_marriage{ext_data =
                                                        NewExtData},
            NewMQuest = MQuest#m_quest{quest_marriage =
                                           NewQMarriage},
            NewRole = Role#role{m_quest = NewMQuest},
            {ok, NewRole};
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("初始化心有灵犀失败")}
    end;
doing_quest(_Args, _Lover, Role) -> {ok, Role}.

sync_question(Role = #role{m_wedding =
                               #m_wedding{status = 3, lover_id = LoverId},
                           m_team = #m_team{pid = TeamPid},
                           m_quest =
                               MQuest = #m_quest{quest_marriage =
                                                     QMarriage =
                                                         #quest_marriage{ext_data
                                                                             =
                                                                             ExtData}}},
              LoverId, TeamPid,
              _MQuestion = #quest_marriage_question{mid = Mid},
              IsStart)
    when is_pid(TeamPid) ->
    NewRole = case IsStart of
                  1 ->
                      NewExtData = ExtData#{mid => Mid},
                      NewQMarriage = QMarriage#quest_marriage{ext_data =
                                                                  NewExtData},
                      NewMQuest = MQuest#m_quest{quest_marriage =
                                                     NewQMarriage},
                      Role#role{m_quest = NewMQuest};
                  _ -> Role
              end,
    {ok, ok, NewRole};
sync_question(_Role, _LoverId, _TeamPid, _MQuestion,
              _IsStart) ->
    {ok, {false, lang:get("需要伴侣二人组队才能开始进行答题")}}.

accept(QuestData,
       Role = #role{id = SelfId,
                    m_team = #m_team{pid = TeamPid}},
       AccQuestId,
       Args = #quest_marriage_args{lover_pid = LoverPid}) ->
    {NewQuest, AcceptRole, NewArgs} = do_accept(QuestData,
                                                Role,
                                                AccQuestId,
                                                Args),
    NewRole = AcceptRole,
    case team:is_leader(Role) of
        true ->
            case role:apply(sync,
                            LoverPid,
                            {quest_marriage,
                             sync_quest_marriage,
                             [SelfId, TeamPid, NewArgs]})
                of
                ok -> {NewQuest, NewRole};
                {false, Msg} -> {false, Msg};
                _False ->
                    logger:error("[~ts]领取情缘任务失败:~w",
                                 [Role#role.name, _False],
                                 quest_marriage,
                                 447),
                    {false, lang:get("无法领取情缘任务")}
            end;
        _ -> {NewQuest, NewRole}
    end;
accept(_QuestData, Role, AccQuestId, Args) ->
    logger:error("[~ts]领取情缘任务[quest_id:~w]失败Args:~w",
                 [Role#role.name, AccQuestId, Args],
                 quest_marriage,
                 453),
    {false, lang:get("领取情缘任务失败")}.

do_accept(Data = #quest_data{id = QuestId, type = Type,
                             sec_type = SecType, progress = Progress},
          Role = #role{m_quest =
                           MQuest = #m_quest{quest = Quests,
                                             acceptable = Acceptable,
                                             quest_marriage =
                                                 QuestMarriage =
                                                     #quest_marriage{ext_data =
                                                                         ExtData}}},
          AccQuestId,
          Args = #quest_marriage_args{round = Round,
                                      type = MarriageType,
                                      sec_type = MarriageSecType}) ->
    Now = date:unixtime(),
    {NewArgs, Progress0} = dynamic_progress(Progress,
                                            Data,
                                            Args,
                                            Role,
                                            []),
    #quest_marriage_args{robot_id = RobotId} = NewArgs,
    Progress1 = quest_prog_init:do(Role,
                                   Progress0,
                                   QuestId),
    {NewProgress, LoadRole} = quest:load_progress(Progress1,
                                                  quest_marriage,
                                                  QuestId,
                                                  [],
                                                  Role),
    UnitRole = plot_quest:create_task_unit(LoadRole,
                                           QuestId,
                                           NewProgress),
    Finish = case [false
                   || #quest_progress{finish = 0} <- NewProgress]
                 of
                 [] -> 1;
                 _ -> 0
             end,
    EndT = Now + 40 * 60,
    NQuest = #quest{id = QuestId, finish = Finish,
                    type = Type, sec_type = SecType, progress = NewProgress,
                    end_time = EndT, accept_time = Now},
    quest:set_check_timer(EndT),
    NewQuests = [NQuest | Quests],
    NewAcceptable = lists:delete(AccQuestId, Acceptable),
    NewQuestMarriage = QuestMarriage#quest_marriage{quest_id
                                                        = QuestId,
                                                    round = Round,
                                                    type = MarriageType,
                                                    sec_type = MarriageSecType,
                                                    ext_data =
                                                        ExtData#{robot_id =>
                                                                     RobotId}},
    NewMQuest = MQuest#m_quest{quest = NewQuests,
                               acceptable = NewAcceptable,
                               quest_marriage = NewQuestMarriage},
    NewRole = UnitRole#role{m_quest = NewMQuest},
    {NQuest, NewRole, NewArgs}.

sync_quest_marriage(Role = #role{m_wedding =
                                     #m_wedding{lover_id = LoverId},
                                 m_team = #m_team{status = 2, pid = TeamPid},
                                 m_quest =
                                     MQuest = #m_quest{quest_marriage =
                                                           QMarriage}},
                    LoverId, TeamPid,
                    Args = #quest_marriage_args{quest_id = QuestId,
                                                type = Type,
                                                sec_type = SecType})
    when is_pid(TeamPid) ->
    Steps = [condition, loss, accept, fire],
    QuestRole = Role#role{m_quest =
                              MQuest#m_quest{quest_marriage =
                                                 QMarriage#quest_marriage{type =
                                                                              Type,
                                                                          sec_type
                                                                              =
                                                                              SecType}}},
    case quest:callback_accept(QuestRole,
                               QuestId,
                               Steps,
                               Args)
        of
        {ok, AcceptRole} ->
            MaxVar = var:get_var(AcceptRole, day_five, 113, 0),
            VarRole = case MaxVar < 1 of
                          false -> AcceptRole;
                          true -> var:set_var(AcceptRole, day_five, 113, 1)
                      end,
            NewRole = VarRole,
            quest_talk(QMarriage, QuestId, NewRole),
            {ok, ok, NewRole};
        _ -> {ok, {false, lang:get("伴侣未满足领取情缘任务的条件，领取情缘任务失败")}}
    end;
sync_quest_marriage(#role{sex = Sex,
                          m_team = #m_team{status = 2, pid = TeamPid}},
                    _LoverId, TeamPid, _QuestArgs)
    when is_pid(TeamPid) ->
    Msg = case Sex of
              0 -> lang:get("您的爱人暂时离开队伍了，赶紧叫他归队吧");
              _ -> lang:get("您的爱人暂时离开队伍了，赶紧叫她归队吧")
          end,
    {ok, {false, Msg}};
sync_quest_marriage(#role{sex = Sex}, _LoverId,
                    _TeamPid, _QuestArgs) ->
    Msg = case Sex of
              0 -> lang:get("带上您的爱人才能领取任务");
              _ -> lang:get("带上您的爱人才能领取任务")
          end,
    {ok, {false, Msg}}.

check_rpc_accept(Role = #role{m_wedding =
                                  #m_wedding{status = 3},
                              m_quest =
                                  #m_quest{quest = Quests,
                                           quest_marriage =
                                               #quest_marriage{round =
                                                                   Round}}}) ->
    case lists:keyfind(15, #quest.sec_type, Quests) of
        #quest{finish = 1} ->
            {false, lang:get("请先提交当前已完成的情缘任务")};
        #quest{} -> {false, lang:get("您当前的已领取了情缘任务")};
        _None ->
            DayLimit = var:get_var(Role, day_five, 113, 0),
            MaxAcceptedFlag = DayLimit < 1,
            IsAcceptedFlag = Round >= 0 andalso Round =< 10,
            case {MaxAcceptedFlag, IsAcceptedFlag} of
                {false, true} -> check_teammate_accept_cond(Role);
                {true, _} -> check_teammate_accept_cond(Role);
                _False -> {false, lang:get("今天已经领取过情缘任务了，请明天5点后再来领取")}
            end
    end;
check_rpc_accept(_Role) ->
    {false, lang:get("您还未结缘，无法领取情缘任务")}.

check_teammate_accept_cond(Role = #role{sex = Sex,
                                        m_wedding =
                                            #m_wedding{lover_id = LoverId}}) ->
    case team:is_team(Role) andalso team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [Lover = #team_mate{id = LoverId, status = 2}] ->
                    {ok, Lover};
                [#team_mate{id = LoverId, status = 3}] ->
                    Msg = case Sex of
                              0 -> lang:get("您的爱人暂时离开队伍了，赶紧叫他归队吧");
                              _ -> lang:get("您的爱人暂时离开队伍了，赶紧叫她归队吧")
                          end,
                    {false, Msg};
                [#team_mate{id = LoverId, status = 4}] ->
                    {false, lang:get("伴侣二人一起组队才能领取任务哦")};
                [] ->
                    Msg = case Sex of
                              0 -> lang:get("带上您的爱人才能领取任务");
                              _ -> lang:get("带上您的爱人才能领取任务")
                          end,
                    {false, Msg};
                [#team_mate{}] ->
                    {team_false, lang:get("你们并不是伴侣关系，我不能给你们任务")};
                [_ | _] -> {team_false, lang:get("只有伴侣二人组队才能领取情缘任务哦")};
                _ -> {false, lang:get("竟然背着另一半做任务，想跪搓衣板么？")}
            end;
        _ ->
            Msg = case Sex of
                      0 -> lang:get("带上您的爱人才能领取任务");
                      _ -> lang:get("带上您的爱人才能领取任务")
                  end,
            {false, Msg}
    end.

check_teammate_commit_cond(Role = #role{sex = Sex,
                                        m_wedding =
                                            #m_wedding{status = 3,
                                                       lover_id = LoverId}}) ->
    case {team:is_team(Role), team:is_leader(Role)} of
        {true, true} ->
            case team:get_members(Role) of
                [Lover = #team_mate{id = LoverId, status = 2}] ->
                    {ok, Lover};
                [#team_mate{id = LoverId, status = 3}] ->
                    Msg = case Sex of
                              0 -> lang:get("您的爱人暂时离开队伍了，赶紧叫他归队吧");
                              _ -> lang:get("您的爱人暂时离开队伍了，赶紧叫她归队吧")
                          end,
                    {false, Msg};
                [_] -> {false, lang:get("伴侣二人一起组队才能提交任务哦")};
                [_ | _] -> {team_false, lang:get("队伍中存在非伴侣成员，无法提交任务")};
                _ -> {false, lang:get("不可以竟然背着另一半做任务哟")}
            end;
        {true, false} -> {false, lang:get("只有队长才可以提交任务")};
        _ -> {false, lang:get("伴侣二人一起组队才能提交任务哦")}
    end;
check_teammate_commit_cond(_Role) ->
    {false, lang:get("伴侣二人一起组队才能提交任务哦")}.

check_teammate_cond(Role = #role{sex = Sex,
                                 m_wedding =
                                     #m_wedding{status = 3,
                                                lover_id = LoverId}}) ->
    case team:is_team(Role) of
        true ->
            case team:get_members(Role) of
                [Lover = #team_mate{id = LoverId, status = Status}]
                    when Status =:= 2 orelse Status =:= 1 ->
                    {ok, Lover};
                [#team_mate{id = LoverId, status = 3}] ->
                    Msg = case Sex of
                              0 -> lang:get("您的爱人暂时离开队伍了，赶紧叫他归队吧");
                              _ -> lang:get("您的爱人暂时离开队伍了，赶紧叫她归队吧")
                          end,
                    {false, Msg};
                [_] -> {false, lang:get("伴侣二人一起组队才能做任务哦")};
                [_ | _] -> {team_false, lang:get("队伍中存在非伴侣成员，无法做情缘任务")};
                _ -> {false, lang:get("不可以竟然背着另一半做任务哟")}
            end;
        _ -> {false, lang:get("不可以背着另一半做任务哟")}
    end;
check_teammate_cond(_Role) ->
    {false, lang:get("伴侣二人一起组队才能提交任务哦")}.

check_commit(Role) ->
    case team:is_leader(Role) of
        true -> true;
        false -> {error, lang:get("只有伴侣二人组队的队长才可以提交任务哟")}
    end.

commit(Role = #role{m_team = #m_team{pid = TeamPid},
                    m_quest =
                        MQuest = #m_quest{quest_marriage =
                                              QMarriage =
                                                  #quest_marriage{total_count =
                                                                      Total,
                                                                  round =
                                                                      Round}},
                    m_wedding = #m_wedding{lover_id = LoverId},
                    id = SelfId},
       QuestId) ->
    case check_teammate_commit_cond(Role) of
        {ok, Lover = #team_mate{pid = LoverPid}} ->
            case role:apply(sync,
                            LoverPid,
                            {quest_marriage, sync_commit, [TeamPid, QuestId]})
                of
                ok ->
                    MaxVar = var:get_var(Role, day_five, 113, 0),
                    NewTotal = Total + 1,
                    IntimacyVal = case quest_marriage_data:get_reward(Round)
                                      of
                                      #quest_marriage_reward_data{intimacy =
                                                                      IVal} ->
                                          IVal;
                                      _ -> 0
                                  end,
                    case MaxVar =:= 0 of
                        false ->
                            friend:add_intimacy_and_push(SelfId,
                                                         LoverId,
                                                         IntimacyVal,
                                                         Role),
                            NewQMarriage = QMarriage#quest_marriage{total_count
                                                                        =
                                                                        NewTotal},
                            NewMQuest = MQuest#m_quest{quest_marriage =
                                                           NewQMarriage},
                            NewRole = Role#role{m_quest = NewMQuest},
                            case accept_next(NewRole, Lover) of
                                {false, Msg} -> {error, Msg};
                                Rtn -> Rtn
                            end;
                        true ->
                            friend:add_intimacy_and_push(SelfId,
                                                         LoverId,
                                                         IntimacyVal,
                                                         Role),
                            NewQMarriage = QMarriage#quest_marriage{round = 0,
                                                                    sec_type =
                                                                        0,
                                                                    type = 0,
                                                                    quest_id =
                                                                        0,
                                                                    ext_data =
                                                                        #{mid =>
                                                                              0,
                                                                          robot_id
                                                                              =>
                                                                              undefined},
                                                                    total_count
                                                                        =
                                                                        NewTotal},
                            NewMQuest = MQuest#m_quest{quest_marriage =
                                                           NewQMarriage},
                            NewRole = Role#role{m_quest = NewMQuest},
                            {ok, NewRole}
                    end;
                {false, Msg} -> {error, Msg};
                _ -> {error, lang:get("提交情缘任务失败")}
            end;
        {false, Msg} -> {error, Msg};
        _ -> {error, lang:get("伴侣二人一起组队才能提交任务哦")}
    end.

sync_commit(Role = #role{m_team =
                             #m_team{status = 2, pid = TeamPid},
                         m_wedding = #m_wedding{lover_id = LoverId},
                         m_quest =
                             #m_quest{quest_marriage =
                                          #quest_marriage{round = Round}},
                         id = SelfId},
            TeamPid, QuestId)
    when is_pid(TeamPid) ->
    Steps = [reward, finish, del_quest, flush, fire],
    case quest:callback_commit(Role, QuestId, Steps) of
        {ok,
         NRole = #role{m_quest =
                           MQuest = #m_quest{quest_marriage =
                                                 QMarriage =
                                                     #quest_marriage{total_count
                                                                         =
                                                                         Total}}}} ->
            NewTotal = Total + 1,
            IntimacyVal = case quest_marriage_data:get_reward(Round)
                              of
                              #quest_marriage_reward_data{intimacy = IVal} ->
                                  IVal;
                              _ -> 0
                          end,
            friend:add_intimacy_and_push(SelfId,
                                         LoverId,
                                         IntimacyVal,
                                         Role),
            NewQMarriage = case Round >= 10 of
                               false ->
                                   QMarriage#quest_marriage{total_count =
                                                                NewTotal};
                               true ->
                                   QMarriage#quest_marriage{total_count =
                                                                NewTotal,
                                                            round = Round + 1}
                           end,
            Role1 = case Round >= 10 of
                        true ->
                            role_trigger:fire(#evt_finish_couple_task{}, NRole);
                        false -> NRole
                    end,
            NewMQuest = MQuest#m_quest{quest_marriage =
                                           NewQMarriage},
            NewRole = Role1#role{m_quest = NewMQuest},
            {ok, ok, NewRole};
        _ -> {ok, {false, lang:get("您的伴侣提交任务失败")}}
    end;
sync_commit(#role{sex = Sex,
                  m_team = #m_team{status = 2, pid = TeamPid}},
            TeamPid, _QuestId)
    when is_pid(TeamPid) ->
    Msg = case Sex of
              0 -> lang:get("您的爱人暂时离开队伍了，赶紧叫他归队吧");
              _ -> lang:get("您的爱人暂时离开队伍了，赶紧叫她归队吧")
          end,
    {ok, {false, Msg}};
sync_commit(_Role, _TeamPid, _QuestId) ->
    {ok, {false, lang:get("伴侣二人一起组队才能提交任务哦")}}.

sync_quest_talk(#quest{id = QuestId}, TalkType, Role) ->
    case check_teammate_commit_cond(Role) of
        {ok, #team_mate{pid = TeammatePid}}
            when is_pid(TeammatePid) ->
            role:pack_send(TeammatePid,
                           10223,
                           {1, QuestId, TalkType}),
            ok;
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            false;
        {team_false, Msg} ->
            MFA = {notice, send, [1, Msg]},
            team:async_teammate(Role, MFA),
            false;
        _ -> false
    end;
sync_quest_talk(_Quest, _TalkType, _Role) -> false.

finish_marriage_flower(Evt,
                       Role = #role{m_wedding =
                                        #m_wedding{status = 3,
                                                   lover_id = LoverId}}) ->
    Flag = case Evt of
               #evt_send_flower{recv_id = LoverId} -> true;
               #evt_recv_flower{send_id = LoverId} -> true;
               _ -> false
           end,
    case Flag of
        true ->
            FireEvt = #evt_marriage_flower{},
            NewRole = role_trigger:fire(FireEvt, Role),
            {remove, NewRole};
        false -> ok
    end;
finish_marriage_flower(_, _Role) -> ok.

add_trigger(Prog, Qid,
            Role = #role{m_quest =
                             #m_quest{quest_marriage =
                                          #quest_marriage{type = Type,
                                                          sec_type =
                                                              SecType}}}) ->
    case do_add_trigger(Type, SecType, Prog, Qid, Role) of
        {ok, NewRole} -> {ok, Prog, NewRole};
        {ok, NewProg, NewRole} -> {ok, NewProg, NewRole};
        false -> {ok, Prog, Role}
    end;
add_trigger(Prog, _Qid, Role) -> {ok, Prog, Role}.

do_add_trigger(4, _SecType, _P, _QuestId, Role) ->
    Tris = [#trigger{label = evt_send_flower,
                     m = quest_marriage, f = finish_marriage_flower, a = []},
            #trigger{label = evt_recv_flower, m = quest_marriage,
                     f = finish_marriage_flower, a = []}],
    {_, TriRole} = role_trigger:add(Tris, Role),
    {ok, TriRole};
do_add_trigger(3, _SecType, _P, _QuestId, Role) ->
    Tri = #trigger{label = evt_finish_marriage_question,
                   m = quest_marriage, f = finish_question_quest, a = []},
    {_, TriRole} = role_trigger:add(Tri, Role),
    {ok, TriRole};
do_add_trigger(_Type, _SecType, _P, _Id, _Role) ->
    false.

push_question_info(Role = #role{m_quest =
                                    #m_quest{quest_marriage =
                                                 #quest_marriage{type = 3,
                                                                 ext_data =
                                                                     ExtData}},
                                m_wedding = #m_wedding{status = 3}}) ->
    case get_mid(ExtData, Role) of
        {ok, Mid} ->
            case lookup(quest_marriage_question, Mid) of
                [MQuestion = #quest_marriage_question{start_time =
                                                          StartTime}] ->
                    case check_teammate_cond(Role) of
                        {ok, #team_mate{pid = LoverPid}} ->
                            case StartTime > 0 of
                                true ->
                                    role:apply(async,
                                               LoverPid,
                                               {quest_marriage,
                                                push_next_question,
                                                [MQuestion]}),
                                    push_next_question(Role, MQuestion),
                                    ok;
                                false ->
                                    case case catch
                                                  gen_server:call(quest_marriage,
                                                                  {get_question_info,
                                                                   Mid},
                                                                  10000)
                                             of
                                             {'EXIT', {timeout, _}} ->
                                                 {error, timeout};
                                             {'EXIT', {noproc, _}} ->
                                                 {error, noproc};
                                             {'EXIT', {normal, _}} ->
                                                 {error, exit};
                                             {'EXIT', _Call_Err} ->
                                                 {error, _Call_Err};
                                             _Call_Return -> _Call_Return
                                         end
                                        of
                                        {ok, NewMQuestion} ->
                                            role:apply(async,
                                                       LoverPid,
                                                       {quest_marriage,
                                                        push_next_question,
                                                        [NewMQuestion]}),
                                            push_next_question(Role,
                                                               NewMQuestion),
                                            ok;
                                        _ -> {false, lang:get("无法获取题目信息")}
                                    end
                            end;
                        {false, Msg} ->
                            notice:send(Role, 1, Msg),
                            false;
                        {team_false, Msg} ->
                            notice:send(Role, 1, Msg),
                            MFA = {notice, send, [1, Msg]},
                            team:async_teammate(Role, MFA),
                            false;
                        _ ->
                            notice:send(Role, 1, lang:get("没有题目信息")),
                            false
                    end;
                _ -> false
            end;
        _ -> false
    end;
push_question_info(_Role) -> false.

start_link() ->
    gen_server:start_link({local, quest_marriage},
                          quest_marriage,
                          [],
                          [{debug, [trace]}]).

question_init(FemaleId, MaleId) ->
    case catch gen_server:call(quest_marriage,
                               {question_init, FemaleId, MaleId},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

commit_answer(Sid, Option,
              Role = #role{id = SelfId,
                           m_quest =
                               #m_quest{quest_marriage =
                                            #quest_marriage{ext_data =
                                                                ExtData}}}) ->
    case get_mid(ExtData, Role) of
        {ok, Mid} ->
            case case catch gen_server:call(quest_marriage,
                                            {commit_answer,
                                             Sid,
                                             Option,
                                             Mid,
                                             SelfId},
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
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("无法提交答案")}
            end;
        _ -> {false, lang:get("无法提交答案")}
    end.

answer(Sid, Option,
       Role = #role{m_quest =
                        #m_quest{quest_marriage =
                                     #quest_marriage{type = 3}}}) ->
    case check_teammate_answer_cond(Role) of
        {ok, _Lover} -> commit_answer(Sid, Option, Role);
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("只有伴侣二人组队才能进行答题哟")}
    end;
answer(_Sid, _Option, _Role) ->
    {false, lang:get("无法提交答案")}.

check_teammate_answer_cond(Role = #role{sex = Sex,
                                        m_wedding =
                                            #m_wedding{status = 3,
                                                       lover_id = LoverId}}) ->
    case team:is_team(Role) of
        true ->
            case team:get_members(Role) of
                [Lover = #team_mate{id = LoverId, status = Status}]
                    when Status =:= 1 orelse Status =:= 2 ->
                    {ok, Lover};
                [#team_mate{id = LoverId, status = 3}] ->
                    Msg = case Sex of
                              0 -> lang:get("您的爱人暂时离开队伍了，无法提交答案");
                              _ -> lang:get("您的爱人暂时离开队伍了，无法提交答案")
                          end,
                    {false, Msg};
                _False -> {false, lang:get("只有伴侣二人组队才能进行答题哟")}
            end;
        _ -> {false, lang:get("只有伴侣二人组队才能进行答题哟")}
    end.

get_reward(#quest_data{rewards_commit = Rewards},
           Role = #role{m_quest =
                            #m_quest{quest_marriage =
                                         #quest_marriage{round = Round}},
                        lev = Lev}) ->
    {NewRole1, CalcRewards} = case
                                  quest_marriage_data:get_reward(Round)
                                  of
                                  Data = #quest_marriage_reward_data{love =
                                                                         Love} ->
                                      case
                                          quest_marriage_data:get_lev_ratio(Lev)
                                          of
                                          LevRatioData
                                              when is_tuple(LevRatioData) ->
                                              RtnCalcRewards =
                                                  calc_reward(Rewards,
                                                              Data,
                                                              LevRatioData,
                                                              []),
                                              {NewRole, RtnCalcRewards1} =
                                                  calc_pray_buff(Role,
                                                                 RtnCalcRewards,
                                                                 Round),
                                              {NewRole,
                                               [#gain{label = love, val = Love}
                                                | RtnCalcRewards1]};
                                          _ -> {Role, []}
                                      end;
                                  _ -> {Role, []}
                              end,
    NewRewards = CalcRewards,
    {ok, NewRole1, NewRewards}.

calc_reward([], _RewardData, _LevRatio, Acc) -> Acc;
calc_reward([G = #gain{label = exp, val = Val} | Rest],
            RewardData = #quest_marriage_reward_data{exp_ratio =
                                                         Ratio},
            LevRatio = {LevExpRatio, _, _}, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * LevExpRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest, RewardData, LevRatio, [NewG | Acc]);
calc_reward([G = #gain{label = coin, val = Val} | Rest],
            RewardData = #quest_marriage_reward_data{coin_ratio =
                                                         Ratio},
            LevRatio = {_, LevCoinRatio, _}, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * LevCoinRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest, RewardData, LevRatio, [NewG | Acc]);
calc_reward([G = #gain{label = pet_exp, val = Val}
             | Rest],
            RewardData = #quest_marriage_reward_data{pet_exp_ratio =
                                                         Ratio},
            LevRatio = {_, _, PetLevRatio}, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * PetLevRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest, RewardData, LevRatio, [NewG | Acc]);
calc_reward([H | Rest], RewardData, LevRatio, Acc) ->
    calc_reward(Rest, RewardData, LevRatio, [H | Acc]).

kill(_DoType, _QuestData, PlotUnit,
     Role = #role{m_wedding =
                      #m_wedding{status = 3, lover_id = LoverId},
                  m_quest =
                      #m_quest{quest_marriage =
                                   #quest_marriage{type = 2,
                                                   sec_type = SecType}}}) ->
    case team:is_team(Role) andalso team:is_leader(Role) of
        true ->
            case team:get_fighters(Role) of
                {ok,
                 Fighters = [_, #team_mate{status = 2, id = LoverId}]} ->
                    Enemy = case SecType of
                                1 -> convert_enemy_robot(PlotUnit, Role);
                                _ -> convert_enemy_unit(PlotUnit, Role)
                            end,
                    case Enemy of
                        {ok, EnemyFighter} ->
                            combat_mgr:start_combat(27, Fighters, EnemyFighter),
                            Role;
                        _ -> {false, lang:get("发起战斗失败")}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("只有伴侣二人组队才能进入战斗哦")}
            end;
        _ -> {false, lang:get("只有伴侣二人组队才能进入战斗哦")}
    end;
kill(_DoType, _QuestData, _PlotUnit, Role) -> Role.

convert_enemy_robot(#plot_unit{base_id = UnitBaseId,
                               name = UnitName},
                    Role = #role{m_quest =
                                     #m_quest{quest_marriage =
                                                  #quest_marriage{ext_data =
                                                                      ExtData}},
                                 id = {Id, _, _}}) ->
    case unit_convert:to(unit, UnitBaseId) of
        {ok, _Unit} ->
            case maps:get(robot_id, ExtData, undefined) of
                RobotId when is_tuple(RobotId) ->
                    case robot_mgr:get_role(RobotId) of
                        {ok, Robot = #robot_role{classes = Classes}} ->
                            AiId = role_misc:get_ai(Classes),
                            NewRobot = Robot#robot_role{ai_id = AiId,
                                                        name = UnitName},
                            {ok, [NewRobot]};
                        _False ->
                            logger:error("[~ts]转换战斗敌人[UnitBaseId:~w]数据~w",
                                         [Role#role.name, UnitBaseId, _False],
                                         quest_marriage,
                                         1099),
                            {ok, Robot} = role_convert:to(robot_role, Role),
                            {ok,
                             [Robot#robot_role{id = {Id, "robot", 0},
                                               name = UnitName}]}
                    end;
                _False ->
                    logger:error("[~ts]转换战斗敌人[UnitBaseId:~w]数据~w",
                                 [Role#role.name, UnitBaseId, _False],
                                 quest_marriage,
                                 1104),
                    {ok, Robot} = role_convert:to(robot_role, Role),
                    {ok,
                     [Robot#robot_role{id = {Id, "robot", 0},
                                       name = UnitName}]}
            end;
        _ -> false
    end.

convert_enemy_unit(#plot_unit{base_id = UnitBaseId},
                   Role) ->
    case unit_convert:to(unit, UnitBaseId) of
        {ok, Unit} -> {ok, Unit};
        _False ->
            logger:error("[~ts]发起战斗失败，无法转换敌人[BaseId:~w]数据:~w",
                         [Role#role.name, UnitBaseId, _False],
                         quest_marriage,
                         1116),
            false
    end.

lookup(Tab, Key) -> catch ets:lookup(Tab, Key).

delete(Tab, Key) ->
    catch ets:delete(Tab, Key),
    catch dets:delete(Tab, Key),
    ok.

save(Tab, Data) ->
    catch ets:insert(Tab, Data),
    catch dets:insert(Tab, Data),
    ok.

init([]) ->
    logger:info("[~w] 正在启动...",
                [quest_marriage],
                quest_marriage,
                1140),
    case catch load_data() of
        ok ->
            process_flag(trap_exit, true),
            Ref = reset_timer(),
            Pltm = case env:get(platform) of
                       undefined -> "";
                       TmpPltm -> TmpPltm
                   end,
            ZoneId = case env:get(zone_id) of
                         undefined -> 0;
                         TmpZoneId -> TmpZoneId
                     end,
            logger:info("[~w] 启动完成",
                        [quest_marriage],
                        quest_marriage,
                        1147),
            {ok,
             #quest_marriage_state{reset_timer = Ref,
                                   platform = Pltm, zone_id = ZoneId}};
        Err ->
            logger:error("[~w] 启动失败，无法载入数据[Err:~w]",
                         [quest_marriage, Err],
                         quest_marriage,
                         1150),
            {stop, abnormal}
    end.

handle_call({question_init, FemaleId, MaleId}, _From,
            State = #quest_marriage_state{question_next_mid =
                                              NextMid}) ->
    Reply = server_question_init(FemaleId,
                                 MaleId,
                                 NextMid,
                                 State),
    NewState = State#quest_marriage_state{question_next_mid
                                              = NextMid + 1},
    {reply, Reply, NewState};
handle_call({commit_answer, Sid, Option, Mid, SelfId},
            {Pid, _Tag}, State) ->
    Reply = server_commit_answer(Sid,
                                 Option,
                                 Mid,
                                 SelfId,
                                 Pid,
                                 State),
    {reply, Reply, State};
handle_call({gain_question_reward, Mid, SelfId}, _From,
            State) ->
    Reply = server_gain_question_reward(Mid, SelfId, State),
    {reply, Reply, State};
handle_call({get_question_info, Mid}, _From, State) ->
    Reply = server_get_question_info(Mid, State),
    {reply, Reply, State};
handle_call(Msg, _From, State) ->
    logger:info("[~w]接收到未知的消息[~w]",
                [quest_marriage, Msg],
                quest_marriage,
                1175),
    Reply = false,
    {reply, Reply, State}.

handle_cast(Msg, State) ->
    logger:info("[~w]接收到未知的消息[~w]",
                [quest_marriage, Msg],
                quest_marriage,
                1180),
    {noreply, State}.

handle_info(reset,
            State = #quest_marriage_state{reset_timer = Ref}) ->
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        _ -> skip
    end,
    NewRef = reset_timer(),
    catch ets:delete_all_objects(quest_marriage_question),
    catch dets:delete_all_objects(quest_marriage_question),
    server_timer:clean(),
    NewState = State#quest_marriage_state{question_next_mid
                                              = 1,
                                          reset_timer = NewRef},
    logger:info("情缘任务进程数据重置完成", [], quest_marriage, 1193),
    {noreply, NewState};
handle_info({timer_tick, Msg}, State) ->
    NewState = case tick(Msg, State) of
                   remove ->
                       server_timer:timer(remove),
                       State;
                   _False ->
                       server_timer:timer(remove),
                       State
               end,
    {noreply, NewState};
handle_info(Msg, State) ->
    logger:info("[~w]接收到未知的消息[~w]",
                [quest_marriage, Msg],
                quest_marriage,
                1207),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭:~w",
                [quest_marriage, _Reason],
                quest_marriage,
                1211),
    util:close_dets(quest_marriage_question),
    logger:info("[~w] 关闭完成",
                [quest_marriage],
                quest_marriage,
                1213),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

tick({answer_timeout, Mid, Sid}, State) ->
    server_commit_answer(Mid, Sid, State),
    remove;
tick(_, _) -> remove.

load_data() ->
    quest_marriage_question =
        ets:new(quest_marriage_question,
                [set,
                 named_table,
                 public,
                 {keypos, #quest_marriage_question.mid}]),
    {ok, quest_marriage_question} =
        dets:open_file(quest_marriage_question,
                       [{file, "dets/quest_marriage_question.dets"},
                        {keypos, #quest_marriage_question.mid}]),
    FunAsk = fun (AskQuestion, Acc) ->
                     case quest_marriage_ver:do(AskQuestion) of
                         {ok, NewAskQuestion} -> [NewAskQuestion | Acc];
                         {false, Msg} -> {error, Msg}
                     end
             end,
    case dets:foldl(FunAsk, [], quest_marriage_question) of
        AskList when is_list(AskList) ->
            dets:delete_all_objects(quest_marriage_question),
            ok = dets:insert(quest_marriage_question, AskList),
            true = ets:insert(quest_marriage_question, AskList),
            ok;
        AskErr ->
            logger:error("答题数据载入错误:~w",
                         [AskErr],
                         quest_marriage,
                         1248),
            false
    end,
    ok.

reset_timer() ->
    NextTime = date:next_diff(5, 0, 0) * 1000,
    logger:info("情缘任务下一次定时时间:~w",
                [NextTime],
                quest_marriage,
                1256),
    erlang:send_after(NextTime, self(), reset).

server_question_init(FemaleId, MaleId, NextMid,
                     #quest_marriage_state{platform = Platform,
                                           zone_id = ZoneId}) ->
    QuestionList = question_data:empathy_list(),
    case util:rand_list_n(QuestionList, 3) of
        Selected = [QId | _] ->
            Mid = {Platform, ZoneId, NextMid},
            MQuestion = #quest_marriage_question{mid = Mid, sid = 1,
                                                 qid = QId, male_id = MaleId,
                                                 female_id = FemaleId,
                                                 questions = Selected,
                                                 start_time = 0},
            save(quest_marriage_question, MQuestion),
            {ok, MQuestion};
        _ -> {false, lang:get("已经没有题目了")}
    end.

server_commit_answer(Mid, Sid, State) ->
    case lookup(quest_marriage_question, Mid) of
        [MQuestion = #quest_marriage_question{sid = Sid}] ->
            answer_timeout(MQuestion, State);
        _ -> remove
    end.

server_commit_answer(Sid, Option, Mid, SelfId, SelfPid,
                     State) ->
    case lookup(quest_marriage_question, Mid) of
        [MQuestion = #quest_marriage_question{sid = Sid,
                                              opts = Opts,
                                              start_time = StartTime}] ->
            case lists:keyfind(SelfId, 1, Opts) of
                false ->
                    Now = date:unixtime(),
                    case StartTime + 20 + 5 < Now of
                        true ->
                            answer_timeout(MQuestion,
                                           SelfId,
                                           SelfPid,
                                           Now,
                                           State);
                        false ->
                            handle_answer(MQuestion,
                                          Option,
                                          SelfId,
                                          SelfPid,
                                          Now,
                                          State)
                    end;
                _ -> {false, lang:get("无需重复提交")}
            end;
        _ -> {false, lang:get("没有找到对应的答题数据")}
    end.

handle_answer(MQuestion = #quest_marriage_question{mid =
                                                       Mid,
                                                   sid = Sid, qid = Qid,
                                                   questions = Questions,
                                                   opts = Opts, agreed = Agreed,
                                                   male_id = MaleId,
                                                   female_id = FemaleId,
                                                   answer_list = AnswerList,
                                                   start_time = StartTime},
              Option, SelfId, _SelfPid, Now, State) ->
    TimerId = {answer_timeout, Mid, Sid},
    {IsFinished, RtnMQuestion} = case Opts of
                                     [] ->
                                         TmpMQuestion =
                                             MQuestion#quest_marriage_question{opts
                                                                                   =
                                                                                   [{SelfId,
                                                                                     Option}]},
                                         Timeout = erlang:max(20 + 5 -
                                                                  (Now -
                                                                       StartTime),
                                                              1),
                                         Timer = #timer{id = TimerId,
                                                        timeout =
                                                            Timeout * 1000},
                                         server_timer:set(Timer),
                                         {false, TmpMQuestion};
                                     [{_, Option}] when Option =/= 0 ->
                                         PreOpts = [{SelfId, Option} | Opts],
                                         Answer = #quest_marriage_answer{sid =
                                                                             Sid,
                                                                         qid =
                                                                             Qid,
                                                                         opts =
                                                                             PreOpts,
                                                                         result
                                                                             =
                                                                             1},
                                         NewAnswerList = [Answer | AnswerList],
                                         TmpMQuestion =
                                             MQuestion#quest_marriage_question{agreed
                                                                                   =
                                                                                   [Qid
                                                                                    | Agreed],
                                                                               answer_list
                                                                                   =
                                                                                   NewAnswerList},
                                         server_timer:del(TimerId),
                                         {true, TmpMQuestion};
                                     _ ->
                                         PreOpts = [{SelfId, Option} | Opts],
                                         Answer = #quest_marriage_answer{sid =
                                                                             Sid,
                                                                         qid =
                                                                             Qid,
                                                                         opts =
                                                                             PreOpts,
                                                                         result
                                                                             =
                                                                             0},
                                         server_timer:del(TimerId),
                                         NewAnswerList = [Answer | AnswerList],
                                         TmpMQuestion =
                                             MQuestion#quest_marriage_question{answer_list
                                                                                   =
                                                                                   NewAnswerList},
                                         {true, TmpMQuestion}
                                 end,
    case Sid < 3 of
        true when IsFinished =:= true ->
            NextSid = Sid + 1,
            NewQid = lists:nth(NextSid, Questions),
            NewMQuestion = RtnMQuestion#quest_marriage_question{sid
                                                                    = NextSid,
                                                                qid = NewQid,
                                                                start_time = 0,
                                                                opts = []},
            MFA = {quest_marriage, question_result, [NewMQuestion]},
            async_local_marriage([FemaleId, MaleId], MFA, State),
            save(quest_marriage_question, NewMQuestion);
        false when IsFinished =:= true ->
            NextSid = Sid + 1,
            NewMQuestion = RtnMQuestion#quest_marriage_question{sid
                                                                    = NextSid,
                                                                qid = 0,
                                                                start_time = 0,
                                                                opts = []},
            MFA = {quest_marriage, end_question, [NewMQuestion]},
            async_local_marriage([FemaleId, MaleId], MFA, State),
            save(quest_marriage_question, NewMQuestion);
        _ ->
            NewMQuestion = RtnMQuestion,
            push_answer_status(SelfId, NewMQuestion),
            save(quest_marriage_question, NewMQuestion)
    end,
    ok.

answer_timeout(MQuestion = #quest_marriage_question{mid
                                                        = Mid,
                                                    sid = Sid,
                                                    questions = Questions,
                                                    opts = Opts, qid = Qid,
                                                    male_id = MaleId,
                                                    female_id = FemaleId,
                                                    answer_list = AnswerList},
               State) ->
    PreOpts = case Opts of
                  [] -> [{MaleId, 0}, {FemaleId, 0}];
                  [RestOpt = {MaleId, _Option}] ->
                      [{FemaleId, 0}, RestOpt];
                  [RestOpt] -> [{MaleId, 0}, RestOpt];
                  _ -> Opts
              end,
    TimerId = {answer_timeout, Mid, Sid},
    server_timer:del(TimerId),
    case Sid < 3 of
        true ->
            NextSid = Sid + 1,
            NewQid = lists:nth(NextSid, Questions),
            Answer = #quest_marriage_answer{sid = Sid, qid = Qid,
                                            opts = PreOpts, result = 0},
            NewAnswerList = [Answer | AnswerList],
            NewMQuestion = MQuestion#quest_marriage_question{sid =
                                                                 NextSid,
                                                             qid = NewQid,
                                                             opts = [],
                                                             start_time = 0,
                                                             answer_list =
                                                                 NewAnswerList},
            MFA = {quest_marriage, question_result, [NewMQuestion]},
            async_local_marriage([FemaleId, MaleId], MFA, State),
            save(quest_marriage_question, NewMQuestion),
            ok;
        false ->
            Answer = #quest_marriage_answer{sid = Sid, qid = Qid,
                                            opts = [], result = 0},
            NewAnswerList = [Answer | AnswerList],
            NewMQuestion = MQuestion#quest_marriage_question{sid =
                                                                 Sid + 1,
                                                             qid = 0,
                                                             opts = PreOpts,
                                                             answer_list =
                                                                 NewAnswerList},
            MFA = {quest_marriage, end_question, [NewMQuestion]},
            async_local_marriage([FemaleId, MaleId], MFA, State),
            save(quest_marriage_question, NewMQuestion),
            ok
    end,
    NoticeMFA = {notice, send, [1, lang:get("选择超时")]},
    async_local_marriage([FemaleId, MaleId],
                         NoticeMFA,
                         State),
    ok.

answer_timeout(MQuestion = #quest_marriage_question{mid
                                                        = Mid,
                                                    sid = Sid,
                                                    questions = Questions,
                                                    opts = Opts, qid = Qid,
                                                    male_id = MaleId,
                                                    female_id = FemaleId,
                                                    answer_list = AnswerList},
               SelfId, _SelfPid, _Now, State) ->
    {IsNext, PreOpts} = case Opts of
                            [] ->
                                LoverId = case SelfId =:= MaleId of
                                              true -> FemaleId;
                                              false -> MaleId
                                          end,
                                {true, [{SelfId, 0}, {LoverId, 0}]};
                            _ -> {true, [{SelfId, 0} | Opts]}
                        end,
    TimerId = {answer_timeout, Mid, Sid},
    server_timer:del(TimerId),
    case Sid < 3 of
        true ->
            NewMQuestion = case IsNext of
                               true ->
                                   NextSid = Sid + 1,
                                   NewQid = lists:nth(NextSid, Questions),
                                   Answer = #quest_marriage_answer{sid = Sid,
                                                                   qid = Qid,
                                                                   opts =
                                                                       PreOpts,
                                                                   result = 0},
                                   NewAnswerList = [Answer | AnswerList],
                                   RtnMQuestion =
                                       MQuestion#quest_marriage_question{sid =
                                                                             NextSid,
                                                                         qid =
                                                                             NewQid,
                                                                         opts =
                                                                             [],
                                                                         start_time
                                                                             =
                                                                             0,
                                                                         answer_list
                                                                             =
                                                                             NewAnswerList},
                                   MFA = {quest_marriage,
                                          question_result,
                                          [RtnMQuestion]},
                                   async_local_marriage([FemaleId, MaleId],
                                                        MFA,
                                                        State),
                                   RtnMQuestion;
                               false ->
                                   RtnMQuestion =
                                       MQuestion#quest_marriage_question{opts =
                                                                             PreOpts},
                                   push_answer_status(SelfId, RtnMQuestion),
                                   RtnMQuestion
                           end,
            save(quest_marriage_question, NewMQuestion),
            ok;
        false ->
            Answer = #quest_marriage_answer{sid = Sid, qid = Qid,
                                            opts = [], result = 0},
            NewAnswerList = [Answer | AnswerList],
            NewMQuestion = MQuestion#quest_marriage_question{sid =
                                                                 Sid + 1,
                                                             qid = 0,
                                                             opts = PreOpts,
                                                             answer_list =
                                                                 NewAnswerList},
            MFA = {quest_marriage, end_question, [NewMQuestion]},
            async_local_marriage([FemaleId, MaleId], MFA, State),
            save(quest_marriage_question, NewMQuestion),
            ok
    end,
    NoticeMFA = {notice, send, [1, lang:get("选择超时")]},
    async_local_marriage([FemaleId, MaleId],
                         NoticeMFA,
                         State),
    ok.

async_local_marriage([], _MFA, _State) -> ok;
async_local_marriage([LoverId | Rest], MFA, State) ->
    case role_query:local_pid(by_id, LoverId) of
        {ok, LoverPid} ->
            catch role:apply(async, LoverPid, MFA);
        _ -> skip
    end,
    async_local_marriage(Rest, MFA, State).

next_question(Role, MQuestion) ->
    push_question_result(Role, MQuestion),
    Rtn = case gain_question_reward(Role, MQuestion) of
              {ok, GainRole} -> {ok, GainRole};
              _ -> ok
          end,
    Rtn.

question_result(Role, MQuestion) ->
    push_question_result(Role, MQuestion),
    Rtn = case gain_question_reward(Role, MQuestion) of
              {ok, GainRole} -> {ok, GainRole};
              _ -> ok
          end,
    Rtn.

end_question(Role, MQuestion) ->
    push_question_result(Role, MQuestion),
    case gain_question_reward(Role, MQuestion) of
        {ok, GainRole} ->
            push_question_stats(Role, MQuestion),
            NewRole =
                role_trigger:fire(#evt_finish_marriage_question{},
                                  GainRole),
            {ok, NewRole};
        _ -> ok
    end.

push_question_stats(Role = #role{m_quest =
                                     #m_quest{quest_marriage =
                                                  #quest_marriage{ext_data =
                                                                      ExtData}},
                                 m_wedding = #m_wedding{status = 3}}) ->
    case get_mid(ExtData, Role) of
        {ok, Mid} ->
            case lookup(quest_marriage_question, Mid) of
                [MQuestion = #quest_marriage_question{}] ->
                    case check_teammate_cond(Role) of
                        {ok, #team_mate{pid = LoverPid}} ->
                            role:apply(async,
                                       LoverPid,
                                       {quest_marriage,
                                        push_question_stats,
                                        [MQuestion]}),
                            push_question_stats(Role, MQuestion),
                            ok;
                        {false, Msg} ->
                            notice:send(Role, 1, Msg),
                            false;
                        {team_false, Msg} ->
                            MFA = {notice, send, [1, Msg]},
                            team:async_teammate(Role, MFA),
                            false;
                        _ ->
                            notice:send(Role, 1, lang:get("没有题目信息")),
                            false
                    end;
                _ -> false
            end;
        _ -> false
    end;
push_question_stats(_Role) -> false.

push_question_stats(Role,
                    #quest_marriage_question{answer_list = AnswerList}) ->
    Gains = calc_question_reward(AnswerList, []),
    ValList = format:gain_to_val(Gains),
    role:link_send(Role, 15403, {AnswerList, ValList}),
    ok.

push_next_question(Role = #role{id = SelfId},
                   #quest_marriage_question{sid = Sid, qid = Qid,
                                            start_time = StartTime,
                                            opts = Opts}) ->
    {Status, Option} = case lists:keyfind(SelfId, 1, Opts)
                           of
                           {_, SelfOption} -> {1, SelfOption};
                           _ -> {0, 0}
                       end,
    role:link_send(Role,
                   15400,
                   {Sid, Qid, StartTime, Status, Option}),
    ok.

push_question_result(Role, MQuestion) ->
    case get_pre_answer(MQuestion) of
        {ok,
         #quest_marriage_answer{sid = Sid, qid = Qid,
                                result = Result, opts = Opts}} ->
            role:link_send(Role, 15402, {Sid, Qid, Result, Opts}),
            ok;
        _ -> ok
    end.

push_answer_status(SelfId,
                   #quest_marriage_question{male_id = MaleId,
                                            female_id = FemaleId, sid = Sid,
                                            qid = Qid}) ->
    LoverId = case SelfId =:= MaleId of
                  true -> FemaleId;
                  false -> MaleId
              end,
    case role_query:local_pid(by_id, SelfId) of
        {ok, SelfPid} ->
            role:pack_send(SelfPid, 15401, {Sid, Qid, 1, ""});
        _ -> skip
    end,
    case role_query:local_pid(by_id, LoverId) of
        {ok, LoverPid} ->
            role:pack_send(LoverPid, 15401, {Sid, Qid, 2, ""});
        _ -> skip
    end,
    ok.

gain_question_reward(Role, MQuestion) ->
    case get_pre_answer(MQuestion) of
        {ok, Answer} ->
            gain_question_reward(Role, MQuestion, Answer);
        _ -> false
    end.

gain_question_reward(Role = #role{id = SelfId},
                     #quest_marriage_question{mid = Mid},
                     Answer = #quest_marriage_answer{result = Result}) ->
    role:send_buff_begin(),
    Gains = calc_question_reward(Answer),
    case role_gain:do(Gains, Role) of
        {ok, GainRole} ->
            case case catch gen_server:call(quest_marriage,
                                            {gain_question_reward, Mid, SelfId},
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
                    role:send_buff_flush(),
                    GainTag = case Result of
                                  1 -> lang:get("心有灵犀，获得");
                                  _ -> lang:get("双方答案不一致，获得")
                              end,
                    Msg = format:gain_text(Gains,
                                           #gain_text_opts{gain_tag = GainTag},
                                           GainRole),
                    notice:send(GainRole, 3, Msg),
                    {ok, GainRole};
                _False ->
                    role:send_buff_clean(),
                    false
            end;
        {false, #gain{msg = Msg}} ->
            role:send_buff_clean(),
            {false, Msg};
        _ ->
            role:send_buff_clean(),
            false
    end.

calc_question_reward(#quest_marriage_answer{sid = Sid,
                                            result = Result}) ->
    case quest_marriage_data:question_reward(Sid) of
        {_, Agreed, DisAgreed} ->
            case Result of
                1 -> Agreed;
                _ -> DisAgreed
            end;
        _ -> []
    end.

calc_question_reward([], Acc) -> Acc;
calc_question_reward([Answer | Rest], Acc) ->
    Gains = calc_question_reward(Answer),
    calc_question_reward(Rest, Gains ++ Acc).

server_gain_question_reward(Mid, SelfId, _State) ->
    case lookup(quest_marriage_question, Mid) of
        [MQuestion = #quest_marriage_question{answer_list =
                                                  AnswerList}] ->
            case get_pre_answer(MQuestion) of
                {ok,
                 Answer = #quest_marriage_answer{sid = PreSid,
                                                 draw_list = DrawList}} ->
                    case lists:keyfind(PreSid,
                                       #quest_marriage_answer.sid,
                                       AnswerList)
                        of
                        Answer = #quest_marriage_answer{draw_list = DrawList} ->
                            NewDrawList = case lists:member(SelfId, DrawList) of
                                              true -> [SelfId];
                                              false -> [SelfId | DrawList]
                                          end,
                            NewAnswer = Answer#quest_marriage_answer{draw_list =
                                                                         NewDrawList},
                            NewAnswerList = lists:keystore(PreSid,
                                                           #quest_marriage_answer.sid,
                                                           AnswerList,
                                                           NewAnswer),
                            NewMQuestion =
                                MQuestion#quest_marriage_question{answer_list =
                                                                      NewAnswerList},
                            save(quest_marriage_question, NewMQuestion),
                            ok;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

server_get_question_info(Mid, _State) ->
    case lookup(quest_marriage_question, Mid) of
        [MQuestion = #quest_marriage_question{start_time =
                                                  0}] ->
            Now = date:unixtime(),
            NewMQuestion =
                MQuestion#quest_marriage_question{start_time = Now},
            save(quest_marriage_question, NewMQuestion),
            {ok, NewMQuestion};
        _ -> false
    end.

get_pre_answer(#quest_marriage_question{sid = Sid,
                                        answer_list = AnswerList}) ->
    case Sid > 1 of
        true ->
            PreSid = Sid - 1,
            case lists:keyfind(PreSid,
                               #quest_marriage_answer.sid,
                               AnswerList)
                of
                Answer = #quest_marriage_answer{} -> {ok, Answer};
                _ -> false
            end;
        _ -> false
    end.

finish_question_quest(#evt_finish_marriage_question{},
                      Role) ->
    case team:is_leader(Role) of
        true ->
            NewRole =
                role_trigger:fire(#evt_commit_marriage_question{},
                                  Role),
            {ok, NewRole};
        false -> {ok, Role}
    end.

commit_question_quest(#evt_commit_marriage_question{},
                      Role = #role{m_quest =
                                       #m_quest{quest_marriage =
                                                    #quest_marriage{quest_id =
                                                                        QuestId}}}) ->
    Steps = [reward,
             finish,
             del_quest,
             flush,
             fire,
             special_fire],
    case quest:callback_commit(Role, QuestId, Steps) of
        {ok, CommitRole} -> CommitRole;
        _ -> Role
    end.

dynamic_progress([], _QuestData, Args, _Role, Acc) ->
    {Args, lists:reverse(Acc)};
dynamic_progress([Prog | Rest], QuestData, Args, Role,
                 Acc) ->
    case do_dynamic_progress(Args, Prog, QuestData, Role) of
        {ok, NewProg} ->
            dynamic_progress(Rest,
                             QuestData,
                             Args,
                             Role,
                             [NewProg | Acc]);
        {ok, NewArgs, NewProg} ->
            dynamic_progress(Rest,
                             QuestData,
                             NewArgs,
                             Role,
                             [NewProg | Acc]);
        _ ->
            dynamic_progress(Rest,
                             QuestData,
                             Args,
                             Role,
                             [Prog | Acc])
    end.

do_dynamic_progress(Args = #quest_marriage_args{type =
                                                    2,
                                                sec_type = SecType,
                                                dyn_ext_data = ArgsDynData},
                    P = #quest_progress{dyn_ext_data = DynExtData,
                                        target = Target},
                    QuestData = #quest_data{id = QuestId}, Role) ->
    {NewProg, NewArgs} = case lists:keyfind(rand_pos,
                                            1,
                                            ArgsDynData)
                             of
                             {_, X, Y} ->
                                 {NewDynExtData, RtnArgs} = case SecType of
                                                                1 ->
                                                                    case
                                                                        lists:keyfind(quest_marriage_robot,
                                                                                      1,
                                                                                      ArgsDynData)
                                                                        of
                                                                        {Tag,
                                                                         RobotId,
                                                                         RobotInfo} ->
                                                                            RtnDynExtData =
                                                                                [{rand_pos,
                                                                                  X,
                                                                                  Y},
                                                                                 {Tag,
                                                                                  RobotId,
                                                                                  RobotInfo}
                                                                                 | DynExtData],
                                                                            RobotArgs =
                                                                                Args#quest_marriage_args{robot_id
                                                                                                             =
                                                                                                             RobotId,
                                                                                                         dyn_ext_data
                                                                                                             =
                                                                                                             RtnDynExtData},
                                                                            {RtnDynExtData,
                                                                             RobotArgs};
                                                                        False ->
                                                                            logger:error("[~ts]随机单位[quest_id:~w][pos:~w][false:~w]",
                                                                                         [Role#role.name,
                                                                                          QuestData#quest_data.id,
                                                                                          {X,
                                                                                           Y},
                                                                                          False],
                                                                                         quest_marriage,
                                                                                         1811),
                                                                            {DynExtData,
                                                                             Args}
                                                                    end;
                                                                _ ->
                                                                    RtnDynExtData =
                                                                        [{rand_pos,
                                                                          X,
                                                                          Y}
                                                                         | DynExtData],
                                                                    TmpArgs =
                                                                        Args#quest_marriage_args{dyn_ext_data
                                                                                                     =
                                                                                                     RtnDynExtData},
                                                                    {RtnDynExtData,
                                                                     TmpArgs}
                                                            end,
                                 PosProg = P#quest_progress{dyn_ext_data =
                                                                NewDynExtData},
                                 {PosProg, RtnArgs};
                             _False ->
                                 case plot_quest:init_unit_rand_pos(P,
                                                                    QuestData)
                                     of
                                     {ok,
                                      PosProg = #quest_progress{dyn_ext_data =
                                                                    NDynExtData},
                                      _Pos} ->
                                         {NewDynExtData, RtnArgs} = case SecType
                                                                        of
                                                                        1 ->
                                                                            {ok,
                                                                             RobotId,
                                                                             RobotInfo} =
                                                                                get_robot(Target,
                                                                                          QuestId,
                                                                                          Role),
                                                                            RtnDynExtData =
                                                                                [{quest_marriage_robot,
                                                                                  RobotId,
                                                                                  RobotInfo}
                                                                                 | NDynExtData],
                                                                            RobotArgs =
                                                                                Args#quest_marriage_args{robot_id
                                                                                                             =
                                                                                                             RobotId,
                                                                                                         dyn_ext_data
                                                                                                             =
                                                                                                             RtnDynExtData},
                                                                            {RtnDynExtData,
                                                                             RobotArgs};
                                                                        _ ->
                                                                            TmpArgs =
                                                                                Args#quest_marriage_args{dyn_ext_data
                                                                                                             =
                                                                                                             NDynExtData},
                                                                            {NDynExtData,
                                                                             TmpArgs}
                                                                    end,
                                         NewPosProg =
                                             PosProg#quest_progress{dyn_ext_data
                                                                        =
                                                                        NewDynExtData},
                                         {NewPosProg, RtnArgs};
                                     False ->
                                         logger:error("[~ts]随机单位[quest_id:~w][pos:~w][false:~w]",
                                                      [Role#role.name,
                                                       QuestData#quest_data.id,
                                                       DynExtData,
                                                       False],
                                                      quest_marriage,
                                                      1847),
                                         {P, Args}
                                 end
                         end,
    {ok, NewArgs, NewProg};
do_dynamic_progress(_Unknow, P, _QuestData, _Role) ->
    {false, P}.

get_robot(UnitBaseId, QuestId,
          #role{id = RoleId = {Id, _, _}, lev = SelfLev,
                name = Name, s_looks = Looks, sex = SelfSex,
                classes = SelfClasses}) ->
    {RobotId, Robot} = case unit_data:get(UnitBaseId) of
                           #unit_data{name = UnitName} ->
                               RangeList = [{15, 5}, {25, 16}],
                               case robot_list(RangeList,
                                               QuestId,
                                               {SelfLev, RoleId})
                                   of
                                   {true,
                                    #robot_role{id = RtnRobotId,
                                                looks = RobotLooks, sex = Sex,
                                                classes = Classes}} ->
                                       {RtnRobotId,
                                        [{name, UnitName},
                                         {looks, RobotLooks},
                                         {sex, Sex},
                                         {classes, Classes}]};
                                   _ ->
                                       {{Id, "robot", 0},
                                        [{name, UnitName},
                                         {looks, Looks},
                                         {sex, SelfSex},
                                         {classes, SelfClasses}]}
                               end;
                           _False ->
                               logger:error("未知的单位Id:~w",
                                            [UnitBaseId],
                                            quest_marriage,
                                            1872),
                               {{Id, "robot", 0},
                                [{name, Name},
                                 {looks, Looks},
                                 {sex, SelfSex},
                                 {classes, SelfClasses}]}
                       end,
    {ok, RobotId, Robot}.

robot_list([], _QuestId, _) -> false;
robot_list([{Min, Max} | Rest], QuestId,
           {Lev, RoleId}) ->
    NewMin = max(12, Lev - Min),
    NewMax = max(22, Lev - Max),
    LevList = lists:seq(min(NewMin, NewMax),
                        max(NewMin, NewMax)),
    RoleList = robot_mgr:get_role_index_list(LevList),
    RoleList1 = [Robot
                 || Robot = #robot_role_index{id = RobotId} <- RoleList,
                    RobotId =/= RoleId],
    case RoleList1 of
        [_ | _] ->
            case util:rand_list(RoleList) of
                #robot_role_index{id = RtnRobotId} ->
                    case robot_mgr:get_role(RtnRobotId) of
                        {ok, Robot = #robot_role{}} -> {true, Robot};
                        _ -> robot_list(Rest, QuestId, {Lev, RoleId})
                    end;
                _ -> robot_list(Rest, QuestId, {Lev, RoleId})
            end;
        _ -> robot_list(Rest, QuestId, {Lev, RoleId})
    end.

get_challange_looks(DynExtData) ->
    case lists:keyfind(quest_marriage_robot, 1, DynExtData)
        of
        {quest_marriage_robot, _, RobotInfo} ->
            case lists:keyfind(looks, 1, RobotInfo) of
                {looks, Looks} -> Looks;
                _False -> []
            end;
        _False -> []
    end.

get_special_sex(DynExtData, DefSex) ->
    case lists:keyfind(quest_marriage_robot, 1, DynExtData)
        of
        {quest_marriage_robot, _, RobotInfo} ->
            case lists:keyfind(sex, 1, RobotInfo) of
                {_, Sex} -> Sex;
                _False -> DefSex
            end;
        _False -> DefSex
    end.

get_special_classes(DynExtData, DefClasses) ->
    case lists:keyfind(quest_marriage_robot, 1, DynExtData)
        of
        {quest_marriage_robot, _, RobotInfo} ->
            case lists:keyfind(classes, 1, RobotInfo) of
                {_, Classes} -> Classes;
                _False -> DefClasses
            end;
        _False -> DefClasses
    end.

is_challange_finished(QuestId, ProgressId, RobotId,
                      #role{m_quest = #m_quest{quest = Quest},
                            name = _Name}) ->
    case lists:keyfind(QuestId, #quest.id, Quest) of
        #quest{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                #quest_progress{dyn_ext_data = DynExtData} ->
                    case lists:keyfind(quest_marriage_robot, 1, DynExtData)
                        of
                        {quest_marriage_robot, RobotId, _} -> true;
                        Tuple when is_tuple(Tuple) -> true;
                        _False -> false
                    end;
                _False -> false
            end;
        _False -> false
    end.

calc_pray_buff(Role, Rewards, Round)
    when Round =:= 10 ->
    case buff:get_info_by_special_effect(Role, 24) of
        {true, BuffId, BuffName} ->
            Msg = notice:format(lang:get("在~ts作用下,额外获得~ts"),
                                [{string_2, 5, util:flist("[~ts]", [BuffName])},
                                 {item_2, 29143}]),
            notice:send(Role, 3, Msg),
            BuffDelRole = case buff:del(Role, [BuffId]) of
                              {ok, Role2} -> Role2;
                              _ -> Role
                          end,
            {BuffDelRole,
             [#gain{label = item_base_id, val = [{29143, 0, 1}]}
              | Rewards]};
        _ -> {Role, Rewards}
    end;
calc_pray_buff(_Role, Rewards, _Round) ->
    {_Role, Rewards}.

get_mid(ExtData,
        #role{platform = Pltm, zone_id = ZoneId})
    when is_map(ExtData) ->
    case maps:get(mid, ExtData, 0) of
        Mid when is_integer(Mid) andalso Mid > 0 ->
            {ok, {Pltm, ZoneId, Mid}};
        Mid = {_Pltm, _ZoneId, _AskId} -> {ok, Mid};
        _ -> 0
    end;
get_mid(_Unknow, Role) ->
    logger:error("[~ts]未知的夫妻答题数据:~w",
                 [Role#role.name, _Unknow],
                 quest_marriage,
                 1983),
    0.

