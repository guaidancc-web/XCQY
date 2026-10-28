-file("src/mod/family/family_mgr.erl", 1).

-module(family_mgr).

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

-file("src/mod/family/family_mgr.erl", 20).

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

-file("src/mod/family/family_mgr.erl", 21).

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

-file("src/mod/family/family_mgr.erl", 22).

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

-file("src/mod/family/family_mgr.erl", 23).

-export([start_link/0,
         info/2,
         print/1,
         visit_family/1,
         send_msg/1,
         family_divorce/2,
         query_role_family_id/1,
         query_family_id/1,
         update_role/2,
         where/1,
         get_env_val/1,
         check_family/1]).

-record(state, {next_id = 1}).

start_link() ->
    gen_server:start_link({local, family_mgr},
                          family_mgr,
                          [],
                          []).

info(by_id, FamilyId) ->
    case catch ets:lookup(family_list, FamilyId) of
        [FamilyInfo = #family_info{}] -> FamilyInfo;
        _ -> false
    end;
info(by_master, RoleId) ->
    case catch ets:lookup(role_family_map, RoleId) of
        [{RoleId, FamilyId}] -> info(by_id, FamilyId);
        _ -> false
    end.

send_msg(Msg) -> family_mgr ! Msg.

family_divorce(RoleId, FamilyId) ->
    case info(by_id, FamilyId) of
        #family_info{master_id = RoleId, lover_id = LoverId}
            when LoverId =/= {0, "", 0} ->
            case catch gen_server:call(family_mgr,
                                       {move_out_family, FamilyId, LoverId},
                                       10000)
                of
                {'EXIT', {timeout, _}} -> {error, timeout};
                {'EXIT', {noproc, _}} -> {error, noproc};
                {'EXIT', {normal, _}} -> {error, exit};
                {'EXIT', _Call_Err} -> {error, _Call_Err};
                _Call_Return -> _Call_Return
            end;
        #family_info{lover_id = RoleId} ->
            case catch gen_server:call(family_mgr,
                                       {move_out_family, FamilyId, RoleId},
                                       10000)
                of
                {'EXIT', {timeout, _}} -> {error, timeout};
                {'EXIT', {noproc, _}} -> {error, noproc};
                {'EXIT', {normal, _}} -> {error, exit};
                {'EXIT', _Call_Err} -> {error, _Call_Err};
                _Call_Return -> _Call_Return
            end;
        #family_info{} -> no_need;
        _Err ->
            logger:error("玩家[~w]需要进行处理的离婚程序的家园[~w]不存在:~w, 调用:~w",
                         [RoleId, FamilyId, _Err, util:get_stacktrace()],
                         family_mgr,
                         76),
            false
    end.

query_role_family_id(RoleId) ->
    case catch ets:lookup(role_family_map, RoleId) of
        [{RoleId, FamilyId}] -> FamilyId;
        _ -> false
    end.

where(RoleId) ->
    case catch gen_server:call(family_mgr,
                               {where, RoleId},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

update_role(#role{id = RoleId, name = RoleName,
                  sex = Sex, classes = Classes,
                  m_family = #m_family{cur_id = FamilyId}},
            NewLev)
    when FamilyId =/= {0, "", 0} ->
    case info(by_id, FamilyId) of
        #family_info{master_id = RoleId, pid = FamilyPid} ->
            case is_pid(FamilyPid) andalso
                     util:is_process_alive(FamilyPid)
                of
                true ->
                    logger:debug("更新主人信息:~w",
                                 [{RoleName, NewLev, Classes, Sex}],
                                 family_mgr,
                                 97),
                    FamilyPid !
                        {update_master, RoleName, NewLev, Classes, Sex};
                false -> skip
            end;
        _ -> ok
    end;
update_role(_Role, _) -> ok.

which_family(RoleId) ->
    case get(role_visit_family_list) of
        VisitInfo = [_ | _] ->
            case lists:keyfind(RoleId, 1, VisitInfo) of
                {_, FamilyId} -> FamilyId;
                _ -> false
            end;
        _ -> false
    end.

query_family_id(RoleId) ->
    case catch gen_server:call(family_mgr,
                               {query_family_id, RoleId},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

visit_family(RoleId) ->
    case catch gen_server:call(family_mgr,
                               {visit_family, RoleId},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

update_role_family_map(RoleId, {0, "", 0}) ->
    ets:delete(role_family_map, RoleId),
    dets:delete(role_family_map, RoleId);
update_role_family_map(RoleId, FamilyId) ->
    ets:insert(role_family_map, {RoleId, FamilyId}),
    dets:insert(role_family_map, {RoleId, FamilyId}).

print(RoleId) -> family_mgr ! {print, RoleId}.

get_env_val(#role{id = RoleId}) -> get_env_val(RoleId);
get_env_val(RoleId) ->
    case info(by_master, RoleId) of
        #family_info{house_info =
                         #house_info{env_val = EnvVal}} ->
            EnvVal;
        _ -> 0
    end.

sync_visit_info(RoleId, FamilyId) ->
    VisitInfo = get(role_visit_family_list),
    NewVisitInfo = lists:keystore(RoleId,
                                  1,
                                  VisitInfo,
                                  {RoleId, FamilyId}),
    put(role_visit_family_list, NewVisitInfo).

save_tmp_furlist(RoleId, MyFurnishings) ->
    case [{BaseId, Num}
          || #furnishing{base_id = BaseId, num = Num}
                 <- MyFurnishings]
        of
        [] -> ok;
        FurList ->
            ets:insert(furnishing_tmp_storage, {RoleId, FurList}),
            dets:insert(furnishing_tmp_storage, {RoleId, FurList}),
            ok
    end.

take_out_tmp_furlist(RoleId) ->
    case catch ets:lookup(furnishing_tmp_storage, RoleId) of
        [{RoleId, L}] when is_list(L) -> L;
        _ -> []
    end.

delete_tmp_furlist(RoleId) ->
    ets:delete(furnishing_tmp_storage, RoleId),
    dets:delete(furnishing_tmp_storage, RoleId).

check_family(FamilyId) ->
    case catch ets:lookup(family_list, FamilyId) of
        [FamilyInfo = #family_info{pid = FamilyPid}] ->
            case is_pid(FamilyPid) andalso
                     util:is_process_alive(FamilyPid)
                of
                true ->
                    logger:debug("家园已经开启", [], family_mgr, 183),
                    {ok, FamilyPid};
                false ->
                    case family:start_link(FamilyInfo) of
                        {ok, Pid} -> {ok, Pid};
                        _Err -> false
                    end
            end;
        _ -> false
    end.

invite_beans_reward([], _RoleId, _RoleName) -> ok;
invite_beans_reward([FriendId | Rest], RoleId,
                    RoleName) ->
    case query_role_family_id(FriendId) of
        false -> invite_beans_reward(Rest, RoleId, RoleName);
        FamilyId ->
            case check_family(FamilyId) of
                {ok, Pid} ->
                    Pid ! {invite_beans_reward, RoleId, RoleName, FriendId},
                    ok;
                _Err -> invite_beans_reward(Rest, RoleId, RoleName)
            end
    end.

init([]) ->
    logger:info("[~w] 正在启动...",
                [family_mgr],
                family_mgr,
                216),
    process_flag(trap_exit, true),
    dets:open_file(family_list,
                   [{file, "./dets/family.dets"},
                    {keypos, #family_info.id},
                    {type, set}]),
    ets:new(family_list,
            [set, named_table, public, {keypos, #family_info.id}]),
    dets:to_ets(family_list, family_list),
    dets:open_file(furnishing_tmp_storage,
                   [{file, "./dets/furnishing_tmp_storage.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(furnishing_tmp_storage,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(furnishing_tmp_storage,
                furnishing_tmp_storage),
    dets:open_file(role_family_map,
                   [{file, "./dets/role_family_map.dets"},
                    {keypos, 1},
                    {type, set}]),
    ets:new(role_family_map,
            [set, named_table, public, {keypos, 1}]),
    dets:to_ets(role_family_map, role_family_map),
    ets:new(family_child,
            [set, named_table, public, {keypos, #family_child.id}]),
    ConvertFun = fun (FamilyInfo, LoadInfo) ->
                         case family_ver:convert(FamilyInfo) of
                             {false, Reason} ->
                                 logger:error("家园数据转换失败:~w",
                                              [Reason],
                                              family_mgr,
                                              238),
                                 [Reason | LoadInfo];
                             {ok, NewF} ->
                                 family:sync_dets(NewF),
                                 LoadInfo
                         end
                 end,
    Flag = dets:foldr(ConvertFun, [], family_list),
    case Flag of
        [] ->
            put(role_visit_family_list, []),
            erlang:send_after(1800 * 1000,
                              self(),
                              dynamic_set_free),
            MaxIdFun = fun (#family_info{id = {Id, _, _}}, MaxId) ->
                               case Id > MaxId of
                                   true -> Id;
                                   false -> MaxId
                               end
                       end,
            MaxFamilyId = ets:foldr(MaxIdFun, 0, family_list),
            {ok, #state{next_id = MaxFamilyId + 1}};
        _Err -> {stop, data_load_err}
    end.

handle_call({create,
             {Rid, PlatFrom, ZoneId},
             RoleName,
             Classes,
             Lev,
             Sex,
             SpaceUseInfo},
            _From, State = #state{next_id = NextId}) ->
    case query_role_family_id({Rid, PlatFrom, ZoneId}) of
        false ->
            FamilyId = {NextId, PlatFrom, ZoneId},
            Furnishings = [#furnishing{id = 1, base_id = 12,
                                       status = 2, pos = {1, 1, 1, 1},
                                       dir = 1}],
            LastCleanTime = date:unixtime() +
                                date:next_diff(23, 50, 4)
                                - 86400,
            HouseInfo = #house_info{bdg_info = SpaceUseInfo,
                                    furnishings = Furnishings, floor_lev = 1,
                                    next_fur_id = 2, cleanness = 100,
                                    last_clean_time = LastCleanTime},
            FamilyInfo = #family_info{id = FamilyId,
                                      house_info = HouseInfo,
                                      master_id = {Rid, PlatFrom, ZoneId},
                                      master_name = RoleName,
                                      master_classes = Classes,
                                      master_sex = Sex, master_lev = Lev},
            case family:start_link(FamilyInfo, create) of
                {ok, Pid} ->
                    case catch dets:insert(family_list, FamilyInfo) of
                        ok ->
                            RoleId = {Rid, PlatFrom, ZoneId},
                            case take_out_tmp_furlist(RoleId) of
                                [] -> skip;
                                FurIdList ->
                                    case case catch gen_server:call(Pid,
                                                                    {move_to_family,
                                                                     FurIdList,
                                                                     RoleId,
                                                                     RoleName},
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
                                        true -> skip;
                                        _Err ->
                                            logger:error("玩家创建家园时[~w]携带家具[~w]入住家园[~w]失败:~w",
                                                         [RoleId,
                                                          FurIdList,
                                                          FamilyId,
                                                          _Err],
                                                         family_mgr,
                                                         293),
                                            skip
                                    end
                            end,
                            update_role_family_map(RoleId, FamilyId),
                            {reply,
                             {true, FamilyId, Pid},
                             State#state{next_id = NextId + 1}};
                        {error, _Err} ->
                            logger:error("写入家园数据失败:~w",
                                         [_Err],
                                         family_mgr,
                                         301),
                            {reply, {false, lang:get("创建家园失败")}, State}
                    end;
                _Err ->
                    logger:error("创建家园失败:~w", [_Err], family_mgr, 305),
                    {reply, {false, lang:get("创建家园失败")}, State}
            end;
        _FamilyId ->
            {reply, {false, lang:get("您的伴侣已经帮您创建了家园")}, State}
    end;
handle_call({check_family, FamilyId}, _From, State) ->
    case check_family(FamilyId) of
        {ok, Pid} -> {reply, {true, FamilyId, Pid}, State};
        false -> {reply, {false, lang:get("创建家园失败")}, State}
    end;
handle_call({visit_family, RoleId}, _From, State) ->
    logger:debug("查看玩家访问信息:~w", [RoleId], family_mgr, 321),
    VisitInfo = get(role_visit_family_list),
    case lists:keyfind(RoleId, 1, VisitInfo) of
        {_, FamilyId} ->
            case ets:lookup(family_list, FamilyId) of
                [FamilyInfo = #family_info{}] ->
                    {reply, FamilyInfo, State};
                _ -> {reply, false, State}
            end;
        _ -> {reply, false, State}
    end;
handle_call({set_out_furnishing,
             FamilyId,
             Fid,
             ToPos,
             Dir},
            _From, State) ->
    case check_family(FamilyId) of
        {ok, FamilyPid} ->
            Reply = case catch gen_server:call(FamilyPid,
                                               {set_out_furnishing,
                                                FamilyId,
                                                Fid,
                                                ToPos,
                                                Dir},
                                               10000)
                        of
                        {'EXIT', {timeout, _}} -> {error, timeout};
                        {'EXIT', {noproc, _}} -> {error, noproc};
                        {'EXIT', {normal, _}} -> {error, exit};
                        {'EXIT', _Call_Err} -> {error, _Call_Err};
                        _Call_Return -> _Call_Return
                    end,
            {reply, Reply, State};
        false -> {reply, {false, lang:get("家园启动失败")}, State}
    end;
handle_call({sell_furnishing,
             FamilyId,
             ID,
             RoleID,
             SellNum},
            _From, State) ->
    case check_family(FamilyId) of
        {ok, FamilyPid} ->
            Reply = case catch gen_server:call(FamilyPid,
                                               {sell_furnishing,
                                                FamilyId,
                                                ID,
                                                RoleID,
                                                SellNum},
                                               10000)
                        of
                        {'EXIT', {timeout, _}} -> {error, timeout};
                        {'EXIT', {noproc, _}} -> {error, noproc};
                        {'EXIT', {normal, _}} -> {error, exit};
                        {'EXIT', _Call_Err} -> {error, _Call_Err};
                        _Call_Return -> _Call_Return
                    end,
            {reply, Reply, State};
        false -> {reply, {false, lang:get("家园启动失败")}, State}
    end;
handle_call({move_out_family, FamilyId, RoleId}, _From,
            State) ->
    logger:debug("角色[~w]搬离家园[~w]",
                 [RoleId, FamilyId],
                 family_mgr,
                 355),
    case info(by_id, FamilyId) of
        #family_info{master_id = MasterId, lover_id = LoverId,
                     house_info = #house_info{furnishings = Furnishings}}
            when RoleId =:= MasterId orelse RoleId =:= LoverId ->
            case check_family(FamilyId) of
                {ok, Pid} ->
                    case case catch gen_server:call(Pid,
                                                    {move_out_family, RoleId},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        true ->
                            Fun = fun (#furnishing{belong = Belong}) ->
                                          Belong =:= RoleId;
                                      (_) -> false
                                  end,
                            MyFurnishings = lists:filter(Fun, Furnishings),
                            save_tmp_furlist(RoleId, MyFurnishings),
                            update_role_family_map(RoleId, {0, "", 0}),
                            {reply, true, State};
                        _Err ->
                            logger:error("玩家[~w]搬离家园[~w]失败:~w",
                                         [RoleId, FamilyId, _Err],
                                         family_mgr,
                                         373),
                            {reply, false, State}
                    end;
                false ->
                    logger:error("玩家[~w]搬离家园[~w]失败: 家园进程启动失败",
                                 [RoleId, FamilyId],
                                 family_mgr,
                                 377),
                    {reply, false, State}
            end;
        _ -> {reply, false, State}
    end;
handle_call({move_to_family,
             FamilyId,
             RoleId,
             RoleName},
            _From, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            FurIdList = take_out_tmp_furlist(RoleId),
            logger:debug("玩家[~w]带着家具列表[~w]搬入家园[~w]",
                         [RoleId, FurIdList, FamilyId],
                         family_mgr,
                         388),
            case case catch gen_server:call(Pid,
                                            {move_to_family,
                                             FurIdList,
                                             RoleId,
                                             RoleName},
                                            10000)
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                true ->
                    update_role_family_map(RoleId, FamilyId),
                    delete_tmp_furlist(RoleId),
                    {reply, true, State};
                _Err ->
                    logger:error("玩家[~w]携带家具[~w]入住家园[~w]失败:~w",
                                 [RoleId, FurIdList, FamilyId, _Err],
                                 family_mgr,
                                 395),
                    {reply, false, State}
            end;
        _Err ->
            logger:error("迁入家园出错:~w, 原因:~w",
                         [FamilyId, _Err],
                         family_mgr,
                         399),
            {reply, false, State}
    end;
handle_call({where, RoleId}, _From, State) ->
    Result = which_family(RoleId),
    {reply, Result, State};
handle_call({query_family_id, RoleId}, _From, State) ->
    Reply = case catch ets:lookup(role_family_map, RoleId)
                of
                [{RoleId, FamilyId}] -> FamilyId;
                _ -> false
            end,
    {reply, Reply, State};
handle_call({get_magic_beans_reward, FamilyId}, _From,
            State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Result = case catch gen_server:call(Pid,
                                                get_magic_beans_reward,
                                                10000)
                         of
                         {'EXIT', {timeout, _}} -> {error, timeout};
                         {'EXIT', {noproc, _}} -> {error, noproc};
                         {'EXIT', {normal, _}} -> {error, exit};
                         {'EXIT', _Call_Err} -> {error, _Call_Err};
                         _Call_Return -> _Call_Return
                     end,
            {reply, Result, State};
        _Err ->
            logger:error("迁入家园出错:~w, 原因:~w",
                         [FamilyId, _Err],
                         family_mgr,
                         420),
            {reply, false, State}
    end;
handle_call({set_invite_list,
             FamilyId,
             ValidFriendList},
            _From, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Reply = case case catch gen_server:call(Pid,
                                                    {set_invite_list,
                                                     ValidFriendList},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        {true, Msg} -> {true, Msg};
                        {false, Reason} -> {false, Reason}
                    end,
            {reply, Reply, State};
        _Err ->
            logger:error("迁入家园出错:~w, 原因:~w",
                         [FamilyId, _Err],
                         family_mgr,
                         434),
            {reply, false, State}
    end;
handle_call({get_beans_invite_reward, FamilyId, RwId},
            _From, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Reply = case case catch gen_server:call(Pid,
                                                    {get_beans_invite_reward,
                                                     RwId},
                                                    10000)
                             of
                             {'EXIT', {timeout, _}} -> {error, timeout};
                             {'EXIT', {noproc, _}} -> {error, noproc};
                             {'EXIT', {normal, _}} -> {error, exit};
                             {'EXIT', _Call_Err} -> {error, _Call_Err};
                             _Call_Return -> _Call_Return
                         end
                        of
                        true -> true;
                        false -> false
                    end,
            {reply, Reply, State};
        _Err -> {reply, false, State}
    end;
handle_call({up_lev_house, FamilyId}, _From, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Reply = case catch gen_server:call(Pid,
                                               up_lev_house,
                                               10000)
                        of
                        {'EXIT', {timeout, _}} -> {error, timeout};
                        {'EXIT', {noproc, _}} -> {error, noproc};
                        {'EXIT', {normal, _}} -> {error, exit};
                        {'EXIT', _Call_Err} -> {error, _Call_Err};
                        _Call_Return -> _Call_Return
                    end,
            {reply, Reply, State};
        _Err -> {reply, false, State}
    end;
handle_call(_Request, _From, State) ->
    logger:error("未处理的请求:~w", [_Request], family_mgr, 462),
    {noreply, State}.

handle_cast(_Msg, State) ->
    logger:error("未处理的广播:~w", [_Msg], family_mgr, 471),
    {noreply, State}.

handle_info({enter, RoleId, RolePid, FamilyId},
            State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [#family_info{pid = FamilyPid}]
            when is_pid(FamilyPid) ->
            FamilyPid ! {enter, RoleId, RolePid},
            sync_visit_info(RoleId, FamilyId),
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_info({leave, RoleId}, State) ->
    logger:debug("玩家[~w]离开家园", [RoleId], family_mgr, 487),
    VisitInfo = get(role_visit_family_list),
    case lists:keyfind(RoleId, 1, VisitInfo) of
        {RoleId, FamilyId} ->
            NewVisitInfo = lists:keydelete(RoleId, 1, VisitInfo),
            put(role_visit_family_list, NewVisitInfo),
            case catch ets:lookup(family_list, FamilyId) of
                [#family_info{pid = FamilyPid}] ->
                    case is_pid(FamilyPid) andalso
                             util:is_process_alive(FamilyPid)
                        of
                        true ->
                            FamilyPid ! {leave, RoleId},
                            {noreply, State};
                        false -> {noreply, State}
                    end;
                _ -> {noreply, State}
            end;
        false -> {noreply, State}
    end;
handle_info({get_back_furnishing,
             FamilyId,
             FurnishingId},
            State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [#family_info{pid = FamilyPid}] ->
            case is_pid(FamilyPid) andalso
                     util:is_process_alive(FamilyPid)
                of
                true ->
                    FamilyPid ! {get_back_furnishing, FurnishingId},
                    {noreply, State};
                false -> {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_info({family_divorce_none, RoleId}, State) ->
    update_role_family_map(RoleId, {0, "", 0}),
    {noreply, State};
handle_info({add_frunishing,
             FamilyId,
             Num,
             FurnishingId,
             RoleId},
            State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [FamilyInfo = #family_info{pid = FamilyPid}] ->
            case is_pid(FamilyPid) andalso
                     util:is_process_alive(FamilyPid)
                of
                true ->
                    logger:debug("家园[~w]添加家具[~w]",
                                 [FamilyId, FurnishingId],
                                 family_mgr,
                                 549),
                    FamilyPid ! {add_frunishing, FurnishingId, Num, RoleId},
                    {noreply, State};
                false ->
                    logger:debug("添加家具[~w]时，家园[~w]未自激活",
                                 [FurnishingId, FamilyId],
                                 family_mgr,
                                 553),
                    case family:start_link(FamilyInfo) of
                        {ok, Pid} ->
                            Pid ! {add_frunishing, FurnishingId, Num, RoleId},
                            {noreply, State};
                        _Err ->
                            logger:error("添加家具时创建家园失败:~w",
                                         [_Err],
                                         family_mgr,
                                         559),
                            {noreply, State}
                    end
            end;
        _ -> {noreply, State}
    end;
handle_info({edit_furnishing, FamilyId, FurnishingId},
            State) ->
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            FamilyPid ! {edit_furnishing, FurnishingId},
            {noreply, State};
        _Err ->
            logger:error("编辑家园[~w]的家具[~w]错误:~w",
                         [FamilyId, FurnishingId, _Err],
                         family_mgr,
                         573),
            {noreply, State}
    end;
handle_info({upgrade_bdg,
             FamilyId,
             BdgType,
             GiveFlag,
             RoleId},
            State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [#family_info{pid = FamilyPid}]
            when is_pid(FamilyPid) ->
            case check_family(FamilyId) of
                {ok, Pid} ->
                    Pid ! {upgrade_bdg, BdgType, GiveFlag, RoleId},
                    {noreply, State};
                false ->
                    logger:error("升级建筑失败", [], family_mgr, 587),
                    {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_info({destory_building, FamilyId, BdgType},
            State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [#family_info{pid = FamilyPid}]
            when is_pid(FamilyPid) ->
            case check_family(FamilyId) of
                {ok, Pid} ->
                    Pid ! {destory_building, BdgType},
                    {noreply, State};
                false ->
                    logger:error("拆除建筑失败", [], family_mgr, 601),
                    {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_info({set_family_lock, FamilyId, LockLev},
            State) ->
    logger:debug("对家园[~w]设置访问权限[~w]",
                 [FamilyId, LockLev],
                 family_mgr,
                 609),
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            FamilyPid ! {set_family_lock, LockLev},
            {noreply, State};
        _ -> {noreply, State}
    end;
handle_info({house_keeper_clean,
             FamilyId,
             AddCleanness},
            State) ->
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            logger:debug("对家园[~w]进行了打扫",
                         [FamilyId],
                         family_mgr,
                         620),
            FamilyPid ! {house_keeper_clean, AddCleanness},
            {noreply, State};
        _Err ->
            logger:debug("查询家园出错:~w", [_Err], family_mgr, 624),
            {noreply, State}
    end;
handle_info({set_cleanness, FamilyId, Cleanness},
            State) ->
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            logger:debug("增加~w家园清洁度：~w",
                         [FamilyId, Cleanness],
                         family_mgr,
                         631),
            FamilyPid ! {set_cleanness, Cleanness},
            {noreply, State};
        _Err ->
            logger:debug("查询家园出错:~w", [_Err], family_mgr, 635),
            {noreply, State}
    end;
handle_info({foster_magic_bean,
             FamilyId,
             RoleId,
             RoleName},
            State) ->
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            logger:debug("培育~w家园许愿树", [FamilyId], family_mgr, 642),
            FamilyPid ! {foster_magic_bean, RoleId, RoleName},
            {noreply, State};
        _Err ->
            logger:debug("查询家园出错:~w", [_Err], family_mgr, 646),
            {noreply, State}
    end;
handle_info({house_keeper_foster, FamilyId, RoleId},
            State) ->
    case info(by_id, FamilyId) of
        #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
            logger:debug("管家培育~w家园许愿树",
                         [FamilyId],
                         family_mgr,
                         654),
            FamilyPid ! {house_keeper_foster, RoleId},
            {noreply, State};
        _Err ->
            logger:debug("查询家园出错:~w", [_Err], family_mgr, 658),
            {noreply, State}
    end;
handle_info({invite_beans_reward,
             RoleId,
             RoleName,
             ValidFriendList},
            State) ->
    invite_beans_reward(ValidFriendList, RoleId, RoleName),
    {noreply, State};
handle_info({day_reset, FamilyId}, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Pid ! day_reset,
            {noreply, State};
        false ->
            logger:error("家园0点更新失败", [], family_mgr, 675),
            {noreply, State}
    end;
handle_info({calc_cleanness, FamilyId}, State) ->
    case check_family(FamilyId) of
        {ok, FamilyPid} ->
            FamilyPid ! calc_cleanness,
            {noreply, State};
        false ->
            logger:error("家园清洁度结算", [], family_mgr, 685),
            {noreply, State}
    end;
handle_info({print, RoleId}, State) ->
    case role_query:attr(by_id, RoleId, [#role.m_family]) of
        {ok, [#m_family{cur_id = FamilyId}]} ->
            case info(by_id, FamilyId) of
                #family_info{pid = FamilyPid} when is_pid(FamilyPid) ->
                    FamilyPid ! print;
                _ -> skip
            end;
        _ -> skip
    end,
    {noreply, State};
handle_info({clean_furnishing, FamilyId}, State) ->
    case catch ets:lookup(family_list, FamilyId) of
        [#family_info{pid = FamilyPid}] ->
            case is_pid(FamilyPid) andalso
                     util:is_process_alive(FamilyPid)
                of
                true ->
                    logger:debug("家园[~w]清除所有家具",
                                 [FamilyId],
                                 family_mgr,
                                 707),
                    FamilyPid ! clean_furnishing,
                    {noreply, State};
                false -> {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_info(dynamic_set_free, State) ->
    logger:debug("检测家园活跃度", [], family_mgr, 717),
    Now = date:unixtime(),
    L = ets:match(family_list,
                  #family_info{last_visit_time = '$1', pid = '$2',
                               _ = '_'}),
    Fun = fun ([LastVTime, FamilyPid]) ->
                  case Now - LastVTime > 3600 of
                      true ->
                          case is_pid(FamilyPid) andalso
                                   util:is_process_alive(FamilyPid)
                              of
                              true -> FamilyPid ! system_get_back;
                              false -> skip
                          end;
                      false -> skip
                  end
          end,
    lists:foreach(Fun, L),
    erlang:send_after(1800 * 1000,
                      self(),
                      dynamic_set_free),
    {noreply, State};
handle_info({add_magic_beans_growth, FamilyId, Growth},
            State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Pid ! {add_magic_beans_growth, Growth},
            {noreply, State};
        _Err -> {noreply, State}
    end;
handle_info({clean_wake_time, FamilyId}, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Pid ! clean_wake_time,
            {noreply, State};
        _Err -> {noreply, State}
    end;
handle_info({house_lev_up, FamilyId}, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Pid ! clean_wake_time,
            {noreply, State};
        _Err -> {noreply, State}
    end;
handle_info({restart, FamilyId}, State) ->
    case check_family(FamilyId) of
        {ok, Pid} ->
            Pid ! stop,
            {noreply, State};
        _Err -> {noreply, State}
    end;
handle_info({'EXIT', _Pid, normal}, State) ->
    {noreply, State};
handle_info(visit_list, State) ->
    logger:debug("===============================",
                 [],
                 family_mgr,
                 774),
    logger:debug("玩家所在家园:~w",
                 [get(role_visit_family_list)],
                 family_mgr,
                 775),
    logger:debug("===============================",
                 [],
                 family_mgr,
                 776),
    {noreply, State};
handle_info(_Info, State) ->
    logger:debug("未处理消息 ~w", [_Info], family_mgr, 781),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

