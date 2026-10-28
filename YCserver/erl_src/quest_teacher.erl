-file("src/mod/quest/quest_teacher.erl", 1).

-module(quest_teacher).

-export([rpc_accept/1,
         accept/4,
         sync_quest_teacher/4,
         quest_ext_data/0,
         commit/2,
         sync_commit/4,
         sync_quest_talk/3,
         add_trigger/3,
         finish_question_quest/2,
         patrol/3,
         remove_trigger/4,
         get_reward/2,
         sync_question/5,
         push_question_info/2,
         answer/4,
         handle_answer/5,
         answer_timeout/1,
         answer_timeout/4,
         end_question/2,
         push_question_stats/2,
         apply_push_question_stats/2,
         question_result/2,
         check_commit/1,
         del_quest/1,
         kill/4,
         reset_five/2,
         revise/1,
         push_next_question/2,
         team_appoint/2,
         del_team_quest/4,
         team_leave_clean/2,
         team_kickout_clean/3,
         login/1,
         check_login/2,
         sync_check_same_teacher_quest/4,
         get_ask_id/2]).

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

-file("src/mod/quest/quest_teacher.erl", 52).

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

-file("src/mod/quest/quest_teacher.erl", 53).

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

-file("src/mod/quest/quest_teacher.erl", 54).

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

-file("src/mod/quest/quest_teacher.erl", 55).

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

-file("src/mod/quest/quest_teacher.erl", 56).

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

-file("src/mod/quest/quest_teacher.erl", 57).

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

-file("src/mod/quest/quest_teacher.erl", 58).

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

-file("src/mod/quest/quest_teacher.erl", 59).

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

-file("src/mod/quest/quest_teacher.erl", 60).

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

-file("src/mod/quest/quest_teacher.erl", 61).

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

-file("src/mod/quest/quest_teacher.erl", 62).

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

-file("src/mod/quest/quest_teacher.erl", 63).

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

-file("src/mod/quest/quest_teacher.erl", 64).

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

-file("src/mod/quest/quest_teacher.erl", 65).

-file("inc/ask.hrl", 1).

-record(ask_state,
        {next_ask_id = 1,
         free_ask_ids = [],
         five_reset_timer,
         platform = "",
         zone_id = 0}).

-record(ask_state_store,
        {ver = 1,
         label = store,
         next_ask_id = 1,
         free_ask_ids = []}).

-record(ask_question,
        {ver = 2,
         id = 0,
         sid = 0,
         qid = 0,
         fun_type = 0,
         start_time = 0,
         q_start_time = 0,
         opts = [],
         answer_list = [],
         agreed = [],
         all_correct = [],
         questions = [],
         answerers = [],
         ext_data = #{}}).

-record(ask_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(ask_answerer,
        {rid, pid, label = 0, info = #{}, opts = []}).

-file("src/mod/quest/quest_teacher.erl", 66).

-file("inc/quest_teacher.hrl", 1).

-record(quest_teacher_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         partner_id,
         partner_pid,
         partner_name = "",
         ask_id = 0,
         ask_start_time = 0,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_teacher_stats,
        {teacher_id,
         student_id,
         quest_id = 0,
         type = 0,
         round = 0,
         ext = []}).

-record(quest_teacher_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_teacher_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         rand_items = [],
         item_pcnt = 0,
         teacher_score = 0}).

-record(quest_teacher_patrol_data,
        {id,
         map_base_id,
         unit_list = [],
         weight = 0,
         pcnt = 0,
         min_move_step = 0,
         max_move_step = 0}).

-file("src/mod/quest/quest_teacher.erl", 67).

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

-file("src/mod/quest/quest_teacher.erl", 68).

quest_ext_data() ->
    #{ask_id => {<<"">>, 0, 0}, ask_start_time => 0,
      appoint_trigger => undefined}.

login(Role = #role{pid = Pid,
                   m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(18, #quest.sec_type, Quests) of
        Quest = #quest{id = QuestId} ->
            NewRole = quest:del_quest(Quest, Role),
            role:apply(async,
                       Pid,
                       {quest_teacher, check_login, [QuestId]}),
            {ok, NewRole};
        _False -> ok
    end.

check_login(Role = #role{m_quest =
                             #m_quest{quest_teacher =
                                          #quest_teacher{partner_id =
                                                             PartnerId}}},
            QuestId) ->
    case team:get_leader(Role) of
        {true, Mate = #team_mate{id = PartnerId}} ->
            case check_same_teacher_quest(Mate, QuestId, Role) of
                {true, Args} ->
                    Steps = [condition, loss, accept, fire],
                    case quest:accept_handle_by_id(Steps,
                                                   Role,
                                                   QuestId,
                                                   Args)
                        of
                        {ok,
                         AcceptRole = #role{m_quest =
                                                #m_quest{quest_teacher =
                                                             QTeacher}}} ->
                            AddRole = add_teammate_appoint_trigger(AcceptRole),
                            VarRole = update_day_ring(AddRole),
                            NewRole = update_stats(VarRole),
                            quest_talk(QTeacher, QuestId, NewRole),
                            {ok, NewRole};
                        _False -> ok
                    end;
                false -> ok
            end;
        _False -> ok
    end.

check_same_teacher_quest(#team_mate{pid = MatePid},
                         QuestId,
                         #role{id = SelfId,
                               m_teacher = #m_teacher{id = TeacherId}}) ->
    MFA = {quest_teacher,
           sync_check_same_teacher_quest,
           [SelfId, TeacherId, QuestId]},
    case role:apply(sync, MatePid, MFA) of
        {true, Args} -> {true, Args};
        _ -> false
    end.

sync_check_same_teacher_quest(Role = #role{id = SelfId,
                                           name = _Name, pid = MatePid,
                                           m_quest =
                                               #m_quest{quest_teacher =
                                                            #quest_teacher{partner_id
                                                                               =
                                                                               PartnerId,
                                                                           stats
                                                                               =
                                                                               Stats,
                                                                           ext_data
                                                                               =
                                                                               Ext},
                                                        quest = Quests},
                                           m_teacher =
                                               #m_teacher{id = TeacherId}},
                              PartnerId, PTeacherId, QuestId) ->
    case lists:keyfind(18, #quest.sec_type, Quests) of
        #quest{id = QuestId} ->
            case {TeacherId =:= PartnerId, SelfId =:= PTeacherId} of
                {true, _} ->
                    Pos = #quest_teacher_stats.teacher_id,
                    case lists:keyfind(PartnerId, Pos, Stats) of
                        #quest_teacher_stats{quest_id = QuestId, round = Round,
                                             type = Type} ->
                            AskId = get_ask_id(Ext, Role),
                            AskStartTime = maps:get(ask_start_time, Ext, 0),
                            Args = #quest_teacher_args{quest_id = QuestId,
                                                       round = Round,
                                                       partner_pid = MatePid,
                                                       type = Type,
                                                       partner_id = SelfId,
                                                       ask_id = AskId,
                                                       ask_start_time =
                                                           AskStartTime},
                            {ok, {true, Args}};
                        _ -> {ok, false}
                    end;
                {_, true} ->
                    Pos = #quest_teacher_stats.student_id,
                    case lists:keyfind(PartnerId, Pos, Stats) of
                        #quest_teacher_stats{quest_id = QuestId, round = Round,
                                             type = Type} ->
                            AskId = get_ask_id(Ext, Role),
                            AskStartTime = maps:get(ask_start_time, Ext, 0),
                            Args = #quest_teacher_args{quest_id = QuestId,
                                                       round = Round,
                                                       partner_pid = MatePid,
                                                       type = Type,
                                                       partner_id = SelfId,
                                                       ask_id = AskId,
                                                       ask_start_time =
                                                           AskStartTime},
                            {ok, {true, Args}};
                        _ -> {ok, false}
                    end;
                _ -> {ok, false}
            end;
        _ -> {ok, false}
    end;
sync_check_same_teacher_quest(_Role, _PartnerId,
                              _PTeacherId, _QuestId) ->
    {ok, false}.

reset_five(NRole = #role{m_quest =
                             #m_quest{quest = Quests}},
           _OldRole) ->
    DelRole = case lists:keyfind(18,
                                 #quest.sec_type,
                                 Quests)
                  of
                  Quest = #quest{} -> quest:del_quest(Quest, NRole);
                  false -> NRole
              end,
    #role{m_quest =
              MQuest = #m_quest{quest_teacher = QTeacher}} =
        DelRole,
    NewQTeacher = QTeacher#quest_teacher{round = 0,
                                         quest_id = 0, type = 0, sec_type = 0,
                                         partner_id = undefined, stats = [],
                                         ext_data =
                                             #{ask_id => {<<"">>, 0, 0},
                                               ask_start_time => 0,
                                               appoint_trigger => undefined}},
    NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
    NewRole = NRole#role{m_quest = NewMQuest},
    {ok, NewRole}.

del_quest(Role = #role{m_quest =
                           MQuest = #m_quest{quest_teacher =
                                                 QTeacher = #quest_teacher{type
                                                                               =
                                                                               Type,
                                                                           ext_data
                                                                               =
                                                                               ExtData}}}) ->
    case Type of
        3 ->
            case ExtData of
                #{ask_id := AskId, ask_start_time := StartTime}
                    when AskId > 0 ->
                    ask_mgr:del_ask_question(AskId, StartTime);
                _ -> ok
            end;
        _ -> ok
    end,
    NewQTeacher = QTeacher#quest_teacher{ext_data =
                                             #{ask_id => {<<"">>, 0, 0},
                                               ask_start_time => 0,
                                               appoint_trigger => undefined}},
    NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
    Role#role{m_quest = NewMQuest};
del_quest(Role) -> Role.

revise(Role = #role{m_quest =
                        #m_quest{quest = Quest}}) ->
    case lists:keyfind(18, #quest.sec_type, Quest) of
        Quest = #quest{} -> revise(Role, Quest);
        _ -> Role
    end.

revise(Role = #role{m_quest =
                        #m_quest{quest_teacher =
                                     #quest_teacher{type = 3,
                                                    ext_data = ExtData}}},
       #quest{end_time = EndT}) ->
    case ExtData of
        #{ask_id := AskId} when AskId > 0 ->
            Now = date:unixtime(),
            case EndT < Now of
                true -> del_quest(Role);
                _ ->
                    case ask_mgr:lookup_ask_question(AskId) of
                        [AskQuestion = #ask_question{}] ->
                            revise_question(AskQuestion, Role);
                        _ ->
                            logger:error("[~ts]修正师徒答题任务时数据错误",
                                         [Role#role.name],
                                         quest_teacher,
                                         261),
                            Role
                    end
            end;
        _ ->
            logger:error("[~ts]修正师徒答题任务时数据错误",
                         [Role#role.name],
                         quest_teacher,
                         266),
            Role
    end;
revise(Role, _Quest) -> Role.

revise_question(AskQuestion,
                Role = #role{id = SelfId}) ->
    case ask:get_pre_answer(AskQuestion) of
        {ok,
         Answer = #ask_answer{draw_list = DrawList,
                              sid = _Sid}} ->
            case lists:member(SelfId, DrawList) of
                true -> Role;
                false ->
                    case gain_question_reward(Role, AskQuestion, Answer) of
                        {ok, NewRole} -> NewRole;
                        _ -> Role
                    end
            end;
        false -> Role
    end.

rpc_accept(#role{cross_type = 1}) ->
    {false, lang:get("跨服状态不能接受师徒任务")};
rpc_accept(Role) ->
    case check_rpc_accept(Role) of
        {ok, Mate} ->
            Rtn = case check_next_round(Role, Mate) of
                      {ok, NewRound} -> rand_quest(Role, NewRound, Mate);
                      {ok, DelType, NewRound} ->
                          rand_quest(Role, NewRound, DelType, Mate);
                      False -> False
                  end,
            case Rtn of
                {ok, QuestRole} ->
                    TriRole = add_appoint_trigger(QuestRole),
                    NewRole = update_day_ring(TriRole),
                    {ok, NewRole};
                _ -> Rtn
            end;
        {false, Msg} -> {false, Msg};
        {team_false, Msg} ->
            MFA = {notice, npc_talk, [20063, Msg]},
            team:async_teammate(Role, MFA),
            {false, Msg};
        _False ->
            logger:error("[~ts]接受师徒任务失败Err:~w",
                         [Role#role.name, _False],
                         quest_teacher,
                         314),
            {false, lang:get("无法接受师徒任务")}
    end.

kill(_DoType, _QuestData, PlotUnit,
     Role = #role{m_quest =
                      #m_quest{quest_teacher =
                                   #quest_teacher{type = 2,
                                                  partner_id = PartnerId}}}) ->
    case team:is_leader(Role) of
        true ->
            case team:get_fighters(Role) of
                {ok,
                 Fighters = [_, #team_mate{status = 2, id = MateId}]}
                    when MateId =:= PartnerId ->
                    case check_relationship(Role, MateId, kill) of
                        true ->
                            Enemy = convert_enemy_unit(PlotUnit, Role),
                            case Enemy of
                                {ok, EnemyFighter} ->
                                    combat_mgr:start_combat(33,
                                                            Fighters,
                                                            EnemyFighter),
                                    Role;
                                _ -> {false, lang:get("发起战斗失败")}
                            end;
                        Rtn -> Rtn
                    end;
                {false, Msg} -> {false, Msg};
                _False -> {false, lang:get("只有师徒好友二人组队才能进入战斗哦")}
            end;
        _False -> {false, lang:get("只有师徒二人组队才能进入战斗哦")}
    end;
kill(_DoType, _QuestData, _PlotUnit, Role) -> Role.

convert_enemy_unit(#plot_unit{base_id = UnitBaseId},
                   Role) ->
    case unit_convert:to(unit, UnitBaseId) of
        {ok, Unit} -> {ok, Unit};
        _False ->
            logger:error("[~ts]发起战斗失败，无法转换敌人[BaseId:~w]数据:~w",
                         [Role#role.name, UnitBaseId, _False],
                         quest_teacher,
                         361),
            false
    end.

rand_quest(Role, Round, Mate) ->
    RandQuests =
        quest_teacher_data:get_quest_rand_list(Round),
    case util:rand_list(RandQuests,
                        #quest_teacher_rand_data.weight)
        of
        Data = #quest_teacher_rand_data{} ->
            accept_next(Data, Round, Mate, Role);
        _False ->
            logger:error("[~ts]接受师徒任务失败Round:~w, Err:~w",
                         [Role#role.name, Round, _False],
                         quest_teacher,
                         372),
            {false, lang:get("没有师徒任务可以领取")}
    end.

rand_quest(Role, Round, DelType, Mate) ->
    RandQuests =
        quest_teacher_data:get_quest_rand_list(Round),
    NewRandQuests = [Data
                     || Data = #quest_teacher_rand_data{type = Type}
                            <- RandQuests,
                        Type =/= DelType],
    case util:rand_list(NewRandQuests,
                        #quest_teacher_rand_data.weight)
        of
        Data = #quest_teacher_rand_data{} ->
            accept_next(Data, Round, Mate, Role);
        _False ->
            logger:error("[~ts]接受师徒任务失败Round:~w, Err:~w",
                         [Role#role.name, Round, _False],
                         quest_teacher,
                         382),
            {false, lang:get("没有师徒任务可以领取")}
    end.

accept_next(Role = #role{m_quest =
                             MQuest = #m_quest{quest_teacher =
                                                   QTeacher =
                                                       #quest_teacher{round =
                                                                          Round,
                                                                      ext_data =
                                                                          Ext}}},
            Mate = #team_mate{pid = MatePid}) ->
    NewRound = Round + 1,
    case Round < 5 of
        true -> rand_quest(Role, NewRound, Mate);
        false ->
            Fmt = lang:get("恭喜完成了今日的~ts环师徒任务，记得明日再来哦"),
            Msg = notice:format(Fmt, [{string_1, 5}]),
            notice:send(Role, 3, Msg),
            MFA = {notice, send, [3, Msg]},
            role:apply(async, MatePid, MFA),
            Tri = maps:get(appoint_trigger, Ext, undefined),
            NewExt = Ext#{appoint_trigger => undefined},
            NewQTeacher = QTeacher#quest_teacher{round = NewRound,
                                                 ext_data = NewExt},
            NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
            NRole = Role#role{m_quest = NewMQuest},
            UpdateRole = update_stats(NRole),
            NewRole = case Tri of
                          undefined -> UpdateRole;
                          _ -> role_trigger:del(Tri, UpdateRole)
                      end,
            {ok, NewRole}
    end.

accept_next(#quest_teacher_rand_data{quest_id = QuestId,
                                     type = Type, sec_type = SecType},
            Round, Mate = #team_mate{pid = MatePid, id = MateId},
            Role = #role{m_quest =
                             MQuest = #m_quest{quest_teacher = QTeacher}})
    when is_pid(MatePid) ->
    Steps = [condition, loss, accept, fire],
    Args = #quest_teacher_args{quest_id = QuestId,
                               round = Round, partner_pid = MatePid,
                               type = Type, sec_type = SecType,
                               partner_id = MateId},
    QuestRole = Role#role{m_quest =
                              MQuest#m_quest{quest_teacher =
                                                 QTeacher#quest_teacher{type =
                                                                            Type,
                                                                        sec_type
                                                                            =
                                                                            SecType}}},
    Rtn = case quest:accept_handle_by_id(Steps,
                                         QuestRole,
                                         QuestId,
                                         Args)
              of
              {ok, AcceptRole} ->
                  UpdateRole = update_stats(AcceptRole),
                  quest_talk(QTeacher, QuestId, UpdateRole),
                  doing_quest(Args, Mate, UpdateRole);
              {false, Msg} -> {false, Msg};
              _ -> {false, lang:get("领取师徒任务失败")}
          end,
    case Rtn of
        {ok, NewRole} -> {ok, NewRole};
        _ -> Rtn
    end;
accept_next(_RandTeacherData, _Round, _Mate,
            #role{m_teacher = #m_teacher{status = Status}}) ->
    Msg = case Status of
              3 -> lang:get("领取失败，您的徒弟已经离线了");
              1 -> lang:get("领取失败，您的徒弟已经离线了");
              _ -> lang:get("领取失败，队友已经离线了")
          end,
    {false, Msg}.

quest_talk(#quest_teacher{type = 1}, _NextQuestId,
           _Role) ->
    ok;
quest_talk(#quest_teacher{type = 3}, _NextQuestId,
           _Role) ->
    ok;
quest_talk(#quest_teacher{type = _Type}, NextQuestId,
           Role) ->
    role:link_send(Role, 10223, {1, NextQuestId, 1}),
    ok.

doing_quest(#quest_teacher_args{type = 3},
            #team_mate{pid = MatePid, id = MateId},
            Role = #role{id = SelfId,
                         m_team = #m_team{pid = TeamPid},
                         m_teacher = #m_teacher{status = Status},
                         m_quest =
                             MQuest = #m_quest{quest_teacher =
                                                   QTeacher =
                                                       #quest_teacher{ext_data =
                                                                          ExtData}}}) ->
    Answerers = case Status of
                    1 ->
                        [#ask_answerer{rid = MateId, label = 1},
                         #ask_answerer{rid = SelfId, label = 2}];
                    _ ->
                        [#ask_answerer{rid = MateId, label = 2},
                         #ask_answerer{rid = SelfId, label = 1}]
                end,
    AskId = get_ask_id(ExtData, Role),
    case ask_mgr:question_init(AskId, 1, Answerers) of
        {ok,
         AskQuestion = #ask_question{start_time = StartTime}} ->
            IsStart = 1,
            Args = [SelfId, TeamPid, AskQuestion, IsStart],
            case role:apply(sync,
                            MatePid,
                            {quest_teacher, sync_question, Args})
                of
                ok -> ok;
                {false, Msg} ->
                    notice:send(Role, 1, Msg),
                    false;
                _ ->
                    Msg = lang:get("需要师徒二人组队才能开始进行答题"),
                    notice:send(Role, 1, Msg),
                    false
            end,
            NewExtData = ExtData#{ask_start_time => StartTime},
            NewQTeacher = QTeacher#quest_teacher{ext_data =
                                                     NewExtData},
            NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
            NewRole = Role#role{m_quest = NewMQuest},
            {ok, NewRole};
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("初始化师徒答题失败")}
    end;
doing_quest(_Args, _Lover, Role) -> {ok, Role}.

sync_question(Role = #role{m_team =
                               #m_team{pid = TeamPid},
                           m_quest =
                               MQuest = #m_quest{quest_teacher =
                                                     QTeacher =
                                                         #quest_teacher{ext_data
                                                                            =
                                                                            ExtData,
                                                                        partner_id
                                                                            =
                                                                            PartnerId}}},
              PartnerId, TeamPid,
              #ask_question{start_time = StartTime}, IsStart)
    when is_pid(TeamPid) ->
    NewRole = case IsStart of
                  1 ->
                      NewExtData = ExtData#{ask_start_time => StartTime},
                      NewQTeacher = QTeacher#quest_teacher{ext_data =
                                                               NewExtData},
                      NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
                      Role#role{m_quest = NewMQuest};
                  _ -> Role
              end,
    {ok, ok, NewRole};
sync_question(_Role, _PartnerId, _TeamPid, _MQuestion,
              _IsStart) ->
    {ok, {false, lang:get("需要师徒二人一起组队才能答题")}}.

accept(QuestData,
       Role = #role{id = SelfId,
                    m_team = #m_team{pid = TeamPid}},
       AccQuestId,
       Args = #quest_teacher_args{partner_pid = PartnerPid,
                                  type = TeacherType}) ->
    {NewQuest, AcceptRole, AcceptArgs} =
        do_accept(QuestData, Role, AccQuestId, Args),
    #role{m_quest =
              MQuest = #m_quest{quest_teacher =
                                    QTeacher = #quest_teacher{ext_data =
                                                                  ExtData}}} =
        AcceptRole,
    case team:is_leader(AcceptRole) of
        true ->
            case TeacherType of
                3 ->
                    case ask_mgr:fetch_ask_id() of
                        {ok, AskId} ->
                            NewArgs = AcceptArgs#quest_teacher_args{ask_id =
                                                                        AskId},
                            case role:apply(sync,
                                            PartnerPid,
                                            {quest_teacher,
                                             sync_quest_teacher,
                                             [SelfId, TeamPid, NewArgs]})
                                of
                                ok ->
                                    NewExtData = ExtData#{ask_id => AskId},
                                    NewQTeacher =
                                        QTeacher#quest_teacher{ext_data =
                                                                   NewExtData},
                                    NewMQuest = MQuest#m_quest{quest_teacher =
                                                                   NewQTeacher},
                                    NewRole = AcceptRole#role{m_quest =
                                                                  NewMQuest},
                                    {NewQuest, NewRole};
                                {false, Msg} -> {false, Msg};
                                _False ->
                                    logger:error("[~ts]领取师徒任务失败:~w",
                                                 [Role#role.name, _False],
                                                 quest_teacher,
                                                 569),
                                    {false, lang:get("无法领取师徒任务")}
                            end;
                        _ -> {false, lang:get("无法领取师徒答题任务")}
                    end;
                _ ->
                    case role:apply(sync,
                                    PartnerPid,
                                    {quest_teacher,
                                     sync_quest_teacher,
                                     [SelfId, TeamPid, AcceptArgs]})
                        of
                        ok -> {NewQuest, AcceptRole};
                        {false, Msg} -> {false, Msg};
                        _False ->
                            logger:error("[~ts]领取师徒任务失败:~w",
                                         [Role#role.name, _False],
                                         quest_teacher,
                                         581),
                            {false, lang:get("无法领取师徒任务")}
                    end
            end;
        _ -> {NewQuest, AcceptRole}
    end;
accept(_QuestData, Role, AccQuestId, Args) ->
    logger:error("[~ts]领取师徒任务[quest_id:~w]失败Args:~w",
                 [Role#role.name, AccQuestId, Args],
                 quest_teacher,
                 589),
    {false, lang:get("领取师徒任务失败")}.

do_accept(Data = #quest_data{id = QuestId, type = Type,
                             sec_type = SecType, progress = Progress},
          Role = #role{m_quest =
                           MQuest = #m_quest{quest = Quests,
                                             acceptable = Acceptable,
                                             quest_teacher =
                                                 QuestTeacher =
                                                     #quest_teacher{partner_id =
                                                                        PartnerId}}},
          AccQuestId,
          Args = #quest_teacher_args{round = Round,
                                     type = TeacherType,
                                     sec_type = TeacherSecType,
                                     partner_id = ArgsPartnerId}) ->
    Now = date:unixtime(),
    {NewArgs, Progress0} = dynamic_progress(Progress,
                                            Data,
                                            Args,
                                            Role,
                                            []),
    Progress1 = quest_prog_init:do(Role,
                                   Progress0,
                                   QuestId),
    {NewProgress, LoadRole} = quest:load_progress(Progress1,
                                                  quest_teacher,
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
    NewPartnerId = case PartnerId of
                       undefined -> ArgsPartnerId;
                       _ -> ArgsPartnerId
                   end,
    logger:debug("**************[~ts]接受任务~w, ~w",
                 [Role#role.name, PartnerId, ArgsPartnerId],
                 quest_teacher,
                 627),
    NewQuestTeacher = QuestTeacher#quest_teacher{quest_id =
                                                     QuestId,
                                                 round = Round,
                                                 type = TeacherType,
                                                 sec_type = TeacherSecType,
                                                 partner_id = NewPartnerId},
    NewMQuest = MQuest#m_quest{quest = NewQuests,
                               acceptable = NewAcceptable,
                               quest_teacher = NewQuestTeacher},
    NewRole = UnitRole#role{m_quest = NewMQuest},
    {NQuest, NewRole, NewArgs}.

sync_quest_teacher(Role = #role{name = Name,
                                m_team = #m_team{status = 2, pid = TeamPid},
                                m_quest =
                                    MQuest = #m_quest{quest_teacher =
                                                          QTeacher =
                                                              #quest_teacher{ext_data
                                                                                 =
                                                                                 ExtData}}},
                   MateId, TeamPid,
                   Args = #quest_teacher_args{quest_id = QuestId,
                                              type = Type, sec_type = SecType,
                                              ask_id = AskId})
    when is_pid(TeamPid) ->
    case check_relationship(Role, MateId, accept) of
        true ->
            Steps = [condition, loss, accept, fire],
            NewExtData = case Type of
                             3 -> ExtData#{ask_id => AskId};
                             _ -> ExtData
                         end,
            NewQTeacher = QTeacher#quest_teacher{type = Type,
                                                 sec_type = SecType,
                                                 ext_data = NewExtData},
            NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
            QuestRole = Role#role{m_quest = NewMQuest},
            NewArgs = Args#quest_teacher_args{partner_id = MateId},
            case quest:accept_handle_by_id(Steps,
                                           QuestRole,
                                           QuestId,
                                           NewArgs)
                of
                {ok, AcceptRole} ->
                    AddRole = add_teammate_appoint_trigger(AcceptRole),
                    VarRole = update_day_ring(AddRole),
                    NewRole = update_stats(VarRole),
                    quest_talk(QTeacher, QuestId, NewRole),
                    {ok, ok, NewRole};
                {false, Msg} -> {ok, {false, Msg}};
                _ ->
                    Fmt = lang:get("~ts未满足领取师徒任务的条件，领取师徒任务失败"),
                    Args = [{role_2, Name}],
                    Msg = notice:format(Fmt, Args),
                    {ok, {false, Msg}}
            end;
        {false, Msg} -> {ok, {false, Msg}};
        _ ->
            Fmt = lang:get("~ts未满足领取师徒的条件"),
            Args = [{role_2, Name}],
            Msg = notice:format(Fmt, Args),
            {ok, {false, Msg}}
    end;
sync_quest_teacher(#role{name = Name}, _LoverId,
                   _TeamPid, _QuestArgs) ->
    Fmt = lang:get("~ts当前无法领取师徒任务"),
    Args = [{role_2, Name}],
    Msg = notice:format(Fmt, Args),
    {ok, {false, Msg}}.

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

check_commit(Role) ->
    case team:is_leader(Role) of
        true -> true;
        false -> {error, lang:get("只有师徒二人组队的队长才可以提交任务哟")}
    end.

commit(Role = #role{m_team = #m_team{pid = TeamPid},
                    id = SelfId,
                    m_quest =
                        MQuest = #m_quest{quest_teacher =
                                              QTeacher =
                                                  #quest_teacher{total_count =
                                                                     Total}}},
       QuestId) ->
    case check_teammate_commit_cond(Role) of
        {ok, Mate = #team_mate{pid = MatePid}} ->
            case role:apply(sync,
                            MatePid,
                            {quest_teacher,
                             sync_commit,
                             [TeamPid, QuestId, SelfId]})
                of
                ok ->
                    NewTotal = Total + 1,
                    NewQTeacher = QTeacher#quest_teacher{total_count =
                                                             NewTotal},
                    NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
                    NewRole = Role#role{m_quest = NewMQuest},
                    case accept_next(NewRole, Mate) of
                        {false, Msg} -> {error, Msg};
                        Rtn -> Rtn
                    end;
                {false, Msg} -> {error, Msg};
                _ -> {error, lang:get("提交师徒任务失败")}
            end;
        {false, Msg} -> {error, Msg};
        _ -> {error, lang:get("师徒二人一起组队才能提交任务哦")}
    end.

sync_commit(Role = #role{m_team =
                             #m_team{status = 2, pid = TeamPid},
                         m_teacher = #m_teacher{status = Status},
                         m_quest =
                             #m_quest{quest_teacher =
                                          #quest_teacher{round = Round}}},
            TeamPid, QuestId, MateId)
    when is_pid(TeamPid) ->
    case check_relationship(Role, MateId, commit) of
        true ->
            Steps = [reward, finish, del_quest, flush, fire],
            case quest:callback_commit(Role, QuestId, Steps) of
                {ok,
                 NRole = #role{m_quest =
                                   NMQuest = #m_quest{quest_teacher =
                                                          NQTeacher =
                                                              #quest_teacher{total_count
                                                                                 =
                                                                                 Total,
                                                                             ext_data
                                                                                 =
                                                                                 Ext}}}} ->
                    NewTotal = Total + 1,
                    NewRole = case Round >= 5 of
                                  false ->
                                      NewQTeacher =
                                          NQTeacher#quest_teacher{total_count =
                                                                      NewTotal},
                                      NewMQuest = NMQuest#m_quest{quest_teacher
                                                                      =
                                                                      NewQTeacher},
                                      NRole#role{m_quest = NewMQuest};
                                  true ->
                                      Tri = maps:get(appoint_trigger,
                                                     Ext,
                                                     undefined),
                                      NewExt = Ext#{appoint_trigger =>
                                                        undefined},
                                      NewQTeacher =
                                          NQTeacher#quest_teacher{total_count =
                                                                      NewTotal,
                                                                  round =
                                                                      Round + 1,
                                                                  ext_data =
                                                                      NewExt},
                                      NewMQuest = NMQuest#m_quest{quest_teacher
                                                                      =
                                                                      NewQTeacher},
                                      UpdateRole =
                                          update_stats(NRole#role{m_quest =
                                                                      NewMQuest}),
                                      case Tri of
                                          undefined -> UpdateRole;
                                          _ -> role_trigger:del(Tri, UpdateRole)
                                      end
                              end,
                    {ok, ok, NewRole};
                _False ->
                    Msg = case Status of
                              1 -> lang:get("您的徒弟提交任务失败了");
                              _ -> lang:get("您的师傅提交任务失败了")
                          end,
                    {ok, {false, Msg}}
            end;
        Rtn -> {ok, Rtn}
    end;
sync_commit(_Role, _TeamPid, _QuestId, _PartnerId) ->
    Msg = lang:get("只有师徒二人一起组队才能提交任务哟"),
    {ok, {false, Msg}}.

get_reward(#quest_data{rewards_commit = Rewards},
           Role = #role{m_quest =
                            #m_quest{quest_teacher =
                                         #quest_teacher{round = Round}},
                        m_teacher = #m_teacher{status = Status}}) ->
    {Tag, NRewards} = case
                          quest_teacher_data:get_reward(Round)
                          of
                          Data = #quest_teacher_reward_data{} ->
                              case get_lev_ratio_data(Role) of
                                  {ok, LevRatioData} ->
                                      CalcRewards = calc_reward(Rewards,
                                                                Data,
                                                                LevRatioData,
                                                                Role,
                                                                []),
                                      case Status of
                                          3 ->
                                              Limit = 1,
                                              ItemVar = var:get_var(Role,
                                                                    day_five,
                                                                    123,
                                                                    0),
                                              case ItemVar < Limit of
                                                  true ->
                                                      case
                                                          rand_reward_item(Data,
                                                                           Role)
                                                          of
                                                          {ok, ItemGain} ->
                                                              {teacher_item,
                                                               [ItemGain
                                                                | CalcRewards]};
                                                          _ ->
                                                              {normal,
                                                               CalcRewards}
                                                      end;
                                                  false -> {normal, CalcRewards}
                                              end;
                                          1 ->
                                              case rand_reward_item(Data, Role)
                                                  of
                                                  {ok, ItemGain} ->
                                                      {normal,
                                                       [ItemGain
                                                        | CalcRewards]};
                                                  _ -> {normal, CalcRewards}
                                              end;
                                          _ -> {normal, CalcRewards}
                                      end;
                                  _ -> {normal, []}
                              end;
                          _ -> {normal, []}
                      end,
    NewRole = case Tag of
                  teacher_item -> var:add_var(Role, day_five, 123, 1);
                  _ -> Role
              end,
    NewRewards = NRewards,
    logger:debug("[~ts]*************师徒任务奖励:~w",
                 [Role#role.name, NewRewards],
                 quest_teacher,
                 845),
    {ok, NewRole, NewRewards}.

rand_reward_item(#quest_teacher_reward_data{rand_items =
                                                RandItems,
                                            item_pcnt = Percent},
                 _Role) ->
    case util:rand(1, 100) < Percent of
        true ->
            case util:rand_list(RandItems, 3) of
                {BaseId, Num, _} ->
                    ItemGain = #gain{label = item_base_id,
                                     val = [{BaseId, 0, Num}]},
                    {ok, ItemGain};
                _ -> false
            end;
        _ -> false
    end.

add_trigger(Prog, Qid,
            Role = #role{m_quest =
                             #m_quest{quest_teacher =
                                          #quest_teacher{type = Type,
                                                         sec_type =
                                                             SecType}}}) ->
    case do_add_trigger(Type, SecType, Prog, Qid, Role) of
        {ok, NewRole} -> {ok, Prog, NewRole};
        {ok, NewProg, NewRole} -> {ok, NewProg, NewRole};
        false -> {ok, Prog, Role}
    end;
add_trigger(Prog, _Qid, Role) -> {ok, Prog, Role}.

do_add_trigger(3, _SecType, _P, _QuestId, Role) ->
    logger:debug("[~ts]载入答题事件",
                 [Role#role.name],
                 quest_teacher,
                 880),
    Tri = #trigger{label = evt_finish_ask_question,
                   m = quest_teacher, f = finish_question_quest, a = []},
    {_, TriRole} = role_trigger:add(Tri, Role),
    NewRole = add_appoint_trigger(TriRole),
    {ok, NewRole};
do_add_trigger(4, _SecType,
               P = #quest_progress{ext_data = ExtData}, QuestId,
               Role) ->
    logger:debug("[~ts]载入巡逻事件",
                 [Role#role.name],
                 quest_teacher,
                 886),
    Patrol = quest_teacher_data:get_patrol(QuestId),
    case util:rand_list(Patrol,
                        #quest_teacher_patrol_data.weight)
        of
        Data = #quest_teacher_patrol_data{map_base_id =
                                              MapBaseId} ->
            T1 = #trigger{label = evt_move_map, m = quest_teacher,
                          f = patrol, a = [Data]},
            {Key, Role1} = role_trigger:add(T1, Role),
            T2 = #trigger{label = evt_finish_quest,
                          m = quest_teacher, f = remove_trigger,
                          a = [QuestId, Key]},
            {_, TriRole} = role_trigger:add(T2, Role1),
            NewRole = add_appoint_trigger(TriRole),
            {ok,
             P#quest_progress{ext_data = [{1, MapBaseId} | ExtData]},
             NewRole};
        _ -> false
    end;
do_add_trigger(_Type, _SecType, P, _Id, Role) ->
    logger:debug("[~ts]载入事件[Type:~w][SecType:~w]",
                 [Role#role.name, _Type, _SecType],
                 quest_teacher,
                 900),
    NewRole = add_appoint_trigger(Role),
    {ok, P, NewRole}.

finish_question_quest(#evt_finish_ask_question{fun_type
                                                   = 1},
                      Role) ->
    case team:is_leader(Role) of
        true ->
            NewRole = role_trigger:fire(#evt_commit_ask_question{},
                                        Role),
            {ok, NewRole};
        false -> {ok, Role}
    end;
finish_question_quest(#evt_finish_ask_question{},
                      _Role) ->
    ok.

remove_trigger(#evt_finish_quest{id = Id}, Role, Id,
               Key) ->
    NewRole = role_trigger:del(Key, Role),
    erase(quest_teacher_patrol_move),
    {remove, NewRole};
remove_trigger(_Evt, _Role, _Id, _Key) -> ok.

push_question_info(AskQuestion = #ask_question{id =
                                                   AskId,
                                               q_start_time = QStartTime},
                   Role = #role{m_quest =
                                    #m_quest{quest_teacher =
                                                 #quest_teacher{type = 3}}}) ->
    case check_teammate_answer_cond(Role) of
        {ok, #team_mate{pid = MatePid}} ->
            case QStartTime > 0 of
                true ->
                    role:apply(async,
                               MatePid,
                               {quest_teacher,
                                push_next_question,
                                [AskQuestion]}),
                    push_next_question(Role, AskQuestion),
                    ok;
                false ->
                    case ask_mgr:get_question_info(AskId) of
                        {ok, NewAskQuestion} ->
                            role:apply(async,
                                       MatePid,
                                       {quest_teacher,
                                        push_next_question,
                                        [NewAskQuestion]}),
                            push_next_question(Role, NewAskQuestion),
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
push_question_info(_AskQuestion, _Role) -> false.

push_next_question(Role = #role{id = SelfId},
                   #ask_question{id = AskId, fun_type = FunType, sid = Sid,
                                 qid = Qid, q_start_time = QStartTime,
                                 opts = Opts}) ->
    {Status, Option} = case lists:keyfind(SelfId, 1, Opts)
                           of
                           {_, SelfOption} -> {1, SelfOption};
                           _ -> {0, 0}
                       end,
    NextQuestion = {AskId,
                    FunType,
                    Sid,
                    Qid,
                    QStartTime,
                    Status,
                    Option},
    ask:push_next_question(Role, NextQuestion),
    ok.

answer(AskQuestion, Sid, Option,
       Role = #role{m_quest =
                        #m_quest{quest_teacher = #quest_teacher{type = 3}}}) ->
    case check_teammate_answer_cond(Role) of
        {ok, _Lover} ->
            ask_mgr:commit_answer(AskQuestion, Sid, Option, Role);
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("对不起，只有师徒一起组队才能进行答题哟")}
    end;
answer(_AskQuestion, _Sid, _Option, _Role) ->
    {false, lang:get("无法提交答案")}.

handle_answer(AskQuestion = #ask_question{fun_type = 1,
                                          id = AskId, sid = Sid, qid = Qid,
                                          questions = Questions, opts = Opts,
                                          answer_list = AnswerList,
                                          q_start_time = QStartTime},
              Option, SelfId, _SelfPid, Now) ->
    TimerId = {answer_timeout, AskId, Sid},
    {IsFinished, RtnAskQuestion} = case Opts of
                                       [] ->
                                           TmpAskQuestion =
                                               AskQuestion#ask_question{opts =
                                                                            [{SelfId,
                                                                              Option}]},
                                           Timeout = erlang:max(20 + 5 -
                                                                    (Now -
                                                                         QStartTime),
                                                                1),
                                           Timer = #timer{id = TimerId,
                                                          timeout =
                                                              Timeout * 1000},
                                           server_timer:set(Timer),
                                           {false, TmpAskQuestion};
                                       _ ->
                                           PreOpts = [{SelfId, Option} | Opts],
                                           Result = check_answer_result(Qid,
                                                                        PreOpts),
                                           Answer = #ask_answer{sid = Sid,
                                                                qid = Qid,
                                                                opts = PreOpts,
                                                                result =
                                                                    Result},
                                           server_timer:del(TimerId),
                                           NewAnswerList = [Answer
                                                            | AnswerList],
                                           TmpAskQuestion =
                                               AskQuestion#ask_question{answer_list
                                                                            =
                                                                            NewAnswerList},
                                           {true, TmpAskQuestion}
                                   end,
    case Sid < 3 of
        true when IsFinished =:= true ->
            NextSid = Sid + 1,
            NewQid = lists:nth(NextSid, Questions),
            NewAskQuestion = RtnAskQuestion#ask_question{sid =
                                                             NextSid,
                                                         qid = NewQid,
                                                         q_start_time = 0,
                                                         opts = []},
            MFA = {quest_teacher,
                   question_result,
                   [NewAskQuestion]},
            {ok, MFA, NewAskQuestion};
        false when IsFinished =:= true ->
            NextSid = Sid + 1,
            NewAskQuestion = RtnAskQuestion#ask_question{sid =
                                                             NextSid,
                                                         qid = 0,
                                                         q_start_time = 0,
                                                         opts = []},
            MFA = {quest_teacher, end_question, [NewAskQuestion]},
            {ok, MFA, NewAskQuestion};
        _ ->
            NewAskQuestion = RtnAskQuestion,
            {ok, NewAskQuestion}
    end.

answer_timeout(AskQuestion = #ask_question{id = AskId,
                                           sid = Sid, questions = Questions,
                                           opts = Opts, qid = Qid,
                                           answerers = Answerers,
                                           answer_list = AnswerList}) ->
    PreOpts = handle_timeout_result(Opts, Answerers),
    TimerId = {answer_timeout, AskId, Sid},
    server_timer:del(TimerId),
    case Sid < 3 of
        true ->
            NextSid = Sid + 1,
            NewQid = lists:nth(NextSid, Questions),
            Answer = #ask_answer{sid = Sid, qid = Qid,
                                 opts = PreOpts, result = 3},
            NewAnswerList = [Answer | AnswerList],
            NewAskQuestion = AskQuestion#ask_question{sid = NextSid,
                                                      qid = NewQid, opts = [],
                                                      q_start_time = 0,
                                                      answer_list =
                                                          NewAnswerList},
            MFA = {quest_teacher,
                   question_result,
                   [NewAskQuestion]},
            {ok, MFA, NewAskQuestion};
        false ->
            Answer = #ask_answer{sid = Sid, qid = Qid, opts = [],
                                 result = 3},
            NewAnswerList = [Answer | AnswerList],
            NewAskQuestion = AskQuestion#ask_question{sid = Sid + 1,
                                                      qid = 0, opts = PreOpts,
                                                      answer_list =
                                                          NewAnswerList},
            MFA = {quest_teacher, end_question, [NewAskQuestion]},
            {ok, MFA, NewAskQuestion}
    end.

answer_timeout(AskQuestion = #ask_question{id = AskId,
                                           sid = Sid, questions = Questions,
                                           opts = Opts, qid = Qid,
                                           answer_list = AnswerList,
                                           answerers = Answerers},
               SelfId, _SelfPid, _Now) ->
    PreOpts = handle_timeout_result(Opts,
                                    SelfId,
                                    Answerers),
    TimerId = {answer_timeout, AskId, Sid},
    server_timer:del(TimerId),
    case Sid < 3 of
        true ->
            NextSid = Sid + 1,
            NewQid = lists:nth(NextSid, Questions),
            Answer = #ask_answer{sid = Sid, qid = Qid,
                                 opts = PreOpts, result = 3},
            NewAnswerList = [Answer | AnswerList],
            NewAskQuestion = AskQuestion#ask_question{sid = NextSid,
                                                      qid = NewQid, opts = [],
                                                      q_start_time = 0,
                                                      answer_list =
                                                          NewAnswerList},
            MFA = {quest_teacher,
                   question_result,
                   [NewAskQuestion]},
            {ok, MFA, NewAskQuestion};
        false ->
            Answer = #ask_answer{sid = Sid, qid = Qid, opts = [],
                                 result = 3},
            NewAnswerList = [Answer | AnswerList],
            NewAskQuestion = AskQuestion#ask_question{sid = Sid + 1,
                                                      qid = 0, opts = PreOpts,
                                                      answer_list =
                                                          NewAnswerList},
            MFA = {quest_teacher, end_question, [NewAskQuestion]},
            {ok, MFA, NewAskQuestion}
    end.

end_question(Role,
             AskQuestion = #ask_question{fun_type = FunType}) ->
    push_question_result(Role, AskQuestion),
    case gain_question_reward(Role, AskQuestion) of
        {ok, GainRole} ->
            push_question_stats(Role, AskQuestion),
            NewRole =
                role_trigger:fire(#evt_finish_ask_question{fun_type =
                                                               FunType},
                                  GainRole),
            {ok, NewRole};
        _ -> ok
    end.

question_result(Role, MQuestion) ->
    push_question_result(Role, MQuestion),
    Rtn = case gain_question_reward(Role, MQuestion) of
              {ok, GainRole} -> {ok, GainRole};
              _ -> ok
          end,
    Rtn.

push_question_stats(Role, AskQuestion) ->
    case check_teammate_answer_cond(Role) of
        {ok, #team_mate{pid = MatePid}} ->
            role:apply(async,
                       MatePid,
                       {quest_teacher,
                        apply_push_question_stats,
                        [AskQuestion]}),
            apply_push_question_stats(Role, AskQuestion),
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
    end.

apply_push_question_stats(Role,
                          AskQuestion = #ask_question{answer_list =
                                                          AnswerList}) ->
    Gains = calc_question_reward(AnswerList, Role, []),
    ValList = format:gain_to_val(Gains),
    ask:push_question_stats(Role,
                            AskQuestion,
                            AnswerList,
                            ValList),
    ok.

gain_question_reward(Role, AskQuestion) ->
    case ask:get_pre_answer(AskQuestion) of
        {ok, Answer} ->
            gain_question_reward(Role, AskQuestion, Answer);
        _ -> false
    end.

gain_question_reward(Role = #role{id = SelfId},
                     #ask_question{id = AskId},
                     Answer = #ask_answer{result = Result}) ->
    role:send_buff_begin(),
    Gains = calc_question_reward(Answer, Role),
    case role_gain:do(Gains, Role) of
        {ok, GainRole} ->
            case ask_mgr:gain_question_reward(AskId, SelfId) of
                ok ->
                    role:send_buff_flush(),
                    GainTag = case Result of
                                  2 -> lang:get("恭喜回答正确，获得");
                                  _ -> lang:get("很遗憾，回答错误，获得")
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

calc_question_reward(#ask_answer{sid = Sid,
                                 result = Result},
                     #role{m_teacher = #m_teacher{status = Status}}) ->
    case quest_teacher_data:question_reward(Sid) of
        {_,
         StudentRight,
         StudentWrong,
         TeacherRight,
         TeacherWrong} ->
            case {Result, Status} of
                {2, 3} -> TeacherRight;
                {2, 1} -> StudentRight;
                {3, 3} -> TeacherWrong;
                {3, 1} -> StudentWrong;
                _ -> []
            end;
        _ -> []
    end.

calc_question_reward([], _Role, Acc) -> Acc;
calc_question_reward([Answer | Rest], Role, Acc) ->
    Gains = calc_question_reward(Answer, Role),
    calc_question_reward(Rest, Role, Gains ++ Acc).

push_question_result(Role,
                     AskQuestion = #ask_question{id = AskId,
                                                 fun_type = FunType}) ->
    case ask:get_pre_answer(AskQuestion) of
        {ok,
         #ask_answer{sid = Sid, qid = Qid, result = Result,
                     opts = Opts}} ->
            Data = {AskId, FunType, Sid, Qid, Result, Opts},
            ask:push_question_result(Role, Data),
            ok;
        _ -> ok
    end.

team_leave_clean(Quest = #quest{id = QuestId},
                 Role = #role{id = SelfId,
                              m_quest =
                                  #m_quest{quest_teacher =
                                               #quest_teacher{partner_id =
                                                                  PartnerId}},
                              m_teacher = #m_teacher{id = TeacherId}}) ->
    case check_relationship(Role, PartnerId, leave) of
        true ->
            Members = team:get_members(Role),
            case lists:keyfind(PartnerId, #team_mate.id, Members) of
                #team_mate{} ->
                    case role_query:local_pid(by_id, PartnerId) of
                        {ok, PartnerPid} ->
                            role:apply(async,
                                       PartnerPid,
                                       {quest_teacher,
                                        del_team_quest,
                                        [SelfId, TeacherId, QuestId]}),
                            ok;
                        _ -> ok
                    end;
                _False -> ok
            end,
            quest:del_quest(Quest, Role);
        _ -> Role
    end.

team_kickout_clean(Quest = #quest{id = QuestId}, MateId,
                   Role = #role{id = SelfId,
                                m_quest =
                                    #m_quest{quest_teacher =
                                                 #quest_teacher{partner_id =
                                                                    PartnerId}},
                                m_teacher = #m_teacher{id = TeacherId}}) ->
    case check_relationship(Role, MateId, kickout) of
        true ->
            case role_query:local_pid(by_id, PartnerId) of
                {ok, PartnerPid} ->
                    role:apply(async,
                               PartnerPid,
                               {quest_teacher,
                                del_team_quest,
                                [SelfId, TeacherId, QuestId]}),
                    ok;
                _ -> ok
            end,
            quest:del_quest(Quest, Role);
        _ -> Role
    end.

team_appoint(#evt_team_appoint{status = 2,
                               leader_id = LeaderId},
             Role = #role{id = SelfId,
                          m_quest =
                              #m_quest{quest = Quests,
                                       quest_teacher =
                                           #quest_teacher{partner_id =
                                                              PartnerId}},
                          m_teacher = #m_teacher{id = TeacherId}}) ->
    case lists:keyfind(18, #quest.sec_type, Quests) of
        Quest = #quest{id = QuestId} ->
            case LeaderId =:= PartnerId of
                true -> ok;
                false ->
                    case role_query:local_pid(by_id, PartnerId) of
                        {ok, PartnerPid} ->
                            role:apply(async,
                                       PartnerPid,
                                       {quest_teacher,
                                        del_team_quest,
                                        [SelfId, TeacherId, QuestId]}),
                            ok;
                        _ -> ok
                    end,
                    NewRole = quest:del_quest(Quest, Role),
                    {remove, NewRole}
            end;
        _False -> remove
    end;
team_appoint(_Evt, _Role) -> ok.

del_team_quest(Role = #role{id = SelfId,
                            m_quest =
                                #m_quest{quest = Quests,
                                         quest_teacher =
                                             #quest_teacher{stats = Stats}},
                            m_teacher = #m_teacher{id = TeacherId}},
               PartnerId, PTeacherId, QuestId) ->
    case lists:keyfind(18, #quest.sec_type, Quests) of
        Quest = #quest{id = QuestId} ->
            case {SelfId =:= PTeacherId, PartnerId =:= TeacherId} of
                {true, _} ->
                    Pos = #quest_teacher_stats.student_id,
                    case lists:keyfind(PartnerId, Pos, Stats) of
                        #quest_teacher_stats{} ->
                            NewRole = quest:del_quest(Quest, Role),
                            {ok, NewRole};
                        _False -> ok
                    end;
                {_, true} ->
                    Pos = #quest_teacher_stats.teacher_id,
                    case lists:keyfind(PartnerId, Pos, Stats) of
                        #quest_teacher_stats{} ->
                            NewRole = quest:del_quest(Quest, Role),
                            {ok, NewRole};
                        _False -> ok
                    end;
                _False -> ok
            end;
        _False -> ok
    end.

check_rpc_accept(Role = #role{m_quest =
                                  #m_quest{quest = Quests},
                              m_teacher = #m_teacher{status = Status}}) ->
    case lists:keyfind(18, #quest.sec_type, Quests) of
        #quest{finish = 1} ->
            {false, lang:get("请先提交当前已完成的师徒任务")};
        #quest{} -> {false, lang:get("您当前的已领取了师徒任务")};
        _None ->
            case Status of
                3 -> check_rpc_accept_teacher(accept, Role);
                1 -> check_rpc_accept_student(accept, Role);
                2 -> {false, lang:get("您已出师，无法领取师徒任务")};
                _ -> {false, lang:get("您还未拜师或收徒，无法领取师徒任务")}
            end
    end.

check_teammate_commit_cond(Role = #role{m_teacher =
                                            #m_teacher{status = Status}}) ->
    case Status of
        1 -> check_teacher_cond(commit, Role);
        3 -> check_student_cond(commit, Role);
        2 -> {false, lang:get("您已出师，无法提交师徒任务")};
        _ -> {false, lang:get("您还未拜师或收徒，无法提交师徒任务")}
    end.

check_teammate_answer_cond(Role = #role{m_teacher =
                                            #m_teacher{status = Status}}) ->
    case Status of
        3 -> check_student_cond(answer, Role);
        1 -> check_teacher_cond(answer, Role);
        2 -> {false, lang:get("您已出师，无法进行答题")};
        _ -> {false, lang:get("您还未拜师或收徒，无法进行答题")}
    end.

check_rpc_accept_teacher(Source, Role) ->
    DayLimit = var:get_var(Role, day_five, 121, 0),
    case DayLimit =< 2 of
        true -> check_student_cond(Source, Role);
        _False -> {false, lang:get("师父今日已完成所有师徒任务，请明日再来")}
    end.

check_rpc_accept_student(Source, Role) ->
    DayLimit = var:get_var(Role, day_five, 122, 0),
    case DayLimit =< 1 of
        true -> check_teacher_cond(Source, Role);
        _False -> {false, lang:get("徒儿今日已完成所有师徒任务，请明日再来")}
    end.

check_student_cond(Source, Role) ->
    TeamCond = case Source of
                   answer -> team:is_team(Role);
                   _ -> team:is_leader(Role)
               end,
    case TeamCond of
        true ->
            case team:get_members(Role) of
                [Mate = #team_mate{id = MateId, status = Status}]
                    when Status =:= 2 orelse Status =:= 1 ->
                    case check_student(Role, MateId) of
                        {ok, _} -> {ok, Mate};
                        _False ->
                            Msg = case Source of
                                      accept -> lang:get("你们并不是师徒关系，我不能给你们任务");
                                      _ -> lang:get("你们不是师徒关系")
                                  end,
                            {false, Msg}
                    end;
                [#team_mate{status = 3}] ->
                    Msg = lang:get("只有师父和徒儿都在队中且归队方能教学哦"),
                    {false, Msg};
                [#team_mate{status = 4}] ->
                    Msg = lang:get("只有师父和徒儿都在队中且归队方能教学哦"),
                    {false, Msg};
                [] ->
                    Msg = case Source of
                              accept -> lang:get("带上您的徒弟才能领取任务哦");
                              _ -> lang:get("队伍里只有你一人哦")
                          end,
                    {false, Msg};
                [#team_mate{}] ->
                    Msg = case Source of
                              accept -> lang:get("你们并不是师徒关系，我不能给你们任务");
                              _ -> lang:get("你们不是师徒关系")
                          end,
                    {team_false, Msg};
                [_ | _] ->
                    Msg = case Source of
                              accept -> lang:get("只能带一个徒弟做师徒任务哦");
                              _ -> lang:get("队伍人数超过两人")
                          end,
                    {team_false, Msg};
                _ -> {false, lang:get("带上您的徒弟才能领取任务哦")}
            end;
        _ -> {false, lang:get("带上您的徒弟才能领取任务哦")}
    end.

check_teacher_cond(Source,
                   Role = #role{m_teacher = #m_teacher{id = TeacherId}}) ->
    TeamCond = case Source of
                   answer -> team:is_team(Role);
                   _ -> team:is_leader(Role)
               end,
    case TeamCond of
        true ->
            case team:get_members(Role) of
                [Mate = #team_mate{id = TeacherId, status = Status}]
                    when Status =:= 1 orelse Status =:= 2 ->
                    {ok, Mate};
                [#team_mate{id = TeacherId, status = 3}] ->
                    Msg = lang:get("只有师父徒儿都在队中且归队方能教学哦"),
                    {false, Msg};
                [#team_mate{id = TeacherId, status = 4}] ->
                    Msg = lang:get("只有师父徒儿都在队中且归队方能教学哦"),
                    {false, Msg};
                [] ->
                    Msg = case Source of
                              accept -> lang:get("带上您的徒弟才能领取任务哦");
                              commit -> lang:get("只有师父徒儿都在队中且归队方能教学哦");
                              _ -> lang:get("队伍里只有你一人哦")
                          end,
                    {false, Msg};
                [_Mate = #team_mate{}] ->
                    Msg = case Source of
                              accept -> lang:get("师徒任务只能由师徒二人领取哦，你们并非师徒关系");
                              commit -> lang:get("师徒任务只能由师徒二人提交哦，你们并非师徒关系");
                              _ -> lang:get("你们不是师徒关系")
                          end,
                    {team_false, Msg};
                [_ | _] ->
                    Msg = case Source of
                              accept -> lang:get("只能带一个徒弟做师徒任务哦");
                              commit -> lang:get("队伍中有外人，请离后方可指点徒儿战斗要点");
                              _ -> lang:get("队伍人数超过两人")
                          end,
                    {team_false, Msg};
                _ -> {false, lang:get("带上您的徒弟才能领取任务哦")}
            end;
        _ -> {false, lang:get("带上您的徒弟才能领取任务哦")}
    end.

check_student(#role{id = TeacherId}, StudentId) ->
    case teacher_mgr:lookup(TeacherId) of
        #teacher{students = Students} ->
            case lists:keyfind(StudentId, #student.id, Students) of
                Student = #student{} -> {ok, Student};
                _ -> false
            end;
        _ -> false
    end.

check_relationship(#role{m_teacher =
                             #m_teacher{status = 1, id = TeacherId}},
                   TeacherId, _Source) ->
    true;
check_relationship(Role = #role{m_teacher =
                                    #m_teacher{status = 3}},
                   MateId, Source) ->
    case check_student(Role, MateId) of
        {ok, _} -> true;
        _ ->
            case Source of
                accept -> {false, lang:get("师徒任务只能由师徒二人领取哦，你们并非师徒关系")};
                patrol -> {false, lang:get("巡逻任务只能师徒二人组队才能进战斗哟")};
                _ -> {false, lang:get("你们并非师徒关系")}
            end
    end;
check_relationship(_Role, _MateId, Source) ->
    Msg = case Source of
              accept -> {false, lang:get("师徒任务只能由师徒二人领取哦，你们并非师徒关系")};
              patrol -> {false, lang:get("巡逻任务只能师徒二人组队才能进战斗哟")};
              _ -> {false, lang:get("你们并非师徒关系")}
          end,
    Msg.

update_day_ring(Role = #role{m_teacher =
                                 #m_teacher{status = 3}}) ->
    MaxVar = var:get_var(Role, day_five, 121, 0),
    case MaxVar < 2 of
        false -> Role;
        true -> var:add_var(Role, day_five, 121, 1)
    end;
update_day_ring(Role = #role{m_teacher =
                                 #m_teacher{status = 1}}) ->
    MaxVar = var:get_var(Role, day_five, 122, 0),
    case MaxVar < 1 of
        false -> Role;
        true -> var:add_var(Role, day_five, 122, 1)
    end;
update_day_ring(Role) -> Role.

check_next_round(#role{m_quest =
                           #m_quest{quest_teacher =
                                        #quest_teacher{stats = Stats}},
                       m_teacher =
                           #m_teacher{status = Status, id = TeacherId}},
                 #team_mate{id = MateId}) ->
    Pos = case Status of
              3 -> #quest_teacher_stats.student_id;
              _ -> #quest_teacher_stats.teacher_id
          end,
    case lists:keyfind(MateId, Pos, Stats) of
        #quest_teacher_stats{round = Round} when Round > 5 ->
            case TeacherId =:= MateId of
                true -> {false, lang:get("您的师父已经和你完成所有师徒任务，请明日再来")};
                false -> {false, lang:get("您的徒弟已完成所有师徒任务，请明日再来")}
            end;
        #quest_teacher_stats{round = Round, type = Type} ->
            case Round > 0 of
                true when Type =:= 3 andalso Round >= 5 ->
                    {ok, Type, Round};
                true when Type =:= 3 -> {ok, Round + 1};
                true -> {ok, Round};
                false -> {ok, 1}
            end;
        _ -> {ok, 1}
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

do_dynamic_progress(#quest_teacher_args{type = 4},
                    P = #quest_progress{ext_data = ExtData},
                    #quest_data{id = QuestId}, _Role) ->
    Patrol = quest_teacher_data:get_patrol(QuestId),
    case util:rand_list(Patrol,
                        #quest_teacher_patrol_data.weight)
        of
        #quest_teacher_patrol_data{map_base_id = MapBaseId} ->
            NewP = P#quest_progress{ext_data =
                                        [{1, MapBaseId} | ExtData]},
            {ok, NewP};
        _False ->
            logger:error("无法抽取巡逻任务[QuestId:~w], Err:~w",
                         [QuestId, _False],
                         quest_teacher,
                         1654),
            {false, P}
    end;
do_dynamic_progress(_Unknow, P, _QuestData, _Role) ->
    {false, P}.

patrol(#evt_move_map{},
       #role{m_team = #m_team{pid = Pid, status = 2}}, _Data)
    when is_pid(Pid) ->
    ok;
patrol(#evt_move_map{base_id = MapBaseId},
       Role = #role{m_quest = #m_quest{quest = Quest}},
       Data = #quest_teacher_patrol_data{id = QuestId,
                                         map_base_id = MapBaseId,
                                         unit_list = UnitList,
                                         min_move_step = MinStep,
                                         max_move_step = MaxStep}) ->
    case lists:keyfind(QuestId, #quest.id, Quest) of
        #quest{} ->
            case get(quest_teacher_patrol_move) of
                undefined ->
                    put(quest_teacher_patrol_move, 1),
                    ok;
                Step ->
                    if Step >= MinStep andalso Step =< MaxStep ->
                           do_patrol(Role, Data, Step);
                       Step > MaxStep ->
                           case util:rand_list(UnitList) of
                               undefined -> ok;
                               {UnitBaseId, _} ->
                                   start_combat_patrol(Role, UnitBaseId)
                           end;
                       true ->
                           put(quest_teacher_patrol_move, Step + 1),
                           ok
                    end
            end;
        _ ->
            erase(quest_teacher_patrol_move),
            ok
    end;
patrol(_Evt, Role, _Data) -> {ok, Role}.

do_patrol(Role,
          #quest_teacher_patrol_data{pcnt = Pcnt,
                                     unit_list = UnitList},
          Step) ->
    case util:rand(1, 1000) =< Pcnt of
        true ->
            case util:rand_list(UnitList, 2) of
                undefined ->
                    put(quest_teacher_patrol_move, Step + 1),
                    ok;
                {UnitBaseId, _Weight} ->
                    start_combat_patrol(Role, UnitBaseId)
            end;
        false ->
            put(quest_teacher_patrol_move, Step + 1),
            ok
    end.

start_combat_patrol(Role, UnitList)
    when is_list(UnitList) ->
    case util:rand_list(UnitList, 2) of
        undefined ->
            logger:error("师徒巡逻任务没有单位列表", [], quest_teacher, 1720),
            ok;
        {UnitBaseId, _Weight} ->
            start_combat_patrol(Role, UnitBaseId)
    end;
start_combat_patrol(Role = #role{m_quest =
                                     #m_quest{quest_teacher =
                                                  #quest_teacher{partner_id =
                                                                     PartnerId}}},
                    UnitBaseId)
    when is_integer(UnitBaseId) ->
    case role_misc:check_event_map(Role) of
        true ->
            case unit_convert:to(unit, UnitBaseId) of
                {ok, Unit = #unit{}} ->
                    case team:get_fighters(Role) of
                        {ok,
                         Fighters = [_, #team_mate{status = 2, id = MateId}]}
                            when MateId =:= PartnerId ->
                            case check_relationship(Role, PartnerId, patrol) of
                                true ->
                                    combat_mgr:start_combat(33, Fighters, Unit),
                                    erase(quest_teacher_patrol_move),
                                    ok;
                                {false, Msg} ->
                                    notice:send(Role, 1, Msg),
                                    ok
                            end;
                        {false, Msg} ->
                            notice:send(Role, 1, Msg),
                            ok;
                        _ ->
                            notice:send(Role,
                                        1,
                                        lang:get("巡逻任务只能师徒二人组队才能进战斗哟")),
                            ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

update_stats(Role = #role{id = SelfId,
                          m_quest =
                              MQuest = #m_quest{quest_teacher =
                                                    QTeacher =
                                                        #quest_teacher{stats =
                                                                           StatsList,
                                                                       partner_id
                                                                           =
                                                                           PartnerId,
                                                                       round =
                                                                           Round,
                                                                       type =
                                                                           Type,
                                                                       quest_id
                                                                           =
                                                                           QuestId}},
                          m_teacher = #m_teacher{status = Status}}) ->
    {Pos, StudentId, TeacherId} = case Status of
                                      3 ->
                                          {#quest_teacher_stats.student_id,
                                           PartnerId,
                                           SelfId};
                                      _ ->
                                          {#quest_teacher_stats.teacher_id,
                                           SelfId,
                                           PartnerId}
                                  end,
    NewStatsList = case lists:keyfind(PartnerId,
                                      Pos,
                                      StatsList)
                       of
                       Stats = #quest_teacher_stats{} ->
                           NewStats = Stats#quest_teacher_stats{quest_id =
                                                                    QuestId,
                                                                type = Type,
                                                                round = Round},
                           lists:keystore(PartnerId, Pos, StatsList, NewStats);
                       _ ->
                           Stats = #quest_teacher_stats{quest_id = QuestId,
                                                        type = Type,
                                                        round = Round,
                                                        student_id = StudentId,
                                                        teacher_id = TeacherId},
                           [Stats | StatsList]
                   end,
    NewQTeacher = QTeacher#quest_teacher{stats =
                                             NewStatsList},
    NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
    Role#role{m_quest = NewMQuest}.

check_answer_result(Qid, Opts) ->
    case question_data:get_teacher_answer(Qid) of
        Correct when is_integer(Correct) ->
            AnswererNum = 2,
            Result = length([Rid
                             || {Rid, Answer} <- Opts, Answer =:= Correct])
                         >= AnswererNum,
            case Result of
                true -> 2;
                false -> 3
            end;
        _ ->
            logger:error("师徒任务题目[Id：~w]没有配置正确答案",
                         [Qid],
                         quest_teacher,
                         1803),
            3
    end.

handle_timeout_result([], Answerers) ->
    [{Rid, 0} || #ask_answerer{rid = Rid} <- Answerers];
handle_timeout_result(Opts = [{Rid, Opt}], Answerers) ->
    case lists:keydelete(Rid, #ask_answerer.rid, Answerers)
        of
        [#ask_answerer{rid = OtherRid}] ->
            [{Rid, Opt}, {OtherRid, 0}];
        _ -> Opts
    end;
handle_timeout_result(Opts, _Answerers) -> Opts.

handle_timeout_result(Opts, SelfId, Answerers) ->
    case Opts of
        [] ->
            [{Rid, 0} || #ask_answerer{rid = Rid} <- Answerers];
        [{SelfId, Opt}] ->
            case lists:keydelete(SelfId,
                                 #ask_answerer.rid,
                                 Answerers)
                of
                [#ask_answerer{rid = Rid}] -> [{Rid, 0}, {SelfId, Opt}];
                _ -> Opts
            end;
        [_] -> [{SelfId, 0} | Opts];
        _ -> Opts
    end.

calc_reward([],
            #quest_teacher_reward_data{teacher_score =
                                           TeacherScore},
            _LevRatio,
            #role{m_teacher = #m_teacher{status = Status}}, Acc) ->
    case Status of
        3 ->
            [#gain{label = teacher_score, val = TeacherScore}
             | Acc];
        _ -> Acc
    end;
calc_reward([G = #gain{label = exp, val = Val} | Rest],
            RewardData = #quest_teacher_reward_data{exp_ratio =
                                                        Ratio},
            LevRatio = {LevExpRatio, _, _}, Role, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * LevExpRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest,
                RewardData,
                LevRatio,
                Role,
                [NewG | Acc]);
calc_reward([G = #gain{label = coin, val = Val} | Rest],
            RewardData = #quest_teacher_reward_data{coin_ratio =
                                                        Ratio},
            LevRatio = {_, LevCoinRatio, _}, Role, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * LevCoinRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest,
                RewardData,
                LevRatio,
                Role,
                [NewG | Acc]);
calc_reward([G = #gain{label = pet_exp, val = Val}
             | Rest],
            RewardData = #quest_teacher_reward_data{pet_exp_ratio =
                                                        Ratio},
            LevRatio = {_, _, PetLevRatio}, Role, Acc)
    when Ratio > 0 ->
    NewVal = util:floor(Val * Ratio * PetLevRatio / 1000 /
                            1000),
    NewG = G#gain{val = NewVal},
    calc_reward(Rest,
                RewardData,
                LevRatio,
                Role,
                [NewG | Acc]);
calc_reward([H | Rest], RewardData, LevRatio, Role,
            Acc) ->
    calc_reward(Rest,
                RewardData,
                LevRatio,
                Role,
                [H | Acc]).

get_lev_ratio_data(#role{m_teacher =
                             #m_teacher{status = 3},
                         lev = Lev}) ->
    case quest_teacher_data:get_teacher_lev_ratio(Lev) of
        LevRatioData when is_tuple(LevRatioData) ->
            {ok, LevRatioData};
        _ -> false
    end;
get_lev_ratio_data(#role{m_teacher =
                             #m_teacher{status = 1},
                         lev = Lev}) ->
    case quest_teacher_data:get_teacher_lev_ratio(Lev) of
        LevRatioData when is_tuple(LevRatioData) ->
            {ok, LevRatioData};
        _ -> false
    end;
get_lev_ratio_data(_Role) -> false.

add_teammate_appoint_trigger(Role = #role{m_teacher =
                                              #m_teacher{status = Status},
                                          m_quest =
                                              #m_quest{quest_teacher =
                                                           #quest_teacher{ext_data
                                                                              =
                                                                              Ext}}})
    when Status =:= 3 orelse Status =:= 1 ->
    case maps:get(appoint_trigger, Ext, undefined) of
        undefined -> add_appoint_trigger(Role);
        _ -> Role
    end;
add_teammate_appoint_trigger(Role) -> Role.

add_appoint_trigger(Role) ->
    Trigger = #trigger{label = evt_team_appoint,
                       m = quest_teacher, f = team_appoint, a = []},
    {Tri, AddRole} = role_trigger:add(Trigger, Role),
    #role{m_quest =
              MQuest = #m_quest{quest_teacher =
                                    QTeacher = #quest_teacher{ext_data =
                                                                  Ext}}} =
        AddRole,
    NewExt = Ext#{appoint_trigger => Tri},
    NewQTeacher = QTeacher#quest_teacher{ext_data = NewExt},
    NewMQuest = MQuest#m_quest{quest_teacher = NewQTeacher},
    AddRole#role{m_quest = NewMQuest}.

get_ask_id(ExtData,
           #role{platform = Pltm, zone_id = ZoneId})
    when is_map(ExtData) ->
    case maps:get(ask_id, ExtData, 0) of
        Mid when is_integer(Mid) andalso Mid > 0 ->
            {Pltm, ZoneId, Mid};
        Mid = {_Pltm, _ZoneId, _AskId} -> Mid;
        _ -> {"", 0, 0}
    end;
get_ask_id(_Unknow, Role) ->
    logger:error("[~ts]未知的夫妻答题数据:~w",
                 [Role#role.name, _Unknow],
                 quest_teacher,
                 1926),
    {"", 0, 0}.

