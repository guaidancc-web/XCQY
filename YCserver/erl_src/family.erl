-file("src/mod/family/family.erl", 1).

-module(family).

-behaviour(gen_server).

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

-file("src/mod/family/family.erl", 19).

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

-file("src/mod/family/family.erl", 20).

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

-file("src/mod/family/family.erl", 21).

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

-file("src/mod/family/family.erl", 22).

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

-file("src/mod/family/family.erl", 23).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
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
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
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
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/mod/family/family.erl", 24).

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

-file("src/mod/family/family.erl", 25).

-file("inc/looks.hrl", 1).

-file("src/mod/family/family.erl", 26).

-export([start_link/1,
         start_link/2,
         push_family/2,
         get_furnishing_block/3,
         get_furnishing_max_lev/2,
         count_furnishing_by_type/1,
         sync_dets/1,
         translate_pos/3,
         sync_trigger/3,
         update_child/2,
         delete_child/2]).

start_link(FamilyInfo = #family_info{}, create) ->
    gen_server:start_link(family, [FamilyInfo, create], []).

start_link(FamilyInfo = #family_info{id = _FamilyId}) ->
    logger:debug("正在启动家园:~w", [_FamilyId], family, 47),
    gen_server:start_link(family, [FamilyInfo, normal], []).

init([FamilyInfo = #family_info{house_info =
                                    HouseInfo = #house_info{lev = Lev,
                                                            furnishings =
                                                                Furnishings,
                                                            last_clean_time =
                                                                LastCleanTime},
                                last_rf_time = LastRfTime, master_id = MasterId,
                                lover_id = LoverId},
      Flag]) ->
    process_flag(trap_exit, true),
    case battle_mgr:fetch_ids(1) of
        {ok, [FamilyBattlelId]} ->
            case family_data:get_init_map(Lev) of
                #{map_id := MapBaseId, keeper_x := KeeperX,
                  keeper_y := KeeperY, beans_x := BeansX,
                  beans_y := BeansY, maternity_x := MaternityX,
                  maternity_y := MaternityY} ->
                    case map_mgr:create(MapBaseId) of
                        {ok, HouseMapPid, HouseMapId} ->
                            LimitList = get_function_effect_list([5, 11, 8, 10],
                                                                 Lev),
                            FurMaxLevInfo =
                                batch_get_furnishing_max_lev(Furnishings,
                                                             Lev,
                                                             LimitList),
                            NewHouseInfo = HouseInfo#house_info{map_id =
                                                                    HouseMapId,
                                                                map_pid =
                                                                    HouseMapPid,
                                                                furishing_max_lev_info
                                                                    =
                                                                    FurMaxLevInfo},
                            logger:debug("创建家园信息:~w",
                                         [NewHouseInfo],
                                         family,
                                         66),
                            Now = date:unixtime(),
                            FmUpHouseInfo = FamilyInfo#family_info{house_info =
                                                                       NewHouseInfo,
                                                                   last_visit_time
                                                                       = Now,
                                                                   battle_id =
                                                                       FamilyBattlelId},
                            unit_mgr:create({FamilyBattlelId, 20075},
                                            20075,
                                            {HouseMapId, KeeperX, KeeperY}),
                            unit_mgr:create({FamilyBattlelId, 20081},
                                            20081,
                                            {HouseMapId, BeansX, BeansY}),
                            unit_mgr:create({FamilyBattlelId, 71150},
                                            71150,
                                            {HouseMapId,
                                             MaternityX,
                                             MaternityY}),
                            init_child(#{master_id => MasterId,
                                         battle_id => FamilyBattlelId,
                                         map_id => HouseMapId,
                                         map_base_id => MapBaseId}),
                            init_child(#{master_id => LoverId,
                                         battle_id => FamilyBattlelId,
                                         map_id => HouseMapId,
                                         map_base_id => MapBaseId}),
                            CreateFamilyInfo = case Flag of
                                                   create ->
                                                       sync_trigger(evt_family,
                                                                    FmUpHouseInfo,
                                                                    #{}),
                                                       FmUpHouseInfo#family_info{pid
                                                                                     =
                                                                                     self()};
                                                   normal ->
                                                       FmUpHouseInfo#family_info{pid
                                                                                     =
                                                                                     self(),
                                                                                 visitor
                                                                                     =
                                                                                     []}
                                               end,
                            RegionBlocks = calc_dynamic_region(Furnishings),
                            HouseMapPid !
                                {switch_active_region, 1, RegionBlocks},
                            CleannessFamilyInfo = case Now - 86400 >=
                                                           LastCleanTime
                                                      of
                                                      true ->
                                                          calc_cleanness(CreateFamilyInfo);
                                                      false -> CreateFamilyInfo
                                                  end,
                            MTimeout = date:next_diff(23, 50, 4),
                            CleannessRef = erlang:send_after(MTimeout * 1000,
                                                             self(),
                                                             calc_cleanness),
                            put(cleanness_ref, CleannessRef),
                            DayResetFamilyInfo = case Now - 86400 > LastRfTime
                                                     of
                                                     true ->
                                                         day_reset(CleannessFamilyInfo);
                                                     false ->
                                                         CleannessFamilyInfo
                                                 end,
                            RTimeout = date:next_diff(0, 0, 4),
                            DayResetRef = erlang:send_after(RTimeout * 1000,
                                                            self(),
                                                            day_reset),
                            put(day_reset_ref, DayResetRef),
                            NewFamilyInfo = DayResetFamilyInfo,
                            sync_cache(NewFamilyInfo),
                            {ok, NewFamilyInfo};
                        {error, _HouseMapErr} ->
                            logger:error("启动公会进程失败，因为地图进程启动失败所导致: ~w",
                                         [_HouseMapErr],
                                         family,
                                         120),
                            {stop, family_map_start_failure}
                    end;
                _ ->
                    logger:error("获取房屋等级坐标配置失败", [], family, 124),
                    {stop, family_map_start_failure}
            end;
        _Err ->
            logger:error("家园创建请求战场id失败:~w", [_Err], family, 128),
            {stop, family_battle_id_failure}
    end.

handle_call({set_out_furnishing,
             FamilyId,
             Fid,
             ToPos,
             Dir},
            _From,
            State = #family_info{id = FamilyId,
                                 house_info =
                                     #house_info{furnishings = OldFurnishings,
                                                 env_val = OldEnv}}) ->
    SetOutFamilyInfo = #family_info{house_info =
                                        #house_info{furnishings = Furnishings,
                                                    env_val = Env,
                                                    lev = HouseLev}} =
                           set_out_furnishing(State, Fid, ToPos, Dir),
    sync_dets(SetOutFamilyInfo),
    OldStatus = case lists:keyfind(Fid,
                                   #furnishing.id,
                                   OldFurnishings)
                    of
                    #furnishing{status = _Status} -> _Status;
                    _ -> 1
                end,
    logger:debug("家具之前的状态为:~w", [OldStatus], family, 140),
    NoticeMsg = case family_data:get_family(HouseLev) of
                    #{max_env := MaxEnv} ->
                        case lists:keyfind(Fid, #furnishing.id, Furnishings) of
                            #furnishing{base_id = BaseId} ->
                                case family_data:get_furnishing(BaseId) of
                                    #{name := FurName, type := FurType} ->
                                        case Env =/= OldEnv of
                                            true ->
                                                notice:format(lang:get("成功放置一个~ts，繁华度：~ts"),
                                                              [{string_2,
                                                                5,
                                                                FurName},
                                                               {string_2,
                                                                1,
                                                                util:flist(lang:get("~w/~w"),
                                                                           [Env,
                                                                            MaxEnv])}]);
                                            false when OldStatus =:= 3 ->
                                                notice:format(lang:get("您调整了~ts的位置，繁华度:~ts"),
                                                              [{string_2,
                                                                5,
                                                                FurName},
                                                               {string_2,
                                                                1,
                                                                util:flist(lang:get("~w/~w"),
                                                                           [Env,
                                                                            MaxEnv])}]);
                                            false ->
                                                TypeName = case FurType of
                                                               1 ->
                                                                   lang:get("普通屏风");
                                                               2 ->
                                                                   lang:get("玄关屏风");
                                                               3 ->
                                                                   lang:get("沙发");
                                                               4 ->
                                                                   lang:get("镜子");
                                                               5 ->
                                                                   lang:get("餐桌");
                                                               6 ->
                                                                   lang:get("椅子");
                                                               7 ->
                                                                   lang:get("箱子");
                                                               8 ->
                                                                   lang:get("柜子");
                                                               9 ->
                                                                   lang:get("窗帘");
                                                               10 ->
                                                                   lang:get("床");
                                                               11 ->
                                                                   lang:get("宠物笼");
                                                               12 ->
                                                                   lang:get("茶几");
                                                               13 ->
                                                                   lang:get("墙饰");
                                                               14 ->
                                                                   lang:get("装饰");
                                                               15 ->
                                                                   lang:get("地板");
                                                               16 ->
                                                                   lang:get("地毯");
                                                               _ ->
                                                                   lang:get("特殊类型")
                                                           end,
                                                SetOutCount = case
                                                                  family_data:get_furnishing_set_out_info(HouseLev)
                                                                  of
                                                                  L
                                                                      when
                                                                        is_list(L) ->
                                                                      case
                                                                          lists:keyfind(FurType,
                                                                                        1,
                                                                                        L)
                                                                          of
                                                                          {_,
                                                                           TmpCount} ->
                                                                              TmpCount;
                                                                          _ -> 1
                                                                      end;
                                                                  _ -> 1
                                                              end,
                                                notice:format(lang:get("当前~ts的摆放数已达上限~ts，繁华值不变"),
                                                              [{string_2,
                                                                5,
                                                                TypeName},
                                                               {string_2,
                                                                1,
                                                                SetOutCount}])
                                        end;
                                    _ -> lang:get("摆放家具成功")
                                end;
                            false -> lang:get("摆放家具成功")
                        end;
                    _ -> lang:get("摆放家具成功")
                end,
    {reply, {true, NoticeMsg}, SetOutFamilyInfo};
handle_call({sell_furnishing,
             FamilyId,
             ID,
             RoleID,
             SellNum},
            _From,
            State = #family_info{id = FamilyId,
                                 house_info =
                                     HouseInfo = #house_info{furnishings =
                                                                 OldFurnishings},
                                 visitor = Visitors}) ->
    {ReturnMsg, NewFamilyInfo} = case lists:keyfind(ID,
                                                    #furnishing.id,
                                                    OldFurnishings)
                                     of
                                     Furnishing = #furnishing{num = Num} ->
                                         Reply =
                                             family_logic:check_can_sell([base_id,
                                                                          sell_num,
                                                                          belong,
                                                                          status],
                                                                         RoleID,
                                                                         Furnishing,
                                                                         SellNum),
                                         case Reply of
                                             ok ->
                                                 NewNum = Num - SellNum,
                                                 {NewFurnishings,
                                                  ChangeFurnishing} =
                                                     case NewNum > 0 of
                                                         true ->
                                                             NFurnishing =
                                                                 Furnishing#furnishing{num
                                                                                           =
                                                                                           NewNum},
                                                             {lists:keystore(ID,
                                                                             #furnishing.id,
                                                                             OldFurnishings,
                                                                             NFurnishing),
                                                              NFurnishing};
                                                         _ ->
                                                             {lists:keydelete(ID,
                                                                              #furnishing.id,
                                                                              OldFurnishings),
                                                              []}
                                                     end,
                                                 FamilyInfo2 =
                                                     State#family_info{house_info
                                                                           =
                                                                           HouseInfo#house_info{furnishings
                                                                                                    =
                                                                                                    NewFurnishings}},
                                                 Modify = case ChangeFurnishing
                                                              of
                                                              [] ->
                                                                  [{3,
                                                                    Furnishing},
                                                                   {2,
                                                                    ChangeFurnishing}];
                                                              _ ->
                                                                  [{2,
                                                                    ChangeFurnishing}]
                                                          end,
                                                 sync_furnishing_status(Modify,
                                                                        Visitors),
                                                 sync_dets(FamilyInfo2),
                                                 apply_master_update_effect(FamilyInfo2),
                                                 {ok, FamilyInfo2};
                                             Reply2 -> {Reply2, State}
                                         end;
                                     _ -> {{false, lang:get("尚未拥有该家具")}, State}
                                 end,
    {reply, ReturnMsg, NewFamilyInfo};
handle_call({move_out_family, RoleId}, _From,
            State = #family_info{lover_id = LoverId,
                                 house_info =
                                     HouseInfo = #house_info{furnishings =
                                                                 Furnishings,
                                                             lev = Lev}}) ->
    logger:debug("玩家[~w]请求搬离", [RoleId], family, 231),
    NewFurnishings = move_out_family_furnishing(RoleId,
                                                Furnishings),
    LimitList = get_function_effect_list([5, 11, 8, 10],
                                         Lev),
    MaxLevInfo =
        batch_get_furnishing_max_lev(NewFurnishings,
                                     Lev,
                                     LimitList),
    logger:debug("角色[~w]搬离家园, 搬离后家园家具列表:~w, 家园等级:~w, 家具上限信息:~w",
                 [RoleId, NewFurnishings, Lev, MaxLevInfo],
                 family,
                 237),
    MoveOutFamily = State#family_info{house_info =
                                          HouseInfo#house_info{furnishings =
                                                                   NewFurnishings,
                                                               furishing_max_lev_info
                                                                   =
                                                                   MaxLevInfo}},
    EnvOutFamily = update_family_env(MoveOutFamily),
    NewState = case RoleId =:= LoverId of
                   true ->
                       EnvOutFamily#family_info{lover_id = {0, "", 0},
                                                lover_name = ""};
                   false -> EnvOutFamily
               end,
    self() ! stop,
    sync_dets(NewState),
    {reply, true, NewState};
handle_call({move_to_family,
             FurIdList,
             RoleId,
             RoleName},
            _From, State = #family_info{master_id = MasterId}) ->
    logger:debug("玩家[~w]携带家具[~w]入住",
                 [RoleId, FurIdList],
                 family,
                 255),
    FamilyInfo = move_to_family_furnishing(RoleId,
                                           FurIdList,
                                           State),
    NewState = case RoleId =/= MasterId of
                   true ->
                       FamilyInfo#family_info{lover_id = RoleId,
                                              lover_name = RoleName};
                   false -> FamilyInfo
               end,
    sync_dets(NewState),
    {reply, true, NewState};
handle_call(get_magic_beans_reward, _From,
            State = #family_info{magic_beans =
                                     MagicBeans = #magic_beans{flower_num =
                                                                   FlowerNum,
                                                               growth =
                                                                   Growth}}) ->
    case Growth >= 10 of
        true ->
            Now = date:unixtime(),
            NextWakeTime = case FlowerNum of
                               5 -> Now + 100800;
                               _ -> Now + 54000
                           end,
            NewFlowerNum = FlowerNum rem 5,
            NewState = State#family_info{magic_beans =
                                             MagicBeans#magic_beans{fosters =
                                                                        [],
                                                                    growth = 0,
                                                                    wake_time =
                                                                        NextWakeTime,
                                                                    flower_num =
                                                                        NewFlowerNum}},
            sync_dets(NewState),
            push_magic_beans(NewState),
            {reply, true, NewState};
        false -> {reply, false, State}
    end;
handle_call({set_invite_list, ValidFriendList}, _From,
            State = #family_info{magic_beans =
                                     MagicBeans = #magic_beans{inviters =
                                                                   Inviters}}) ->
    case add_inviters(ValidFriendList,
                      length(Inviters),
                      Inviters)
        of
        {true, NewInviters} ->
            NewState = State#family_info{magic_beans =
                                             MagicBeans#magic_beans{inviters =
                                                                        NewInviters}},
            push_magic_beans(NewState),
            LeftCount = 10 - length(NewInviters),
            Msg = case LeftCount of
                      0 -> lang:get("赠送成功，许愿宝箱送完了，静静的等待下次许愿树成长");
                      _ ->
                          notice:format(lang:get("赠送成功,剩余~ts个宝箱"),
                                        [{string_2, 1, LeftCount}])
                  end,
            sync_dets(NewState),
            {reply, {true, Msg}, NewState};
        {false, Reason} -> {reply, {false, Reason}, State}
    end;
handle_call({get_beans_invite_reward, RwId}, _From,
            State = #family_info{magic_beans =
                                     MagicBeans = #magic_beans{beans_rewards =
                                                                   BeansRewards}}) ->
    case lists:keyfind(RwId, #beans_reward.id, BeansRewards)
        of
        #beans_reward{belong_id = RoleId} ->
            NewBeansRewards = lists:keydelete(RwId,
                                              #beans_reward.id,
                                              BeansRewards),
            NewState = State#family_info{magic_beans =
                                             MagicBeans#magic_beans{beans_rewards
                                                                        =
                                                                        NewBeansRewards}},
            sync_dets(NewState),
            push_magic_beans(NewState, RoleId),
            {reply, true, NewState};
        _ -> {reply, false, State}
    end;
handle_call(up_lev_house, _From,
            State = #family_info{master_id = _MasterId,
                                 lover_id = _LoverId,
                                 house_info =
                                     HouseInfo = #house_info{env_val = Env,
                                                             lev =
                                                                 HouseLev}}) ->
    case family_data:get_house_lev(Env) of
        CanLev when is_integer(CanLev) ->
            case HouseLev < CanLev of
                true ->
                    NewHouseLev = HouseLev + 1,
                    NewFamilyInfo = State#family_info{house_info =
                                                          HouseInfo#house_info{lev
                                                                                   =
                                                                                   NewHouseLev}},
                    case is_need_upgrade_map(NewHouseLev, HouseLev) of
                        skip -> skip;
                        normal ->
                            {FName, TotalSpace} = case
                                                      family_data:get_family(NewHouseLev)
                                                      of
                                                      #{name := TmpName,
                                                        total_space :=
                                                            TmpTotalSpace} ->
                                                          {TmpName,
                                                           TmpTotalSpace};
                                                      _ ->
                                                          {lang:get("宜家宜室"), 60}
                                                  end,
                            Msg1 =
                                notice:format(lang:get("在您的精心布置下，您的家园达到了~ts的规模"),
                                              [{string_2, 5, FName}]),
                            Msg2 =
                                notice:format(lang:get("家园的空间提升到了~ts平，赶快去建造吧"),
                                              [{string_2, 5, TotalSpace}]),
                            notice_master(NewFamilyInfo, Msg1, inhouse),
                            notice_master(NewFamilyInfo, Msg2, inhouse),
                            ok;
                        upgrade ->
                            FName = case family_data:get_family(NewHouseLev) of
                                        #{name := TmpName} -> TmpName;
                                        _ -> lang:get("宜家宜室")
                                    end,
                            Msg1 =
                                notice:format(lang:get("在您的精心布置下，您的家园达到了~ts的规模"),
                                              [{string_2, 5, FName}]),
                            Msg2 =
                                notice:format(lang:get("家园的空间提升到了~ts平，赶快去建造吧"),
                                              [{string_2, 5, FName}]),
                            notice_master(NewFamilyInfo, Msg1, inhouse),
                            notice_master(NewFamilyInfo, Msg2, inhouse),
                            gen_server:cast(self(), house_lev_up),
                            ok
                    end,
                    sync_trigger(evt_family, NewFamilyInfo, #{}),
                    sync_dets(NewFamilyInfo),
                    push_family_info(NewFamilyInfo),
                    {reply, true, NewFamilyInfo};
                false ->
                    Reply = {false, lang:get("繁华度未达到要求哦，置购更多的家具能提升繁华度")},
                    {reply, Reply, State}
            end;
        false ->
            Reply = {false, lang:get("您的家园已经达到了最大等级，无法进行升级了")},
            {reply, Reply, State}
    end;
handle_call(_Request, _From, State) ->
    logger:error("未处理的请求:~w", [_Request], family, 370),
    {noreply, State}.

handle_cast(house_lev_up,
            State = #family_info{master_id = MasterId,
                                 lover_id = LoverId,
                                 house_info =
                                     HouseInfo = #house_info{map_pid =
                                                                 OldMapPid,
                                                             lev = Lev,
                                                             furnishings =
                                                                 Furnishings}}) ->
    logger:debug("家园的地图升级了", [], family, 375),
    case battle_mgr:fetch_ids(1) of
        {ok, [FamilyBattlelId]} ->
            case family_data:get_init_map(Lev) of
                #{map_id := MapBaseId, keeper_x := KeeperX,
                  keeper_y := KeeperY, beans_x := BeansX,
                  beans_y := BeansY, maternity_x := MaternityX,
                  maternity_y := MaternityY} ->
                    case map_mgr:create(MapBaseId) of
                        {ok, HouseMapPid, HouseMapId} ->
                            NewFurnishings = transform_furnishings(Furnishings),
                            NewHouseInfo = HouseInfo#house_info{furnishings =
                                                                    NewFurnishings,
                                                                map_id =
                                                                    HouseMapId,
                                                                map_pid =
                                                                    HouseMapPid},
                            unit_mgr:create({FamilyBattlelId, 20075},
                                            20075,
                                            {HouseMapId, KeeperX, KeeperY}),
                            unit_mgr:create({FamilyBattlelId, 20081},
                                            20081,
                                            {HouseMapId, BeansX, BeansY}),
                            unit_mgr:create({FamilyBattlelId, 71150},
                                            71150,
                                            {HouseMapId,
                                             MaternityX,
                                             MaternityY}),
                            init_child(#{master_id => MasterId,
                                         battle_id => FamilyBattlelId,
                                         map_id => HouseMapId,
                                         map_base_id => MapBaseId}),
                            init_child(#{master_id => LoverId,
                                         battle_id => FamilyBattlelId,
                                         map_id => HouseMapId,
                                         map_base_id => MapBaseId}),
                            RegionBlocks = calc_dynamic_region(NewFurnishings),
                            HouseMapPid !
                                {switch_active_region, 1, RegionBlocks},
                            NewState = State#family_info{house_info =
                                                             NewHouseInfo,
                                                         battle_id =
                                                             FamilyBattlelId},
                            sync_dets(NewState),
                            gen_server:cast(self(),
                                            {notify_visit_trans_map,
                                             OldMapPid}),
                            {noreply, NewState};
                        {error, _HouseMapErr} ->
                            logger:error("启动公会进程失败，因为地图进程启动失败所导致: ~w",
                                         [_HouseMapErr],
                                         family,
                                         410),
                            {noreply, State}
                    end;
                _ ->
                    logger:error("获取房屋等级坐标配置失败:~w", [Lev], family, 414),
                    {noreply, State}
            end;
        _Err ->
            logger:error("家园升级请求战场id失败:~w", [_Err], family, 418),
            {noreply, State}
    end;
handle_cast({notify_visit_trans_map, MapPid},
            State = #family_info{id = FamilyId,
                                 visitor = Visitors}) ->
    notify_visit_trans_map(Visitors, FamilyId),
    logger:debug("通知销毁地图:~w", [MapPid], family, 425),
    erlang:send_after(10 * 1000,
                      self(),
                      {map_garbage_collect, MapPid}),
    {noreply, State};
handle_cast(_Msg, State) ->
    logger:error("未处理的cast消息：~w", [_Msg], family, 431),
    {noreply, State}.

handle_info({enter, RoleId, RolePid},
            State = #family_info{visitor = Visitor}) ->
    case lists:keymember(RoleId, 1, Visitor) of
        true -> {noreply, State};
        false ->
            NewVisitor = lists:keystore(RoleId,
                                        1,
                                        Visitor,
                                        {RoleId, RolePid}),
            Now = date:unixtime(),
            NewState = State#family_info{visitor = NewVisitor,
                                         last_visit_time = Now},
            sync_cache(NewState),
            {noreply, NewState}
    end;
handle_info({leave, RoleId},
            State = #family_info{id = _FamilyId,
                                 visitor = Visitor}) ->
    logger:debug("角色~w离开家园~w",
                 [RoleId, _FamilyId],
                 family,
                 448),
    case lists:keymember(RoleId, 1, Visitor) of
        true ->
            NewVisitor = lists:keydelete(RoleId, 1, Visitor),
            NewState = State#family_info{visitor = NewVisitor},
            sync_cache(NewState),
            {noreply, NewState};
        false -> {noreply, State}
    end;
handle_info({add_frunishing, FurnishingId, Num, RoleId},
            State) ->
    logger:debug("收到添加家具信息:~w",
                 [{FurnishingId, Num, RoleId}],
                 family,
                 461),
    NewState = add_frunishing(State,
                              FurnishingId,
                              RoleId,
                              Num),
    sync_dets(NewState),
    {noreply, NewState};
handle_info({invite_beans_reward,
             GiverId,
             GiverName,
             RoleId},
            State) ->
    NewState = produce_beans_rewar(GiverId,
                                   GiverName,
                                   RoleId,
                                   State),
    Title = notice:format(lang:get("~ts赠送的许愿宝箱"),
                          [{role_2, GiverName}]),
    Content =
        notice:format(lang:get("友谊万岁！！！~ts的家园许愿树点亮了~ts，为了感谢你帮助过ta许愿，特向你赠送~ts表"
                               "示感谢，赶快回家查看吧！"),
                      [{role_2, GiverName},
                       {string_2, 1, lang:get("月亮")},
                       {string_2, 3, lang:get("许愿宝箱")}]),
    mail:send(RoleId, Title, Content),
    push_magic_beans(NewState, RoleId),
    sync_dets(NewState),
    {noreply, NewState};
handle_info(print,
            State = #family_info{last_visit_time = LastVisitTime,
                                 house_info =
                                     #house_info{lev = Lev, furnishings = Furs,
                                                 bdg_info = BdgInfo},
                                 visitor = Visitor}) ->
    logger:info("======================================",
                [],
                family,
                481),
    logger:info("参观角色列表:~w", [Visitor], family, 482),
    logger:info("上次参观时间:~w", [LastVisitTime], family, 483),
    logger:info("房屋等级:~w", [Lev], family, 484),
    logger:info("房屋繁华度:~w",
                [calc_env(Furs, Lev)],
                family,
                485),
    logger:info("房屋家具列表:~w", [Furs], family, 486),
    logger:info("空间信息:~w", [BdgInfo], family, 487),
    logger:info("======================================",
                [],
                family,
                488),
    {noreply, State};
handle_info({get_back_furnishing, FurnishingId},
            State) ->
    NewState = get_back_furnishing(State, FurnishingId),
    push_family_info(NewState),
    sync_dets(NewState),
    {noreply, NewState};
handle_info({upgrade_bdg, BdgType, GiveFlag, RoleId},
            State = #family_info{master_id = MasterId,
                                 lover_id = LoverId,
                                 house_info =
                                     HouseInfo = #house_info{bdg_info = BdgInfo,
                                                             is_upgrade_bdg =
                                                                 IsUpgradeInfo,
                                                             map_id = MapId},
                                 visitor = Visitor}) ->
    case lists:keyfind(BdgType,
                       #building_info.type,
                       BdgInfo)
        of
        Bdg = #building_info{lev = Lev} ->
            NewBdg = Bdg#building_info{lev = Lev + 1},
            NewBdgInfo = lists:keystore(BdgType,
                                        #building_info.type,
                                        BdgInfo,
                                        NewBdg),
            UpGradeHouseInfo = HouseInfo#house_info{bdg_info =
                                                        NewBdgInfo},
            UpBdgFamilyInfo = State#family_info{house_info =
                                                    UpGradeHouseInfo},
            case lists:keyfind(MasterId, 1, Visitor) of
                {_, RolePid} -> push_bdg_info(RolePid, NewBdgInfo);
                _ -> skip
            end,
            case lists:keyfind(LoverId, 1, Visitor) of
                {_, LoverPid} -> push_bdg_info(LoverPid, NewBdgInfo);
                _ -> skip
            end,
            NewState = case GiveFlag of
                           true ->
                               case lists:keyfind(BdgType,
                                                  1,
                                                  [{1, 22},
                                                   {2, 24},
                                                   {3, 19},
                                                   {4, 18}])
                                   of
                                   {_, GiveBaseId} ->
                                       NewIsUpgradeBdgType =
                                           lists:keystore(BdgType,
                                                          1,
                                                          IsUpgradeInfo,
                                                          {BdgType, 1}),
                                       GiveBdgFurFamilyInfo =
                                           UpBdgFamilyInfo#family_info{house_info
                                                                           =
                                                                           UpGradeHouseInfo#house_info{is_upgrade_bdg
                                                                                                           =
                                                                                                           NewIsUpgradeBdgType}},
                                       FamilyInfo1 = #family_info{house_info =
                                                                      #house_info{furnishings
                                                                                      =
                                                                                      Furnishings}} =
                                                         add_frunishing(GiveBdgFurFamilyInfo,
                                                                        GiveBaseId,
                                                                        RoleId,
                                                                        1),
                                       case lists:keyfind(GiveBaseId,
                                                          #furnishing.base_id,
                                                          Furnishings)
                                           of
                                           #furnishing{id = SetFurId} ->
                                               case lists:keyfind(BdgType,
                                                                  1,
                                                                  [{1,
                                                                    {1128,
                                                                     509,
                                                                     56,
                                                                     25}},
                                                                   {2,
                                                                    {1528,
                                                                     670,
                                                                     76,
                                                                     34}},
                                                                   {3,
                                                                    {1308,
                                                                     850,
                                                                     65,
                                                                     43}},
                                                                   {4,
                                                                    {1848,
                                                                     792,
                                                                     92,
                                                                     40}}])
                                                   of
                                                   {_, ToPos = {_, _, X, Y}} ->
                                                       case
                                                           get_furnishing_block(GiveBaseId,
                                                                                ToPos,
                                                                                1)
                                                           of
                                                           RegionBlocks = [_
                                                                           | _] ->
                                                               case
                                                                   family_logic:check_map_blocked(MapId,
                                                                                                  RegionBlocks)
                                                                   of
                                                                   true ->
                                                                       FamilyInfo1;
                                                                   false ->
                                                                       case
                                                                           map_mgr:is_blocked(MapId,
                                                                                              X,
                                                                                              Y)
                                                                           of
                                                                           false ->
                                                                               set_out_furnishing(FamilyInfo1,
                                                                                                  SetFurId,
                                                                                                  ToPos,
                                                                                                  1);
                                                                           true ->
                                                                               FamilyInfo1
                                                                       end
                                                               end
                                                       end;
                                                   _ -> FamilyInfo1
                                               end;
                                           _ -> FamilyInfo1
                                       end;
                                   _ -> UpBdgFamilyInfo
                               end;
                           false -> UpBdgFamilyInfo
                       end,
            sync_trigger(evt_family_update,
                         NewState,
                         #{type => BdgType}),
            push_family_info(NewState),
            apply_master_update_effect(NewState),
            sync_dets(NewState),
            {noreply, NewState};
        _ -> {noreply, State}
    end;
handle_info({destory_building, BdgType},
            State = #family_info{master_id = MasterId,
                                 lover_id = LoverId,
                                 house_info =
                                     HouseInfo = #house_info{bdg_info =
                                                                 BdgInfo},
                                 visitor = Visitor}) ->
    case lists:keyfind(BdgType,
                       #building_info.type,
                       BdgInfo)
        of
        Bdg = #building_info{lev = Lev} ->
            NewBdg = Bdg#building_info{lev = max(Lev - 1, 0)},
            NewBdgInfo = lists:keystore(BdgType,
                                        #building_info.type,
                                        BdgInfo,
                                        NewBdg),
            NewState = State#family_info{house_info =
                                             HouseInfo#house_info{bdg_info =
                                                                      NewBdgInfo}},
            case lists:keyfind(MasterId, 1, Visitor) of
                {_, RolePid} -> push_bdg_info(RolePid, NewBdgInfo);
                _ -> skip
            end,
            case lists:keyfind(LoverId, 1, Visitor) of
                {_, LoverPid} -> push_bdg_info(LoverPid, NewBdgInfo);
                _ -> skip
            end,
            push_family_info(NewState),
            apply_master_update_effect(NewState),
            sync_dets(NewState),
            {noreply, NewState};
        _ -> {noreply, State}
    end;
handle_info({edit_furnishing, FurnishingId}, State) ->
    NewState = edit_furnishing(State, FurnishingId),
    sync_cache(NewState),
    {noreply, NewState};
handle_info({update_master,
             RoleName,
             Lev,
             Classes,
             Sex},
            State) ->
    NewState = State#family_info{master_name = RoleName,
                                 master_lev = Lev, master_classes = Classes,
                                 master_sex = Sex},
    sync_dets(NewState),
    {noreply, NewState};
handle_info({set_family_lock, LockLev}, State) ->
    logger:debug("家园设置访问权限:~w", [LockLev], family, 600),
    NewState = State#family_info{visit_lock = LockLev},
    push_family_info(NewState),
    sync_dets(NewState),
    {noreply, NewState};
handle_info(calc_cleanness, State) ->
    NewState = calc_cleanness(State),
    push_family_info(NewState),
    sync_dets(NewState),
    {noreply, NewState};
handle_info({house_keeper_clean, AddCleanness},
            State) ->
    logger:debug("管家清扫", [], family, 615),
    NewState = house_keeper_clean(State, AddCleanness),
    push_family_info(NewState),
    sync_dets(NewState),
    {noreply, NewState};
handle_info({set_cleanness, Cleanness},
            State = #family_info{house_info = HouseInfo}) ->
    logger:debug("设置清洁度", [], family, 622),
    NewState = State#family_info{house_info =
                                     HouseInfo#house_info{cleanness =
                                                              Cleanness}},
    push_family_info(NewState),
    sync_dets(NewState),
    {noreply, NewState};
handle_info(clean_furnishing,
            State = #family_info{house_info = HouseInfo}) ->
    NewState = State#family_info{house_info =
                                     HouseInfo#house_info{furnishings = [],
                                                          next_fur_id = 1}},
    sync_dets(NewState),
    {noreply, NewState};
handle_info({foster_magic_bean, RoleId, RoleName},
            State) ->
    NewState = add_magic_beans_growth(RoleId,
                                      RoleName,
                                      State,
                                      1),
    sync_dets(NewState),
    push_magic_beans(NewState),
    {noreply, NewState};
handle_info({house_keeper_foster, _},
            State = #family_info{house_info =
                                     HouseInfo =
                                         #house_info{housekeeper_action_times =
                                                         Times}}) ->
    FosterState = add_magic_beans_growth({0, "", 0},
                                         lang:get("管家小暖"),
                                         State,
                                         1),
    NewHouseInfo =
        HouseInfo#house_info{housekeeper_action_times =
                                 Times + 1},
    NewState = FosterState#family_info{house_info =
                                           NewHouseInfo},
    sync_dets(NewState),
    push_magic_beans(NewState),
    push_family_info(NewState),
    {noreply, NewState};
handle_info({add_magic_beans_growth, Growth}, State) ->
    NewState = add_magic_beans_growth({0, "", 0},
                                      lang:get("管家小暖"),
                                      State,
                                      Growth),
    sync_dets(NewState),
    push_magic_beans(NewState),
    {noreply, NewState};
handle_info(day_reset, State) ->
    NewState = day_reset(State),
    sync_dets(NewState),
    push_family_info(NewState),
    {noreply, NewState};
handle_info(clean_wake_time,
            State = #family_info{magic_beans = MagicBeans}) ->
    NewState = State#family_info{magic_beans =
                                     MagicBeans#magic_beans{wake_time = 0,
                                                            fosters = [],
                                                            inviters = [],
                                                            beans_rewards =
                                                                []}},
    sync_dets(NewState),
    push_magic_beans(NewState),
    {noreply, NewState};
handle_info({map_garbage_collect, MapPid}, State) ->
    map:stop(MapPid),
    {noreply, State};
handle_info({update_child, Child = #family_child{}},
            State = #family_info{battle_id = BattleId,
                                 house_info =
                                     #house_info{map_id = MapId, lev = Lev}}) ->
    case family_data:get_init_map(Lev) of
        #{map_id := MapBaseId} ->
            do_update_child(Child,
                            #{map_id => MapId, battle_id => BattleId,
                              map_base_id => MapBaseId});
        _ ->
            logger:error("找不到家园配置 ~w", [Lev], family, 701),
            ok
    end,
    {noreply, State};
handle_info({delete_child, Id}, State) ->
    case ets:lookup(family_child, Id) of
        [#family_child{unit_id = {Oub, Oui}}] ->
            unit_mgr:remove({Oub, Oui});
        _ -> ok
    end,
    ets:delete(family_child, Id),
    {noreply, State};
handle_info(system_get_back,
            State = #family_info{id = _FamilyId,
                                 house_info = #house_info{map_pid = MapPid},
                                 visitor = Visitors}) ->
    case length(Visitors) of
        0 ->
            logger:debug("检测到家园:~w不活跃，进行关闭",
                         [_FamilyId],
                         family,
                         719),
            map:stop(MapPid),
            sync_dets(State),
            {stop, normal, State};
        _Count ->
            logger:debug("检测到家园:~w不活跃，但家园内还有参观者[~w]名, 不继续关闭",
                         [_FamilyId, _Count],
                         family,
                         724),
            {noreply, State}
    end;
handle_info(stop,
            State = #family_info{id = _FamilyId,
                                 house_info = #house_info{map_pid = MapPid}}) ->
    logger:debug("家园[~w]进行关闭", [_FamilyId], family, 729),
    map:stop(MapPid),
    sync_dets(State),
    {stop, normal, State};
handle_info(_Info, State) ->
    logger:debug("未处理消息 ~w", [_Info], family, 735),
    {noreply, State}.

terminate(_Reason,
          _State = #family_info{master_id = MasterId}) ->
    catch clear_childs(MasterId),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sync_cache(FamilyInfo = #family_info{}) ->
    ets:insert(family_list, FamilyInfo);
sync_cache(_FamilyInfo) -> skip.

sync_dets(FamilyInfo = #family_info{}) ->
    rank_listener:handle(family, FamilyInfo, 1),
    ets:insert(family_list, FamilyInfo),
    dets:insert(family_list,
                FamilyInfo#family_info{pid = undefined});
sync_dets(_FamilyInfo) -> skip.

push_family(RolePid, FamilyInfo) when is_pid(RolePid) ->
    role:pack_send(RolePid, 11200, {FamilyInfo});
push_family(_Pid, _) ->
    logger:error("错误的家园数据推送：~w", [_Pid], family, 770),
    ok.

push_family_info(FamilyInfo = #family_info{master_id =
                                               MasterId,
                                           lover_id = LoverId,
                                           visitor = Visitor}) ->
    case lists:keyfind(MasterId, 1, Visitor) of
        {_, RolePid} when is_pid(RolePid) ->
            role:pack_send(RolePid, 11218, {FamilyInfo}),
            ok;
        _ -> ok
    end,
    case lists:keyfind(LoverId, 1, Visitor) of
        {_, LoverPid} when is_pid(LoverPid) ->
            role:pack_send(LoverPid, 11218, {FamilyInfo}),
            ok;
        _ -> ok
    end.

push_magic_beans(#family_info{magic_beans = MagicBeans,
                              visitor = Visitor}) ->
    push_magic_beans(MagicBeans, Visitor).

push_magic_beans(_, []) -> ok;
push_magic_beans(MagicBeans, [{_, RolePid} | Rest]) ->
    role:pack_send(RolePid, 11225, {MagicBeans}),
    push_magic_beans(MagicBeans, Rest);
push_magic_beans(#family_info{visitor = Visitor,
                              magic_beans = MagicBeans},
                 RoleId) ->
    case lists:keyfind(RoleId, 1, Visitor) of
        {_, RolePid} ->
            role:pack_send(RolePid, 11225, {MagicBeans}),
            ok;
        _ -> ok
    end.

push_furnishing(RolePid, UpdateInfo)
    when is_pid(RolePid) ->
    logger:debug("同步家具状态:~w", [UpdateInfo], family, 811),
    role:pack_send(RolePid, 11205, {UpdateInfo});
push_furnishing(_Pid, _U) ->
    logger:error("错误的家园数据推送：~w", [_Pid], family, 814),
    ok.

push_bdg_info(RolePid, BdgInfo) when is_pid(RolePid) ->
    role:pack_send(RolePid, 11213, {BdgInfo});
push_bdg_info(_Pid, _U) ->
    logger:error("错误的建筑信息推送：~w", [_Pid], family, 820),
    ok.

sync_furnishing_status(_UpdateInfo, []) -> ok;
sync_furnishing_status(UpdateInfo,
                       [{_, RolePid} | Visitor]) ->
    push_furnishing(RolePid, UpdateInfo),
    sync_furnishing_status(UpdateInfo, Visitor).

calc_env(Furnishings, Lev) ->
    FurTypeList = furnishing_sort_by_type(Furnishings),
    calc_env_by_type(FurTypeList, Lev).

calc_furnishings_Env(Furnishings, Count) ->
    calc_furnishings_Env(Furnishings, Count, 0).

calc_furnishings_Env([], _Count, HouseInv) -> HouseInv;
calc_furnishings_Env(_, Count, HouseInv)
    when Count =< 0 ->
    HouseInv;
calc_furnishings_Env([#furnishing{base_id =
                                      FurnishingBaseId}
                      | Rest],
                     Count, HouseInv) ->
    case family_data:get_furnishing(FurnishingBaseId) of
        #{inv_val := InvVal} ->
            calc_furnishings_Env(Rest,
                                 Count - 1,
                                 InvVal + HouseInv);
        _ -> calc_furnishings_Env(Rest, Count, HouseInv)
    end.

count_furnishing_by_type(Furnishings) ->
    count_furnishing_by_type(Furnishings, []).

count_furnishing_by_type([], CountList) -> CountList;
count_furnishing_by_type([#furnishing{belong =
                                          {0, "", 0},
                                      base_id = BaseId, num = FurNum}
                          | T],
                         CountList) ->
    Fun = fun ({BelongId, List}, Rtn) ->
                  case family_data:get_furnishing(BaseId) of
                      #{type := Type} ->
                          OldNum = case lists:keyfind(Type, 1, List) of
                                       {_, Num} -> Num;
                                       _ -> 0
                                   end,
                          NewList = lists:keystore(Type,
                                                   1,
                                                   List,
                                                   {Type, OldNum + FurNum}),
                          lists:keystore(BelongId, 1, Rtn, {BelongId, NewList});
                      _ -> Rtn
                  end
          end,
    NewCountList = lists:foldl(Fun, [], CountList),
    count_furnishing_by_type(T, NewCountList);
count_furnishing_by_type([#furnishing{base_id = BaseId,
                                      belong = BelongId, num = FurNum}
                          | T],
                         CountList) ->
    case family_data:get_furnishing(BaseId) of
        #{type := Type} ->
            OldList = case lists:keyfind(BelongId, 1, CountList) of
                          {_, List} -> List;
                          _ -> []
                      end,
            OldNum = case lists:keyfind(Type, 1, OldList) of
                         {_, Num} -> Num;
                         _ -> 0
                     end,
            NewList = lists:keystore(Type,
                                     1,
                                     OldList,
                                     {Type, OldNum + FurNum}),
            NewCountList = lists:keystore(BelongId,
                                          1,
                                          CountList,
                                          {BelongId, NewList}),
            count_furnishing_by_type(T, NewCountList);
        _ -> count_furnishing_by_type(T, CountList)
    end;
count_furnishing_by_type([_ | T], CountList) ->
    count_furnishing_by_type(T, CountList).

furnishing_sort_by_type(Furnishings) ->
    furnishing_sort_by_type(Furnishings, []).

furnishing_sort_by_type([], FurTypeList) ->
    SortFun = fun (#furnishing{base_id = FidA},
                   #furnishing{base_id = FidB}) ->
                      case family_data:get_furnishing(FidA) of
                          #{inv_val := AInvVal} ->
                              case family_data:get_furnishing(FidB) of
                                  #{inv_val := BInvVal} -> AInvVal > BInvVal;
                                  _Err ->
                                      logger:error("家具id:~w,错误的配置数据:~w",
                                                   [FidB, _Err],
                                                   family,
                                                   901),
                                      true
                              end;
                          false -> false
                      end;
                  (_, _) -> false
              end,
    Fun = fun ({Type, TL}) ->
                  {Type, lists:sort(SortFun, TL)};
              (_E) -> _E
          end,
    lists:map(Fun, FurTypeList);
furnishing_sort_by_type([F = #furnishing{base_id =
                                             FurnishingBaseId,
                                         status = 2}
                         | Rest],
                        FurTypeList) ->
    case family_data:get_furnishing(FurnishingBaseId) of
        #{type := Type} ->
            case lists:keyfind(Type, 1, FurTypeList) of
                {Type, L} ->
                    NewFurTypeList = lists:keystore(Type,
                                                    1,
                                                    FurTypeList,
                                                    {Type, [F | L]}),
                    furnishing_sort_by_type(Rest, NewFurTypeList);
                false ->
                    furnishing_sort_by_type(Rest,
                                            [{Type, [F]} | FurTypeList])
            end;
        false -> furnishing_sort_by_type(Rest, FurTypeList)
    end;
furnishing_sort_by_type([F = #furnishing{base_id =
                                             FurnishingBaseId,
                                         status = 3}
                         | Rest],
                        FurTypeList) ->
    case family_data:get_furnishing(FurnishingBaseId) of
        #{type := Type} ->
            case lists:keyfind(Type, 1, FurTypeList) of
                {Type, L} ->
                    NewFurTypeList = lists:keystore(Type,
                                                    1,
                                                    FurTypeList,
                                                    {Type, [F | L]}),
                    furnishing_sort_by_type(Rest, NewFurTypeList);
                false ->
                    furnishing_sort_by_type(Rest,
                                            [{Type, [F]} | FurTypeList])
            end;
        false -> furnishing_sort_by_type(Rest, FurTypeList)
    end;
furnishing_sort_by_type([_ | Rest], FurTypeList) ->
    furnishing_sort_by_type(Rest, FurTypeList).

calc_env_by_type(Furnishings, Lev) ->
    calc_env_by_type(Furnishings, Lev, 0).

calc_env_by_type([], _Lev, TotalInv) -> TotalInv;
calc_env_by_type([{Type, FurnishingList} | Rest], Lev,
                 TotalInv) ->
    case family_data:get_furnishing_set_out_info(Lev) of
        SetOutInfo = [_ | _] ->
            case lists:keyfind(Type, 1, SetOutInfo) of
                {_, Count} ->
                    logger:debug("类型为[~w]的家具能摆放[~w]件,目前已经拥有[~w]件",
                                 [Type, Count, length(FurnishingList)],
                                 family,
                                 953),
                    Evn = calc_furnishings_Env(FurnishingList, Count),
                    calc_env_by_type(Rest, Lev, Evn + TotalInv);
                false -> calc_env_by_type(Rest, Lev, TotalInv)
            end;
        false -> calc_env_by_type(Rest, Lev, TotalInv)
    end;
calc_env_by_type([_ | Rest], Lev, TotalInv) ->
    calc_env_by_type(Rest, Lev, TotalInv).

add_frunishing(FamilyInfo = #family_info{house_info =
                                             HouseInfo = #house_info{furnishings
                                                                         =
                                                                         Furnishings,
                                                                     next_fur_id
                                                                         =
                                                                         NextFurId},
                                         visitor = Visitor},
               FurnishingBaseId, RoleId, Count) ->
    Belong = case is_floor(FurnishingBaseId) of
                 true -> {0, "", 0};
                 _ -> RoleId
             end,
    case lists_ext:multikeyfind([{Belong,
                                  #furnishing.belong},
                                 {FurnishingBaseId, #furnishing.base_id},
                                 {1, #furnishing.status}],
                                Furnishings)
        of
        Fur = #furnishing{num = Num} ->
            NewFur = Fur#furnishing{num = Num + Count},
            NewFurnishings = lists_ext:multikeystore([{Belong,
                                                       #furnishing.belong},
                                                      {FurnishingBaseId,
                                                       #furnishing.base_id},
                                                      {1, #furnishing.status}],
                                                     Furnishings,
                                                     NewFur),
            NewHouseInfo = HouseInfo#house_info{furnishings =
                                                    NewFurnishings},
            sync_furnishing_status([{2, NewFur}], Visitor),
            NewFamilyInfo = FamilyInfo#family_info{house_info =
                                                       NewHouseInfo},
            sync_trigger(evt_family_furnishing, NewFamilyInfo, #{}),
            NewFamilyInfo;
        false ->
            NewFur = #furnishing{belong = Belong, id = NextFurId,
                                 base_id = FurnishingBaseId, num = Count,
                                 status = 1},
            NewFurnishings = [NewFur | Furnishings],
            NewHouseInfo = HouseInfo#house_info{furnishings =
                                                    NewFurnishings,
                                                next_fur_id = NextFurId + 1},
            sync_furnishing_status([{1, NewFur}], Visitor),
            NewFamilyInfo = FamilyInfo#family_info{house_info =
                                                       NewHouseInfo},
            sync_trigger(evt_family_furnishing, NewFamilyInfo, #{}),
            NewFamilyInfo
    end.

edit_furnishing(FamilyInfo = #family_info{house_info =
                                              HouseInfo =
                                                  #house_info{furnishings =
                                                                  Furnishings,
                                                              map_pid = MapPid},
                                          visitor = Visitor},
                FurnishingId) ->
    case lists:keyfind(FurnishingId,
                       #furnishing.id,
                       Furnishings)
        of
        #furnishing{status = 3} -> FamilyInfo;
        Fur = #furnishing{status = 2, base_id = BaseId,
                          pos = Pos, dir = Dir} ->
            logger:debug("家具进行编辑:~w", [FurnishingId], family, 996),
            NewFurnishing = Fur#furnishing{status = 3},
            NewFurnishings = lists:keystore(FurnishingId,
                                            #furnishing.id,
                                            Furnishings,
                                            NewFurnishing),
            sync_furnishing_status([{2, NewFurnishing}], Visitor),
            case get_furnishing_block(BaseId, Pos, Dir) of
                RegionBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 0, RegionBlocks};
                _ -> skip
            end,
            FamilyInfo#family_info{house_info =
                                       HouseInfo#house_info{furnishings =
                                                                NewFurnishings}};
        _ -> FamilyInfo
    end.

set_out_furnishing(FamilyInfo = #family_info{visitor =
                                                 Visitor,
                                             house_info =
                                                 HouseInfo =
                                                     #house_info{furnishings =
                                                                     Furnishings,
                                                                 next_fur_id =
                                                                     NextFurId,
                                                                 floor_lev =
                                                                     FloorId,
                                                                 furishing_max_lev_info
                                                                     =
                                                                     FurMaxLevInfo,
                                                                 lev = HouseLev,
                                                                 map_pid =
                                                                     MapPid}},
                   FurnishingId, ToPos, Dir) ->
    case lists:keyfind(FurnishingId,
                       #furnishing.id,
                       Furnishings)
        of
        Fur = #furnishing{status = 1, num = 1,
                          base_id = BaseId} ->
            NewFur = Fur#furnishing{status = 2, pos = ToPos,
                                    dir = Dir},
            NewFurnishings = lists:keystore(FurnishingId,
                                            #furnishing.id,
                                            Furnishings,
                                            NewFur),
            NewFurMaxLevInfo = case
                                   family_data:get_furnishing(BaseId)
                                   of
                                   #{type := Type} ->
                                       case
                                           calc_furnishings_maxlev_by_type(NewFurnishings,
                                                                           HouseLev,
                                                                           Type)
                                           of
                                           FurMaxLev = [_ | _] ->
                                               lists:keystore(Type,
                                                              1,
                                                              FurMaxLevInfo,
                                                              {Type,
                                                               FurMaxLev});
                                           _ -> FurMaxLevInfo
                                       end;
                                   _ -> FurMaxLevInfo
                               end,
            HouseInfo1 = HouseInfo#house_info{furnishings =
                                                  NewFurnishings,
                                              furishing_max_lev_info =
                                                  NewFurMaxLevInfo},
            FamilyInfo1 = FamilyInfo#family_info{house_info =
                                                     HouseInfo1},
            FamilyInfo2 = case is_floor(BaseId) of
                              true ->
                                  BackFloorFamilyInfo = #family_info{house_info
                                                                         =
                                                                         BackUpHouseInfo} =
                                                            get_back_furnishing(FamilyInfo1,
                                                                                FloorId),
                                  BackFloorFamilyInfo#family_info{house_info =
                                                                      BackUpHouseInfo#house_info{floor_lev
                                                                                                     =
                                                                                                     FurnishingId}};
                              _ -> FamilyInfo1
                          end,
            sync_furnishing_status([{3, Fur}, {1, NewFur}],
                                   Visitor),
            NewFamilyInfo = update_family_env(FamilyInfo2),
            push_family_info(NewFamilyInfo),
            apply_master_update_effect(NewFamilyInfo),
            case get_furnishing_block(BaseId, ToPos, Dir) of
                RegionBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 1, RegionBlocks};
                _ -> skip
            end,
            NewFamilyInfo;
        Fur = #furnishing{base_id = BaseId, status = 1,
                          belong = Belong, num = Num}
            when Num > 1 ->
            SetOutFur = #furnishing{status = 2, pos = ToPos,
                                    dir = Dir, id = FurnishingId,
                                    belong = Belong, base_id = BaseId},
            NewFur = Fur#furnishing{num = Num - 1, id = NextFurId},
            SetOutFurnishings = lists:keystore(FurnishingId,
                                               #furnishing.id,
                                               Furnishings,
                                               NewFur),
            NewFurnishings = [SetOutFur | SetOutFurnishings],
            NewFurMaxLevInfo = case
                                   family_data:get_furnishing(BaseId)
                                   of
                                   #{type := Type} ->
                                       case
                                           calc_furnishings_maxlev_by_type(NewFurnishings,
                                                                           HouseLev,
                                                                           Type)
                                           of
                                           FurMaxLev = [_ | _] ->
                                               lists:keystore(Type,
                                                              1,
                                                              FurMaxLevInfo,
                                                              {Type,
                                                               FurMaxLev});
                                           _ -> FurMaxLevInfo
                                       end;
                                   _ -> FurMaxLevInfo
                               end,
            HouseInfo1 = HouseInfo#house_info{furnishings =
                                                  NewFurnishings,
                                              next_fur_id = NextFurId + 1,
                                              furishing_max_lev_info =
                                                  NewFurMaxLevInfo},
            FamilyInfo1 = FamilyInfo#family_info{house_info =
                                                     HouseInfo1},
            FamilyInfo2 = case is_floor(BaseId) of
                              true ->
                                  BackFloorFamilyInfo = #family_info{house_info
                                                                         =
                                                                         BackUpHouseInfo} =
                                                            get_back_furnishing(FamilyInfo1,
                                                                                FloorId),
                                  BackFloorFamilyInfo#family_info{house_info =
                                                                      BackUpHouseInfo#house_info{floor_lev
                                                                                                     =
                                                                                                     FurnishingId}};
                              _ -> FamilyInfo1
                          end,
            sync_furnishing_status([{1, SetOutFur}, {2, NewFur}],
                                   Visitor),
            NewFamilyInfo = update_family_env(FamilyInfo2),
            push_family_info(NewFamilyInfo),
            apply_master_update_effect(NewFamilyInfo),
            case get_furnishing_block(BaseId, ToPos, Dir) of
                RegionBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 1, RegionBlocks};
                _ -> skip
            end,
            NewFamilyInfo;
        Fur = #furnishing{status = 2, num = 1, base_id = BaseId,
                          pos = FromPos, dir = FromDir} ->
            logger:debug("同摆放家具时:~w", [FurnishingId], family, 1098),
            NewFur = Fur#furnishing{pos = ToPos, dir = Dir},
            NewFurnishings = lists:keystore(FurnishingId,
                                            #furnishing.id,
                                            Furnishings,
                                            NewFur),
            NewHouseInfo = HouseInfo#house_info{furnishings =
                                                    NewFurnishings},
            sync_furnishing_status([{2, NewFur}], Visitor),
            case get_furnishing_block(BaseId, FromPos, FromDir) of
                FromBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 0, FromBlocks};
                _ -> skip
            end,
            case get_furnishing_block(BaseId, ToPos, Dir) of
                ToBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 1, ToBlocks};
                _ -> skip
            end,
            FamilyInfo#family_info{house_info = NewHouseInfo};
        Fur = #furnishing{status = 3, base_id = BaseId} ->
            NewFur = Fur#furnishing{pos = ToPos, dir = Dir,
                                    status = 2},
            NewFurnishings = lists:keystore(FurnishingId,
                                            #furnishing.id,
                                            Furnishings,
                                            NewFur),
            NewHouseInfo = HouseInfo#house_info{furnishings =
                                                    NewFurnishings},
            sync_furnishing_status([{2, NewFur}], Visitor),
            case get_furnishing_block(BaseId, ToPos, Dir) of
                ToBlocks = [_ | _] ->
                    MapPid ! {switch_active_region, 1, ToBlocks};
                _ -> skip
            end,
            FamilyInfo#family_info{house_info = NewHouseInfo};
        _Err ->
            logger:debug("无法查询到家具:~w", [_Err], family, 1126),
            FamilyInfo
    end.

get_back_furnishing(FamilyInfo = #family_info{house_info
                                                  =
                                                  HouseInfo = #house_info{lev =
                                                                              Lev,
                                                                          furnishings
                                                                              =
                                                                              Furnishings,
                                                                          map_pid
                                                                              =
                                                                              MapPid,
                                                                          furishing_max_lev_info
                                                                              =
                                                                              FurMaxLevInfo},
                                              visitor = Visitor},
                    FurnishingId) ->
    logger:debug("进行回收家具:~w", [FurnishingId], family, 1131),
    case lists:keyfind(FurnishingId,
                       #furnishing.id,
                       Furnishings)
        of
        OldFur = #furnishing{status = Status, pos = FromPos,
                             dir = FromDir, belong = Belong, base_id = BaseId}
            when Status =:= 2 orelse Status =:= 3 ->
            case lists_ext:multikeyfind([{Belong,
                                          #furnishing.belong},
                                         {BaseId, #furnishing.base_id},
                                         {1, #furnishing.status}],
                                        Furnishings)
                of
                Fur = #furnishing{id = Fid, num = Num} ->
                    logger:debug("回收家具[~w], 堆叠到组[~w]",
                                 [FurnishingId, Fid],
                                 family,
                                 1136),
                    RemoveFurnshings = lists:keydelete(FurnishingId,
                                                       #furnishing.id,
                                                       Furnishings),
                    NewFur = Fur#furnishing{num = Num + 1},
                    NewFurnishings = lists:keystore(Fid,
                                                    #furnishing.id,
                                                    RemoveFurnshings,
                                                    NewFur),
                    sync_furnishing_status([{3, OldFur}, {2, NewFur}],
                                           Visitor),
                    case get_furnishing_block(BaseId, FromPos, FromDir) of
                        RegionBlocks = [_ | _] ->
                            MapPid ! {switch_active_region, 0, RegionBlocks};
                        _ -> skip
                    end,
                    NewFurMaxLevInfo = case
                                           family_data:get_furnishing(BaseId)
                                           of
                                           #{type := Type} ->
                                               case
                                                   calc_furnishings_maxlev_by_type(NewFurnishings,
                                                                                   Lev,
                                                                                   Type)
                                                   of
                                                   FurMaxLev = [_ | _] ->
                                                       lists:keystore(Type,
                                                                      1,
                                                                      FurMaxLevInfo,
                                                                      {Type,
                                                                       FurMaxLev});
                                                   _ -> FurMaxLevInfo
                                               end;
                                           _ -> FurMaxLevInfo
                                       end,
                    logger:debug("新计算出的家具效果为:~w",
                                 [NewFurMaxLevInfo],
                                 family,
                                 1159),
                    FamilyInfo1 = FamilyInfo#family_info{house_info =
                                                             HouseInfo#house_info{furnishings
                                                                                      =
                                                                                      NewFurnishings,
                                                                                  furishing_max_lev_info
                                                                                      =
                                                                                      NewFurMaxLevInfo}},
                    NewFamilyInfo = update_family_env(FamilyInfo1),
                    apply_master_update_effect(NewFamilyInfo),
                    NewFamilyInfo;
                false ->
                    NewFur = OldFur#furnishing{status = 1},
                    NewFurnishings = lists:keystore(FurnishingId,
                                                    #furnishing.id,
                                                    Furnishings,
                                                    NewFur),
                    NewFurMaxLevInfo = case
                                           family_data:get_furnishing(BaseId)
                                           of
                                           #{type := Type} ->
                                               case
                                                   calc_furnishings_maxlev_by_type(NewFurnishings,
                                                                                   Lev,
                                                                                   Type)
                                                   of
                                                   FurMaxLev = [_ | _] ->
                                                       lists:keystore(Type,
                                                                      1,
                                                                      FurMaxLevInfo,
                                                                      {Type,
                                                                       FurMaxLev});
                                                   _ -> FurMaxLevInfo
                                               end;
                                           _ -> FurMaxLevInfo
                                       end,
                    sync_furnishing_status([{3, OldFur}, {2, NewFur}],
                                           Visitor),
                    case get_furnishing_block(BaseId, FromPos, FromDir) of
                        RegionBlocks = [_ | _] ->
                            MapPid ! {switch_active_region, 0, RegionBlocks};
                        _ -> skip
                    end,
                    FamilyInfo1 = FamilyInfo#family_info{house_info =
                                                             HouseInfo#house_info{furnishings
                                                                                      =
                                                                                      NewFurnishings,
                                                                                  furishing_max_lev_info
                                                                                      =
                                                                                      NewFurMaxLevInfo}},
                    NewFamilyInfo = update_family_env(FamilyInfo1),
                    apply_master_update_effect(NewFamilyInfo),
                    NewFamilyInfo
            end;
        _ -> FamilyInfo
    end.

calc_dynamic_region(Furnishings) ->
    calc_dynamic_region(Furnishings, []).

calc_dynamic_region([], RegionBlocks) -> RegionBlocks;
calc_dynamic_region([#furnishing{base_id = BaseId,
                                 pos = Pos, dir = Dir, status = 2}
                     | Rest],
                    RegionBlocks) ->
    Blocks = get_furnishing_block(BaseId, Pos, Dir),
    calc_dynamic_region(Rest, Blocks ++ RegionBlocks);
calc_dynamic_region([_ | Rest], RegionBlocks) ->
    calc_dynamic_region(Rest, RegionBlocks).

get_furnishing_block(BaseId, ToPos, Dir) ->
    case family_data:get_furnishing(BaseId) of
        #{gird_id := GridId} ->
            GridData = family_data:get_furnishing_map_grid(GridId,
                                                           Dir),
            {_Px, _Py, X, Y} = ToPos,
            Fun = fun ({Py, Px}) -> {X + Px, Y + Py};
                      (_) -> {1, 1}
                  end,
            lists:map(Fun, GridData);
        _ -> []
    end.

is_floor(BaseId) ->
    case family_data:get_furnishing(BaseId) of
        #{type := 15} -> true;
        _ -> false
    end.

get_furnishing_max_lev(Furnishings, Type) ->
    get_furnishing_max_lev(Furnishings, Type, 0).

get_furnishing_max_lev([], _, MaxLev) -> MaxLev;
get_furnishing_max_lev([#furnishing{base_id = BaseId,
                                    status = 2}
                        | Rest],
                       Type, MaxLev) ->
    case family_data:get_furnishing(BaseId) of
        #{type := Type, lev := Lev} ->
            NewLev = max(Lev, MaxLev),
            get_furnishing_max_lev(Rest, Type, NewLev);
        _ -> get_furnishing_max_lev(Rest, Type, MaxLev)
    end;
get_furnishing_max_lev([_ | Rest], Type, MaxLev) ->
    get_furnishing_max_lev(Rest, Type, MaxLev).

apply_master_update_effect(#family_info{master_id =
                                            MasterId,
                                        lover_id = LoverId,
                                        house_info =
                                            #house_info{furishing_max_lev_info =
                                                            FurMaxLevInfo,
                                                        bdg_info = BdgInfo}}) ->
    case role_query:local_pid(by_id, MasterId) of
        {ok, MasterPid} ->
            role:apply(async,
                       MasterPid,
                       {family_logic,
                        update_family_effect_push,
                        [FurMaxLevInfo, BdgInfo]}),
            ok;
        _ -> skip
    end,
    case LoverId =/= {0, "", 0} of
        true ->
            case role_query:local_pid(by_id, LoverId) of
                {ok, LoverPid} ->
                    role:apply(async,
                               LoverPid,
                               {family_logic,
                                update_family_effect_push,
                                [FurMaxLevInfo, BdgInfo]}),
                    ok;
                _ -> skip
            end;
        false -> skip
    end.

move_out_family_furnishing(RoleId, Furnishings) ->
    Fun = fun (#furnishing{belong = Belong}) ->
                  Belong =/= RoleId;
              (_) -> false
          end,
    lists:filter(Fun, Furnishings).

move_to_family_furnishing(_RoleId, [], FamilyInfo) ->
    FamilyInfo;
move_to_family_furnishing(RoleId, [{FurId, Num} | Rest],
                          FamilyInfo) ->
    NewFamilyInfo = add_frunishing(FamilyInfo,
                                   FurId,
                                   RoleId,
                                   Num),
    move_to_family_furnishing(RoleId, Rest, NewFamilyInfo);
move_to_family_furnishing(RoleId, [_ | Rest],
                          FamilyInfo) ->
    move_to_family_furnishing(RoleId, Rest, FamilyInfo).

batch_get_furnishing_max_lev(Furnishings, HouseLev,
                             TypeList) ->
    batch_get_furnishing_max_lev(Furnishings,
                                 TypeList,
                                 HouseLev,
                                 []).

batch_get_furnishing_max_lev(_, [], _HouseLev,
                             MaxLevInfo) ->
    MaxLevInfo;
batch_get_furnishing_max_lev([], _, _HouseLev,
                             MaxLevInfo) ->
    MaxLevInfo;
batch_get_furnishing_max_lev(Furnishings,
                             [{Type, _Count} | Rest], HouseLev, MaxLevInfo) ->
    TypeMaxLevList =
        calc_furnishings_maxlev_by_type(Furnishings,
                                        HouseLev,
                                        Type),
    batch_get_furnishing_max_lev(Furnishings,
                                 Rest,
                                 HouseLev,
                                 [{Type, TypeMaxLevList} | MaxLevInfo]).

calc_cleanness(FamilyInfo = #family_info{house_info =
                                             HouseInfo = #house_info{cleanness =
                                                                         Cleanness,
                                                                     last_clean_time
                                                                         =
                                                                         LastCleanTime}}) ->
    Now = date:unixtime(),
    case get(cleanness_ref) of
        CLRef when is_reference(CLRef) ->
            erlang:cancel_timer(CLRef);
        _ -> skip
    end,
    MTimeout = date:next_diff(23, 50, 4),
    CleannessRef = erlang:send_after(MTimeout * 1000,
                                     self(),
                                     calc_cleanness),
    put(cleanness_ref, CleannessRef),
    DescCleanness = util:floor((Now - LastCleanTime) /
                                   86400)
                        * 20,
    logger:debug("计算清洁度，扣除的清洁度为:~w",
                 [DescCleanness],
                 family,
                 1300),
    NewLastTime = Now + MTimeout - 86400,
    NewCleanness = max(Cleanness - DescCleanness, 0),
    FamilyInfo#family_info{house_info =
                               HouseInfo#house_info{cleanness = NewCleanness,
                                                    last_clean_time =
                                                        NewLastTime}}.

house_keeper_clean(FamilyInfo = #family_info{house_info
                                                 =
                                                 HouseInfo =
                                                     #house_info{housekeeper_action_times
                                                                     =
                                                                     ActionTimes,
                                                                 cleanness =
                                                                     Cleanness}},
                   AddCleanness) ->
    NewCleanness = min(100, Cleanness + AddCleanness),
    NewHouseInfo = HouseInfo#house_info{cleanness =
                                            NewCleanness,
                                        housekeeper_action_times =
                                            ActionTimes + 1},
    FamilyInfo#family_info{house_info = NewHouseInfo}.

day_reset(FamilyInfo = #family_info{house_info =
                                        HouseInfo,
                                    magic_beans = MagicBeans}) ->
    case get(day_reset_ref) of
        DSRef when is_reference(DSRef) ->
            erlang:cancel_timer(DSRef);
        _ -> skip
    end,
    RTimeout = date:next_diff(0, 0, 4),
    DayResetRef = erlang:send_after(RTimeout * 1000,
                                    self(),
                                    day_reset),
    put(day_reset_ref, DayResetRef),
    Now = date:unixtime(),
    NewRfTime = Now + RTimeout - 86400,
    HouseInfo1 =
        HouseInfo#house_info{housekeeper_action_times = 0},
    MagicBeans1 = MagicBeans#magic_beans{fosters = []},
    FamilyInfo#family_info{house_info = HouseInfo1,
                           magic_beans = MagicBeans1, last_rf_time = NewRfTime}.

add_event_record(RoleId, RoleName, EventRecord) ->
    Now = date:unixtime(),
    EventList = family_data:get_magic_beans_event(),
    Event = case util:rand_list(EventList, 2) of
                {TmpEvent, _} when RoleId =/= {0, "", 0} -> TmpEvent;
                _ -> 1
            end,
    NineRecord = get_nine_record(EventRecord),
    [{Now, RoleId, RoleName, Event} | NineRecord].

get_nine_record(EventRecord) ->
    get_nine_record(EventRecord, 1, []).

get_nine_record([], _Count, NineRecord) ->
    lists:reverse(NineRecord);
get_nine_record(_, Count, NineRecord) when Count > 9 ->
    lists:reverse(NineRecord);
get_nine_record([EventInfo | Rest], Count,
                NineRecord) ->
    get_nine_record(Rest,
                    Count + 1,
                    [EventInfo | NineRecord]).

add_magic_beans_growth(RoleId, RoleName,
                       FamilyInfo = #family_info{master_id = MasterId,
                                                 magic_beans =
                                                     MagicBeans =
                                                         #magic_beans{growth =
                                                                          Growth,
                                                                      flower_num
                                                                          =
                                                                          FlowerNum,
                                                                      event_record
                                                                          =
                                                                          EventRecord,
                                                                      fosters =
                                                                          Fosters}},
                       Num) ->
    NewGrowth = min(Growth + Num, 10),
    NewEventRecord = add_event_record(RoleId,
                                      RoleName,
                                      EventRecord),
    NewFosters = case RoleId =/= {0, "", 0} of
                     true -> [RoleId | Fosters];
                     _ -> Fosters
                 end,
    NewMagicBeans = case NewGrowth >= 10 of
                        true ->
                            Title = lang:get("点亮许愿树"),
                            ReContent = case FlowerNum =:= 4 of
                                            true ->
                                                lang:get("您家园中的许愿树已经点亮了月亮，一份宝藏在月光中出现，快回家领取吧");
                                            false ->
                                                notice:format(lang:get("您家园中的许愿树已经点亮了第~ts颗星星，一份宝藏在星光中出现，快回家领取吧"),
                                                              [{string_2,
                                                                1,
                                                                FlowerNum + 1}])
                                        end,
                            mail:send(MasterId,
                                      #{title => Title, content => ReContent,
                                        items => []}),
                            case FlowerNum =:= 4 of
                                true ->
                                    MagicBeans#magic_beans{growth = NewGrowth,
                                                           event_record =
                                                               NewEventRecord,
                                                           flower_num =
                                                               FlowerNum + 1,
                                                           fosters = NewFosters,
                                                           inviters = []};
                                _ ->
                                    MagicBeans#magic_beans{growth = NewGrowth,
                                                           event_record =
                                                               NewEventRecord,
                                                           flower_num =
                                                               FlowerNum + 1,
                                                           fosters = NewFosters}
                            end;
                        false ->
                            MagicBeans#magic_beans{growth = NewGrowth,
                                                   event_record =
                                                       NewEventRecord,
                                                   fosters = NewFosters}
                    end,
    FamilyInfo#family_info{magic_beans = NewMagicBeans}.

transform_furnishings(Furnishings) ->
    transform_furnishings(Furnishings, []).

transform_furnishings([], NewFurList) -> NewFurList;
transform_furnishings([Fur = #furnishing{status = 2,
                                         pos = {Px, Py, Gx, Gy}}
                       | Rest],
                      NewFurList) ->
    NewPos = {Px + 580, Py - 7, Gx + 29, Gy},
    NewFur = Fur#furnishing{pos = NewPos},
    transform_furnishings(Rest, [NewFur | NewFurList]);
transform_furnishings([Fur | Rest], NewFurList) ->
    transform_furnishings(Rest, [Fur | NewFurList]).

notify_visit_trans_map([], _) -> ok;
notify_visit_trans_map([{_, RolePid} | Rest],
                       FamilyId) ->
    role:apply(async,
               RolePid,
               {family_logic, apply_enter, [FamilyId]}),
    notify_visit_trans_map(Rest, FamilyId);
notify_visit_trans_map([_ | Rest], FamilyId) ->
    notify_visit_trans_map(Rest, FamilyId).

is_need_upgrade_map(NewLev, OldLev) ->
    case NewLev > OldLev of
        true ->
            case family_data:get_init_map(NewLev) of
                #{map_id := NewMapId} ->
                    case family_data:get_init_map(OldLev) of
                        #{map_id := NewMapId} -> normal;
                        #{} -> upgrade;
                        false -> normal
                    end;
                false -> normal
            end;
        false -> skip
    end.

notice_master(#family_info{master_id = MasterId,
                           lover_id = LoverId, visitor = Visitors},
              Msg, inhouse) ->
    case lists:keyfind(MasterId, 1, Visitors) of
        {_, MasterPid} -> notice:send({pid, MasterPid}, 3, Msg);
        _ -> skip
    end,
    case lists:keyfind(LoverId, 1, Visitors) of
        {_, LoverPid} -> notice:send({pid, LoverPid}, 3, Msg);
        _ -> skip
    end.

calc_furnishings_maxlev_by_type(Furnishings, HouseLev,
                                Type) ->
    LimitList = get_function_effect_list([5, 11, 8, 10],
                                         HouseLev),
    case lists:keyfind(Type, 1, LimitList) of
        {_, Count} ->
            MaxLevFurnishingList =
                get_max_furnishing_by_count(Furnishings, Type, Count),
            logger:debug("家具类型：~w, 生效数量:~w, 等级列表:~w",
                         [Type, Count, MaxLevFurnishingList],
                         family,
                         1443),
            Fun = fun (#furnishing{base_id = BaseId}, R) ->
                          case family_data:get_furnishing(BaseId) of
                              #{lev := Lev} -> [Lev | R];
                              _ -> R
                          end
                  end,
            lists:foldr(Fun, [], MaxLevFurnishingList);
        _ -> []
    end.

get_max_furnishing_by_count(Furnishings, Type, Count) ->
    get_max_furnishing_by_count(Furnishings,
                                Type,
                                Count,
                                []).

get_max_furnishing_by_count([], _Type, Count,
                            MaxLevFurList) ->
    SortFun = fun (#furnishing{base_id = FidA},
                   #furnishing{base_id = FidB}) ->
                      case family_data:get_furnishing(FidA) of
                          #{inv_val := AInvVal} ->
                              case family_data:get_furnishing(FidB) of
                                  #{inv_val := BInvVal} -> AInvVal > BInvVal;
                                  false -> true
                              end;
                          false -> false
                      end;
                  (_, _) -> false
              end,
    SortList = lists:sort(SortFun, MaxLevFurList),
    lists_ext:forward(SortList, Count);
get_max_furnishing_by_count([Fur = #furnishing{base_id =
                                                   BaseId,
                                               status = 2}
                             | Rest],
                            Type, Count, MaxLevFurList) ->
    case family_data:get_furnishing(BaseId) of
        #{type := Type} ->
            get_max_furnishing_by_count(Rest,
                                        Type,
                                        Count,
                                        [Fur | MaxLevFurList]);
        _ ->
            get_max_furnishing_by_count(Rest,
                                        Type,
                                        Count,
                                        MaxLevFurList)
    end;
get_max_furnishing_by_count([_Fur | Rest], Type, Count,
                            MaxLevFurList) ->
    get_max_furnishing_by_count(Rest,
                                Type,
                                Count,
                                MaxLevFurList).

add_inviters([], _Len, Inviters) -> {true, Inviters};
add_inviters(_, Len, Inviters) when Len >= 10 ->
    {true, Inviters};
add_inviters([FriendId | Rest], Len, Inviters) ->
    case lists:member(FriendId, Inviters) of
        true -> {false, lang:get("有已经分享了果实的玩家，不能对同一好友分享两次")};
        false ->
            add_inviters(Rest, Len + 1, [FriendId | Inviters])
    end.

produce_beans_rewar(GiverId, GiverName, RoleId,
                    FamilyInfo = #family_info{house_info =
                                                  #house_info{lev = HouseLev,
                                                              map_id = MapId},
                                              magic_beans =
                                                  MagicBeans =
                                                      #magic_beans{beans_rewards
                                                                       =
                                                                       BeansRewards,
                                                                   next_beanrw_id
                                                                       =
                                                                       NextBeanRwId}}) ->
    Now = date:unixtime(),
    case lists_ext:multikeyfind([{GiverId,
                                  #beans_reward.giver_id},
                                 {RoleId, #beans_reward.belong_id}],
                                BeansRewards)
        of
        #beans_reward{id = Id, pos = Pos} ->
            BeanRw = #beans_reward{id = NextBeanRwId + 1,
                                   giver_id = GiverId, giver_name = GiverName,
                                   give_time = Now, belong_id = RoleId,
                                   pos = Pos},
            NewBeansRewards = lists:keystore(Id,
                                             #beans_reward.id,
                                             BeansRewards,
                                             BeanRw),
            NewMagicBeans = MagicBeans#magic_beans{beans_rewards =
                                                       NewBeansRewards,
                                                   next_beanrw_id =
                                                       NextBeanRwId + 1},
            FamilyInfo#family_info{magic_beans = NewMagicBeans};
        false ->
            FilterFun = fun (#beans_reward{belong_id = BelongId}) ->
                                BelongId =:= RoleId
                        end,
            SelfBeansRewards = lists:filter(FilterFun,
                                            BeansRewards),
            case length(SelfBeansRewards) >= 5 of
                true ->
                    SortFun = fun (#beans_reward{give_time = GiveTime1},
                                   #beans_reward{give_time = GiveTime2}) ->
                                      GiveTime1 < GiveTime2
                              end,
                    #beans_reward{id = Id, pos = Pos} =
                        lists_ext:min(SortFun, SelfBeansRewards),
                    Now = date:unixtime(),
                    BeanRw = #beans_reward{id = NextBeanRwId + 1,
                                           giver_id = GiverId,
                                           giver_name = GiverName,
                                           give_time = Now, belong_id = RoleId,
                                           pos = Pos},
                    NewBeansRewards = lists:keystore(Id,
                                                     #beans_reward.id,
                                                     BeansRewards,
                                                     BeanRw),
                    NewMagicBeans = MagicBeans#magic_beans{beans_rewards =
                                                               NewBeansRewards,
                                                           next_beanrw_id =
                                                               NextBeanRwId +
                                                                   1},
                    FamilyInfo#family_info{magic_beans = NewMagicBeans};
                false ->
                    case family_data:get_init_map(HouseLev) of
                        #{map_id := MapBaseId, beans_rewar_pos := RandPos} ->
                            Pos = get_rand_beansrw_pos(RandPos,
                                                       BeansRewards,
                                                       MapId,
                                                       MapBaseId),
                            BeanRw = #beans_reward{id = NextBeanRwId + 1,
                                                   giver_id = GiverId,
                                                   giver_name = GiverName,
                                                   give_time = Now,
                                                   belong_id = RoleId,
                                                   pos = Pos},
                            NewBeansRewards = [BeanRw | BeansRewards],
                            NewMagicBeans = MagicBeans#magic_beans{beans_rewards
                                                                       =
                                                                       NewBeansRewards,
                                                                   next_beanrw_id
                                                                       =
                                                                       NextBeanRwId
                                                                           + 1},
                            FamilyInfo#family_info{magic_beans = NewMagicBeans};
                        _ -> FamilyInfo
                    end
            end
    end.

get_rand_beansrw_pos([], _, MapId, MapBaseId) ->
    case map:rand_pos3(MapId, MapBaseId) of
        false -> {1531, 1109};
        Pos -> Pos
    end;
get_rand_beansrw_pos([Pos = {X, Y} | Rest],
                     BeansRewards, MapId, MapBaseId) ->
    case lists:keyfind(Pos, #beans_reward.pos, BeansRewards)
        of
        false ->
            {Gx, Gy} = translate_pos(MapBaseId, X, Y),
            case map_mgr:is_blocked(MapId, MapBaseId, Gx, Gy) of
                true ->
                    get_rand_beansrw_pos(Rest,
                                         BeansRewards,
                                         MapId,
                                         MapBaseId);
                false -> Pos
            end;
        _ ->
            get_rand_beansrw_pos(Rest,
                                 BeansRewards,
                                 MapId,
                                 MapBaseId)
    end.

get_function_effect_list(FunctionBdgList, HouseLev) ->
    get_function_effect_list(FunctionBdgList, HouseLev, []).

get_function_effect_list([], _, LimitList) -> LimitList;
get_function_effect_list([BdgType | Rest], HouseLev,
                         LimitList) ->
    case family_data:get_furnishing_set_out_info(HouseLev)
        of
        FL = [_ | _] ->
            case lists:keyfind(BdgType, 1, FL) of
                {BdgType, Count} ->
                    get_function_effect_list(Rest,
                                             HouseLev,
                                             [{BdgType, Count} | LimitList]);
                _ -> get_function_effect_list(Rest, HouseLev, LimitList)
            end;
        _ -> get_function_effect_list(Rest, HouseLev, LimitList)
    end.

update_family_env(FamilyInfo = #family_info{house_info =
                                                HouseInfo =
                                                    #house_info{furnishings =
                                                                    Furnishings,
                                                                lev = Lev}}) ->
    Env = calc_env(Furnishings, Lev),
    NewFamilyInfo = FamilyInfo#family_info{house_info =
                                               HouseInfo#house_info{env_val =
                                                                        Env}},
    sync_trigger(evt_family_env, NewFamilyInfo, #{}),
    NewFamilyInfo.

sync_trigger(evt_family,
             #family_info{master_id = MasterId, lover_id = LoverId,
                          house_info = #house_info{lev = Lev}},
             #{}) ->
    Evt = #evt_family{lev = Lev},
    logger:debug("检测家园等级:~w", [lev], family, 1571),
    family_async_fire(MasterId, LoverId, [Evt]);
sync_trigger(evt_family_env,
             #family_info{master_id = MasterId, lover_id = LoverId,
                          house_info = #house_info{env_val = Env}},
             #{}) ->
    Evt = #evt_family_env{env = Env},
    family_async_fire(MasterId, LoverId, [Evt]);
sync_trigger(evt_family_update,
             #family_info{master_id = MasterId, lover_id = LoverId,
                          house_info = #house_info{bdg_info = BdgInfo}},
             #{type := BdgType}) ->
    case lists:keyfind(BdgType,
                       #building_info.type,
                       BdgInfo)
        of
        #building_info{lev = Lev} ->
            Evt = #evt_family_update{type = BdgType, lev = Lev},
            family_async_fire(MasterId, LoverId, [Evt]);
        _ -> skip
    end;
sync_trigger(evt_family_furnishing,
             #family_info{master_id = MasterId, lover_id = LoverId,
                          house_info = #house_info{furnishings = Furnishing}},
             #{}) ->
    CountList = count_furnishing_by_type(Furnishing),
    TypeList1 = case lists:keyfind(MasterId, 1, CountList)
                    of
                    {_, MasterCount} -> MasterCount;
                    _ -> []
                end,
    TypeList2 = case lists:keyfind(LoverId, 1, CountList) of
                    {_, LoverCount} -> LoverCount;
                    _ -> []
                end,
    Evt1 = do_evt_family_furnishing(TypeList1),
    Evt2 = do_evt_family_furnishing(TypeList2),
    family_async_fire(MasterId, undefined, Evt1),
    family_async_fire(undefined, LoverId, Evt2);
sync_trigger(_Type, _FamilyInfo, _Param) ->
    logger:error("错误的成就检测: 类型:~w, 家园数据:~w, 参数:~w",
                 [_Type, _FamilyInfo, _Param],
                 family,
                 1599),
    ok.

family_async_fire(_, _, []) -> ok;
family_async_fire(undefined, LoverId, EvtList) ->
    case LoverId =/= {0, "", 0} of
        true -> role_trigger:async_fire(LoverId, EvtList);
        false -> skip
    end;
family_async_fire(MasterId, undefined, EvtList) ->
    role_trigger:async_fire(MasterId, EvtList);
family_async_fire(MasterId, LoverId, EvtList) ->
    role_trigger:async_fire(MasterId, EvtList),
    case LoverId =/= {0, "", 0} of
        true -> role_trigger:async_fire(LoverId, EvtList);
        false -> skip
    end.

do_evt_family_furnishing([]) -> [];
do_evt_family_furnishing(TypeList) ->
    do_evt_family_furnishing(TypeList, 0, []).

do_evt_family_furnishing([], Num, EvtList) ->
    case Num > 0 of
        true ->
            Evt = #evt_family_furnishing{type = 0, count = Num},
            [Evt | EvtList];
        _ -> EvtList
    end;
do_evt_family_furnishing([{Type, Count} | T], Num,
                         EvtList) ->
    Evt = #evt_family_furnishing{type = Type,
                                 count = Count},
    do_evt_family_furnishing(T,
                             Num + Count,
                             [Evt | EvtList]);
do_evt_family_furnishing([_ | T], Num, EvtList) ->
    do_evt_family_furnishing(T, Num, EvtList).

translate_pos(MapBaseId, Px, Py) ->
    case map_data:get(MapBaseId) of
        {ok,
         #map_data{grid_x = GridWid, grid_y = GridHigh,
                   width = W, height = H}} ->
            MaxX = util:ceil(W / GridWid - 1),
            Tx = max(1,
                     util:floor(util:floor(Px + 5.0e-1) / GridWid + 5.0e-1)),
            Gx = min(Tx, MaxX),
            Ty = max(1,
                     util:floor(util:floor(Py + 5.0e-1) / GridHigh +
                                    5.0e-1)),
            MaxY = util:ceil(H / GridHigh - 1),
            Gy = min(Ty, MaxY),
            {Gx, Gy};
        _ -> {Px, Py}
    end.

init_child(Args = #{master_id := MasterId}) ->
    Kids = child:family_list(MasterId),
    do_init_child(Kids, Args).

do_init_child([], _) -> ok;
do_init_child([Child | Kids], Args) ->
    do_update_child(Child, Args),
    do_init_child(Kids, Args).

do_update_child(Child = #family_child{stage = 2,
                                      unit_base_id = UnitBaseId, name = Name,
                                      id = Id = {I, P, Z}},
                #{battle_id := BattleId, map_id := MapId,
                  map_base_id := MapBaseId}) ->
    case ets:lookup(family_child, Id) of
        [#family_child{unit_id = {Oub, Oui}}] ->
            ets:delete(family_child, Id),
            case unit_mgr:info({Oub, Oui}) of
                {ok, _} -> unit_mgr:remove({Oub, Oui});
                _ -> ok
            end;
        _ -> ok
    end,
    case unit_data:get(UnitBaseId) of
        UnitBase = #unit_data{looks = Looks} ->
            {X, Y} = case MapBaseId of
                         30012 -> {1529, 1089};
                         _ -> {2324, 1445}
                     end,
            case unit_mgr:create(BattleId,
                                 UnitBase#unit_data{name = Name,
                                                    looks =
                                                        [{73, I, Z, P}
                                                         | Looks]},
                                 {MapId, X, Y})
                of
                {ok, _Unit = #unit{id = UnitId}} ->
                    ets:insert(family_child,
                               Child#family_child{unit_id = UnitId}),
                    ok;
                _False -> false
            end;
        _ ->
            logger:error("找不到单位配置 ~w", [UnitBaseId], family, 1687),
            false
    end;
do_update_child(Child = #family_child{stage = 3,
                                      unit_base_id = UnitBaseId, name = Name,
                                      id = Id = {I, P, Z}},
                #{battle_id := BattleId, map_id := MapId,
                  map_base_id := MapBaseId}) ->
    case ets:lookup(family_child, Id) of
        [#family_child{unit_id = {Oub, Oui}}] ->
            ets:delete(family_child, Id),
            case unit_mgr:info({Oub, Oui}) of
                {ok, _} -> unit_mgr:remove({Oub, Oui});
                _ -> ok
            end;
        _ -> ok
    end,
    case unit_data:get(UnitBaseId) of
        UnitBase = #unit_data{looks = Looks} ->
            {X, Y} = case map:rand_pos(MapBaseId) of
                         {Xo, Yo} -> {Xo, Yo};
                         _ -> {2324, 1445}
                     end,
            case unit_mgr:create(BattleId,
                                 UnitBase#unit_data{name = Name,
                                                    looks =
                                                        [{73, I, Z, P}
                                                         | Looks]},
                                 {MapId, X, Y})
                of
                {ok, _Unit = #unit{id = UnitId}} ->
                    ets:insert(family_child,
                               Child#family_child{unit_id = UnitId}),
                    ok;
                _False -> false
            end;
        _ ->
            logger:error("找不到单位配置 ~w", [UnitBaseId], family, 1714),
            false
    end;
do_update_child(_, _) -> ok.

update_child(MasterId, Child) ->
    case family_mgr:info(by_master, MasterId) of
        #family_info{pid = Pid} when is_pid(Pid) ->
            Pid ! {update_child, Child},
            ok;
        _ -> ok
    end.

delete_child(MasterId, Child) ->
    case family_mgr:info(by_master, MasterId) of
        #family_info{pid = Pid} when is_pid(Pid) ->
            Pid ! {delete_child, Child},
            ok;
        _ -> ok
    end.

clear_childs(MasterId) ->
    Kids = child:family_list(MasterId),
    do_clear_childs(Kids).

do_clear_childs([]) -> ok;
do_clear_childs([#family_child{id = Id} | Kids]) ->
    ets:delete(family_child, Id),
    do_clear_childs(Kids);
do_clear_childs([_ | T]) -> do_clear_childs(T).

