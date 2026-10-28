-file("src/mod/rencounter/rencounter_agent.erl", 1).

-module(rencounter_agent).

-behaviour(gen_server).

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

-file("src/mod/rencounter/rencounter_agent.erl", 11).

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

-file("src/mod/rencounter/rencounter_agent.erl", 12).

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

-file("src/mod/rencounter/rencounter_agent.erl", 13).

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

-file("src/mod/rencounter/rencounter_agent.erl", 14).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([info/1,
         call/1,
         start_link/0,
         get_rencounter_status/0,
         lookup_rencounter_role/1,
         lookup_rank/1,
         lookup_local_rank/1,
         get_season_start_end_time/0,
         update_rencounter_role/1]).

-record(state, {is_init = false, status = 0}).

init([]) ->
    logger:info("启动英雄擂台...", [], rencounter_agent, 35),
    dets:open_file(rencounter_role,
                   [{file, "./dets/rencounter_role.dets"},
                    {keypos, #rencounter_role.id}]),
    ets:new(rencounter_role,
            [set,
             named_table,
             public,
             {keypos, #rencounter_role.id}]),
    dets:to_ets(rencounter_role, rencounter_role),
    dets:open_file(rencounter_rank,
                   [{file, "./dets/rencounter_rank.dets"}, {keypos, 1}]),
    ets:new(rencounter_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(rencounter_rank, rencounter_rank),
    dets:open_file(rencounter_local_rank,
                   [{file, "./dets/rencounter_local_rank.dets"},
                    {keypos, 1}]),
    ets:new(rencounter_local_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(rencounter_local_rank,
                rencounter_local_rank),
    State = #state{},
    {WorldLev, _} = world_lev:get_world_lev(),
    case WorldLev >= 65 - 5 of
        true -> info(init_status);
        false -> ok
    end,
    case env:get(rencounter_season_id) of
        undefined -> env:save(rencounter_season_id, 1);
        _ -> ok
    end,
    logger:info("启动英雄擂台完成...", [], rencounter_agent, 67),
    {ok, State}.

handle_call({get_upgrade_reward, RoleId, TargetRankLev},
            _From, State) ->
    Reply = case lookup_rencounter_role(RoleId) of
                {ok,
                 #rencounter_role{best_rank = BestRank,
                                  has_get_rank = HasGetRank}}
                    when TargetRankLev =:= BestRank ->
                    case HasGetRank < TargetRankLev of
                        true ->
                            case big_world:call(rencounter_mgr,
                                                call,
                                                [{get_upgrade_reward,
                                                  RoleId,
                                                  TargetRankLev}])
                                of
                                {ok, Msg} -> {ok, Msg};
                                _Else -> _Else
                            end;
                        false -> {false, lang:get("您已经领取过该奖励")}
                    end;
                _ -> {false, lang:get("您还没有达到该段位")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:error("英雄擂台代理进程收到未知消息:~w",
                 [_Request],
                 rencounter_agent,
                 88),
    {noreply, State}.

handle_cast(_Msg, State) ->
    logger:error("英雄擂台代理进程收到未知消息:~w",
                 [_Msg],
                 rencounter_agent,
                 92),
    {noreply, State}.

handle_info(reset_role, State) ->
    logger:debug("重置角色信息", [], rencounter_agent, 96),
    Fun = fun (RctRole = #rencounter_role{id = RoleId},
               Rtn) ->
                  NewRctRole = rencounter_mgr:calc_join_times(RctRole),
                  role:pack_send(RoleId, 19310, {NewRctRole}),
                  [NewRctRole | Rtn];
              (_, Rtn) -> Rtn
          end,
    ModifyList = ets:foldl(Fun, [], rencounter_role),
    update_rencounter_role(ModifyList),
    {noreply, State};
handle_info(clean_rank, State) ->
    ets:delete_all_objects(rencounter_rank),
    dets:delete_all_objects(rencounter_rank),
    ets:delete_all_objects(rencounter_local_rank),
    dets:delete_all_objects(rencounter_local_rank),
    {noreply, State};
handle_info({update_season_time,
             SeasonStartTime,
             SeasonEndTime},
            State) ->
    env:set(rencounter_start_end_time,
            {SeasonStartTime, SeasonEndTime}),
    role_group:pack_send(world,
                         19309,
                         {SeasonStartTime, SeasonEndTime}),
    {noreply, State};
handle_info({update_info,
             #{role_id := RoleId, name := Name, classes := Classes,
               sex := Sex, lev := Lev, break_times := BreakTimes,
               fc := Fc, looks := Looks}},
            State) ->
    case lookup_rencounter_role(RoleId) of
        {ok, RctRole = #rencounter_role{}} ->
            UpdateRctRole = RctRole#rencounter_role{id = RoleId,
                                                    name = Name,
                                                    classes = Classes,
                                                    lev = Lev, sex = Sex,
                                                    break_times = BreakTimes,
                                                    fc = Fc, looks = Looks},
            update_rencounter_role(UpdateRctRole);
        _ -> ok
    end,
    {noreply, State};
handle_info(init_status, State) ->
    case get(init_ref) of
        Ref when erlang:is_reference(Ref) ->
            erlang:cancel_timer(Ref);
        _ -> ok
    end,
    NewState = case big_world:call(rencounter_mgr,
                                   call,
                                   [get_status])
                   of
                   {ok,
                    Status,
                    EndTime,
                    SeasonId,
                    SeasonStartTime,
                    SeasonEndTime} ->
                       logger:debug("更新状态:~w",
                                    [{Status,
                                      EndTime,
                                      SeasonId,
                                      SeasonStartTime,
                                      SeasonEndTime}],
                                    rencounter_agent,
                                    143),
                       info({sync_season_id, SeasonId}),
                       env:set(rencounter_status, {Status, EndTime}),
                       env:set(rencounter_start_end_time,
                               {SeasonStartTime, SeasonEndTime}),
                       State#state{is_init = true, status = Status};
                   _ -> State
               end,
    InitStatusRef = erlang:send_after(60000,
                                      self(),
                                      init_status),
    put(init_ref, InitStatusRef),
    {noreply, NewState};
handle_info({world_lev, WorldLev}, State)
    when WorldLev >= 65 - 5 ->
    logger:debug("世界等级变更，通知链接跨服",
                 [],
                 rencounter_agent,
                 157),
    info(init_status),
    {noreply, State};
handle_info({sync_rencounter_role,
             RctRole = #rencounter_role{id = RoleId,
                                        rank_lev = RankLev, star = Star,
                                        total_star = TotalStar},
             WinOrLose,
             GroupId},
            State) ->
    update_rencounter_role(RctRole),
    role_trigger:async_fire(RoleId,
                            #evt_rencounter_star{rank_lev = RankLev,
                                                 star = Star,
                                                 total_star = TotalStar}),
    role:apply(async,
               RoleId,
               {rencounter_role,
                callback,
                [{combat_reward, RctRole, WinOrLose, GroupId}]}),
    {noreply, State};
handle_info({update_rencounter_role,
             RctRole = #rencounter_role{id = RoleId,
                                        rank_lev = RankLev, star = Star,
                                        total_star = TotalStar}},
            State) ->
    update_rencounter_role(RctRole),
    role_trigger:async_fire(RoleId,
                            #evt_rencounter_star{rank_lev = RankLev,
                                                 star = Star,
                                                 total_star = TotalStar}),
    role:pack_send(RoleId, 19310, {RctRole}),
    {noreply, State};
handle_info({update_status, Status, EndTime}, State) ->
    env:set(rencounter_status, {Status, EndTime}),
    role_group:pack_send(world, 19308, {Status, EndTime}),
    notice_msg(Status),
    logger:debug("=========:~w",
                 [{Status, EndTime}],
                 rencounter_agent,
                 185),
    {noreply, State};
handle_info({update_rank, RankList}, State) ->
    dets:delete_all_objects(rencounter_rank),
    ets:delete_all_objects(rencounter_rank),
    ets:insert(rencounter_rank, RankList),
    dets:insert(rencounter_rank, RankList),
    update_local_rank(),
    {noreply, State};
handle_info({sync_season_id, NewSeasonId},
            State = #state{}) ->
    OldSeasonId = env:get(rencounter_season_id),
    logger:debug("=======赛季id:~w",
                 [{OldSeasonId, NewSeasonId}],
                 rencounter_agent,
                 202),
    case OldSeasonId =/= NewSeasonId of
        true ->
            env:save(rencounter_season_id, NewSeasonId),
            info(rencounter_season),
            calc_season_rank_reward();
        false -> ok
    end,
    {noreply, State};
handle_info(rencounter_season, State) ->
    campaign_rank_mgr ! {all_info, rencounter_season},
    {noreply, State};
handle_info(_Info, State) ->
    logger:error("英雄擂台代理进程收到未知的消息:~w",
                 [_Info],
                 rencounter_agent,
                 221),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

lookup_rank(GroupId) ->
    case ets:lookup(rencounter_rank, GroupId) of
        [{_, RankList}] -> RankList;
        _ -> []
    end.

lookup_local_rank(GroupId) ->
    case ets:lookup(rencounter_local_rank, GroupId) of
        [{_, RankList}] -> RankList;
        _ -> []
    end.

update_rencounter_role(RctRole) ->
    ets:insert(rencounter_role, RctRole),
    dets:insert(rencounter_role, RctRole).

lookup_rencounter_role(RoleId) ->
    case catch ets:lookup(rencounter_role, RoleId) of
        [RencounterRole = #rencounter_role{}] ->
            {ok, RencounterRole};
        _ -> false
    end.

info(Msg) ->
    rencounter_agent ! Msg,
    ok.

call(Msg) ->
    case catch gen_server:call(rencounter_agent, Msg, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, rencounter_agent},
                          rencounter_agent,
                          [],
                          []).

get_rencounter_status() ->
    case env:get(rencounter_status) of
        {Status, EndTime} -> {Status, EndTime};
        _ -> {1, 0}
    end.

get_season_start_end_time() ->
    case env:get(rencounter_start_end_time) of
        {StartTime, EndTime} -> {StartTime, EndTime};
        _ -> {0, 0}
    end.

notice_msg(1) ->
    Msg =
        notice:format(lang:get("~ts结束了，快数数你虏获了多少颗荣誉星星，失利的不要灰心，提升实力下场抢回来吧{face"
                               "_1, 18}"),
                      [{string_2, 1, "英雄擂台"}]),
    notice:cast(all, 5, Msg);
notice_msg(2) ->
    Msg =
        notice:format(lang:get("~ts将在~ts后开启，快快准备好迎战来自各位面强者{face_1,7}"),
                      [{string_2, 1, "英雄擂台"}, {string_2, 1, "5分钟"}]),
    notice:cast(all, 5, Msg);
notice_msg(3) ->
    Msg =
        notice:format(lang:get("~ts活动正式开战！快来看看谁能斩获更多的星星冲上擂台的巅峰{face_1, 7}"),
                      [{string_2, 1, "英雄擂台"}]),
    notice:cast(all, 5, Msg).

update_local_rank() ->
    logger:debug("进行排行=========",
                 [],
                 rencounter_agent,
                 295),
    L = ets:tab2list(rencounter_role),
    L1 = sort_local_rank(L),
    logger:debug("排行数据=========\n~w\n================:",
                 [L1],
                 rencounter_agent,
                 298),
    dets:delete_all_objects(rencounter_local_rank),
    ets:delete_all_objects(rencounter_local_rank),
    ets:insert(rencounter_local_rank, L1),
    dets:insert(rencounter_local_rank, L1),
    ok.

sort_local_rank(List) ->
    GroupList = group_local_role(List, []),
    RankList = sort_group(GroupList, []),
    RankList.

group_local_role([], GroupList) -> GroupList;
group_local_role([RctRole = #rencounter_role{id = Id,
                                             lev = Lev,
                                             break_times = BreakTimes,
                                             season_join_times = SJTimes}
                  | Rest],
                 GroupList)
    when SJTimes > 0 ->
    GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
    case role_misc:is_local_role(Id) of
        true ->
            case lists:keyfind(GroupId, 1, GroupList) of
                {_, RctRoleList} ->
                    NewGroupList = lists:keystore(GroupId,
                                                  1,
                                                  GroupList,
                                                  {GroupId,
                                                   [RctRole | RctRoleList]}),
                    group_local_role(Rest, NewGroupList);
                _ ->
                    NewGroupList = [{GroupId, [RctRole]} | GroupList],
                    group_local_role(Rest, NewGroupList)
            end;
        false -> group_local_role(Rest, GroupList)
    end;
group_local_role([_ | Rest], GroupList) ->
    group_local_role(Rest, GroupList).

keys() ->
    [{asc, #rencounter_role.update_best_star_time},
     #rencounter_role.star,
     #rencounter_role.rank_lev].

sort_group([], RankList) -> RankList;
sort_group([{GroupId, RctRoleList} | Rest], RankList) ->
    GroupSortList = lists:sublist(util:keys_sort(keys(),
                                                 RctRoleList),
                                  100),
    NewRankList = [{GroupId, GroupSortList} | RankList],
    sort_group(Rest, NewRankList).

calc_season_rank_reward() ->
    RankList = ets:tab2list(rencounter_rank),
    RctRoleList = ets:tab2list(rencounter_role),
    LeftRctRoleList = send_rank_reward(RankList,
                                       RctRoleList),
    send_rank_out_rewards(LeftRctRoleList),
    reset_rank_lev().

send_rank_reward([], RctRoleList) -> RctRoleList;
send_rank_reward([{GroupId, RankList} | Rest],
                 RctRoleList) ->
    LeftRctRoleList = send_group_rank_reward(GroupId,
                                             1,
                                             RankList,
                                             RctRoleList),
    send_rank_reward(Rest, LeftRctRoleList).

send_group_rank_reward(_, _, [], RctRoleList) ->
    RctRoleList;
send_group_rank_reward(GroupId, Rank,
                       [RctRole = #rencounter_role{id = RoleId} | Rest],
                       RctRoleList) ->
    NewRank = Rank + 1,
    do_send_rank_reward(GroupId, Rank, RctRole),
    LeftRctRoleList = lists:keydelete(RoleId,
                                      #rencounter_role.id,
                                      RctRoleList),
    send_group_rank_reward(GroupId,
                           NewRank,
                           Rest,
                           LeftRctRoleList).

do_send_rank_reward(GroupId, Rank,
                    #rencounter_role{id = RoleId,
                                     season_join_times = JoinTimes}) ->
    case role_misc:is_local_role(RoleId) andalso
             JoinTimes > 0
        of
        true ->
            case rencounter_data:get_rank_reward(GroupId, Rank) of
                Rewards = [_ | _] ->
                    UnBindItem = [{Assets, 0, Val}
                                  || {Assets, Val} <- Rewards],
                    Title = lang:get("英雄擂台排名奖励"),
                    Content =
                        notice:format(lang:get("你在本赛季英雄擂台中过关斩将，淘汰无数强敌，跻身排行榜第~ts名,以下是你的战利品：~ts"),
                                      [{string_2, 1, Rank},
                                       {panel_2,
                                        19301,
                                        1,
                                        lang:get("点此查看冠军风采")}]),
                    mail:send(RoleId, Title, Content, UnBindItem);
                _ -> ok
            end;
        _ -> ok
    end;
do_send_rank_reward(_, _Rank, _Err) ->
    logger:error("无法识别的数据:~w",
                 [_Err],
                 rencounter_agent,
                 385),
    ok.

send_rank_out_rewards([]) -> ok;
send_rank_out_rewards([RctRole = #rencounter_role{lev =
                                                      Lev,
                                                  break_times = BreakTimes}
                       | Rest]) ->
    GroupId = rencounter_data:get_group_id(Lev, BreakTimes),
    do_send_rank_reward(GroupId, 101, RctRole),
    send_rank_out_rewards(Rest).

reset_rank_lev() ->
    Now = date:unixtime(),
    Fun = fun (RctRole = #rencounter_role{id = RoleId,
                                          lev = Lev, break_times = BreakTimes,
                                          rank_lev = RankLev, star = Star,
                                          season_join_times = SJTimes,
                                          season_win_times = SWTimes,
                                          season_lasted_win = SLWTimes},
               ok) ->
                  TotalStar = rencounter_mgr:get_reset_total_star(RankLev,
                                                                  Star),
                  NewTotalStar = max(TotalStar - 15, 0),
                  ResetStart = case RankLev < 6 of
                                   true -> Star;
                                   _ -> 0
                               end,
                  {NewRankLev, NewStar} = rencounter_mgr:add_star(RankLev,
                                                                  ResetStart,
                                                                  NewTotalStar -
                                                                      TotalStar),
                  NewRctRole = RctRole#rencounter_role{rank_lev =
                                                           NewRankLev,
                                                       star = NewStar,
                                                       total_star =
                                                           NewTotalStar,
                                                       best_rank = NewRankLev,
                                                       best_star = NewStar,
                                                       best_total_star =
                                                           NewTotalStar,
                                                       update_best_star_time =
                                                           Now,
                                                       win_lasted_times = 0,
                                                       last_result = 0,
                                                       season_join_times = 0,
                                                       season_win_times = 0,
                                                       season_lasted_win = 0,
                                                       last_join_times =
                                                           SJTimes,
                                                       last_win_times = SWTimes,
                                                       last_lasted_win =
                                                           SLWTimes,
                                                       has_get_rank =
                                                           NewRankLev,
                                                       join_times = 0,
                                                       max_joins = 4},
                  update_rencounter_role(NewRctRole),
                  rencounter_role:push_rencounter_info(RoleId,
                                                       NewRctRole),
                  case role_misc:is_local_role(RoleId) of
                      true when SJTimes > 0 ->
                          GroupId = rencounter_data:get_group_id(Lev,
                                                                 BreakTimes),
                          case rencounter_data:get_rewards({GroupId, RankLev})
                              of
                              #{season_item := SeasonItem} ->
                                  UnBindItem = [{Assets, 0, Val}
                                                || {Assets, Val} <- SeasonItem],
                                  Title = lang:get("英雄擂台赛季结算"),
                                  Content =
                                      notice:format(lang:get("恭喜你在本赛季英雄擂台中达到了~ts。每一颗星星都代表着你战胜的一名强敌，在新赛季中他们将"
                                                             "转化为你成功的助力。根据你的成绩，你将以~ts作为起点开始你新的征程！加油吧星辰勇士！~t"
                                                             "s"),
                                                    [{string_1,
                                                      get_rank_title(RankLev,
                                                                     Star)},
                                                     {string_1,
                                                      get_rank_title(NewRankLev,
                                                                     NewStar)},
                                                     {panel_2,
                                                      19301,
                                                      1,
                                                      lang:get("点此查看冠军风采")}]),
                                  mail:send(RoleId, Title, Content, UnBindItem),
                                  ok;
                              _ ->
                                  logger:error("发送赛季奖励配置错误:~w",
                                               [RctRole],
                                               rencounter_agent,
                                               422),
                                  ok
                          end;
                      _ -> ok
                  end;
              (_, ok) -> ok
          end,
    ets:foldl(Fun, ok, rencounter_role).

get_rank_title(RankLev, Star) ->
    case rencounter_data:get_rank_star(RankLev) of
        #{rencounter := StrRankLev, title := Title} ->
            notice:format("~ts-~ts~ts星",
                          [{string_2, 1, StrRankLev},
                           {string_2, 1, Title},
                           {string_2, 1, Star}]);
        _ ->
            notice:format("~ts-~ts~ts星",
                          [{string_2, 1, "飞瀑村"},
                           {string_2, 1, "学徒"},
                           {string_2, 1, 1}])
    end.

