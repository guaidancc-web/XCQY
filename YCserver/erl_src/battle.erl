-file("src/mod/battle/battle.erl", 1).

-module(battle).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([create/1,
         create/2,
         create/3,
         start/1,
         find_map_id/1,
         find_map_id/2,
         find_map_id_and_pid/1,
         find_map_id_and_pid/2,
         add_timer/2,
         del_timer/1,
         run_trigger/3,
         login/2,
         stop/0,
         stop/1,
         make_mfa/1,
         trigger/2]).

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

-file("src/mod/battle/battle.erl", 30).

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

-file("src/mod/battle/battle.erl", 31).

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

-file("src/mod/battle/battle.erl", 32).

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

-file("src/mod/battle/battle.erl", 33).

-spec create(BattleName :: atom()) -> {false,
                                       bitstring()} |
                                      {ok, pos_integer(), pid()}.

create(BattleName) ->
    SubId = 0,
    SubType = 0,
    create(BattleName, {SubId, SubType}).

create(BattleName, {SubId, SubType}) ->
    create(BattleName, {SubId, SubType}, []).

create(BattleName, {SubId, SubType}, Args) ->
    case battle_mgr:fetch_ids(1) of
        {ok, [Id]} ->
            logger:debug("战场ID:~w", [Id], battle, 49),
            War = BattleName:cfg(),
            NewWar = War#battle_base{id = Id, sub_id = SubId,
                                     sub_type = SubType},
            case start(NewWar, Args) of
                {ok, Pid} ->
                    Platform = env:get(platform),
                    ZoneId = env:get(zone_id),
                    {ok, Platform, ZoneId, Id, Pid};
                _Err ->
                    logger:error("创建战场时发生错误:~w", [_Err], battle, 58),
                    {false, _Err}
            end;
        _Err ->
            logger:error("创建战场时发生错误:~w", [_Err], battle, 62),
            {false, _Err}
    end.

start(Battle) -> start(Battle, []).

start(Battle, Args) ->
    gen_server:start(battle, [Battle, Args], []).

add_timer(TriName, Timer) ->
    do_add_timer(TriName, Timer, get_timer()).

del_timer(TriName) ->
    TimerList = get_timer(),
    NewTimerList = case lists:keyfind(TriName, 1, TimerList)
                       of
                       {TriName, Ref, _} ->
                           case is_reference(Ref) of
                               true -> erlang:cancel_timer(Ref);
                               false -> ignore
                           end,
                           lists:keydelete(TriName, 1, TimerList);
                       false -> TimerList
                   end,
    put(battle_timer, NewTimerList).

get_timer() ->
    case get(battle_timer) of
        Btimer when is_list(Btimer) -> Btimer;
        undefined -> []
    end.

stop() ->
    self() ! stop,
    ok.

stop(Pid) when is_pid(Pid) ->
    Pid ! stop,
    ok;
stop(_) -> ok.

make_mfa(Mfa) when is_list(Mfa) ->
    [make_mfa(A) || A <- Mfa];
make_mfa({M, F, A}) ->
    catch erlang:apply(M, F, make_mfa(A));
make_mfa(Mfa) -> Mfa.

find_map_id(MapBaseId) ->
    NormalMap = map_data:startup(),
    case lists:member(MapBaseId, NormalMap) of
        true -> {ok, MapBaseId};
        false ->
            case lists:keyfind(MapBaseId,
                               1,
                               case get(maps) of
                                   Maps when is_list(Maps) -> Maps;
                                   _ -> []
                               end)
                of
                {MapBaseId, MapId, _MapPid} -> {ok, MapId};
                _ -> false
            end
    end.

find_map_id(MapBaseId, LoadMaps) ->
    NormalMap = map_data:startup(),
    case lists:member(MapBaseId, NormalMap) of
        true -> {ok, MapBaseId};
        false ->
            case lists:keyfind(MapBaseId, 1, LoadMaps) of
                {MapBaseId, MapId, _MapPid} -> {ok, MapId};
                _ -> false
            end
    end.

find_map_id_and_pid(MapBaseId) ->
    NormalMap = map_data:startup(),
    case lists:member(MapBaseId, NormalMap) of
        true ->
            case map_mgr:pid(MapBaseId) of
                {ok, MapPid} -> {ok, MapBaseId, MapPid};
                _ -> false
            end;
        false ->
            case lists:keyfind(MapBaseId,
                               1,
                               case get(maps) of
                                   Maps when is_list(Maps) -> Maps;
                                   _ -> []
                               end)
                of
                {MapBaseId, MapId, MapPid} -> {ok, MapId, MapPid};
                _ -> false
            end
    end.

find_map_id_and_pid(MapBaseId, LoadMaps) ->
    NormalMap = map_data:startup(),
    case lists:member(MapBaseId, NormalMap) of
        true ->
            case map_mgr:pid(MapBaseId) of
                {ok, MapPid} -> {ok, MapBaseId, MapPid};
                _ -> false
            end;
        false ->
            case lists:keyfind(MapBaseId, 1, LoadMaps) of
                {MapBaseId, MapId, MapPid} -> {ok, MapId, MapPid};
                _ -> false
            end
    end.

run_trigger(TriName, Evt, Flag) ->
    case get({trigger, TriName}) of
        undefined -> ignore;
        Trigger = #battle_trigger{status = open} ->
            run_trigger(get(battle_name), Trigger, Evt, Flag);
        _ -> ignore
    end.

login(Pid, LoginEvt) when is_pid(Pid) ->
    case catch gen_server:call(Pid,
                               {login, LoginEvt},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
login(_, _) -> false.

init([_BattleBase = #battle_base{id = Id, type = Type,
                                 name = Name, map = Map, global = Global,
                                 unit = Unit, trigger = Trigger,
                                 enter_point = EnterPoint, sub_type = SubType,
                                 sub_id = SubId},
      Args]) ->
    process_flag(trap_exit, true),
    put(battle_name, Name),
    put(battle_id, Id),
    put(battle_start_time, date:unixtime()),
    put(battle_args, Args),
    put(battle_sub_id, SubId),
    put(battle_combat_info,
        #battle_combat_info{sub_id = SubId,
                            sub_type = SubType}),
    load_global(Global),
    case load_map(Map) of
        false -> {stop, "地图载入失败, 无法开启"};
        LoadMaps ->
            load_unit(Id, Unit),
            load_trigger(Trigger),
            B = #battle{id = Id, name = Name, pid = self(),
                        type = Type, map = LoadMaps, enter_point = EnterPoint,
                        sub_type = SubType, sub_id = SubId},
            NewBattle = B,
            sync(NewBattle),
            {ok, NewBattle}
    end.

handle_call({apply_sync, {F}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F, [State]),
                             {undefined, F, []},
                             State);
handle_call({apply_sync, {F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F,
                                                [State | A]),
                             {undefined, F, A},
                             State);
handle_call({apply_sync, {M, F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(M,
                                                F,
                                                [State | A]),
                             {M, F, A},
                             State);
handle_call(_Request, _From, Battle) ->
    {noreply, Battle}.

handle_cast(_Msg, Battle) -> {noreply, Battle}.

handle_info({event, Evt},
            Battle = #battle{type = Type}) ->
    Reply = case Type of
                2 -> battle_dungeon:evt(Battle, Evt);
                _ -> skip
            end,
    case Reply of
        {ok, NewBattle} -> {noreply, NewBattle};
        ok -> {noreply, Battle};
        {false, Reason} ->
            logger:error("事件[~w]处理返回结果错误[~ts]",
                         [Evt, Reason],
                         battle,
                         236),
            {noreply, Battle};
        {stop, Reason, NewBattle} -> {stop, Reason, NewBattle};
        skip -> {noreply, Battle};
        _Err ->
            logger:error("事件[~w]处理返回结果错误[~w]",
                         [Evt, _Err],
                         battle,
                         243),
            {noreply, Battle}
    end;
handle_info({timer_tick, TriName}, Battle) ->
    do_tick(TriName, get_timer()),
    {noreply, Battle};
handle_info(stop, Battle = #battle{type = Type}) ->
    case Type of
        2 -> battle_dungeon:stop(Battle);
        _ -> {stop, normal, Battle}
    end;
handle_info({apply_async, {F}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
                                                 [State]),
                              {undefined, F, []},
                              State);
handle_info({apply_async, {F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
                                                 [State | A]),
                              {undefined, F, A},
                              State);
handle_info({apply_async, {M, F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(M,
                                                 F,
                                                 [State | A]),
                              {M, F, A},
                              State);
handle_info({countdown_do, M, F, A}, State) ->
    logger:debug("=========================================",
                 [],
                 battle,
                 268),
    erlang:apply(M, F, A),
    {noreply, State};
handle_info(_Info, Battle) -> {noreply, Battle}.

terminate(_Reason, Battle = #battle{type = Type}) ->
    case Type of
        2 -> battle_dungeon:terminate(Battle);
        _ -> skip
    end,
    ets:delete(battle, get(battle_id)),
    ok.

code_change(_OldVsn, Battle, _Extra) -> {ok, Battle}.

sync(Battle) -> ets:insert(battle, Battle).

handle_apply_async_return({ok, NewState}, _Mfa, _State)
    when is_record(NewState, battle) ->
    sync(NewState),
    {noreply, NewState};
handle_apply_async_return(ok, _Mfa, State) ->
    {noreply, State};
handle_apply_async_return({stop, Reason, NewState},
                          _Mfa, _State)
    when is_record(NewState, battle) ->
    {stop, Reason, NewState};
handle_apply_async_return(Else, {M, F, A}, State) ->
    logger:error("战场[~w]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#battle.name, M, F, A, Else],
                 battle,
                 309),
    {noreply, State}.

handle_apply_sync_return({ok, Reply, NewState}, _Mfa,
                         _State)
    when is_record(NewState, battle) ->
    sync(NewState),
    {reply, Reply, NewState};
handle_apply_sync_return({ok, Reply}, _Mfa, State) ->
    {reply, Reply, State};
handle_apply_sync_return({stop, Reason, NewState}, _Mfa,
                         _State)
    when is_record(NewState, battle) ->
    {stop, Reason, NewState};
handle_apply_sync_return({stop,
                          Reason,
                          Reply,
                          NewState},
                         _Mfa, _State)
    when is_record(NewState, battle) ->
    {stop, Reason, Reply, NewState};
handle_apply_sync_return(Else, {M, F, A}, State) ->
    logger:error("战场[~w]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [State#battle.name, M, F, A, Else],
                 battle,
                 325),
    {reply, Else, State}.

load_map(Maps) ->
    NormalMap = map_data:startup(),
    load_map(Maps, NormalMap, []).

load_map([], _, Maps) ->
    NewMaps = lists:reverse(Maps),
    put(maps, NewMaps),
    NewMaps;
load_map([H | T], NormalMap, Maps) ->
    case lists:member(H, NormalMap) of
        true ->
            logger:error("战场[~w]非法创建默认开启地图[~w]",
                         [get(battle_name), H],
                         battle,
                         342),
            false;
        false ->
            case map_mgr:create(H) of
                {ok, MapPid, MapId} ->
                    load_map(T, NormalMap, [{H, MapId, MapPid} | Maps]);
                {error, _Err} ->
                    logger:error("战场[~w]启动地图[~w]失败:~w",
                                 [get(battle_name), H, _Err],
                                 battle,
                                 349),
                    false
            end
    end.

load_unit(BattleId, UnitList) ->
    battle_fun:create_unit(BattleId, UnitList).

load_global([]) -> ok;
load_global([{Key = count_down, Val} | T]) ->
    put({global, Key}, date:unixtime() + Val),
    load_global(T);
load_global([{Key = count_down2, Val} | T]) ->
    put({global, Key}, date:unixtime() + Val),
    load_global(T);
load_global([{Key, Val} | T]) ->
    put({global, Key}, Val),
    load_global(T).

load_trigger([]) -> ok;
load_trigger([Tri = #battle_trigger{name = Name,
                                    event = []}
              | T]) ->
    put({trigger, Name}, Tri),
    load_trigger(T);
load_trigger([Tri = #battle_trigger{status = Status,
                                    name = Name, event = Event,
                                    condition = Cond, action = Action}
              | T]) ->
    put({trigger, Name}, Tri),
    load_listener(Status, Event, Name, Cond, Action),
    load_trigger(T).

load_listener(_Status, [], _TriName, _Cond, _Action) ->
    ok;
load_listener(Status,
              [{timer, Mode, TimeOut, Times} | T], TriName, Cond,
              Action) ->
    Ts = make_mfa(TimeOut),
    case Status of
        open ->
            Timer = #tri_timer{mode = Mode, times = Times,
                               timeout = Ts},
            add_timer(TriName, Timer);
        _ -> skip
    end,
    load_listener(Status, T, TriName, Cond, Action);
load_listener(Status, [Evt | T], TriName, Cond,
              Action) ->
    Key = {listener, element(1, Evt)},
    case get(Key) of
        undefined -> put(Key, [TriName]);
        L -> put(Key, [TriName | L])
    end,
    load_listener(Status, T, TriName, Cond, Action).

trigger([], _Evt) -> ok;
trigger([TriName | T], Evt) ->
    case get({trigger, TriName}) of
        undefined -> ignore;
        Trigger = #battle_trigger{status = open} ->
            run_trigger(get(battle_name), Trigger, Evt, true);
        _ -> ignore
    end,
    trigger(T, Evt).

run_trigger(BattleName,
            _Trigger = #battle_trigger{name = TriName,
                                       condition = Cond},
            _Evt, true) ->
    case battle_cond:check(Cond) of
        true ->
            case catch erlang:apply(BattleName, trigger, [TriName])
                of
                ok -> ok;
                Err ->
                    logger:error("执行触发器{~w, trigger, ~w}时发生错误: ~w",
                                 [BattleName, TriName, Err],
                                 battle,
                                 425)
            end;
        false -> ignore
    end;
run_trigger(BattleName,
            _Trigger = #battle_trigger{name = TriName}, _Evt,
            false) ->
    case catch erlang:apply(BattleName, trigger, [TriName])
        of
        ok -> ok;
        Err ->
            logger:error("执行触发器{~w, trigger, ~w}时发生错误: ~w",
                         [BattleName, TriName, Err],
                         battle,
                         434)
    end.

do_add_timer(TriName,
             Timer = #tri_timer{timeout = TimeOut}, TimerList) ->
    case lists:keyfind(TriName, 1, TimerList) of
        false ->
            Ref = erlang:send_after(TimeOut * 1000,
                                    self(),
                                    {timer_tick, TriName}),
            NewTimerList = [{TriName, Ref, Timer} | get_timer()],
            put(battle_timer, NewTimerList);
        {TriName, Ref, #tri_timer{}} ->
            case erlang:read_timer(Ref) of
                false ->
                    NewRef = erlang:send_after(TimeOut * 1000,
                                               self(),
                                               {timer_tick, TriName}),
                    NewTimerList = lists:keyreplace(TriName,
                                                    1,
                                                    get_timer(),
                                                    {TriName, NewRef, Timer}),
                    put(battle_timer, NewTimerList);
                _ -> ignore
            end;
        _Else ->
            logger:error("设置战场定时器错误[~w:~w]",
                         [get(battle_name), TriName],
                         battle,
                         454),
            ignore
    end.

do_tick(TriName, TimerList) ->
    case lists:keyfind(TriName, 1, TimerList) of
        false ->
            logger:error("错误的战场定时器触发[~w]", [TriName], battle, 462),
            ignore;
        {TriName,
         _Ref,
         Timer = #tri_timer{mode = Mode, times = Times,
                            timeout = TimeOut}} ->
            put(battle_last_evt, {timer_tick}),
            run_trigger(TriName, {timer_tick}, true),
            NowTimerList = get_timer(),
            case lists:keyfind(TriName, 1, NowTimerList) of
                false -> ignore;
                _ ->
                    case Mode of
                        cycle ->
                            NewRef = erlang:send_after(TimeOut * 1000,
                                                       self(),
                                                       {timer_tick, TriName}),
                            NewTimerList = lists:keyreplace(TriName,
                                                            1,
                                                            NowTimerList,
                                                            {TriName,
                                                             NewRef,
                                                             Timer}),
                            put(battle_timer, NewTimerList);
                        count when Times > 1 ->
                            NewTimer = Timer#tri_timer{times = Times - 1},
                            NewRef = erlang:send_after(TimeOut * 1000,
                                                       self(),
                                                       {timer_tick, TriName}),
                            NewTimerList = lists:keyreplace(TriName,
                                                            1,
                                                            NowTimerList,
                                                            {TriName,
                                                             NewRef,
                                                             NewTimer}),
                            put(battle_timer, NewTimerList);
                        _ ->
                            NewTimerList = lists:keydelete(TriName,
                                                           1,
                                                           NowTimerList),
                            put(battle_timer, NewTimerList)
                    end
            end
    end.

