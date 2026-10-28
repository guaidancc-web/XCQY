-file("src/mod/item/package.erl", 1).

-module(package).

-export([init/1,
         combine/2,
         sort/2,
         merge/1,
         del/3,
         add/4,
         add/5,
         find/3,
         count/3,
         find_bind_unbind/2,
         fetch/3,
         fresh_item/4,
         fresh_eqm/3,
         replace_item/4,
         swap/5,
         swap/6,
         check_pos/4,
         push_item_info/3,
         split_item/4,
         push_gain/2,
         do_find_add_item/4,
         do_find_add_item/2,
         find_add_item/5,
         add_auto_overlap/2,
         check_is_full/2]).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/package.erl", 38).

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

-file("src/mod/item/package.erl", 39).

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

-file("src/mod/item/package.erl", 40).

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

-file("src/mod/item/package.erl", 41).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/item/package.erl", 42).

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

-file("src/mod/item/package.erl", 43).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/mod/item/package.erl", 44).

-spec init(Atom) -> #package{} when Atom :: bag |
                                            store |
                                            eqm |
                                            casino |
                                            family_store.

init(eqm) ->
    #package{type = 3, volume = 20,
             free_cell = lists:seq(1, 20)};
init(bag) ->
    #package{type = 1, volume = 75,
             free_cell = lists:seq(1, 75)};
init(store) ->
    #package{type = 2, volume = 25,
             free_cell = lists:seq(1, 25)};
init(family_store) ->
    #package{type = 4, volume = 0,
             free_cell = lists:seq(1, 0)}.

-spec sort(Mode, #role{}) -> {ok,
                              #package{}} when Mode :: bag | store.

sort(bag,
     Role = #role{p_bag =
                      Bag = #package{volume = Volume, type = 1,
                                     items = Items}}) ->
    SortItem = lists:sort(fun sort_type/2,
                          combine(Items, [])),
    {NewFreeCell, NewItems} = add_new_pos(SortItem,
                                          lists:seq(1, Volume)),
    check_sort_result(Role, 1, Items, NewItems),
    {ok,
     Bag#package{free_cell = NewFreeCell, items = NewItems}};
sort(store,
     Role = #role{p_store =
                      Store = #package{volume = Volume, type = 2,
                                       items = Items}}) ->
    SortItem = lists:sort(fun sort_type/2,
                          combine(Items, [])),
    {NewFreeCell, NewItems} = add_new_pos(SortItem,
                                          lists:seq(1, Volume)),
    check_sort_result(Role, 2, Items, NewItems),
    {ok,
     Store#package{free_cell = NewFreeCell,
                   items = NewItems}};
sort(family_store,
     Role = #role{p_family_store =
                      FamilyStore = #package{volume = Volume, type = 4,
                                             items = Items}}) ->
    SortItem = lists:sort(fun sort_type/2,
                          combine(Items, [])),
    case length(SortItem) =< Volume of
        true ->
            {NewFreeCell, NewItems} = add_new_pos(SortItem,
                                                  lists:seq(1, Volume)),
            logger:debug("整理后的物品列表:~w", [NewItems], package, 73),
            check_sort_result(Role, 4, Items, NewItems),
            {ok,
             FamilyStore#package{free_cell = NewFreeCell,
                                 items = NewItems}};
        false ->
            {false, lang:get("你的仓库容量不足，请升级仓库容量或摆放更高级别的储物柜家具")}
    end.

-spec do_find_add_item(Package :: #package{},
                       BaseId :: pos_integer(), 0..1,
                       Num :: pos_integer()) -> false |
                                                {ok, NewPackage :: #package{}}.

do_find_add_item(Package, ItemBaseId, Bind, Num) ->
    do_find_add_item(Package,
                     #{base_id => ItemBaseId, bind => Bind,
                       quantity => Num}).

do_find_add_item(Package = #package{type = Type,
                                    items = Items},
                 Args = #{base_id := ItemBaseId, quantity := Num}) ->
    case item_data:get(ItemBaseId) of
        #item_base{overlap = 1} -> false;
        #item_base{overlap = OverLap} ->
            case get_same_item(Args#{overlap => OverLap,
                                     items => Items})
                of
                false -> false;
                MinPosItem = #item{id = Id, quantity = Q} ->
                    NewItem = MinPosItem#item{quantity = Q + Num},
                    NewItems = lists:keyreplace(Id,
                                                #item.id,
                                                Items,
                                                NewItem),
                    package:push_item_info(update,
                                           get(conn_pid),
                                           [{Type, NewItem}]),
                    logger:debug("~w堆叠成功, 新的数量为:~w",
                                 [ItemBaseId, Num + Q],
                                 package,
                                 94),
                    put(role_gain_items,
                        [MinPosItem#item{quantity = Num}
                         | get(role_gain_items)]),
                    {ok, Package#package{items = NewItems}}
            end;
        _ -> false
    end.

find_add_item(Tag, IsPush,
              Item = #item{base_id = ItemBaseId}, Package, Role) ->
    case item_data:get(ItemBaseId) of
        #item_base{overlap = 1} -> false;
        #item_base{overlap = OverLap} ->
            do_find_add_item(Tag,
                             IsPush,
                             Item,
                             OverLap,
                             Package,
                             Role);
        _ -> false
    end.

do_find_add_item(by_source, push,
                 #item{base_id = ItemBaseId, quantity = Num,
                       extra = ExtraList},
                 OverLap, Package = #package{type = Type, items = Items},
                 Role) ->
    case lists:keyfind(1, 1, ExtraList) of
        {1, Price, _Str} ->
            case lists:keyfind(2, 1, ExtraList) of
                {2, Source, _Str} ->
                    case calc_same_source_price(Items,
                                                ItemBaseId,
                                                Num,
                                                Price,
                                                [{Price, Num}],
                                                OverLap,
                                                Source,
                                                0)
                        of
                        false -> false;
                        MinPosItem = #item{id = Id, quantity = Q} ->
                            NewItem = MinPosItem#item{quantity = Q + Num},
                            NewItems = lists:keyreplace(Id,
                                                        #item.id,
                                                        Items,
                                                        NewItem),
                            package:push_item_info(update,
                                                   Role,
                                                   [{Type, NewItem}]),
                            logger:debug("~w堆叠成功, 新的数量为:~w",
                                         [ItemBaseId, Num + Q],
                                         package,
                                         120),
                            put(role_gain_items,
                                [MinPosItem#item{quantity = Num}
                                 | get(role_gain_items)]),
                            {ok, Package#package{items = NewItems}}
                    end;
                _False -> false
            end;
        _False -> false
    end;
do_find_add_item(_Tag, _IsPush, _Args, _ItemBase,
                 _Package, _Role) ->
    false.

-spec do_find_add_item_not_push(Package :: #package{},
                                BaseId :: pos_integer(), 0..1,
                                Num :: pos_integer()) -> false |
                                                         {ok,
                                                          NewPackage ::
                                                              #package{},
                                                          #item{}}.

do_find_add_item_not_push(Package, ItemBaseId, Bind,
                          Num) ->
    do_find_add_item_not_push(Package,
                              #{base_id => ItemBaseId, bind => Bind,
                                quantity => Num}).

do_find_add_item_not_push(Package = #package{items =
                                                 Items},
                          C = #{base_id := ItemBaseId, quantity := Num}) ->
    case item_data:get(ItemBaseId) of
        #item_base{overlap = 1} -> false;
        #item_base{overlap = OverLap} ->
            case get_same_item(C#{overlap := OverLap,
                                  items := Items})
                of
                false -> false;
                MinPosItem = #item{id = Id, quantity = Q} ->
                    NewItem = MinPosItem#item{quantity = Q + Num},
                    NewItems = lists:keyreplace(Id,
                                                #item.id,
                                                Items,
                                                NewItem),
                    logger:debug("~w堆叠成功, 新的数量为:~w",
                                 [ItemBaseId, Num + Q],
                                 package,
                                 146),
                    put(role_gain_items,
                        [MinPosItem#item{quantity = Num}
                         | get(role_gain_items)]),
                    {ok, Package#package{items = NewItems}, NewItem}
            end;
        _ -> false
    end.

get_same_item(C = #{}) -> get_same_item(C, 0).

get_same_item(#{items := []}, 0) -> false;
get_same_item(#{items := []}, MinPosItem) -> MinPosItem;
get_same_item(C = #{step := Step,
                    items := [#item{step = OldStep} | T]},
              MinPosItem)
    when Step =/= OldStep ->
    get_same_item(C#{items := T}, MinPosItem);
get_same_item(C = #{base_id := ItemBaseId, bind := Bind,
                    quantity := Num, overlap := OverLap,
                    items :=
                        [Item = #item{base_id = ItemBaseId, bind = Bind,
                                      quantity = Q}
                         | T]},
              0)
    when Q + Num =< OverLap ->
    get_same_item(C#{items := T}, Item);
get_same_item(C = #{base_id := ItemBaseId, bind := Bind,
                    quantity := Num, overlap := OverLap,
                    items :=
                        [Item = #item{pos = Pos1, base_id = ItemBaseId,
                                      bind = Bind, quantity = Q}
                         | T]},
              #item{pos = Pos2})
    when Q + Num =< OverLap andalso Pos1 < Pos2 ->
    get_same_item(C#{items := T}, Item);
get_same_item(C = #{items := [_ | T]}, MinPosItem) ->
    get_same_item(C#{items := T}, MinPosItem).

-spec add_auto_overlap([tuple()], #package{}) -> {ok,
                                                  #package{},
                                                  RefL :: list(),
                                                  AddL :: list()} |
                                                 false |
                                                 false.

add_auto_overlap(ItemInfo, Package) ->
    do_add_auto_overlap(ItemInfo, Package, [], []).

do_add_auto_overlap([], Package, RefL, AddL) ->
    {ok, Package, RefL, AddL};
do_add_auto_overlap([{BaseId, Bind, Num} | T], Package,
                    RefL, AddL) ->
    case do_find_add_item_not_push(Package,
                                   BaseId,
                                   Bind,
                                   Num)
        of
        {ok, NewPackage, NewItem} ->
            do_add_auto_overlap(T,
                                NewPackage,
                                [NewItem | RefL],
                                AddL);
        false ->
            case do_add_no_push_base_id(Package,
                                        [{BaseId, Bind, Num}],
                                        [])
                of
                {ok, NewPackage, AddItems} ->
                    do_add_auto_overlap(T,
                                        NewPackage,
                                        RefL,
                                        AddL ++ AddItems);
                false -> false;
                full -> full
            end
    end;
do_add_auto_overlap([H = #{base_id := BaseId,
                           bind := Bind, quantity := Num}
                     | T],
                    Package, RefL, AddL) ->
    case do_find_add_item_not_push(Package,
                                   BaseId,
                                   Bind,
                                   Num)
        of
        {ok, NewPackage, NewItem} ->
            do_add_auto_overlap(T,
                                NewPackage,
                                [NewItem | RefL],
                                AddL);
        false ->
            case do_add_no_push_base_id(Package, [H], []) of
                {ok, NewPackage, AddItems} ->
                    do_add_auto_overlap(T,
                                        NewPackage,
                                        RefL,
                                        AddL ++ AddItems);
                false -> false;
                full -> full
            end
    end.

-spec del(Flag, #package{}, ItemInfo) -> {false,
                                          bitstring()} |
                                         {ok, #package{}, DelList, FreshList} |
                                         {ok, #package{}, DelList} when Flag ::
                                                                            by_id |
                                                                            by_base_id,
                                                                        ItemInfo ::
                                                                            [{ItemId,
                                                                              non_neg_integer()}] |
                                                                            [{ItemBaseId,
                                                                              non_neg_integer()}],
                                                                        ItemId ::
                                                                            non_neg_integer(),
                                                                        ItemBaseId ::
                                                                            non_neg_integer(),
                                                                        DelList ::
                                                                            [#item{}],
                                                                        FreshList ::
                                                                            [#item{}].

del(by_id, Package, ItemInfo) ->
    del_by_id(Package, ItemInfo);
del(by_base_id, Package, ItemInfo) ->
    del_by_base_id(Package, ItemInfo);
del(by_base_id_all, Package, ItemInfo) ->
    del_all_by_base_id(Package, ItemInfo).

-spec add(Mode, Flag, #role{}, ItemInfo) -> full |
                                            false |
                                            {ok, #package{}} when Mode ::
                                                                      by_items |
                                                                      by_base_id,
                                                                  Flag :: bag |
                                                                          store |
                                                                          eqm |
                                                                          casino,
                                                                  ItemInfo ::
                                                                      [#item{}] |
                                                                      [{BaseId,
                                                                        Bind,
                                                                        Num}],
                                                                  BaseId ::
                                                                      non_neg_integer(),
                                                                  Bind :: 0..1,
                                                                  Num ::
                                                                      non_neg_integer().

add(by_items, Flag, Role, ItemInfo) ->
    add_items(Flag, Role, ItemInfo);
add(by_base_id, Flag, Role, ItemInfo) ->
    add_base_id(Flag, Role, ItemInfo).

-spec add(Mode, Flag, #role{}, ItemInfo,
          no_push) -> full |
                      false |
                      {ok, #package{}, AddList} when Mode :: by_items |
                                                             by_base_id,
                                                     Flag :: bag |
                                                             store |
                                                             eqm |
                                                             casino,
                                                     ItemInfo :: [#item{}] |
                                                                 [{BaseId,
                                                                   Bind,
                                                                   Num}],
                                                     AddList :: [#item{}],
                                                     BaseId ::
                                                         non_neg_integer(),
                                                     Bind :: 0..1,
                                                     Num :: non_neg_integer().

add(by_items, Flag, Role, ItemInfo, no_push) ->
    add_no_push_items(Flag, Role, ItemInfo);
add(by_base_id, Flag, Role, ItemInfo, no_push) ->
    add_no_push_base_id(Flag, Role, ItemInfo).

-spec fetch(Pack, pos_integer(), #role{}) -> {ok,
                                              #item{}} |
                                             false when Pack :: 1 | 2 | 3.

fetch(1, Id, #role{p_bag = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
        Item = #item{id = Id} -> {ok, Item};
        false -> false
    end;
fetch(2, Id,
      #role{p_store = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
        Item = #item{id = Id} -> {ok, Item};
        false -> false
    end;
fetch(3, Id, #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
        Item = #item{id = Id} -> {ok, Item};
        false -> false
    end;
fetch(4, Id,
      #role{p_family_store = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
        Item = #item{id = Id} -> {ok, Item};
        false -> false
    end;
fetch(_, _, _) -> false.

-spec find(Mode, integer(), #package{}) -> false |
                                           {ok, #item{}} when Mode :: by_id |
                                                                      by_type |
                                                                      by_pos.

find(by_id, Id, #package{items = Items}) ->
    case lists:keyfind(Id, #item.id, Items) of
        Item = #item{id = Id} -> {ok, Item};
        false -> false
    end;
find(by_pos, Pos, #package{items = Items}) ->
    case lists:keyfind(Pos, #item.pos, Items) of
        Item = #item{pos = Pos} -> {ok, Item};
        false -> false
    end.

-spec count(Mode, integer(), #package{}) -> {[#item{}] |
                                             [],
                                             non_neg_integer()} when Mode ::
                                                                         by_base_id |
                                                                         by_type |
                                                                         by_base_id_fruit |
                                                                         by_id_lev_fruit.

count(by_base_id, BaseId, #package{items = Items}) ->
    do_count(by_base_id, BaseId, Items);
count(by_type, Type, #package{items = Items}) ->
    do_count(by_type, Type, Items);
count(by_base_id_fruit, BaseId,
      #package{items = Items}) ->
    do_count(by_base_id_fruit, BaseId, Items);
count(by_id_lev_fruit, Id,
      Package = #package{items = Items}) ->
    logger:debug("=======", [], package, 294),
    case find(by_id, Id, Package) of
        {ok,
         Item = #item{base_id = BaseId, extra = ExtraList}} ->
            {32, Lev, ""} = lists:keyfind(32, 1, ExtraList),
            case item_data:get(BaseId) of
                #item_base{effect = [{52, {BookId, _}} | _]} ->
                    logger:debug("=======", [], package, 300),
                    #handbook_base{lev_num1 = LevNum1, lev_num2 = LevNum2,
                                   lev_num3 = LevNum3} =
                        handbook_data:get(BookId),
                    NumL = {LevNum1, LevNum2, LevNum3},
                    AttrList = get_lev_attr(Lev, Item, NumL, []),
                    do_count(by_id_lev_fruit,
                             {BaseId, Lev, AttrList, NumL},
                             Items);
                _ -> {[], 0}
            end;
        _ -> {[], 0}
    end.

-spec find_bind_unbind(BaseId :: non_neg_integer(),
                       #package{}) -> {BindItems,
                                       UnBindItems,
                                       BindNum,
                                       UnBindNum} when BindItems :: [#item{}],
                                                       UnBindItems :: [#item{}],
                                                       BindNum ::
                                                           non_neg_integer(),
                                                       UnBindNum ::
                                                           non_neg_integer().

find_bind_unbind(BaseId, #package{items = Items}) ->
    do_find_bind_unbind(Items, BaseId, [], [], 0, 0).

do_find_bind_unbind([], _BaseId, BindItems, UnBindItems,
                    BindNum, UnBindNum) ->
    {BindItems, UnBindItems, BindNum, UnBindNum};
do_find_bind_unbind([Item = #item{bind = 1,
                                  quantity = N, base_id = BaseId}
                     | T],
                    BaseId, BindItems, UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T,
                        BaseId,
                        [Item | BindItems],
                        UnBindItems,
                        BindNum + N,
                        UnBindNum);
do_find_bind_unbind([Item = #item{quantity = N,
                                  base_id = BaseId}
                     | T],
                    BaseId, BindItems, UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T,
                        BaseId,
                        BindItems,
                        [Item | UnBindItems],
                        BindNum,
                        UnBindNum + N);
do_find_bind_unbind([_ | T], BaseId, BindItems,
                    UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T,
                        BaseId,
                        BindItems,
                        UnBindItems,
                        BindNum,
                        UnBindNum).

-spec fresh_item(#item{}, #item{}, #package{},
                 #role{}) -> {ok, #package{}, #item{}}.

fresh_item(OldItem, NewItem,
           Package = #package{type = 3, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id,
                                #item.id,
                                Items,
                                NewItem),
    push_item_info(update, Role, [{3, NewItem}]),
    {ok, Package#package{items = NewItems}, NewItem};
fresh_item(OldItem, NewItem,
           Package = #package{type = PackType,
                              free_cell = FreeCell, items = Items},
           Role) ->
    NewItems = lists:keyreplace(OldItem#item.id,
                                #item.id,
                                Items,
                                NewItem),
    push_item_info(update, Role, [{PackType, NewItem}]),
    case NewItem#item.pos =:= OldItem#item.pos of
        true ->
            {ok, Package#package{items = NewItems}, NewItem};
        false ->
            NewFreeCell = lists:sort([OldItem#item.pos | FreeCell --
                                                             [NewItem#item.pos]]),
            {ok,
             Package#package{items = NewItems,
                             free_cell = NewFreeCell},
             NewItem}
    end;
fresh_item(_, _, _, _) -> false.

fresh_eqm(OldItem, NewItem,
          Package = #package{type = 3, items = Items}) ->
    NewItems = lists:keyreplace(OldItem#item.id,
                                #item.id,
                                Items,
                                NewItem),
    {ok, Package#package{items = NewItems}}.

-spec replace_item(#item{}, #item{}, #package{},
                   #role{}) -> {ok, #package{}, #item{}}.

replace_item(OldItem, NewItem,
             Pack = #package{type = 3, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id,
                                #item.id,
                                Items,
                                NewItem),
    push_item_info(del, Role, [{3, OldItem}]),
    push_item_info(add, Role, [{3, NewItem}]),
    {ok, Pack#package{items = NewItems}, NewItem};
replace_item(OldItem, NewItem,
             Pack = #package{type = PackType, free_cell = FreeCell,
                             items = Items},
             Role) ->
    NewItems = lists:keyreplace(OldItem#item.id,
                                #item.id,
                                Items,
                                NewItem),
    push_item_info(del, Role, [{PackType, OldItem}]),
    push_item_info(add, Role, [{PackType, NewItem}]),
    case NewItem#item.pos =:= OldItem#item.pos of
        true -> {ok, Pack#package{items = NewItems}, NewItem};
        false ->
            NewFreeCell = lists:sort([OldItem#item.pos | FreeCell --
                                                             [NewItem#item.pos]]),
            {ok,
             Pack#package{items = NewItems, free_cell = NewFreeCell},
             NewItem}
    end;
replace_item(_, _, _, _) -> false.

-spec swap(Mode, PackageType, #role{}, pos_integer(),
           pos_integer()) -> {false, bitstring()} |
                             {ok, #role{}} when Mode :: same | diff,
                                                PackageType :: 1 | 2.

swap(same, PackageType,
     Role = #role{p_bag = Bag, p_store = Store,
                  p_family_store = FamilyStore},
     Id, Pos2) ->
    Package = case PackageType of
                  1 -> Bag#package{type = 1};
                  2 -> Store#package{type = 2};
                  4 -> FamilyStore#package{type = 4}
              end,
    case find(by_id, Id, Package) of
        false -> {false, ""};
        {ok, Sitem = #item{pos = Pos1}} ->
            case check_pos(Package, Pos1, Pos2) of
                true ->
                    case find(by_pos, Pos2, Package) of
                        false ->
                            do_swap_same(move,
                                         Package,
                                         Pos1,
                                         Sitem,
                                         Pos2,
                                         Role);
                        {ok, Titem} ->
                            do_swap_same(swap,
                                         Package,
                                         Pos1,
                                         Sitem,
                                         Pos2,
                                         Titem,
                                         Role)
                    end;
                false ->
                    logger:debug("============", [], package, 396),
                    {false, lang:get("目标位置不合法")}
            end
    end.

swap(diff, FromPackageType, PackageType,
     Role = #role{p_bag = Bag, p_store = Store,
                  p_family_store = FamilyStore},
     Id, Pos2) ->
    Spack = case FromPackageType of
                1 -> Bag;
                2 -> Store;
                4 -> FamilyStore
            end,
    Tpack = case PackageType of
                1 -> Bag;
                2 -> Store;
                4 -> FamilyStore
            end,
    case find(by_id, Id, Spack) of
        false -> {false, ""};
        {ok, Sitem = #item{pos = Pos1}} ->
            case check_black_list(FromPackageType, Sitem) of
                {false, Reason} -> {false, Reason};
                true ->
                    case check_pos(Spack, Pos1, Tpack, Pos2) of
                        true ->
                            case find(by_pos, Pos2, Tpack) of
                                false ->
                                    do_swap_diff(move,
                                                 Spack,
                                                 Pos1,
                                                 Sitem,
                                                 Tpack,
                                                 Pos2,
                                                 Role);
                                _ -> {false, lang:get("目标位置已有道具，请整理后再存入")}
                            end;
                        false ->
                            logger:debug("============", [], package, 433),
                            {false, lang:get("目标位置不合法")}
                    end
            end
    end.

-spec push_item_info(Mode, Send,
                     ItemList) -> ok when Mode :: add | del | update,
                                          Send :: #role{} | pid() | #link{},
                                          ItemList :: [{PackageType, #item{}}] |
                                                      [{PackageType,
                                                        [#item{}]}],
                                          PackageType :: 1 | 2 | 3.

push_item_info(Mode,
               #role{link = #link{conn_pid = ConnPid}}, ItemList) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(Mode, ConnPid, ItemList)
    when is_pid(ConnPid) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(Mode, #link{conn_pid = ConnPid},
               ItemList) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(_Mode, _Send, _Info) ->
    logger:error("错误的参数结构，无法推送物品更新通知[_Mode:~w, _Send:~w, "
                 "_Info:~w",
                 [_Mode, _Send, _Info],
                 package,
                 452),
    ok.

-spec split_item(Mode, #role{}, #item{},
                 non_neg_integer()) -> {ok, #role{}} |
                                       {false, bitstring()} when Mode :: bag |
                                                                         store |
                                                                         family_store.

split_item(bag,
           Role = #role{link = #link{conn_pid = ConnPid},
                        p_bag =
                            Bag = #package{items = Items, next_id = NextId,
                                           free_cell = FreeCell}},
           Item = #item{quantity = Q, pos = Pos}, Num)
    when Q >= Num andalso FreeCell =/= [] ->
    [NewCell | P] = FreeCell,
    NewAddItem = Item#item{id = NextId, quantity = Num,
                           pos = NewCell},
    NewItem = Item#item{quantity = Q - Num},
    {NewItems, NewFreeCell} = case Q =:= Num of
                                  true ->
                                      {[NewAddItem
                                        | lists:keydelete(Item#item.id,
                                                          #item.id,
                                                          Items)],
                                       [Pos | P]};
                                  false ->
                                      {[NewAddItem
                                        | lists:keyreplace(Item#item.id,
                                                           #item.id,
                                                           Items,
                                                           NewItem)],
                                       P}
                              end,
    case Q =:= Num of
        true -> push_item_info(del, ConnPid, [{1, NewItem}]);
        false -> push_item_info(update, ConnPid, [{1, NewItem}])
    end,
    push_item_info(add, ConnPid, [{1, NewAddItem}]),
    {ok,
     Role#role{p_bag =
                   Bag#package{items = NewItems, next_id = NextId + 1,
                               free_cell = lists:sort(NewFreeCell)}}};
split_item(store,
           Role = #role{link = #link{conn_pid = ConnPid},
                        p_store =
                            Store = #package{items = Items, next_id = NextId,
                                             free_cell = FreeCell}},
           Item = #item{quantity = Q, pos = Pos}, Num)
    when Q >= Num andalso FreeCell =/= [] ->
    [NewCell | P] = FreeCell,
    NewAddItem = Item#item{id = NextId, quantity = Num,
                           pos = NewCell},
    NewItem = Item#item{quantity = Q - Num},
    {NewItems, NewFreeCell} = case Q =:= Num of
                                  true ->
                                      {[NewAddItem
                                        | lists:keydelete(Item#item.id,
                                                          #item.id,
                                                          Items)],
                                       [Pos | P]};
                                  false ->
                                      {[NewAddItem
                                        | lists:keyreplace(Item#item.id,
                                                           #item.id,
                                                           Items,
                                                           NewItem)],
                                       P}
                              end,
    case Q =:= Num of
        true -> push_item_info(del, ConnPid, [{2, NewItem}]);
        false -> push_item_info(update, ConnPid, [{2, NewItem}])
    end,
    push_item_info(add, ConnPid, [{2, NewAddItem}]),
    {ok,
     Role#role{p_store =
                   Store#package{items = NewItems, next_id = NextId + 1,
                                 free_cell = lists:sort(NewFreeCell)}}};
split_item(family_store,
           Role = #role{link = #link{conn_pid = ConnPid},
                        p_family_store =
                            FamilyStore = #package{items = Items,
                                                   next_id = NextId,
                                                   free_cell = FreeCell}},
           Item = #item{quantity = Q, pos = Pos}, Num)
    when Q >= Num andalso FreeCell =/= [] ->
    [NewCell | P] = FreeCell,
    NewAddItem = Item#item{id = NextId, quantity = Num,
                           pos = NewCell},
    NewItem = Item#item{quantity = Q - Num},
    {NewItems, NewFreeCell} = case Q =:= Num of
                                  true ->
                                      {[NewAddItem
                                        | lists:keydelete(Item#item.id,
                                                          #item.id,
                                                          Items)],
                                       [Pos | P]};
                                  false ->
                                      {[NewAddItem
                                        | lists:keyreplace(Item#item.id,
                                                           #item.id,
                                                           Items,
                                                           NewItem)],
                                       P}
                              end,
    case Q =:= Num of
        true -> push_item_info(del, ConnPid, [{2, NewItem}]);
        false -> push_item_info(update, ConnPid, [{2, NewItem}])
    end,
    push_item_info(add, ConnPid, [{2, NewAddItem}]),
    {ok,
     Role#role{p_store =
                   FamilyStore#package{items = NewItems,
                                       next_id = NextId + 1,
                                       free_cell = lists:sort(NewFreeCell)}}};
split_item(_, _, _, _) -> {false, ""}.

-spec push_gain(GainList,
                #role{}) -> ok when GainList :: [{Type,
                                                  Add,
                                                  Del,
                                                  Update}],
                                    Type :: 1, Add :: [#item{}],
                                    Del :: [#item{}], Update :: [#item{}].

push_gain([], _Role) -> ok;
push_gain([{Type, Add, Del, Update} | T], Role) ->
    push_item_info(del, Role, [{Type, Del}]),
    push_item_info(add, Role, [{Type, Add}]),
    push_item_info(update, Role, [{Type, Update}]),
    push_gain(T, Role).

do_send_info(_Mode, _ConnPid, [], []) -> skip;
do_send_info(add, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid,
                       10310,
                       {lists:reverse(SendList)}),
    ok;
do_send_info(add, ConnPid,
             [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(add, ConnPid, T, NewSendList);
do_send_info(add, ConnPid, [{PackageType, Items} | T],
             SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(add, ConnPid, T, NewItemInfo ++ SendList);
do_send_info(del, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid,
                       10311,
                       {lists:reverse(SendList)}),
    ok;
do_send_info(del, ConnPid,
             [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(del, ConnPid, T, NewSendList);
do_send_info(del, ConnPid, [{PackageType, Items} | T],
             SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(del, ConnPid, T, NewItemInfo ++ SendList);
do_send_info(update, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid, 10312, {SendList}),
    ok;
do_send_info(update, ConnPid,
             [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(update, ConnPid, T, NewSendList);
do_send_info(update, ConnPid,
             [{PackageType, Items} | T], SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(update,
                 ConnPid,
                 T,
                 NewItemInfo ++ SendList).

do_swap_diff(move, Spack, Pos1,
             Sitem = #item{base_id = SBaseId, quantity = SNum},
             Tpack, Pos2, Role) ->
    case do_move(Sitem, Pos1, Pos2, Spack, Tpack, Role) of
        {NewSpack = #package{type = 1},
         NewTpack = #package{type = 2}} ->
            PackRole = Role#role{p_bag = NewSpack,
                                 p_store = NewTpack},
            FireRole = fire_item_loss_evt(PackRole, SBaseId, SNum),
            NewRole = FireRole,
            {ok, NewRole};
        {NewSpack = #package{type = 2},
         NewTpack = #package{type = 1}} ->
            PackRole = Role#role{p_store = NewSpack,
                                 p_bag = NewTpack},
            FireRole = fire_item_gain_evt(PackRole, SBaseId, SNum),
            NewRole = FireRole,
            {ok, NewRole};
        {NewSpack = #package{type = 1},
         NewTpack = #package{type = 4}} ->
            PackRole = Role#role{p_bag = NewSpack,
                                 p_family_store = NewTpack},
            FireRole = fire_item_loss_evt(PackRole, SBaseId, SNum),
            NewRole = FireRole,
            {ok, NewRole};
        {NewSpack = #package{type = 4},
         NewTpack = #package{type = 1}} ->
            PackRole = Role#role{p_family_store = NewSpack,
                                 p_bag = NewTpack},
            FireRole = fire_item_gain_evt(PackRole, SBaseId, SNum),
            NewRole = FireRole,
            {ok, NewRole};
        _ -> {false, lang:get("非法操作")}
    end.

do_move(Sitem, Pos1, Pos2,
        Spack = #package{free_cell = SfreeCell,
                         type = SpackType, items = Sitems},
        Tpack = #package{type = TpackType, items = Titems,
                         free_cell = TfreeCell, next_id = NextId},
        Role) ->
    NewNextId = find_move_next_id(NextId, Titems),
    NewItem = Sitem#item{id = NewNextId, pos = Pos2},
    NewSitems = lists:keydelete(Sitem#item.id,
                                #item.id,
                                Sitems),
    NewSfreeCell = lists:sort([Pos1 | SfreeCell]),
    NewTitems = [NewItem | Titems],
    NewTfreeCell = TfreeCell -- [Pos2],
    push_item_info(del, Role, [{SpackType, Sitem}]),
    push_item_info(add, Role, [{TpackType, NewItem}]),
    Title = case SpackType of
                1 ->
                    case TpackType of
                        2 -> "背包->仓库(移动)";
                        _ -> "背包->家园(移动)"
                    end;
                2 -> "仓库->背包(移动)";
                4 -> "家园->背包(移动)"
            end,
    log:package(Role, Title, Sitem, NewItem),
    {Spack#package{items = NewSitems,
                   free_cell = NewSfreeCell},
     Tpack#package{items = NewTitems,
                   free_cell = NewTfreeCell, next_id = NewNextId + 1}}.

find_move_next_id(NextId, []) -> NextId;
find_move_next_id(NextId, Titems) ->
    case lists:keymember(NextId, #item.id, Titems) of
        true -> find_move_next_id(NextId + 1, Titems);
        false -> NextId
    end.

fire_item_gain_evt(Role, BaseId, Num) ->
    Evt = #evt_get_item{base_id = BaseId, num = Num},
    role_trigger:fire(Evt, Role).

fire_item_loss_evt(Role, BaseId, Num) ->
    Evt = #evt_del_item{base_id = BaseId, num = Num},
    role_trigger:fire(Evt, Role).

do_swap_same(move, _, Pos, _, Pos, Role) -> {ok, Role};
do_swap_same(move, Package, _Pos1, Sitem, Pos2, Role) ->
    case fresh_item(Sitem,
                    Sitem#item{pos = Pos2},
                    Package,
                    Role)
        of
        {ok, NewPackage = #package{type = 1}, _} ->
            {ok, Role#role{p_bag = NewPackage}};
        {ok, NewPackage = #package{type = 2}, _} ->
            {ok, Role#role{p_store = NewPackage}};
        _ -> {false, lang:get("非法操作")}
    end.

do_swap_same(swap, _, Pos, _, Pos, _, Role) ->
    {ok, Role};
do_swap_same(swap, Package, Pos1, Sitem, Pos2, Titem,
             Role) ->
    case check_can_stack(Sitem, Titem) of
        false ->
            case do_swap_item(Sitem,
                              Titem,
                              Sitem#item{pos = Pos2},
                              Titem#item{pos = Pos1},
                              Package,
                              Role)
                of
                NewPackage = #package{type = 1} ->
                    {ok, Role#role{p_bag = NewPackage}};
                NewPackage = #package{type = 2} ->
                    {ok, Role#role{p_store = NewPackage}};
                _ -> {false, lang:get("非法操作")}
            end;
        {true, OverLap} ->
            case stack_item(Package, OverLap, Sitem, Titem, Role) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole} -> {ok, NewRole}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_swap_item(OldItem1, OldItem2, NewItem1, NewItem2,
             Package = #package{type = PackType, items = Items},
             Role) ->
    NewItems1 = lists:keyreplace(OldItem1#item.id,
                                 #item.id,
                                 Items,
                                 NewItem1),
    NewItems2 = lists:keyreplace(OldItem2#item.id,
                                 #item.id,
                                 NewItems1,
                                 NewItem2),
    push_item_info(update, Role, [{PackType, NewItem1}]),
    push_item_info(update, Role, [{PackType, NewItem2}]),
    Package#package{items = NewItems2}.

do_stack_item(OldItem1 = #item{pos = Pos}, OldItem2,
              NewItem2,
              Package = #package{type = PackType,
                                 free_cell = FreeCell, items = Items},
              Role) ->
    NewItems1 = lists:keydelete(OldItem1#item.id,
                                #item.id,
                                Items),
    NewItems2 = lists:keyreplace(OldItem2#item.id,
                                 #item.id,
                                 NewItems1,
                                 NewItem2),
    push_item_info(del, Role, [{PackType, OldItem1}]),
    push_item_info(update, Role, [{PackType, NewItem2}]),
    Package#package{free_cell =
                        lists:sort([Pos | FreeCell]),
                    items = NewItems2}.

stack_item(Package, OverLap,
           Item1 = #item{quantity = Num1},
           Item2 = #item{quantity = Num2}, Role) ->
    if Num2 =:= OverLap -> {false, lang:get("目标堆叠数已满")};
       Num1 + Num2 =< OverLap ->
           NewItem2 = Item2#item{quantity = Num1 + Num2},
           case do_stack_item(Item1,
                              Item2,
                              NewItem2,
                              Package,
                              Role)
               of
               NewPackage = #package{type = 1} ->
                   {ok, Role#role{p_bag = NewPackage}};
               NewPackage = #package{type = 2} ->
                   {ok, Role#role{p_store = NewPackage}};
               _ -> {false, lang:get("非法操作")}
           end;
       Num1 + Num2 > OverLap ->
           NewItem1 = Item1#item{quantity = Num1 + Num2 - OverLap},
           NewItem2 = Item2#item{quantity = OverLap},
           case do_swap_item(Item1,
                             Item2,
                             NewItem1,
                             NewItem2,
                             Package,
                             Role)
               of
               NewPackage = #package{type = 1} ->
                   {ok, Role#role{p_bag = NewPackage}};
               NewPackage = #package{type = 2} ->
                   {ok, Role#role{p_store = NewPackage}};
               _ -> {false, lang:get("非法操作")}
           end;
       true -> {false, lang:get("非法操作")}
    end.

check_can_stack(#item{quantity = Q1, bind = Bind,
                      base_id = BaseId},
                #item{quantity = Q2, bind = Bind, base_id = BaseId}) ->
    case item_data:get(BaseId) of
        #item_base{overlap = OverLap} ->
            case Q1 =:= OverLap andalso Q2 =/= OverLap orelse
                     OverLap =:= 1
                of
                true -> false;
                false -> {true, OverLap}
            end;
        _ -> {false, lang:get("不存在该物品")}
    end;
check_can_stack(_, _) -> false.

check_pos(#package{volume = Volume, type = 4}, Pos1,
          Pos2) ->
    Pos1 >= 1 andalso Pos2 >= 1 andalso Pos2 =< Volume;
check_pos(#package{volume = Volume}, Pos1, Pos2) ->
    Pos1 >= 1 andalso
        Pos1 =< Volume andalso Pos2 >= 1 andalso Pos2 =< Volume.

check_pos(#package{type = 4}, Pos1,
          #package{volume = Volume2}, Pos2) ->
    Pos1 >= 1 andalso Pos2 >= 1 andalso Pos2 =< Volume2;
check_pos(#package{volume = Volume1}, Pos1,
          #package{volume = Volume2}, Pos2) ->
    Pos1 >= 1 andalso
        Pos1 =< Volume1 andalso
            Pos2 >= 1 andalso Pos2 =< Volume2.

do_count(Mode, Key, Items) ->
    do_count(Mode, Key, Items, [], 0).

do_count(_, _, [], Result, Num) -> {Result, Num};
do_count(by_base_id, BaseId,
         [Item = #item{base_id = BaseId, quantity = Quantity}
          | T],
         Result, Num) ->
    do_count(by_base_id,
             BaseId,
             T,
             [Item | Result],
             Num + Quantity);
do_count(by_type, Type,
         [Item = #item{type = Type, quantity = Quantity} | T],
         Result, Num) ->
    do_count(by_type,
             Type,
             T,
             [Item | Result],
             Num + Quantity);
do_count(by_base_id_fruit, BaseId,
         [Item = #item{base_id = BaseId, quantity = Quantity,
                       extra = ExtraList}
          | T],
         Result, Num) ->
    case lists:keyfind(32, 1, ExtraList) of
        {32, Lev, ""} when Lev >= 1 ->
            do_count(by_base_id_fruit, BaseId, T, Result, Num);
        _ ->
            do_count(by_base_id_fruit,
                     BaseId,
                     T,
                     [Item | Result],
                     Num + Quantity)
    end;
do_count(by_id_lev_fruit,
         Key = {BaseId, Lev, AttrList, NumL},
         [Item = #item{base_id = BaseId, quantity = Quantity,
                       extra = ExtraList}
          | T],
         Result, Num) ->
    logger:debug("~w", [Key], package, 866),
    case lists:keyfind(32, 1, ExtraList) of
        {32, Lev, ""} ->
            AttrList2 = get_lev_attr(Lev, Item, NumL, []),
            case length(AttrList2) - length(AttrList) =:= 0 andalso
                     AttrList2 -- AttrList =:= []
                of
                true ->
                    do_count(by_id_lev_fruit,
                             Key,
                             T,
                             [Item | Result],
                             Num + Quantity);
                _ -> do_count(by_id_lev_fruit, Key, T, Result, Num)
            end;
        _ -> do_count(by_id_lev_fruit, Key, T, Result, Num)
    end;
do_count(Mode, Key, [_ | T], Result, Num) ->
    do_count(Mode, Key, T, Result, Num).

add_no_push_items(bag, #role{p_bag = Bag}, Items) ->
    do_add_no_push_items(Bag, Items, []);
add_no_push_items(store, #role{p_store = Store},
                  Items) ->
    do_add_no_push_items(Store, Items, []);
add_no_push_items(family_store,
                  #role{p_family_store = FamilyStore}, Items) ->
    do_add_no_push_items(FamilyStore, Items, []);
add_no_push_items(eqm, #role{p_eqm = Eqm}, Items) ->
    do_add_no_push_items(Eqm, Items, []).

add_no_push_base_id(bag, #role{p_bag = Bag}, Items) ->
    do_add_no_push_base_id(Bag, Items, []);
add_no_push_base_id(store, #role{p_store = Store},
                    Items) ->
    do_add_no_push_base_id(Store, Items, []);
add_no_push_base_id(family_store,
                    #role{p_family_store = FamilyStore}, Items) ->
    do_add_no_push_base_id(FamilyStore, Items, []).

do_add_no_push_items(Package, [], AddItems) ->
    {ok, Package, AddItems};
do_add_no_push_items(Package, [H | T], AddItems) ->
    case do_add(Package, H, AddItems) of
        full -> full;
        false -> false;
        {ok, NewPackage, NewAddItems} ->
            do_add_no_push_items(NewPackage, T, NewAddItems)
    end.

do_add_no_push_base_id(Package, [], Items) ->
    do_add_no_push_items(Package, Items, []);
do_add_no_push_base_id(Package,
                       [{BaseId, Bind, Num} | T], Items) ->
    case item:make(BaseId, Bind, Num) of
        false ->
            logger:debug("不存在的物品: ~w", [BaseId], package, 918),
            false;
        {ok, NewItems} ->
            do_add_no_push_base_id(Package, T, NewItems ++ Items)
    end;
do_add_no_push_base_id(Package,
                       [H = #{base_id := _BaseId, bind := _Bind,
                              quantity := _Num}
                        | T],
                       Items) ->
    logger:debug("物品配置  ~w", [H], package, 924),
    case item:make(H) of
        false -> false;
        {ok, NewItems} ->
            do_add_no_push_base_id(Package, T, NewItems ++ Items)
    end;
do_add_no_push_base_id(_Package, [_ | _T], _Items) ->
    false.

add_items(bag, #role{p_bag = Bag, link = Link},
          Items) ->
    add_package(Bag, Link, Items);
add_items(store, #role{p_store = Store, link = Link},
          Items) ->
    add_package(Store, Link, Items);
add_items(family_store,
          #role{p_family_store = FamilyStore, link = Link},
          Items) ->
    add_package(FamilyStore, Link, Items);
add_items(eqm, #role{p_eqm = Eqm, link = Link},
          Items) ->
    add_package(Eqm, Link, Items).

add_base_id(Flag, Role, ItemInfo) ->
    add_base_id(Flag, Role, ItemInfo, []).

add_base_id(Flag, Role, [], Items) ->
    add_items(Flag, Role, Items);
add_base_id(Flag, Role, [{BaseId, Bind, Num} | T],
            Items) ->
    case item:make(BaseId, Bind, Num) of
        false -> false;
        {ok, NewItems} ->
            add_base_id(Flag, Role, T, NewItems ++ Items)
    end;
add_base_id(Flag, Role,
            [H = #{base_id := _BaseId, bind := _Bind,
                   quantity := _Num}
             | T],
            Items) ->
    logger:debug("物品配置  ~w", [H], package, 955),
    case item:make(H) of
        false -> false;
        {ok, NewItems} ->
            add_base_id(Flag, Role, T, NewItems ++ Items)
    end;
add_base_id(_Flag, _Role, [_H | _T], _Items) ->
    logger:debug("物品配置  ~w", [_H], package, 962),
    false.

add_package(Package, Link, Items) ->
    add_package(Package, Link, Items, []).

add_package(Package = #package{type = Type}, Link, [],
            BackItems) ->
    push_item_info(add, Link, [{Type, BackItems}]),
    {ok, Package};
add_package(Package, Link, [H | T], BackItems) ->
    case do_add(Package, H, BackItems) of
        false -> false;
        full -> full;
        {ok, NewPackage, NewBackItems} ->
            add_package(NewPackage, Link, T, NewBackItems)
    end.

do_add(Package = #package{type = 3, items = Items},
       Item = #item{id = Id}, BackItems) ->
    case lists:keyfind(Id, #item.id, Items) of
        false ->
            {ok,
             Package#package{items = [Item | Items]},
             [Item | BackItems]};
        _ ->
            logger:error("身上已有同ID装备，无法再次加入 ID:~w",
                         [Id],
                         package,
                         985),
            false
    end;
do_add(#package{free_cell = []}, _Item, _BackItems) ->
    full;
do_add(Package = #package{next_id = NextId,
                          free_cell = [Pos | FreeCell], items = Items},
       Item, BackItems) ->
    I = Item#item{id = NextId, pos = Pos},
    NewI = case I#item.bind of
               1 -> I;
               _ -> market_gold:fill_item_price(I)
           end,
    {ok,
     Package#package{next_id = NextId + 1,
                     free_cell = FreeCell, items = [NewI | Items]},
     [NewI | BackItems]}.

check_is_full(bag, #role{p_bag = Bag}) ->
    check_is_full(Bag);
check_is_full(store, #role{p_store = Store}) ->
    check_is_full(Store);
check_is_full(family_store,
              #role{p_family_store = FamilyStore}) ->
    check_is_full(FamilyStore);
check_is_full(eqm, #role{p_eqm = Eqm}) ->
    check_is_full(Eqm).

check_is_full(#package{free_cell = []}) -> true;
check_is_full(_Package) -> false.

del_by_id(Package = #package{type = 3}, ItemInfo) ->
    do_del_eqm(Package, ItemInfo, []);
del_by_id(Package, ItemInfo) ->
    do_del_by_id(Package, ItemInfo, [], []).

do_del_by_id(Package, [], DelList, FreshList) ->
    {ok, Package, DelList, FreshList};
do_del_by_id(Package, [{ItemId, Num} | T], DelList,
             FreshList) ->
    case do_del_by_id(Package,
                      ItemId,
                      Num,
                      DelList,
                      FreshList)
        of
        {false, Reason} -> {false, Reason};
        {ok, NewPackage, NewDelList, NewFreshList} ->
            do_del_by_id(NewPackage, T, NewDelList, NewFreshList)
    end.

do_del_by_id(Package = #package{free_cell = FreeCell,
                                items = Items},
             ItemId, Num, DelList, FreshList)
    when Num > 0 ->
    SortItem = lists:sort(fun sort_item_by_bind/2, Items),
    case do_del_by_id(SortItem,
                      [],
                      ItemId,
                      [],
                      Num,
                      DelList,
                      FreshList)
        of
        {false, Reason} -> {false, Reason};
        {ok, NewItems, NewFreeCell, NewDelList, NewFreshList} ->
            F = lists:sort(NewFreeCell ++ FreeCell),
            {ok,
             Package#package{free_cell = F, items = NewItems},
             NewDelList,
             NewFreshList}
    end;
do_del_by_id(_Package, _, _, _, _) ->
    {false, lang:get("无法扣除0个物品")}.

do_del_by_id([], _Items, _ItemId, _NewFreeCell, _Num,
             _DelList, _FreshList) ->
    {false, lang:get("未发现物品")};
do_del_by_id([Item = #item{id = Fid, quantity = Q,
                           pos = Pos}
              | T],
             Items, Fid, NewFreeCell, Num, DelList, FreshList) ->
    N = Q - Num,
    if N =:= 0 ->
           {ok,
            T ++ Items,
            [Pos | NewFreeCell],
            [Item | DelList],
            FreshList};
       N > 0 ->
           {ok,
            [Item#item{quantity = N} | T] ++ Items,
            NewFreeCell,
            DelList,
            [Item#item{quantity = N} | FreshList]};
       true -> {false, lang:get("数量不足，无法扣除")}
    end;
do_del_by_id([Item | T], Items, Id, NewFreeCell, Num,
             DelList, FreshList) ->
    do_del_by_id(T,
                 [Item | Items],
                 Id,
                 NewFreeCell,
                 Num,
                 DelList,
                 FreshList).

do_del_eqm(Package, [], DelList) ->
    {ok, Package, DelList};
do_del_eqm(Package, [{ItemId, 1} | T], DelList) ->
    case do_del_eqm(Package, ItemId, 1, DelList) of
        {false, Reason} -> {false, Reason};
        {ok, NewPackage, NewDelList} ->
            do_del_eqm(NewPackage, T, NewDelList)
    end;
do_del_eqm(_Package, [{_ItemId, _Num} | _T],
           _DelList) ->
    {false, lang:get("数量不正确, 扣除失败")}.

do_del_eqm(Package = #package{items = Items}, ItemId,
           _Num, DelList) ->
    case lists:keyfind(ItemId, #item.id, Items) of
        OffItem = #item{id = ItemId} ->
            {ok,
             Package#package{items =
                                 lists:keydelete(ItemId, #item.id, Items)},
             [OffItem | DelList]};
        _ -> {false, lang:get("未发现该装备")}
    end.

del_all_by_base_id(Package, ItemInfo) ->
    do_del_all_by_base_id(Package, ItemInfo, []).

do_del_all_by_base_id(Package = #package{free_cell =
                                             FreeCell},
                      [], DelList) ->
    NewFreeCell = lists:sort(FreeCell),
    {ok, Package#package{free_cell = NewFreeCell}, DelList};
do_del_all_by_base_id(Package = #package{free_cell =
                                             FreeCell,
                                         items = Items},
                      [BaseId | T], DelList) ->
    Fun = fun (I = #item{base_id = IB, pos = Pos},
               {ItemL, DelL, FreeL}) ->
                  case IB of
                      BaseId -> {ItemL, [I | DelL], [Pos | FreeL]};
                      _ -> {[I | ItemL], DelL, FreeL}
                  end
          end,
    {NewItems, NewDelList, NewFreeCell} = lists:foldl(Fun,
                                                      {[], DelList, FreeCell},
                                                      Items),
    do_del_all_by_base_id(Package#package{free_cell =
                                              NewFreeCell,
                                          items = NewItems},
                          T,
                          NewDelList).

del_by_base_id(Package, ItemInfo) ->
    do_del_by_base_id(Package, ItemInfo, [], []).

do_del_by_base_id(Package, [], DelList, FreshList) ->
    {ok, Package, DelList, FreshList};
do_del_by_base_id(Package, [{BaseId, Num} | T], DelList,
                  FreshList) ->
    case do_del_by_base_id(Package,
                           BaseId,
                           Num,
                           DelList,
                           FreshList)
        of
        {false, Reason} -> {false, Reason};
        {ok, NewPackage, NewDelList, NewFreshList} ->
            do_del_by_base_id(NewPackage,
                              T,
                              NewDelList,
                              NewFreshList)
    end.

do_del_by_base_id(Package = #package{free_cell =
                                         FreeCell,
                                     items = Items},
                  BaseId, Num, DelList, FreshList)
    when Num > 0 ->
    SortItem1 = lists:sort(fun sort_item_by_bind/2, Items),
    SortItem2 = case item_data:get(BaseId) of
                    #item_base{type = 118} ->
                        lists:sort(fun sort_item_by_step/2, SortItem1);
                    _ -> SortItem1
                end,
    case do_del_by_base_id(SortItem2,
                           [],
                           BaseId,
                           [],
                           Num,
                           DelList,
                           FreshList)
        of
        {false, Reason} -> {false, Reason};
        {ok, NewItems, NewFreeCell, NewDelList, NewFreshList} ->
            F = lists:sort(NewFreeCell ++ FreeCell),
            {ok,
             Package#package{free_cell = F, items = NewItems},
             NewDelList,
             NewFreshList}
    end;
do_del_by_base_id(_Package, _, _, _, _) ->
    {false, lang:get("无法扣除0个物品")}.

do_del_by_base_id([], _Items, BaseId, _NewFreeCell, Num,
                  _DelList, _FreshList)
    when Num > 0 ->
    {false,
     util:flist(lang:get("物品[~ts]不足"),
                [item:attr(name, BaseId)])};
do_del_by_base_id([Item = #item{base_id = BaseId,
                                quantity = Q, pos = Pos}
                   | T],
                  Items, BaseId, NewFreeCell, Num, DelList, FreshList) ->
    N = Q - Num,
    if N =:= 0 ->
           {ok,
            T ++ Items,
            [Pos | NewFreeCell],
            [Item | DelList],
            FreshList};
       N > 0 ->
           {ok,
            [Item#item{quantity = N} | T] ++ Items,
            NewFreeCell,
            DelList,
            [Item#item{quantity = N} | FreshList]};
       true ->
           do_del_by_base_id(T,
                             Items,
                             BaseId,
                             [Pos | NewFreeCell],
                             Num - Q,
                             [Item | DelList],
                             FreshList)
    end;
do_del_by_base_id([Item | T], Items, BaseId,
                  NewFreeCell, Num, DelList, FreshList) ->
    do_del_by_base_id(T,
                      [Item | Items],
                      BaseId,
                      NewFreeCell,
                      Num,
                      DelList,
                      FreshList).

check_black_list(1, #item{base_id = BaseId}) ->
    BlackList = item_data:get_store_black(),
    case lists:member(BaseId, BlackList) of
        true ->
            Msg = notice:format(lang:get("~ts不能存入仓库"),
                                [{item_2, BaseId}]),
            {false, Msg};
        false -> true
    end;
check_black_list(_, _) -> true.

add_new_pos(SortItem, FreeCell) ->
    add_new_pos(SortItem, FreeCell, []).

add_new_pos([], FreeCell, NewItems) ->
    {FreeCell, NewItems};
add_new_pos(_, FreeCell = [], NewItems) ->
    {FreeCell, NewItems};
add_new_pos([I | T], [Pos | FreeCell], NewItems) ->
    add_new_pos(T,
                FreeCell,
                [I#item{pos = Pos} | NewItems]).

check_sort_result(Role, PackageType, Items, NewItems) ->
    do_check_sort_result(Role,
                         PackageType,
                         Items,
                         NewItems,
                         [],
                         []).

do_check_sort_result(Role, PackageType, [], _NewItems,
                     FreshList, DelList) ->
    push_item_info(del, Role, [{PackageType, DelList}]),
    push_item_info(update,
                   Role,
                   [{PackageType, FreshList}]),
    ok;
do_check_sort_result(Role, PackageType,
                     [Item = #item{id = Id, quantity = Quantity, pos = Pos}
                      | T],
                     NewItems, FreshList, DelList) ->
    case lists:keyfind(Id, #item.id, NewItems) of
        false ->
            do_check_sort_result(Role,
                                 PackageType,
                                 T,
                                 NewItems,
                                 FreshList,
                                 [Item | DelList]);
        #item{id = Id, quantity = Quantity, pos = Pos} ->
            do_check_sort_result(Role,
                                 PackageType,
                                 T,
                                 NewItems,
                                 FreshList,
                                 DelList);
        NewItem = #item{quantity = Quantity1, pos = Pos1}
            when Quantity =/= Quantity1 orelse Pos =/= Pos1 ->
            do_check_sort_result(Role,
                                 PackageType,
                                 T,
                                 NewItems,
                                 [NewItem | FreshList],
                                 DelList);
        _ ->
            do_check_sort_result(Role,
                                 PackageType,
                                 T,
                                 NewItems,
                                 FreshList,
                                 DelList)
    end.

combine([], Rtn) -> lists:reverse(Rtn);
combine([I = #item{base_id = BaseId, quantity = Q,
                   bind = Bind, step = Step}
         | T],
        Rtn) ->
    case item_data:get(BaseId) of
        #item_base{overlap = O} when O > 1 andalso Q =/= O ->
            {Same, Other} = find_same(T,
                                      BaseId,
                                      Bind,
                                      Step,
                                      [],
                                      []),
            FindSame = [I | Same],
            NewSame = mark_same_item_market_gold_price(FindSame,
                                                       FindSame,
                                                       []),
            L = do_combine(NewSame, O, []),
            combine(Other, L ++ Rtn);
        _ -> combine(T, [I | Rtn])
    end.

find_same([], _BaseId, _Bind, _Step, Same, Other) ->
    {Same, Other};
find_same([I = #item{base_id = BaseId, bind = Bind,
                     step = Step}
           | T],
          BaseId, Bind, Step, Same, Other) ->
    find_same(T, BaseId, Bind, Step, [I | Same], Other);
find_same([I | T], BaseId, Bind, Step, Same, Other) ->
    find_same(T, BaseId, Bind, Step, Same, [I | Other]).

do_combine([#item{quantity = Q}], _O, Sorted)
    when Q =:= 0 ->
    Sorted;
do_combine([I], _O, Sorted) -> [I | Sorted];
do_combine([I1 = #item{quantity = Q1},
            I2 = #item{quantity = Q2}
            | T],
           O, Sorted) ->
    Q = Q1 + Q2,
    case Q >= O of
        true ->
            NewI1 = I1#item{quantity = O},
            do_combine([I2#item{quantity = Q - O} | T],
                       O,
                       [NewI1 | Sorted]);
        false ->
            NewI1 = I1#item{quantity = Q},
            do_combine([NewI1 | T], O, Sorted)
    end.

merge(List) -> merge(List, []).

merge([], Rtn) -> Rtn;
merge([{BaseId, Q} | T], Rtn) ->
    NewRtn = do_merge(Rtn, BaseId, Q, []),
    merge(T, NewRtn).

do_merge([], BaseId, Q, NewRtn) ->
    [{BaseId, Q} | NewRtn];
do_merge([{BaseId, N} | T], BaseId, Q, NewRtn) ->
    lists:reverse(NewRtn) ++ [{BaseId, N + Q} | T];
do_merge([{BaseId2, N} | T], BaseId, Q, NewRtn) ->
    do_merge(T, BaseId, Q, [{BaseId2, N} | NewRtn]).

sort_type(#item{type = T1}, #item{type = T2})
    when T1 < T2 ->
    true;
sort_type(Item1 = #item{type = Type},
          Item2 = #item{type = Type}) ->
    sort_baseid(Item1, Item2);
sort_type(_, _) -> false.

sort_baseid(#item{base_id = BaseId1},
            #item{base_id = BaseId2})
    when BaseId1 < BaseId2 ->
    true;
sort_baseid(Item1 = #item{base_id = BaseId},
            Item2 = #item{base_id = BaseId}) ->
    sort_id(Item1, Item2);
sort_baseid(_, _) -> false.

sort_id(#item{id = Id1}, #item{id = Id2})
    when Id1 < Id2 ->
    true;
sort_id(_, _) -> false.

sort_pos(#item{pos = Pos1}, #item{pos = Pos2})
    when Pos1 < Pos2 ->
    true;
sort_pos(_, _) -> false.

sort_item_by_bind(#item{bind = Bind1},
                  #item{bind = Bind2})
    when Bind1 > Bind2 ->
    true;
sort_item_by_bind(Item1 = #item{bind = Bind},
                  Item2 = #item{bind = Bind}) ->
    sort_pos(Item1, Item2);
sort_item_by_bind(_, _) -> false.

sort_item_by_step(#item{step = Step},
                  #item{step = Step2})
    when Step < Step2 ->
    true;
sort_item_by_step(Item1 = #item{step = Step},
                  Item2 = #item{step = Step}) ->
    sort_pos(Item1, Item2);
sort_item_by_step(_, _) -> false.

calc_same_source_price([], _ItemBaseId, _Num, _Price,
                       _PriceList, _OverLap, _Source, 0) ->
    false;
calc_same_source_price([], _ItemBaseId, _Num, _Price,
                       PriceList, _OverLap, Source,
                       FindItem = #item{extra = ExtraList}) ->
    case lists:keyfind(2, 1, ExtraList) of
        {2, Source, _Str} ->
            case calc_market_gold_avg_price(PriceList, 0, 0) of
                {ok, AvgPrice} ->
                    [NewFindItem] = set_market_gold_price([FindItem],
                                                          AvgPrice,
                                                          []),
                    NewFindItem;
                _ -> FindItem
            end;
        _False -> FindItem
    end;
calc_same_source_price([Item = #item{base_id =
                                         ItemBaseId,
                                     quantity = Q, extra = ExtraList, bind = 0}
                        | Rest],
                       ItemBaseId, Num, Price, PriceList, OverLap, Source, 0)
    when Q + Num =< OverLap ->
    {NewPrice, NewPriceList, NewFindItem} = case
                                                lists:keyfind(2, 1, ExtraList)
                                                of
                                                {2, Source, _Str} ->
                                                    case lists:keyfind(1,
                                                                       1,
                                                                       ExtraList)
                                                        of
                                                        {1, ExtPrice, _Str}
                                                            when ExtPrice <
                                                                     Price ->
                                                            {ExtPrice,
                                                             [{ExtPrice, Q}
                                                              | PriceList],
                                                             Item};
                                                        {1, ExtPrice, _Str} ->
                                                            {Price,
                                                             [{ExtPrice, Q}
                                                              | PriceList],
                                                             Item};
                                                        _False ->
                                                            {Price,
                                                             [{0, Q}
                                                              | PriceList],
                                                             0}
                                                    end;
                                                _False ->
                                                    {Price,
                                                     [{0, Q} | PriceList],
                                                     0}
                                            end,
    calc_same_source_price(Rest,
                           ItemBaseId,
                           Num,
                           NewPrice,
                           NewPriceList,
                           OverLap,
                           Source,
                           NewFindItem);
calc_same_source_price([Item = #item{base_id =
                                         ItemBaseId,
                                     quantity = Q, extra = ExtraList,
                                     pos = Pos1, bind = 0}
                        | Rest],
                       ItemBaseId, Num, Price, PriceList, OverLap, Source,
                       FindItem = #item{pos = Pos2})
    when Q + Num =< OverLap andalso Pos1 < Pos2 ->
    {NewPrice, NewPriceList, NewFindItem} = case
                                                lists:keyfind(2, 1, ExtraList)
                                                of
                                                {2, _Source, _Str} ->
                                                    case lists:keyfind(1,
                                                                       1,
                                                                       ExtraList)
                                                        of
                                                        {1, ExtPrice, _Str}
                                                            when ExtPrice <
                                                                     Price ->
                                                            {Price,
                                                             [{ExtPrice, Q}
                                                              | PriceList],
                                                             Item};
                                                        {1, ExtPrice, _Str} ->
                                                            {Price,
                                                             [{ExtPrice, Q}
                                                              | PriceList],
                                                             FindItem};
                                                        _False ->
                                                            {Price,
                                                             [{0, Q}
                                                              | PriceList],
                                                             FindItem}
                                                    end;
                                                _False ->
                                                    {Price,
                                                     [{0, Q} | PriceList],
                                                     FindItem}
                                            end,
    calc_same_source_price(Rest,
                           ItemBaseId,
                           Num,
                           NewPrice,
                           NewPriceList,
                           OverLap,
                           Source,
                           NewFindItem);
calc_same_source_price([_Item | Rest], ItemBaseId, Num,
                       Price, PriceList, OverLap, Source, FindItem) ->
    calc_same_source_price(Rest,
                           ItemBaseId,
                           Num,
                           Price,
                           PriceList,
                           OverLap,
                           Source,
                           FindItem).

mark_same_item_market_gold_price([], Items, AccPrice) ->
    case calc_market_gold_avg_price(AccPrice, 0, 0) of
        {ok, AvgPrice} ->
            set_market_gold_price(Items, AvgPrice, []);
        _ -> Items
    end;
mark_same_item_market_gold_price([#item{base_id =
                                            BaseId,
                                        extra = ExtraList, quantity = Q}
                                  | Rest],
                                 Items, AccPrice) ->
    NewAccPrice = case lists:keyfind(2, 1, ExtraList) of
                      {2, 1, _Str} ->
                          case lists:keyfind(1, 1, ExtraList) of
                              {1, ExtPrice, _Str} -> [{ExtPrice, Q} | AccPrice];
                              _False ->
                                  case market_gold:get_price(BaseId) of
                                      SalePrice when is_integer(SalePrice) ->
                                          [{SalePrice, Q} | AccPrice];
                                      _ -> [{0, Q} | AccPrice]
                                  end
                          end;
                      _False -> [{0, Q} | AccPrice]
                  end,
    mark_same_item_market_gold_price(Rest,
                                     Items,
                                     NewAccPrice).

calc_market_gold_avg_price([], 0, _Sum) -> false;
calc_market_gold_avg_price([], _, 0) -> false;
calc_market_gold_avg_price([], Len, Sum) ->
    AvgPrice = util:floor(Sum / Len),
    logger:debug("堆叠后价格[avg:~w][sum:~w][len:~w]",
                 [AvgPrice, Sum, Len],
                 package,
                 1341),
    {ok, AvgPrice};
calc_market_gold_avg_price([{Price, Num} | Rest], Len,
                           Sum) ->
    calc_market_gold_avg_price(Rest,
                               Len + Num,
                               Sum + Price * Num).

set_market_gold_price([], _Price, Items) -> Items;
set_market_gold_price([Item = #item{extra = ExtraList}
                       | Rest],
                      Price, Items) ->
    NewPrice = {1, Price, ""},
    NewExtraList = lists:keystore(1,
                                  1,
                                  ExtraList,
                                  NewPrice),
    NewItems = [Item#item{extra = NewExtraList} | Items],
    set_market_gold_price(Rest, Price, NewItems).

get_lev_attr(Lev, #item{}, _NumL, List) when Lev =< 0 ->
    List;
get_lev_attr(Lev, Item = #item{extra = ExtraList},
             NumL = {LevNum1, LevNum2, LevNum3}, List) ->
    logger:debug("==========", [], package, 1357),
    {Lable, LevNum} = case Lev of
                          1 -> {33, LevNum1};
                          2 -> {34, LevNum2};
                          _ -> {35, LevNum3}
                      end,
    NList = case lists:keyfind(Lable, 1, ExtraList) of
                {Lable, Attr, ""} ->
                    case lists:keyfind(Attr, 1, List) of
                        {Attr, OVal} ->
                            lists:keystore(Attr,
                                           1,
                                           List,
                                           {Attr, OVal + LevNum});
                        _ -> [{Attr, LevNum} | List]
                    end;
                _ -> List
            end,
    get_lev_attr(Lev - 1, Item, NumL, NList).

