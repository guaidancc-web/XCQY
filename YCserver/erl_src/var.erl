-file("src/mod/misc/var.erl", 1).

-module(var).

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

-file("src/mod/misc/var.erl", 13).

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

-file("src/mod/misc/var.erl", 14).

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

-file("src/mod/misc/var.erl", 15).

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

-file("src/mod/misc/var.erl", 16).

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

-file("src/mod/misc/var.erl", 17).

-file("inc/log.hrl", 1).

-file("src/mod/misc/var.erl", 18).

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

-file("src/mod/misc/var.erl", 19).

-export([get_var/3,
         init/0,
         gm_modify/2,
         login/1,
         logout/1,
         get_var/4,
         acc_var/3,
         add_var/4,
         add_var/5,
         dec_var/3,
         dec_max_var/4,
         set_var/4,
         del_var/3,
         add_list_val/5,
         append_list_val/5,
         get_list_var/5,
         set_list_var/5,
         reset/2,
         reset_five/2,
         reset_week_five/2,
         calc_online_time/1,
         get_role_var_list/2,
         get_role_var/4,
         update_role_var_list/2,
         set_role_var/4,
         acc_role_var/4]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

init() ->
    #m_var{last_reset_time = date:unixtime(),
           last_reset_five_time = date:unixtime(),
           last_reset_week_five_time = date:unixtime()}.

login(Role = #role{}) ->
    {ok, Role1} = reset(Role, login),
    {ok, Role2} = reset_five(Role1, login),
    {ok, Role3} = reset_week_five(Role2, login),
    Role4 = role_timer:set(#timer{id = day_var_online_time,
                                  timeout = 120 * 1000, times = -1, m = var,
                                  f = calc_online_time, a = []},
                           Role3),
    Role5 = calc_offline_exp(Role4),
    {ok, Role5}.

gm_modify(Role = #role{m_var = MVar}, Time) ->
    {ok,
     Role#role{m_var = MVar#m_var{last_reset_time = Time}}}.

logout(Role = #role{name = _Name,
                    m_var =
                        MVar = #m_var{last_acc_time = LastT, acc_time = AccT}})
    when LastT > 0 ->
    Now = date:unixtime(),
    AddT = min(120, Now - LastT),
    NRole = Role#role{m_var =
                          MVar#m_var{last_acc_time = 0,
                                     acc_time = AccT + AddT}},
    {ok, NRole};
logout(_Role) -> ok.

calc_offline_exp(Role = #role{time_info = {0, _}}) ->
    Role;
calc_offline_exp(Role = #role{time_info = {_, 0}}) ->
    Role;
calc_offline_exp(Role = #role{lev = Lev})
    when Lev < 30 ->
    Role;
calc_offline_exp(Role = #role{lev = Lev,
                              time_info = {LoginTime, LogoutTime}}) ->
    case LoginTime > LogoutTime of
        true ->
            Val = LoginTime - LogoutTime,
            case Val >= 600 of
                true ->
                    OffTime = var:get_var(Role, acc, 1004, 0),
                    OffExp = var:get_var(Role, acc, 1003, 0),
                    PrivilegeOffTime = privilege:get_val(Role, 104),
                    PrivilegeOffExp = privilege:get_val(Role, 105),
                    CanAddVal = max(86400 + PrivilegeOffTime - OffTime, 0),
                    case CanAddVal > 0 of
                        true ->
                            AddVal = min(CanAddVal, Val),
                            AddExp = round(levup_data:get_offline(Lev) * AddVal
                                               / 60
                                               * (1000 + PrivilegeOffExp)
                                               / 1000),
                            case AddExp > 0 of
                                true ->
                                    NewOffTime = OffTime + AddVal,
                                    NewOffExp = OffExp + AddExp,
                                    Role1 = var:set_var(Role,
                                                        acc,
                                                        1004,
                                                        NewOffTime),
                                    Role2 = var:set_var(Role1,
                                                        acc,
                                                        1003,
                                                        NewOffExp),
                                    Role2;
                                false -> Role
                            end;
                        false -> Role
                    end;
                false -> Role
            end;
        false -> Role
    end.

-spec get_var(#role{} | #m_var{},
              Mod :: day |
                     day_five |
                     acc |
                     other |
                     week |
                     {week, 0..86400 * 7},
              Key :: term(), DefVal :: term()) -> Val :: term().

get_var(MVar = #m_var{}, Mod, Key) ->
    get_var(MVar, Mod, Key, default_val(Key));
get_var(Role, Mod, Key) ->
    get_var(Role, Mod, Key, default_val(Key)).

get_var(MVar = #m_var{}, week, Key, DefVal) ->
    get_var(MVar, {week, 0}, Key, DefVal);
get_var(MVar = #m_var{}, {week, OffSet}, Key, DefVal) ->
    case get_var(MVar, other, Key, DefVal) of
        {T, Val} ->
            case date:is_same_week(date:unixtime(), T, OffSet) of
                true -> Val;
                _ -> DefVal
            end;
        _ -> DefVal
    end;
get_var(Role, week, Key, DefVal) ->
    get_var(Role, {week, 0}, Key, DefVal);
get_var(Role, {week, OffSet}, Key, DefVal) ->
    case get_var(Role, other, Key, DefVal) of
        {T, Val} ->
            case date:is_same_week(date:unixtime(), T, OffSet) of
                true -> Val;
                _ -> DefVal
            end;
        _ -> DefVal
    end;
get_var(#m_var{day_vars = Vars}, day, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#m_var{day_five_vars = Vars}, day_five, Key,
        DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#m_var{week_five_vars = Vars}, week_five, Key,
        DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#m_var{acc_vars = Vars}, acc, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#m_var{other_vars = Vars}, other, Key,
        DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#role{m_var = #m_var{day_vars = Vars}}, day,
        Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#role{m_var = #m_var{day_five_vars = Vars}},
        day_five, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#role{m_var = #m_var{week_five_vars = Vars}},
        week_five, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#role{m_var = #m_var{acc_vars = Vars}}, acc,
        Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_var(#role{m_var = #m_var{other_vars = Vars}}, other,
        Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end.

-spec acc_var(#role{},
              Mod :: day | day_five | acc | other,
              Key :: term()) -> #role{}.

acc_var(Role, Mod, Key) -> add_var(Role, Mod, Key, 1).

-spec add_var(#role{},
              Mod :: day | day_five | acc | other, Key :: term(),
              AddVal :: non_neg_integer()) -> #role{}.

add_var(Role, Mod, Key, AddVal) ->
    add_var(Role, Mod, Key, AddVal, default_val(Key)).

add_var(Role, Mod, Key, AddVal, DefVal) ->
    Val = get_var(Role, Mod, Key, DefVal),
    set_var(Role, Mod, Key, Val + AddVal).

-spec dec_var(#role{},
              Mod :: day | day_five | acc | other,
              Key :: term()) -> #role{}.

dec_var(Role, Mod, Key) ->
    Val = get_var(Role, Mod, Key),
    set_var(Role, Mod, Key, max(0, Val - 1)).

-spec dec_max_var(#role{},
                  Mod :: day | day_five | acc | other, Key :: term(),
                  Val :: non_neg_integer()) -> {NewVal ::
                                                    non_neg_integer(),
                                                #role{}}.

dec_max_var(Role, _Mod, _Key, 0) -> {0, Role};
dec_max_var(Role, Mod, Key, Val) ->
    N = get_var(Role, Mod, Key),
    NewVal = min(N, Val),
    NRole = set_var(Role, Mod, Key, N - NewVal),
    {NewVal, NRole}.

-spec set_var(#role{},
              Mod :: day | day_five | acc | other | week,
              Key :: term(), Val :: term()) -> #role{}.

set_var(Role, week, Key, Val) ->
    set_var(Role, other, Key, {date:unixtime(), Val});
set_var(Role, {week, _}, Key, Val) ->
    set_var(Role, other, Key, {date:unixtime(), Val});
set_var(Role = #role{m_var =
                         MVar = #m_var{day_vars = Vars}},
        day, Key, Val) ->
    NewVars = lists:keystore(Key, 1, Vars, {Key, Val}),
    Role#role{m_var = MVar#m_var{day_vars = NewVars}};
set_var(Role = #role{m_var =
                         MVar = #m_var{day_five_vars = Vars}},
        day_five, Key, Val) ->
    NewVars = lists:keystore(Key, 1, Vars, {Key, Val}),
    Role#role{m_var = MVar#m_var{day_five_vars = NewVars}};
set_var(Role = #role{m_var =
                         MVar = #m_var{week_five_vars = Vars}},
        week_five, Key, Val) ->
    NewVars = lists:keystore(Key, 1, Vars, {Key, Val}),
    Role#role{m_var = MVar#m_var{week_five_vars = NewVars}};
set_var(Role = #role{m_var =
                         MVar = #m_var{acc_vars = Vars}},
        acc, Key, Val) ->
    NewVars = lists:keystore(Key, 1, Vars, {Key, Val}),
    Role#role{m_var = MVar#m_var{acc_vars = NewVars}};
set_var(Role = #role{m_var =
                         MVar = #m_var{other_vars = Vars}},
        other, Key, Val) ->
    NewVars = lists:keystore(Key, 1, Vars, {Key, Val}),
    Role#role{m_var = MVar#m_var{other_vars = NewVars}}.

-spec del_var(#role{},
              Mod :: day | day_five | acc | other,
              Key :: term()) -> #role{}.

del_var(Role, _Mod, []) -> Role;
del_var(Role, Mod, [Key | T]) ->
    NRole = del_var(Role, Mod, Key),
    del_var(NRole, Mod, T);
del_var(Role = #role{m_var =
                         MVar = #m_var{day_vars = Vars}},
        day, Key) ->
    Role#role{m_var =
                  MVar#m_var{day_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
                         MVar = #m_var{day_five_vars = Vars}},
        day_five, Key) ->
    Role#role{m_var =
                  MVar#m_var{day_five_vars =
                                 lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
                         MVar = #m_var{week_five_vars = Vars}},
        week_five, Key) ->
    Role#role{m_var =
                  MVar#m_var{week_five_vars =
                                 lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
                         MVar = #m_var{acc_vars = Vars}},
        acc, Key) ->
    Role#role{m_var =
                  MVar#m_var{acc_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
                         MVar = #m_var{other_vars = Vars}},
        other, Key) ->
    Role#role{m_var =
                  MVar#m_var{other_vars = lists:keydelete(Key, 1, Vars)}}.

get_list_var(Role, Mod, Key, K, DefVal) ->
    ValList = get_var(Role, Mod, Key, []),
    case lists:keyfind(K, 1, ValList) of
        {K, Val} -> Val;
        _ -> DefVal
    end.

set_list_var(Role, Mod, Key, K, Val) ->
    ValList = get_var(Role, Mod, Key, []),
    NewValList = lists:keystore(K, 1, ValList, {K, Val}),
    set_var(Role, Mod, Key, NewValList).

-spec add_list_val(Role :: #role{}, Mod :: day,
                   Key :: term(), K :: term(), AddVal :: number()) -> {ok,
                                                                       #role{}}.

add_list_val(Role = #role{m_var = MVar}, Mod = day, Key,
             K, AddVal) ->
    ValList = get_var(Role, Mod, Key, []),
    NewValList = case lists:keytake(ValList, 1, K) of
                     {value, {ValList, Val}, RestList} when is_number(Val) ->
                         [{ValList, Val + AddVal} | RestList];
                     {value, _Kv, _RestList} -> K;
                     false -> [{ValList, AddVal} | K]
                 end,
    {ok,
     Role#role{m_var = MVar#m_var{day_vars = NewValList}}};
add_list_val(Role, _Mod, _Key, _K, _AddVal) ->
    {ok, Role}.

-spec append_list_val(Role :: #role{}, Mod :: day,
                      Key :: term(), K :: term(), AddVal :: term()) -> {ok,
                                                                        #role{}}.

append_list_val(Role = #role{m_var = MVar}, Mod = day,
                Key, K, AddVal) ->
    ValList = get_var(Role, Mod, Key, []),
    NewValList = case lists:keytake(ValList, 1, K) of
                     {value, {ValList, List}, RestList} when is_list(List) ->
                         [{ValList, [AddVal | List]} | RestList];
                     {value, _Kv, _RestList} -> K;
                     false -> [{ValList, [AddVal]} | K]
                 end,
    {ok,
     Role#role{m_var = MVar#m_var{day_vars = NewValList}}};
append_list_val(Role, _Mod, _Key, _K, _AddVal) ->
    {ok, Role}.

reset(Role = #role{m_var =
                       Mvar = #m_var{last_reset_time = LastT}},
      Mode) ->
    Now = date:unixtime(),
    Flag = date:is_today(LastT),
    NRole = case Flag of
                true ->
                    Role#role{m_var = Mvar#m_var{last_acc_time = Now}};
                false ->
                    Role0 = checkin:send_forget(Role),
                    Role1 = agenda:calc_reserve_exp(Role0,
                                                    {zero, LastT, Mode}),
                    Role2 = Role1#role{m_var =
                                           Mvar#m_var{day_vars = [],
                                                      last_reset_time = Now,
                                                      last_acc_time = Now,
                                                      acc_time = 0}},
                    log:login(Role2, logout, Now, Now - 1, "角色登录退出"),
                    log:login(Role2, login, Now, 0, "角色登录"),
                    reset_flush([{all, reward_back, reset, []},
                                 {all, agenda, reset, []},
                                 {all, campaign, zero_flush, []},
                                 {all, checkin, sign, []},
                                 {zero, treasure, zero_flush, []},
                                 {all, quest_offer, reset, []},
                                 {all, quest_classes, reset, []},
                                 {all, achievement, zero_flush, []},
                                 {all, limit_return, zero_flush, []},
                                 {all, charge_gift, zero_flush, []},
                                 {all, teacher, zero_flush, []},
                                 {all, investment, reset, []},
                                 {all, unit_action, festival_reset, []},
                                 {all, month_card, zero_flush, []},
                                 {all, camp_login, zero_flush, []},
                                 {all, goal, zero_flush, []},
                                 {all, tournament_role, reset, []},
                                 {all, mount, daily_reset, []},
                                 {all, wedding_memory, zero_flush, []},
                                 {all, camp_login_roll, zero_flush, []},
                                 {all,
                                  camp_series_recharge_open,
                                  zero_flush,
                                  []},
                                 {all, camp_halloween_mgr, push_times, []},
                                 {all, regression_login, zero_flush, []},
                                 {all, agenda_stat, reset, []},
                                 {all, role_misc, reset, []},
                                 {all, quest_acquaintance, reset, []},
                                 {all, camp_discount, zero_flush, []},
                                 {all, camp_new_flop, zero_flush, []},
                                 {all, camp_7_7th_mgr, zero_flush, []},
                                 {all, camp_recharge, zero_flush, []},
                                 {all, camp_cut_price, zero_flush, []},
                                 {all, camp_rice_dumpling, zero_flush, []},
                                 {all, skill_prac, zero_flush, []},
                                 {all, quest_single_dog, zero_flush, []},
                                 {all, camp_wish_flower, zero_flush, []},
                                 {all, camp_fashion_vote, zero_flush, []},
                                 {all, skill_unique, zero_flush, []},
                                 {all, camp_lucky_draw, zero_flush, []},
                                 {all,
                                  camp_pass_flower_language,
                                  zero_flush,
                                  []},
                                 {all, provocation_role, zero_flush, []},
                                 {all, camp_consume_rebate, zero_flush, []},
                                 {all, camp_charge_seven_gift, zero_flush, []},
                                 {all, camp_gift_custom, zero_flush, []}],
                                Role2,
                                Mode,
                                Role)
            end,
    NewRole = role_timer:set(#timer{id =
                                        day_var_reset_timer,
                                    timeout = date:next_diff(0) * 1000,
                                    times = 1, m = var, f = reset, a = [zero]},
                             NRole),
    {ok, NewRole}.

reset_five(Role = #role{m_var =
                            Mvar = #m_var{last_reset_five_time = LastT}},
           Mode) ->
    Now = date:unixtime(),
    Flag = date:is_same_five_reset(Now, LastT),
    NRole = case Flag of
                true -> Role;
                false ->
                    Role1 = agenda:calc_reserve_exp(Role,
                                                    {five, LastT, Mode}),
                    Role2 = Role1#role{m_var =
                                           Mvar#m_var{day_five_vars = [],
                                                      last_reset_five_time =
                                                          Now}},
                    reset_flush([{all, reward_back, reset_five, []},
                                 {all, trial, day_reset, []},
                                 {all, agenda, reset_five, []},
                                 {all, campaign, five_flush, []},
                                 {all, quest_marriage, reset_five, []},
                                 {all, quest_couple, reset_five, []},
                                 {all, quest_treasure, reset_five, []},
                                 {all, pray, reset_five, []},
                                 {all, quest_teacher, reset_five, []},
                                 {all, arena_mgr, reset_five, []},
                                 {all, tower, five_flush, []},
                                 {all, attr, five_flush, []},
                                 {all, wing, five_flush, []},
                                 {all, campaign_bags, reset, []},
                                 {all, endless_challenge, five_flush, []},
                                 {all, camp_rainbow_lottery, five_flush, []},
                                 {all, role_classes_modify, five_flush, []},
                                 {all, campaign_card, flush, []},
                                 {all, dungeon_util, flush_five, []},
                                 {all, glory_new, five_reset, []},
                                 {all, exquisite_shelf_role, five_reset, []},
                                 {all, gods_place_role, role_week_five, []},
                                 {all, friend, reset_intimacy, []}],
                                Role2,
                                Mode,
                                Role)
            end,
    NewRole = role_timer:set(#timer{id =
                                        day_five_var_reset_timer,
                                    timeout = date:next_diff(5, 0, 0) * 1000,
                                    times = 1, m = var, f = reset_five,
                                    a = [five]},
                             NRole),
    {ok, NewRole}.

reset_week_five(Role = #role{m_var =
                                 Mvar = #m_var{last_reset_week_five_time =
                                                   LastT}},
                Mode) ->
    Now = date:unixtime(),
    Flag = date:is_same_week(Now, LastT, 18000),
    NRole = case Flag of
                true -> Role;
                false ->
                    Role1 = Role#role{m_var =
                                          Mvar#m_var{week_five_vars = [],
                                                     last_reset_week_five_time =
                                                         Now}},
                    reset_flush([{all, agenda, reset_week_five, []},
                                 {all, quest_chain, reset, []},
                                 {all, market_gold, role_reset, []},
                                 {all,
                                  spirit_treasure_role,
                                  role_week_five,
                                  []},
                                 {all, gods_place_role, role_week_five, []},
                                 {all, agenda_week, reset_week_five, []},
                                 {all, teacher, role_week_five, []},
                                 {all, talisman, remold_reset_week_five, []},
                                 {all,
                                  oracle_treasure_role,
                                  role_week_five,
                                  []}],
                                Role1,
                                Mode,
                                Role)
            end,
    NewRole = role_timer:set(#timer{id =
                                        week_five_var_reset_timer,
                                    timeout = date:next_diff(5, 0, 0) * 1000,
                                    times = 1, m = var, f = reset_week_five,
                                    a = [week_five]},
                             NRole),
    {ok, NewRole}.

calc_online_time(Role = #role{name = _Name,
                              m_var =
                                  MVar = #m_var{last_acc_time = LastT,
                                                acc_time = AccT}}) ->
    Now = date:unixtime(),
    AddT = min(120, Now - LastT),
    NRole = Role#role{m_var =
                          MVar#m_var{last_acc_time = Now,
                                     acc_time = AccT + AddT}},
    NewRole = var:add_var(NRole, day_five, 143, AddT, 0),
    {ok,
     role_trigger:fire(#evt_online_time{acc_time =
                                            AccT + AddT,
                                        add_val = AddT},
                       NewRole)}.

reset_flush([], Role, _Mode, _OldRole) -> Role;
reset_flush([{DoType, Mod, Fun, Args} | T],
            Role = #role{name = Name}, Mode, OldRole)
    when DoType =:= all orelse DoType =:= Mode ->
    NewArgs = case {Mod, Fun} of
                  {campaign, _} ->
                      Now = date:unixtime(),
                      [Role, Now | Args];
                  _ -> [Role, OldRole | Args]
              end,
    case catch erlang:apply(Mod, Fun, NewArgs) of
        ok -> reset_flush(T, Role, Mode, OldRole);
        {ok, NewRole} when is_record(NewRole, role) ->
            reset_flush(T, NewRole, Mode, OldRole);
        _Err ->
            logger:error("角色[~ts]执行变量刷新调用[~w:~w:~w]时发生异常:~w",
                         [Name, Mod, Fun, Args, _Err],
                         var,
                         478),
            reset_flush(T, Role, Mode, OldRole)
    end;
reset_flush([_ | T], Role, Mode, OldRole) ->
    reset_flush(T, Role, Mode, OldRole).

-spec get_role_var_list(role_id(),
                        [{Label :: day | forever,
                          Key :: term(),
                          DefVal :: term()}]) -> [Val :: term()].

get_role_var_list(RoleId, L) ->
    RoleVal = lookup(RoleId),
    [get_role_var(RoleVal, Label, Key, DefVal)
     || {Label, Key, DefVal} <- L].

-spec get_role_var(role_id(), Label :: day | forever,
                   Key :: term(), DefVal :: term()) -> Val :: term().

get_role_var(RoleId = {_, _, _}, Label, Key, DefVal) ->
    get_role_var(lookup(RoleId), Label, Key, DefVal);
get_role_var(#role_var{day_vars = Vars}, day, Key,
             DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_role_var(#role_var{forever_vars = Vars}, forever,
             Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_role_var(#role_var{day_five_vars = Vars}, day_five,
             Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end;
get_role_var(#role_var{week_five_vars = Vars},
             week_five_vars, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
        {Key, Val} -> Val;
        _ -> DefVal
    end.

-spec update_role_var_list(role_id(), [Item]) -> [Val ::
                                                      term()] when Item :: {set,
                                                                            Label ::
                                                                                day |
                                                                                forever,
                                                                            Key ::
                                                                                term(),
                                                                            Val ::
                                                                                term()} |
                                                                           {del,
                                                                            Label ::
                                                                                day |
                                                                                forever,
                                                                            Key ::
                                                                                term()} |
                                                                           {acc,
                                                                            Label ::
                                                                                day |
                                                                                forever,
                                                                            Key ::
                                                                                term(),
                                                                            DefVal ::
                                                                                non_neg_integer(),
                                                                            AddVal ::
                                                                                non_neg_integer(),
                                                                            MaxVal ::
                                                                                non_neg_integer()} |
                                                                           {dec,
                                                                            Label ::
                                                                                day |
                                                                                forever,
                                                                            Key ::
                                                                                term(),
                                                                            DecVal ::
                                                                                non_neg_integer(),
                                                                            DecVal ::
                                                                                non_neg_integer(),
                                                                            MinVal ::
                                                                                non_neg_integer()}.

update_role_var_list(RoleId = {_, Platform, ZoneId},
                     L) ->
    cross:cast(Platform,
               ZoneId,
               var,
               cast,
               [{update, RoleId, L}]).

set_role_var(RoleId = {_, Platform, ZoneId}, Label, Key,
             Val) ->
    cross:cast(Platform,
               ZoneId,
               var,
               cast,
               [{update, RoleId, [{set, Label, Key, Val}]}]).

acc_role_var(RoleId = {_, _, _}, Label, Key, DefVal)
    when Label =:= day orelse Label =:= forever ->
    update_role_var_list(RoleId,
                         [{acc, Label, Key, DefVal, 1, 99999999999999}]).

info(Info) -> var ! Info.

cast(Info) -> gen_server:cast(var, Info).

call(Info) ->
    case catch gen_server:call(var, Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, var}, var, [], []).

init([]) ->
    logger:info("[~w] 正在启动...", [var], var, 539),
    dets:open_file(role_var,
                   [{file, "./dets/role_var.dets"},
                    {keypos, #role_var.id}]),
    ets:new(role_var,
            [set, named_table, public, {keypos, #role_var.id}]),
    Now = date:unixtime(),
    do_init(Now),
    State = #state{},
    erlang:send_after(date:next_diff(0, 0, 0) * 1000,
                      self(),
                      update_hour_zero),
    erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                      self(),
                      update_hour_five),
    logger:info("[~w] 启动完成", [var], var, 547),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({update, RoleId, L = [_ | _]}, State) ->
    R = #role_var{} = lookup(RoleId),
    NewR = reset_role_var(L, R),
    update_ets(NewR),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(update_hour_zero, State) ->
    Now = date:unixtime(),
    Fun = fun (R = #role_var{}, _) ->
                  NewR = R#role_var{day_vars = [], last_reset_time = Now},
                  update_ets(NewR)
          end,
    ets:foldl(Fun, 0, role_var),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000,
                      self(),
                      update_hour_zero),
    {noreply, State};
handle_info(update_hour_five, State) ->
    Now = date:unixtime(),
    Fun = fun (R = #role_var{}, _) ->
                  NewR = R#role_var{day_five_vars = [],
                                    last_reset_five_time = Now},
                  update_ets(NewR)
          end,
    ets:foldl(Fun, 0, role_var),
    Fun2 = fun (R = #role_var{last_reset_week_five_time =
                                  LastT},
                _) ->
                   case date:is_same_week(Now, LastT, 18000) of
                       true -> update_ets(R);
                       _ ->
                           NewR = R#role_var{week_five_vars = [],
                                             last_reset_week_five_time = Now},
                           update_ets(NewR)
                   end
           end,
    ets:foldl(Fun2, 0, role_var),
    erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                      self(),
                      update_hour_five),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

update_ets(R) ->
    dets:insert(role_var, R),
    ets:insert(role_var, R).

reset_role_var([], R) -> R;
reset_role_var([I | T], R) ->
    NewR = reset_role_var(I, R),
    reset_role_var(T, NewR);
reset_role_var({acc,
                Label,
                Key,
                DefVal,
                AddVal,
                MaxVal},
               R)
    when Label =:= day orelse
             Label =:= forever orelse
                 Label == day_five orelse Label == week_five ->
    Val = get_role_var(R, Label, Key, DefVal),
    do_set_role_var(R,
                    Label,
                    Key,
                    min(MaxVal, Val + AddVal));
reset_role_var({dec,
                Label,
                Key,
                DefVal,
                DecVal,
                MinVal},
               R)
    when Label =:= day orelse
             Label =:= forever orelse
                 Label == day_five orelse Label == week_five ->
    Val = get_role_var(R, Label, Key, DefVal),
    do_set_role_var(R,
                    Label,
                    Key,
                    max(MinVal, Val - DecVal));
reset_role_var({set, Label, Key, Val}, R)
    when Label =:= day orelse
             Label =:= forever orelse
                 Label == day_five orelse Label == week_five ->
    do_set_role_var(R, Label, Key, Val);
reset_role_var({set, Label, Key, Val}, R)
    when Label =:= day orelse
             Label =:= forever orelse
                 Label == day_five orelse Label == week_five ->
    do_set_role_var(R, Label, Key, Val);
reset_role_var({del, Label, Key}, R)
    when Label =:= day orelse
             Label =:= forever orelse
                 Label == day_five orelse Label == week_five ->
    del_role_var(R, Label, Key);
reset_role_var(_, R) -> R.

do_set_role_var(R = #role_var{day_vars = Vars}, day,
                Key, Val) ->
    R#role_var{day_vars =
                   [{Key, Val} | lists:keydelete(Key, 1, Vars)]};
do_set_role_var(R = #role_var{day_five_vars = Vars},
                day_five, Key, Val) ->
    R#role_var{day_five_vars =
                   [{Key, Val} | lists:keydelete(Key, 1, Vars)]};
do_set_role_var(R = #role_var{week_five_vars = Vars},
                week_five, Key, Val) ->
    R#role_var{week_five_vars =
                   [{Key, Val} | lists:keydelete(Key, 1, Vars)]};
do_set_role_var(R = #role_var{forever_vars = Vars},
                forever, Key, Val) ->
    R#role_var{forever_vars =
                   [{Key, Val} | lists:keydelete(Key, 1, Vars)]}.

del_role_var(R = #role_var{day_vars = Vars}, day,
             Key) ->
    R#role_var{day_vars = lists:keydelete(Key, 1, Vars)};
del_role_var(R = #role_var{forever_vars = Vars},
             forever, Key) ->
    R#role_var{forever_vars =
                   lists:keydelete(Key, 1, Vars)}.

lookup(RoleId = {_, Platform, ZoneId}) ->
    case catch cross:call(Platform,
                          ZoneId,
                          ets,
                          lookup,
                          [role_var, RoleId])
        of
        [R = #role_var{}] -> R;
        _ ->
            #role_var{id = RoleId,
                      last_reset_time = date:unixtime()}
    end.

do_init(Now) ->
    case dets:first(role_var) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], var, 661),
            [];
        _ ->
            dets:traverse(role_var,
                          fun (G) ->
                                  case var_ver:do(G) of
                                      {false, Reason} ->
                                          logger:error("帮会数据转换失败:~w",
                                                       [Reason],
                                                       var,
                                                       668),
                                          {done, false};
                                      {ok,
                                       Data = #role_var{last_reset_time =
                                                            LastResetTime,
                                                        day_vars = DayVars,
                                                        last_reset_five_time =
                                                            LastResetFiveTime,
                                                        day_five_vars =
                                                            DayFiveVars,
                                                        last_reset_week_five_time
                                                            =
                                                            LastResetWeekFiveTime,
                                                        week_five_vars =
                                                            WeekFiveVars}} ->
                                          NewDayVars = case
                                                           date:is_today(LastResetTime)
                                                           of
                                                           true -> DayVars;
                                                           _ -> []
                                                       end,
                                          NewDayFiveVars = case
                                                               date:is_same_five_reset(Now,
                                                                                       LastResetFiveTime)
                                                               of
                                                               true ->
                                                                   DayFiveVars;
                                                               _ -> []
                                                           end,
                                          NewWeekFiveVars = case
                                                                date:is_same_week(Now,
                                                                                  LastResetWeekFiveTime,
                                                                                  18000)
                                                                of
                                                                true ->
                                                                    WeekFiveVars;
                                                                _ -> []
                                                            end,
                                          update_ets(Data#role_var{day_vars =
                                                                       NewDayVars,
                                                                   day_five_vars
                                                                       =
                                                                       NewDayFiveVars,
                                                                   week_five_vars
                                                                       =
                                                                       NewWeekFiveVars}),
                                          continue
                                  end
                          end)
    end.

default_val(11) -> 30;
default_val(_Key) -> 0.

