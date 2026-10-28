-file("src/mod/role/role.erl", 1).

-module(role).

-behaviour(gen_server).

-export([start/1,
         stop/3,
         rpc/3,
         rpc/5,
         disconnect/2,
         pack_send/2,
         pack_send/3,
         link_send/2,
         link_send/3,
         apply/3,
         convert/2,
         element/2,
         send_buff_begin/0,
         send_buff_flush/0,
         send_buff_clean/0,
         send_buff_print/1,
         get_exp_mod/3,
         send_buff_clean/1,
         get_new_role_name/1]).

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

-file("src/mod/role/role.erl", 35).

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

-file("src/mod/role/role.erl", 36).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/mod/role/role.erl", 37).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/role/role.erl", 38).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/role/role.erl", 39).

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

-file("src/mod/role/role.erl", 40).

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

-file("src/mod/role/role.erl", 41).

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

-file("src/mod/role/role.erl", 42).

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

-file("src/mod/role/role.erl", 43).

-file("inc/log.hrl", 1).

-file("src/mod/role/role.erl", 44).

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

-file("src/mod/role/role.erl", 45).

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

-file("src/mod/role/role.erl", 46).

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

-file("src/mod/role/role.erl", 47).

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

-file("src/mod/role/role.erl", 48).

-spec start(Role :: #role{}) -> {ok, pid()} |
                                ignore |
                                {error, term()}.

start(#role{id = {_, P, Z}, account = Acc} = Role) ->
    LocalName = list_to_atom(lists:concat(["role_",
                                           binary_to_list(unicode:characters_to_binary(Acc)),
                                           "_",
                                           P,
                                           "_",
                                           Z])),
    gen_server:start({local, LocalName}, role, [Role], []).

-spec stop(async | sync, pid(), bitstring()) -> ok.

stop(async, RolePid, Msg) when is_pid(RolePid) ->
    RolePid ! {stop, Msg},
    ok;
stop(sync, RolePid, Msg) when is_pid(RolePid) ->
    case catch gen_server:call(RolePid, {stop, Msg}, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
stop(_, _, _) -> ok.

disconnect(RolePid, Reason) ->
    RolePid ! {disconnect, Reason},
    ok.

-spec rpc(RolePid :: pid(), Code :: pos_integer(),
          Data :: tuple()) -> ok.

rpc(RolePid, Code, Data) ->
    case mapping:module(game_server, Code) of
        {ok, _Auth, _Caller, Proto, Mod} ->
            case Proto:pack(cli, Code, Data) of
                {ok, <<_A1:32, _A2:16, Bin/binary>>} ->
                    RolePid ! {rpc, srv, Proto, Mod, Code, Bin};
                {error, Reason} ->
                    logger:error("打包数据出错[Code:~w][Reason:~w]",
                                 [Code, Reason],
                                 role,
                                 131)
            end;
        {error, _Code} ->
            logger:error("模块影射失败[~w]:~w", [Code, Data], role, 134)
    end.

-spec rpc(RolePid, Parser, Mod, Code,
          Bin) -> ok when RolePid :: pid(), Parser :: atom(),
                          Mod :: atom(), Code :: pos_integer(), Bin :: binary().

rpc(RolePid, Parser, Mod, Code, Bin) ->
    RolePid ! {rpc, cli, Parser, Mod, Code, Bin},
    ok.

-spec apply(T, RolePid, Mfa) -> ok |
                                {error, not_online} |
                                {error, not_pid} |
                                {error, self_call} |
                                Reply when T :: async | sync, RolePid :: pid(),
                                           Mfa :: {F} | {F, A} | {M, F, A},
                                           M :: atom(), F :: function(),
                                           A :: list(), Reply :: term().

apply(T, {Rid, P, Z}, Mfa) ->
    case role_query:pid(by_id, Rid, P, Z) of
        {ok, Pid} -> role:apply(T, Pid, Mfa);
        _ -> {error, not_online}
    end;
apply(_T, RolePid, _Mfa) when not is_pid(RolePid) ->
    {error, not_pid};
apply(async, RolePid, {F}) ->
    RolePid ! {apply_async, {F}},
    ok;
apply(async, RolePid, {F, A}) ->
    RolePid ! {apply_async, {F, A}},
    ok;
apply(async, RolePid, {M, F, A}) ->
    RolePid ! {apply_async, {M, F, A}},
    ok;
apply(sync, RolePid, Mfa) when self() =:= RolePid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用者[~w:~w]执行apply[~w]时发生错误：调用了自身",
                 [M, F, Mfa],
                 role,
                 177),
    {error, self_call};
apply(sync, RolePid, {F}) ->
    case catch gen_server:call(RolePid,
                               {apply_sync, F},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, RolePid, {F, A}) ->
    case catch gen_server:call(RolePid,
                               {apply_sync, {F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
apply(sync, RolePid, {M, F, A}) ->
    case catch gen_server:call(RolePid,
                               {apply_sync, {M, F, A}},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

-spec convert(RolePid, Type) -> {ok, tuple()} |
                                {error, timeout} |
                                {error, noproc} |
                                {error, term()} when RolePid :: pid(),
                                                     Type :: atom().

convert(RolePid, _Type) when self() =:= RolePid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用者[~w:~w]执行role:convert/2时发生错误：调用了自身",
                 [M, F],
                 role,
                 193),
    {error, self_call};
convert(RolePid, Type) ->
    case catch gen_server:call(RolePid,
                               {convert, Type},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

-spec element(RolePid, ElemPos) -> {ok, [term()]} |
                                   {error, self_call} when RolePid :: pid(),
                                                           ElemPos ::
                                                               [pos_integer()].

element(RolePid, _ElemPos) when self() =:= RolePid ->
    {M, F, _, _} = hd(tl(erlang:get_stacktrace())),
    logger:error("调用自身失败:~w",
                 [util:get_stacktrace()],
                 role,
                 205),
    logger:error("调用者[~w:~w]执行role:element/2时发生错误：调用了自身",
                 [M, F],
                 role,
                 206),
    {error, self_call};
element(RolePid, ElemPos) when is_list(ElemPos) ->
    case catch gen_server:call(RolePid,
                               {element, ElemPos},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

-spec send_buff_begin() -> ok.

send_buff_begin() ->
    case get(is_role_process) of
        true ->
            case get(evt_transaction) of
                undefined -> put(evt_transaction, []);
                _ -> ok
            end,
            put(send_buff, [[] | get(send_buff)]);
        _ ->
            logger:error("不能在非角色进程内使用发送缓冲区", [], role, 227),
            ignore
    end,
    fun_call:trans_begin(),
    ok.

-spec send_buff_flush() -> ok.

send_buff_flush() ->
    case get(send_buff) of
        [] -> logger:error("发送缓冲区数据时发生异常:缓冲区为空", [], role, 238);
        [[]] -> put(send_buff, []);
        [H] ->
            get(conn_pid) ! {send_data, lists:reverse(H)},
            put(send_buff, []);
        [H, H1 | T] ->
            put(send_buff, [[lists:reverse(H) | H1] | T]);
        [H | T] -> put(send_buff, [[lists:reverse(H) | T]])
    end,
    fun_call:trans_flush(),
    ok.

-spec send_buff_clean() -> ok.

send_buff_clean() ->
    case get(send_buff) of
        [] -> logger:error("清空缓冲区数据时发生异常:缓冲区为空", [], role, 257);
        [_H] ->
            erase(evt_transaction),
            put(send_buff, []);
        [_H | T] -> put(send_buff, T)
    end,
    fun_call:trans_clean(),
    ok.

send_buff_clean(Code) ->
    case get(send_buff) of
        List = [_ | _] ->
            List2 = lists:flatten(List),
            lists:foreach(fun (H) ->
                                  case catch protocol:uint32(H) of
                                      {_, B} ->
                                          case catch protocol:uint16(B) of
                                              {Code, _} -> send_buff_clean();
                                              _ERR -> ok
                                          end;
                                      _ -> ok
                                  end
                          end,
                          List2);
        _ -> ok
    end,
    ok.

-spec send_buff_print(_) -> ok.

send_buff_print(_) ->
    case get(send_buff) of
        [] ->
            logger:debug("缓存数据为空", [], role, 294),
            ok;
        _H = [_ | _] ->
            logger:debug("缓存数据为:~w", [_H], role, 296),
            ok;
        _ ->
            logger:debug("缓存数据为空", [], role, 298),
            ok
    end.

-spec pack_send(RolePid, Code,
                Data) -> ok when RolePid :: pid(),
                                 Code :: pos_integer(), Data :: tuple().

pack_send(#role{pid = Pid}, Code, Data) ->
    pack_send(Pid, Code, Data);
pack_send(RolePid, Code, Data) when is_pid(RolePid) ->
    case mapping:module(game_server, Code) of
        {ok, _Auth, _Caller, Proto, _ModName} ->
            case catch Proto:pack(srv, Code, Data) of
                {ok, Bin} -> RolePid ! {socket_proxy, Bin};
                {error, Reason} ->
                    logger:debug("错误的数据信息 ~w", [Data], role, 318),
                    logger:error("打包数据出错[Code:~w][Reason:~w]",
                                 [Code, Reason],
                                 role,
                                 319);
                _Err ->
                    logger:error("打包数据出错[Code:~w, Data:~w][Err:~w]",
                                 [Code, Data, _Err],
                                 role,
                                 321)
            end;
        {error, _Code} ->
            logger:error("模块影射失败[~w]:~w", [Code, Data], role, 324)
    end;
pack_send(RoleId = {_, _, _}, Code, Data) ->
    case role_query:pid(by_id, RoleId) of
        {ok, Pid} -> pack_send(Pid, Code, Data);
        _ -> ignore
    end;
pack_send(_Tar, _Code, _Data) ->
    logger:debug("无效的数据同步: Target[~w], Code[~w], Data[~w]",
                 [_Tar, _Code, _Data],
                 role,
                 332),
    ok.

-spec pack_send(RolePid, Bin) -> ok |
                                 false when RolePid :: pid(), Bin :: binary().

pack_send(RolePid, Bin) when is_binary(Bin) ->
    RolePid ! {socket_proxy, Bin},
    ok;
pack_send(_RolePid, Bin) ->
    logger:error("打包数据出错[Data:~w]", [Bin], role, 342),
    false.

-spec link_send(Send, pos_integer(),
                tuple()) -> ok when Send :: pid() | #role{} | #link{}.

link_send(#role{link = #link{conn_pid = ConnPid}}, Code,
          Data) ->
    link_send(ConnPid, Code, Data);
link_send(#link{conn_pid = ConnPid}, Code, Data) ->
    link_send(ConnPid, Code, Data);
link_send(ConnPid, Code, Data) when is_pid(ConnPid) ->
    sys_conn:pack_send(ConnPid, Code, Data).

-spec link_send(pos_integer(), tuple()) -> ok.

link_send(Code, Data) ->
    case get(conn_pid) of
        undefined ->
            logger:error("无法在非角色进程内调用: ~w", [Code], role, 363);
        ConnPid -> link_send(ConnPid, Code, Data)
    end.

init([#role{id = {Rid, P, Z}, account = Acc,
            link = Link = #link{conn_pid = ConnPid}} =
          Role]) ->
    put(is_role_process, true),
    put(already_handle_stop, false),
    put(already_login, false),
    put(role_info, {Rid, P, Z, Acc}),
    put(conn_pid, ConnPid),
    put(send_buff, []),
    put(log_transaction, []),
    put(confirm_idx, lists:seq(1, 10)),
    put(prompt_idx, lists:seq(1, 5)),
    process_flag(trap_exit, true),
    link(ConnPid),
    self() ! init,
    {ok,
     Role#role{loop_counter = 1, need_sync = false,
               pid = self(), link = Link}}.

handle_call({apply_sync, {F}}, _From, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_sync_return(catch erlang:apply(F, [Role]),
                             {undefined, F, []},
                             Role);
handle_call({apply_sync, {F, A}}, _From, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_sync_return(catch erlang:apply(F,
                                                [Role | A]),
                             {undefined, F, A},
                             Role);
handle_call({apply_sync, {M, F, A}}, _From, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_sync_return(catch erlang:apply(M,
                                                F,
                                                [Role | A]),
                             {M, F, A},
                             Role);
handle_call({convert, to_role}, _From, Role) ->
    {reply, {ok, Role}, Role};
handle_call({convert, Type}, _From, Role) ->
    {reply, role_convert:to(Type, Role), Role};
handle_call({element, Pos}, _From, Role)
    when is_list(Pos) ->
    {reply,
     {ok,
      lists:reverse(do_element(Pos,
                               Role,
                               tuple_size(Role),
                               []))},
     Role};
handle_call({stop, Msg}, _From, Role) ->
    {stop, normal, do_stop(Role, Msg)};
handle_call(_Request, _From, Role) -> {noreply, Role}.

handle_cast(_Msg, Role) -> {noreply, Role}.

handle_info(init, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    role:send_buff_begin(),
    case role_login:do(Role) of
        {error, _Msg} ->
            role:send_buff_clean(),
            {stop, normal, Role};
        {ok, NewRole = #role{cross_type = CrossType}} ->
            role:send_buff_clean(),
            put(already_login, true),
            role_query:sync_cache(NewRole),
            role_query:sync_index(NewRole),
            {ok, Ginfo} = role_convert:to(member, NewRole),
            role_group:join(world, Ginfo),
            case CrossType of
                1 ->
                    cross:cast(role_group, join, [center_world, Ginfo]);
                _ -> ignore
            end,
            log:login(NewRole, login, date:unixtime(), 0, "角色登录"),
            self() ! loop,
            erlang:send_after(10000, self(), delay_init),
            {noreply, NewRole}
    end;
handle_info(delay_init, Role) ->
    case role_login:delay_do(Role) of
        {error, _Msg} ->
            logger:error("延迟登陆初始出错:~w", [_Msg], role, 445),
            {noreply, Role};
        {ok, NewRole = #role{attr = #attr{fc = Fc}}} ->
            case put(role_last_fc, Fc) of
                Fc -> skip;
                _ -> robot_mgr:update(NewRole)
            end,
            {noreply, NewRole}
    end;
handle_info({stop, Msg}, Role) ->
    {stop, normal, do_stop(Role, Msg)};
handle_info(loop,
            Role = #role{attr = #attr{fc = Fc}, loop_counter = C,
                         need_sync = Sync, link = Link}) ->
    case C rem 9 =:= 0 of
        false -> ignore;
        true -> garbage_collect()
    end,
    case C rem 30 of
        0 ->
            role_data:save_info(Role),
            case put(role_last_fc, Fc) of
                Fc -> skip;
                _ ->
                    team:sync_info(Role),
                    robot_mgr:update(Role),
                    wedding:update_fc(Role),
                    teacher:update_fc(Role)
            end;
        _ -> skip
    end,
    S = case C rem 2 =:= 0 andalso Sync of
            false -> Sync;
            true ->
                role_data:local_save(cache, Role),
                false
        end,
    case C rem 6 =:= 0 of
        false -> ignore;
        true ->
            case Link of
                #link{conn_pid = ConnPid} ->
                    case process_info(ConnPid, message_queue_len) of
                        {_, QueueLen} when QueueLen > 10000 ->
                            logger:debug("连接进程堆积消息过多，断开连接", [], role, 502),
                            erlang:exit(ConnPid, kill);
                        _ -> ignore
                    end;
                _ -> ignore
            end
    end,
    erlang:send_after(util:rand(20000, 35000),
                      self(),
                      loop),
    {noreply,
     Role#role{loop_counter = C + 1, need_sync = S}};
handle_info({apply_async, {F}}, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_async_return(catch erlang:apply(F, [Role]),
                              {undefined, F, []},
                              Role);
handle_info({apply_async, {F, A}}, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_async_return(catch erlang:apply(F,
                                                 [Role | A]),
                              {undefined, F, A},
                              Role);
handle_info({apply_async, {M, F, A}}, Role) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    handle_apply_async_return(catch erlang:apply(M,
                                                 F,
                                                 [Role | A]),
                              {M, F, A},
                              Role);
handle_info({timer_tick, Key},
            Role = #role{timer =
                             #rtimer{key = Key, timers = [Timer | _]}}) ->
    put(rpc_code, 0),
    put(role_gain_items, []),
    put(role_loss_items, []),
    put(role_loss_auto_buy_items, []),
    put(shop_auto_buy_items, []),
    put(log_transaction, []),
    put(role_gain_talisman, []),
    put(role_gain_log_items, []),
    erase(fun_call_transaction),
    erase(evt_transaction),
    NewRole = role_timer:tick(Role),
    NRole = role_monitor:check(timer,
                               0,
                               {Timer},
                               Role,
                               NewRole),
    {noreply, NRole};
handle_info({timer_tick, _Key},
            Role = #role{name = _Name}) ->
    logger:debug("角色[~ts]接收到非法定时器:~w",
                 [_Name, _Key],
                 role,
                 533),
    {noreply, Role};
handle_info({rpc, From, Parser, Mod, Code, Bin},
            Role = #role{link = #link{conn_pid = ConnPid}}) ->
    NewRole = case rpc_cfg:get(Code) of
                  {error, _Reason} ->
                      logger:debug("获取rpc配置时发生错误: ~w", [_Reason], role, 542),
                      Role;
                  Rpc ->
                      handle_rpc(Rpc#rpc{parser = Parser, mod = Mod,
                                         req = Bin},
                                 Role)
              end,
    read_next(From, ConnPid, NewRole);
handle_info({socket_proxy, Bin},
            Role = #role{link = #link{conn_pid = ConnPid}}) ->
    sys_conn:send(ConnPid, Bin),
    {noreply, Role};
handle_info(normal_exit, Role = #role{name = _Name}) ->
    logger:debug("角色[~ts]请求正常退出", [_Name], role, 556),
    self() ! {disconnect, normal_exit},
    combat:role_disconnect(Role),
    {noreply, Role};
handle_info({'EXIT', ConnPid, _Why},
            Role = #role{link =
                             #link{socket = Socket, conn_pid = ConnPid}}) ->
    logger:debug("连接进程断开:~w, 进入退出检测", [_Why], role, 563),
    self() ! {disconnect, conn_exit},
    catch gen_tcp:close(Socket),
    combat:role_disconnect(Role),
    {noreply, Role};
handle_info({disconnect, Reason},
            Role = #role{s_event = Event})
    when Event =:= 12 orelse
             Event =:= 13 orelse
                 Event =:= 37 orelse Event =:= 38 orelse Event == 39 ->
    case get(disconnect_status) of
        {_Status1, _Time1, Ref1} ->
            logger:debug("当前已经进入状态:~w,~w",
                         [_Status1, _Time1],
                         role,
                         577),
            case is_reference(Ref1) of
                true -> erlang:cancel_timer(Ref1);
                false -> skip
            end,
            erlang:erase(disconnect_status);
        _ -> ignore
    end,
    put(ref_timer_disconnect,
        erlang:send_after(5000, self(), {disconnect, Reason})),
    {noreply, Role};
handle_info({disconnect, Reason},
            Role = #role{name = _Name, s_event = Event}) ->
    QuestOfferFlag = is_quest_offer(Role, Reason),
    TeamFlag = need_delay(Role, Reason),
    CombatFlag = in_combat(Role, Reason),
    Flag = case get(disconnect_status) of
               {Status1, Time1, Ref1} ->
                   logger:debug("当前已经进入状态:~w,~w",
                                [Status1, Time1],
                                role,
                                597),
                   case is_reference(Ref1) of
                       true -> erlang:cancel_timer(Ref1);
                       false -> skip
                   end,
                   case Reason of
                       normal_exit ->
                           case {TeamFlag, CombatFlag} of
                               {_, true} ->
                                   {true,
                                    combat,
                                    disconnect_check_time(combat),
                                    date:unixtime()};
                               {true, _}
                                   when Event =:= 25 orelse Event =:= 74 ->
                                   {true,
                                    tournament,
                                    disconnect_check_time(tournament),
                                    date:unixtime()};
                               {_, _}
                                   when Event =:= 54 orelse
                                            Event =:= 53 orelse Event =:= 52 ->
                                   {true,
                                    gold_league,
                                    disconnect_check_time(gold_league),
                                    date:unixtime()};
                               {_, false} -> false
                           end;
                       conn_exit ->
                           case check_disconnect_status(TeamFlag,
                                                        CombatFlag,
                                                        {Status1, Time1})
                               of
                               {true, Status2, CheckTime, Time2} ->
                                   logger:debug("计算得出状态:~w,~w",
                                                [Status2, Time2],
                                                role,
                                                614),
                                   {true, Status2, CheckTime, Time2};
                               _ -> false
                           end
                   end;
               _ ->
                   case Reason of
                       normal_exit ->
                           case {TeamFlag, CombatFlag} of
                               {_, true} ->
                                   {true,
                                    combat,
                                    disconnect_check_time(combat),
                                    date:unixtime()};
                               {true, _}
                                   when Event =:= 25 orelse Event =:= 74 ->
                                   {true,
                                    tournament,
                                    disconnect_check_time(tournament),
                                    date:unixtime()};
                               {_, _}
                                   when Event =:= 54 orelse
                                            Event =:= 53 orelse Event =:= 52 ->
                                   {true,
                                    gold_league,
                                    disconnect_check_time(gold_league),
                                    date:unixtime()};
                               {_, false} -> false
                           end;
                       conn_exit ->
                           case {QuestOfferFlag, TeamFlag, CombatFlag} of
                               {true, _, _} ->
                                   {true,
                                    quest_offer,
                                    disconnect_check_time(quest_offer),
                                    date:unixtime()};
                               {_, true, _}
                                   when Event =:= 25 orelse Event =:= 74 ->
                                   {true,
                                    tournament,
                                    disconnect_check_time(tournament),
                                    date:unixtime()};
                               {_, _, _}
                                   when Event =:= 54 orelse
                                            Event =:= 53 orelse Event =:= 52 ->
                                   {true,
                                    gold_league,
                                    disconnect_check_time(gold_league),
                                    date:unixtime()};
                               {_, true, _} ->
                                   {true,
                                    team,
                                    disconnect_check_time(team),
                                    date:unixtime()};
                               {_, _, true} ->
                                   {true,
                                    combat,
                                    disconnect_check_time(combat),
                                    date:unixtime()};
                               {_, false, false} ->
                                   {true,
                                    normal,
                                    disconnect_check_time(normal),
                                    date:unixtime()}
                           end
                   end
           end,
    NewReason = case {CombatFlag, Event} of
                    {true, _} -> Reason;
                    {_, 25} -> conn_exit;
                    {_, 74} -> conn_exit;
                    {_, 54} -> conn_exit;
                    {_, 53} -> conn_exit;
                    {_, 52} -> conn_exit;
                    _ -> Reason
                end,
    logger:debug("玩家离线检测保持下线时间:~w", [Flag], role, 649),
    case Flag of
        false -> {stop, normal, do_stop(Role, "")};
        {true, NewStatus, NewCheckTime, NewTime} ->
            NewRef = erlang:send_after(NewCheckTime,
                                       self(),
                                       {disconnect, NewReason}),
            put(disconnect_status, {NewStatus, NewTime, NewRef}),
            logger:debug("[~ts]进入[~w]状态, 已开启[~w]秒, 定时监测频率为[~w]毫秒, "
                         "断开原因为[~w]",
                         [_Name,
                          NewStatus,
                          date:unixtime() - NewTime,
                          NewCheckTime,
                          Reason],
                         role,
                         655),
            {noreply, Role}
    end;
handle_info(_Info, Role = #role{name = Name}) ->
    logger:error("角色进程[~ts]收到未知消息: ~w",
                 [Name, _Info],
                 role,
                 661),
    {noreply, Role}.

terminate(_Reason,
          Role = #role{cross_type = CrossType}) ->
    NewRole = case get(already_handle_stop) of
                  true -> Role;
                  _ -> do_stop(Role, "")
              end,
    role_group:leave(world, Role#role.pid),
    case CrossType of
        1 ->
            cross:cast(role_group,
                       leave,
                       [center_world, Role#role.pid]);
        _ -> ignore
    end,
    role_query:clean(NewRole),
    case role_data:local_save(to_db, NewRole) of
        ok -> role_data:clean_cache(Role#role.id);
        {error, Err} ->
            logger:error("角色数据[~ts]同步到数据库时发生异常，请勿清空role_data.dets: ~w",
                         [Role#role.name, Err],
                         role,
                         680)
    end,
    map:role_leave(NewRole),
    ok.

code_change(_OldVsn, Role, _Extra) -> {ok, Role}.

disconnect_check_time(combat) -> 8 * 1000;
disconnect_check_time(team) -> 60 * 1000;
disconnect_check_time(normal) -> 60 * 1000;
disconnect_check_time(quest_offer) -> 70 * 1000;
disconnect_check_time(tournament) -> 10 * 1000;
disconnect_check_time(gold_league) -> 60 * 1000;
disconnect_check_time(_) -> 10 * 1000.

disconnect_delay_time(Label) ->
    case {env:get(platform), env:get(zone_id)} of
        {"unite", 1} -> disconnect_delay_time(special, Label);
        _ -> disconnect_delay_time(normal, Label)
    end.

disconnect_delay_time(normal, combat) -> 5;
disconnect_delay_time(normal, team) -> 3600;
disconnect_delay_time(normal, normal) -> 600;
disconnect_delay_time(normal, tournament) -> 3600;
disconnect_delay_time(normal, quest_offer) -> 5400;
disconnect_delay_time(normal, gold_league) -> 3600;
disconnect_delay_time(normal, _) -> 5;
disconnect_delay_time(_, combat) -> 5;
disconnect_delay_time(_, team) -> 1800;
disconnect_delay_time(_, normal) -> 300;
disconnect_delay_time(_, tournament) -> 3600;
disconnect_delay_time(_, quest_offer) -> 3600;
disconnect_delay_time(_, _) -> 5.

check_disconnect_status(_TeamFlag, CombatFlag,
                        {team, Time}) ->
    Now = date:unixtime(),
    DelayTime = disconnect_delay_time(team),
    LastTime = Time + DelayTime - Now,
    case LastTime > 0 of
        true -> {true, team, disconnect_check_time(team), Time};
        false ->
            case CombatFlag of
                true ->
                    {true,
                     combat,
                     disconnect_check_time(combat),
                     date:unixtime()};
                false -> false
            end
    end;
check_disconnect_status(_TeamFlag, CombatFlag,
                        {tournament, Time}) ->
    Now = date:unixtime(),
    DelayTime = disconnect_delay_time(tournament),
    LastTime = Time + DelayTime - Now,
    case LastTime > 0 of
        true ->
            {true,
             tournament,
             disconnect_check_time(tournament),
             Time};
        false ->
            case CombatFlag of
                true ->
                    {true,
                     combat,
                     disconnect_check_time(combat),
                     date:unixtime()};
                false -> false
            end
    end;
check_disconnect_status(_TeamFlag, CombatFlag,
                        {gold_league, Time}) ->
    Now = date:unixtime(),
    DelayTime = disconnect_delay_time(gold_league),
    LastTime = Time + DelayTime - Now,
    case LastTime > 0 of
        true ->
            {true,
             gold_league,
             disconnect_check_time(gold_league),
             Time};
        false ->
            case CombatFlag of
                true ->
                    {true,
                     combat,
                     disconnect_check_time(combat),
                     date:unixtime()};
                false -> false
            end
    end;
check_disconnect_status(_TeamFlag, CombatFlag,
                        {combat, _Time}) ->
    case CombatFlag of
        true ->
            {true,
             combat,
             disconnect_check_time(combat),
             date:unixtime()};
        false -> false
    end;
check_disconnect_status(_TeamFlag, CombatFlag,
                        {normal, Time}) ->
    Now = date:unixtime(),
    DelayTime = disconnect_delay_time(normal),
    LastTime = Time + DelayTime - Now,
    case LastTime > 0 of
        true ->
            {true, normal, disconnect_check_time(normal), Time};
        false ->
            case CombatFlag of
                true ->
                    {true,
                     combat,
                     disconnect_check_time(combat),
                     date:unixtime()};
                false -> false
            end
    end;
check_disconnect_status(_TeamFlag, CombatFlag,
                        {quest_offer, Time}) ->
    Now = date:unixtime(),
    DelayTime = disconnect_delay_time(quest_offer),
    LastTime = Time + DelayTime - Now,
    case LastTime > 0 of
        true ->
            {true,
             quest_offer,
             disconnect_check_time(quest_offer),
             Time};
        false ->
            case CombatFlag of
                true ->
                    {true,
                     combat,
                     disconnect_check_time(combat),
                     date:unixtime()};
                false -> false
            end
    end.

is_quest_offer(#role{m_quest =
                         #m_quest{quest_offer =
                                      #quest_offer{quest_id = QuestId}}},
               _Reason)
    when QuestId =/= 0 ->
    true;
is_quest_offer(_, _) -> false.

get_exp_mod(Role = #role{lev = Lev}, Mode, TRate) ->
    Rate = (1000 + TRate) / 1000,
    AddExp = case levup_data:get_exp({Mode, Lev}) of
                 #{exp := 0} -> [];
                 #{exp := ExpVal} ->
                     Exp = util:ceil(ExpVal * Rate),
                     [{90010, Exp}];
                 _ -> []
             end,
    AddPetExp = case pet:get_war_pet(Role) of
                    {ok, #pet{lev = PetLev}} ->
                        case levup_data:get_exp({Mode, PetLev}) of
                            #{pet_exp := 0} -> [];
                            #{pet_exp := PetExp} ->
                                [{90005, util:ceil(PetExp * Rate)}];
                            _ -> []
                        end;
                    _ -> []
                end,
    AddCoin = case levup_data:get_exp({Mode, Lev}) of
                  #{coin := 0} -> [];
                  #{coin := Coin} -> [{90000, util:ceil(Coin * Rate)}];
                  _ -> []
              end,
    AddExp ++ AddPetExp ++ AddCoin.

in_combat(#role{m_combat = #m_combat{pid = CombatPid}},
          _Reason) ->
    is_pid(CombatPid) andalso
        util:is_process_alive(CombatPid);
in_combat(_, _) -> false.

need_delay(#role{s_event = 17,
                 m_team = #m_team{pid = TeamPid}},
           _Reason)
    when is_pid(TeamPid) ->
    true;
need_delay(#role{s_event = 32}, _Reason) -> true;
need_delay(#role{s_event = 21}, _Reason) -> true;
need_delay(#role{s_event = 20}, _Reason) -> true;
need_delay(#role{s_event = 27}, _Reason) -> true;
need_delay(#role{s_event = 26}, _Reason) -> true;
need_delay(#role{s_event = 25}, _Reason) -> true;
need_delay(#role{s_event = 54}, _Reason) -> true;
need_delay(#role{s_event = 53}, _Reason) -> true;
need_delay(#role{s_event = 74}, _Reason) -> true;
need_delay(Role, _Reason) ->
    case team:get_status(Role) of
        {true, _} -> true;
        false -> false
    end.

do_stop(Role = #role{name = _Name,
                     link = #link{socket = Socket}},
        Msg) ->
    logger:debug("[~ts]角色进程退出", [_Name], role, 888),
    put(already_handle_stop, true),
    case Msg of
        "" -> skip;
        _ ->
            {ok, Bin} = sys_conn:pack(9901, {0, Msg}),
            catch gen_tcp:send(Socket, Bin),
            ok
    end,
    case get(already_login) of
        true ->
            put(rpc_code, 0),
            put(role_gain_items, []),
            put(role_loss_items, []),
            put(role_loss_auto_buy_items, []),
            put(shop_auto_buy_items, []),
            put(log_transaction, []),
            put(role_gain_talisman, []),
            put(role_gain_log_items, []),
            erase(fun_call_transaction),
            erase(evt_transaction),
            NewRole1 = role_trigger:fire(#evt_logout{}, Role),
            role_logout:do(NewRole1);
        _ -> Role
    end.

do_element([], _Role, _MaxPos, L) -> L;
do_element([H | T], Role, MaxPos, L)
    when H > 0 andalso H =< MaxPos ->
    do_element(T,
               Role,
               MaxPos,
               [erlang:element(H, Role) | L]);
do_element([H | T], Role, MaxPos, L) ->
    logger:error("传给role:element/2的参数不正确: ~w",
                 [H],
                 role,
                 911),
    do_element(T, Role, MaxPos, L).

handle_rpc(#rpc{code = Code, condition = Condition,
                parser = Parser, autolog = Autolog, req = Bin,
                req_desc = {Mreq, Freq, Areq}, mod = Mod,
                reply_desc = {Mreply, Freply, Areply}},
           Role = #role{name = Name, debug_rpc = DebugRpc,
                        link = #link{conn_pid = ConnPid}}) ->
    put(rpc_code, Code),
    case role_cond:check(Condition, Role) of
        {false, _Cond = #condition{msg = Msg}} ->
            logger:debug("RPC调用条件检查未通过: ~w", [_Cond], role, 922),
            sys_conn:pack_send(9901, {0, Msg}),
            Role;
        true ->
            case catch Parser:unpack(srv, Code, Bin) of
                {ok, Data} ->
                    put(rpc_code, 0),
                    put(role_gain_items, []),
                    put(role_loss_items, []),
                    put(role_loss_auto_buy_items, []),
                    put(shop_auto_buy_items, []),
                    put(log_transaction, []),
                    put(role_gain_talisman, []),
                    put(role_gain_log_items, []),
                    erase(fun_call_transaction),
                    erase(evt_transaction),
                    case catch Mod:handle(Code, Data, Role) of
                        ok ->
                            case DebugRpc of
                                false -> ignore;
                                true ->
                                    case os:type() of
                                        {win32, _} ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])]);
                                        _ ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])])
                                    end
                            end,
                            case Autolog of
                                false -> ignore;
                                true -> ignore
                            end,
                            Role;
                        {nosync, NewRole} when is_record(NewRole, role) ->
                            case DebugRpc of
                                false -> ignore;
                                true ->
                                    case os:type() of
                                        {win32, _} ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])]);
                                        _ ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])])
                                    end
                            end,
                            case Autolog of
                                false -> ignore;
                                true -> ignore
                            end,
                            NRole = role_monitor:check(Mod,
                                                       Code,
                                                       Data,
                                                       Role,
                                                       NewRole),
                            NRole;
                        {nosync, Reply, NewRole}
                            when is_record(NewRole, role) ->
                            case DebugRpc of
                                false -> ignore;
                                true ->
                                    case os:type() of
                                        {win32, _} ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])]);
                                        _ ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])])
                                    end
                            end,
                            case Autolog of
                                false -> ignore;
                                true -> ignore
                            end,
                            sys_conn:pack_send(ConnPid, Code, Reply),
                            NRole = role_monitor:check(Mod,
                                                       Code,
                                                       Data,
                                                       Role,
                                                       NewRole),
                            NRole;
                        {ok, NewRole} when is_record(NewRole, role) ->
                            case DebugRpc of
                                false -> ignore;
                                true ->
                                    case os:type() of
                                        {win32, _} ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])]);
                                        _ ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])])])
                                    end
                            end,
                            case Autolog of
                                false -> ignore;
                                true -> ignore
                            end,
                            NRole = role_monitor:check(Mod,
                                                       Code,
                                                       Data,
                                                       Role,
                                                       NewRole),
                            role_query:sync_cache(NRole),
                            NRole#role{need_sync = true};
                        {reply, Reply} ->
                            sys_conn:pack_send(ConnPid, Code, Reply),
                            Role;
                        {reply, Reply, NewRole} when is_record(NewRole, role) ->
                            case DebugRpc of
                                false -> ignore;
                                true ->
                                    case os:type() of
                                        {win32, _} ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])
                                                                          ++
                                                                          " " ++
                                                                              erlang:apply(Mreply,
                                                                                           Freply,
                                                                                           [Areply,
                                                                                            Reply])])]);
                                        _ ->
                                            io:format("~ts",
                                                      [io_lib:format("[RPC][~w][~ts] ~ts~n",
                                                                     [Code,
                                                                      Name,
                                                                      erlang:apply(Mreq,
                                                                                   Freq,
                                                                                   [Areq,
                                                                                    Data])
                                                                          ++
                                                                          " " ++
                                                                              erlang:apply(Mreply,
                                                                                           Freply,
                                                                                           [Areply,
                                                                                            Reply])])])
                                    end
                            end,
                            case Autolog of
                                false -> ignore;
                                true -> ignore
                            end,
                            sys_conn:pack_send(ConnPid, Code, Reply),
                            NRole = role_monitor:check(Mod,
                                                       Code,
                                                       Data,
                                                       Role,
                                                       NewRole),
                            role_query:sync_cache(NRole),
                            NRole#role{need_sync = true};
                        {error, unknow_command} ->
                            logger:error("[~ts]的角色进程处理命令[~w][~w]时出错:unknow_command",
                                         [Name, Code, Data],
                                         role,
                                         968),
                            Role;
                        Err ->
                            logger:error("[~ts]的角色进程处理命令[~w][~w]时出错:~w",
                                         [Name, Code, Data, Err],
                                         role,
                                         971),
                            role:send_buff_clean(),
                            Role
                    end;
                _Err ->
                    logger:debug("解包数据出错:~w", [_Err], role, 976),
                    Role
            end
    end.

read_next(srv, _ConnPid, Role) -> {noreply, Role};
read_next(_From, ConnPid, Role) ->
    ConnPid ! read_next,
    {noreply, Role}.

handle_apply_async_return({ok, NewRole}, Mfa, Role)
    when is_record(NewRole, role) ->
    NRole = role_monitor:check(async,
                               0,
                               Mfa,
                               Role,
                               NewRole),
    {noreply, NRole};
handle_apply_async_return(ok, _Mfa, Role) ->
    {noreply, Role};
handle_apply_async_return(Else, {M, F, A}, Role) ->
    logger:error("角色[~ts]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [Role#role.name, M, F, A, Else],
                 role,
                 996),
    {noreply, Role}.

handle_apply_sync_return({ok, Reply, NewRole}, Mfa,
                         Role)
    when is_record(NewRole, role) ->
    NRole = role_monitor:check(sync, 0, Mfa, Role, NewRole),
    {reply, Reply, NRole};
handle_apply_sync_return({ok, Reply}, _Mfa, Role) ->
    {reply, Reply, Role};
handle_apply_sync_return(Else, {M, F, A}, Role) ->
    logger:error("角色[~ts]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
                 [Role#role.name, M, F, A, Else],
                 role,
                 1006),
    {reply, Else, Role}.

get_new_role_name(RoleName) ->
    RoleName1 =
        util:word_sensitive_kernel_change_2(RoleName, 1, ""),
    do_get_new_role_name(RoleName1, 1).

do_get_new_role_name(RoleName, Index)
    when Index >= 999 ->
    RoleName;
do_get_new_role_name(RoleName, Index) ->
    NewRoleName = RoleName ++ util:to_string(Index),
    case role_misc:is_name_used(NewRoleName) of
        true -> do_get_new_role_name(RoleName, Index + 1);
        _ -> NewRoleName
    end.

